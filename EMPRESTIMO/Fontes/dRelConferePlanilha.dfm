inherited dtmRelConferePlanilha: TdtmRelConferePlanilha
  Left = 270
  Top = 189
  Width = 310
  Height = 235
  Caption = 'dtmRelConferePlanilha'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 88
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
    Top = 72
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
  object pplConferePlanilha: TppBDEPipeline
    DataSource = dtsConferePlanilha
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lConferePlanilha'
    Left = 232
    Top = 112
  end
  object dtsConferePlanilha: TwwDataSource
    DataSet = qryConferePlanilha
    Left = 232
    Top = 88
  end
  object qryConferePlanilha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLN.PLNCODIGO, PLN.PLNPLANIL, PLN.PLNDATDIA,'
      '   NVL(EMP.VLR_EP, 0) AS VLR_EP,'
      
        '   NVL(LAC.CONTABDEB, 0) AS CONTABDEB, NVL(LAC.CONTABCRED, 0) AS' +
        ' CONTABCRED,'
      '   (NVL(LAC.CONTABDEB, 0) - NVL(EMP.VLR_EP, 0)) AS DIFERENCA'
      'FROM'
      '   PLANILHA PLN,'
      ''
      '   ('
      '   SELECT '
      '      PLN.PLNCODIGO,'
      '      SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))) AS VLR_EP'
      '   FROM'
      '      HISTMOVEMPTMO    HME,'
      '      PLANILHA         PLN'
      '   WHERE'
      
        '          PLN.PLNDATDIA        = TO_DATE('#39'20/01/2005'#39','#39'DD/MM/YYY' +
        'Y'#39')'
      '      AND PLN.IDMODULO         = 15'
      '      AND HME.HMECENTRALIZA    = 0'
      '      AND PLN.PLNCODIGO        = HME.PLNCODIGO'
      '   GROUP BY'
      '      PLN.PLNCODIGO'
      ''
      '   UNION'
      ''
      '   SELECT '
      '      PLN.PLNCODIGO,'
      '      SUM(ABS(NVL(HME.HMEVLRPREVISTO, 0))) AS VLR_EP'
      '   FROM'
      '      HISTMOVEMPTMO    HME,'
      '      PLANILHA         PLN'
      '   WHERE'
      
        '          PLN.PLNDATDIA        = TO_DATE('#39'20/01/2005'#39','#39'DD/MM/YYY' +
        'Y'#39')'
      '      AND PLN.IDMODULO         = 15'
      '      AND HME.HMECENTRALIZA    = 0'
      '      AND PLN.PLNCODIGO        = HME.PLNCODIGOESTORNO'
      ''
      '   GROUP BY'
      '      PLN.PLNCODIGO, HME.PLNCODIGOESTORNO'
      '   ) EMP,'
      ''
      '   ('
      '   SELECT '
      '      PLN.PLNCODIGO,'
      
        '      SUM(DECODE(LAC.LACDEBCRE, '#39'D'#39', LAC.LACVALOR, 0)) AS CONTAB' +
        'DEB,'
      
        '      SUM(DECODE(LAC.LACDEBCRE, '#39'C'#39', LAC.LACVALOR, 0)) AS CONTAB' +
        'CRED'
      '   FROM'
      '      LANCAMENTO       LAC,'
      '      PLANILHA         PLN'
      '   WHERE'
      
        '          PLN.PLNDATDIA        = TO_DATE('#39'20/01/2005'#39','#39'DD/MM/YYY' +
        'Y'#39')'
      '      AND PLN.IDMODULO         = 15'
      '      AND PLN.PLNCODIGO        = LAC.PLNCODIGO(+)'
      '   GROUP BY'
      '      PLN.PLNCODIGO'
      '   ) LAC'
      ''
      ''
      'WHERE'
      '       PLN.IDMODULO   = 15'
      ''
      '   AND 1 = 2'
      ''
      '   AND PLN.PLNDATDIA  = TO_DATE('#39'20/01/2005'#39','#39'DD/MM/YYYY'#39')'
      '   AND PLN.PLNCODIGO  = LAC.PLNCODIGO(+)'
      '   AND PLN.PLNCODIGO  = EMP.PLNCODIGO(+)'
      '   AND ('
      
        '          (   NVL(LAC.CONTABDEB, 0) <> NVL(LAC.CONTABCRED, 0)   ' +
        ') OR'
      '          (   NVL(LAC.CONTABDEB, 0) <> NVL(EMP.VLR_EP, 0)   )'
      '       )'
      ''
      'ORDER BY'
      '   PLN.PLNDATDIA, PLN.PLNCODIGO')
    ValidateWithMask = True
    Left = 232
    Top = 56
    object qryConferePlanilhaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryConferePlanilhaPLNPLANIL: TFloatField
      FieldName = 'PLNPLANIL'
    end
    object qryConferePlanilhaPLNDATDIA: TDateTimeField
      FieldName = 'PLNDATDIA'
    end
    object qryConferePlanilhaVLR_EP: TFloatField
      FieldName = 'VLR_EP'
    end
    object qryConferePlanilhaCONTABDEB: TFloatField
      FieldName = 'CONTABDEB'
    end
    object qryConferePlanilhaCONTABCRED: TFloatField
      FieldName = 'CONTABCRED'
    end
    object qryConferePlanilhaDIFERENCA: TFloatField
      FieldName = 'DIFERENCA'
    end
  end
  object rptConferePlanilha: TppReport
    AutoStop = False
    DataPipeline = pplConferePlanilha
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Análise Contábil'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
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
    Left = 128
    Top = 8
    Version = '7.04'
    mmColumnWidth = 183542
    DataPipelineName = 'pplConferePlanilha'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38100
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Conferência de Planilhas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 3440
        mmTop = 8731
        mmWidth = 176477
        BandType = 0
      end
      object ppLabel2: TppLabel
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
        mmLeft = 3440
        mmTop = 794
        mmWidth = 176477
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        AutoSize = False
        Caption = 'Período:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 30163
        mmWidth = 15346
        BandType = 0
      end
      object dtmRelConferePlanilha_lblDataIni: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 16140
        mmTop = 30163
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = '  a  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 31485
        mmTop = 30163
        mmWidth = 4763
        BandType = 0
      end
      object dtmRelConferePlanilha_lblDataFim: TppLabel
        UserName = 'dtmRelConferePlanilha_lblDataFim'
        AutoSize = False
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 36777
        mmTop = 30163
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label2'
        Caption = 
          ' ATENÇÃO! "Este relatório só pode ser usado para conferência de ' +
          'lançamentos em partida dobrada"'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 20373
        mmWidth = 144992
        BandType = 0
      end
      object dtmRelConferePlanilha_lblDiverg: TppLabel
        UserName = 'dtmRelConferePlanilha_lblDiverg'
        Caption = '(Exibindo apenas planilhas com divergência)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 125677
        mmTop = 30163
        mmWidth = 56621
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clNone
        Pen.Style = psClear
        mmHeight = 6085
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppLine3: TppLine
        OnPrint = ppLine3Print
        UserName = 'Line3'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 6085
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PLNDATDIA'
        DataPipeline = pplConferePlanilha
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConferePlanilha'
        mmHeight = 3704
        mmLeft = 37571
        mmTop = 1058
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CONTABDEB'
        DataPipeline = pplConferePlanilha
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConferePlanilha'
        mmHeight = 3704
        mmLeft = 97367
        mmTop = 1058
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CONTABCRED'
        DataPipeline = pplConferePlanilha
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConferePlanilha'
        mmHeight = 3704
        mmLeft = 124884
        mmTop = 1058
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DIFERENCA'
        DataPipeline = pplConferePlanilha
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConferePlanilha'
        mmHeight = 3704
        mmLeft = 156634
        mmTop = 1058
        mmWidth = 25665
        BandType = 4
      end
      object ppDbTextPlanilha: TppDBText
        UserName = 'ppDbTextPlanilha'
        DataField = 'PLNCODIGO'
        DataPipeline = pplConferePlanilha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConferePlanilha'
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 1058
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PLNPLANIL'
        DataPipeline = pplConferePlanilha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConferePlanilha'
        mmHeight = 3704
        mmLeft = 21167
        mmTop = 1058
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLR_EP'
        DataPipeline = pplConferePlanilha
        DisplayFormat = '#,#0.00;(#,#0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConferePlanilha'
        mmHeight = 3704
        mmLeft = 63500
        mmTop = 1058
        mmWidth = 25665
        BandType = 4
      end
      object rptSubContratos: TppSubReport
        UserName = 'rptSubContratos'
        DrillDownComponent = ppDbTextPlanilha
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplContratos'
        mmHeight = 1058
        mmLeft = 0
        mmTop = 5027
        mmWidth = 183542
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplContratos
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Empréstimo - Análise Contábil'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6615
          PrinterSetup.mmMarginLeft = 13229
          PrinterSetup.mmMarginRight = 13229
          PrinterSetup.mmMarginTop = 6615
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utScreenPixels
          Left = 144
          Top = 72
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplContratos'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 7673
            mmPrintPosition = 0
            object ppLabel10: TppLabel
              UserName = 'Label10'
              AutoSize = False
              Caption = 'Contratos '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 2381
              mmWidth = 182827
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'IDCONTRATOEMPTMO'
              DataPipeline = pplContratos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplContratos'
              mmHeight = 3440
              mmLeft = 794
              mmTop = 265
              mmWidth = 30163
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'MATRICULA'
              DataPipeline = pplContratos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'pplContratos'
              mmHeight = 3440
              mmLeft = 42333
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'NOME'
              DataPipeline = pplContratos
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'pplContratos'
              mmHeight = 3440
              mmLeft = 66146
              mmTop = 265
              mmWidth = 94456
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
          end
          object ppGroup1: TppGroup
            BreakName = 'PLANO'
            DataPipeline = pplContratos
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'pplContratos'
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 4498
              mmPrintPosition = 0
              object ppLabel12: TppLabel
                UserName = 'Label12'
                Caption = 'Plano:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 3440
                mmTop = 0
                mmWidth = 8731
                BandType = 3
                GroupNo = 0
              end
              object ppDBText5: TppDBText
                UserName = 'DBText5'
                DataField = 'PLANO'
                DataPipeline = pplContratos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'pplContratos'
                mmHeight = 3440
                mmLeft = 13229
                mmTop = 0
                mmWidth = 146315
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
          object ppGroup2: TppGroup
            BreakName = 'PATRO'
            DataPipeline = pplContratos
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'pplContratos'
            object ppGroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 8996
              mmPrintPosition = 0
              object ppLabel13: TppLabel
                UserName = 'Label13'
                Caption = 'Patrocinadora:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 10583
                mmTop = 265
                mmWidth = 20108
                BandType = 3
                GroupNo = 1
              end
              object ppDBText8: TppDBText
                UserName = 'DBText8'
                DataField = 'PATRO'
                DataPipeline = pplContratos
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'pplContratos'
                mmHeight = 3440
                mmLeft = 31750
                mmTop = 265
                mmWidth = 132821
                BandType = 3
                GroupNo = 1
              end
              object ppLabel19: TppLabel
                UserName = 'Label19'
                Caption = 'Contrato'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 19315
                mmTop = 4763
                mmWidth = 11642
                BandType = 3
                GroupNo = 1
              end
              object ppLabel20: TppLabel
                UserName = 'Label20'
                Caption = 'Matrícula'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 42333
                mmTop = 4763
                mmWidth = 12435
                BandType = 3
                GroupNo = 1
              end
              object ppLabel21: TppLabel
                UserName = 'Label201'
                Caption = 'Mutuário'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3440
                mmLeft = 65881
                mmTop = 4498
                mmWidth = 11906
                BandType = 3
                GroupNo = 1
              end
              object ppLine4: TppLine
                UserName = 'Line4'
                ShiftWithParent = True
                Weight = 0.75
                mmHeight = 265
                mmLeft = 0
                mmTop = 8731
                mmWidth = 183357
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
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 183542
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 2117
        mmWidth = 23813
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
        mmHeight = 3440
        mmLeft = 82550
        mmTop = 2117
        mmWidth = 18256
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
        mmHeight = 3440
        mmLeft = 156104
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DATA'
      DataPipeline = pplConferePlanilha
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConferePlanilha'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 12435
          mmLeft = 0
          mmTop = 0
          mmWidth = 183542
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Total Créditos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 124884
          mmTop = 7938
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label101'
          AutoSize = False
          Caption = 'Total Débitos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 97367
          mmTop = 7938
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 97367
          mmTop = 7144
          mmWidth = 53181
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label102'
          AutoSize = False
          Caption = 'Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 63500
          mmTop = 7938
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Contabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 112448
          mmTop = 3175
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 156634
          mmTop = 7938
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label3'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 8996
          mmTop = 7938
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Planilha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 18785
          mmTop = 3175
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Número'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 21167
          mmTop = 7938
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 42069
          mmTop = 7938
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 2117
          mmTop = 7144
          mmWidth = 50271
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 63500
          mmTop = 4498
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 12700
          mmLeft = 0
          mmTop = 0
          mmWidth = 183542
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLR_EP'
          DataPipeline = pplConferePlanilha
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConferePlanilha'
          mmHeight = 3704
          mmLeft = 63500
          mmTop = 1323
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'CONTABDEB'
          DataPipeline = pplConferePlanilha
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConferePlanilha'
          mmHeight = 3704
          mmLeft = 97367
          mmTop = 1323
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'CONTABCRED'
          DataPipeline = pplConferePlanilha
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConferePlanilha'
          mmHeight = 3704
          mmLeft = 124884
          mmTop = 1323
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'DIFERENCA'
          DataPipeline = pplConferePlanilha
          DisplayFormat = '#,#0.00;(#,#0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConferePlanilha'
          mmHeight = 3704
          mmLeft = 156634
          mmTop = 1323
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryContratos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dtsConferePlanilha
    SQL.Strings = (
      'SELECT '
      '    PLP.NOME AS PLANO,'
      '    PAT.NOME AS PATRO,'
      '    CON.IDCONTRATOEMPTMO,'
      '    PES.NOME,'
      '    DEP.MATRICULA'
      'FROM'
      '    CONTRATOEMPTMO CON,'
      '    PLANPREV PLP,'
      '    PESSOA PAT,'
      '    PESSOA PES,'
      '    DEPENTIT DEP,'
      ''
      '    (SELECT DISTINCT H.IDCONTRATOEMPTMO, P.PLNDATDIA'
      '     FROM   HISTMOVEMPTMO H,'
      '            PLANILHA P'
      
        '     WHERE  (H.PLNCODIGO = :PLNCODIGO OR H.PLNCODIGOESTORNO = :P' +
        'LNCODIGO)'
      '     AND    H.PLNCODIGO = P.PLNCODIGO'
      '     ) HME,'
      ''
      '     VWMIGRACONTRATOEP MIG'
      ''
      'WHERE'
      '    PLP.IDPLANOPREV      = MIG.IDPLANOCONTATU'
      'AND PAT.IDPESSOA         = MIG.IDPATROATU'
      'AND PES.IDPESSOA         = CON.IDBENEF'
      'AND DEP.IDTITULAR        = CON.IDPESSOA'
      'AND DEP.IDPESSOA         = CON.IDBENEF'
      'AND CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO'
      ''
      'AND MIG.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO'
      'AND MIG.DATAMIGRA        = (SELECT MAX(DATAMIGRA)'
      '                                    FROM VWMIGRACONTRATOEP'
      
        '                                   WHERE IDCONTRATOEMPTMO = HME.' +
        'IDCONTRATOEMPTMO'
      
        '                                     AND DATAMIGRA       <= HME.' +
        'PLNDATDIA)'
      ''
      'ORDER BY PLANO, PATRO, IDCONTRATOEMPTMO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PLNCODIGO'
        ParamType = ptInput
      end>
    object qryContratosPLANO: TStringField
      DisplayWidth = 50
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
    object qryContratosPATRO: TStringField
      DisplayWidth = 60
      FieldName = 'PATRO'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryContratosIDCONTRATOEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOEMPTMO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.IDCONTRATOEMPTMO'
    end
    object qryContratosNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryContratosMATRICULA: TStringField
      DisplayWidth = 15
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.DEPENTIT.MATRICULA'
      Size = 15
    end
  end
  object pplContratos: TppBDEPipeline
    DataSource = dsContratos
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplContratos'
    Left = 128
    Top = 104
    MasterDataPipelineName = 'pplConferePlanilha'
  end
  object dsContratos: TwwDataSource
    DataSet = qryContratos
    Left = 128
    Top = 152
  end
end
