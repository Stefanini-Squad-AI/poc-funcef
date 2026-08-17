inherited DmRelLancFundo: TDmRelLancFundo
  Left = 424
  Top = 230
  Width = 428
  Height = 367
  Caption = 'DmRelLancFundo'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 347
    Top = 123
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
    Left = 347
    Top = 72
  end
  inherited qryExemplo: TwwQuery
    Active = True
    Left = 346
    Top = 24
  end
  inherited rpExemplo: TppReport
    Left = 347
    Top = 177
    DataPipelineName = 'pplExemplo'
  end
  object rptSaldoFundos: TppReport
    AutoStop = False
    DataPipeline = pplSaldoFundo
    OnStartPage = rptSaldoFundosStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldo dos Fundos'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 47
    Top = 25
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSaldoFundo'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object ppsSaldoFundosCab: TppShape
        UserName = 'sSaldoFundosCab'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 23813
        mmWidth = 284300
        BandType = 0
      end
      object pplblSaldoFundosFundo: TppLabel
        UserName = 'lblSaldoFundosFundo'
        Caption = 'Fundo de Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1058
        mmTop = 24606
        mmWidth = 27252
        BandType = 0
      end
      object pplblSaldoFundosQtd: TppLabel
        UserName = 'lblSaldoFundosQtd'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 138113
        mmTop = 24606
        mmWidth = 13494
        BandType = 0
      end
      object pplblSaldoFundosVlrBruto: TppLabel
        UserName = 'lblSaldoFundosVlrBruto'
        Caption = 'Valor Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 196321
        mmTop = 24606
        mmWidth = 13229
        BandType = 0
      end
      object pplblSaldoFundosIOF: TppLabel
        UserName = 'lblSaldoFundosIOF'
        Caption = 'IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 227542
        mmTop = 24606
        mmWidth = 3969
        BandType = 0
      end
      object pplblSaldoFundosIR: TppLabel
        UserName = 'lblSaldoFundosIR'
        Caption = 'IRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 247915
        mmTop = 24606
        mmWidth = 5821
        BandType = 0
      end
      object pplblSaldoFundosSldLiq: TppLabel
        UserName = 'lblSaldoFundosSldLiq'
        Caption = 'Saldo Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 266701
        mmTop = 24606
        mmWidth = 16140
        BandType = 0
      end
      object LblPlano: TppLabel
        UserName = 'LblPlano'
        Caption = 'LblPlano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 268553
        mmTop = 8731
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label1'
        Caption = 'Saldo dos Fundos de Investimento -'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 60452
        BandType = 0
      end
      object ppLabel86: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa6'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object lblCarteira: TppLabel
        UserName = 'lblCarteira'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 271463
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object pplblSaldoFundosDataRef: TppLabel
        UserName = 'LPeriodo6'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage6: TppDBImage
        UserName = 'DbLogo6'
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
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Qtd. Bloqueada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2921
        mmLeft = 162454
        mmTop = 24606
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCTIPOFUNDOINV'
        DataPipeline = pplSaldoFundo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 4233
        mmLeft = 86519
        mmTop = 8731
        mmWidth = 94192
        BandType = 0
      end
    end
    object dtbDatalhes: TppDetailBand
      BeforePrint = dtbDatalhesBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object ppsSaldoFundosDet: TppShape
        OnPrint = ppsSaldoFundosDetPrint
        UserName = 'sSaldoFundosDet'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object srptSaldoFundos: TppSubReport
        OnPrint = srptSaldoFundosPrint
        UserName = 'srptSaldoFundos'
        DrillDownComponent = ppDBSaldoFundosFundo
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplSaldoFundoDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 5027
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = pplSaldoFundoDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Saldo dos Fundos'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 296
          Top = 192
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplSaldoFundoDet'
          object ppDetailBand7: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppShape1: TppShape
              UserName = 'sSaldoFundosDet'
              Pen.Style = psClear
              mmHeight = 3704
              mmLeft = 41275
              mmTop = 529
              mmWidth = 243153
              BandType = 4
            end
            object ppsSaldoFundosSDet: TppShape
              OnPrint = ppsSaldoFundosSDetPrint
              UserName = 'sSaldoFundosSDet'
              Pen.Style = psClear
              mmHeight = 3969
              mmLeft = 72761
              mmTop = 0
              mmWidth = 211403
              BandType = 4
            end
            object ppDBSSaldoFundosAplicacao: TppDBText
              UserName = 'DBSSaldoFundosAplicacao'
              DataField = 'DATAAPLICACAO'
              DataPipeline = pplSaldoFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplSaldoFundoDet'
              mmHeight = 2910
              mmLeft = 74348
              mmTop = 529
              mmWidth = 13229
              BandType = 4
            end
            object ppDBSSaldoFundosQTD: TppDBText
              UserName = 'DBSSaldoFundosQTD'
              DataField = 'SALDOQTDCOTAS'
              DataPipeline = pplSaldoFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSaldoFundoDet'
              mmHeight = 2910
              mmLeft = 120121
              mmTop = 529
              mmWidth = 30692
              BandType = 4
            end
            object ppDBSSaldoFundosVlrCota: TppDBText
              UserName = 'DBSSaldoFundosVlrCota'
              DataField = 'VLRCOTAATUAL'
              DataPipeline = pplSaldoFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSaldoFundoDet'
              mmHeight = 2910
              mmLeft = 88900
              mmTop = 529
              mmWidth = 30427
              BandType = 4
            end
            object ppDBSSaldoFundosVlrBruto: TppDBText
              UserName = 'DBSSaldoFundosVlrBruto'
              DataField = 'SALDOVLRFUNDO'
              DataPipeline = pplSaldoFundoDet
              DisplayFormat = '###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSaldoFundoDet'
              mmHeight = 2910
              mmLeft = 180975
              mmTop = 529
              mmWidth = 28575
              BandType = 4
            end
            object ppDBSSaldoFundosIOF: TppDBText
              UserName = 'DBSSaldoFundosIOF'
              DataField = 'VLRIOFPROV'
              DataPipeline = pplSaldoFundoDet
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSaldoFundoDet'
              mmHeight = 2910
              mmLeft = 209815
              mmTop = 529
              mmWidth = 21696
              BandType = 4
            end
            object ppDBSSaldoFundosIR: TppDBText
              UserName = 'DBSSaldoFundosIR'
              DataField = 'VLRIRPROV'
              DataPipeline = pplSaldoFundoDet
              DisplayFormat = '#,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSaldoFundoDet'
              mmHeight = 2910
              mmLeft = 232040
              mmTop = 529
              mmWidth = 21696
              BandType = 4
            end
            object ppDBSSaldoFundosSlrLiq: TppDBText
              UserName = 'DBSSaldoFundosSlrLiq'
              DataField = 'SALDOLIQUIDO'
              DataPipeline = pplSaldoFundoDet
              DisplayFormat = '#,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSaldoFundoDet'
              mmHeight = 2910
              mmLeft = 254265
              mmTop = 529
              mmWidth = 28575
              BandType = 4
            end
            object dbTipoCota: TppDBText
              UserName = 'dbTipoCota'
              DataField = 'DESCTIPOCOTA'
              DataPipeline = pplSaldoFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsItalic]
              Transparent = True
              Visible = False
              DataPipelineName = 'pplSaldoFundoDet'
              mmHeight = 2911
              mmLeft = 44186
              mmTop = 529
              mmWidth = 28046
              BandType = 4
            end
            object ppDBText1: TppDBText
              UserName = 'DBSSaldoFundosQTD1'
              DataField = 'SALDOQTDCOTASBLQ'
              DataPipeline = pplSaldoFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplSaldoFundoDet'
              mmHeight = 2910
              mmLeft = 152136
              mmTop = 529
              mmWidth = 28575
              BandType = 4
            end
          end
          object ppGroup2: TppGroup
            BreakName = 'DESCFUNDOINVEST'
            DataPipeline = pplSaldoFundoDet
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'pplSaldoFundoDet'
            object ppGroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 8996
              mmPrintPosition = 0
              object ppsSaldoFundosSCab: TppShape
                UserName = 'sSaldoFundosSCab'
                Brush.Color = clSilver
                mmHeight = 4233
                mmLeft = 73025
                mmTop = 4233
                mmWidth = 211138
                BandType = 3
                GroupNo = 0
              end
              object pplblSSaldoFundosAplicacao: TppLabel
                UserName = 'SSaldoFundosAplicacao'
                Caption = 'Aplicação'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 2910
                mmLeft = 74348
                mmTop = 4763
                mmWidth = 11377
                BandType = 3
                GroupNo = 0
              end
              object pplblSSaldoFundosQTD: TppLabel
                UserName = 'SSaldoFundosQTD'
                Caption = 'Quantidade'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 137319
                mmTop = 4763
                mmWidth = 13494
                BandType = 3
                GroupNo = 0
              end
              object lblValorCota: TppLabel
                UserName = 'lblValorCota'
                Caption = 'Valor da Cota'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 103452
                mmTop = 4763
                mmWidth = 15875
                BandType = 3
                GroupNo = 0
              end
              object pplblSSaldoFundosVlrBruto: TppLabel
                UserName = 'SSaldoFundosVlrBruto'
                Caption = 'Valor Bruto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 196321
                mmTop = 4763
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object pplblSSaldoFundosVlrBrutoIOF: TppLabel
                UserName = 'lblSSaldoFundosVlrBrutoIOF'
                Caption = 'IOF'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 227542
                mmTop = 4763
                mmWidth = 3969
                BandType = 3
                GroupNo = 0
              end
              object pplblSSaldoFundosVlrBrutoIR: TppLabel
                UserName = 'lblSSaldoFundosVlrBrutoIR'
                Caption = 'IRRF'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 247915
                mmTop = 4763
                mmWidth = 5821
                BandType = 3
                GroupNo = 0
              end
              object pplSSaldoFundosCab: TppLine
                UserName = 'lSSaldoFundosCab'
                Weight = 0.75
                mmHeight = 794
                mmLeft = 73025
                mmTop = 8467
                mmWidth = 211138
                BandType = 3
                GroupNo = 0
              end
              object ppLabel1: TppLabel
                UserName = 'SSaldoFundosQTD1'
                Caption = 'Qtd. Bloqueada'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 162719
                mmTop = 4763
                mmWidth = 17992
                BandType = 3
                GroupNo = 0
              end
              object ppLabel4: TppLabel
                UserName = 'Label4'
                Caption = 'Saldo Líquido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 7
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 2910
                mmLeft = 266701
                mmTop = 4763
                mmWidth = 16140
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand2: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppLine1: TppLine
                UserName = 'lSSaldoFundosCab1'
                Weight = 0.75
                mmHeight = 3440
                mmLeft = 73025
                mmTop = 265
                mmWidth = 211138
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
      object ppDBSaldoFundosFundo: TppDBText
        UserName = 'DBSaldoFundosFundo'
        DataField = 'DESCFUNDOINVEST'
        DataPipeline = pplSaldoFundo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 2910
        mmLeft = 794
        mmTop = 0
        mmWidth = 111654
        BandType = 4
      end
      object ppDBSaldoFundosQTD: TppDBText
        UserName = 'DBSaldoFundosQTD'
        DataField = 'SALDOQTDCOTAS'
        DataPipeline = pplSaldoFundo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 2910
        mmLeft = 120915
        mmTop = 0
        mmWidth = 30734
        BandType = 4
      end
      object ppDBSaldoFundosVlrBruto: TppDBText
        UserName = 'DBSaldoFundosVlrBruto'
        DataField = 'SALDOVLRFUNDO'
        DataPipeline = pplSaldoFundo
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 2910
        mmLeft = 180975
        mmTop = 0
        mmWidth = 28575
        BandType = 4
      end
      object ppDBSaldoFundosIOF: TppDBText
        UserName = 'DBSaldoFundosIOF'
        DataField = 'VLRIOFPROV'
        DataPipeline = pplSaldoFundo
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 2910
        mmLeft = 209815
        mmTop = 0
        mmWidth = 21696
        BandType = 4
      end
      object ppDBSaldoFundosIR: TppDBText
        UserName = 'DBSaldoFundosIR'
        DataField = 'VLRIRPROV'
        DataPipeline = pplSaldoFundo
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 2910
        mmLeft = 232040
        mmTop = 0
        mmWidth = 21697
        BandType = 4
      end
      object ppDBSaldoFundosSldLiq: TppDBText
        UserName = 'DBSaldoFundosSldLiq'
        DataField = 'SALDOLIQUIDO'
        DataPipeline = pplSaldoFundo
        DisplayFormat = '#,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 2910
        mmLeft = 254265
        mmTop = 0
        mmWidth = 28575
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBSaldoFundosQTD1'
        DataField = 'SALDOQTDCOTASBLQ'
        DataPipeline = pplSaldoFundo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 2910
        mmLeft = 151871
        mmTop = 0
        mmWidth = 28575
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel8: TppLabel
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
        mmWidth = 283898
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
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
        mmLeft = 794
        mmTop = 3175
        mmWidth = 283898
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
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
        mmLeft = 245534
        mmTop = 2910
        mmWidth = 38629
        BandType = 8
      end
    end
    object ppSummaryBand10: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = 'Saldo Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 794
        mmTop = 3969
        mmWidth = 13123
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'SALDOVLRFUNDO'
        DataPipeline = pplSaldoFundo
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 2910
        mmLeft = 180975
        mmTop = 3969
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'VLRIOFPROV'
        DataPipeline = pplSaldoFundo
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 2910
        mmLeft = 209815
        mmTop = 3969
        mmWidth = 21696
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'VLRIRPROV'
        DataPipeline = pplSaldoFundo
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 2910
        mmLeft = 232040
        mmTop = 3969
        mmWidth = 21696
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'SALDOLIQUIDO'
        DataPipeline = pplSaldoFundo
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 2910
        mmLeft = 254265
        mmTop = 3969
        mmWidth = 28575
        BandType = 7
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 2381
        mmWidth = 284300
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 7938
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'SALDOQTDCOTASBLQ'
        DataPipeline = pplSaldoFundo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 2910
        mmLeft = 151871
        mmTop = 3969
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'SALDOQTDCOTAS'
        DataPipeline = pplSaldoFundo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoFundo'
        mmHeight = 2910
        mmLeft = 120915
        mmTop = 3969
        mmWidth = 30692
        BandType = 7
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'DESCTIPOFUNDOINV'
      DataPipeline = pplSaldoFundo
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSaldoFundo'
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
    object ppGroup1: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplSaldoFundo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSaldoFundo'
      object ghbCabecalhoPlano: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppDBText29: TppDBText
          UserName = 'ppdbDescFundo1'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = pplSaldoFundo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'pplSaldoFundo'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1588
          mmWidth = 78846
          BandType = 3
          GroupNo = 1
        end
        object ppLine7: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 0
          mmTop = 529
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLine8: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6350
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
      end
      object gfbRodapePlano: TppGroupFooterBand
        AfterGenerate = gfbRodapePlanoAfterGenerate
        BeforePrint = gfbRodapePlanoBeforePrint
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object dbcValBrutoPlano: TppDBCalc
          UserName = 'dbcValBrutoPlano'
          DataField = 'SALDOVLRFUNDO'
          DataPipeline = pplSaldoFundo
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoFundo'
          mmHeight = 2910
          mmLeft = 180975
          mmTop = 2646
          mmWidth = 28575
          BandType = 5
          GroupNo = 1
        end
        object pplLinhaRodapeFundo: TppLine
          UserName = 'lLinhaRodapeFundo'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 1058
          mmWidth = 284428
          BandType = 5
          GroupNo = 1
        end
        object dbcValIOFPlano: TppDBCalc
          UserName = 'dbcValIOFPlano'
          DataField = 'VLRIOFPROV'
          DataPipeline = pplSaldoFundo
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoFundo'
          mmHeight = 2910
          mmLeft = 209815
          mmTop = 2646
          mmWidth = 21697
          BandType = 5
          GroupNo = 1
        end
        object dbcValIRPlano: TppDBCalc
          UserName = 'dbcValIRPlano'
          DataField = 'VLRIRPROV'
          DataPipeline = pplSaldoFundo
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoFundo'
          mmHeight = 2910
          mmLeft = 232040
          mmTop = 2646
          mmWidth = 21697
          BandType = 5
          GroupNo = 1
        end
        object dbcValLiqFundo: TppDBCalc
          UserName = 'dbcValLiqFundo'
          DataField = 'SALDOLIQUIDO'
          DataPipeline = pplSaldoFundo
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoFundo'
          mmHeight = 2910
          mmLeft = 254265
          mmTop = 2646
          mmWidth = 28575
          BandType = 5
          GroupNo = 1
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Saldo Total do Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 794
          mmTop = 2646
          mmWidth = 24088
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'SALDOQTDCOTASBLQ'
          DataPipeline = pplSaldoFundo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoFundo'
          mmHeight = 2910
          mmLeft = 151871
          mmTop = 2646
          mmWidth = 28575
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'SALDOQTDCOTAS'
          DataPipeline = pplSaldoFundo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoFundo'
          mmHeight = 2910
          mmLeft = 120915
          mmTop = 2646
          mmWidth = 30692
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object pplSaldoFundo: TppBDEPipeline
    DataSource = dsSaldoTot
    UserName = 'lSaldoFundoTot'
    Left = 47
    Top = 80
    object pplSaldoFundoppField1: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplSaldoFundoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTAS'
      FieldName = 'SALDOQTDCOTAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplSaldoFundoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRFUNDO'
      FieldName = 'SALDOVLRFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplSaldoFundoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOFPROV'
      FieldName = 'VLRIOFPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplSaldoFundoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIRPROV'
      FieldName = 'VLRIRPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplSaldoFundoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOLIQUIDO'
      FieldName = 'SALDOLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplSaldoFundoppField7: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 113
      DisplayWidth = 113
      Position = 6
    end
    object pplSaldoFundoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTASBLQ'
      FieldName = 'SALDOQTDCOTASBLQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplSaldoFundoppField9: TppField
      FieldAlias = 'DESCTIPOFUNDOINV'
      FieldName = 'DESCTIPOFUNDOINV'
      FieldLength = 80
      DisplayWidth = 80
      Position = 8
    end
    object pplSaldoFundoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOFUNDOINVEST'
      FieldName = 'IDTIPOFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplSaldoFundoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplSaldoFundoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplSaldoFundoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTASG'
      FieldName = 'SALDOQTDCOTASG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplSaldoFundoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTASBLQG'
      FieldName = 'SALDOQTDCOTASBLQG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplSaldoFundoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRFUNDOG'
      FieldName = 'SALDOVLRFUNDOG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplSaldoFundoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOFPROVG'
      FieldName = 'VLRIOFPROVG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplSaldoFundoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIRPROVG'
      FieldName = 'VLRIRPROVG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplSaldoFundoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOLIQUIDOG'
      FieldName = 'SALDOLIQUIDOG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
  end
  object dsSaldoTot: TDataSource
    AutoEdit = False
    DataSet = QrySaldoTot
    Left = 46
    Top = 133
  end
  object QrySaldoTot: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '-- QryMontada em tempo de execução'
      'SELECT'
      
        '   DET.DESCTIPOFUNDOINV, DET.PLANPRVCONTABPATRO, DET.DESCFUNDOIN' +
        'VEST,'
      
        '   DET.IDTIPOFUNDOINVEST, DET.IDPLANPREVCTBPATR, DET.IDFUNDOINVE' +
        'ST,'
      '   DET.SALDOQTDCOTAS,'
      '   DET.SALDOQTDCOTASBLQ,'
      '   DET.SALDOVLRFUNDO,'
      '   DET.VLRIOFPROV,'
      '   DET.VLRIRPROV,'
      '   DET.SALDOLIQUIDO,'
      '   GERAL.SALDOQTDCOTASG,'
      '   GERAL.SALDOQTDCOTASBLQG,'
      '   GERAL.SALDOVLRFUNDOG,'
      '   GERAL.VLRIOFPROVG,'
      '   GERAL.VLRIRPROVG,'
      '   GERAL.SALDOLIQUIDOG'
      'FROM'
      '  (SELECT /*+INDEX (H1.XPKHISTFUNDO)*/'
      
        '      FI.DESCTIPOFUNDOINV, PLANO.PLANPRVCONTABPATRO, FI.DESCFUND' +
        'OINVEST,'
      
        '      FI.IDTIPOFUNDOINVEST, H1.IDPLANPREVCTBPATR, H1.IDFUNDOINVE' +
        'ST,'
      '      SUM(NVL(H1.SALDOQTDCOTAS,0))    AS SALDOQTDCOTAS,'
      '      SUM(NVL(H1.SALDOQTDCOTASBLQ,0)) AS SALDOQTDCOTASBLQ,'
      '      SUM(NVL(H1.SALDOVLRFUNDO,0))    AS SALDOVLRFUNDO,'
      '      SUM(NVL(H1.VLRIOFPROV,0))       AS VLRIOFPROV,'
      '      SUM(NVL(H1.VLRIRPROV,0))        AS VLRIRPROV,'
      
        '      SUM((NVL(H1.SALDOVLRFUNDO,0) - NVL(H1.VLRIOFPROV,0))) AS  ' +
        'SALDOLIQUIDO'
      '   FROM'
      '      HISTFUNDO H1,'
      ''
      
        '     (SELECT /*+INDEX (HI.XIE1HISTFUNDO)*/ MAX(HI.IDHISTFUNDO) A' +
        'S IDHISTFUNDO'
      '      FROM'
      '         HISTFUNDO HI,'
      ''
      '        (SELECT IDTIPOINVEST, IDTIPOOPERACAO'
      '         FROM   TIPOOPERACAO'
      '         WHERE (IDTIPOINVEST = :IDTIPOINVEST)'
      '         AND   (NATUREZAOPERACAO <> '#39'R'#39')) TP,'
      ''
      
        '        (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DE' +
        'SCFUNDOINVEST'
      '         FROM HISTFUNDOINVEST HF1'
      
        '         WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY' +
        ', HH24:MI:SS'#39') IN'
      
        '               (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIG' +
        'ENCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '                FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '                WHERE'
      '                    (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '                AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (TF.IDTIPO' +
        'FUNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '                AND  ((:IDFUNDOINVEST     IS NULL) OR (HF.IDFUND' +
        'OINVEST     = :IDFUNDOINVEST))'
      
        '                AND (HF.DTAVIGENCIA < TO_DATE(:DATAMOVFUNDO,'#39'DD/' +
        'MM/YYYY'#39')+1)'
      
        '                AND  ((:IDGESTORCARTEIRA  IS NULL) OR (HF.IDGEST' +
        'ORCARTEIRA  = :IDGESTORCARTEIRA))'
      
        '                AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST' +
        ')'
      '                GROUP BY HF.IDFUNDOINVEST))'
      
        '         AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (HF1.IDTIPOFUNDO' +
        'INVEST = :IDTIPOFUNDOINVEST)) ) FI'
      '      WHERE'
      '          (HI.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '      AND (((:IDPLANPREVCTBPATR IS NULL)     AND (HI.IDPLANPREVC' +
        'TBPATR > 0)) OR'
      
        '           ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '      AND (((:IDFUNDOINVEST IS NULL)         AND (HI.IDFUNDOINVE' +
        'ST > 0)) OR'
      
        '           ((:IDFUNDOINVEST IS NOT NULL)     AND (HI.IDFUNDOINVE' +
        'ST = :IDFUNDOINVEST)))'
      ''
      
        '      AND (((:TIPOMAIOR IS NOT NULL) AND (HI.DATAAPLICACAO >= TO' +
        '_DATE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '           ((:TIPOMENOR IS NOT NULL) AND (HI.DATAAPLICACAO <  TO' +
        '_DATE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      '           ((:TIPOMAIOR IS NULL)     AND (:TIPOMENOR IS NULL) ))'
      ''
      
        '      AND (HI.DATAMOVFUNDO = TO_DATE(:DATAMOVFUNDO, '#39'DD/MM/YYYY'#39 +
        '))'
      
        '      AND  ((:IDTIPOCOTA  IS NULL) OR (HI.IDTIPOCOTA = :IDTIPOCO' +
        'TA))'
      '      AND (HI.TIPMOVFUNDO      <> '#39'PIR'#39')'
      '      AND (FI.IDFUNDOINVEST     = HI.IDFUNDOINVEST)'
      '      AND (TP.IDTIPOINVEST      = HI.IDTIPOINVEST)'
      '      AND (TP.IDTIPOOPERACAO    = HI.IDTIPOOPERACAO)'
      
        '      GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDO' +
        'INVEST, HI.DATAAPLICACAO, HI.DATAMOVFUNDO,'
      '               HI.IDTIPOCOTA) HM,'
      ''
      
        '     (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DESCF' +
        'UNDOINVEST, TF1.DESCTIPOFUNDOINV'
      '      FROM HISTFUNDOINVEST HF1, TIPOFUNDOINVEST TF1'
      
        '      WHERE (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM' +
        '/YYYY, HH24:MI:SS'#39') IN'
      
        '             (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGEN' +
        'CIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '              FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '              WHERE'
      '                  (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '              AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (TF.IDTIPOFU' +
        'NDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '              AND  ((:IDFUNDOINVEST     IS NULL) OR (HF.IDFUNDOI' +
        'NVEST     = :IDFUNDOINVEST))'
      
        '              AND  ((:DATAMOVFUNDO      IS NULL) OR (TRUNC(HF.DT' +
        'AVIGENCIA)< TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY'#39')+1))'
      
        '              AND  ((:IDGESTORCARTEIRA  IS NULL) OR (HF.IDGESTOR' +
        'CARTEIRA  = :IDGESTORCARTEIRA))'
      '              AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      '              GROUP BY HF.IDFUNDOINVEST))'
      
        '      AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (HF1.IDTIPOFUNDOINV' +
        'EST = :IDTIPOFUNDOINVEST))'
      '      AND (HF1.IDTIPOFUNDOINVEST = TF1.IDTIPOFUNDOINVEST) ) FI,'
      ''
      '      VWPLANPREVCTBPATR PLANO'
      '   WHERE'
      '       (H1.IDHISTFUNDO = HM.IDHISTFUNDO)'
      '   AND  ((:BLOQUEADO IS NULL) OR (H1.SALDOQTDCOTASBLQ > 0))'
      '   AND (H1.SALDOQTDCOTAS > 0)'
      '   AND  (PLANO.IDPLANPREVCTBPATR = H1.IDPLANPREVCTBPATR)'
      '   AND (H1.IDFUNDOINVEST         = FI.IDFUNDOINVEST)'
      
        '   GROUP BY  FI.DESCTIPOFUNDOINV, PLANO.PLANPRVCONTABPATRO, FI.D' +
        'ESCFUNDOINVEST,'
      
        '             FI.IDTIPOFUNDOINVEST, H1.IDPLANPREVCTBPATR, H1.IDFU' +
        'NDOINVEST) DET,'
      ''
      '  (SELECT /*+INDEX (H1.XPKHISTFUNDO)*/'
      '      SUM(NVL(H1.SALDOQTDCOTAS,0))    AS SALDOQTDCOTASG,'
      '      SUM(NVL(H1.SALDOQTDCOTASBLQ,0)) AS SALDOQTDCOTASBLQG,'
      '      SUM(NVL(H1.SALDOVLRFUNDO,0))    AS SALDOVLRFUNDOG,'
      '      SUM(NVL(H1.VLRIOFPROV,0))       AS VLRIOFPROVG,'
      '      SUM(NVL(H1.VLRIRPROV,0))        AS VLRIRPROVG,'
      
        '      SUM((NVL(H1.SALDOVLRFUNDO,0) - NVL(H1.VLRIOFPROV,0))) AS  ' +
        'SALDOLIQUIDOG'
      '   FROM'
      '      HISTFUNDO H1,'
      ''
      
        '     (SELECT /*+INDEX (HI.XIE1HISTFUNDO)*/ MAX(HI.IDHISTFUNDO) A' +
        'S IDHISTFUNDO'
      '      FROM'
      '         HISTFUNDO HI,'
      ''
      '        (SELECT IDTIPOINVEST, IDTIPOOPERACAO'
      '         FROM   TIPOOPERACAO'
      '         WHERE (IDTIPOINVEST = :IDTIPOINVEST)'
      '         AND   (NATUREZAOPERACAO <> '#39'R'#39')) TP,'
      ''
      
        '        (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DE' +
        'SCFUNDOINVEST'
      '         FROM HISTFUNDOINVEST HF1'
      '         WHERE'
      
        '            (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, H' +
        'H24:MI:SS'#39') IN'
      
        '            (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENC' +
        'IA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '             FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '             WHERE'
      '                 (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '             AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (TF.IDTIPOFUN' +
        'DOINVEST = :IDTIPOFUNDOINVEST))'
      
        '             AND  ((:IDFUNDOINVEST     IS NULL) OR (HF.IDFUNDOIN' +
        'VEST     = :IDFUNDOINVEST))'
      
        '             AND (TRUNC(HF.DTAVIGENCIA)       < TO_DATE(:DATAMOV' +
        'FUNDO,'#39'DD/MM/YYYY'#39')+1)'
      
        '             AND  ((:IDGESTORCARTEIRA  IS NULL) OR (HF.IDGESTORC' +
        'ARTEIRA  = :IDGESTORCARTEIRA))'
      '             AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      '             GROUP BY HF.IDFUNDOINVEST))'
      
        '         AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (HF1.IDTIPOFUNDO' +
        'INVEST = :IDTIPOFUNDOINVEST)) ) FI'
      '      WHERE'
      '          (HI.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '      AND (((:IDPLANPREVCTBPATR IS NULL)     AND (HI.IDPLANPREVC' +
        'TBPATR > 0)) OR'
      
        '           ((:IDPLANPREVCTBPATR IS NOT NULL) AND (HI.IDPLANPREVC' +
        'TBPATR = :IDPLANPREVCTBPATR)))'
      ''
      
        '      AND (((:IDFUNDOINVEST IS NULL)         AND (HI.IDFUNDOINVE' +
        'ST > 0)) OR'
      
        '           ((:IDFUNDOINVEST IS NOT NULL)     AND (HI.IDFUNDOINVE' +
        'ST = :IDFUNDOINVEST)))'
      ''
      
        '      AND (((:TIPOMAIOR IS NOT NULL) AND (HI.DATAAPLICACAO >= TO' +
        '_DATE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '           ((:TIPOMENOR IS NOT NULL) AND (HI.DATAAPLICACAO <  TO' +
        '_DATE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      '           ((:TIPOMAIOR IS NULL)     AND (:TIPOMENOR IS NULL) ))'
      ''
      
        '      AND (HI.DATAMOVFUNDO = TO_DATE(:DATAMOVFUNDO, '#39'DD/MM/YYYY'#39 +
        '))'
      
        '      AND  ((:IDTIPOCOTA  IS NULL) OR (HI.IDTIPOCOTA = :IDTIPOCO' +
        'TA))'
      '      AND (HI.TIPMOVFUNDO      <> '#39'PIR'#39')'
      '      AND (FI.IDFUNDOINVEST     = HI.IDFUNDOINVEST)'
      '      AND (TP.IDTIPOINVEST      = HI.IDTIPOINVEST)'
      '      AND (TP.IDTIPOOPERACAO    = HI.IDTIPOOPERACAO)'
      
        '      GROUP BY HI.IDTIPOINVEST, HI.IDPLANPREVCTBPATR, HI.IDFUNDO' +
        'INVEST, HI.DATAAPLICACAO, HI.DATAMOVFUNDO,'
      '               HI.IDTIPOCOTA) HM,'
      ''
      
        '     (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DESCF' +
        'UNDOINVEST, TF1.DESCTIPOFUNDOINV'
      '      FROM HISTFUNDOINVEST HF1, TIPOFUNDOINVEST TF1'
      
        '      WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, H' +
        'H24:MI:SS'#39') IN'
      
        '             (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGEN' +
        'CIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '              FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '              WHERE'
      '                  (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '              AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (TF.IDTIPOFU' +
        'NDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '              AND  ((:IDFUNDOINVEST     IS NULL) OR (HF.IDFUNDOI' +
        'NVEST     = :IDFUNDOINVEST))'
      
        '              AND (TRUNC(HF.DTAVIGENCIA)       < TO_DATE(:DATAMO' +
        'VFUNDO,'#39'DD/MM/YYYY'#39')+1)'
      
        '              AND  ((:IDGESTORCARTEIRA  IS NULL) OR (HF.IDGESTOR' +
        'CARTEIRA  = :IDGESTORCARTEIRA))'
      '              AND (HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)'
      '              GROUP BY HF.IDFUNDOINVEST))'
      
        '      AND   ((:IDTIPOFUNDOINVEST IS NULL) OR (HF1.IDTIPOFUNDOINV' +
        'EST = :IDTIPOFUNDOINVEST))'
      '      AND (HF1.IDTIPOFUNDOINVEST = TF1.IDTIPOFUNDOINVEST) ) FI,'
      ''
      '       VWPLANPREVCTBPATR PLANO'
      '   WHERE'
      '       (H1.IDHISTFUNDO = HM.IDHISTFUNDO)'
      '   AND  ((:BLOQUEADO IS NULL) OR (H1.SALDOQTDCOTASBLQ > 0))'
      '   AND (H1.SALDOQTDCOTAS > 0)'
      '   AND (PLANO.IDPLANPREVCTBPATR    = H1.IDPLANPREVCTBPATR)'
      '   AND (H1.IDFUNDOINVEST           = FI.IDFUNDOINVEST) ) GERAL'
      
        'ORDER BY DET.DESCTIPOFUNDOINV, DET.PLANPRVCONTABPATRO, DET.DESCF' +
        'UNDOINVEST')
    ValidateWithMask = True
    Left = 46
    Top = 185
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BLOQUEADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BLOQUEADO'
        ParamType = ptInput
      end>
    object QrySaldoTotDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QrySaldoTotSALDOQTDCOTAS: TFloatField
      FieldName = 'SALDOQTDCOTAS'
    end
    object QrySaldoTotSALDOVLRFUNDO: TFloatField
      FieldName = 'SALDOVLRFUNDO'
    end
    object QrySaldoTotVLRIOFPROV: TFloatField
      FieldName = 'VLRIOFPROV'
    end
    object QrySaldoTotVLRIRPROV: TFloatField
      FieldName = 'VLRIRPROV'
    end
    object QrySaldoTotSALDOLIQUIDO: TFloatField
      FieldName = 'SALDOLIQUIDO'
    end
    object QrySaldoTotPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QrySaldoTotSALDOQTDCOTASBLQ: TFloatField
      FieldName = 'SALDOQTDCOTASBLQ'
    end
    object QrySaldoTotDESCTIPOFUNDOINV: TStringField
      FieldName = 'DESCTIPOFUNDOINV'
      Size = 80
    end
    object QrySaldoTotIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
    end
    object QrySaldoTotIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object QrySaldoTotIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object QrySaldoTotSALDOQTDCOTASG: TFloatField
      FieldName = 'SALDOQTDCOTASG'
    end
    object QrySaldoTotSALDOQTDCOTASBLQG: TFloatField
      FieldName = 'SALDOQTDCOTASBLQG'
    end
    object QrySaldoTotSALDOVLRFUNDOG: TFloatField
      FieldName = 'SALDOVLRFUNDOG'
    end
    object QrySaldoTotVLRIOFPROVG: TFloatField
      FieldName = 'VLRIOFPROVG'
    end
    object QrySaldoTotVLRIRPROVG: TFloatField
      FieldName = 'VLRIRPROVG'
    end
    object QrySaldoTotSALDOLIQUIDOG: TFloatField
      FieldName = 'SALDOLIQUIDOG'
    end
  end
  object pplSaldoFundoDet: TppBDEPipeline
    DataSource = DtsSaldoDet
    UserName = 'lSaldoFundoDet'
    Left = 173
    Top = 82
    object pplSaldoFundoDetppField1: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplSaldoFundoDetppField2: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 43
      Position = 1
    end
    object pplSaldoFundoDetppField3: TppField
      FieldAlias = 'DATAAPLICACAO'
      FieldName = 'DATAAPLICACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 2
    end
    object pplSaldoFundoDetppField4: TppField
      FieldAlias = 'DATAMOVFUNDO'
      FieldName = 'DATAMOVFUNDO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 3
    end
    object pplSaldoFundoDetppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTAS'
      FieldName = 'SALDOQTDCOTAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 26
      Position = 4
    end
    object pplSaldoFundoDetppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRFUNDO'
      FieldName = 'SALDOVLRFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 5
    end
    object pplSaldoFundoDetppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTAATUAL'
      FieldName = 'VLRCOTAATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 22
      Position = 6
    end
    object pplSaldoFundoDetppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTASBLQ'
      FieldName = 'SALDOQTDCOTASBLQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 22
      Position = 7
    end
    object pplSaldoFundoDetppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOFPROV'
      FieldName = 'VLRIOFPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 8
    end
    object pplSaldoFundoDetppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIRPROV'
      FieldName = 'VLRIRPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 16
      Position = 9
    end
    object pplSaldoFundoDetppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOLIQUIDO'
      FieldName = 'SALDOLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 10
    end
    object pplSaldoFundoDetppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTAAPLICACAO'
      FieldName = 'VLRCOTAAPLICACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 22
      Position = 11
    end
    object pplSaldoFundoDetppField13: TppField
      FieldAlias = 'DESCTIPOCOTA'
      FieldName = 'DESCTIPOCOTA'
      FieldLength = 40
      DisplayWidth = 20
      Position = 12
    end
    object pplSaldoFundoDetppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplSaldoFundoDetppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplSaldoFundoDetppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOFUNDOINVEST'
      FieldName = 'IDTIPOFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplSaldoFundoDetppField17: TppField
      FieldAlias = 'DESCTIPOFUNDOINV'
      FieldName = 'DESCTIPOFUNDOINV'
      FieldLength = 80
      DisplayWidth = 80
      Position = 16
    end
  end
  object QrySaldoDet: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      '-- QryMontada em tempo de execução'
      'SELECT /*+INDEX (H1.XPKHISTFUNDO)*/'
      '     FI.IDFUNDOINVEST, FI.DESCFUNDOINVEST,'
      '     FI.IDTIPOFUNDOINVEST,FI.DESCTIPOFUNDOINV,'
      '     H1.DATAAPLICACAO, H1.DATAMOVFUNDO,'
      '     H1.SALDOQTDCOTAS, H1.SALDOQTDCOTASBLQ,'
      '     NVL(CAT.VLRCOTA,0)       AS VLRCOTAATUAL,'
      '     H1.SALDOVLRFUNDO,'
      '     NVL(H1.VLRIRPROV,0)    AS VLRIRPROV,'
      '     NVL(H1.VLRIOFPROV,0)   AS VLRIOFPROV,'
      
        '    (NVL(H1.SALDOVLRFUNDO,0) - NVL(H1.VLRIOFPROV,0)) AS  SALDOLI' +
        'QUIDO,'
      '     NVL(H1.COTAAPLICACAO,0) AS VLRCOTAAPLICACAO,'
      '     PLANO.PLANPRVCONTABPATRO,'
      '     H1.IDPLANPREVCTBPATR,'
      '     TC.DESCTIPOCOTA'
      'FROM'
      '   HISTFUNDO H1,'
      ''
      
        '  (SELECT /*+INDEX (HI.XIE1HISTFUNDO)*/  MAX(HI.IDHISTFUNDO) AS ' +
        'IDHISTFUNDO'
      '   FROM HISTFUNDO HI,'
      ''
      '       (SELECT IDTIPOINVEST, IDTIPOOPERACAO'
      '        FROM   TIPOOPERACAO'
      '        WHERE (IDTIPOINVEST = :IDTIPOINVEST)'
      '        AND   (NATUREZAOPERACAO <> '#39'R'#39')) TP,'
      ''
      
        '       (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DES' +
        'CFUNDOINVEST'
      '        FROM HISTFUNDOINVEST HF1'
      
        '        WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY,' +
        ' HH24:MI:SS'#39') IN'
      
        '              (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGE' +
        'NCIA),'#39'DD/MM/YYYY, HH24:MI:SS'#39')'
      '               FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '               WHERE'
      '                   (TF.IDTIPOINVEST = :IDTIPOINVEST)'
      
        '               AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (TF.IDTIPOF' +
        'UNDOINVEST = :IDTIPOFUNDOINVEST))'
      
        '               AND  ((:IDFUNDOINVEST     IS NULL) OR (HF.IDFUNDO' +
        'INVEST     = :IDFUNDOINVEST))'
      
        '               AND (TRUNC(HF.DTAVIGENCIA)       < TO_DATE(:DATAM' +
        'OVFUNDO,'#39'DD/MM/YYYY'#39')+1)'
      
        '               AND  ((:IDGESTORCARTEIRA  IS NULL) OR (HF.IDGESTO' +
        'RCARTEIRA  = :IDGESTORCARTEIRA))'
      
        '               AND (HF.IDTIPOFUNDOINVEST  = TF.IDTIPOFUNDOINVEST' +
        ')'
      '               GROUP BY HF.IDFUNDOINVEST))'
      
        '        AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF1.IDTIPOFUNDOIN' +
        'VEST = :IDTIPOFUNDOINVEST))'
      '        AND NOT EXISTS'
      '                (SELECT 1'
      '                 FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '                 WHERE'
      '                     TF.IDTIPOINVEST = :IDTIPOINVEST'
      '                 AND HF.IDFUNDOINVEST = HF1.IDFUNDOINVEST'
      '                 AND HF.DTAVIGENCIA   > HF1.DTAVIGENCIA'
      
        '                 AND HF.IDTIPOFUNDOINVEST <> HF1.IDTIPOFUNDOINVE' +
        'ST'
      '                 AND HF.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST'
      '                 GROUP BY HF.IDFUNDOINVEST)'
      '        ) FI'
      '   WHERE'
      '       (HI.IDTIPOINVEST      = :IDTIPOINVEST)'
      
        '   AND  ((:IDPLANPREVCTBPATR IS NULL) OR (HI.IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR))'
      
        '   AND  ((:IDFUNDOINVEST IS NULL)     OR (HI.IDFUNDOINVEST = :ID' +
        'FUNDOINVEST))'
      
        '   AND (((:TIPOMAIOR IS NOT NULL) AND (HI.DATAAPLICACAO >= TO_DA' +
        'TE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      
        '        ((:TIPOMENOR IS NOT NULL) AND (HI.DATAAPLICACAO <  TO_DA' +
        'TE(:DATAAPLICACAO,'#39'DD/MM/YYYY'#39') )) OR'
      '        ((:TIPOMAIOR IS NULL)     AND (:TIPOMENOR IS NULL) ))'
      
        '   AND (HI.DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO, '#39'DD/MM/YYY' +
        'Y'#39'))'
      '   AND  ((:IDTIPOCOTA IS NULL) OR (HI.IDTIPOCOTA = :IDTIPOCOTA))'
      '   AND (HI.TIPMOVFUNDO      <> '#39'PIR'#39')'
      '   AND (FI.IDFUNDOINVEST     = HI.IDFUNDOINVEST)'
      '   AND (TP.IDTIPOINVEST      = HI.IDTIPOINVEST)'
      '   AND (TP.IDTIPOOPERACAO    = HI.IDTIPOOPERACAO)'
      
        '   GROUP BY HI.IDTIPOINVEST,  HI.IDPLANPREVCTBPATR, HI.IDFUNDOIN' +
        'VEST, HI.DATAAPLICACAO,'
      '            HI.DATAMOVFUNDO,  HI.IDTIPOCOTA) HM,'
      ''
      '   COTAFUNDO CAT, TIPOCOTA TC,'
      ''
      
        '  (SELECT HF1.IDFUNDOINVEST, HF1.IDTIPOFUNDOINVEST, HF1.DESCFUND' +
        'OINVEST,TF1.DESCTIPOFUNDOINV'
      '   FROM HISTFUNDOINVEST HF1,TIPOFUNDOINVEST TF1'
      '   WHERE'
      
        '      (HF1.IDFUNDOINVEST || TO_CHAR(HF1.DTAVIGENCIA,'#39'DD/MM/YYYY,' +
        ' HH24:MI:SS'#39') IN'
      
        '      (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'D' +
        'D/MM/YYYY, HH24:MI:SS'#39')'
      '       FROM   HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '       WHERE'
      '           (TF.IDTIPOINVEST       = :IDTIPOINVEST)'
      
        '       AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (TF.IDTIPOFUNDOINVE' +
        'ST = :IDTIPOFUNDOINVEST))'
      
        '       AND  ((:IDFUNDOINVEST     IS NULL) OR (HF.IDFUNDOINVEST  ' +
        '   = :IDFUNDOINVEST))'
      
        '       AND (TRUNC(HF.DTAVIGENCIA)       < TO_DATE(:DATAMOVFUNDO,' +
        #39'DD/MM/YYYY'#39')+1)'
      
        '       AND  ((:IDGESTORCARTEIRA  IS NULL) OR (HF.IDGESTORCARTEIR' +
        'A  = :IDGESTORCARTEIRA))'
      '       AND (HF.IDTIPOFUNDOINVEST  = TF.IDTIPOFUNDOINVEST)'
      '       GROUP BY HF.IDFUNDOINVEST))'
      
        '   AND  ((:IDTIPOFUNDOINVEST IS NULL) OR (HF1.IDTIPOFUNDOINVEST ' +
        '= :IDTIPOFUNDOINVEST))'
      '   AND (HF1.IDTIPOFUNDOINVEST = TF1.IDTIPOFUNDOINVEST) ) FI,'
      ''
      '   VWPLANPREVCTBPATR PLANO'
      ''
      'WHERE'
      '      (H1.IDHISTFUNDO       = HM.IDHISTFUNDO)'
      '  AND  ((:BLOQUEADO IS NULL) OR (H1.SALDOQTDCOTASBLQ > 0))'
      '  AND (H1.SALDOQTDCOTAS > 0)'
      '  AND (H1.IDPLANPREVCTBPATR = PLANO.IDPLANPREVCTBPATR)'
      '  AND (H1.IDFUNDOINVEST     = FI.IDFUNDOINVEST)'
      '  AND (H1.DATAMOVFUNDO      = CAT.DATACOTA(+))'
      '  AND (H1.IDFUNDOINVEST     = CAT.IDFUNDOINVEST(+))'
      '  AND (NVL(H1.IDTIPOCOTA,0) = NVL(CAT.IDTIPOCOTA(+),0))'
      '  AND (H1.IDTIPOCOTA        =  TC.IDTIPOCOTA(+))'
      
        'ORDER BY PLANPRVCONTABPATRO, IDPLANPREVCTBPATR, DESCFUNDOINVEST,' +
        ' DATAAPLICACAO, DESCTIPOCOTA'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 173
    Top = 187
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAAPLICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMAIOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'TIPOMENOR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDGESTORCARTEIRA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'BLOQUEADO'
        ParamType = ptInput
      end>
    object QrySaldoDetPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 25
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QrySaldoDetDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundos'
      DisplayWidth = 43
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QrySaldoDetDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 10
      FieldName = 'DATAAPLICACAO'
    end
    object QrySaldoDetDATAMOVFUNDO: TDateTimeField
      DisplayLabel = 'Dt da Cota'
      DisplayWidth = 10
      FieldName = 'DATAMOVFUNDO'
    end
    object QrySaldoDetSALDOQTDCOTAS: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 26
      FieldName = 'SALDOQTDCOTAS'
    end
    object QrySaldoDetSALDOVLRFUNDO: TFloatField
      DisplayLabel = 'Valor Bruto'
      DisplayWidth = 20
      FieldName = 'SALDOVLRFUNDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoDetVLRCOTAATUAL: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 22
      FieldName = 'VLRCOTAATUAL'
    end
    object QrySaldoDetSALDOQTDCOTASBLQ: TFloatField
      DisplayLabel = 'Quantidade Bloqueada'
      DisplayWidth = 22
      FieldName = 'SALDOQTDCOTASBLQ'
    end
    object QrySaldoDetVLRIOFPROV: TFloatField
      DisplayLabel = 'IOF'
      DisplayWidth = 14
      FieldName = 'VLRIOFPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoDetVLRIRPROV: TFloatField
      DisplayLabel = 'IRRF'
      DisplayWidth = 16
      FieldName = 'VLRIRPROV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoDetSALDOLIQUIDO: TFloatField
      DisplayLabel = 'Valor Líquido'
      DisplayWidth = 20
      FieldName = 'SALDOLIQUIDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QrySaldoDetVLRCOTAAPLICACAO: TFloatField
      DisplayLabel = 'Cota Aplicacão'
      DisplayWidth = 22
      FieldName = 'VLRCOTAAPLICACAO'
    end
    object QrySaldoDetDESCTIPOCOTA: TStringField
      DisplayLabel = 'Tipo de Cota'
      DisplayWidth = 20
      FieldName = 'DESCTIPOCOTA'
      Visible = False
      Size = 40
    end
    object QrySaldoDetIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QrySaldoDetIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QrySaldoDetIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QrySaldoDetDESCTIPOFUNDOINV: TStringField
      FieldName = 'DESCTIPOFUNDOINV'
      Visible = False
      Size = 80
    end
  end
  object DtsSaldoDet: TDataSource
    DataSet = QrySaldoDet
    Left = 176
    Top = 136
  end
  object rptSaldoFundoCon: TppReport
    OnStartPage = rptSaldoFundoConStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldo dos Fundos'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 175
    Top = 25
    Version = '7.04'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'sSaldoFundosCab'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 23813
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'lblSaldoFundosFundo'
        Caption = 'Fundo de Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1058
        mmTop = 24606
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'lblSaldoFundosQtd'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 138113
        mmTop = 24606
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'lblSaldoFundosVlrBruto'
        Caption = 'Valor Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 196321
        mmTop = 24606
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'lblSaldoFundosIOF'
        Caption = 'IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 227542
        mmTop = 24606
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'lblSaldoFundosIR'
        Caption = 'IRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 247915
        mmTop = 24606
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'lblSaldoFundosSldLiq'
        Caption = 'Saldo Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 266701
        mmTop = 24606
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'LblPlano'
        Caption = 'Consolidado por Fundo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3683
        mmLeft = 247693
        mmTop = 8731
        mmWidth = 35941
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label1'
        Caption = 'Saldo dos Fundos de Investimento -'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 60452
        BandType = 0
      end
      object ppLabel29: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa6'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel113: TppLabel
        UserName = 'ppLabel113'
        Caption = 'TODOS OS PLANOS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3683
        mmLeft = 252814
        mmTop = 14023
        mmWidth = 30819
        BandType = 0
      end
      object pplblSaldoFundosConDataRef: TppLabel
        UserName = 'LPeriodo6'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DbLogo6'
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
      object ppLabel32: TppLabel
        UserName = 'Label2'
        Caption = 'Qtd. Bloqueada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2921
        mmLeft = 162454
        mmTop = 24606
        mmWidth = 17992
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCTIPOFUNDOINV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 87313
        mmTop = 8731
        mmWidth = 94192
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'sSaldoFundosDet'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBSaldoFundosFundo'
        DataField = 'DESCFUNDOINVEST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 2910
        mmLeft = 794
        mmTop = 0
        mmWidth = 111654
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBSaldoFundosQTD'
        DataField = 'SALDOQTDCOTAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 120915
        mmTop = 0
        mmWidth = 30734
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBSaldoFundosVlrBruto'
        DataField = 'SALDOVLRFUNDO'
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 180975
        mmTop = 0
        mmWidth = 28575
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBSaldoFundosIOF'
        DataField = 'VLRIOFPROV'
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 209815
        mmTop = 0
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBSaldoFundosIR'
        DataField = 'VLRIRPROV'
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 232040
        mmTop = 0
        mmWidth = 21697
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBSaldoFundosSldLiq'
        DataField = 'SALDOLIQUIDO'
        DisplayFormat = '#,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 254265
        mmTop = 0
        mmWidth = 28575
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText2'
        DataField = 'SALDOQTDCOTASBLQ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 151871
        mmTop = 0
        mmWidth = 28575
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel33: TppLabel
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
        mmWidth = 283898
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
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
        mmLeft = 794
        mmTop = 3175
        mmWidth = 283898
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmLeft = 245534
        mmTop = 2910
        mmWidth = 38629
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object ppLabel34: TppLabel
        UserName = 'Label72'
        Caption = 'Saldo Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 794
        mmTop = 3969
        mmWidth = 13123
        BandType = 7
      end
      object ppDBCalc21: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'SALDOVLRFUNDO'
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 180975
        mmTop = 3969
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc22: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'VLRIOFPROV'
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 209815
        mmTop = 3969
        mmWidth = 21696
        BandType = 7
      end
      object ppDBCalc23: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'VLRIRPROV'
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 232040
        mmTop = 3969
        mmWidth = 21696
        BandType = 7
      end
      object ppDBCalc24: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'SALDOLIQUIDO'
        DisplayFormat = '#,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 254265
        mmTop = 3969
        mmWidth = 28575
        BandType = 7
      end
      object ppLine11: TppLine
        UserName = 'Line35'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 2381
        mmWidth = 284300
        BandType = 7
      end
      object ppLine12: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 7938
        mmWidth = 284300
        BandType = 7
      end
      object ppDBCalc25: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'SALDOQTDCOTASBLQ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 151871
        mmTop = 3969
        mmWidth = 28575
        BandType = 7
      end
      object ppDBCalc26: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'SALDOQTDCOTAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 120915
        mmTop = 3969
        mmWidth = 30692
        BandType = 7
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DESCTIPOFUNDOINV'
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
