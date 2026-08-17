inherited dtmRelConfereParcela: TdtmRelConfereParcela
  Left = 245
  Top = 240
  Width = 231
  Height = 171
  Caption = 'dtmRelConfereParcela'
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
  object rptConfereParcela: TppReport
    AutoStop = False
    DataPipeline = pplConfereParcela
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
    Left = 144
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplConfereParcela'
    object ppHeaderBand24: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 67204
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = 15263976
        ParentWidth = True
        mmHeight = 8467
        mmLeft = 0
        mmTop = 58738
        mmWidth = 183542
        BandType = 0
      end
      object LblTiTAdianto: TppLabel
        UserName = 'LblTiTAdianto'
        AutoSize = False
        Caption = 'Conferência do Valor das Parcelas Geradas'
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
      object ppLabel97: TppLabel
        UserName = 'ppLabel97'
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 794
        mmTop = 63765
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'ppLabel98'
        Caption = 'Mutuário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 37306
        mmTop = 63765
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'ppLabel105'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 139171
        mmTop = 60590
        mmWidth = 6085
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
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 18521
        mmWidth = 28575
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
        mmHeight = 3175
        mmLeft = 30427
        mmTop = 18521
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 139171
        mmTop = 63765
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 124884
        mmTop = 63765
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 19844
        mmTop = 63765
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label1'
        Caption = 'Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 162984
        mmTop = 63765
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label5'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 166423
        mmTop = 60590
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 123561
        mmTop = 60590
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 147902
        mmTop = 63765
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 148432
        mmTop = 60590
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label2'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 178594
        mmTop = 63765
        mmWidth = 2117
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 96309
        mmTop = 63765
        mmWidth = 10319
        BandType = 0
      end
      object rptConfereParcela_lblFiltroAmortiza: TppLabel
        UserName = 'rptConfereParcela_lblFiltroAmortiza'
        Caption = 'Contratos sem Amortização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 151077
        mmTop = 54769
        mmWidth = 32544
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label9'
        Caption = '(*) - Parcela Suspensa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 794
        mmTop = 54769
        mmWidth = 29633
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
        mmTop = 32279
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
        mmTop = 32279
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
        mmTop = 32279
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
        mmTop = 32279
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
        mmTop = 27252
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
        mmTop = 27252
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
        mmTop = 27252
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
        mmTop = 27252
        mmWidth = 64558
        BandType = 0
      end
    end
    object ppDetalhe: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
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
        mmHeight = 4498
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
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 4
      end
      object ppDBNumContrato: TppDBText
        UserName = 'DBNumContrato'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplConfereParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereParcela'
        mmHeight = 2910
        mmLeft = 794
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = pplConfereParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConfereParcela'
        mmHeight = 2910
        mmLeft = 37306
        mmTop = 794
        mmWidth = 56092
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PREV_ATU'
        DataPipeline = pplConfereParcela
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereParcela'
        mmHeight = 2910
        mmLeft = 134409
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = pplConfereParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConfereParcela'
        mmHeight = 2910
        mmLeft = 19844
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PREV_ANT'
        DataPipeline = pplConfereParcela
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereParcela'
        mmHeight = 2910
        mmLeft = 161661
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PARC_ANT'
        DataPipeline = pplConfereParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereParcela'
        mmHeight = 2910
        mmLeft = 146844
        mmTop = 794
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PARCS_ANT'
        DataPipeline = pplConfereParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConfereParcela'
        mmHeight = 2910
        mmLeft = 153723
        mmTop = 794
        mmWidth = 4763
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 151607
        mmTop = 794
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PARC_ATU'
        DataPipeline = pplConfereParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereParcela'
        mmHeight = 2910
        mmLeft = 121973
        mmTop = 794
        mmWidth = 4763
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 126736
        mmTop = 794
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PARCS_ATU'
        DataPipeline = pplConfereParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConfereParcela'
        mmHeight = 2910
        mmLeft = 128852
        mmTop = 794
        mmWidth = 4763
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PERC'
        DataPipeline = pplConfereParcela
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereParcela'
        mmHeight = 2910
        mmLeft = 173567
        mmTop = 794
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'SITUACAO'
        DataPipeline = pplConfereParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConfereParcela'
        mmHeight = 2910
        mmLeft = 96309
        mmTop = 794
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'SUSPENSO'
        DataPipeline = pplConfereParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplConfereParcela'
        mmHeight = 5821
        mmLeft = 158750
        mmTop = 0
        mmWidth = 1852
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
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 13229
        mmLeft = 0
        mmTop = 0
        mmWidth = 183542
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 6085
        mmLeft = 6350
        mmTop = 1588
        mmWidth = 29104
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplConfereParcela
        DisplayFormat = '#,0;(#,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplConfereParcela'
        mmHeight = 2910
        mmLeft = 8731
        mmTop = 2910
        mmWidth = 9260
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label3'
        Caption = 'Contrato(s)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 19050
        mmTop = 2910
        mmWidth = 13494
        BandType = 7
      end
    end
  end
  object qryConfereParcela: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   123456789012 AS IDCONTRATOEMPTMO,'
      '   '#39'123456789012345'#39' AS MATRICULA,'
      '   '#39'12345678901234567890'#39' AS SITUACAO,'
      
        '   '#39'123454667890123454667890123454667890123454667890123454667890' +
        '123454667890'#39' AS NOME,'
      '   15840.63 AS PREV_ANT,'
      '   15841.63 AS PREV_ATU,'
      '   999 AS PARC_ANT,'
      '   999 AS PARC_ATU,'
      '   999 AS PARCS_ANT,'
      '   999 AS PARCS_ATU,'
      '   TO_DATE('#39'20/12/2004'#39', '#39'DD/MM/YYYY'#39') AS DATA_ANT,'
      '   TO_DATE('#39'20/01/2005'#39', '#39'DD/MM/YYYY'#39') AS DATA_ATU,'
      '   10.00 AS PERC,'
      '   '#39'*'#39' AS SUSPENSO'
      'FROM'
      '   DUAL'
      '')
    ValidateWithMask = True
    Left = 144
    Top = 80
    object qryConfereParcelaIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryConfereParcelaMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 15
    end
    object qryConfereParcelaNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 72
    end
    object qryConfereParcelaPREV_ANT: TFloatField
      FieldName = 'PREV_ANT'
    end
    object qryConfereParcelaPREV_ATU: TFloatField
      FieldName = 'PREV_ATU'
    end
    object qryConfereParcelaPARC_ANT: TFloatField
      FieldName = 'PARC_ANT'
    end
    object qryConfereParcelaPARC_ATU: TFloatField
      FieldName = 'PARC_ATU'
    end
    object qryConfereParcelaPARCS_ANT: TFloatField
      FieldName = 'PARCS_ANT'
    end
    object qryConfereParcelaPARCS_ATU: TFloatField
      FieldName = 'PARCS_ATU'
    end
    object qryConfereParcelaDATA_ANT: TDateTimeField
      FieldName = 'DATA_ANT'
    end
    object qryConfereParcelaDATA_ATU: TDateTimeField
      FieldName = 'DATA_ATU'
    end
    object qryConfereParcelaPERC: TFloatField
      FieldName = 'PERC'
    end
    object qryConfereParcelaSITUACAO: TStringField
      FieldName = 'SITUACAO'
      FixedChar = True
    end
    object qryConfereParcelaSUSPENSO: TStringField
      FieldName = 'SUSPENSO'
      FixedChar = True
      Size = 1
    end
  end
  object dtsConfereParcela: TwwDataSource
    DataSet = qryConfereParcela
    Left = 144
    Top = 68
  end
  object pplConfereParcela: TppDBPipeline
    DataSource = dtsConfereParcela
    CloseDataSource = True
    UserName = 'lConfereParcela'
    Left = 144
    Top = 56
    object pplConfereParcelappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplConfereParcelappField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object pplConfereParcelappField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 72
      DisplayWidth = 72
      Position = 2
    end
    object pplConfereParcelappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PREV_ANT'
      FieldName = 'PREV_ANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplConfereParcelappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PREV_ATU'
      FieldName = 'PREV_ATU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplConfereParcelappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARC_ANT'
      FieldName = 'PARC_ANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplConfereParcelappField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARC_ATU'
      FieldName = 'PARC_ATU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplConfereParcelappField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCS_ANT'
      FieldName = 'PARCS_ANT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplConfereParcelappField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCS_ATU'
      FieldName = 'PARCS_ATU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplConfereParcelappField10: TppField
      FieldAlias = 'DATA_ANT'
      FieldName = 'DATA_ANT'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object pplConfereParcelappField11: TppField
      FieldAlias = 'DATA_ATU'
      FieldName = 'DATA_ATU'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
    object pplConfereParcelappField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERC'
      FieldName = 'PERC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplConfereParcelappField13: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 12
    end
    object pplConfereParcelappField14: TppField
      FieldAlias = 'SUSPENSO'
      FieldName = 'SUSPENSO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 13
    end
  end
end
