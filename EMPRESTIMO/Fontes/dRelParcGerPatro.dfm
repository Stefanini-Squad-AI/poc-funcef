inherited dtmRelParcGerPatro: TdtmRelParcGerPatro
  Left = 455
  Top = 273
  Width = 180
  Height = 171
  Caption = 'dtmRelParcGerPatro'
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
  end
  object rptParcGerPatro: TppReport
    AutoStop = False
    DataPipeline = pplParcGerPatro
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Parcelas Geradas por Mês'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 112
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplParcGerPatro'
    object ppHeaderBand24: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 47890
      mmPrintPosition = 0
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
        mmTop = 43392
        mmWidth = 183621
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object LblTiTAdianto: TppLabel
        UserName = 'LblTiTAdianto'
        AutoSize = False
        Caption = 'Parcelas Geradas por Mês - por Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8731
        mmWidth = 183621
        BandType = 0
      end
      object ppLabel1: TppLabel
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
        mmTop = 1588
        mmWidth = 183621
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Mês de Competência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 794
        mmTop = 18521
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Item:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 794
        mmTop = 23283
        mmWidth = 7938
        BandType = 0
      end
      object lblMesCompetencia: TppLabel
        UserName = 'Label6'
        Caption = 'janeiro / 2000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 30427
        mmTop = 18521
        mmWidth = 17992
        BandType = 0
      end
      object lblItemEmptmo: TppLabel
        UserName = 'Label7'
        Caption = '< Todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 8467
        mmTop = 23283
        mmWidth = 13494
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
        mmTop = 35983
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
        mmLeft = 105834
        mmTop = 35983
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
        mmTop = 35983
        mmWidth = 68527
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
        mmLeft = 119063
        mmTop = 35983
        mmWidth = 64558
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
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
        mmTop = 30956
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
        mmLeft = 96573
        mmTop = 30956
        mmWidth = 21960
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
        mmTop = 30956
        mmWidth = 66146
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
        mmLeft = 119063
        mmTop = 30956
        mmWidth = 64558
        BandType = 0
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
        mmTop = 43392
        mmWidth = 183621
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppDetalhe: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clNone
        Pen.Style = psClear
        StretchWithParent = True
        mmHeight = 4233
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
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppDBNumContrato: TppDBText
        UserName = 'DBNumContrato'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplParcGerPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParcGerPatro'
        mmHeight = 2910
        mmLeft = 794
        mmTop = 794
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = pplParcGerPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplParcGerPatro'
        mmHeight = 2910
        mmLeft = 15875
        mmTop = 794
        mmWidth = 59531
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PARCELA'
        DataPipeline = pplParcGerPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerPatro'
        mmHeight = 2910
        mmLeft = 79375
        mmTop = 794
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplParcGerPatro
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerPatro'
        mmHeight = 2910
        mmLeft = 94721
        mmTop = 794
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'COBRANCA'
        DataPipeline = pplParcGerPatro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplParcGerPatro'
        mmHeight = 2910
        mmLeft = 117211
        mmTop = 794
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'TXJUROS'
        DataPipeline = pplParcGerPatro
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerPatro'
        mmHeight = 3175
        mmLeft = 145257
        mmTop = 794
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'SALDODEV'
        DataPipeline = pplParcGerPatro
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerPatro'
        mmHeight = 2910
        mmLeft = 163248
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
    end
    object ppFooterBand24: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine45: TppLine
        UserName = 'ppLine45'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
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
        mmHeight = 3175
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc43: TppSystemVariable
        UserName = 'Calc43'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 79904
        mmTop = 3175
        mmWidth = 23548
        BandType = 8
      end
      object ppCalc44: TppSystemVariable
        UserName = 'Calc44'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 157427
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentHeight = True
        ParentWidth = True
        Weight = 1.5
        mmHeight = 13229
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 6615
        mmLeft = 90223
        mmTop = 2117
        mmWidth = 93398
        BandType = 7
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        mmHeight = 6085
        mmLeft = 265
        mmTop = 2646
        mmWidth = 32015
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label2'
        Caption = 'Total Geral:  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 73290
        mmTop = 3440
        mmWidth = 16933
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplParcGerPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerPatro'
        mmHeight = 3440
        mmLeft = 91546
        mmTop = 3440
        mmWidth = 21696
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplParcGerPatro
        DisplayFormat = '#,0;-#,0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplParcGerPatro'
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 3704
        mmWidth = 12965
        BandType = 7
      end
      object ppLabel5: TppLabel
        UserName = 'Label3'
        Caption = 'Contratos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 15875
        mmTop = 3704
        mmWidth = 13229
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'SALDODEV'
        DataPipeline = pplParcGerPatro
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplParcGerPatro'
        mmHeight = 3440
        mmLeft = 160867
        mmTop = 3440
        mmWidth = 21696
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME_PATRO'
      DataPipeline = pplParcGerPatro
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplParcGerPatro'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentWidth = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 6879
          mmWidth = 183542
          BandType = 3
          GroupNo = 0
        end
        object ppLabel97: TppLabel
          UserName = 'ppLabel97'
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 794
          mmTop = 7673
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel98: TppLabel
          UserName = 'ppLabel98'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 15875
          mmTop = 7673
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppLabel102: TppLabel
          UserName = 'ppLabel102'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 78846
          mmTop = 7673
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel105: TppLabel
          UserName = 'ppLabel105'
          Caption = 'Valor Previsto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 94721
          mmTop = 7673
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppLabel107: TppLabel
          UserName = 'ppLabel107'
          Caption = 'Forma Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 117211
          mmTop = 7673
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object ppLabel109: TppLabel
          UserName = 'ppLabel109'
          Caption = 'Tx Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 145257
          mmTop = 7673
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label1'
          Caption = 'Saldo Devedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 163248
          mmTop = 7673
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'NOME_PATRO'
          DataPipeline = pplParcGerPatro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplParcGerPatro'
          mmHeight = 3387
          mmLeft = 2117
          mmTop = 1323
          mmWidth = 19854
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 14817
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line2'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 14817
          mmLeft = 0
          mmTop = 0
          mmWidth = 183542
          BandType = 5
          GroupNo = 0
        end
        object ppShape5: TppShape
          UserName = 'Shape5'
          mmHeight = 5821
          mmLeft = 90223
          mmTop = 1323
          mmWidth = 93398
          BandType = 5
          GroupNo = 0
        end
        object ppShape6: TppShape
          UserName = 'Shape6'
          mmHeight = 5821
          mmLeft = 265
          mmTop = 1588
          mmWidth = 32015
          BandType = 5
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label8'
          Caption = 'Total:  '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 80963
          mmTop = 2381
          mmWidth = 9260
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplParcGerPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplParcGerPatro'
          mmHeight = 3440
          mmLeft = 91546
          mmTop = 2381
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplParcGerPatro
          DisplayFormat = '#,0;-#,0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplParcGerPatro'
          mmHeight = 3175
          mmLeft = 1588
          mmTop = 2646
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label9'
          Caption = 'Contratos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 15875
          mmTop = 2646
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'SALDODEV'
          DataPipeline = pplParcGerPatro
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplParcGerPatro'
          mmHeight = 3440
          mmLeft = 160867
          mmTop = 2381
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryParcGerPatro: TwwQuery
    BeforeOpen = qryParcGerPatroBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PTR.NOME AS NOME_PATRO,'
      '  HME.IDCONTRATOEMPTMO, CON.NOME,'
      '  HME.ITEDESCRICAO AS ITEM,'
      '  (HME.PARCELA || '#39'/'#39' || HME.PARCELAS_RESTANTES) AS PARCELA,'
      '  HME.HMEVLRPREVISTO,'
      
        '  HME.FORMA_COBRANCA                                    AS COBRA' +
        'NCA,'
      '  (DECODE(HME.FLGENVIO, NULL, '#39'Sim'#39', '#39#39'))           AS ENVIADO,'
      '  (DECODE(HME.FLGBAIXADO, NULL, '#39'Sim'#39', '#39#39'))         AS RECEBIDO,'
      
        '  HME.HMETXJUROS                                        AS TXJUR' +
        'OS,'
      
        '  HME.HMESALDODEV                                       AS SALDO' +
        'DEV,'
      
        '  (DECODE(HME.HMECENTRALIZA, 0, '#39#39', HME.PLNCODIGO))   AS PLANILH' +
        'A,'
      '  HME.HMEANOCOMPETENCIA, HME.HMEMESCOMPETENCIA'
      ''
      'FROM'
      '  PESSOA       PTR,'
      '  VW_MOVEP     HME,'
      '  VWCONTRATOEP CON'
      ''
      'WHERE'
      '       CON.IDEMPRESAPROP        = 1'
      '   AND CON.FLGSITUACAO          <> '#39'C'#39
      '   AND HME.EVENTO               = 1'
      '   AND HME.HMESEQCOBRANCA       = 1'
      '   AND HME.HMEMESCOMPETENCIA    = 10'
      '   AND HME.HMEANOCOMPETENCIA    = 2002'
      '   AND (HME.FLGESTORNADO        = 0 OR HME.FLGESTORNADO IS NULL)'
      '   AND HME.HMECENTRALIZA        = 1'
      '   AND CON.IDPATRO              = PTR.IDPESSOA'
      
        '   AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO          ' +
        '                  '
      ''
      'ORDER BY'
      '   PTR.NOME, CON.NOME, HME.IDITEMEMPTMO')
    ValidateWithMask = True
    Left = 112
    Top = 80
    object qryParcGerPatroNOME_PATRO: TStringField
      FieldName = 'NOME_PATRO'
      Size = 60
    end
    object qryParcGerPatroIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryParcGerPatroNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryParcGerPatroITEM: TStringField
      FieldName = 'ITEM'
      Size = 40
    end
    object qryParcGerPatroPARCELA: TStringField
      FieldName = 'PARCELA'
      Size = 81
    end
    object qryParcGerPatroHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryParcGerPatroCOBRANCA: TStringField
      FieldName = 'COBRANCA'
      Size = 10
    end
    object qryParcGerPatroENVIADO: TStringField
      FieldName = 'ENVIADO'
      Size = 3
    end
    object qryParcGerPatroRECEBIDO: TStringField
      FieldName = 'RECEBIDO'
      Size = 3
    end
    object qryParcGerPatroTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object qryParcGerPatroSALDODEV: TFloatField
      FieldName = 'SALDODEV'
    end
    object qryParcGerPatroPLANILHA: TStringField
      FieldName = 'PLANILHA'
      Size = 40
    end
    object qryParcGerPatroHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryParcGerPatroHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
  end
  object dtsParcGerPatro: TwwDataSource
    DataSet = qryParcGerPatro
    Left = 112
    Top = 68
  end
  object pplParcGerPatro: TppDBPipeline
    DataSource = dtsParcGerPatro
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplParcGerPatro'
    Left = 112
    Top = 56
    object pplParcGerPatroppField1: TppField
      FieldAlias = 'NOME_PATRO'
      FieldName = 'NOME_PATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplParcGerPatroppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplParcGerPatroppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplParcGerPatroppField4: TppField
      FieldAlias = 'ITEM'
      FieldName = 'ITEM'
      FieldLength = 40
      DisplayWidth = 40
      Position = 3
    end
    object pplParcGerPatroppField5: TppField
      FieldAlias = 'PARCELA'
      FieldName = 'PARCELA'
      FieldLength = 81
      DisplayWidth = 81
      Position = 4
    end
    object pplParcGerPatroppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRPREVISTO'
      FieldName = 'HMEVLRPREVISTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplParcGerPatroppField7: TppField
      FieldAlias = 'COBRANCA'
      FieldName = 'COBRANCA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object pplParcGerPatroppField8: TppField
      FieldAlias = 'ENVIADO'
      FieldName = 'ENVIADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object pplParcGerPatroppField9: TppField
      FieldAlias = 'RECEBIDO'
      FieldName = 'RECEBIDO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 8
    end
    object pplParcGerPatroppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'TXJUROS'
      FieldName = 'TXJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplParcGerPatroppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDODEV'
      FieldName = 'SALDODEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplParcGerPatroppField12: TppField
      FieldAlias = 'PLANILHA'
      FieldName = 'PLANILHA'
      FieldLength = 40
      DisplayWidth = 40
      Position = 11
    end
    object pplParcGerPatroppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEANOCOMPETENCIA'
      FieldName = 'HMEANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplParcGerPatroppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEMESCOMPETENCIA'
      FieldName = 'HMEMESCOMPETENCIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
  end
end
