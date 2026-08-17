inherited dtmRelRetroRegional: TdtmRelRetroRegional
  Left = 371
  Top = 46
  Width = 463
  Height = 408
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    CloseDataSource = True
    Left = 280
  end
  inherited dsExemplo: TwwDataSource
    Left = 157
  end
  inherited qryExemplo: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'select distinct decode(rpv.flgtpretroativo,'
      '              '#39'MS'#39','#39'Mudança de Salário'#39','
      '              '#39'EC'#39','#39'Mudança Retroativa de Regra'#39','
      '              '#39'CM'#39','#39'Correção do salário de mantido'#39','
      '              '#39'CP'#39','#39'Correção do salário de mantido parcial'#39','
      '              '#39'CI'#39','#39'Cobrança ou pagamento indevido'#39','
      '              '#39'RB'#39','#39'Revisão de benefício'#39','
      '              '#39'MB'#39','#39'Mudança de Benefício'#39') flgtpretroativo,'
      'rpv.mesrefini, rpv.mesreffim, rpv.dtcobranca, rpv.dataret,'
      'p.nome, e.idestab, rpv.idretroativo'
      
        'from pessoa p, elegpatro e, retroativoprev rpv, retroativoxpess ' +
        'rxp'
      'where rpv.idretroativo = :idretroativo'
      'and rxp.idretroativo = rpv.idretroativo'
      'and e.idpessjur = rxp.idpessjur'
      'and e.idpessoa = rxp.idpessoa'
      'and p.idpessoa = e.idestab'
      'order by p.nome')
    Left = 43
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idretroativo'
        ParamType = ptUnknown
        Value = 162
      end>
  end
  inherited rpExemplo: TppReport
    PrinterSetup.mmMarginBottom = 19050
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    Left = 380
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      BeforePrint = HeaderBand1BeforePrint
      mmHeight = 25400
      inherited LblEmpresa: TppLabel [1]
      end
      inherited Line1: TppLine [2]
        mmTop = 14552
        mmWidth = 197379
      end
      object rpExemploLabel11: TppLabel
        UserName = 'rpExemploLabel11'
        AutoSize = False
        Caption = 'Data do Retroativo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 2381
        mmTop = 20108
        mmWidth = 28310
        BandType = 0
      end
      object ppdbDataRetro: TppDBText
        UserName = 'dbDataRetro'
        DataField = 'DATARET'
        DataPipeline = pplExemplo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExemplo'
        mmHeight = 3704
        mmLeft = 31485
        mmTop = 20108
        mmWidth = 20373
        BandType = 0
      end
      object rpExemploLabel10: TppLabel
        UserName = 'rpExemploLabel10'
        AutoSize = False
        Caption = 'Data de Cobrança:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 54504
        mmTop = 20108
        mmWidth = 28046
        BandType = 0
      end
      object ppdbDataCob: TppDBText
        UserName = 'dbDataCob'
        DataField = 'DTCOBRANCA'
        DataPipeline = pplExemplo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExemplo'
        mmHeight = 3704
        mmLeft = 83873
        mmTop = 20108
        mmWidth = 20373
        BandType = 0
      end
      object rpExemploLabel8: TppLabel
        UserName = 'rpExemploLabel8'
        AutoSize = False
        Caption = 'Mês de Início:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 106627
        mmTop = 20108
        mmWidth = 21431
        BandType = 0
      end
      object ppdbMesIni: TppDBText
        UserName = 'dbMesIni'
        DataField = 'MESREFINI'
        DataPipeline = pplExemplo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExemplo'
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 20108
        mmWidth = 16673
        BandType = 0
      end
      object rpExemploLabel9: TppLabel
        UserName = 'rpExemploLabel9'
        AutoSize = False
        Caption = 'Mês Final:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 20108
        mmWidth = 16140
        BandType = 0
      end
      object ppdbMesFim: TppDBText
        UserName = 'dbMesFim'
        DataField = 'MESREFFIM'
        DataPipeline = pplExemplo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplExemplo'
        mmHeight = 3704
        mmLeft = 165629
        mmTop = 20108
        mmWidth = 16673
        BandType = 0
      end
      object rpExemploLine1: TppLine
        UserName = 'rpExemploLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24606
        mmWidth = 197379
        BandType = 0
      end
      object pplTipoRetroReg: TppLabel
        UserName = 'lTipoRetroReg'
        Caption = 'lTipoRetroReg'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2381
        mmTop = 15610
        mmWidth = 19315
        BandType = 0
      end
    end
    inherited DetailBand1: TppDetailBand
      AfterPrint = DetailBand1AfterPrint
      BeforePrint = DetailBand1BeforePrint
      PrintHeight = phDynamic
      mmHeight = 9525
      object srepContribPartRegional: TppSubReport
        UserName = 'srepContribPartRegional'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppbdeRegContribPart'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpExemploChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppbdeRegContribPart
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 19050
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297127
          PrinterSetup.mmPaperWidth = 210079
          PrinterSetup.PaperSize = 9
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppbdeRegContribPart'
          object rpExemploChildReport3TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6350
            mmPrintPosition = 0
            object pplGrupoContrib: TppLabel
              UserName = 'pplGrupoContrib'
              Caption = 'CONTRIBUIÇÃO PARTICIPANTE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 12700
              mmTop = 2117
              mmWidth = 50800
              BandType = 1
            end
          end
          object rpExemploChildReport3DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppdbtNomeContribPartReg: TppDBText
              UserName = 'ppdbtNomeContribPartReg'
              DataField = 'NOME'
              DataPipeline = ppbdeRegContribPart
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppbdeRegContribPart'
              mmHeight = 4233
              mmLeft = 15610
              mmTop = 0
              mmWidth = 95250
              BandType = 4
            end
            object ppdbtValorContribPartReg: TppDBText
              UserName = 'ppdbtValorContribPartReg'
              BlankWhenZero = True
              DataField = 'VALOR'
              DataPipeline = ppbdeRegContribPart
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdeRegContribPart'
              mmHeight = 4233
              mmLeft = 139171
              mmTop = 0
              mmWidth = 15875
              BandType = 4
            end
          end
          object rpExemploChildReport3SummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 7673
            mmPrintPosition = 0
            object rpExemploChildReport3Line1: TppLine
              UserName = 'rpExemploChildReport3Line1'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 111125
              mmTop = 265
              mmWidth = 50006
              BandType = 7
            end
            object pplTotalPartRegional: TppLabel
              UserName = 'pplTotalPartRegional'
              AutoSize = False
              Caption = 'Total:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 120650
              mmTop = 1323
              mmWidth = 10583
              BandType = 7
            end
            object ppdbcTotalPartReg: TppDBCalc
              UserName = 'ppdbcTotalPartReg'
              DataField = 'VALOR'
              DataPipeline = ppbdeRegContribPart
              DisplayFormat = 'R$ #,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppbdeRegContribPart'
              mmHeight = 4233
              mmLeft = 139171
              mmTop = 1323
              mmWidth = 15875
              BandType = 7
            end
            object rpExemploChildReport3Line2: TppLine
              UserName = 'rpExemploChildReport3Line2'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 7408
              mmTop = 6615
              mmWidth = 153723
              BandType = 7
            end
          end
        end
      end
      object srepContribPatroRegional: TppSubReport
        UserName = 'srepContribPatroRegional'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = srepContribPartRegional
        TraverseAllData = False
        DataPipelineName = 'ppbdeRegContribPatroInd'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 4498
        mmWidth = 197379
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpExemploChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppbdeRegContribPatroInd
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 19050
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297127
          PrinterSetup.mmPaperWidth = 210079
          PrinterSetup.PaperSize = 9
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppbdeRegContribPatroInd'
          object rpExemploChildReport1TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6350
            mmPrintPosition = 0
            object rpExemploChildReport1Label1: TppLabel
              UserName = 'rpExemploChildReport1Label1'
              Caption = 'CONTRIBUIÇÃO PATROCINADORA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 12700
              mmTop = 1852
              mmWidth = 55827
              BandType = 1
            end
          end
          object rpExemploChildReport1DetailBand1: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 9790
            mmPrintPosition = 0
            object srepContribPatroIndRegional: TppSubReport
              UserName = 'srepContribPatroIndRegional'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'ppbdeRegContribPatroInd'
              mmHeight = 5027
              mmLeft = 0
              mmTop = 0
              mmWidth = 197379
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object rpExemploChildReport4: TppChildReport
                AutoStop = False
                DataPipeline = ppbdeRegContribPatroInd
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'PpModeloReport1'
                PrinterSetup.PaperName = 'A4 210 x 297 mm'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 19050
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 297127
                PrinterSetup.mmPaperWidth = 210079
                PrinterSetup.PaperSize = 9
                Version = '7.04'
                mmColumnWidth = 0
                DataPipelineName = 'ppbdeRegContribPatroInd'
                object rpExemploChildReport4TitleBand1: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object rpExemploChildReport4DetailBand1: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 4233
                  mmPrintPosition = 0
                  object ppdbtNomeContribPatroIndReg: TppDBText
                    UserName = 'ppdbtNomeContribPatroIndReg'
                    DataField = 'NOME'
                    DataPipeline = ppbdeRegContribPatroInd
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppbdeRegContribPatroInd'
                    mmHeight = 4233
                    mmLeft = 15611
                    mmTop = 0
                    mmWidth = 95250
                    BandType = 4
                  end
                  object ppdbtValorContribPatroIndReg: TppDBText
                    UserName = 'ppdbtValorContribPatroIndReg'
                    BlankWhenZero = True
                    DataField = 'VALOR'
                    DataPipeline = ppbdeRegContribPatroInd
                    DisplayFormat = 'R$ #,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppbdeRegContribPatroInd'
                    mmHeight = 4233
                    mmLeft = 139172
                    mmTop = 0
                    mmWidth = 15875
                    BandType = 4
                  end
                end
                object rpExemploChildReport4SummaryBand1: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
            object srepContribPatroColRegional: TppSubReport
              UserName = 'srepContribPatroColRegional'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              ShiftRelativeTo = srepContribPatroIndRegional
              TraverseAllData = False
              DataPipelineName = 'ppbdeRegContribPatroCol'
              mmHeight = 5027
              mmLeft = 0
              mmTop = 4763
              mmWidth = 197379
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object rpExemploChildReport5: TppChildReport
                AutoStop = False
                DataPipeline = ppbdeRegContribPatroCol
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'PpModeloReport1'
                PrinterSetup.PaperName = 'A4 210 x 297 mm'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 19050
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 297127
                PrinterSetup.mmPaperWidth = 210079
                PrinterSetup.PaperSize = 9
                Version = '7.04'
                mmColumnWidth = 0
                DataPipelineName = 'ppbdeRegContribPatroCol'
                object rpExemploChildReport5TitleBand1: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
                object rpExemploChildReport5DetailBand1: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 4233
                  mmPrintPosition = 0
                  object ppdbtNomeContribPatroColReg: TppDBText
                    UserName = 'ppdbtNomeContribPatroColReg'
                    AutoSize = True
                    DataField = 'NOME'
                    DataPipeline = ppbdeRegContribPatroInd
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    Transparent = True
                    DataPipelineName = 'ppbdeRegContribPatroInd'
                    mmHeight = 3969
                    mmLeft = 15610
                    mmTop = 0
                    mmWidth = 10583
                    BandType = 4
                  end
                  object ppdbtValorContribPatroColReg: TppDBText
                    UserName = 'ppdbtValorContribPatroColReg'
                    BlankWhenZero = True
                    DataField = 'VALOR'
                    DataPipeline = ppbdeRegContribPatroCol
                    DisplayFormat = 'R$ #,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppbdeRegContribPatroCol'
                    mmHeight = 4233
                    mmLeft = 139172
                    mmTop = 0
                    mmWidth = 15875
                    BandType = 4
                  end
                end
                object rpExemploChildReport5SummaryBand1: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 0
                  mmPrintPosition = 0
                end
              end
            end
          end
          object rpExemploChildReport1SummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 7673
            mmPrintPosition = 0
            object rpExemploChildReport1Line1: TppLine
              UserName = 'rpExemploChildReport1Line1'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 111125
              mmTop = 265
              mmWidth = 50006
              BandType = 7
            end
            object rpExemploChildReport1Label2: TppLabel
              UserName = 'rpExemploChildReport1Label2'
              AutoSize = False
              Caption = 'Total:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 120650
              mmTop = 1323
              mmWidth = 10583
              BandType = 7
            end
            object pplTotalRegPatro: TppLabel
              OnPrint = pplTotalRegPatroPrint
              UserName = 'pplTotalRegPatro'
              Caption = 'pplTotalRegPatro'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 127529
              mmTop = 1323
              mmWidth = 27517
              BandType = 7
            end
            object ppdbcTotalRegPatroInd: TppDBCalc
              UserName = 'ppdbcTotalRegPatroInd'
              DataField = 'VALOR'
              DataPipeline = ppbdeRegContribPatroInd
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'ppbdeRegContribPatroInd'
              mmHeight = 4233
              mmLeft = 12171
              mmTop = 794
              mmWidth = 15875
              BandType = 7
            end
            object ppdbcTotalRegPatroCol: TppDBCalc
              UserName = 'ppdbcTotalRegPatroCol'
              DataField = 'VALOR'
              DataPipeline = ppbdeRegContribPatroCol
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'ppbdeRegContribPatroCol'
              mmHeight = 4233
              mmLeft = 33073
              mmTop = 794
              mmWidth = 15875
              BandType = 7
            end
          end
        end
      end
    end
    inherited FooterBand1: TppFooterBand
      mmHeight = 5821
      inherited LblSistema: TppLabel [0]
        AutoSize = True
        Caption = 'Administração Previdenciária - Cálculo Retroativo'
        mmLeft = 1323
        mmTop = 2116
        mmWidth = 74613
      end
      inherited Calc2: TppSystemVariable [1]
        mmLeft = 81755
        mmTop = 2116
        mmWidth = 69586
      end
      inherited Line2: TppLine [2]
        mmHeight = 794
        mmTop = 0
        mmWidth = 197379
      end
      inherited Calc1: TppSystemVariable
        mmLeft = 168275
        mmTop = 2116
        mmWidth = 26195
      end
    end
    object rpExemploSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object srepTotal: TppSubReport
        UserName = 'srepTotal'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        ResetPageNo = False
        TraverseAllData = False
        DataPipelineName = 'ppbdeTotContribPart'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpExemploChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppbdeTotContribPart
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 19050
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297127
          PrinterSetup.mmPaperWidth = 210079
          PrinterSetup.PaperSize = 9
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppbdeTotContribPart'
          object rpExemploChildReport2HeaderBand1: TppHeaderBand
            BeforePrint = rpExemploChildReport2HeaderBand1BeforePrint
            mmBottomOffset = 0
            mmHeight = 29369
            mmPrintPosition = 0
            object pplTipoRetroResumo: TppLabel
              UserName = 'pplTipoRetroResumo'
              Caption = 'pplTipoRetroResumo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 4498
              mmTop = 14552
              mmWidth = 28310
              BandType = 0
            end
            object rpExemploChildReport2Label3: TppLabel
              UserName = 'rpExemploChildReport2Label3'
              Caption = 'RESUMO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              mmHeight = 4233
              mmLeft = 7144
              mmTop = 24871
              mmWidth = 15081
              BandType = 0
            end
            object LblEmpresa2: TppLabel
              OnPrint = LblEmpresaPrint
              UserName = 'LblEmpresa2'
              Caption = 'LblEmpresa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 14
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5821
              mmLeft = 86254
              mmTop = 529
              mmWidth = 29633
              BandType = 0
            end
            object lbltitulo2: TppLabel
              UserName = 'lbltitulo2'
              Caption = 'Título do Relatório'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5027
              mmLeft = 265
              mmTop = 7673
              mmWidth = 197380
              BandType = 0
            end
            object rpExemploChildReport2Label6: TppLabel
              UserName = 'rpExemploChildReport2Label6'
              AutoSize = False
              Caption = 'Data do Retroativo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 4498
              mmTop = 19050
              mmWidth = 28575
              BandType = 0
            end
            object rpExemploChildReport2DBText1: TppDBText
              UserName = 'rpExemploChildReport2DBText1'
              DataField = 'DATARET'
              DataPipeline = pplExemplo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplExemplo'
              mmHeight = 3704
              mmLeft = 33867
              mmTop = 19050
              mmWidth = 20373
              BandType = 0
            end
            object rpExemploChildReport2Label7: TppLabel
              UserName = 'rpExemploChildReport2Label7'
              AutoSize = False
              Caption = 'Data de Cobrança:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 56621
              mmTop = 19050
              mmWidth = 28046
              BandType = 0
            end
            object rpExemploChildReport2DBText2: TppDBText
              UserName = 'rpExemploChildReport2DBText2'
              DataField = 'DTCOBRANCA'
              DataPipeline = pplExemplo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplExemplo'
              mmHeight = 3704
              mmLeft = 85990
              mmTop = 19050
              mmWidth = 20373
              BandType = 0
            end
            object rpExemploChildReport2Label8: TppLabel
              UserName = 'rpExemploChildReport2Label8'
              AutoSize = False
              Caption = 'Mês de Início:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 108744
              mmTop = 19050
              mmWidth = 21431
              BandType = 0
            end
            object rpExemploChildReport2DBText3: TppDBText
              UserName = 'rpExemploChildReport2DBText3'
              DataField = 'MESREFINI'
              DataPipeline = pplExemplo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplExemplo'
              mmHeight = 3704
              mmLeft = 131763
              mmTop = 19050
              mmWidth = 16673
              BandType = 0
            end
            object rpExemploChildReport2Label9: TppLabel
              UserName = 'rpExemploChildReport2Label9'
              AutoSize = False
              Caption = 'Mês Final:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 149754
              mmTop = 19050
              mmWidth = 16140
              BandType = 0
            end
            object rpExemploChildReport2DBText4: TppDBText
              UserName = 'rpExemploChildReport2DBText4'
              DataField = 'MESREFFIM'
              DataPipeline = pplExemplo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplExemplo'
              mmHeight = 3704
              mmLeft = 167746
              mmTop = 19050
              mmWidth = 16669
              BandType = 0
            end
            object rpExemploChildReport2Line4: TppLine
              UserName = 'rpExemploChildReport2Line4'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 23813
              mmWidth = 197379
              BandType = 0
            end
            object rpExemploChildReport2Line5: TppLine
              UserName = 'rpExemploChildReport2Line5'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 13494
              mmWidth = 197379
              BandType = 0
            end
          end
          object rpExemploChildReport2DetailBand1: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 9790
            mmPrintPosition = 0
            object srepContribPartTotal: TppSubReport
              UserName = 'srepContribPartTotal'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'ppbdeTotContribPart'
              mmHeight = 5027
              mmLeft = 0
              mmTop = 0
              mmWidth = 197379
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object rpExemploChildReport2ChildReport1: TppChildReport
                AutoStop = False
                DataPipeline = ppbdeTotContribPart
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'PpModeloReport1'
                PrinterSetup.PaperName = 'A4 210 x 297 mm'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 19050
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 297127
                PrinterSetup.mmPaperWidth = 210079
                PrinterSetup.PaperSize = 9
                Version = '7.04'
                mmColumnWidth = 0
                DataPipelineName = 'ppbdeTotContribPart'
                object rpExemploChildReport2TitleBand2: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 6350
                  mmPrintPosition = 0
                  object rpExemploChildReport2Label1: TppLabel
                    UserName = 'rpExemploChildReport2Label1'
                    Caption = 'CONTRIBUIÇÃO PARTICIPANTE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 4233
                    mmLeft = 12700
                    mmTop = 2117
                    mmWidth = 50800
                    BandType = 1
                  end
                end
                object rpExemploChildReport2DetailBand2: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 4233
                  mmPrintPosition = 0
                  object ppdbtNomeContribPartTot: TppDBText
                    UserName = 'ppdbtNomeContribPartTot'
                    DataField = 'NOME'
                    DataPipeline = ppbdeTotContribPart
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppbdeTotContribPart'
                    mmHeight = 4233
                    mmLeft = 15611
                    mmTop = 0
                    mmWidth = 95250
                    BandType = 4
                  end
                  object ppdbtValorContribPartTot: TppDBText
                    UserName = 'ppdbtValorContribPartTot'
                    BlankWhenZero = True
                    DataField = 'VALOR'
                    DataPipeline = ppbdeTotContribPart
                    DisplayFormat = 'R$ #,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppbdeTotContribPart'
                    mmHeight = 4233
                    mmLeft = 139172
                    mmTop = 0
                    mmWidth = 15875
                    BandType = 4
                  end
                end
                object rpExemploChildReport2SummaryBand2: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 7673
                  mmPrintPosition = 0
                  object rpExemploChildReport2ChildReport1Line1: TppLine
                    UserName = 'rpExemploChildReport2ChildReport1Line1'
                    Weight = 0.75
                    mmHeight = 1058
                    mmLeft = 111125
                    mmTop = 264
                    mmWidth = 50005
                    BandType = 7
                  end
                  object rpExemploChildReport2ChildReport1Label1: TppLabel
                    UserName = 'rpExemploChildReport2ChildReport1Label1'
                    AutoSize = False
                    Caption = 'Total:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 4233
                    mmLeft = 120650
                    mmTop = 1058
                    mmWidth = 10583
                    BandType = 7
                  end
                  object rpExemploChildReport2ChildReport1DBCalc1: TppDBCalc
                    UserName = 'rpExemploChildReport2ChildReport1DBCalc1'
                    DataField = 'VALOR'
                    DataPipeline = ppbdeTotContribPart
                    DisplayFormat = 'R$ #,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'ppbdeTotContribPart'
                    mmHeight = 4233
                    mmLeft = 139172
                    mmTop = 1058
                    mmWidth = 15875
                    BandType = 7
                  end
                  object rpExemploChildReport2ChildReport1Line2: TppLine
                    UserName = 'rpExemploChildReport2ChildReport1Line2'
                    Weight = 0.75
                    mmHeight = 1058
                    mmLeft = 7409
                    mmTop = 6614
                    mmWidth = 153724
                    BandType = 7
                  end
                end
              end
            end
            object srepContribPatroTotal: TppSubReport
              UserName = 'srepContribPatroTotal'
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              ShiftRelativeTo = srepContribPartTotal
              TraverseAllData = False
              DataPipelineName = 'ppbdeTotContribPatroInd'
              mmHeight = 5027
              mmLeft = 0
              mmTop = 4763
              mmWidth = 197379
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object rpExemploChildReport6: TppChildReport
                AutoStop = False
                DataPipeline = ppbdeTotContribPatroInd
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'PpModeloReport1'
                PrinterSetup.PaperName = 'A4 210 x 297 mm'
                PrinterSetup.PrinterName = 'Default'
                PrinterSetup.mmMarginBottom = 19050
                PrinterSetup.mmMarginLeft = 6350
                PrinterSetup.mmMarginRight = 6350
                PrinterSetup.mmMarginTop = 6350
                PrinterSetup.mmPaperHeight = 297127
                PrinterSetup.mmPaperWidth = 210079
                PrinterSetup.PaperSize = 9
                Version = '7.04'
                mmColumnWidth = 0
                DataPipelineName = 'ppbdeTotContribPatroInd'
                object rpExemploChildReport6TitleBand1: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 6350
                  mmPrintPosition = 0
                  object rpExemploChildReport2Label2: TppLabel
                    UserName = 'rpExemploChildReport2Label2'
                    Caption = 'CONTRIBUIÇÃO PATROCINADORA'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 4233
                    mmLeft = 12700
                    mmTop = 2117
                    mmWidth = 55827
                    BandType = 1
                  end
                end
                object rpExemploChildReport6DetailBand1: TppDetailBand
                  PrintHeight = phDynamic
                  mmBottomOffset = 0
                  mmHeight = 9790
                  mmPrintPosition = 0
                  object srepContribPatroIndTotal: TppSubReport
                    UserName = 'srepContribPatroIndTotal'
                    ExpandAll = False
                    NewPrintJob = False
                    OutlineSettings.CreateNode = True
                    TraverseAllData = False
                    DataPipelineName = 'ppbdeTotContribPatroInd'
                    mmHeight = 5027
                    mmLeft = 0
                    mmTop = 0
                    mmWidth = 197379
                    BandType = 4
                    mmBottomOffset = 0
                    mmOverFlowOffset = 0
                    mmStopPosition = 0
                    object rpExemploChildReport2ChildReport2: TppChildReport
                      AutoStop = False
                      DataPipeline = ppbdeTotContribPatroInd
                      PrinterSetup.BinName = 'Default'
                      PrinterSetup.DocumentName = 'PpModeloReport1'
                      PrinterSetup.PaperName = 'A4 210 x 297 mm'
                      PrinterSetup.PrinterName = 'Default'
                      PrinterSetup.mmMarginBottom = 19050
                      PrinterSetup.mmMarginLeft = 6350
                      PrinterSetup.mmMarginRight = 6350
                      PrinterSetup.mmMarginTop = 6350
                      PrinterSetup.mmPaperHeight = 297127
                      PrinterSetup.mmPaperWidth = 210079
                      PrinterSetup.PaperSize = 9
                      Version = '7.04'
                      mmColumnWidth = 0
                      DataPipelineName = 'ppbdeTotContribPatroInd'
                      object rpExemploChildReport2TitleBand3: TppTitleBand
                        mmBottomOffset = 0
                        mmHeight = 0
                        mmPrintPosition = 0
                      end
                      object rpExemploChildReport2DetailBand3: TppDetailBand
                        mmBottomOffset = 0
                        mmHeight = 4233
                        mmPrintPosition = 0
                        object ppdbtNomeContribPatroIndTot: TppDBText
                          UserName = 'ppdbtNomeContribPatroIndTot'
                          DataField = 'NOME'
                          DataPipeline = ppbdeTotContribPatroInd
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 10
                          Font.Style = []
                          Transparent = True
                          DataPipelineName = 'ppbdeTotContribPatroInd'
                          mmHeight = 4233
                          mmLeft = 15611
                          mmTop = 0
                          mmWidth = 95250
                          BandType = 4
                        end
                        object ppdbtValorContribPatroIndTot: TppDBText
                          UserName = 'ppdbtValorContribPatroIndTot'
                          BlankWhenZero = True
                          DataField = 'VALOR'
                          DataPipeline = ppbdeTotContribPatroInd
                          DisplayFormat = 'R$ #,##0.00'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 10
                          Font.Style = []
                          ParentDataPipeline = False
                          TextAlignment = taRightJustified
                          Transparent = True
                          DataPipelineName = 'ppbdeTotContribPatroInd'
                          mmHeight = 4233
                          mmLeft = 139172
                          mmTop = 0
                          mmWidth = 15875
                          BandType = 4
                        end
                      end
                      object rpExemploChildReport2SummaryBand3: TppSummaryBand
                        mmBottomOffset = 0
                        mmHeight = 0
                        mmPrintPosition = 0
                      end
                    end
                  end
                  object srepContribPatroColTotal: TppSubReport
                    UserName = 'srepContribPatroColTotal'
                    ExpandAll = False
                    NewPrintJob = False
                    OutlineSettings.CreateNode = True
                    ShiftRelativeTo = srepContribPatroIndTotal
                    TraverseAllData = False
                    DataPipelineName = 'ppbdeTotContribPatroCol'
                    mmHeight = 5027
                    mmLeft = 0
                    mmTop = 4763
                    mmWidth = 197379
                    BandType = 4
                    mmBottomOffset = 0
                    mmOverFlowOffset = 0
                    mmStopPosition = 0
                    object rpExemploChildReport2ChildReport3: TppChildReport
                      AutoStop = False
                      DataPipeline = ppbdeTotContribPatroCol
                      PrinterSetup.BinName = 'Default'
                      PrinterSetup.DocumentName = 'PpModeloReport1'
                      PrinterSetup.PaperName = 'A4 210 x 297 mm'
                      PrinterSetup.PrinterName = 'Default'
                      PrinterSetup.mmMarginBottom = 19050
                      PrinterSetup.mmMarginLeft = 6350
                      PrinterSetup.mmMarginRight = 6350
                      PrinterSetup.mmMarginTop = 6350
                      PrinterSetup.mmPaperHeight = 297127
                      PrinterSetup.mmPaperWidth = 210079
                      PrinterSetup.PaperSize = 9
                      Version = '7.04'
                      mmColumnWidth = 0
                      DataPipelineName = 'ppbdeTotContribPatroCol'
                      object rpExemploChildReport2TitleBand4: TppTitleBand
                        mmBottomOffset = 0
                        mmHeight = 0
                        mmPrintPosition = 0
                      end
                      object rpExemploChildReport2DetailBand4: TppDetailBand
                        mmBottomOffset = 0
                        mmHeight = 4233
                        mmPrintPosition = 0
                        object ppdbtNomeContribPatroColTot: TppDBText
                          UserName = 'ppdbtNomeContribPatroColTot'
                          DataField = 'NOME'
                          DataPipeline = ppbdeTotContribPatroCol
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 10
                          Font.Style = []
                          Transparent = True
                          DataPipelineName = 'ppbdeTotContribPatroCol'
                          mmHeight = 4233
                          mmLeft = 15611
                          mmTop = 0
                          mmWidth = 95250
                          BandType = 4
                        end
                        object ppdbtValorContribPatroColTot: TppDBText
                          UserName = 'ppdbtValorContribPatroColTot'
                          BlankWhenZero = True
                          DataField = 'VALOR'
                          DataPipeline = ppbdeTotContribPatroCol
                          DisplayFormat = 'R$ #,##0.00'
                          Font.Charset = DEFAULT_CHARSET
                          Font.Color = clBlack
                          Font.Name = 'Arial'
                          Font.Size = 10
                          Font.Style = []
                          ParentDataPipeline = False
                          TextAlignment = taRightJustified
                          Transparent = True
                          DataPipelineName = 'ppbdeTotContribPatroCol'
                          mmHeight = 4233
                          mmLeft = 139172
                          mmTop = 0
                          mmWidth = 32015
                          BandType = 4
                        end
                      end
                      object rpExemploChildReport2SummaryBand4: TppSummaryBand
                        mmBottomOffset = 0
                        mmHeight = 0
                        mmPrintPosition = 0
                      end
                    end
                  end
                end
                object rpExemploChildReport6SummaryBand1: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 7673
                  mmPrintPosition = 0
                  object pplTotalPatro: TppLabel
                    OnPrint = pplTotalPatroPrint
                    UserName = 'pplTotalPatro'
                    Caption = 'pplTotalPatro'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    mmHeight = 3969
                    mmLeft = 133879
                    mmTop = 1323
                    mmWidth = 21167
                    BandType = 7
                  end
                  object rpExemploChildReport6Line1: TppLine
                    UserName = 'rpExemploChildReport6Line1'
                    Weight = 0.75
                    mmHeight = 1058
                    mmLeft = 113242
                    mmTop = 265
                    mmWidth = 50006
                    BandType = 7
                  end
                  object rpExemploChildReport6Label2: TppLabel
                    UserName = 'rpExemploChildReport6Label2'
                    AutoSize = False
                    Caption = 'Total:'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    Transparent = True
                    mmHeight = 4233
                    mmLeft = 120650
                    mmTop = 1323
                    mmWidth = 10583
                    BandType = 7
                  end
                  object ppdbcTotalPatroCol: TppDBCalc
                    UserName = 'ppdbcTotalPatroCol'
                    DataField = 'VALOR'
                    DataPipeline = ppbdeTotContribPatroCol
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    ParentDataPipeline = False
                    TextAlignment = taRightJustified
                    Transparent = True
                    Visible = False
                    DataPipelineName = 'ppbdeTotContribPatroCol'
                    mmHeight = 4233
                    mmLeft = 33073
                    mmTop = 794
                    mmWidth = 15875
                    BandType = 7
                  end
                  object ppdbcTotalPatroInd: TppDBCalc
                    UserName = 'ppdbcTotalPatroInd'
                    DataField = 'VALOR'
                    DataPipeline = ppbdeTotContribPatroInd
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 10
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    Visible = False
                    DataPipelineName = 'ppbdeTotContribPatroInd'
                    mmHeight = 4233
                    mmLeft = 12171
                    mmTop = 794
                    mmWidth = 15875
                    BandType = 7
                  end
                end
              end
            end
          end
          object rpExemploChildReport2FooterBand1: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object rpExemploChildReport2Line1: TppLine
              UserName = 'rpExemploChildReport2Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 0
              mmWidth = 197379
              BandType = 8
            end
            object rpExemploChildReport2Label5: TppLabel
              OnPrint = LblSistemaPrint
              UserName = 'rpExemploChildReport2Label5'
              Caption = 'Administração Previdenciária - Cálculo Retroativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 3440
              mmTop = 2116
              mmWidth = 74613
              BandType = 8
            end
            object rpExemploChildReport2Calc1: TppSystemVariable
              UserName = 'rpExemploChildReport2Calc1'
              VarType = vtPageSetDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 83873
              mmTop = 2117
              mmWidth = 69586
              BandType = 8
            end
            object rpExemploChildReport2Calc2: TppSystemVariable
              UserName = 'rpExemploChildReport2Calc2'
              VarType = vtDateTime
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 170392
              mmTop = 2117
              mmWidth = 26194
              BandType = 8
            end
          end
          object rpExemploChildReport2SummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 9525
            mmPrintPosition = 0
            object rpExemploChildReport2Label4: TppLabel
              UserName = 'rpExemploChildReport2Label4'
              Caption = 'Total Geral:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              Transparent = True
              mmHeight = 4763
              mmLeft = 105304
              mmTop = 2117
              mmWidth = 21167
              BandType = 7
            end
            object pplValorTotal: TppLabel
              UserName = 'pplValorTotal'
              AutoSize = False
              Caption = 'pplValorTotal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4763
              mmLeft = 129911
              mmTop = 2117
              mmWidth = 31750
              BandType = 7
            end
            object rpExemploChildReport2Line3: TppLine
              UserName = 'rpExemploChildReport2Line3'
              Weight = 0.75
              mmHeight = 794
              mmLeft = 88636
              mmTop = 265
              mmWidth = 82815
              BandType = 7
            end
            object rpExemploChildReport2Line2: TppLine
              UserName = 'rpExemploChildReport2Line2'
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 8467
              mmWidth = 197644
              BandType = 7
            end
          end
        end
      end
    end
    object rpExemploGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = pplExemplo
      OutlineSettings.CreateNode = True
      UserName = 'rpExemploGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplExemplo'
      object rpExemploGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object pplRegional: TppLabel
          UserName = 'lRegional'
          AutoSize = False
          Caption = 'REGIONAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 6350
          mmTop = 0
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppdbtRegional: TppDBText
          UserName = 'dbtRegional'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = pplExemplo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplExemplo'
          mmHeight = 3969
          mmLeft = 26988
          mmTop = 0
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
      end
      object rpExemploGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object rpExemploLine2: TppLine
          UserName = 'rpExemploLine2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 96043
          mmTop = 0
          mmWidth = 65088
          BandType = 5
          GroupNo = 0
        end
        object rpExemploLabel1: TppLabel
          UserName = 'rpExemploLabel1'
          AutoSize = False
          Caption = 'Total Regional:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 103981
          mmTop = 1058
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object pplTotalRegional: TppLabel
          OnPrint = pplTotalRegionalPrint
          UserName = 'lTotalRegional'
          Caption = 'lTotalRegional'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 132292
          mmTop = 1058
          mmWidth = 22754
          BandType = 5
          GroupNo = 0
        end
        object rpExemploLine3: TppLine
          UserName = 'rpExemploLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6879
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object dsRegContribPart: TwwDataSource
    DataSet = qryRegContribPart
    Left = 157
    Top = 67
  end
  object qryRegContribPart: TwwQuery
    DatabaseName = 'BASEDADOS'
    DataSource = dsExemplo
    SQL.Strings = (
      'select c.nome, sum(h.valoresperado) as valor'
      'from elegpatro e, hstcontribprev h,'
      '     retroativoprev rpv, retroativoxpess rxp,'
      '     contprev cp, contribuicao c'
      'where rpv.idretroativo = :idretroativo'
      'and e.idpessjur = rpv.idpessjur'
      'and e.idestab = :idestab'
      'and rxp.idretroativo = rpv.idretroativo'
      'and rxp.idpessoa = e.idpessoa'
      'and h.idpessjur = rpv.idpessjur'
      'and h.idpessoa = rxp.idpessoa'
      'and h.idplanoprev = rpv.idplanoprev'
      'and h.seqproposta = 1'
      'and h.idretroativo = rpv.idretroativo'
      'and h.vlrtotretroativo is null'
      'and cp.idcontribuicao = h.idcontribuicao'
      'and cp.idplanoprev = h.idplanoprev'
      'and cp.flgpagador = '#39'C'#39
      'and c.idcontribuicao = h.idcontribuicao'
      'group by c.nome')
    ValidateWithMask = True
    Left = 43
    Top = 67
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRETROATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDESTAB'
        ParamType = ptUnknown
      end>
  end
  object ppbdeRegContribPart: TppBDEPipeline
    DataSource = dsRegContribPart
    CloseDataSource = True
    UserName = 'bdeRegContribPart'
    Left = 279
    Top = 67
  end
  object qryRegContribPatroInd: TwwQuery
    DatabaseName = 'BASEDADOS'
    DataSource = dsExemplo
    SQL.Strings = (
      'select c.nome, sum(h.valoresperado) as valor'
      'from elegpatro e, hstcontribprev h,'
      '     retroativoprev rpv, retroativoxpess rxp,'
      '     contprev cp, contribuicao c'
      'where rpv.idretroativo = :idretroativo'
      'and e.idpessjur = rpv.idpessjur'
      'and e.idestab = :idestab'
      'and rxp.idretroativo = rpv.idretroativo'
      'and rxp.idpessoa = e.idpessoa'
      'and h.idpessjur = rpv.idpessjur'
      'and h.idpessoa = rxp.idpessoa'
      'and h.idplanoprev = rpv.idplanoprev'
      'and h.seqproposta = 1'
      'and h.idretroativo = rpv.idretroativo'
      'and h.vlrtotretroativo is null'
      'and cp.idcontribuicao = h.idcontribuicao'
      'and cp.idplanoprev = h.idplanoprev'
      'and cp.flgpagador = '#39'P'#39
      'and c.idcontribuicao = h.idcontribuicao'
      'group by c.nome')
    ValidateWithMask = True
    Left = 43
    Top = 114
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRETROATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDESTAB'
        ParamType = ptUnknown
      end>
  end
  object dsRegContribPatroInd: TwwDataSource
    DataSet = qryRegContribPatroInd
    Left = 157
    Top = 114
  end
  object ppbdeRegContribPatroInd: TppBDEPipeline
    DataSource = dsRegContribPatroInd
    CloseDataSource = True
    UserName = 'bdeRegContribPatroInd'
    Left = 279
    Top = 114
  end
  object dsTotContribPart: TwwDataSource
    DataSet = qryTotContribPart
    Left = 157
    Top = 206
  end
  object qryTotContribPart: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'select c.nome, sum(h.valoresperado) as valor'
      'from hstcontribprev h, retroativoprev rpv, retroativoxpess rxp,'
      '     contprev cp, contribuicao c'
      'where rpv.idretroativo = :idretroativo'
      'and rxp.idretroativo = rpv.idretroativo'
      'and h.idpessjur = rpv.idpessjur'
      'and h.idpessoa = rxp.idpessoa'
      'and h.idplanoprev = rpv.idplanoprev'
      'and h.seqproposta = 1'
      'and h.idretroativo = rpv.idretroativo'
      'and h.vlrtotretroativo is null'
      'and cp.idcontribuicao = h.idcontribuicao'
      'and cp.idplanoprev = h.idplanoprev'
      'and cp.flgpagador = '#39'C'#39
      'and c.idcontribuicao = h.idcontribuicao'
      'group by c.nome')
    ValidateWithMask = True
    Left = 43
    Top = 206
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idretroativo'
        ParamType = ptUnknown
        Value = 162
      end>
  end
  object ppbdeTotContribPart: TppBDEPipeline
    DataSource = dsTotContribPart
    CloseDataSource = True
    UserName = 'bdeTotContribPart'
    Left = 279
    Top = 206
  end
  object qryTotContribPatroInd: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'select c.nome, sum(h.valoresperado) as valor'
      'from hstcontribprev h, retroativoprev rpv, retroativoxpess rxp,'
      '     contprev cp, contribuicao c'
      'where rpv.idretroativo = :idretroativo'
      'and rxp.idretroativo = rpv.idretroativo'
      'and h.idpessjur = rpv.idpessjur'
      'and h.idpessoa = rxp.idpessoa'
      'and h.idplanoprev = rpv.idplanoprev'
      'and h.seqproposta = 1'
      'and h.idretroativo = rpv.idretroativo'
      'and h.vlrtotretroativo is null'
      'and cp.idcontribuicao = h.idcontribuicao'
      'and cp.idplanoprev = h.idplanoprev'
      'and cp.flgpagador = '#39'P'#39
      'and c.idcontribuicao = h.idcontribuicao'
      'group by c.nome')
    ValidateWithMask = True
    Left = 45
    Top = 253
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idretroativo'
        ParamType = ptUnknown
        Value = 162
      end>
  end
  object dsTotContribPatroInd: TwwDataSource
    DataSet = qryTotContribPatroInd
    Left = 157
    Top = 253
  end
  object ppbdeTotContribPatroInd: TppBDEPipeline
    DataSource = dsTotContribPatroInd
    CloseDataSource = True
    UserName = 'bdeTotContribPatroInd'
    Left = 279
    Top = 253
  end
  object qryRegContribPatroCol: TwwQuery
    DatabaseName = 'BASEDADOS'
    DataSource = dsExemplo
    SQL.Strings = (
      'select c.nome, sum(h.valoresperado) as valor'
      'from elegpatro e, hstcontribprev h,'
      '     retroativoprev rpv, retroativoxpess rxp,'
      '     contprev cp, contribuicao c'
      'where rpv.idretroativo = :idretroativo'
      'and e.idpessjur = rpv.idpessjur'
      'and e.idestab = :idestab'
      'and rxp.idretroativo = rpv.idretroativo'
      'and rxp.idpessoa = e.idpessoa'
      'and h.idpessjur = rpv.idpessjur'
      'and h.idpessoa = rpv.idpessjur'
      'and h.idplanoprev = rpv.idplanoprev'
      'and h.seqproposta = 1'
      'and h.idretroativo = rpv.idretroativo'
      'and h.vlrtotretroativo is null'
      'and cp.idcontribuicao = h.idcontribuicao'
      'and cp.idplanoprev = h.idplanoprev'
      'and cp.flgpagador = '#39'E'#39
      'and c.idcontribuicao = h.idcontribuicao'
      'group by c.nome')
    ValidateWithMask = True
    Left = 43
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRETROATIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDESTAB'
        ParamType = ptUnknown
      end>
  end
  object dsRegContribPatroCol: TwwDataSource
    DataSet = qryRegContribPatroCol
    Left = 157
    Top = 160
  end
  object ppbdeRegContribPatroCol: TppBDEPipeline
    DataSource = dsRegContribPatroCol
    CloseDataSource = True
    UserName = 'bdeRegContribPatroCol'
    Left = 279
    Top = 160
  end
  object qryTotContribPatroCol: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'select c.nome, sum(h.valoresperado) as valor'
      'from hstcontribprev h, retroativoprev rpv, retroativoxpess rxp,'
      '     contprev cp, contribuicao c'
      'where rpv.idretroativo = :idretroativo'
      'and rxp.idretroativo = rpv.idretroativo'
      'and h.idpessjur = rpv.idpessjur'
      'and h.idpessoa = rpv.idpessjur'
      'and h.idplanoprev = rpv.idplanoprev'
      'and h.seqproposta = 1'
      'and h.idretroativo = rpv.idretroativo'
      'and h.vlrtotretroativo is null'
      'and cp.idcontribuicao = h.idcontribuicao'
      'and cp.idplanoprev = h.idplanoprev'
      'and cp.flgpagador = '#39'E'#39
      'and c.idcontribuicao = h.idcontribuicao'
      'group by c.nome')
    ValidateWithMask = True
    Left = 43
    Top = 299
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idretroativo'
        ParamType = ptUnknown
        Value = 162
      end>
  end
  object dsTotContribPatroCol: TwwDataSource
    DataSet = qryTotContribPatroCol
    Left = 157
    Top = 299
  end
  object ppbdeTotContribPatroCol: TppBDEPipeline
    DataSource = dsTotContribPatroCol
    CloseDataSource = True
    UserName = 'bdeTotContribPatroCol'
    Left = 279
    Top = 299
  end
end
