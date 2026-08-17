inherited dtmRelResumoContratoSaldo: TdtmRelResumoContratoSaldo
  Left = 469
  Top = 357
  Width = 290
  Height = 167
  Caption = 'dtmRelResumoContratoSaldo'
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
  object pplResumoContratoSaldo: TppBDEPipeline
    DataSource = dtsResumoContratoSaldo
    CloseDataSource = True
    UserName = 'lExemplo1'
    Left = 136
    Top = 56
  end
  object dtsResumoContratoSaldo: TwwDataSource
    DataSet = qryResumoContratoSaldo
    Left = 136
    Top = 68
  end
  object rptResumoContratoSaldo: TppReport
    AutoStop = False
    DataPipeline = pplResumoContratoSaldo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Resumo da Carteira (Visão Caixa)'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
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
    Left = 136
    Top = 8
    Version = '7.04'
    mmColumnWidth = 270542
    DataPipelineName = 'pplResumoContratoSaldo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Resumo de Contratos - visão Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 11113
        mmTop = 8731
        mmWidth = 248444
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
        mmLeft = 11113
        mmTop = 794
        mmWidth = 248444
        BandType = 0
      end
      object ppLabel13: TppLabel
        OnPrint = ppLabel13Print
        UserName = 'Label3'
        Caption = 'Label3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 35719
        mmTop = 16669
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Mês de Referência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 16669
        mmWidth = 34925
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppLine4: TppLine
        OnPrint = ppLine4Print
        UserName = 'Line4'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplResumoContratoSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2646
        mmLeft = 265
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        BlankWhenZero = True
        DataField = 'ATU_DIA'
        DataPipeline = pplResumoContratoSaldo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2646
        mmLeft = 145257
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        BlankWhenZero = True
        DataField = 'PARCELAS'
        DataPipeline = pplResumoContratoSaldo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2646
        mmLeft = 161132
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        BlankWhenZero = True
        DataField = 'AMORTIZACAO'
        DataPipeline = pplResumoContratoSaldo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2646
        mmLeft = 177007
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'QUITACAO'
        DataPipeline = pplResumoContratoSaldo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2646
        mmLeft = 192882
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'QUIT_MORT'
        DataPipeline = pplResumoContratoSaldo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2646
        mmLeft = 208757
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'AJUSTE'
        DataPipeline = pplResumoContratoSaldo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2646
        mmLeft = 224632
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'DIFERENCA'
        DataPipeline = pplResumoContratoSaldo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2646
        mmLeft = 256382
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'MATRICULA'
        DataPipeline = pplResumoContratoSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2646
        mmLeft = 17198
        mmTop = 794
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = pplResumoContratoSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2646
        mmLeft = 28840
        mmTop = 794
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'NOME'
        DataPipeline = pplResumoContratoSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2910
        mmLeft = 39423
        mmTop = 794
        mmWidth = 41540
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'SITDESCRICAO'
        DataPipeline = pplResumoContratoSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2910
        mmLeft = 83873
        mmTop = 794
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText39'
        DataField = 'SALDOATU'
        DataPipeline = pplResumoContratoSaldo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2646
        mmLeft = 240507
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        BlankWhenZero = True
        DataField = 'CONCESSOES'
        DataPipeline = pplResumoContratoSaldo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2646
        mmLeft = 129382
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'SALDODEV'
        DataPipeline = pplResumoContratoSaldo
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResumoContratoSaldo'
        mmHeight = 2646
        mmLeft = 113506
        mmTop = 794
        mmWidth = 14023
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
        mmWidth = 270542
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
        mmLeft = 265
        mmTop = 3175
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
        mmHeight = 3704
        mmLeft = 87842
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
        mmLeft = 243153
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'NOME_PLANO'
      DataPipeline = pplResumoContratoSaldo
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplResumoContratoSaldo'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'NOME_PATRO'
      DataPipeline = pplResumoContratoSaldo
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplResumoContratoSaldo'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand4BeforePrint
        Visible = False
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppShape1: TppShape
          OnPrint = ppShape1Print
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 10319
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          Weight = 1.5
          mmHeight = 10319
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'PLANO_PATRO'
          DataPipeline = pplResumoContratoSaldo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2910
          mmLeft = 794
          mmTop = 529
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Amortização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 178859
          mmTop = 6879
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = 'Gerada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 168275
          mmTop = 4233
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = 'Concessão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 132027
          mmTop = 6879
          mmWidth = 11377
          BandType = 3
          GroupNo = 1
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          Caption = 'Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 119592
          mmTop = 6879
          mmWidth = 7938
          BandType = 3
          GroupNo = 1
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 121973
          mmTop = 4233
          mmWidth = 5556
          BandType = 3
          GroupNo = 1
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 167482
          mmTop = 6879
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object ppLabel31: TppLabel
          UserName = 'Label102'
          Caption = 'Antecipada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 195527
          mmTop = 6879
          mmWidth = 11377
          BandType = 3
          GroupNo = 1
        end
        object ppLabel32: TppLabel
          UserName = 'Label32'
          Caption = 'Quitação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 197909
          mmTop = 4233
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object ppLabel33: TppLabel
          UserName = 'Label33'
          Caption = 'por Morte /'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 211932
          mmTop = 4233
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel34: TppLabel
          UserName = 'Label34'
          Caption = 'Invalidez'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 213784
          mmTop = 6879
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object ppLabel35: TppLabel
          UserName = 'Label35'
          Caption = 'Saldo Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 243417
          mmTop = 6879
          mmWidth = 11113
          BandType = 3
          GroupNo = 1
        end
        object ppLabel37: TppLabel
          UserName = 'Label37'
          Caption = 'Quitação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 214048
          mmTop = 1588
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel39: TppLabel
          UserName = 'Label39'
          Caption = 'Atualizaçao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 147638
          mmTop = 4233
          mmWidth = 11642
          BandType = 3
          GroupNo = 1
        end
        object ppLabel38: TppLabel
          UserName = 'Label38'
          Caption = 'Diária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 153723
          mmTop = 6879
          mmWidth = 5556
          BandType = 3
          GroupNo = 1
        end
        object ppLabel40: TppLabel
          UserName = 'Label40'
          Caption = 'Ajustes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 231246
          mmTop = 6879
          mmWidth = 7408
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 17727
        mmPrintPosition = 0
        object ppLine7: TppLine
          UserName = 'Line7'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 17727
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 1
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          mmHeight = 5027
          mmLeft = 111919
          mmTop = 2910
          mmWidth = 159279
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'SALDODEV'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 113506
          mmTop = 3969
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'PARCELAS'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 161132
          mmTop = 3969
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'AMORTIZACAO'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 177007
          mmTop = 3969
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'QUITACAO'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 192882
          mmTop = 3969
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'QUIT_MORT'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 208757
          mmTop = 3969
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'AJUSTE'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 224632
          mmTop = 3969
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'SALDOATU'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 240507
          mmTop = 3969
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc19: TppDBCalc
          UserName = 'DBCalc19'
          DataField = 'CONCESSOES'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 129382
          mmTop = 3969
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc101'
          DataField = 'ATU_DIA'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 145257
          mmTop = 3969
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'PLANO_PATRO'
          DataPipeline = pplResumoContratoSaldo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 6350
          mmLeft = 794
          mmTop = 3969
          mmWidth = 108215
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc18'
          BlankWhenZero = True
          DataField = 'DIFERENCA'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 256382
          mmTop = 3969
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'TCEDESCRICAO'
      DataPipeline = pplResumoContratoSaldo
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplResumoContratoSaldo'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 10319
        mmPrintPosition = 0
        object ppShape4: TppShape
          OnPrint = ppShape1Print
          UserName = 'Shape4'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 10319
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 2
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          Weight = 1.5
          mmHeight = 10319
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplResumoContratoSaldo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 3969
          mmLeft = 794
          mmTop = 794
          mmWidth = 139171
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Amortização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 178594
          mmTop = 7144
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Gerada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 167746
          mmTop = 7144
          mmWidth = 7408
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Concessão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 132027
          mmTop = 7144
          mmWidth = 11377
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 119327
          mmTop = 7144
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 121709
          mmTop = 4498
          mmWidth = 5821
          BandType = 3
          GroupNo = 1
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 168275
          mmTop = 4498
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Antecipada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 196057
          mmTop = 7144
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel17: TppLabel
          UserName = 'Label101'
          Caption = 'Quitação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 197909
          mmTop = 4498
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'por Morte /'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 211932
          mmTop = 4498
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'Label2'
          Caption = 'Invalidez'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 214048
          mmTop = 7144
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Saldo Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 242888
          mmTop = 7144
          mmWidth = 11642
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 6350
          mmTop = 7144
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 17198
          mmTop = 7144
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 28840
          mmTop = 7144
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Mutuário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 39423
          mmTop = 7144
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 83873
          mmTop = 7144
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'Quitação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 213784
          mmTop = 1852
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'Diária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 153723
          mmTop = 7144
          mmWidth = 5556
          BandType = 3
          GroupNo = 2
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Atualizaçao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 147638
          mmTop = 4498
          mmWidth = 11642
          BandType = 3
          GroupNo = 2
        end
        object ppLabel26: TppLabel
          UserName = 'Label26'
          Caption = 'Ajustes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2646
          mmLeft = 231246
          mmTop = 7144
          mmWidth = 7408
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 2
        end
        object ppLine1: TppLine
          OnPrint = ppLine1Print
          UserName = 'Line1'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 10054
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 2
        end
        object ppShape5: TppShape
          UserName = 'Shape5'
          mmHeight = 5027
          mmLeft = 111919
          mmTop = 1852
          mmWidth = 159279
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'SALDODEV'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 113506
          mmTop = 2910
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'PARCELAS'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 161132
          mmTop = 2910
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'AMORTIZACAO'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 177007
          mmTop = 2910
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'QUITACAO'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 192882
          mmTop = 2910
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'QUIT_MORT'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 208757
          mmTop = 2910
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'AJUSTE'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 224632
          mmTop = 2910
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'SALDOATU'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 240507
          mmTop = 2910
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          BlankWhenZero = True
          DataField = 'DIFERENCA'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 256382
          mmTop = 2910
          mmWidth = 14023
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'CONCESSOES'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 129382
          mmTop = 2910
          mmWidth = 14023
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'ATU_DIA'
          DataPipeline = pplResumoContratoSaldo
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2646
          mmLeft = 145257
          mmTop = 2910
          mmWidth = 14023
          BandType = 5
          GroupNo = 2
        end
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplResumoContratoSaldo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplResumoContratoSaldo'
          mmHeight = 2910
          mmLeft = 794
          mmTop = 2910
          mmWidth = 108215
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryResumoContratoSaldo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   3000000025412                                                ' +
        '  AS IDCONTRATOEMPTMO,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOME,'
      
        '   '#39'987587-00    '#39'                                              ' +
        '  AS MATRICULA,'
      
        '   1234567                                                      ' +
        '  AS INSCRICAONUMERO,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS DESCTIPOEMPTMO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS TCEDESCRICAO,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOME_PLANO,'
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        #39' AS NOME_PATRO,'
      ''
      
        '   '#39'123456789012345678901234567890123456789012345678901234567890' +
        ' / 123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS PLANO_PATRO,'
      ''
      
        '   '#39'12345678901234567890123456789012345678901234567890'#39'         ' +
        '  AS SITDESCRICAO,'
      ''
      '   100000000 AS SALDODEV,'
      ''
      '    10000000 AS ATU_DIA,'
      '    10000000 AS ATU_DIA_CONTAB,'
      '    10000000 AS ATU_DIA_ESTORNO,'
      ''
      '    10000000 AS CONCESSOES,'
      '    10000000 AS CONCESSOES_CONTAB,'
      '    10000000 AS CONCESSOES_ESTORNO,'
      ''
      '    -1000000 AS PARCELAS,'
      '    -1000000 AS PARCELAS_CONTAB,'
      '    -1000000 AS PARCELAS_ESTORNO,'
      ''
      '    -1000000 AS AMORTIZACAO,'
      '    -1000000 AS AMORTIZACAO_CONTAB,'
      '    -1000000 AS AMORTIZACAO_ESTORNO,'
      ''
      '   -10000000 AS QUITACAO,'
      '   -10000000 AS QUITACAO_CONTAB,'
      '   -10000000 AS QUITACAO_ESTORNO,'
      ''
      '    -1000000 AS QUIT_MORT,'
      '    -1000000 AS QUIT_MORT_CONTAB,'
      '    -1000000 AS QUIT_MORT_ESTORNO,'
      ''
      '      100000 AS AJUSTE,'
      '      100000 AS AJUSTE_CONTAB,'
      '      100000 AS AJUSTE_ESTORNO,'
      ''
      '   100000000 AS SALDOATU,'
      '   100000000 AS DIFERENCA'
      ''
      'FROM'
      '   DUAL'
      ''
      'WHERE'
      '   1 = 2')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 136
    Top = 80
    object qryResumoContratoSaldoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryResumoContratoSaldoNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 60
    end
    object qryResumoContratoSaldoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryResumoContratoSaldoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryResumoContratoSaldoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      FixedChar = True
      Size = 60
    end
    object qryResumoContratoSaldoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 60
    end
    object qryResumoContratoSaldoSITDESCRICAO: TStringField
      FieldName = 'SITDESCRICAO'
      FixedChar = True
      Size = 50
    end
    object qryResumoContratoSaldoSALDODEV: TFloatField
      FieldName = 'SALDODEV'
    end
    object qryResumoContratoSaldoCONCESSOES: TFloatField
      FieldName = 'CONCESSOES'
    end
    object qryResumoContratoSaldoPARCELAS: TFloatField
      FieldName = 'PARCELAS'
    end
    object qryResumoContratoSaldoAMORTIZACAO: TFloatField
      FieldName = 'AMORTIZACAO'
    end
    object qryResumoContratoSaldoQUITACAO: TFloatField
      FieldName = 'QUITACAO'
    end
    object qryResumoContratoSaldoQUIT_MORT: TFloatField
      FieldName = 'QUIT_MORT'
    end
    object qryResumoContratoSaldoSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
    object qryResumoContratoSaldoDIFERENCA: TFloatField
      FieldName = 'DIFERENCA'
    end
    object qryResumoContratoSaldoNOME_PLANO: TStringField
      FieldName = 'NOME_PLANO'
      FixedChar = True
      Size = 60
    end
    object qryResumoContratoSaldoNOME_PATRO: TStringField
      FieldName = 'NOME_PATRO'
      FixedChar = True
      Size = 60
    end
    object qryResumoContratoSaldoATU_DIA: TFloatField
      FieldName = 'ATU_DIA'
    end
    object qryResumoContratoSaldoAJUSTE: TFloatField
      FieldName = 'AJUSTE'
    end
    object qryResumoContratoSaldoPLANO_PATRO: TStringField
      FieldName = 'PLANO_PATRO'
      FixedChar = True
      Size = 123
    end
    object qryResumoContratoSaldoATU_DIA_CONTAB: TFloatField
      FieldName = 'ATU_DIA_CONTAB'
    end
    object qryResumoContratoSaldoCONCESSOES_CONTAB: TFloatField
      FieldName = 'CONCESSOES_CONTAB'
    end
    object qryResumoContratoSaldoPARCELAS_CONTAB: TFloatField
      FieldName = 'PARCELAS_CONTAB'
    end
    object qryResumoContratoSaldoAMORTIZACAO_CONTAB: TFloatField
      FieldName = 'AMORTIZACAO_CONTAB'
    end
    object qryResumoContratoSaldoQUITACAO_CONTAB: TFloatField
      FieldName = 'QUITACAO_CONTAB'
    end
    object qryResumoContratoSaldoQUIT_MORT_CONTAB: TFloatField
      FieldName = 'QUIT_MORT_CONTAB'
    end
    object qryResumoContratoSaldoAJUSTE_CONTAB: TFloatField
      FieldName = 'AJUSTE_CONTAB'
    end
    object qryResumoContratoSaldoATU_DIA_ESTORNO: TFloatField
      FieldName = 'ATU_DIA_ESTORNO'
    end
    object qryResumoContratoSaldoCONCESSOES_ESTORNO: TFloatField
      FieldName = 'CONCESSOES_ESTORNO'
    end
    object qryResumoContratoSaldoPARCELAS_ESTORNO: TFloatField
      FieldName = 'PARCELAS_ESTORNO'
    end
    object qryResumoContratoSaldoAMORTIZACAO_ESTORNO: TFloatField
      FieldName = 'AMORTIZACAO_ESTORNO'
    end
    object qryResumoContratoSaldoQUITACAO_ESTORNO: TFloatField
      FieldName = 'QUITACAO_ESTORNO'
    end
    object qryResumoContratoSaldoQUIT_MORT_ESTORNO: TFloatField
      FieldName = 'QUIT_MORT_ESTORNO'
    end
    object qryResumoContratoSaldoAJUSTE_ESTORNO: TFloatField
      FieldName = 'AJUSTE_ESTORNO'
    end
  end
  object upd: TUpdateSQL
    Left = 224
    Top = 56
  end
end
