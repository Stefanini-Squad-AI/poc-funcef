inherited dtmRelContratoSemParcela: TdtmRelContratoSemParcela
  Left = 347
  Top = 294
  Width = 256
  Height = 160
  Caption = 'dtmRelContratoSemParcela'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
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
  object pplContratoSemParcela: TppBDEPipeline
    DataSource = dsContratoSemParcela
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 128
    Top = 80
  end
  object dsContratoSemParcela: TwwDataSource
    DataSet = qryContratoSemParcela
    Left = 128
    Top = 68
  end
  object rptContratoSemParcela: TppReport
    AutoStop = False
    DataPipeline = pplContratoSemParcela
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Contratos Sem Parcelas Geradas'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 296863
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
    mmColumnWidth = 270405
    DataPipelineName = 'pplContratoSemParcela'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 42333
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
        mmTop = 37835
        mmWidth = 270405
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Contratos Sem Parcelas Geradas'
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
        mmWidth = 270405
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 270405
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Mês de Referência:  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 18521
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel872: TppLabel
        OnPrint = ppLabel872Print
        UserName = 'Label872'
        Caption = 'Janeiro/2002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 30163
        mmTop = 18521
        mmWidth = 15610
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
        mmTop = 30427
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
        mmLeft = 153194
        mmTop = 30427
        mmWidth = 12700
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
        mmTop = 37835
        mmWidth = 270405
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
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
        mmTop = 30427
        mmWidth = 105040
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
        mmLeft = 165629
        mmTop = 30427
        mmWidth = 105040
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
        mmTop = 25400
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
        mmLeft = 143934
        mmTop = 25400
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
        mmTop = 25400
        mmWidth = 102659
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
        mmLeft = 165629
        mmTop = 25400
        mmWidth = 105040
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object rptContrato: TppShape
        OnPrint = rptContratoPrint
        UserName = 'rptContrato'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 270405
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'FLGSITUACAO'
        DataPipeline = pplContratoSemParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratoSemParcela'
        mmHeight = 2910
        mmLeft = 248709
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = pplContratoSemParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratoSemParcela'
        mmHeight = 2910
        mmLeft = 34131
        mmTop = 265
        mmWidth = 58473
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplContratoSemParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratoSemParcela'
        mmHeight = 2910
        mmLeft = 1058
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'MATRICULA'
        DataPipeline = pplContratoSemParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContratoSemParcela'
        mmHeight = 2910
        mmLeft = 19315
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DATACREDITO'
        DataPipeline = pplContratoSemParcela
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplContratoSemParcela'
        mmHeight = 2910
        mmLeft = 201084
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DATAPRIMPARC'
        DataPipeline = pplContratoSemParcela
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplContratoSemParcela'
        mmHeight = 2910
        mmLeft = 216959
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DATA_PARCELA_ANT'
        DataPipeline = pplContratoSemParcela
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplContratoSemParcela'
        mmHeight = 2910
        mmLeft = 232834
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'FLG_INTERNO'
        DataPipeline = pplContratoSemParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratoSemParcela'
        mmHeight = 2910
        mmLeft = 95515
        mmTop = 265
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TSEDESCRICAO'
        DataPipeline = pplContratoSemParcela
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContratoSemParcela'
        mmHeight = 2910
        mmLeft = 130440
        mmTop = 265
        mmWidth = 33867
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DATACREDITO'
        DataPipeline = pplContratoSemParcela
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplContratoSemParcela'
        mmHeight = 2910
        mmLeft = 167217
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DATACREDITO'
        DataPipeline = pplContratoSemParcela
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplContratoSemParcela'
        mmHeight = 2910
        mmLeft = 182034
        mmTop = 265
        mmWidth = 12965
        BandType = 4
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
        mmTop = 1852
        mmWidth = 270405
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
        mmLeft = 87577
        mmTop = 3175
        mmWidth = 94986
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
        mmLeft = 243946
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'TCEDESCRICAO'
      DataPipeline = pplContratoSemParcela
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContratoSemParcela'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 9525
          mmLeft = 0
          mmTop = 0
          mmWidth = 270405
          BandType = 3
          GroupNo = 2
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplContratoSemParcela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplContratoSemParcela'
          mmHeight = 3175
          mmLeft = 1058
          mmTop = 794
          mmWidth = 22225
          BandType = 3
          GroupNo = 2
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 9260
          mmWidth = 270405
          BandType = 3
          GroupNo = 2
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 3175
          mmTop = 6085
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 19315
          mmTop = 6085
          mmWidth = 12965
          BandType = 3
          GroupNo = 2
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 34131
          mmTop = 6085
          mmWidth = 14552
          BandType = 3
          GroupNo = 2
        end
        object ppLabel11: TppLabel
          UserName = 'Label101'
          AutoSize = False
          Caption = 'Contratual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 248709
          mmTop = 6085
          mmWidth = 21431
          BandType = 3
          GroupNo = 2
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 201084
          mmTop = 6085
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label102'
          AutoSize = False
          Caption = '1ª Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 216959
          mmTop = 6085
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label103'
          AutoSize = False
          Caption = 'Data de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 201084
          mmTop = 2910
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label104'
          AutoSize = False
          Caption = 'Data da'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 216959
          mmTop = 2910
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Data da'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 232834
          mmTop = 2910
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Últ. Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 232305
          mmTop = 6085
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 95515
          mmTop = 6085
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = 'Situação do'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 95515
          mmTop = 2910
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          AutoSize = False
          Caption = 'Suspensão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 130440
          mmTop = 6085
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Tipo de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 130440
          mmTop = 2910
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 248709
          mmTop = 2910
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = 'Suspensão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 167217
          mmTop = 6085
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = 'Período de'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 167217
          mmTop = 2910
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 529
          mmWidth = 270405
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplContratoSemParcela
          DisplayFormat = '#,#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplContratoSemParcela'
          mmHeight = 2910
          mmLeft = 17198
          mmTop = 2117
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Contratos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 33073
          mmTop = 2117
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryContratoSemParcela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO, '
      '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA, MUT.NOME, '
      '   CON.DATACREDITO, CON.DATAPRIMPARC, '
      '   ( '
      '   SELECT '
      '      MAX(HME.HMEDATAPREVISTA) AS HMEDATAPREVISTA '
      '   FROM '
      '      HISTMOVEMPTMO HME '
      '   WHERE '
      '          HME.HMETIPOMOV           = 1 '
      '      AND NVL(HME.FLGESTORNADO, 0) = 0 '
      '      AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '
      '   GROUP BY '
      '      HME.IDCONTRATOEMPTMO '
      '   ) AS DATA_PARCELA_ANT, '
      '   TCE.TCEDESCRICAO, '
      '   SIT.DESCRICAO AS SIT_PART, '
      '   CON.IDTIPOSUSPEMPTMO, CON.DATAINICIOSUSP, CON.DATAFIMSUSP, '
      '   TSE.TSEDESCRICAO, '
      '   DECODE(CON.IDPESSOA, CON.IDBENEF, DECODE(SIT.FLGINTERNO, '
      '                                            '#39'A'#39', '#39'Ativo'#39', '
      '                                            '#39'C'#39', '#39'Cancelado'#39', '
      '                                            '#39'E'#39', '#39'Encerrado'#39', '
      '                                            '#39'Q'#39', '#39'Quitado'#39', '
      '                                            '#39'R'#39', '#39'Refinanciado'#39','
      '                                            '#39'S'#39', '#39'Suspenso'#39', '
      
        '                                            '#39'P'#39', '#39'Pendente de Li' +
        'beração'#39', '
      
        '                                            '#39'K'#39', '#39'Pendente de Qu' +
        'itação'#39' '
      '                                           ), '
      '                                     '#39'Pensionista'#39' '
      '         ) AS FLG_INTERNO, '
      '   DECODE(CON.FLGSITUACAO, '#39'A'#39', '#39'Ativo'#39', '
      '                           '#39'C'#39', '#39'Cancelado'#39', '
      '                           '#39'E'#39', '#39'Encerrado'#39', '
      '                           '#39'Q'#39', '#39'Quitado'#39', '
      '                           '#39'R'#39', '#39'Refinanciado'#39', '
      '                           '#39'S'#39', '#39'Suspenso'#39', '
      '                           '#39'P'#39', '#39'Pendente de Liberação'#39', '
      '                           '#39'K'#39', '#39'Pendente de Quitação'#39' '
      '         ) AS FLGSITUACAO '
      'FROM '
      '   PESSOA          MUT, '
      '   CONTRATOEMPTMO  CON, '
      '   PARTPREVPLAN    PPP, '
      '   ELEGPATRO       ELP, '
      '   DEPENTIT        DEP, '
      '   TIPOCONTREMPTMO TCE, '
      '   TIPOEMPTMO      TEP, '
      '   TIPOSUSPEMPTMO  TSE, '
      '   SITPART         SIT'
      'WHERE'
      '       TEP.IDEMPRESAPROP      = 1'
      ''
      '   AND dep.matricula          = '#39'0187197'#39
      ''
      
        '   AND CON.DATAPRIMPARC      <= TO_DATE('#39'30/04/2005'#39','#39'DD/MM/YYYY' +
        #39')'
      '   AND CON.IDPATRO            IN (91008, 1)'
      '   AND CON.IDPLANOPREV        IN (19, 66, 2)'
      '   AND CON.FLGSITUACAO        IN ('#39'A'#39', '#39'E'#39', '#39'J'#39', '#39'K'#39')'
      '   AND CON.FLGSITUACAO         <>  '#39'E'#39
      '   AND CON.FLGSITUACAO         <>  '#39'K'#39
      '  AND  NOT EXISTS'
      '      ( '
      '      SELECT '
      '        H.* '
      '      FROM '
      '        HISTMOVEMPTMO H '
      '      WHERE '
      '            HMETIPOMOV         = 1 '
      '        AND HMEANOCOMPETENCIA  = 2005'
      '        AND HMEMESCOMPETENCIA  = 4'
      '        AND (FLGESTORNADO      = 0 OR FLGESTORNADO IS NULL ) '
      '        AND H.IDCONTRATOEMPTMO = CON.IDCONTRATOEMPTMO '
      '      ) '
      '   AND CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO '
      '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO '
      '   AND CON.IDPESSOA           = ELP.IDPESSOA '
      '   AND CON.IDPATRO            = ELP.IDPESSJUR '
      '   AND CON.IDPESSOA           = DEP.IDTITULAR '
      '   AND CON.IDBENEF            = DEP.IDPESSOA '
      '   AND CON.IDBENEF            = MUT.IDPESSOA '
      '   AND CON.IDPESSOA           = PPP.IDPESSOA '
      '   AND CON.IDPATRO            = PPP.IDPESSJUR '
      '   AND PPP.FLGDESATIVADO      = 0'
      '   AND PPP.IDSITPART          = SIT.IDSITPART '
      '   AND CON.IDTIPOSUSPEMPTMO   = TSE.IDTIPOSUSPEMPTMO(+)'
      'ORDER BY'
      '   TCE.TCEDESCRICAO, MUT.NOME')
    ValidateWithMask = True
    Left = 128
    Top = 56
    object qryContratoSemParcelaIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratoSemParcelaMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryContratoSemParcelaNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryContratoSemParcelaDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContratoSemParcelaDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryContratoSemParcelaDATA_PARCELA_ANT: TDateTimeField
      FieldName = 'DATA_PARCELA_ANT'
    end
    object qryContratoSemParcelaTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryContratoSemParcelaSIT_PART: TStringField
      FieldName = 'SIT_PART'
      Size = 50
    end
    object qryContratoSemParcelaIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryContratoSemParcelaDATAINICIOSUSP: TDateTimeField
      FieldName = 'DATAINICIOSUSP'
    end
    object qryContratoSemParcelaDATAFIMSUSP: TDateTimeField
      FieldName = 'DATAFIMSUSP'
    end
    object qryContratoSemParcelaTSEDESCRICAO: TStringField
      FieldName = 'TSEDESCRICAO'
      Size = 60
    end
    object qryContratoSemParcelaFLG_INTERNO: TStringField
      FieldName = 'FLG_INTERNO'
      Size = 21
    end
    object qryContratoSemParcelaFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      Size = 21
    end
  end
end
