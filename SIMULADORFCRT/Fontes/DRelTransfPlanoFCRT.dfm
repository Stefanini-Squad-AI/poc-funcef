inherited dtmRelTransfPlanoFCRT: TdtmRelTransfPlanoFCRT
  Left = 161
  Top = 51
  Width = 564
  Height = 442
  Caption = 'dtmRelTransfPlanoFCRT'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 13
    Top = 0
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
    Left = 13
    Top = 0
  end
  inherited qryExemplo: TwwQuery
    Left = 13
    Top = 0
  end
  inherited rpExemplo: TppReport
    Left = 13
    Top = 0
    DataPipelineName = 'pplExemplo'
  end
  object rpDemonstrativo: TppReport
    AutoStop = False
    DataPipeline = ppDemonstrativo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 11430
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpDemonstrativoBeforePrint
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 31
    Top = 55
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppDemonstrativo'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 42069
      mmPrintPosition = 0
      object lblTituloRelatorio: TppLabel
        UserName = 'lblTituloRelatorio'
        Caption = 'Simulador de Migração de Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 65881
        mmTop = 24342
        mmWidth = 65617
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 30163
        mmWidth = 197300
        BandType = 0
      end
      object rpBenefProvLine2: TppLine
        UserName = 'rpBenefProvLine2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 41010
        mmWidth = 197300
        BandType = 0
      end
      object rpBenefProvDBImage1: TppDBImage
        UserName = 'rpBenefProvDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 23019
        mmLeft = 0
        mmTop = 794
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label1'
        Caption = 'Matrícula :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 31221
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label2'
        Caption = 'Nome :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 36513
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label3'
        Caption = 'Origem :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 38894
        mmTop = 31221
        mmWidth = 14552
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3704
        mmLeft = 19579
        mmTop = 31221
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'NOMEPARTICIPANTE'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3969
        mmLeft = 19579
        mmTop = 36513
        mmWidth = 36248
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NOMEPLANOATUAL'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3969
        mmLeft = 57150
        mmTop = 31221
        mmWidth = 80169
        BandType = 0
      end
      object ppRepRelBeneficiosDBText2: TppDBText
        UserName = 'ppRepRelBeneficiosDBText2'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 30692
        mmTop = 1058
        mmWidth = 133615
        BandType = 0
      end
      object ppRepRelBeneficiosDBText3: TppDBText
        UserName = 'ppRepRelBeneficiosDBText3'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 30692
        mmTop = 7408
        mmWidth = 25400
        BandType = 0
      end
      object ppRepRelBeneficiosDBText4: TppDBText
        UserName = 'ppRepRelBeneficiosDBText4'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 30692
        mmTop = 12171
        mmWidth = 69586
        BandType = 0
      end
      object ppRepRelBeneficiosDBText5: TppDBText
        UserName = 'ppRepRelBeneficiosDBText5'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 30692
        mmTop = 16669
        mmWidth = 20108
        BandType = 0
      end
      object ppRepRelBeneficiosDBText7: TppDBText
        UserName = 'ppRepRelBeneficiosDBText7'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 51329
        mmTop = 16669
        mmWidth = 48419
        BandType = 0
      end
      object ppRepRelBeneficiosDBText8: TppDBText
        UserName = 'ppRepRelBeneficiosDBText8'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 100277
        mmTop = 16669
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosDBText9: TppDBText
        UserName = 'ppRepRelBeneficiosDBText9'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 100542
        mmTop = 12171
        mmWidth = 17198
        BandType = 0
      end
      object ppRepRelBeneficiosLabel2: TppLabel
        UserName = 'ppRepRelBeneficiosLabel2'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 30956
        mmTop = 21167
        mmWidth = 5821
        BandType = 0
      end
      object ppRepRelBeneficiosDBText6: TppDBText
        UserName = 'ppRepRelBeneficiosDBText6'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 38365
        mmTop = 21167
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label5'
        Caption = 'Data dos Dados :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 139700
        mmTop = 31221
        mmWidth = 29104
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label6'
        Caption = 'Data da Simulação : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 139700
        mmTop = 36513
        mmWidth = 34925
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'DATADADOS'
        DataPipeline = ppDemonstrativo
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3969
        mmLeft = 175684
        mmTop = 31221
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'DATATRANSACAO'
        DataPipeline = ppDemonstrativo
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3969
        mmLeft = 175684
        mmTop = 36513
        mmWidth = 31221
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'NOMEINPUT'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3969
        mmLeft = 12435
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'VALORINPUT'
        DataPipeline = ppDemonstrativo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppDemonstrativo'
        mmHeight = 3969
        mmLeft = 127000
        mmTop = 265
        mmWidth = 22490
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      BeforePrint = ppFooterBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'ppLabel3'
        AutoSize = False
        Caption = 'Administração Previdenciária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 21696
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 86784
        mmTop = 21696
        mmWidth = 16669
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169334
        mmTop = 21696
        mmWidth = 25135
        BandType = 8
      end
      object ppLabel171: TppLabel
        UserName = 'Label171'
        Caption = 
          'Os dados acima são simulações e poderão sofrer alteração em funç' +
          'ão das datas-base dos cálculos e das '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 11642
        mmWidth = 177271
        BandType = 8
      end
      object ppLabel172: TppLabel
        UserName = 'Label172'
        Caption = 
          'atualizações cadastrais. CEA significa Contribuição Extraordinár' +
          'ia Adicional.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 16140
        mmWidth = 128852
        BandType = 8
      end
      object ppLblMens: TppLabel
        UserName = 'ppLblMens'
        AutoSize = False
        Caption = 
          'Este valor é uma mera simulação, sem valor legal, ficando a migr' +
          'ação condicionada a aprovação da retirada da patrocinadora Celul' +
          'ar CRT da FCRT, conforme TTJ.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 9260
        mmLeft = 1058
        mmTop = 794
        mmWidth = 197380
        BandType = 8
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 0
        mmTop = 10848
        mmWidth = 197300
        BandType = 8
      end
      object ppLine22: TppLine
        UserName = 'Line22'
        ParentWidth = True
        Weight = 1
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'MATRICULA'
      DataPipeline = ppDemonstrativo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      ReprintOnSubsequentPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppDemonstrativo'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 14024703
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Informações do Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 50800
          mmTop = 265
          mmWidth = 46567
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 16140
        mmPrintPosition = 0
        object ppSubOpcoes: TppSubReport
          UserName = 'SubOpcoes'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = rpSubBaseCalculo
          TraverseAllData = False
          DataPipelineName = 'ppBDESubOpcoes'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 11113
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = ppBDESubOpcoes
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 11430
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Left = 300
            Top = 234
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppBDESubOpcoes'
            object ppTitleBand1: TppTitleBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
              object ppShape2: TppShape
                UserName = 'Shape2'
                Brush.Color = 14024703
                ParentWidth = True
                Pen.Style = psClear
                mmHeight = 6350
                mmLeft = 0
                mmTop = 265
                mmWidth = 197300
                BandType = 1
              end
              object ppLabel8: TppLabel
                UserName = 'Label8'
                Caption = 'Opções para a Migração de Plano'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 50800
                mmTop = 1588
                mmWidth = 56356
                BandType = 1
              end
              object ppDBText26: TppDBText
                UserName = 'DBText26'
                AutoSize = True
                DataField = 'TITULOVLR1'
                DataPipeline = ppBDESubOpcoes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppBDESubOpcoes'
                mmHeight = 4233
                mmLeft = 127794
                mmTop = 1588
                mmWidth = 21696
                BandType = 1
              end
              object ppDBText27: TppDBText
                UserName = 'DBText27'
                AutoSize = True
                DataField = 'TITULOVLR2'
                DataPipeline = ppBDESubOpcoes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppBDESubOpcoes'
                mmHeight = 4233
                mmLeft = 163777
                mmTop = 1588
                mmWidth = 21696
                BandType = 1
              end
            end
            object ppDetailBand1: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4233
              mmPrintPosition = 0
              object ppDBText8: TppDBText
                UserName = 'DBText8'
                AutoSize = True
                DataField = 'NOMEINPUT'
                DataPipeline = ppBDESubOpcoes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppBDESubOpcoes'
                mmHeight = 3969
                mmLeft = 12435
                mmTop = 265
                mmWidth = 21167
                BandType = 4
              end
              object ppDBText9: TppDBText
                UserName = 'DBText9'
                AutoSize = True
                DataField = 'VALORINPUT'
                DataPipeline = ppBDESubOpcoes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppBDESubOpcoes'
                mmHeight = 3969
                mmLeft = 127000
                mmTop = 265
                mmWidth = 22490
                BandType = 4
              end
              object ppDBText25: TppDBText
                UserName = 'DBText25'
                AutoSize = True
                DataField = 'VALORINPUT2'
                DataPipeline = ppBDESubOpcoes
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppBDESubOpcoes'
                mmHeight = 3969
                mmLeft = 161132
                mmTop = 265
                mmWidth = 24342
                BandType = 4
              end
            end
            object ppFooterBand1: TppFooterBand
              Visible = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object ppSumarioOpcoes: TppSummaryBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 11642
              mmPrintPosition = 0
              object ppSubEstimativas: TppSubReport
                UserName = 'SubEstimativas'
                ExpandAll = False
                NewPrintJob = False
                OutlineSettings.CreateNode = True
                ShiftRelativeTo = ppSubOpcoesPag1
                TraverseAllData = False
                DataPipelineName = 'ppBDEEstimativas'
                mmHeight = 5027
                mmLeft = 0
                mmTop = 6085
                mmWidth = 197300
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppChildReport2: TppChildReport
                  AutoStop = False
                  DataPipeline = ppBDEEstimativas
                  PrinterSetup.BinName = 'Default'
                  PrinterSetup.DocumentName = 'PpModeloReport1'
                  PrinterSetup.PaperName = 'A4'
                  PrinterSetup.PrinterName = 'Default'
                  PrinterSetup.mmMarginBottom = 11430
                  PrinterSetup.mmMarginLeft = 6350
                  PrinterSetup.mmMarginRight = 6350
                  PrinterSetup.mmMarginTop = 6350
                  PrinterSetup.mmPaperHeight = 297000
                  PrinterSetup.mmPaperWidth = 210000
                  PrinterSetup.PaperSize = 9
                  Template.SaveTo = stDatabase
                  Left = 309
                  Top = 243
                  Version = '7.04'
                  mmColumnWidth = 0
                  DataPipelineName = 'ppBDEEstimativas'
                  object ppTitleBand2: TppTitleBand
                    BeforePrint = ppTitleBand2BeforePrint
                    mmBottomOffset = 0
                    mmHeight = 13229
                    mmPrintPosition = 0
                    object ppShape5: TppShape
                      UserName = 'Shape5'
                      Brush.Color = clSilver
                      Pen.Style = psClear
                      mmHeight = 6350
                      mmLeft = 10848
                      mmTop = 6615
                      mmWidth = 179652
                      BandType = 1
                    end
                    object ppShape3: TppShape
                      UserName = 'Shape3'
                      Brush.Color = 14024703
                      ParentWidth = True
                      Pen.Style = psClear
                      mmHeight = 6350
                      mmLeft = 0
                      mmTop = 0
                      mmWidth = 197300
                      BandType = 1
                    end
                    object ppLabel10: TppLabel
                      UserName = 'Label10'
                      Caption = 'Estimativas de Valores de Benefício'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 10
                      Font.Style = [fsBold]
                      Transparent = True
                      mmHeight = 4233
                      mmLeft = 50800
                      mmTop = 794
                      mmWidth = 60061
                      BandType = 1
                    end
                    object ppLabel13: TppLabel
                      UserName = 'Label13'
                      Caption = 'Opção Selecionada :'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 10
                      Font.Style = [fsBold]
                      Transparent = True
                      mmHeight = 4233
                      mmLeft = 13494
                      mmTop = 7673
                      mmWidth = 34660
                      BandType = 1
                    end
                    object pplblOpcao2: TppLabel
                      UserName = 'lblOpcao2'
                      Caption = 'lblOpcao'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 10
                      Font.Style = [fsBold]
                      TextAlignment = taRightJustified
                      Transparent = True
                      mmHeight = 4233
                      mmLeft = 51329
                      mmTop = 7673
                      mmWidth = 15081
                      BandType = 1
                    end
                    object ppdbTitulo1Estim: TppDBText
                      UserName = 'dbTitulo1Estim'
                      AutoSize = True
                      DataField = 'TITULOVLR1'
                      DataPipeline = ppBDEEstimativas
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 10
                      Font.Style = [fsBold]
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppBDEEstimativas'
                      mmHeight = 4233
                      mmLeft = 127794
                      mmTop = 794
                      mmWidth = 21696
                      BandType = 1
                    end
                    object ppdbTitulo2Estim: TppDBText
                      UserName = 'dbTitulo2Estim'
                      AutoSize = True
                      DataField = 'TITULOVLR2'
                      DataPipeline = ppBDEEstimativas
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 10
                      Font.Style = [fsBold]
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppBDEEstimativas'
                      mmHeight = 4233
                      mmLeft = 163777
                      mmTop = 794
                      mmWidth = 21696
                      BandType = 1
                    end
                  end
                  object ppHeaderBand1: TppHeaderBand
                    Visible = False
                    mmBottomOffset = 0
                    mmHeight = 0
                    mmPrintPosition = 0
                  end
                  object ppDetailBand3: TppDetailBand
                    mmBottomOffset = 0
                    mmHeight = 4233
                    mmPrintPosition = 0
                    object ppDBText11: TppDBText
                      UserName = 'DBText11'
                      AutoSize = True
                      DataField = 'NOMEINPUT'
                      DataPipeline = ppBDEEstimativas
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 10
                      Font.Style = []
                      Transparent = True
                      DataPipelineName = 'ppBDEEstimativas'
                      mmHeight = 3969
                      mmLeft = 12435
                      mmTop = 265
                      mmWidth = 21167
                      BandType = 4
                    end
                    object ppDBText12: TppDBText
                      UserName = 'DBText12'
                      AutoSize = True
                      DataField = 'VALORINPUT'
                      DataPipeline = ppBDEEstimativas
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 10
                      Font.Style = []
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppBDEEstimativas'
                      mmHeight = 3969
                      mmLeft = 127000
                      mmTop = 265
                      mmWidth = 22490
                      BandType = 4
                    end
                    object ppDBText28: TppDBText
                      UserName = 'DBText28'
                      AutoSize = True
                      DataField = 'VALORINPUT2'
                      DataPipeline = ppBDEEstimativas
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 10
                      Font.Style = []
                      TextAlignment = taRightJustified
                      Transparent = True
                      DataPipelineName = 'ppBDEEstimativas'
                      mmHeight = 3969
                      mmLeft = 161132
                      mmTop = 265
                      mmWidth = 24342
                      BandType = 4
                    end
                  end
                  object ppFooterBand3: TppFooterBand
                    Visible = False
                    mmBottomOffset = 0
                    mmHeight = 0
                    mmPrintPosition = 0
                  end
                  object ppSummaryBand2: TppSummaryBand
                    PrintHeight = phDynamic
                    mmBottomOffset = 0
                    mmHeight = 5821
                    mmPrintPosition = 0
                    object ppSubOpcoesPag2: TppSubReport
                      UserName = 'SubOpcoesPag2'
                      ExpandAll = False
                      NewPrintJob = False
                      OutlineSettings.CreateNode = True
                      TraverseAllData = False
                      DataPipelineName = 'ppOBSPag2'
                      mmHeight = 4498
                      mmLeft = 0
                      mmTop = 529
                      mmWidth = 197300
                      BandType = 7
                      mmBottomOffset = 0
                      mmOverFlowOffset = 0
                      mmStopPosition = 0
                      object ppChildReport6: TppChildReport
                        AutoStop = False
                        DataPipeline = ppOBSPag2
                        PrinterSetup.BinName = 'Default'
                        PrinterSetup.DocumentName = 'PpModeloReport1'
                        PrinterSetup.PaperName = 'A4'
                        PrinterSetup.PrinterName = 'Default'
                        PrinterSetup.mmMarginBottom = 11430
                        PrinterSetup.mmMarginLeft = 6350
                        PrinterSetup.mmMarginRight = 6350
                        PrinterSetup.mmMarginTop = 6350
                        PrinterSetup.mmPaperHeight = 297000
                        PrinterSetup.mmPaperWidth = 210000
                        PrinterSetup.PaperSize = 9
                        Template.SaveTo = stDatabase
                        Left = 400
                        Top = 304
                        Version = '7.04'
                        mmColumnWidth = 0
                        DataPipelineName = 'ppOBSPag2'
                        object ppTitleBand6: TppTitleBand
                          mmBottomOffset = 0
                          mmHeight = 4498
                          mmPrintPosition = 0
                          object ppLabel19: TppLabel
                            UserName = 'Label19'
                            Caption = 'Observações :'
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Name = 'Arial'
                            Font.Size = 8
                            Font.Style = []
                            Transparent = True
                            mmHeight = 3175
                            mmLeft = 1323
                            mmTop = 794
                            mmWidth = 17463
                            BandType = 1
                          end
                        end
                        object ppDetailBand7: TppDetailBand
                          mmBottomOffset = 0
                          mmHeight = 3704
                          mmPrintPosition = 0
                          object ppDBText18: TppDBText
                            UserName = 'DBText18'
                            AutoSize = True
                            DataField = 'OBSERVACAO'
                            DataPipeline = ppOBSPag2
                            Font.Charset = DEFAULT_CHARSET
                            Font.Color = clBlack
                            Font.Name = 'Arial'
                            Font.Size = 8
                            Font.Style = []
                            Transparent = True
                            DataPipelineName = 'ppOBSPag2'
                            mmHeight = 3175
                            mmLeft = 14552
                            mmTop = 265
                            mmWidth = 19844
                            BandType = 4
                          end
                        end
                        object ppSummaryBand5: TppSummaryBand
                          mmBottomOffset = 0
                          mmHeight = 2117
                          mmPrintPosition = 0
                        end
                      end
                    end
                  end
                  object ppGroup3: TppGroup
                    BreakName = 'DESCOPCAO'
                    DataPipeline = ppBDEEstimativas
                    OutlineSettings.CreateNode = True
                    UserName = 'Group3'
                    mmNewColumnThreshold = 0
                    mmNewPageThreshold = 0
                    DataPipelineName = 'ppBDEEstimativas'
                    object ppGroupHeaderBand3: TppGroupHeaderBand
                      mmBottomOffset = 0
                      mmHeight = 7673
                      mmPrintPosition = 0
                      object ppDBText10: TppDBText
                        UserName = 'DBText10'
                        DataField = 'DESCOPCAO'
                        DataPipeline = ppBDEEstimativas
                        Font.Charset = DEFAULT_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 10
                        Font.Style = [fsBold]
                        Transparent = True
                        WordWrap = True
                        DataPipelineName = 'ppBDEEstimativas'
                        mmHeight = 7144
                        mmLeft = 1323
                        mmTop = 529
                        mmWidth = 191823
                        BandType = 3
                        GroupNo = 0
                      end
                    end
                    object ppGroupFooterBand3: TppGroupFooterBand
                      PrintHeight = phDynamic
                      mmBottomOffset = 0
                      mmHeight = 0
                      mmPrintPosition = 0
                    end
                  end
                end
              end
              object ppSubOpcoesPag1: TppSubReport
                UserName = 'SubOpcoesPag1'
                ExpandAll = False
                NewPrintJob = False
                OutlineSettings.CreateNode = True
                TraverseAllData = False
                DataPipelineName = 'ppOBSPag1'
                mmHeight = 5027
                mmLeft = 0
                mmTop = 265
                mmWidth = 197300
                BandType = 7
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppChildReport4: TppChildReport
                  AutoStop = False
                  DataPipeline = ppOBSPag1
                  PrinterSetup.BinName = 'Default'
                  PrinterSetup.DocumentName = 'PpModeloReport1'
                  PrinterSetup.PaperName = 'A4'
                  PrinterSetup.PrinterName = 'Default'
                  PrinterSetup.mmMarginBottom = 11430
                  PrinterSetup.mmMarginLeft = 6350
                  PrinterSetup.mmMarginRight = 6350
                  PrinterSetup.mmMarginTop = 6350
                  PrinterSetup.mmPaperHeight = 297000
                  PrinterSetup.mmPaperWidth = 210000
                  PrinterSetup.PaperSize = 9
                  Template.SaveTo = stDatabase
                  Left = 344
                  Top = 248
                  Version = '7.04'
                  mmColumnWidth = 0
                  DataPipelineName = 'ppOBSPag1'
                  object ppTitleBand4: TppTitleBand
                    mmBottomOffset = 0
                    mmHeight = 3969
                    mmPrintPosition = 0
                    object ppLabel12: TppLabel
                      UserName = 'Label12'
                      Caption = 'Observações :'
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = []
                      Transparent = True
                      mmHeight = 3175
                      mmLeft = 1323
                      mmTop = 265
                      mmWidth = 17463
                      BandType = 1
                    end
                  end
                  object ppDetailBand5: TppDetailBand
                    mmBottomOffset = 0
                    mmHeight = 3969
                    mmPrintPosition = 0
                    object ppDBText17: TppDBText
                      UserName = 'DBText17'
                      AutoSize = True
                      DataField = 'OBSERVACAO'
                      DataPipeline = ppOBSPag1
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clBlack
                      Font.Name = 'Arial'
                      Font.Size = 8
                      Font.Style = []
                      Transparent = True
                      DataPipelineName = 'ppOBSPag1'
                      mmHeight = 3175
                      mmLeft = 12435
                      mmTop = 529
                      mmWidth = 19844
                      BandType = 4
                    end
                  end
                  object ppSumarioObs1: TppSummaryBand
                    mmBottomOffset = 0
                    mmHeight = 794
                    mmPrintPosition = 0
                  end
                end
              end
            end
            object ppGroup1: TppGroup
              BreakName = 'SECAO'
              DataPipeline = ppBDESubOpcoes
              OutlineSettings.CreateNode = True
              UserName = 'Group1'
              mmNewColumnThreshold = 0
              mmNewPageThreshold = 0
              DataPipelineName = 'ppBDESubOpcoes'
              object ppGroupHeaderBand1: TppGroupHeaderBand
                mmBottomOffset = 0
                mmHeight = 9260
                mmPrintPosition = 0
                object ppShape7: TppShape
                  UserName = 'Shape7'
                  Brush.Color = clSilver
                  Pen.Style = psClear
                  mmHeight = 5027
                  mmLeft = 0
                  mmTop = 265
                  mmWidth = 21696
                  BandType = 3
                  GroupNo = 0
                end
                object ppDBText6: TppDBText
                  UserName = 'DBText6'
                  DataField = 'NUMOPCAO'
                  DataPipeline = ppBDESubOpcoes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = [fsBold]
                  Transparent = True
                  DataPipelineName = 'ppBDESubOpcoes'
                  mmHeight = 4233
                  mmLeft = 12435
                  mmTop = 794
                  mmWidth = 5027
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel7: TppLabel
                  UserName = 'Label7'
                  Caption = '.) '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 4233
                  mmLeft = 18256
                  mmTop = 794
                  mmWidth = 3175
                  BandType = 3
                  GroupNo = 0
                end
                object ppDBText7: TppDBText
                  UserName = 'DBText7'
                  AutoSize = True
                  DataField = 'DESCOPCAO'
                  DataPipeline = ppBDESubOpcoes
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = [fsBold]
                  Transparent = True
                  DataPipelineName = 'ppBDESubOpcoes'
                  mmHeight = 4233
                  mmLeft = 46038
                  mmTop = 794
                  mmWidth = 22490
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel11: TppLabel
                  UserName = 'Label11'
                  Caption = 'Optando por '
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 4233
                  mmLeft = 22490
                  mmTop = 794
                  mmWidth = 22490
                  BandType = 3
                  GroupNo = 0
                end
                object ppLabel17: TppLabel
                  UserName = 'Label17'
                  Caption = 'Opção'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 10
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 4233
                  mmLeft = 794
                  mmTop = 794
                  mmWidth = 11113
                  BandType = 3
                  GroupNo = 0
                end
              end
              object ppGroupFooterBand1: TppGroupFooterBand
                PrintHeight = phDynamic
                mmBottomOffset = 0
                mmHeight = 0
                mmPrintPosition = 0
              end
            end
          end
        end
        object rpSubBaseCalculo: TppSubReport
          UserName = 'BaseCalculo1'
          ExpandAll = False
          KeepTogether = True
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = ppSubInfDigitadas
          TraverseAllData = False
          DataPipelineName = 'ppBaseCalculo'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 5556
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport5: TppChildReport
            AutoStop = False
            DataPipeline = ppBaseCalculo
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 11430
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Left = 327
            Top = 261
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppBaseCalculo'
            object ppTitleBand5: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 6350
              mmPrintPosition = 0
              object ppShape6: TppShape
                UserName = 'Shape6'
                Brush.Color = 14024703
                ParentWidth = True
                Pen.Style = psClear
                mmHeight = 6350
                mmLeft = 0
                mmTop = 0
                mmWidth = 197300
                BandType = 1
              end
              object ppLabel16: TppLabel
                UserName = 'Label16'
                Caption = 'Valores Base para a Migração de Plano'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 50800
                mmTop = 529
                mmWidth = 65352
                BandType = 1
              end
            end
            object ppDetailBand6: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5556
              mmPrintPosition = 0
              object ppDBText19: TppDBText
                UserName = 'DBText19'
                AutoSize = True
                DataField = 'NOMEINPUT'
                DataPipeline = ppBaseCalculo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppBaseCalculo'
                mmHeight = 3969
                mmLeft = 12435
                mmTop = 529
                mmWidth = 21167
                BandType = 4
              end
              object ppDBText20: TppDBText
                UserName = 'DBText20'
                AutoSize = True
                DataField = 'VALORINPUT'
                DataPipeline = ppBaseCalculo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppBaseCalculo'
                mmHeight = 3969
                mmLeft = 127000
                mmTop = 529
                mmWidth = 22490
                BandType = 4
              end
            end
            object ppSummaryBand4: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 1058
              mmPrintPosition = 0
            end
          end
        end
        object ppSubInfDigitadas: TppSubReport
          UserName = 'SubInfDigitadas'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppInfDigitadas'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = ppInfDigitadas
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 11430
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Left = 328
            Top = 232
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppInfDigitadas'
            object ppTitleBand3: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 6350
              mmPrintPosition = 0
              object ppShape8: TppShape
                UserName = 'Shape8'
                Brush.Color = 14024703
                ParentWidth = True
                Pen.Style = psClear
                mmHeight = 6350
                mmLeft = 0
                mmTop = 0
                mmWidth = 197300
                BandType = 1
              end
              object ppLabel18: TppLabel
                UserName = 'Label18'
                Caption = 'Valores Informados pelo Participante'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 50800
                mmTop = 1058
                mmWidth = 62177
                BandType = 1
              end
            end
            object ppDetailBand4: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object ppDBText15: TppDBText
                UserName = 'DBText15'
                AutoSize = True
                DataField = 'NOMEINPUT'
                DataPipeline = ppInfDigitadas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppInfDigitadas'
                mmHeight = 3969
                mmLeft = 12435
                mmTop = 529
                mmWidth = 21167
                BandType = 4
              end
              object ppDBText16: TppDBText
                UserName = 'DBText201'
                AutoSize = True
                DataField = 'VALORINPUT'
                DataPipeline = ppInfDigitadas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppInfDigitadas'
                mmHeight = 3969
                mmLeft = 129117
                mmTop = 529
                mmWidth = 22490
                BandType = 4
              end
            end
            object ppSummaryBand1: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
    end
  end
  object ppDemonstrativo: TppBDEPipeline
    DataSource = dsDemonstrativo
    SkipWhenNoRecords = False
    UserName = 'Demonstrativo'
    Left = 31
    Top = 77
    object ppDemonstrativoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppDemonstrativoppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 1
    end
    object ppDemonstrativoppField3: TppField
      FieldAlias = 'NOMEPARTICIPANTE'
      FieldName = 'NOMEPARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppDemonstrativoppField4: TppField
      FieldAlias = 'NOMEPLANOATUAL'
      FieldName = 'NOMEPLANOATUAL'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object ppDemonstrativoppField5: TppField
      FieldAlias = 'DATADADOS'
      FieldName = 'DATADADOS'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppDemonstrativoppField6: TppField
      FieldAlias = 'DATATRANSACAO'
      FieldName = 'DATATRANSACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppDemonstrativoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SECAO'
      FieldName = 'SECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppDemonstrativoppField8: TppField
      FieldAlias = 'NOMEINPUT'
      FieldName = 'NOMEINPUT'
      FieldLength = 80
      DisplayWidth = 80
      Position = 7
    end
    object ppDemonstrativoppField9: TppField
      FieldAlias = 'VALORINPUT'
      FieldName = 'VALORINPUT'
      FieldLength = 40
      DisplayWidth = 40
      Position = 8
    end
  end
  object dsDemonstrativo: TwwDataSource
    DataSet = qryDemonstrativo
    Left = 31
    Top = 99
  end
  object qryDemonstrativo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EL.IDPESSJUR,'
      '       EL.MATRICULA,'
      '       S.NOME AS NOMEPARTICIPANTE,'
      '       PL.NOME AS NOMEPLANOATUAL,'
      '       TO_DATE(:DATADADOS, '#39'DD/MM/YYYY'#39') AS DATADADOS,'
      '       SYSDATE AS DATATRANSACAO,'
      '       -1 AS SECAO,'
      
        '       '#39'                                                        ' +
        '                        '#39' AS NOMEINPUT,'
      '       '#39'                                        '#39' AS VALORINPUT'
      
        'FROM   PESSOA P, ELEGPATRO EL, PARTPREVPLAN PP, SIMULAMIGRACAO S' +
        ', PLANPREV PL,'
      '       EVENTOGERADOR EG'
      'WHERE  EL.IDPESSJUR      = :IDPESSJUR'
      'AND    EL.IDPESSOA       = :IDPESSOA'
      'AND    P.IDPESSOA        = EL.IDPESSOA'
      'AND    PP.IDPESSJUR      = EL.IDPESSJUR'
      'AND    PP.IDPESSOA       = EL.IDPESSOA'
      'AND    PP.FLGDESATIVADO  = 0'
      'AND    PL.IDPLANOPREV    = PP.IDPLANOPREV'
      'AND    EG.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      'AND    S.IDPESSOA         = EL.IDPESSOA'
      
        'AND    S.ANOMESREF        = SUBSTR(:DATADADOS,7,4)||'#39'/'#39'||SUBSTR(' +
        ':DATADADOS,4,2)')
    UpdateObject = updDemonstrativo
    ValidateWithMask = True
    Left = 31
    Top = 122
    ParamData = <
      item
        DataType = ftString
        Name = 'DATADADOS'
        ParamType = ptUnknown
        Value = '30/11/2002'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '50028'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '1921'
      end
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
        Value = '45'
      end
      item
        DataType = ftString
        Name = 'DATADADOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATADADOS'
        ParamType = ptUnknown
      end>
  end
  object updDemonstrativo: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 31
    Top = 166
  end
  object DsgnCM: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.DatabaseName = 'BaseDados'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpDemonstrativo
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 31
    Top = 144
  end
  object ppBDESubOpcoes: TppBDEPipeline
    DataSource = dsSubOpcoes
    SkipWhenNoRecords = False
    UserName = 'Demonstrativo1'
    Left = 32
    Top = 219
  end
  object dsSubOpcoes: TwwDataSource
    DataSet = qrySubOpcoes
    Left = 32
    Top = 251
  end
  object qrySubOpcoes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT -1 AS SECAO,'
      '       -1 AS NUMOPCAO,'
      
        '       '#39'                                                        ' +
        '                        '#39' AS DESCOPCAO,'
      
        '       '#39'                                                        ' +
        '                        '#39' AS NOMEINPUT,'
      '       '#39'                                        '#39' AS VALORINPUT,'
      
        '       '#39'                                        '#39' AS VALORINPUT2' +
        ','
      '       '#39'                                        '#39' AS TITULOVLR1,'
      '       '#39'                                        '#39' AS TITULOVLR2'
      'FROM   ELEGPATRO'
      'WHERE  IDPESSJUR = :IDPESSJUR'
      'AND    IDPESSOA  = :IDPESSOA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updSubOpcoes
    ValidateWithMask = True
    Left = 32
    Top = 282
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '50061'
      end>
  end
  object updSubOpcoes: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 32
    Top = 314
  end
  object ppBDEEstimativas: TppBDEPipeline
    DataSource = dsEstimativas
    SkipWhenNoRecords = False
    UserName = 'BDEEstimativas'
    Left = 116
    Top = 222
    object ppBDEEstimativasppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'SECAO'
      FieldName = 'SECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBDEEstimativasppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMOPCAO'
      FieldName = 'NUMOPCAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBDEEstimativasppField3: TppField
      FieldAlias = 'DESCOPCAO'
      FieldName = 'DESCOPCAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppBDEEstimativasppField4: TppField
      FieldAlias = 'NOMEINPUT'
      FieldName = 'NOMEINPUT'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppBDEEstimativasppField5: TppField
      FieldAlias = 'VALORINPUT'
      FieldName = 'VALORINPUT'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
  end
  object dsEstimativas: TwwDataSource
    DataSet = qryEstimativas
    Left = 116
    Top = 249
  end
  object qryEstimativas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT -1 AS SECAO,'
      '       -1 AS NUMOPCAO,'
      
        '       '#39'                                                        ' +
        '    '#39' AS DESCOPCAO,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOMEINPUT,'
      '       '#39'                                        '#39' AS VALORINPUT,'
      
        '       '#39'                                        '#39' AS VALORINPUT2' +
        ','
      '       '#39'                                        '#39' AS TITULOVLR1,'
      '       '#39'                                        '#39' AS TITULOVLR2'
      'FROM   ELEGPATRO'
      'WHERE  IDPESSJUR = :IDPESSJUR'
      'AND    IDPESSOA  = :IDPESSOA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updEstimativas
    ValidateWithMask = True
    Left = 116
    Top = 279
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '50061'
      end>
  end
  object updEstimativas: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 116
    Top = 306
  end
  object ppBaseCalculo: TppBDEPipeline
    DataSource = dsBaseCalculo
    SkipWhenNoRecords = False
    UserName = 'BaseCalculo'
    Left = 194
    Top = 225
    object ppBaseCalculoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'SECAO'
      FieldName = 'SECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBaseCalculoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMOPCAO'
      FieldName = 'NUMOPCAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBaseCalculoppField3: TppField
      FieldAlias = 'DESCOPCAO'
      FieldName = 'DESCOPCAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppBaseCalculoppField4: TppField
      FieldAlias = 'NOMEINPUT'
      FieldName = 'NOMEINPUT'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppBaseCalculoppField5: TppField
      FieldAlias = 'VALORINPUT'
      FieldName = 'VALORINPUT'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
  end
  object dsBaseCalculo: TwwDataSource
    DataSet = qryBaseCalculo
    Left = 194
    Top = 252
  end
  object qryBaseCalculo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT -1 AS SECAO,'
      '       -1 AS NUMOPCAO,'
      
        '       '#39'                                                        ' +
        '    '#39' AS DESCOPCAO,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOMEINPUT,'
      '       '#39'                                        '#39' AS VALORINPUT'
      'FROM   ELEGPATRO'
      'WHERE  IDPESSJUR = :IDPESSJUR'
      'AND    IDPESSOA  = :IDPESSOA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updBaseCalculo
    ValidateWithMask = True
    Left = 194
    Top = 282
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '50061'
      end>
  end
  object updBaseCalculo: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 194
    Top = 309
  end
  object ppInfDigitadas: TppBDEPipeline
    DataSource = dsInfDigitadas
    SkipWhenNoRecords = False
    UserName = 'BaseCalculo2'
    Left = 266
    Top = 233
    object ppInfDigitadasppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'SECAO'
      FieldName = 'SECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppInfDigitadasppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMOPCAO'
      FieldName = 'NUMOPCAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppInfDigitadasppField3: TppField
      FieldAlias = 'DESCOPCAO'
      FieldName = 'DESCOPCAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppInfDigitadasppField4: TppField
      FieldAlias = 'NOMEINPUT'
      FieldName = 'NOMEINPUT'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppInfDigitadasppField5: TppField
      FieldAlias = 'VALORINPUT'
      FieldName = 'VALORINPUT'
      FieldLength = 40
      DisplayWidth = 40
      Position = 4
    end
  end
  object dsInfDigitadas: TwwDataSource
    DataSet = qryInfDigitadas
    Left = 266
    Top = 260
  end
  object qryInfDigitadas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT -1 AS SECAO,'
      '       -1 AS NUMOPCAO,'
      
        '       '#39'                                                        ' +
        '    '#39' AS DESCOPCAO,'
      
        '       '#39'                                                        ' +
        '    '#39' AS NOMEINPUT,'
      '       '#39'                                        '#39' AS VALORINPUT'
      'FROM   ELEGPATRO'
      'WHERE  IDPESSJUR = :IDPESSJUR'
      'AND    IDPESSOA  = :IDPESSOA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updInfDigitadas
    ValidateWithMask = True
    Left = 266
    Top = 290
    ParamData = <
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '50061'
      end>
  end
  object updInfDigitadas: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 266
    Top = 317
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 144
    Top = 8
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 144
    Top = 21
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      ( P.IDPESSOA =  E.IDPESSOA(+)) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      ( P.IDIMAGEM = I.IDIMAGEM(+))'
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 32
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  object rpTermoAtivo: TppReport
    AutoStop = False
    DataPipeline = ppTermoAtivo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 3810
    PrinterSetup.mmMarginLeft = 10160
    PrinterSetup.mmMarginRight = 3810
    PrinterSetup.mmMarginTop = 10160
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 353
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppTermoAtivo'
    object ppTitleBand8: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 28046
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'rpBenefProvDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 14023
        mmLeft = 180182
        mmTop = 1588
        mmWidth = 17463
        BandType = 1
      end
      object ppLabel20: TppLabel
        UserName = 'ppLabel1'
        Caption = 'TERMO DE TRANSAÇÃO EXTRAJUDICIAL E OPÇÃO DE MIGRAÇÃO AO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 28310
        mmTop = 9790
        mmWidth = 144727
        BandType = 1
      end
      object ppDBText24: TppDBText
        UserName = 'ppRepRelBeneficiosDBText2'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5292
        mmLeft = 1323
        mmTop = 2646
        mmWidth = 35719
        BandType = 1
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = ' PLANO DE BENEFÍCIOS BrTPREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 69850
        mmTop = 15610
        mmWidth = 69850
        BandType = 1
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'PARTICIPANTE NOS PLANOS FUNDADOR OU ALTERNATIVO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 45244
        mmTop = 21431
        mmWidth = 124090
        BandType = 1
      end
    end
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand8: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 244211
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'Label1'
        Caption = 'Eu,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 1852
        mmWidth = 4763
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label2'
        Caption = 'matrícula no.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 6879
        mmWidth = 18785
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label3'
        Caption = ', inscrito(a) na Fundação dos Empregados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 132027
        mmTop = 6879
        mmWidth = 61119
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppTermoAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTermoAtivo'
        mmHeight = 3704
        mmLeft = 23283
        mmTop = 6879
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText2'
        DataField = 'NOMEPARTICIPANTE'
        DataPipeline = ppTermoAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTermoAtivo'
        mmHeight = 3969
        mmLeft = 7408
        mmTop = 1852
        mmWidth = 152136
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label5'
        Caption = ', abaixo assinado(a),'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 163248
        mmTop = 1852
        mmWidth = 29898
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label6'
        Caption = ', empregado da Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 41010
        mmTop = 6879
        mmWidth = 43392
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText14'
        AutoSize = True
        DataField = 'NOMEPATROCINADORA'
        DataPipeline = ppTermoAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppTermoAtivo'
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 6615
        mmWidth = 37306
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 
          'da Companhia Riograndense de Telecomunicações - FCRT, pertencent' +
          'e ao Plano de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 11906
        mmWidth = 140759
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'NOMEPLANOATUAL'
        DataPipeline = ppTermoAtivo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppTermoAtivo'
        mmHeight = 3969
        mmLeft = 144727
        mmTop = 11642
        mmWidth = 40481
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'solicito pelo presente :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 17463
        mmWidth = 32015
        BandType = 4
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 23283
        mmWidth = 4233
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'manutenção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 23283
        mmWidth = 19050
        BandType = 4
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'no Plano de Benefícios acima citado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 23283
        mmWidth = 52123
        BandType = 4
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = ','
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 192088
        mmTop = 11906
        mmWidth = 1058
        BandType = 4
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 29369
        mmWidth = 4233
        BandType = 4
      end
      object ppRichText1: TppRichText
        UserName = 'RichText1'
        Caption = 'RichText1'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
          'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss Arial;' +
          '}}'#13#10'{\colortbl ;\red0\green0\blue0;}'#13#10'\viewkind4\uc1\pard\fi-284' +
          '\li284\sa60\b\f0\fs18 op\'#39'e7\'#39'e3o pela migra\'#39'e7\'#39'e3o \b0 para o' +
          ' Plano de Benef\'#39'edcios BrTPREV, declarando estar ciente e conco' +
          'rdar  com  todos  os  direitos  e \par'#13#10'obriga\'#39'e7\'#39'f5es previst' +
          'os no Estatuto da Funda\'#39'e7\'#39'e3o CRT e no Regulamento do Plano d' +
          'e Benef\'#39'edcios BrTPREV, dos quais recebi \par'#13#10'um exemplar e a ' +
          'correspondente cartilha,  concordando que:\par'#13#10'\pard\fi-284\li2' +
          '84\tx851\cf1\f1\par'#13#10'1. \tab\f0 A  op\'#39'e7\'#39'e3o  por  me  vincula' +
          'r  ao  Plano  de  Benef\'#39'edcios  BrTPREV  automaticamente  cance' +
          'la  todos  os  efeitos  de  minha \par'#13#10'      participa\'#39'e7\'#39'e3o' +
          ' no PLANO DE ORIGEM ao qual estava vinculado(a),  outorgando  pl' +
          'ena,  rasa  e  geral  quita\'#39'e7\'#39'e3o  a  todo  e \par'#13#10'      qua' +
          'lquer direito que tenha adquirido em rela\'#39'e7\'#39'e3o ao PLANO DE O' +
          'RIGEM, para mais nada reclamar, seja em ju\'#39'edzo ou fora \par'#13#10' ' +
          '     dele,  observado o disposto no Regulamento do BrTPREV, cons' +
          'tituindo transa\'#39'e7\'#39'e3o de direitos.\f1\par'#13#10'\par'#13#10'2. \tab\f0 Q' +
          'ue, em raz\'#39'e3o da transa\'#39'e7\'#39'e3o e conseq\'#39'fcente migra\'#39'e7\'#39'e' +
          '3o para o Plano de Benef\'#39'edcios BrTPREV, terei assegurada a Res' +
          'erva de  Transfer\'#39'eancia, que ser\'#39'e1 sempre o  maior valor  en' +
          'tre a Reserva Matem\'#39'e1tica de Benef\'#39'edcios a Conceder Saldado ' +
          'e a Reserva \par'#13#10'      de Poupan\'#39'e7a do PLANO DE ORIGEM, confo' +
          'rme disposto no Regulamento BrTPREV; \f1\par'#13#10'\par'#13#10'3.\tab\f0 A ' +
          't\'#39'edtulo Incentivo \'#39'e0 Migra\'#39'e7\'#39'e3o ao Plano BrTPREV, terei ' +
          'um cr\'#39'e9dito no valor correspondente a 30% do meu Sal\'#39'e1rio de' +
          ' \par'#13#10'      Participa\'#39'e7\'#39'e3o (SP), em uma \'#39'fanica parcela, a' +
          ' ser depositado em minha Conta Individual do Participante - CIP,' +
          ' sendo o \par'#13#10'      mesmo operacionalizado na forma prevista no' +
          ' Regulamento do BrTPREV.\f1\par'#13#10'\par'#13#10'\pard\tx432\tx7883 4. Sen' +
          'do assim, declaro o seguinte:\par'#13#10'\pard\fi-142\li284\tx284 - Se' +
          ' houver \b\f0 mudan\'#39'e7a de minha classe de participante\b0  ap\' +
          #39'f3s o preenchimento deste formul\'#39'e1rio \b e antes da valida\'#39'e' +
          '7\'#39'e3o da \par'#13#10'  presente transa\'#39'e7\'#39'e3o ao Plano de Benef\'#39'ed' +
          'cios BrTPREV,\b0   fico obrigado(a) a preencher novo Termo de Tr' +
          'ansa\'#39'e7\'#39'e3o referente \par'#13#10'  \'#39'e0 nova classe de participante' +
          ', tornando-se inv\'#39'e1lido este Termo.\par'#13#10'\f1\par'#13#10'\pard\fi-142' +
          '\li284 - \f0 Estou ciente de que, caso possua alguma a\'#39'e7\'#39'e3o ' +
          'judicial contra a Funda\'#39'e7\'#39'e3o CRT e/ou Brasil Telecom S/A e/o' +
          'u Celular CRT \par'#13#10'   S/A, tendo por objeto mat\'#39'e9ria an\'#39'e1lo' +
          'ga, conexa ou relacionada com a presente transa\'#39'e7\'#39'e3o, ou que' +
          ' direta ou indiretamente \par'#13#10'   venha a obstar a implanta\'#39'e7\' +
          #39'e3o do Plano de Benef\'#39'edcios BrTPREV, esta Transa\'#39'e7\'#39'e3o s\'#39 +
          'f3 surtir\'#39'e1 efeitos legais ap\'#39'f3s a \par'#13#10'   homologa\'#39'e7\'#39'e3' +
          'o judicial da desist\'#39'eancia das mencionadas a\'#39'e7\'#39'f5es, implic' +
          'ando a referida desist\'#39'eancia na quita\'#39'e7\'#39'e3o de quaisquer \p' +
          'ar'#13#10'   diferen\'#39'e7as quanto ao objeto das mesmas.\f1\par'#13#10'\par'#13#10 +
          '\pard\fi-284\li284\tx284\f0 5. Que concordo, ainda, que a op\'#39'e7' +
          '\'#39'e3o ora feita, voluntariamente, sem v\'#39'edcio ou coa\'#39'e7\'#39'e3o, ' +
          'representa transa\'#39'e7\'#39'e3o de direitos, na \par'#13#10'      forma dos' +
          ' artigos 1.025 e seguintes do C\'#39'f3digo Civil, em face do que, j' +
          'untamente com o pedido de desist\'#39'eancia das a\'#39'e7\'#39'f5es \par'#13#10' ' +
          '     formulado em Ju\'#39'edzo, ser\'#39'e1 juntada uma via do Termo de ' +
          'Transa\'#39'e7\'#39'e3o Judicial*, para os efeitos dos artigos 1.028 e 1' +
          '.030 do \par'#13#10'      mesmo C\'#39'f3digo Civil, e 269, inciso III, do' +
          ' C\'#39'f3digo de Processo Civil, valendo esta como parte integrante' +
          ' da peti\'#39'e7\'#39'e3o que \par'#13#10'      formular o citado pedido de de' +
          'sist\'#39'eancia.\f1\par'#13#10'\par'#13#10'\pard\f0 6. Considerando que o Plano' +
          ' de Benef\'#39'edcios BrTPREV oferece 03 (tr\'#39'eas) modalidades de be' +
          'nef\'#39'edcios para transa\'#39'e7\'#39'e3o, \b\f1 escolho \par'#13#10'\f0      \' +
          'f1 entre uma das alternativas abaixo:\b0  \par'#13#10'\f2\par'#13#10'}'#13#10
        mmHeight = 115888
        mmLeft = 6085
        mmTop = 29369
        mmWidth = 187061
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Benefício Saldado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 146844
        mmWidth = 26988
        BandType = 4
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = '(Opção 1 )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 39688
        mmTop = 146844
        mmWidth = 15875
        BandType = 4
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 
          'destinando uma parcela de minha Reserva de Transferência calcula' +
          'da no PLANO  DE  ORIGEM,  à  Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 38894
        mmTop = 152136
        mmWidth = 154252
        BandType = 4
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Identificada da Patrocinadora - CPI do BrTPREV, no valor de R$  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 156104
        mmWidth = 94192
        BandType = 4
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = '('
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 133086
        mmTop = 156104
        mmWidth = 1058
        BandType = 4
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = 
          '), não podendo minha Reserva de Transferência, após deduzida des' +
          'te valor, ser inferior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 65352
        mmTop = 160338
        mmWidth = 127794
        BandType = 4
      end
      object ppLabel38: TppLabel
        UserName = 'Label38'
        Caption = 'à minha Reserva de Poupança do PLANO DE ORIGEM. '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 164571
        mmWidth = 81492
        BandType = 4
      end
      object ppLabel39: TppLabel
        UserName = 'Label39'
        Caption = '(Opção 2)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 92869
        mmTop = 164571
        mmWidth = 14817
        BandType = 4
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        AutoSize = False
        Caption = 
          'Benefício na modalidade de Contribuição Definida, sem direito ao' +
          ' Benefício Saldado.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 170127
        mmWidth = 124619
        BandType = 4
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = '(Opção 3)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 135732
        mmTop = 169863
        mmWidth = 14817
        BandType = 4
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        AutoSize = False
        Caption = 'Benefício Saldado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 151871
        mmWidth = 26723
        BandType = 4
      end
      object ppRichText2: TppRichText
        UserName = 'RichText2'
        Caption = 'RichText2'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
          'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss MS San' +
          's Serif;}}'#13#10'\viewkind4\uc1\pard\tx432\f0\fs18 7. Tenho pleno con' +
          'hecimento, pelo presente Termo, de que meus benefici\'#39'e1rios ins' +
          'critos no PLANO DE ORIGEM ser\'#39'e3o transferidos para o BrTPREV e' +
          ' que poderei proceder altera\'#39'e7\'#39'f5es ou novas inscri\'#39'e7\'#39'f5es' +
          ' posteriormente.\f1\par'#13#10'\par'#13#10'\pard 8. Inscrevo meu(s) \b\f0 Be' +
          'nefici\'#39'e1rio(s) Designado(s)\b0 , nos termos que disp\'#39'f5e o Re' +
          'gulamento do Plano de Benef\'#39'edcios BrTPREV, declarando saber qu' +
          'e estes s\'#39'f3 ter\'#39'e3o direito ao recebimento de qualquer benef\' +
          #39'edcio caso inexista algum Benefici\'#39'e1rio inscrito neste Plano.' +
          '\f2\fs16\par'#13#10'}'#13#10
        mmHeight = 24606
        mmLeft = 6085
        mmTop = 177800
        mmWidth = 187061
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppShape13: TppShape
        UserName = 'Shape13'
        mmHeight = 36513
        mmLeft = 20638
        mmTop = 205052
        mmWidth = 162984
        BandType = 4
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 31750
        mmTop = 206111
        mmWidth = 8996
        BandType = 4
      end
      object ppLabel45: TppLabel
        UserName = 'Label45'
        Caption = 'Sexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 142082
        mmTop = 206111
        mmWidth = 7673
        BandType = 4
      end
      object ppLabel46: TppLabel
        UserName = 'Label46'
        Caption = 'Data Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 155575
        mmTop = 206111
        mmWidth = 26194
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 20638
        mmTop = 210344
        mmWidth = 162984
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 20638
        mmTop = 215371
        mmWidth = 162984
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 20638
        mmTop = 220398
        mmWidth = 162984
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 20638
        mmTop = 225425
        mmWidth = 162984
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 20638
        mmTop = 230453
        mmWidth = 162984
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 20638
        mmTop = 236009
        mmWidth = 162984
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 36513
        mmLeft = 30163
        mmTop = 205052
        mmWidth = 1058
        BandType = 4
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 36513
        mmLeft = 139965
        mmTop = 205052
        mmWidth = 1058
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 36513
        mmLeft = 152665
        mmTop = 205052
        mmWidth = 1058
        BandType = 4
      end
      object ppLabel47: TppLabel
        UserName = 'Label47'
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 211403
        mmWidth = 1852
        BandType = 4
      end
      object ppLabel48: TppLabel
        UserName = 'Label48'
        Caption = '2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 216430
        mmWidth = 1852
        BandType = 4
      end
      object ppLabel49: TppLabel
        UserName = 'Label49'
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 221457
        mmWidth = 1852
        BandType = 4
      end
      object ppLabel50: TppLabel
        UserName = 'Label50'
        Caption = '4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 226484
        mmWidth = 1852
        BandType = 4
      end
      object ppLabel51: TppLabel
        UserName = 'Label51'
        Caption = '5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 231511
        mmWidth = 1852
        BandType = 4
      end
      object ppLabel52: TppLabel
        UserName = 'Label52'
        Caption = '6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 237067
        mmWidth = 1852
        BandType = 4
      end
      object ppShape32: TppShape
        UserName = 'Shape32'
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 170127
        mmWidth = 4233
        BandType = 4
      end
      object ppShape33: TppShape
        UserName = 'Shape33'
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 151871
        mmWidth = 4233
        BandType = 4
      end
      object ppShape34: TppShape
        UserName = 'Shape34'
        mmHeight = 3969
        mmLeft = 6085
        mmTop = 146844
        mmWidth = 4233
        BandType = 4
      end
      object ppLine47: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 7144
        mmTop = 5821
        mmWidth = 153723
        BandType = 4
      end
      object ppLine48: TppLine
        UserName = 'Line9'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 87048
        mmTop = 10319
        mmWidth = 43392
        BandType = 4
      end
      object ppLine49: TppLine
        UserName = 'Line12'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 144727
        mmTop = 15610
        mmWidth = 45244
        BandType = 4
      end
      object ppLine50: TppLine
        UserName = 'Line13'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 104246
        mmTop = 159544
        mmWidth = 27781
        BandType = 4
      end
      object ppLine51: TppLine
        UserName = 'Line14'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 134673
        mmTop = 159544
        mmWidth = 58473
        BandType = 4
      end
      object ppLine52: TppLine
        UserName = 'Line15'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 10848
        mmTop = 163513
        mmWidth = 52652
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand6: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppTermoAtivoPagina2: TppSubReport
        UserName = 'TermoAtivoPagina2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 529
        mmWidth = 196030
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport7: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 3810
          PrinterSetup.mmMarginLeft = 10160
          PrinterSetup.mmMarginRight = 3810
          PrinterSetup.mmMarginTop = 10160
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 624
          Top = 531
          Version = '7.04'
          mmColumnWidth = 0
          object ppTitleBand7: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 8467
            mmPrintPosition = 0
          end
          object ppDetailBand9: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 260086
            mmPrintPosition = 0
            object ppRichText3: TppRichText
              UserName = 'RichText3'
              Caption = 'RichText3'
              RichText = 
                '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
                'rq2 Arial;}{\f1\fswiss\fprq2\fcharset0 Arial;}{\f2\fswiss MS San' +
                's Serif;}}'#13#10'{\colortbl ;\red0\green0\blue0;}'#13#10'\viewkind4\uc1\par' +
                'd\cf1\b\f0\fs18 9. Autorizo\b0\f1  que seja procedido o desconto' +
                ', atrav\'#39'e9s de parcelas regulares/mensais em folha de pagamento' +
                ', das minhas contribui\'#39'e7\'#39'f5es nos percentuais a seguir defini' +
                'dos, aplic\'#39'e1veis sobre meu Sal\'#39'e1rio de Participa\'#39'e7\'#39'e3o:\c' +
                'f0\f2\fs16\par'#13#10'}'#13#10
              mmHeight = 8731
              mmLeft = 6085
              mmTop = 529
              mmWidth = 187061
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
            end
            object ppLabel53: TppLabel
              UserName = 'Label53'
              Caption = 'Contribuição Básica (*)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 6879
              mmTop = 10054
              mmWidth = 35454
              BandType = 4
            end
            object ppLabel54: TppLabel
              UserName = 'Label54'
              Caption = 'Contribuição Básica mensal, inicial de '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 6879
              mmTop = 14817
              mmWidth = 55563
              BandType = 4
            end
            object ppLabel55: TppLabel
              UserName = 'Label55'
              Caption = ' % ('
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 72761
              mmTop = 14817
              mmWidth = 5821
              BandType = 4
            end
            object ppLabel56: TppLabel
              UserName = 'Label56'
              Caption = '),'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 127000
              mmTop = 14817
              mmWidth = 2117
              BandType = 4
            end
            object ppRichText4: TppRichText
              UserName = 'RichText4'
              Caption = 'RichText4'
              RichText = 
                '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
                'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss MS San' +
                's Serif;}}'#13#10'\viewkind4\uc1\pard\tx540\tx4820\f0\fs18 sobre o Sal' +
                '\'#39'e1rio de Participa\'#39'e7\'#39'e3o, no m\'#39'ednimo, correspondente ao i' +
                'n\'#39'edcio da faixa et\'#39'e1ria definida em Regulamento, sendo esta ' +
                '\b obrigat\'#39'f3ria\b0\f1  e com contrapartida da Patrocinadora. \' +
                'par'#13#10'\pard\f2\fs16\par'#13#10'}'#13#10
              mmHeight = 11642
              mmLeft = 6085
              mmTop = 18785
              mmWidth = 121444
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
            end
            object ppShape14: TppShape
              UserName = 'Shape14'
              mmHeight = 25665
              mmLeft = 135996
              mmTop = 9790
              mmWidth = 57150
              BandType = 4
            end
            object ppLabel57: TppLabel
              UserName = 'Label57'
              AutoSize = False
              Caption = '(*) Tabela de Contribuição Básica mensal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 139436
              mmTop = 10319
              mmWidth = 50271
              BandType = 4
            end
            object ppLabel58: TppLabel
              UserName = 'Label58'
              Caption = 'Até 25 anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 137319
              mmTop = 14288
              mmWidth = 13758
              BandType = 4
            end
            object ppLabel59: TppLabel
              UserName = 'Label59'
              Caption = 'De 26 a 30 anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 137319
              mmTop = 17727
              mmWidth = 18256
              BandType = 4
            end
            object ppLabel60: TppLabel
              UserName = 'Label60'
              Caption = 'De 31 a 35 anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 137319
              mmTop = 24606
              mmWidth = 18256
              BandType = 4
            end
            object ppLabel61: TppLabel
              UserName = 'Label61'
              AutoSize = False
              Caption = 'De 36 a 40 anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 137054
              mmTop = 21167
              mmWidth = 18256
              BandType = 4
            end
            object ppLabel63: TppLabel
              UserName = 'Label63'
              AutoSize = False
              Caption = 'De 3% a 8% do SP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 14288
              mmWidth = 24077
              BandType = 4
            end
            object ppLabel64: TppLabel
              UserName = 'Label64'
              Caption = 'De 4% a *% do SP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 17727
              mmWidth = 24871
              BandType = 4
            end
            object ppLabel65: TppLabel
              UserName = 'Label601'
              Caption = 'De 5% a 8% do SP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 21167
              mmWidth = 24606
              BandType = 4
            end
            object ppLabel66: TppLabel
              UserName = 'Label66'
              AutoSize = False
              Caption = 'De 6% a 8% do SP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 24606
              mmWidth = 22754
              BandType = 4
            end
            object ppLabel67: TppLabel
              UserName = 'Label67'
              Caption = '8% do SP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 31485
              mmWidth = 14023
              BandType = 4
            end
            object ppLabel68: TppLabel
              UserName = 'Label68'
              Caption = 'Contribuição Voluntária'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 5821
              mmTop = 32544
              mmWidth = 36513
              BandType = 4
            end
            object ppLabel69: TppLabel
              UserName = 'Label69'
              Caption = '% ('
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 15346
              mmTop = 37306
              mmWidth = 5027
              BandType = 4
            end
            object ppLabel70: TppLabel
              UserName = 'Label70'
              Caption = '),'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 67998
              mmTop = 37306
              mmWidth = 2117
              BandType = 4
            end
            object ppLabel71: TppLabel
              UserName = 'Label71'
              Caption = 'Contribuição Voluntária, mensal de até 22%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 71438
              mmTop = 37306
              mmWidth = 62971
              BandType = 4
            end
            object ppLabel72: TppLabel
              UserName = 'Label72'
              Caption = 
                '( vinte e dois por cento) aplicável sobre o Salário de Participa' +
                'ção, sem contrapartida da '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 71438
              mmTop = 41540
              mmWidth = 125942
              BandType = 4
            end
            object ppLabel73: TppLabel
              UserName = 'Label73'
              Caption = 'Patrocinadora.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 71438
              mmTop = 46038
              mmWidth = 20902
              BandType = 4
            end
            object ppRichText5: TppRichText
              UserName = 'RichText5'
              Caption = 'RichText5'
              RichText = 
                '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
                'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss MS San' +
                's Serif;}}'#13#10'\viewkind4\uc1\pard\fi-284\li284\tx284\tx540\tx900\f' +
                '0\fs18 10. Estou ciente de que no m\'#39'eas de dezembro de cada ano' +
                ' deverei informar os novos percentuais m\'#39'ednimos para c\'#39'e1lcul' +
                'o de minhas contribui\'#39'e7\'#39'f5es B\'#39'e1sica e Volunt\'#39'e1ria. Caso ' +
                'n\'#39'e3o o fa\'#39'e7a, ser\'#39'e3o mantidos para o(s) ano(s) seguinte(s)' +
                ' os \'#39'faltimos percentuais informados.\f1\par'#13#10'\par'#13#10'\f0 11. Con' +
                'cordo que a presente transa\'#39'e7\'#39'e3o seja \b\f1 homologada \b0 s' +
                'omente\b\f0  ap\'#39'f3s an\'#39'e1lise do pedido e da entrega das c\'#39'f3' +
                'pias das Peti\'#39'e7\'#39'f5es para desist\'#39'eancias de A\'#39'e7\'#39'f5es Judi' +
                'ciais, caso houver\b0\f1 , \b\f0 de acordo com o Termo de Transa' +
                '\'#39'e7\'#39'e3o Judicial* \b0 e comunicada posteriormente atrav\'#39'e9s d' +
                'e correspond\'#39'eancia da FCRT. \f1\par'#13#10'\par'#13#10'\pard\f0 Declaro te' +
                'r ci\'#39'eancia de que a simula\'#39'e7\'#39'e3o anexa a este Termo foi rea' +
                'lizada com a base de dados anterior ao m\'#39'eas desta Transa\'#39'e7\'#39 +
                'e3o e estar\'#39'e1 sujeita a atualiza\'#39'e7\'#39'e3o.\f1\par'#13#10'\par'#13#10'\f0 D' +
                'eclaro, por fim, que todas as informa\'#39'e7\'#39'f5es acima prestadas ' +
                's\'#39'e3o verdadeiras e comprometo-me a informar \'#39'e0 Funda\'#39'e7\'#39'e3' +
                'o CRT futuras modifica\'#39'e7\'#39'f5es que vierem a ocorrer a partir d' +
                'a presente data em at\'#39'e9 30 (trinta) dias de sua ocorr\'#39'eancia,' +
                ' juntando os documentos exigidos, bem como respeitar e observar ' +
                'o Estatuto e o Regulamento vigentes, assim como as poss\'#39'edveis ' +
                'altera\'#39'e7\'#39'f5es Estatut\'#39'e1rias e Regulamentares que vierem a s' +
                'er institu\'#39'eddas pela Entidade.\f1\par'#13#10'\pard\fi-3969\li3969\tx' +
                '540\tx900\tx3828\par'#13#10'\par'#13#10'__________________________, ________' +
                ' de ____________________ de _________.\par'#13#10'\par'#13#10'\pard\fi-567\l' +
                'i567\tx540\tx900\par'#13#10'_______________________________________   ' +
                '                              \tab\f0 Funda\'#39'e7\'#39'e3o CRT recebid' +
                'o em:____/____/____\f1\par'#13#10'Assinatura do Participante\tab\tab\t' +
                'ab                             \tab\par'#13#10'\f0\par'#13#10'\tab\tab\tab\t' +
                'ab\tab\tab\tab\tab\tab\tab Respons\'#39'e1vel:  ____________________' +
                '____\par'#13#10'\par'#13#10'N\'#39'ba do CPF ou RG _________________________\f1\' +
                'tab\tab\tab Assinatura ___________________________\par'#13#10'\par'#13#10'\p' +
                'ard\f2\fs16\par'#13#10'}'#13#10
              mmHeight = 105304
              mmLeft = 5821
              mmTop = 51329
              mmWidth = 187061
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
            end
            object ppLine53: TppLine
              UserName = 'Line53'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 63236
              mmTop = 17727
              mmWidth = 8996
              BandType = 4
            end
            object ppLine54: TppLine
              UserName = 'Line54'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 79111
              mmTop = 17727
              mmWidth = 46831
              BandType = 4
            end
            object ppLine55: TppLine
              UserName = 'Line55'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 5821
              mmTop = 40746
              mmWidth = 8996
              BandType = 4
            end
            object ppLine56: TppLine
              UserName = 'Line56'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 21167
              mmTop = 40746
              mmWidth = 45773
              BandType = 4
            end
            object ppLabel175: TppLabel
              UserName = 'Label175'
              AutoSize = False
              Caption = 'De 41 a 45 anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 137319
              mmTop = 28046
              mmWidth = 18256
              BandType = 4
            end
            object ppLabel176: TppLabel
              UserName = 'Label176'
              AutoSize = False
              Caption = 'De 7% a 8% do SP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 28046
              mmWidth = 22754
              BandType = 4
            end
            object ppLabel62: TppLabel
              UserName = 'Label1'
              Caption = 'Acima de 45 anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 137319
              mmTop = 31485
              mmWidth = 20638
              BandType = 4
            end
          end
          object ppFooterBand5: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13494
            mmPrintPosition = 0
            object ppRichText6: TppRichText
              UserName = 'RichText6'
              Caption = 'RichText6'
              RichText = 
                '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
                'rq2 Arial;}{\f1\fswiss\fprq2\fcharset0 Arial;}{\f2\fswiss Arial;' +
                '}}'#13#10'\viewkind4\uc1\pard\fi-142\li142\tx142\tx900\f0\fs18 * \b\f1' +
                ' Termo de Transa\'#39'e7\'#39'e3o Judicial - \b0 Acordo assinado pelas E' +
                'ntidades representativas dos Empregados e Assistidos da Brasil T' +
                'elecom em mar\'#39'e7o de 2002 e  aprovado pelas Assembl\'#39'e9ias Gera' +
                'is dos mesmos.\f2\fs24\par'#13#10'}'#13#10
              mmHeight = 9260
              mmLeft = 5821
              mmTop = 2381
              mmWidth = 187061
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
            end
          end
        end
      end
    end
  end
  object ppTermoAtivo: TppBDEPipeline
    DataSource = dsTermoAtivo
    SkipWhenNoRecords = False
    UserName = 'Demonstrativo2'
    Left = 353
    Top = 24
    object ppTermoAtivoppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object ppTermoAtivoppField2: TppField
      FieldAlias = 'NOMEPARTICIPANTE'
      FieldName = 'NOMEPARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppTermoAtivoppField3: TppField
      FieldAlias = 'NOMEPLANOATUAL'
      FieldName = 'NOMEPLANOATUAL'
      FieldLength = 11
      DisplayWidth = 11
      Position = 2
    end
    object ppTermoAtivoppField4: TppField
      FieldAlias = 'NOMEPATROCINADORA'
      FieldName = 'NOMEPATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppTermoAtivoppField5: TppField
      FieldAlias = 'DATADADOS'
      FieldName = 'DATADADOS'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppTermoAtivoppField6: TppField
      FieldAlias = 'DATATRANSACAO'
      FieldName = 'DATATRANSACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppTermoAtivoppField7: TppField
      FieldAlias = 'CAMPORELAT1'
      FieldName = 'CAMPORELAT1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object ppTermoAtivoppField8: TppField
      FieldAlias = 'CAMPORELAT2'
      FieldName = 'CAMPORELAT2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 7
    end
    object ppTermoAtivoppField9: TppField
      FieldAlias = 'CAMPORELAT3'
      FieldName = 'CAMPORELAT3'
      FieldLength = 100
      DisplayWidth = 100
      Position = 8
    end
    object ppTermoAtivoppField10: TppField
      FieldAlias = 'CAMPORELAT4'
      FieldName = 'CAMPORELAT4'
      FieldLength = 100
      DisplayWidth = 100
      Position = 9
    end
    object ppTermoAtivoppField11: TppField
      FieldAlias = 'CAMPORELAT5'
      FieldName = 'CAMPORELAT5'
      FieldLength = 100
      DisplayWidth = 100
      Position = 10
    end
    object ppTermoAtivoppField12: TppField
      FieldAlias = 'CAMPORELAT6'
      FieldName = 'CAMPORELAT6'
      FieldLength = 100
      DisplayWidth = 100
      Position = 11
    end
    object ppTermoAtivoppField13: TppField
      FieldAlias = 'CAMPORELAT7'
      FieldName = 'CAMPORELAT7'
      FieldLength = 100
      DisplayWidth = 100
      Position = 12
    end
    object ppTermoAtivoppField14: TppField
      FieldAlias = 'CAMPORELAT8'
      FieldName = 'CAMPORELAT8'
      FieldLength = 100
      DisplayWidth = 100
      Position = 13
    end
    object ppTermoAtivoppField15: TppField
      FieldAlias = 'CAMPORELAT9'
      FieldName = 'CAMPORELAT9'
      FieldLength = 100
      DisplayWidth = 100
      Position = 14
    end
    object ppTermoAtivoppField16: TppField
      FieldAlias = 'CAMPORELAT10'
      FieldName = 'CAMPORELAT10'
      FieldLength = 100
      DisplayWidth = 100
      Position = 15
    end
  end
  object dsTermoAtivo: TwwDataSource
    DataSet = qryTermoAtivo
    Left = 353
    Top = 40
  end
  object qryTermoAtivo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EL.MATRICULA,'
      '       P.NOME AS NOMEPARTICIPANTE,'
      
        '       DECODE(PL.IDPLANOPREV, 3, '#39'FUNDADOR'#39', '#39'ALTERNATIVO'#39') NOME' +
        'PLANOATUAL,'
      '       PT.NOME AS NOMEPATROCINADORA,'
      '       :DATADADOS,'
      '       SYSDATE AS DATATRANSACAO,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT1,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT2,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT3,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT4,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT5,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT6,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT7,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT8,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT9,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT10'
      
        'FROM   PESSOA P, PESSOA PT, ELEGPATRO EL, PARTPREVPLAN PP, PLANP' +
        'REV PL,'
      '       EVENTOGERADOR EG'
      'WHERE  EL.IDPESSJUR      = :IDPESSJUR'
      'AND    EL.IDPESSOA       = :IDPESSOA'
      'AND    P.IDPESSOA        = EL.IDPESSOA'
      'AND    PT.IDPESSOA       = EL.IDPESSJUR '
      'AND    PP.IDPESSJUR      = EL.IDPESSJUR'
      'AND    PP.IDPESSOA       = EL.IDPESSOA'
      'AND    PP.FLGDESATIVADO  = 0'
      'AND    PL.IDPLANOPREV    = PP.IDPLANOPREV'
      'AND    EG.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updTermoAtivo
    ValidateWithMask = True
    Left = 353
    Top = 58
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATADADOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '8636'
      end
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
        Value = '45'
      end>
  end
  object updTermoAtivo: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 356
    Top = 70
  end
  object DsgnATIVOS: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.DatabaseName = 'BaseDados'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpTermoAtivo
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 356
    Top = 85
  end
  object rpTermoAssist: TppReport
    AutoStop = False
    DataPipeline = ppTermoAssist
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 3810
    PrinterSetup.mmMarginLeft = 10160
    PrinterSetup.mmMarginRight = 3810
    PrinterSetup.mmMarginTop = 10160
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 353
    Top = 138
    Version = '7.04'
    mmColumnWidth = 196030
    DataPipelineName = 'ppTermoAssist'
    object ppTitleBand9: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 28046
      mmPrintPosition = 0
      object ppDBImage2: TppDBImage
        UserName = 'rpBenefProvDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 14023
        mmLeft = 177007
        mmTop = 0
        mmWidth = 17463
        BandType = 1
      end
      object ppLabel74: TppLabel
        UserName = 'ppLabel1'
        Caption = 'TERMO DE TRANSAÇÃO EXTRAJUDICIAL E OPÇÃO DE MIGRAÇÃO AO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 23548
        mmTop = 11113
        mmWidth = 144727
        BandType = 1
      end
      object ppDBText32: TppDBText
        UserName = 'ppRepRelBeneficiosDBText2'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5292
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 35719
        BandType = 1
      end
      object ppLabel75: TppLabel
        UserName = 'Label25'
        Caption = 'PLANO DE BENEFÍCIOS BrTPREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 65617
        mmTop = 16933
        mmWidth = 68527
        BandType = 1
      end
      object ppLabel76: TppLabel
        UserName = 'Label41'
        Caption = 'PARTICIPANTE APOSENTADO DOS PLANOS FUNDADOR OU ALTERNATIVO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 27252
        mmTop = 22754
        mmWidth = 155046
        BandType = 1
      end
    end
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand10: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 250296
      mmPrintPosition = 0
      object ppLabel77: TppLabel
        UserName = 'Label1'
        Caption = 'Eu,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 1852
        mmWidth = 5292
        BandType = 4
      end
      object ppLabel79: TppLabel
        UserName = 'Label3'
        Caption = ', pertencente ao Plano de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 40217
        mmTop = 11906
        mmWidth = 58208
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppTermoAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppTermoAssist'
        mmHeight = 3969
        mmLeft = 22490
        mmTop = 11906
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText2'
        DataField = 'NOMEPARTICIPANTE'
        DataPipeline = ppTermoAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTermoAssist'
        mmHeight = 3969
        mmLeft = 7408
        mmTop = 1852
        mmWidth = 147109
        BandType = 4
      end
      object ppLabel80: TppLabel
        UserName = 'Label5'
        Caption = ', abaixo assinado(a),'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 156369
        mmTop = 1852
        mmWidth = 32808
        BandType = 4
      end
      object ppLabel82: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 
          'da   Fundação   dos   Empregados   da   Companhia   Riograndense' +
          '   de   Telecomunicações   -   FCRT,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 26723
        mmTop = 6615
        mmWidth = 162454
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText23'
        DataField = 'NOMEPLANOATUAL'
        DataPipeline = ppTermoAssist
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppTermoAssist'
        mmHeight = 3969
        mmLeft = 99748
        mmTop = 11906
        mmWidth = 32279
        BandType = 4
      end
      object ppLabel83: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'solicito pelo presente :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 133615
        mmTop = 11906
        mmWidth = 34396
        BandType = 4
      end
      object ppShape15: TppShape
        UserName = 'Shape4'
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 17727
        mmWidth = 4233
        BandType = 4
      end
      object ppLabel84: TppLabel
        UserName = 'Label29'
        Caption = 'manutenção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 7673
        mmTop = 17727
        mmWidth = 20902
        BandType = 4
      end
      object ppLabel85: TppLabel
        UserName = 'Label30'
        Caption = 'no Plano de Benefícios acima citado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 29369
        mmTop = 17727
        mmWidth = 57679
        BandType = 4
      end
      object ppShape16: TppShape
        UserName = 'Shape9'
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 23283
        mmWidth = 4233
        BandType = 4
      end
      object ppRichText7: TppRichText
        UserName = 'RichText1'
        Caption = 'RichText1'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
          'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss Arial;' +
          '}}'#13#10'{\colortbl ;\red0\green0\blue0;}'#13#10'\viewkind4\uc1\pard\b\f0\f' +
          's20 op\'#39'e7\'#39'e3o pela migra\'#39'e7\'#39'e3o\b0  para o Plano de Benef\'#39'e' +
          'dcios BrTPREV, declarando estar ciente e concordar com todos os ' +
          'direitos e obriga\'#39'e7\'#39'f5es previstos no Estatuto da Funda\'#39'e7\'#39 +
          'e3o CRT e no  Regulamento do Plano de Benef\'#39'edcios BrTPREV, dos' +
          ' quais recebi um exemplar e a correspondente cartilha, concordan' +
          'do com o que segue:\f1\par'#13#10'\pard\fi-284\li284\cf1\par'#13#10'\f0 1. Q' +
          'ue a op\'#39'e7\'#39'e3o por me vincular ao Plano de Benef\'#39'edcios BrTPR' +
          'EV automaticamente cancela todos os efeitos de minha participa\'#39 +
          'e7\'#39'e3o no PLANO DE ORIGEM, ao qual estava vinculado (a), outorg' +
          'ando plena, rasa e geral quita\'#39'e7\'#39'e3o a todo e qualquer direit' +
          'o que tenha adquirido em rela\'#39'e7\'#39'e3o ao PLANO DE ORIGEM, para ' +
          'mais nada reclamar, seja em ju\'#39'edzo ou fora dele, constituindo ' +
          'transa\'#39'e7\'#39'e3o de direitos, recebendo, em contrapartida, um Ben' +
          'ef\'#39'edcio Saldado que dever\'#39'e1 ser igual ao valor l\'#39'edquido em' +
          ' reais do Beneficio pago pelo PLANO D\f1 E ORIGEM, observado o d' +
          'isposto no Regulamento do BrTPREV.\par'#13#10'\pard\fi-284\li284\tx432' +
          '\par'#13#10'\pard\fi-284\li284\f0 2. Que em raz\'#39'e3o da transa\'#39'e7\'#39'e3' +
          'o e conseq\'#39'fcente op\'#39'e7\'#39'e3o pela migra\'#39'e7\'#39'e3o para o Plano ' +
          'de Benef\'#39'edcios BrTPREV terei constitu\'#39'edda a Reserva Matem\'#39'e' +
          '1tica de Benef\'#39'edcios Concedidos Saldados com o valor atuarial ' +
          'da Reserva Matem\'#39'e1tica de Benef\'#39'edcios Concedidos, calculada ' +
          'de forma individual e atuarialmente, com base na Nota T\'#39'e9cnica' +
          ' do BrTPREV. \f1\par'#13#10'\par'#13#10'\pard\f0 3. Em decorr\'#39'eancia da Tra' +
          'nsa\'#39'e7\'#39'e3o e conseq\'#39'fcente op\'#39'e7\'#39'e3o pela migra\'#39'e7\'#39'e3o pa' +
          'ra o Plano BrTPREV, \b\f1 escolho entre uma \par'#13#10'    das altern' +
          'ativas abaixo\b0 :\f2\fs24\par'#13#10'}'#13#10
        mmHeight = 73025
        mmLeft = 7144
        mmTop = 23548
        mmWidth = 187061
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppShape22: TppShape
        UserName = 'Shape22'
        mmHeight = 3969
        mmLeft = 11906
        mmTop = 97367
        mmWidth = 4233
        BandType = 4
      end
      object ppLabel78: TppLabel
        UserName = 'Label78'
        Caption = 'Receber '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17463
        mmTop = 97367
        mmWidth = 14288
        BandType = 4
      end
      object ppLabel81: TppLabel
        UserName = 'Label81'
        Caption = '% ('
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 49213
        mmTop = 97367
        mmWidth = 5292
        BandType = 4
      end
      object ppLabel128: TppLabel
        UserName = 'Label128'
        Caption = '= (percentuais inteiros, limitados em 10%,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 110596
        mmTop = 97367
        mmWidth = 70908
        BandType = 4
      end
      object ppLabel129: TppLabel
        UserName = 'Label129'
        Caption = ')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 108479
        mmTop = 97367
        mmWidth = 1058
        BandType = 4
      end
      object ppRichText13: TppRichText
        UserName = 'RichText13'
        Caption = 'RichText13'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
          'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss MS San' +
          's Serif;}}'#13#10'\viewkind4\uc1\pard\fi-284\li426\tx426\tx1276\f0\fs2' +
          '0 do valor correspondente a minha Reserva Matem\'#39'e1tica de Benef' +
          '\'#39'edcios Concedidos Saldados, a t\'#39'edtulo de \f1\par'#13#10'\f0 anteci' +
          'pa\'#39'e7\'#39'e3o, atrav\'#39'e9s de pagamento \'#39'fanico, em at\'#39'e9 30 dias' +
          ' da data da valida\'#39'e7\'#39'e3o da transa\'#39'e7\'#39'e3o,  estando ciente ' +
          '\f1\par'#13#10'\f0 de que o valor mensal do Benef\'#39'edcio Saldado ser\'#39 +
          'e1 reduzido proporcional e atuarialmente \'#39'e0 antecipa\'#39'e7\'#39'e3o ' +
          'por \f1\par'#13#10'mim requerida.\par'#13#10'\pard\f2\fs16\par'#13#10'}'#13#10
        mmHeight = 16933
        mmLeft = 14023
        mmTop = 101865
        mmWidth = 178594
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppShape23: TppShape
        UserName = 'Shape23'
        mmHeight = 3969
        mmLeft = 11906
        mmTop = 119856
        mmWidth = 4233
        BandType = 4
      end
      object ppLabel130: TppLabel
        UserName = 'Label130'
        Caption = 'não'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 17727
        mmTop = 119856
        mmWidth = 6350
        BandType = 4
      end
      object ppLabel131: TppLabel
        UserName = 'Label131'
        Caption = 'desejo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24606
        mmTop = 119856
        mmWidth = 10319
        BandType = 4
      end
      object ppLabel132: TppLabel
        UserName = 'Label132'
        Caption = 'receber'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 35719
        mmTop = 119856
        mmWidth = 13494
        BandType = 4
      end
      object ppLabel133: TppLabel
        UserName = 'Label133'
        AutoSize = False
        Caption = 'antecipação da reserva.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 49742
        mmTop = 119856
        mmWidth = 37835
        BandType = 4
      end
      object ppRichText14: TppRichText
        UserName = 'RichText14'
        Caption = 'RichText14'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
          'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss Arial;' +
          '}}'#13#10'\viewkind4\uc1\pard\tx709\f0\fs20 4. Que farei jus, ainda, c' +
          'omo incentivo \'#39'e0 migra\'#39'e7\'#39'e3o, a:\f1\par'#13#10'\pard\fi-142\li284' +
          '\tx567 a) \b\f0 32,75% (trinta e dois v\'#39'edrgula setenta e cinco' +
          ' por cento)\b0  sobre a Suplementa\'#39'e7\'#39'e3o Bruta do Plano de Or' +
          'igem, \f1\par'#13#10'    o qual desejo receber da seguinte forma:\par'#13 +
          #10'\par'#13#10'\pard\fi-142\li426\tx567\tx709\tx1134\f0      retirada em' +
          ' at\'#39'e9 30 dias contados da data da valida\'#39'e7\'#39'e3o da transa\'#39'e' +
          '7\'#39'e3o, em uma \'#39'fanica parcela, ou.\f1\par'#13#10'\pard\fi-283\li567\' +
          'tx709\tx1134      \par'#13#10'\f0      transfer\'#39'eancia para a minha R' +
          'eserva Matem\'#39'e1tica de Benef\'#39'edcios Concedidos Saldados, com o' +
          ' conseq\'#39'fcente \f1\par'#13#10'\f0      rec\'#39'e1lculo do valor do benef' +
          '\'#39'edcio Saldado L\'#39'edquido.   \f1\par'#13#10'\par'#13#10'\pard\fi-142\li284\' +
          'tx567 b\b ) ABONO\b0\f0  de R$ 1.200,00 (um mil e duzentos reais' +
          '), caso n\'#39'e3o tenha recebido o referido valor quando \f1\par'#13#10'\' +
          'f0     na condi\'#39'e7\'#39'e3o de Ativo, da seguinte forma:\par'#13#10'\f1\p' +
          'ar'#13#10'\pard\fi-142\li284\tx567\tx1134        \b retirada\b0\f0  em' +
          ' at\'#39'e9 30 (trinta) dias contados da data da valida\'#39'e7\'#39'e3o da ' +
          'transa\'#39'e7\'#39'e3o, em uma \'#39'fanica parcela, ou.\f1\par'#13#10'\par'#13#10'\par' +
          'd\fi-283\li567\tx284\tx851\tx1134     \b\f0  transfer\'#39'eancia\b0' +
          '  para a minha Reserva Matem\'#39'e1tica de Benef\'#39'edcios Concedidos' +
          '  Saldados, com o conseq\'#39'fcente \f1\par'#13#10'\f0      rec\'#39'e1lculo ' +
          'do valor do Benef\'#39'edcio Saldado L\'#39'edquido.     \f1\par'#13#10'\par'#13#10 +
          '\pard\f0 5. Que estou ciente de que, caso possua alguma a\'#39'e7\'#39'e' +
          '3o judicial contra a Funda\'#39'e7\'#39'e3o CRT e/ou Brasil Telecom S/A ' +
          'e/ou Celular CRT S/A, tendo por objeto mat\'#39'e9ria an\'#39'e1loga, co' +
          'nexa ou relacionada com a presente transa\'#39'e7\'#39'e3o, ou que diret' +
          'a ou indiretamente venha a obstar a implanta\'#39'e7\'#39'e3o do Plano d' +
          'e Benef\'#39'edcios BrTPREV, esta Transa\'#39'e7\'#39'e3o s\'#39'f3 surtir\'#39'e1 e' +
          'feitos legais ap\'#39'f3s a homologa\'#39'e7\'#39'e3o judicial da desist\'#39'ea' +
          'ncia das mencionadas a\'#39'e7\'#39'f5es, implicando a referida desist\'#39 +
          'eancia na quita\'#39'e7\'#39'e3o de quaisquer diferen\'#39'e7as quanto ao ob' +
          'jeto das mesmas.\f1\par'#13#10'\f2\fs24\par'#13#10'}'#13#10
        mmHeight = 107950
        mmLeft = 7144
        mmTop = 125677
        mmWidth = 187061
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppShape17: TppShape
        UserName = 'Shape17'
        mmHeight = 3969
        mmLeft = 12435
        mmTop = 142346
        mmWidth = 4233
        BandType = 4
      end
      object ppShape18: TppShape
        UserName = 'Shape18'
        mmHeight = 3969
        mmLeft = 12435
        mmTop = 150548
        mmWidth = 4233
        BandType = 4
      end
      object ppShape19: TppShape
        UserName = 'Shape19'
        mmHeight = 3969
        mmLeft = 12435
        mmTop = 174361
        mmWidth = 4233
        BandType = 4
      end
      object ppShape20: TppShape
        UserName = 'Shape20'
        mmHeight = 3970
        mmLeft = 12436
        mmTop = 182299
        mmWidth = 4234
        BandType = 4
      end
      object ppLabel170: TppLabel
        UserName = 'Label170'
        Caption = 'matrícula no.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 11906
        mmWidth = 20638
        BandType = 4
      end
      object ppLabel86: TppLabel
        UserName = 'Label86'
        Caption = 'aposentado (a) '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 6879
        mmWidth = 24606
        BandType = 4
      end
      object ppLine67: TppLine
        UserName = 'Line67'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 7144
        mmTop = 5821
        mmWidth = 148696
        BandType = 4
      end
      object ppLine68: TppLine
        UserName = 'Line68'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 21696
        mmTop = 15875
        mmWidth = 17463
        BandType = 4
      end
      object ppLine69: TppLine
        UserName = 'Line69'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 98690
        mmTop = 16140
        mmWidth = 34131
        BandType = 4
      end
      object ppLine70: TppLine
        UserName = 'Line70'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 32279
        mmTop = 100542
        mmWidth = 15610
        BandType = 4
      end
      object ppLine71: TppLine
        UserName = 'Line71'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 54769
        mmTop = 100542
        mmWidth = 52652
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand7: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'TermoAtivoPagina2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 529
        mmWidth = 196030
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport8: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 3810
          PrinterSetup.mmMarginLeft = 10160
          PrinterSetup.mmMarginRight = 3810
          PrinterSetup.mmMarginTop = 10160
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 624
          Top = 531
          Version = '7.04'
          mmColumnWidth = 0
          object ppTitleBand10: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand11: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 260086
            mmPrintPosition = 0
            object ppRichText11: TppRichText
              UserName = 'RichText5'
              Caption = 'RichText5'
              RichText = 
                '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
                'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss\fprq2 ' +
                'Zurich BT;}{\f3\fswiss Arial;}}'#13#10'\viewkind4\uc1\pard\f0\fs20 6. ' +
                'Que concordo, ainda, que a op\'#39'e7\'#39'e3o ora feita, voluntariament' +
                'e, sem v\'#39'edcio ou coa\'#39'e7\'#39'e3o, representa transa\'#39'e7\'#39'e3o de d' +
                'ireitos, na forma dos artigos 1.025 e seguintes do C\'#39'f3digo Civ' +
                'il, em face do que, juntamente com o pedido de desist\'#39'eancia da' +
                's a\'#39'e7\'#39'f5es formulado em Ju\'#39'edzo, ser\'#39'e1 juntada uma via do ' +
                'Termo de Transa\'#39'e7\'#39'e3o Judicial*, para os efeitos dos artigos ' +
                '1.028 e 1.030 do mesmo C\'#39'f3digo Civil, e 269, inciso III, do C\' +
                #39'f3digo de Processo Civil, valendo esta como parte integrante da' +
                ' peti\'#39'e7\'#39'e3o que formular o citado pedido de desist\'#39'eancia.\p' +
                'ar'#13#10'\f1\par'#13#10'\pard\tx432\f0 7. Que tenho pleno conhecimento, pel' +
                'o presente Termo, de que meus benefici\'#39'e1rios inscritos no PLAN' +
                'O DE ORIGEM ser\'#39'e3o transferidos para o BrTPREV e que poderei p' +
                'roceder altera\'#39'e7\'#39'f5es ou novas inscri\'#39'e7\'#39'f5es posteriorment' +
                'e.\par'#13#10'\f1\par'#13#10'\pard\f0 8. Que estou ciente de que a presente ' +
                'transa\'#39'e7\'#39'e3o ser\'#39'e1 \b homologada ap\'#39'f3s an\'#39'e1lise deste T' +
                'ermo e da entrega das c\'#39'f3pias das Peti\'#39'e7\'#39'f5es para desist\'#39 +
                'eancias de A\'#39'e7\'#39'f5es Judiciais, caso houver, de acordo com o T' +
                'ermo de Transa\'#39'e7\'#39'e3o Judicial*, \b0 e comunicada posteriormen' +
                'te atrav\'#39'e9s de correspond\'#39'eancia da FCRT.\par'#13#10'\f1\par'#13#10'\f0 D' +
                'eclaro ter ci\'#39'eancia de que a simula\'#39'e7\'#39'e3o anexa a este Term' +
                'o foi realizada com a base de dados anterior ao m\'#39'eas desta Tra' +
                'nsa\'#39'e7\'#39'e3o e estar\'#39'e1 sujeita a atualiza\'#39'e7\'#39'e3o.\par'#13#10'\f1\p' +
                'ar'#13#10'\f0 Declaro, por fim, que todas as informa\'#39'e7\'#39'f5es acima p' +
                'restadas s\'#39'e3o verdadeiras e comprometo-me a informar \'#39'e0 Fund' +
                'a\'#39'e7\'#39'e3o CRT futuras modifica\'#39'e7\'#39'f5es que vierem a ocorrer a' +
                ' partir da presente data em at\'#39'e9 30 (trinta) dias de sua ocorr' +
                '\'#39'eancia, juntando os documentos exigidos, bem como respeitar e ' +
                'observar o Estatuto e o Regulamento vigentes, assim como as poss' +
                '\'#39'edveis altera\'#39'e7\'#39'f5es Estatut\'#39'e1rias e Regulamentares que v' +
                'ierem a ser institu\'#39'eddas pela Entidade.\f1\par'#13#10'\pard\fi-3969\' +
                'li3969\tx540\tx900\tx3828\par'#13#10'\par'#13#10'__________________________,' +
                ' ________ de ____________________ de _________.\par'#13#10'\par'#13#10'\pard' +
                '\fi-567\li567\tx540\tx900\par'#13#10'\par'#13#10'\pard\fi-567\li567\tx540\tx' +
                '900\tx5954 ____________________________________________ \tab\f0 ' +
                'Funda\'#39'e7\'#39'e3o CRT recebido em:____/____/____\par'#13#10'\f1 Assinatur' +
                'a do Aposentado ou do \tab\par'#13#10'\f0 Representante Legal (anexar ' +
                'c\'#39'f3pia do documento legal)\tab Respons\'#39'e1vel:  ______________' +
                '__________\par'#13#10'\f1\par'#13#10'\tab\f0\tab\tab\tab\f1 Assinatura______' +
                '______________________\par'#13#10'\par'#13#10'CPF ou RG_____________________' +
                '________________\par'#13#10'\par'#13#10'\par'#13#10'\par'#13#10'\par'#13#10'\par'#13#10'\par'#13#10'\par'#13#10 +
                '\par'#13#10'\par'#13#10'\par'#13#10'\par'#13#10'\f2\fs18   \par'#13#10'\par'#13#10'\par'#13#10'\par'#13#10'\par'#13 +
                #10'\par'#13#10'\pard\f3\fs24\par'#13#10'}'#13#10
              mmHeight = 193675
              mmLeft = 5821
              mmTop = 1058
              mmWidth = 187061
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
            end
          end
          object ppFooterBand7: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand8: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13494
            mmPrintPosition = 0
            object ppRichText12: TppRichText
              UserName = 'RichText6'
              Caption = 'RichText6'
              RichText = 
                '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
                'rq2 Arial;}{\f1\fswiss\fprq2\fcharset0 Arial;}{\f2\fswiss MS San' +
                's Serif;}}'#13#10'\viewkind4\uc1\pard\fi-142\li142\tx142\tx900\f0\fs18' +
                ' * \b\f1 Termo de Transa\'#39'e7\'#39'e3o Judicial - \b0 Acordo assinado' +
                ' pelas Entidades representativas dos Empregados e Assistidos da ' +
                'Brasil Telecom em mar\'#39'e7o de 2002 e  aprovado pelas Assembl\'#39'e9' +
                'ias Gerais dos mesmos.\f0\fs22\par'#13#10'\pard\f2\fs16\par'#13#10'}'#13#10
              mmHeight = 9260
              mmLeft = 5821
              mmTop = 2381
              mmWidth = 187061
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
            end
          end
        end
      end
    end
  end
  object ppTermoAssist: TppBDEPipeline
    DataSource = dsTermoAssist
    SkipWhenNoRecords = False
    UserName = 'TermoAssist'
    Left = 353
    Top = 153
    object ppTermoAssistppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object ppTermoAssistppField2: TppField
      FieldAlias = 'NOMEPARTICIPANTE'
      FieldName = 'NOMEPARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppTermoAssistppField3: TppField
      FieldAlias = 'NOMEPLANOATUAL'
      FieldName = 'NOMEPLANOATUAL'
      FieldLength = 11
      DisplayWidth = 11
      Position = 2
    end
    object ppTermoAssistppField4: TppField
      FieldAlias = 'NOMEPATROCINADORA'
      FieldName = 'NOMEPATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppTermoAssistppField5: TppField
      FieldAlias = 'DATADADOS'
      FieldName = 'DATADADOS'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppTermoAssistppField6: TppField
      FieldAlias = 'DATATRANSACAO'
      FieldName = 'DATATRANSACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppTermoAssistppField7: TppField
      FieldAlias = 'CAMPORELAT1'
      FieldName = 'CAMPORELAT1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object ppTermoAssistppField8: TppField
      FieldAlias = 'CAMPORELAT2'
      FieldName = 'CAMPORELAT2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 7
    end
    object ppTermoAssistppField9: TppField
      FieldAlias = 'CAMPORELAT3'
      FieldName = 'CAMPORELAT3'
      FieldLength = 100
      DisplayWidth = 100
      Position = 8
    end
    object ppTermoAssistppField10: TppField
      FieldAlias = 'CAMPORELAT4'
      FieldName = 'CAMPORELAT4'
      FieldLength = 100
      DisplayWidth = 100
      Position = 9
    end
    object ppTermoAssistppField11: TppField
      FieldAlias = 'CAMPORELAT5'
      FieldName = 'CAMPORELAT5'
      FieldLength = 100
      DisplayWidth = 100
      Position = 10
    end
    object ppTermoAssistppField12: TppField
      FieldAlias = 'CAMPORELAT6'
      FieldName = 'CAMPORELAT6'
      FieldLength = 100
      DisplayWidth = 100
      Position = 11
    end
    object ppTermoAssistppField13: TppField
      FieldAlias = 'CAMPORELAT7'
      FieldName = 'CAMPORELAT7'
      FieldLength = 100
      DisplayWidth = 100
      Position = 12
    end
    object ppTermoAssistppField14: TppField
      FieldAlias = 'CAMPORELAT8'
      FieldName = 'CAMPORELAT8'
      FieldLength = 100
      DisplayWidth = 100
      Position = 13
    end
    object ppTermoAssistppField15: TppField
      FieldAlias = 'CAMPORELAT9'
      FieldName = 'CAMPORELAT9'
      FieldLength = 100
      DisplayWidth = 100
      Position = 14
    end
    object ppTermoAssistppField16: TppField
      FieldAlias = 'CAMPORELAT10'
      FieldName = 'CAMPORELAT10'
      FieldLength = 100
      DisplayWidth = 100
      Position = 15
    end
  end
  object dsTermoAssist: TwwDataSource
    DataSet = qryTermoAssist
    Left = 353
    Top = 169
  end
  object qryTermoAssist: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EL.MATRICULA,'
      '       P.NOME AS NOMEPARTICIPANTE,'
      
        '       DECODE(PL.IDPLANOPREV, 3, '#39'FUNDADOR'#39', '#39'ALTERNATIVO'#39') NOME' +
        'PLANOATUAL,'
      '       PT.NOME AS NOMEPATROCINADORA,'
      '       :DATADADOS,'
      '       SYSDATE AS DATATRANSACAO,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT1,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT2,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT3,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT4,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT5,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT6,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT7,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT8,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT9,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT10'
      
        'FROM   PESSOA P, PESSOA PT, ELEGPATRO EL, PARTPREVPLAN PP, PLANP' +
        'REV PL,'
      '       EVENTOGERADOR EG'
      'WHERE  EL.IDPESSJUR      = :IDPESSJUR'
      'AND    EL.IDPESSOA       = :IDPESSOA'
      'AND    P.IDPESSOA        = EL.IDPESSOA'
      'AND    PT.IDPESSOA       = EL.IDPESSJUR '
      'AND    PP.IDPESSJUR      = EL.IDPESSJUR'
      'AND    PP.IDPESSOA       = EL.IDPESSOA'
      'AND    PP.FLGDESATIVADO  = 0'
      'AND    PL.IDPLANOPREV    = PP.IDPLANOPREV'
      'AND    EG.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updTermoAssist
    ValidateWithMask = True
    Left = 353
    Top = 187
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATADADOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '8636'
      end
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
        Value = '45'
      end>
  end
  object updTermoAssist: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 356
    Top = 199
  end
  object DsgnASSIST: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.DatabaseName = 'BaseDados'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpTermoAssist
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 356
    Top = 214
  end
  object rpTermoMantido: TppReport
    AutoStop = False
    DataPipeline = ppTermoMantido
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 11430
    PrinterSetup.mmMarginLeft = 10160
    PrinterSetup.mmMarginRight = 3810
    PrinterSetup.mmMarginTop = 10160
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 457
    Top = 9
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppTermoMantido'
    object ppTitleBand11: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 24077
      mmPrintPosition = 0
      object ppDBImage3: TppDBImage
        UserName = 'rpBenefProvDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 14023
        mmLeft = 172509
        mmTop = 0
        mmWidth = 17463
        BandType = 1
      end
      object ppLabel87: TppLabel
        UserName = 'ppLabel1'
        Caption = 'TERMO DE TRANSAÇÃO EXTRAJUDICIAL E OPÇÃO DE MIGRAÇÃO AO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 20638
        mmTop = 7144
        mmWidth = 145786
        BandType = 1
      end
      object ppDBText38: TppDBText
        UserName = 'ppRepRelBeneficiosDBText2'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5292
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 35719
        BandType = 1
      end
      object ppLabel88: TppLabel
        UserName = 'Label25'
        Caption = 'PLANO DE BENEFÍCIOS BrTPREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 62706
        mmTop = 12965
        mmWidth = 68527
        BandType = 1
      end
      object ppLabel89: TppLabel
        UserName = 'Label41'
        Caption = 
          'PARTICIPANTE EM AUTOPATROCÍNIO DOS PLANOS FUNDADOR OU ALTERNATIV' +
          'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 15610
        mmTop = 18785
        mmWidth = 171186
        BandType = 1
      end
    end
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand12: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 241300
      mmPrintPosition = 0
      object ppLabel90: TppLabel
        UserName = 'Label1'
        Caption = 'Eu,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 794
        mmWidth = 4763
        BandType = 4
      end
      object ppLabel91: TppLabel
        UserName = 'Label2'
        Caption = 'matrícula no.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 5821
        mmWidth = 18785
        BandType = 4
      end
      object ppLabel92: TppLabel
        UserName = 'Label3'
        Caption = 
          ', inscrito(a) na Fundação dos Empregados da Companhia Riogranden' +
          'se de Telecomunicações - FCRT,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 44979
        mmTop = 5821
        mmWidth = 148167
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppTermoMantido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTermoMantido'
        mmHeight = 3704
        mmLeft = 20902
        mmTop = 5821
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText2'
        DataField = 'NOMEPARTICIPANTE'
        DataPipeline = ppTermoMantido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTermoMantido'
        mmHeight = 3969
        mmLeft = 7408
        mmTop = 794
        mmWidth = 152136
        BandType = 4
      end
      object ppLabel93: TppLabel
        UserName = 'Label5'
        Caption = ', abaixo assinado(a),'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 163248
        mmTop = 794
        mmWidth = 29898
        BandType = 4
      end
      object ppLabel95: TppLabel
        UserName = 'Label24'
        Caption = 'pertencente ao Plano de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 10848
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText23'
        DataField = 'NOMEPLANOATUAL'
        DataPipeline = ppTermoMantido
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppTermoMantido'
        mmHeight = 3969
        mmLeft = 52917
        mmTop = 10583
        mmWidth = 40481
        BandType = 4
      end
      object ppShape21: TppShape
        UserName = 'Shape4'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 16140
        mmWidth = 4233
        BandType = 4
      end
      object ppLabel97: TppLabel
        UserName = 'Label29'
        Caption = 'manutenção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 6350
        mmTop = 16140
        mmWidth = 19050
        BandType = 4
      end
      object ppLabel98: TppLabel
        UserName = 'Label30'
        Caption = 'no Plano de Benefícios acima citado, como Autopatrocinado.   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 16140
        mmWidth = 89959
        BandType = 4
      end
      object ppLabel99: TppLabel
        UserName = 'Label31'
        Caption = ', como Autopatrocinado, solicito pelo presente :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 94192
        mmTop = 10583
        mmWidth = 67998
        BandType = 4
      end
      object ppShape24: TppShape
        UserName = 'Shape9'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 22225
        mmWidth = 4233
        BandType = 4
      end
      object ppRichText8: TppRichText
        UserName = 'RichText1'
        Caption = 'RichText1'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil Arial;}}'#13#10'\viewkind4\uc1\pard\fs18 op\'#39'e7' +
          '\'#39'e3o pela migra\'#39'e7\'#39'e3o para o Plano de Benef\'#39'edcios BrTPREV,' +
          ' declarando estar ciente e concordar com todos os direitos e obr' +
          'iga\'#39'e7\'#39'f5es previstos no Estatuto da Funda\'#39'e7\'#39'e3o CRT e no R' +
          'egulamento do Plano de Benef\'#39'edcios BrTPREV, dos quais recebi u' +
          'm exemplar e a correspondente cartilha,  concordando que:\f1\par' +
          #13#10'\pard\fi-284\li284\tx284\tx851 1. \tab\f0 A op\'#39'e7\'#39'e3o por me' +
          ' vincular ao Plano de Benef\'#39'edcios BrTPREV automaticamente canc' +
          'ela  todos os efeitos de minha participa\'#39'e7\'#39'e3o no PLANO DE OR' +
          'IGEM ao qual estava vinculado(a), outorgando plena, rasa e geral' +
          ' quita\'#39'e7\'#39'e3o a todo e qualquer direito que tenha adquirido em' +
          ' rela\'#39'e7\'#39'e3o ao PLANO DE ORIGEM, para mais nada reclamar, seja' +
          ' em ju\'#39'edzo ou fora dele,  observado o disposto no Regulamento ' +
          'do BrTPREV, constituindo transa\'#39'e7\'#39'e3o de direitos.\f1\par'#13#10'\p' +
          'ard\fi-284\li284\tx851 2. \tab\f0 Que, em raz\'#39'e3o da transa\'#39'e7' +
          '\'#39'e3o e conseq\'#39'fcente migra\'#39'e7\'#39'e3o para o Plano de Benef\'#39'edc' +
          'ios BrTPREV, terei assegurada a Reserva de  Transfer\'#39'eancia, qu' +
          'e ser\'#39'e1 sempre o  maior valor  entre a Reserva Matem\'#39'e1tica d' +
          'e Benef\'#39'edcios a Conceder Saldado e a Reserva de Poupan\'#39'e7a do' +
          ' PLANO DE ORIGEM, conforme disposto no Regulamento BrTPREV; \f1\' +
          'par'#13#10'\pard\fi-283\li284\tx851 3.\tab\f0 A t\'#39'edtulo de Incentivo' +
          ' \'#39'e0 Migra\'#39'e7\'#39'e3o ao Plano BrTPREV, terei um cr\'#39'e9dito no va' +
          'lor correspondente a 30% do meu Sal\'#39'e1rio de Participa\'#39'e7\'#39'e3o' +
          ' (SP), em uma \'#39'fanica parcela, a ser depositado em minha Conta ' +
          'Individual do Participante - CIP, sendo o mesmo operacionalizado' +
          ' na forma prevista no Regulamento do BrTPREV.\f1\par'#13#10'\pard\tx43' +
          '2\tx7883 4.  Assim sendo, declaro o seguinte:\par'#13#10'\pard\fi-142\' +
          'li284\tx284\f0 - Se houver mudan\'#39'e7a de minha classe de partici' +
          'pante ap\'#39'f3s o preenchimento deste formul\'#39'e1rio e antes da val' +
          'ida\'#39'e7\'#39'e3o da presente transa\'#39'e7\'#39'e3o ao Plano de Benef\'#39'edci' +
          'os BrTPREV,  fico obrigado(a) a preencher novo Termo de Transa\'#39 +
          'e7\'#39'e3o referente \'#39'e0 nova classe de participante, tornando-se ' +
          'inv\'#39'e1lido este Termo.\f1\par'#13#10'\pard\fi-142\li284\f0 - Estou ci' +
          'ente de que, caso possua alguma a\'#39'e7\'#39'e3o judicial contra a Fun' +
          'da\'#39'e7\'#39'e3o CRT e/ou Brasil Telecom S/A e/ou Celular CRT S/A, te' +
          'ndo por objeto mat\'#39'e9ria an\'#39'e1loga, conexa ou relacionada com ' +
          'a presente transa\'#39'e7\'#39'e3o, ou que direta ou indiretamente venha' +
          ' a obstar a implanta\'#39'e7\'#39'e3o do Plano de Benef\'#39'edcios BrTPREV,' +
          ' esta Transa\'#39'e7\'#39'e3o s\'#39'f3 surtir\'#39'e1 efeitos legais ap\'#39'f3s a ' +
          'homologa\'#39'e7\'#39'e3o judicial da desist\'#39'eancia das mencionadas a\'#39 +
          'e7\'#39'f5es, implicando a referida desist\'#39'eancia na quita\'#39'e7\'#39'e3o' +
          ' de quaisquer diferen\'#39'e7as quanto ao objeto das mesmas.\f1\par'#13 +
          #10'\pard\fi-284\li284\tx284\f0 5. Que Concordo, ainda, que a op\'#39'e' +
          '7\'#39'e3o ora feita, voluntariamente, sem v\'#39'edcio ou coa\'#39'e7\'#39'e3o,' +
          ' representa transa\'#39'e7\'#39'e3o de direitos, na forma dos artigos 1.' +
          '025 e seguintes do C\'#39'f3digo Civil, em face do que, juntamente c' +
          'om o pedido de desist\'#39'eancia das a\'#39'e7\'#39'f5es formulado em Ju\'#39'e' +
          'dzo, ser\'#39'e1 juntada uma via do Termo de Transa\'#39'e7\'#39'e3o Judicia' +
          'l*, para os efeitos dos artigos 1.028 e 1.030 do mesmo C\'#39'f3digo' +
          ' Civil, e 269, inciso III, do C\'#39'f3digo de Processo Civil, valen' +
          'do esta como parte integrante da peti\'#39'e7\'#39'e3o que formular o ci' +
          'tado pedido de desist\'#39'eancia.\f1\par'#13#10'\pard\f0 6. Considerando ' +
          'que o Plano de Benef\'#39'edcios BrTPREV oferece 03 (tr\'#39'eas) modali' +
          'dades de benef\'#39'edcios para transa\'#39'e7\'#39'e3o, escolho entre uma d' +
          'as alternativas abaixo: \f1\par'#13#10'\par'#13#10'}'#13#10
        mmHeight = 108215
        mmLeft = 6085
        mmTop = 22225
        mmWidth = 187061
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppLabel100: TppLabel
        UserName = 'Label32'
        Caption = 'Benefício Saldado '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 131763
        mmWidth = 26988
        BandType = 4
      end
      object ppLabel101: TppLabel
        UserName = 'Label33'
        Caption = '(Opção 1 )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 39688
        mmTop = 131763
        mmWidth = 15875
        BandType = 4
      end
      object ppLabel102: TppLabel
        UserName = 'Label34'
        AutoSize = False
        Caption = 
          'destinando uma parcela de minha Reserva de Transferência calcula' +
          'da no PLANO DE ORIGEM, à Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 39158
        mmTop = 136790
        mmWidth = 153988
        BandType = 4
      end
      object ppLabel103: TppLabel
        UserName = 'Label35'
        Caption = 'Identificada da Patrocinadora - CPI do BrTPREV, no valor de R$  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 141023
        mmWidth = 94192
        BandType = 4
      end
      object ppLabel104: TppLabel
        UserName = 'Label36'
        Caption = '('
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 133086
        mmTop = 141023
        mmWidth = 1058
        BandType = 4
      end
      object ppLabel105: TppLabel
        UserName = 'Label37'
        AutoSize = False
        Caption = 
          '), não podendo minha Reserva de Transferência, após deduzida des' +
          'te valor, ser inferior à'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 62442
        mmTop = 145257
        mmWidth = 130704
        BandType = 4
      end
      object ppLabel106: TppLabel
        UserName = 'Label38'
        Caption = 'minha Reserva de Poupança do PLANO DE ORIGEM. '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 149490
        mmWidth = 78846
        BandType = 4
      end
      object ppLabel107: TppLabel
        UserName = 'Label39'
        Caption = '(Opção 2)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 92869
        mmTop = 149490
        mmWidth = 14817
        BandType = 4
      end
      object ppLabel108: TppLabel
        UserName = 'Label40'
        AutoSize = False
        Caption = 
          'Benefício na modalidade de Contribuição Definida, sem direito ao' +
          ' Benefício Saldado.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10583
        mmTop = 155046
        mmWidth = 124619
        BandType = 4
      end
      object ppLabel109: TppLabel
        UserName = 'Label42'
        Caption = '(Opção 3)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 135732
        mmTop = 154782
        mmWidth = 14817
        BandType = 4
      end
      object ppLabel110: TppLabel
        UserName = 'Label43'
        AutoSize = False
        Caption = 'Benefício Saldado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 136790
        mmWidth = 26723
        BandType = 4
      end
      object ppRichText9: TppRichText
        UserName = 'RichText2'
        Caption = 'RichText2'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
          'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss Arial;' +
          '}}'#13#10'\viewkind4\uc1\pard\fi-284\li284\tx432\f0\fs18 7. Tenho plen' +
          'o conhecimento, pelo presente Termo, de que meus benefici\'#39'e1rio' +
          's inscritos no PLANO DE ORIGEM ser\'#39'e3o transferidos para o BrTP' +
          'REV e que poderei proceder altera\'#39'e7\'#39'f5es ou novas inscri\'#39'e7\' +
          #39'f5es posteriormente.\f1\par'#13#10'\par'#13#10'8. Inscrevo meu(s) \b\f0 Ben' +
          'efici\'#39'e1rio(s) Designado(s)\b0 , nos termos que disp\'#39'f5e o Art' +
          '. 6\'#39'ba do Regulamento do Plano de Benef\'#39'edcios BrTPREV, declar' +
          'ando saber que estes s\'#39'f3 ter\'#39'e3o direito ao recebimento de qu' +
          'alquer benef\'#39'edcio caso inexista algum Benefici\'#39'e1rio inscrito' +
          ' neste Plano.\f1\par'#13#10'\pard\f2\fs24\par'#13#10'}'#13#10
        mmHeight = 23548
        mmLeft = 5821
        mmTop = 159544
        mmWidth = 187061
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppShape28: TppShape
        UserName = 'Shape13'
        mmHeight = 32279
        mmLeft = 21431
        mmTop = 184150
        mmWidth = 162984
        BandType = 4
      end
      object ppLabel111: TppLabel
        UserName = 'Label44'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 32544
        mmTop = 185209
        mmWidth = 7673
        BandType = 4
      end
      object ppLabel112: TppLabel
        UserName = 'Label45'
        Caption = 'Sexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 142875
        mmTop = 185209
        mmWidth = 6615
        BandType = 4
      end
      object ppLabel113: TppLabel
        UserName = 'Label46'
        Caption = 'Data Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 156369
        mmTop = 185209
        mmWidth = 22225
        BandType = 4
      end
      object ppLine12: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 21431
        mmTop = 188648
        mmWidth = 162984
        BandType = 4
      end
      object ppLine13: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 21431
        mmTop = 193146
        mmWidth = 162984
        BandType = 4
      end
      object ppLine14: TppLine
        UserName = 'Line5'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 21431
        mmTop = 197644
        mmWidth = 162984
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line6'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 21431
        mmTop = 202142
        mmWidth = 162984
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line7'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 21431
        mmTop = 206640
        mmWidth = 162984
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line8'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 21431
        mmTop = 211667
        mmWidth = 162984
        BandType = 4
      end
      object ppLine18: TppLine
        UserName = 'Line2'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 32279
        mmLeft = 30956
        mmTop = 184150
        mmWidth = 1058
        BandType = 4
      end
      object ppLine19: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 32279
        mmLeft = 140759
        mmTop = 184150
        mmWidth = 1058
        BandType = 4
      end
      object ppLine20: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 32279
        mmLeft = 153459
        mmTop = 184150
        mmWidth = 1058
        BandType = 4
      end
      object ppLabel114: TppLabel
        UserName = 'Label47'
        Caption = '1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 189442
        mmWidth = 1588
        BandType = 4
      end
      object ppLabel115: TppLabel
        UserName = 'Label48'
        Caption = '2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 193940
        mmWidth = 1588
        BandType = 4
      end
      object ppLabel116: TppLabel
        UserName = 'Label49'
        Caption = '3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 198438
        mmWidth = 1588
        BandType = 4
      end
      object ppLabel117: TppLabel
        UserName = 'Label50'
        Caption = '4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 202936
        mmWidth = 1588
        BandType = 4
      end
      object ppLabel118: TppLabel
        UserName = 'Label51'
        Caption = '5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 207434
        mmWidth = 1588
        BandType = 4
      end
      object ppLabel119: TppLabel
        UserName = 'Label52'
        Caption = '6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 24606
        mmTop = 212725
        mmWidth = 1588
        BandType = 4
      end
      object ppRichText18: TppRichText
        UserName = 'RichText18'
        Caption = 'RichText18'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
          'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss MS San' +
          's Serif;}}'#13#10'\viewkind4\uc1\pard\tx432\f0\fs18 9. Ap\'#39'f3s a homol' +
          'oga\'#39'e7\'#39'e3o de minha op\'#39'e7\'#39'e3o para migra\'#39'e7\'#39'e3o  para o Pl' +
          'ano de Benef\'#39'edcios BrTPREV escolho uma das alternativas \f1\pa' +
          'r'#13#10'    abaixo:\par'#13#10'\par'#13#10'\pard\fi-284\li284\tx284\f0          d' +
          'iferimento de Benef\'#39'edcio  Proporcional Diferido, sem efetuar c' +
          'ontribui\'#39'e7\'#39'f5es ao Plano BrTPREV, estando no aguardo do \f1\p' +
          'ar'#13#10'\f0          cumprimento das car\'#39'eancias determinadas no Pl' +
          'ano de Benef\'#39'edcios BrTPREV e ciente de que n\'#39'e3o terei direit' +
          'o aos Benef\'#39'edcios \f1\par'#13#10'         de Risco, conforme estabel' +
          'ecido no  Regulamento, ou.\par'#13#10'\pard\f2\fs16\par'#13#10'}'#13#10
        mmHeight = 22225
        mmLeft = 5821
        mmTop = 216959
        mmWidth = 187061
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppShape30: TppShape
        UserName = 'Shape30'
        mmHeight = 3969
        mmLeft = 9790
        mmTop = 228336
        mmWidth = 4233
        BandType = 4
      end
      object ppLine57: TppLine
        UserName = 'Line57'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 7144
        mmTop = 4498
        mmWidth = 154782
        BandType = 4
      end
      object ppLine58: TppLine
        UserName = 'Line58'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 20902
        mmTop = 9260
        mmWidth = 17198
        BandType = 4
      end
      object ppLine59: TppLine
        UserName = 'Line59'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 53975
        mmTop = 14552
        mmWidth = 39423
        BandType = 4
      end
      object ppLine60: TppLine
        UserName = 'Line60'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 103981
        mmTop = 144198
        mmWidth = 27781
        BandType = 4
      end
      object ppLine61: TppLine
        UserName = 'Line61'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 135467
        mmTop = 144198
        mmWidth = 57679
        BandType = 4
      end
      object ppLine62: TppLine
        UserName = 'Line62'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 10848
        mmTop = 148696
        mmWidth = 49477
        BandType = 4
      end
      object ppShape25: TppShape
        UserName = 'Shape301'
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 136790
        mmWidth = 4233
        BandType = 4
      end
      object ppShape26: TppShape
        UserName = 'Shape302'
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 155046
        mmWidth = 4233
        BandType = 4
      end
      object ppShape27: TppShape
        UserName = 'Shape303'
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 131763
        mmWidth = 4233
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand9: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppSubReport2: TppSubReport
        UserName = 'TermoAtivoPagina2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 529
        mmWidth = 196030
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport9: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 11430
          PrinterSetup.mmMarginLeft = 10160
          PrinterSetup.mmMarginRight = 3810
          PrinterSetup.mmMarginTop = 10160
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 624
          Top = 531
          Version = '7.04'
          mmColumnWidth = 0
          object ppTitleBand12: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 1852
            mmPrintPosition = 0
          end
          object ppDetailBand13: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 260086
            mmPrintPosition = 0
            object ppRichText10: TppRichText
              UserName = 'RichText3'
              Caption = 'RichText3'
              RichText = 
                '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
                'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss Arial;' +
                '}}'#13#10'{\colortbl ;\red0\green0\blue0;}'#13#10'\viewkind4\uc1\pard\fi-284' +
                '\li284\tx284\cf1\f0\fs18          manter minhas contribui\'#39'e7\'#39'f' +
                '5es  nos percentuais a seguir definidos, aplic\'#39'e1veis sobre meu' +
                ' Sal\'#39'e1rio de Participa\'#39'e7\'#39'e3o, bem como \f1\par'#13#10'\f0        ' +
                '  as  contribui\'#39'e7\'#39'f5es da Patrocinadora, inclusive as contrib' +
                'ui\'#39'e7\'#39'f5es para cobertura das Despesas Administrativas e contr' +
                'ibui\'#39'e7\'#39'f5es \f1\par'#13#10'\f0          Especiais para cobertura do' +
                's Benef\'#39'edcios de Risco. \f1\par'#13#10'\pard\f2\fs24\par'#13#10'}'#13#10
              mmHeight = 13758
              mmLeft = 6085
              mmTop = 529
              mmWidth = 187061
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
            end
            object ppLabel120: TppLabel
              UserName = 'Label53'
              Caption = 'Contribuição Básica (*)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 6085
              mmTop = 30692
              mmWidth = 35454
              BandType = 4
            end
            object ppLabel121: TppLabel
              UserName = 'Label54'
              Caption = 'A Contribuição Básica mensal inicial será de '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 6085
              mmTop = 35454
              mmWidth = 64558
              BandType = 4
            end
            object ppLabel122: TppLabel
              UserName = 'Label55'
              Caption = '% ('
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 82286
              mmTop = 35454
              mmWidth = 5027
              BandType = 4
            end
            object ppLabel123: TppLabel
              UserName = 'Label56'
              Caption = '),'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 132557
              mmTop = 35454
              mmWidth = 2117
              BandType = 4
            end
            object ppRichText15: TppRichText
              UserName = 'RichText4'
              Caption = 'RichText4'
              RichText = 
                '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
                'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss MS San' +
                's Serif;}}'#13#10'\viewkind4\uc1\pard\tx540\tx4820\f0\fs18 sobre o Sal' +
                '\'#39'e1rio de Participa\'#39'e7\'#39'e3o, no m\'#39'ednimo correspondendo ao in' +
                '\'#39'edcio da faixa et\'#39'e1ria definida em Regulamento, sendo esta \' +
                'b obrigat\'#39'f3ria\b0\f1  e \f0 sem\f1  contrapartida da Patrocina' +
                'dora. \par'#13#10'\pard\f2\fs16\par'#13#10'}'#13#10
              mmHeight = 11642
              mmLeft = 6085
              mmTop = 40217
              mmWidth = 121444
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
            end
            object ppShape29: TppShape
              UserName = 'Shape14'
              mmHeight = 27252
              mmLeft = 135996
              mmTop = 30163
              mmWidth = 57150
              BandType = 4
            end
            object ppLabel124: TppLabel
              UserName = 'Label57'
              AutoSize = False
              Caption = '(*) Tabela de Contribuição Básica mensal'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 139436
              mmTop = 30692
              mmWidth = 50271
              BandType = 4
            end
            object ppLabel125: TppLabel
              UserName = 'Label58'
              Caption = 'Até 25 anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 137319
              mmTop = 34660
              mmWidth = 13758
              BandType = 4
            end
            object ppLabel126: TppLabel
              UserName = 'Label59'
              Caption = 'De 26 a 30 anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 137319
              mmTop = 38365
              mmWidth = 18256
              BandType = 4
            end
            object ppLabel127: TppLabel
              UserName = 'Label60'
              Caption = 'De 31 a 35 anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 137319
              mmTop = 42069
              mmWidth = 18256
              BandType = 4
            end
            object ppLabel134: TppLabel
              UserName = 'Label61'
              AutoSize = False
              Caption = 'De 36 a 40 anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 137319
              mmTop = 45773
              mmWidth = 18256
              BandType = 4
            end
            object ppLabel135: TppLabel
              UserName = 'Label62'
              Caption = 'Acima de 45 anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 137319
              mmTop = 53446
              mmWidth = 20638
              BandType = 4
            end
            object ppLabel136: TppLabel
              UserName = 'Label63'
              AutoSize = False
              Caption = 'De 3% a 8% do SP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 34660
              mmWidth = 24077
              BandType = 4
            end
            object ppLabel137: TppLabel
              UserName = 'Label64'
              Caption = 'De 4% a *% do SP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 38365
              mmWidth = 24871
              BandType = 4
            end
            object ppLabel138: TppLabel
              UserName = 'Label601'
              Caption = 'De 5% a 8% do SP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 42069
              mmWidth = 24606
              BandType = 4
            end
            object ppLabel139: TppLabel
              UserName = 'Label66'
              AutoSize = False
              Caption = 'De 6% a 8% do SP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 45773
              mmWidth = 22754
              BandType = 4
            end
            object ppLabel140: TppLabel
              UserName = 'Label67'
              Caption = '8% do SP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 53446
              mmWidth = 14023
              BandType = 4
            end
            object ppLabel141: TppLabel
              UserName = 'Label68'
              Caption = 'Contribuição Voluntária'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 5821
              mmTop = 53181
              mmWidth = 36513
              BandType = 4
            end
            object ppLabel142: TppLabel
              UserName = 'Label69'
              Caption = '% ('
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 15346
              mmTop = 57944
              mmWidth = 5027
              BandType = 4
            end
            object ppLabel143: TppLabel
              UserName = 'Label70'
              Caption = '),'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 67998
              mmTop = 57944
              mmWidth = 2117
              BandType = 4
            end
            object ppLabel144: TppLabel
              UserName = 'Label71'
              Caption = 
                'Contribuição Voluntária, mensal de até 22% (vinte e dois por cen' +
                'to) aplicável'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 71438
              mmTop = 57944
              mmWidth = 110331
              BandType = 4
            end
            object ppLabel145: TppLabel
              UserName = 'Label72'
              Caption = 
                'sobre o Salário de Participação, sem contrapartida da Patrocinad' +
                'ora   .'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 71438
              mmTop = 62177
              mmWidth = 101865
              BandType = 4
            end
            object ppRichText16: TppRichText
              UserName = 'RichText5'
              Caption = 'RichText5'
              RichText = 
                '{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fswiss\fp' +
                'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss Arial;' +
                '}}'#13#10'{\colortbl ;\red0\green0\blue0;}'#13#10'\viewkind4\uc1\pard\tx360\' +
                'tx720\tx1080\lang1046\ul\b\f0\fs18 CONTRIBUI\'#39'c7\'#39'd5ES DA PATROC' +
                'INADORA\f1\par'#13#10'\par'#13#10'\pard\tx432\f0 Contribui\'#39'e7\'#39'e3o Normal \' +
                'f1\par'#13#10'\ulnone\b0\fs20         \fs18 Opto por \ul\b\f0 n\'#39'e3o\u' +
                'lnone\b0  manter a Contribui\'#39'e7\'#39'e3o Normal de Benef\'#39'edcios Pr' +
                'ogram\'#39'e1veis; ou.\par'#13#10'\f1\par'#13#10'\fs20         \fs18 Opto por \b' +
                ' manter\b0\f0  a Contribui\'#39'e7\'#39'e3o Normal de Benef\'#39'edcios Prog' +
                'ram\'#39'e1veis, no mesmo percentual definido \f1\par'#13#10'\f0          ' +
                '  para a Contribui\'#39'e7\'#39'e3o B\'#39'e1sica. \f1\par'#13#10'\par'#13#10'\pard\tx36' +
                '0\tx720\tx1080\ul\b\f0 Contribui\'#39'e7\'#39'e3o Normal de  Administra\' +
                #39'e7\'#39'e3o\f1\par'#13#10'\cf1\ulnone\b0\f0 Estou ciente de que a Contrib' +
                'ui\'#39'e7\'#39'e3o Normal de Administra\'#39'e7\'#39'e3o, no percentual definid' +
                'o anual e atuarialmente no Plano de Custeio, \'#39'e9 obrigat\'#39'f3ria' +
                ' por for\'#39'e7a do Regulamento BrTPREV. \f1\par'#13#10'\ul\par'#13#10'\pard\tx' +
                '432\b\f0 Contribui\'#39'e7\'#39'e3o Especial de Risco \f1\par'#13#10'\par'#13#10'\ul' +
                'none         \b0 Opto por \ul\b\f0 n\'#39'e3o\ulnone\b0  manter a Co' +
                'ntribui\'#39'e7\'#39'e3o Especial de Risco; ou.\par'#13#10'\b\f1\par'#13#10'\pard\tx' +
                '360\tx720\tx1080         \b0 Opto por \b manter\b0\f0  a Contrib' +
                'ui\'#39'e7\'#39'e3o Especial de Risco, no percentual definido anual e at' +
                'uarialmente no \f1\par'#13#10'        Plano de Custeio\b . \par'#13#10'\par'#13 +
                #10'\pard\fi-284\li284\tx360\tx720\tx1080\b0\f0 10. Declaro, estar ' +
                'ciente de que todos os valores das contribui\'#39'e7\'#39'f5es optadas p' +
                'or mim acima, por for\'#39'e7a do Regulamento, bem como outros valor' +
                'es devidos \'#39'e0 Funda\'#39'e7\'#39'e3o CRT, ser\'#39'e3o pagos atrav\'#39'e9s de' +
                ' d\'#39'e9bito em minha conta corrente.\f1\par'#13#10'\par'#13#10'\pard\fi-284\l' +
                'i284\tx284\tx540\tx900\f0 11. Estou ciente de que, no m\'#39'eas de ' +
                'dezembro de cada, ano deverei informar os novos percentuais m\'#39'e' +
                'dnimos para c\'#39'e1lculo de minhas contribui\'#39'e7\'#39'f5es B\'#39'e1sica e' +
                ' Volunt\'#39'e1ria. Caso n\'#39'e3o o fa\'#39'e7a, ser\'#39'e3o mantidos para o(' +
                's) ano(s) seguinte(s), os \'#39'faltimos percentuais informados. \f1' +
                '\par'#13#10'\par'#13#10'\pard\fi-284\li284\f0 12. Concordo que a presente tr' +
                'ansa\'#39'e7\'#39'e3o somente seja \b homologada ap\'#39'f3s an\'#39'e1lise do p' +
                'edido e da entrega das c\'#39'f3pias das Peti\'#39'e7\'#39'f5es para desist\' +
                #39'eancias de A\'#39'e7\'#39'f5es Judiciais, caso houver, de acordo com o ' +
                'Termo de Transa\'#39'e7\'#39'e3o Judicial*\b0  e comunicada posteriormen' +
                'te atrav\'#39'e9s de correspond\'#39'eancia da FCRT.\f1\par'#13#10'\par'#13#10'\pard' +
                '\f0 Declaro ter ci\'#39'eancia de que a simula\'#39'e7\'#39'e3o anexa a este' +
                ' Termo foi realizada com a base de dados anterior ao m\'#39'eas dest' +
                'a Transa\'#39'e7\'#39'e3o e  estar\'#39'e1 sujeita a atualiza\'#39'e7\'#39'e3o. \f1\' +
                'par'#13#10'\f0 Declaro, por fim, que todas as informa\'#39'e7\'#39'f5es acima ' +
                'prestadas s\'#39'e3o verdadeiras e comprometo-me a informar, \'#39'e0 Fu' +
                'nda\'#39'e7\'#39'e3o CRT, futuras modifica\'#39'e7\'#39'f5es que vierem a ocorre' +
                'r a partir da presente data, em at\'#39'e9 30 (trinta) dias de sua o' +
                'corr\'#39'eancia, juntando os documentos exigidos, bem como respeita' +
                'r e observar o Estatuto e o Regulamento vigentes, assim como as ' +
                'poss\'#39'edveis altera\'#39'e7\'#39'f5es Estatut\'#39'e1rias e Regulamentares q' +
                'ue vierem a ser institu\'#39'eddas pela Entidade.\f1\par'#13#10'\pard\fi-3' +
                '969\li3969\tx540\tx900\tx3828\par'#13#10'__________________________, _' +
                '_______ de ____________________ de _________.\par'#13#10'\par'#13#10'\pard\f' +
                'i-567\li567\tx540\tx900\par'#13#10'___________________________________' +
                '________      \tab\tab\f0 Funda\'#39'e7\'#39'e3o CRT recebido em:____/__' +
                '__/____\f1\par'#13#10'Assinatura do Participante Autopatrocinado\tab\t' +
                'ab            \tab\tab\par'#13#10'\par'#13#10'\b N\lang1033\f0\'#39'ba do CPF ou' +
                ' RG \lang1046\b0\f1 _____________________________\tab\tab\f0 Res' +
                'pons\'#39'e1vel:  ________________________\f1\par'#13#10'\par'#13#10'\f0\tab\tab' +
                '\tab\tab\tab\tab\tab\tab\tab\tab\f1 Assinatura  ________________' +
                '___________\par'#13#10'\par'#13#10'\par'#13#10'\pard\f2\fs24\par'#13#10'}'#13#10
              mmHeight = 180182
              mmLeft = 6085
              mmTop = 68792
              mmWidth = 187061
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
            end
            object ppShape31: TppShape
              UserName = 'Shape31'
              mmHeight = 3969
              mmLeft = 7144
              mmTop = 1323
              mmWidth = 4233
              BandType = 4
            end
            object ppLabel94: TppLabel
              UserName = 'Label94'
              Caption = 'CONTRIBUIÇÕES DO PARTICIPANTE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 3969
              mmLeft = 6085
              mmTop = 15346
              mmWidth = 57150
              BandType = 4
            end
            object ppRichText19: TppRichText
              UserName = 'RichText19'
              RichText = 
                '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
                'rq2 Arial;}{\f1\fswiss\fprq2\fcharset0 Arial;}{\f2\fswiss Arial;' +
                '}}'#13#10'{\colortbl ;\red0\green0\blue0;}'#13#10'\viewkind4\uc1\pard\cf1\b\' +
                'f0\fs20 Autorizo\b0\f1  que seja procedida a cobran\'#39'e7a de minh' +
                'as contribui\'#39'e7\'#39'f5es nos percentuais a seguir definidos, aplic' +
                '\'#39'e1veis \f0\par'#13#10'\f1 sobre meu Sal\'#39'e1rio de Participa\'#39'e7\'#39'e3o' +
                ':\f0\par'#13#10'\cf0\f2\fs24\par'#13#10'}'#13#10
              mmHeight = 9525
              mmLeft = 6350
              mmTop = 19579
              mmWidth = 187061
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
            end
            object ppLine63: TppLine
              UserName = 'Line63'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 71967
              mmTop = 38629
              mmWidth = 9260
              BandType = 4
            end
            object ppLine64: TppLine
              UserName = 'Line64'
              Weight = 0.75
              mmHeight = 794
              mmLeft = 87842
              mmTop = 38365
              mmWidth = 43127
              BandType = 4
            end
            object ppLine65: TppLine
              UserName = 'Line65'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 5821
              mmTop = 61119
              mmWidth = 8202
              BandType = 4
            end
            object ppLine66: TppLine
              UserName = 'Line66'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 20373
              mmTop = 61383
              mmWidth = 46302
              BandType = 4
            end
            object ppShape41: TppShape
              UserName = 'Shape41'
              mmHeight = 3969
              mmLeft = 9260
              mmTop = 80963
              mmWidth = 4233
              BandType = 4
            end
            object ppShape42: TppShape
              UserName = 'Shape42'
              mmHeight = 3969
              mmLeft = 9260
              mmTop = 88636
              mmWidth = 4233
              BandType = 4
            end
            object ppShape43: TppShape
              UserName = 'Shape43'
              mmHeight = 3969
              mmLeft = 9260
              mmTop = 121444
              mmWidth = 4233
              BandType = 4
            end
            object ppShape44: TppShape
              UserName = 'Shape44'
              mmHeight = 3969
              mmLeft = 9260
              mmTop = 129117
              mmWidth = 4233
              BandType = 4
            end
            object ppLabel173: TppLabel
              UserName = 'Label173'
              AutoSize = False
              Caption = 'De 41 a 45 anos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 137319
              mmTop = 49477
              mmWidth = 18256
              BandType = 4
            end
            object ppLabel174: TppLabel
              UserName = 'Label174'
              AutoSize = False
              Caption = 'De 7% a 8% do SP'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 49477
              mmWidth = 22754
              BandType = 4
            end
          end
          object ppFooterBand9: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand10: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13494
            mmPrintPosition = 0
            object ppRichText17: TppRichText
              UserName = 'RichText6'
              Caption = 'RichText6'
              RichText = 
                '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
                'rq2 Arial;}{\f1\fswiss\fprq2\fcharset0 Arial;}{\f2\fswiss Arial;' +
                '}}'#13#10'\viewkind4\uc1\pard\fi-142\li142\tx142\tx900\f0\fs18 * \b\f1' +
                ' Termo de Transa\'#39'e7\'#39'e3o Judicial - \b0 Acordo assinado pelas E' +
                'ntidades representativas dos Empregados e Assistidos da Brasil T' +
                'elecom em mar\'#39'e7o de 2002 e  aprovado pelas Assembl\'#39'e9ias Gera' +
                'is dos mesmos.\f2\fs24\par'#13#10'}'#13#10
              mmHeight = 9260
              mmLeft = 5821
              mmTop = 2381
              mmWidth = 187061
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
            end
          end
        end
      end
    end
  end
  object ppTermoMantido: TppBDEPipeline
    DataSource = dsTermoMantido
    SkipWhenNoRecords = False
    UserName = 'TermoMantido'
    Left = 457
    Top = 24
    object ppTermoMantidoppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object ppTermoMantidoppField2: TppField
      FieldAlias = 'NOMEPARTICIPANTE'
      FieldName = 'NOMEPARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppTermoMantidoppField3: TppField
      FieldAlias = 'NOMEPLANOATUAL'
      FieldName = 'NOMEPLANOATUAL'
      FieldLength = 11
      DisplayWidth = 11
      Position = 2
    end
    object ppTermoMantidoppField4: TppField
      FieldAlias = 'NOMEPATROCINADORA'
      FieldName = 'NOMEPATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppTermoMantidoppField5: TppField
      FieldAlias = 'DATADADOS'
      FieldName = 'DATADADOS'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppTermoMantidoppField6: TppField
      FieldAlias = 'DATATRANSACAO'
      FieldName = 'DATATRANSACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppTermoMantidoppField7: TppField
      FieldAlias = 'CAMPORELAT1'
      FieldName = 'CAMPORELAT1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object ppTermoMantidoppField8: TppField
      FieldAlias = 'CAMPORELAT2'
      FieldName = 'CAMPORELAT2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 7
    end
    object ppTermoMantidoppField9: TppField
      FieldAlias = 'CAMPORELAT3'
      FieldName = 'CAMPORELAT3'
      FieldLength = 100
      DisplayWidth = 100
      Position = 8
    end
    object ppTermoMantidoppField10: TppField
      FieldAlias = 'CAMPORELAT4'
      FieldName = 'CAMPORELAT4'
      FieldLength = 100
      DisplayWidth = 100
      Position = 9
    end
    object ppTermoMantidoppField11: TppField
      FieldAlias = 'CAMPORELAT5'
      FieldName = 'CAMPORELAT5'
      FieldLength = 100
      DisplayWidth = 100
      Position = 10
    end
    object ppTermoMantidoppField12: TppField
      FieldAlias = 'CAMPORELAT6'
      FieldName = 'CAMPORELAT6'
      FieldLength = 100
      DisplayWidth = 100
      Position = 11
    end
    object ppTermoMantidoppField13: TppField
      FieldAlias = 'CAMPORELAT7'
      FieldName = 'CAMPORELAT7'
      FieldLength = 100
      DisplayWidth = 100
      Position = 12
    end
    object ppTermoMantidoppField14: TppField
      FieldAlias = 'CAMPORELAT8'
      FieldName = 'CAMPORELAT8'
      FieldLength = 100
      DisplayWidth = 100
      Position = 13
    end
    object ppTermoMantidoppField15: TppField
      FieldAlias = 'CAMPORELAT9'
      FieldName = 'CAMPORELAT9'
      FieldLength = 100
      DisplayWidth = 100
      Position = 14
    end
    object ppTermoMantidoppField16: TppField
      FieldAlias = 'CAMPORELAT10'
      FieldName = 'CAMPORELAT10'
      FieldLength = 100
      DisplayWidth = 100
      Position = 15
    end
  end
  object dsTermoMantido: TwwDataSource
    DataSet = qryTermoMantido
    Left = 457
    Top = 39
  end
  object qryTermoMantido: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EL.MATRICULA,'
      '       P.NOME AS NOMEPARTICIPANTE,'
      
        '       DECODE(PL.IDPLANOPREV, 3, '#39'FUNDADOR'#39', '#39'ALTERNATIVO'#39') NOME' +
        'PLANOATUAL,'
      '       PT.NOME AS NOMEPATROCINADORA,'
      '       :DATADADOS,'
      '       SYSDATE AS DATATRANSACAO,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT1,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT2,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT3,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT4,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT5,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT6,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT7,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT8,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT9,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT10'
      
        'FROM   PESSOA P, PESSOA PT, ELEGPATRO EL, PARTPREVPLAN PP, PLANP' +
        'REV PL,'
      '       EVENTOGERADOR EG'
      'WHERE  EL.IDPESSJUR      = :IDPESSJUR'
      'AND    EL.IDPESSOA       = :IDPESSOA'
      'AND    P.IDPESSOA        = EL.IDPESSOA'
      'AND    PT.IDPESSOA       = EL.IDPESSJUR '
      'AND    PP.IDPESSJUR      = EL.IDPESSJUR'
      'AND    PP.IDPESSOA       = EL.IDPESSOA'
      'AND    PP.FLGDESATIVADO  = 0'
      'AND    PL.IDPLANOPREV    = PP.IDPLANOPREV'
      'AND    EG.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updTermoMantido
    ValidateWithMask = True
    Left = 457
    Top = 55
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATADADOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '8636'
      end
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
        Value = '45'
      end>
  end
  object updTermoMantido: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 457
    Top = 70
  end
  object DsgnMantido: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.DatabaseName = 'BaseDados'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpTermoMantido
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 457
    Top = 85
  end
  object rpTermoPensao: TppReport
    AutoStop = False
    DataPipeline = ppTermoPensao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 3810
    PrinterSetup.mmMarginLeft = 3810
    PrinterSetup.mmMarginRight = 3810
    PrinterSetup.mmMarginTop = 3810
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    ModalCancelDialog = False
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 457
    Top = 135
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppTermoPensao'
    object ppTitleBand13: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppDBImage4: TppDBImage
        UserName = 'rpBenefProvDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 14023
        mmLeft = 176742
        mmTop = 529
        mmWidth = 17463
        BandType = 1
      end
      object ppLabel96: TppLabel
        UserName = 'ppLabel1'
        Caption = 'TERMO DE TRANSAÇÃO EXTRAJUDICIAL E OPÇÃO DE MIGRAÇÃO AO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 27781
        mmTop = 9790
        mmWidth = 145786
        BandType = 1
      end
      object ppDBText41: TppDBText
        UserName = 'ppRepRelBeneficiosDBText2'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5292
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 35719
        BandType = 1
      end
      object ppLabel146: TppLabel
        UserName = 'Label25'
        Caption = 'PLANO DE BENEFÍCIOS BrTPREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 70644
        mmTop = 15610
        mmWidth = 68527
        BandType = 1
      end
      object ppLabel147: TppLabel
        UserName = 'Label41'
        Caption = 'PENSIONISTAS DOS PLANOS FUNDADOR OU ALTERNATIVO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 49213
        mmTop = 21431
        mmWidth = 124354
        BandType = 1
      end
    end
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand14: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 244475
      mmPrintPosition = 0
      object ppLabel149: TppLabel
        UserName = 'Label3'
        Caption = 'pertencente ao Plano de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 10583
        mmWidth = 56092
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppTermoPensao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppTermoPensao'
        mmHeight = 3969
        mmLeft = 23813
        mmTop = 5821
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel150: TppLabel
        UserName = 'Label5'
        Caption = 
          'Nós Pensionistas, abaixo relacionados, beneficiários do Particip' +
          'ante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 107421
        BandType = 4
      end
      object ppLabel151: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'matrícula no. '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 5821
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'DBText23'
        DataField = 'NOMEPLANOATUAL'
        DataPipeline = ppTermoPensao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppTermoPensao'
        mmHeight = 3969
        mmLeft = 58208
        mmTop = 10583
        mmWidth = 38894
        BandType = 4
      end
      object ppLabel152: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = ', solicitamos, pelo presente, o que segue :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 97896
        mmTop = 10583
        mmWidth = 71702
        BandType = 4
      end
      object ppShape10: TppShape
        UserName = 'Shape4'
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 17727
        mmWidth = 4233
        BandType = 4
      end
      object ppLabel153: TppLabel
        UserName = 'Label29'
        Caption = 'manutenção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 7673
        mmTop = 17727
        mmWidth = 20902
        BandType = 4
      end
      object ppLabel154: TppLabel
        UserName = 'Label30'
        Caption = 'no Plano de Benefícios acima citado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 29369
        mmTop = 17727
        mmWidth = 57679
        BandType = 4
      end
      object ppShape11: TppShape
        UserName = 'Shape9'
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 23283
        mmWidth = 4233
        BandType = 4
      end
      object ppRichText20: TppRichText
        UserName = 'RichText1'
        Caption = 'RichText1'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
          'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss Arial;' +
          '}}'#13#10'{\colortbl ;\red0\green0\blue0;}'#13#10'\viewkind4\uc1\pard\b\f0\f' +
          's20 op\'#39'e7\'#39'e3o pela migra\'#39'e7\'#39'e3o\b0  para o Plano de Benef\'#39'e' +
          'dcios BrTPREV, declarando estarmos cientes e aceitarmos todos os' +
          ' direitos e obriga\'#39'e7\'#39'f5es previstos no Estatuto da Funda\'#39'e7\' +
          #39'e3o CRT e no  Regulamento do Plano de Benef\'#39'edcios BrTPREV, do' +
          's quais recebemos  um exemplar  e a correspondente cartilha, con' +
          'cordando  com o que segue:\f1\par'#13#10'\par'#13#10'\pard\fi-284\li284\cf1\' +
          'f0 1. A op\'#39'e7\'#39'e3o por nos vincularmos ao Plano de Benef\'#39'edcio' +
          's BrTPREV automaticamente cancela todos os efeitos de nossa part' +
          'icipa\'#39'e7\'#39'e3o no PLANO DE ORIGEM, ao qual est\'#39'e1vamos vinculad' +
          'os, outorgando plena, rasa e geral quita\'#39'e7\'#39'e3o a todo e qualq' +
          'uer direito que tenhamos adquirido em rela\'#39'e7\'#39'e3o ao PLANO DE ' +
          'ORIGEM, para mais nada reclamar, seja em ju\'#39'edzo ou fora dele, ' +
          'constituindo transa\'#39'e7\'#39'e3o de direito, recebendo, em contrapar' +
          'tida, um Benef\'#39'edcio Saldado que dever\'#39'e1 ser igual ao valor l' +
          '\'#39'edquido em reais do Beneficio pago pelo PLANO\f1  DE ORIGEM, o' +
          'bservado o disposto no Regulamento do BrTPREV.\par'#13#10'\pard\fi-284' +
          '\li284\tx432\cf0\par'#13#10'\pard\fi-284\li284\f0 2. Que, em raz\'#39'e3o ' +
          'da transa\'#39'e7\'#39'e3o e conseq\'#39'fcente op\'#39'e7\'#39'e3o pela migra\'#39'e7\'#39 +
          'e3o para o Plano de Benef\'#39'edcios BrTPREV terei constitu\'#39'edda a' +
          ' Reserva Matem\'#39'e1tica de Benef\'#39'edcios Concedidos Saldados com ' +
          'o valor atuarial da Reserva Matem\'#39'e1tica de Benef\'#39'edcios Conce' +
          'didos, calculada de forma individual e atuarialmente, com base n' +
          'a Nota T\'#39'e9cnica do BrTPREV. \f1\par'#13#10'\pard\fi-283\li709\par'#13#10'\' +
          'pard\fi-284\li284\f0 3. Que, em decorr\'#39'eancia da Transa\'#39'e7\'#39'e3' +
          'o e conseq\'#39'fcente op\'#39'e7\'#39'e3o pela migra\'#39'e7\'#39'e3o para o Plano ' +
          'BrTPREV, \b\f1 escolho entre uma das alternativas abaixo\b0 :\pa' +
          'r'#13#10'\pard\f2\fs24\par'#13#10'}'#13#10
        mmHeight = 73025
        mmLeft = 7144
        mmTop = 23283
        mmWidth = 187061
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape22'
        mmHeight = 3969
        mmLeft = 11906
        mmTop = 97367
        mmWidth = 4233
        BandType = 4
      end
      object ppLabel156: TppLabel
        UserName = 'Label78'
        Caption = 'Receber '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17463
        mmTop = 97367
        mmWidth = 14288
        BandType = 4
      end
      object ppLabel157: TppLabel
        UserName = 'Label81'
        Caption = '% ('
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 49213
        mmTop = 97367
        mmWidth = 5292
        BandType = 4
      end
      object ppLabel158: TppLabel
        UserName = 'Label128'
        Caption = '= (percentuais inteiros, limitados em 10%,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 110596
        mmTop = 97367
        mmWidth = 70908
        BandType = 4
      end
      object ppLabel159: TppLabel
        UserName = 'Label129'
        Caption = ')'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 108479
        mmTop = 97367
        mmWidth = 1058
        BandType = 4
      end
      object ppRichText21: TppRichText
        UserName = 'RichText13'
        Caption = 'RichText13'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
          'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss Arial;' +
          '}}'#13#10'\viewkind4\uc1\pard\fi-284\li426\tx426\tx1276\f0\fs20 aplica' +
          'dos sobre o valor correspondente a minha Reserva Matem\'#39'e1tica d' +
          'e Benef\'#39'edcios Concedidos Saldados, \f1\par'#13#10'\f0 a t\'#39'edtulo de' +
          ' antecipa\'#39'e7\'#39'e3o, atrav\'#39'e9s de pagamento \'#39'fanico, em at\'#39'e9 ' +
          '30 dias da data da valida\'#39'e7\'#39'e3o da transa\'#39'e7\'#39'e3o,  \f1\par'#13 +
          #10'\f0 estando ciente de que o valor mensal do Benef\'#39'edcio Saldad' +
          'o ser\'#39'e1 reduzido proporcional e atuarialmente  \'#39'e0 \f1\par'#13#10'\' +
          'f0 antecipa\'#39'e7\'#39'e3o por n\'#39'f3s requerida.\f1\par'#13#10'\pard\f2\fs24' +
          '\par'#13#10'}'#13#10
        mmHeight = 16933
        mmLeft = 14023
        mmTop = 101865
        mmWidth = 178594
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppShape35: TppShape
        UserName = 'Shape23'
        mmHeight = 3969
        mmLeft = 11906
        mmTop = 119856
        mmWidth = 4233
        BandType = 4
      end
      object ppLabel160: TppLabel
        UserName = 'Label130'
        Caption = 'não'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 17727
        mmTop = 119856
        mmWidth = 6350
        BandType = 4
      end
      object ppLabel163: TppLabel
        UserName = 'Label133'
        AutoSize = False
        Caption = 'receber antecipação da reserva.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24606
        mmTop = 119856
        mmWidth = 74613
        BandType = 4
      end
      object ppRichText22: TppRichText
        UserName = 'RichText14'
        Caption = 'RichText14'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
          'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss Arial;' +
          '}}'#13#10'\viewkind4\uc1\pard\tx709\f0\fs20 4. Que farei jus, ainda, c' +
          'omo incentivo \'#39'e0 migra\'#39'e7\'#39'e3o, a:\f1\par'#13#10'\pard\fi-142\li284' +
          '\tx567 a) \b\f0 32,75% (trinta e dois v\'#39'edrgula setenta e cinco' +
          ' por cento)\b0  sobre a Suplementa\'#39'e7\'#39'e3o Bruta do Plano de Or' +
          'igem, \f1\par'#13#10'    o qual desejamos receber da seguinte forma:\p' +
          'ar'#13#10'\pard\fi-142\li426\tx567\tx709\tx1134\f0      retirada em at' +
          '\'#39'e9 30 dias contados da data da valida\'#39'e7\'#39'e3o da transa\'#39'e7\'#39 +
          'e3o, em uma \'#39'fanica parcela, ou.\f1\par'#13#10'\pard\fi-283\li567\tx7' +
          '09\tx1134      \par'#13#10'\f0      transfer\'#39'eancia para a nossa Rese' +
          'rva Matem\'#39'e1tica de Benef\'#39'edcios Concedidos Saldados, com o co' +
          'nseq\'#39'fcente \f1\par'#13#10'\f0      rec\'#39'e1lculo do valor do benef\'#39'e' +
          'dcio Saldado L\'#39'edquido.   \f1\par'#13#10'\par'#13#10'\pard\fi-142\li284\tx5' +
          '67 b\b ) um ABONO\b0\f0  de R$ 1.200,00 (um mil e duzentos reais' +
          '), caso n\'#39'e3o tenhamos recebido o referido valor pelo \f1\par'#13#10 +
          '\f0 Participante quando na condi\'#39'e7\'#39'e3o de Ativo, da seguinte ' +
          'forma:\f1\par'#13#10'\pard\fi-142\li284\tx567\tx1134        \b retirad' +
          'a\b0\f0  em at\'#39'e9 30 (trinta) dias contados da data da valida\'#39 +
          'e7\'#39'e3o da transa\'#39'e7\'#39'e3o, em uma \'#39'fanica parcela, ou.\f1\par'#13 +
          #10'\par'#13#10'\pard\fi-283\li567\tx284\tx851\tx1134     \b\f0  transfer' +
          '\'#39'eancia\b0  para a nossa Reserva Matem\'#39'e1tica de Benef\'#39'edcios' +
          ' Concedidos  Saldados, com o conseq\'#39'fcente \f1\par'#13#10'\f0      re' +
          'c\'#39'e1lculo do valor do Benef\'#39'edcio Saldado L\'#39'edquido.     \f1\' +
          'par'#13#10'\par'#13#10'\pard\f0 5. Que estamos cientes de que, caso possuamo' +
          's alguma a\'#39'e7\'#39'e3o judicial contra a Funda\'#39'e7\'#39'e3o CRT e/ou Br' +
          'asil Telecom S/A e/ou Celular CRT S/A, tendo por objeto mat\'#39'e9r' +
          'ia an\'#39'e1loga, conexa ou relacionada com a presente transa\'#39'e7\'#39 +
          'e3o, ou que direta ou indiretamente venha a obstar a implanta\'#39'e' +
          '7\'#39'e3o do Plano de Benef\'#39'edcios BrTPREV, esta Transa\'#39'e7\'#39'e3o s' +
          '\'#39'f3 surtir\'#39'e1 efeitos legais ap\'#39'f3s a homologa\'#39'e7\'#39'e3o judic' +
          'ial da desist\'#39'eancia das mencionadas a\'#39'e7\'#39'f5es, implicando a ' +
          'referida desist\'#39'eancia na quita\'#39'e7\'#39'e3o de quaisquer diferen\'#39 +
          'e7as quanto ao objeto das m\f1 esmas.\par'#13#10'\par'#13#10'\f0 6. Que conc' +
          'ordamos, ainda, que a op\'#39'e7\'#39'e3o ora feita, voluntariamente, se' +
          'm v\'#39'edcio ou coa\'#39'e7\'#39'e3o, representa transa\'#39'e7\'#39'e3o de direit' +
          'os, na forma dos artigos 1.025 e seguintes do C\'#39'f3digo Civil, e' +
          'm face do que, juntamente com o pedido de desist\'#39'eancia das a\'#39 +
          'e7\'#39'f5es formulado em Ju\'#39'edzo, ser\'#39'e1 juntada uma via do Termo' +
          ' de Transa\'#39'e7\'#39'e3o Judicial*, para os efeitos dos artigos 1.028' +
          ' e 1.030 do mesmo C\'#39'f3digo Civil, e 269, inciso III, do C\'#39'f3di' +
          'go de Processo Civil, valendo esta como parte integrante da peti' +
          '\'#39'e7\'#39'e3o que formular o citado pedido de desist\'#39'eancia.\f1\par' +
          #13#10'\f2\fs24\par'#13#10'}'#13#10
        mmHeight = 116946
        mmLeft = 7144
        mmTop = 125677
        mmWidth = 187061
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppShape36: TppShape
        UserName = 'Shape17'
        mmHeight = 3969
        mmLeft = 11906
        mmTop = 138377
        mmWidth = 4233
        BandType = 4
      end
      object ppShape37: TppShape
        UserName = 'Shape18'
        mmHeight = 3969
        mmLeft = 11906
        mmTop = 146579
        mmWidth = 4233
        BandType = 4
      end
      object ppShape38: TppShape
        UserName = 'Shape19'
        mmHeight = 3969
        mmLeft = 11906
        mmTop = 166159
        mmWidth = 4233
        BandType = 4
      end
      object ppShape39: TppShape
        UserName = 'Shape20'
        mmHeight = 3969
        mmLeft = 11906
        mmTop = 174096
        mmWidth = 4233
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'DBText52'
        DataField = 'NOMEPARTICIPANTE'
        DataPipeline = ppTermoPensao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppTermoPensao'
        mmHeight = 3969
        mmLeft = 109538
        mmTop = 1058
        mmWidth = 90223
        BandType = 4
      end
      object ppLabel148: TppLabel
        UserName = 'Label148'
        Caption = 
          ', inscrito(a) na Fundação dos Empregados da Companhia Riogranden' +
          'se de Telecomunicações - FCRT,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 43392
        mmTop = 5821
        mmWidth = 158221
        BandType = 4
      end
      object ppLine72: TppLine
        UserName = 'Line72'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 108744
        mmTop = 5027
        mmWidth = 92075
        BandType = 4
      end
      object ppLine73: TppLine
        UserName = 'Line73'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 21960
        mmTop = 9525
        mmWidth = 20373
        BandType = 4
      end
      object ppLine74: TppLine
        UserName = 'Line74'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 57679
        mmTop = 14288
        mmWidth = 39688
        BandType = 4
      end
      object ppLine75: TppLine
        UserName = 'Line75'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 32279
        mmTop = 100542
        mmWidth = 15610
        BandType = 4
      end
      object ppLine76: TppLine
        UserName = 'Line76'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 54504
        mmTop = 100542
        mmWidth = 53181
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand11: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppSubReport3: TppSubReport
        UserName = 'TermoAtivoPagina2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 529
        mmWidth = 202380
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport10: TppChildReport
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 3810
          PrinterSetup.mmMarginLeft = 3810
          PrinterSetup.mmMarginRight = 3810
          PrinterSetup.mmMarginTop = 3810
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 624
          Top = 531
          Version = '7.04'
          mmColumnWidth = 0
          object ppTitleBand14: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand15: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 260086
            mmPrintPosition = 0
            object ppRichText23: TppRichText
              UserName = 'RichText5'
              Caption = 'RichText5'
              RichText = 
                '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
                'rq2\fcharset0 Arial;}{\f1\fswiss\fprq2 Arial;}{\f2\fswiss Arial;' +
                '}}'#13#10'\viewkind4\uc1\pard\f0\fs20 7. Estamos cientes que a present' +
                'e transa\'#39'e7\'#39'e3o seja \b homologada somente ap\'#39'f3s an\'#39'e1lise ' +
                'do pedido e da entrega das c\'#39'f3pias das Peti\'#39'e7\'#39'f5es para des' +
                'ist\'#39'eancias de A\'#39'e7\'#39'f5es Judiciais, caso houver, de acordo co' +
                'm o Termo de Transa\'#39'e7\'#39'e3o Judicial*, \b0  e comunicada poster' +
                'iormente atrav\'#39'e9s de correspond\'#39'eancia da FCRT.\f1\par'#13#10'\par'#13 +
                #10'\f0\fs18 Declaramos ter ci\'#39'eancia de que a simula\'#39'e7\'#39'e3o ane' +
                'xa a este Termo foi realizada com a base de dados anterior ao m\' +
                #39'eas desta Transa\'#39'e7\'#39'e3o e estar\'#39'e1 sujeita a atualiza\'#39'e7\'#39'e' +
                '3o.\f1\par'#13#10'\fs20\par'#13#10'\f0 Declaramos, por fim, que todas as inf' +
                'orma\'#39'e7\'#39'f5es acima prestadas s\'#39'e3o verdadeiras e comprometemo' +
                '-nos a informar \'#39'e0 Funda\'#39'e7\'#39'e3o CRT futuras modifica\'#39'e7\'#39'f5' +
                'es que vierem a ocorrer a partir da presente data em at\'#39'e9 30 (' +
                'trinta) dias de sua ocorr\'#39'eancia, juntando os documentos exigid' +
                'os, bem como respeitar e observar o Estatuto e o Regulamento vig' +
                'entes, assim como as poss\'#39'edveis altera\'#39'e7\'#39'f5es Estatut\'#39'e1ri' +
                'as e Regulamentares que vierem a ser institu\'#39'eddas pela Entidad' +
                'e.\f1\par'#13#10'\pard\fi-3969\li3969\tx540\tx900\tx3828\par'#13#10'________' +
                '__________________, ________ de ____________________ de ________' +
                '_.\par'#13#10'\pard\tx540\tx900\par'#13#10'Assinatura dos Pensionistas ou Re' +
                'presentante legal,\par'#13#10'\pard\fi-567\li567\tx540\tx900\f0 (anexa' +
                'r c\'#39'f3pia do documento legal)\f1\par'#13#10'\pard\f2\fs24\par'#13#10'}'#13#10
              mmHeight = 68263
              mmLeft = 5821
              mmTop = 1058
              mmWidth = 187061
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
            end
            object ppShape40: TppShape
              UserName = 'Shape40'
              mmHeight = 10319
              mmLeft = 5821
              mmTop = 74877
              mmWidth = 187061
              BandType = 4
            end
            object ppLabel155: TppLabel
              UserName = 'Label155'
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 36248
              mmTop = 77788
              mmWidth = 9790
              BandType = 4
            end
            object ppLabel161: TppLabel
              UserName = 'Label161'
              Caption = 'No. do CPF ou RG'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 85990
              mmTop = 77788
              mmWidth = 30956
              BandType = 4
            end
            object ppLabel162: TppLabel
              UserName = 'Label162'
              Caption = 'Assinatura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 149225
              mmTop = 77788
              mmWidth = 18256
              BandType = 4
            end
            object ppLine27: TppLine
              UserName = 'Line27'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 78581
              mmTop = 74877
              mmWidth = 1323
              BandType = 4
            end
            object ppLine28: TppLine
              UserName = 'Line28'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 10319
              mmLeft = 124619
              mmTop = 74877
              mmWidth = 1323
              BandType = 4
            end
            object ppLabel164: TppLabel
              UserName = 'Label164'
              Caption = '1.)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 6350
              mmTop = 88106
              mmWidth = 4233
              BandType = 4
            end
            object ppLabel165: TppLabel
              UserName = 'Label165'
              Caption = '2.)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 6350
              mmTop = 95515
              mmWidth = 4233
              BandType = 4
            end
            object ppLabel166: TppLabel
              UserName = 'Label166'
              Caption = '3.)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 6350
              mmTop = 102923
              mmWidth = 4233
              BandType = 4
            end
            object ppLabel167: TppLabel
              UserName = 'Label167'
              Caption = '4.)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 6350
              mmTop = 110331
              mmWidth = 4233
              BandType = 4
            end
            object ppLabel168: TppLabel
              UserName = 'Label168'
              Caption = '5.)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 6350
              mmTop = 117740
              mmWidth = 4233
              BandType = 4
            end
            object ppLabel169: TppLabel
              UserName = 'Label169'
              Caption = '6.)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 6350
              mmTop = 125942
              mmWidth = 4233
              BandType = 4
            end
            object ppLine29: TppLine
              UserName = 'Line29'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 11377
              mmTop = 92075
              mmWidth = 65881
              BandType = 4
            end
            object ppLine30: TppLine
              UserName = 'Line30'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 11377
              mmTop = 99484
              mmWidth = 65881
              BandType = 4
            end
            object ppLine31: TppLine
              UserName = 'Line31'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 11377
              mmTop = 106892
              mmWidth = 65881
              BandType = 4
            end
            object ppLine32: TppLine
              UserName = 'Line32'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 11377
              mmTop = 114300
              mmWidth = 65881
              BandType = 4
            end
            object ppLine33: TppLine
              UserName = 'Line33'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 11377
              mmTop = 121709
              mmWidth = 65881
              BandType = 4
            end
            object ppLine34: TppLine
              UserName = 'Line34'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 11377
              mmTop = 129911
              mmWidth = 65881
              BandType = 4
            end
            object ppLine35: TppLine
              UserName = 'Line35'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 81492
              mmTop = 92075
              mmWidth = 41804
              BandType = 4
            end
            object ppLine36: TppLine
              UserName = 'Line36'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 81492
              mmTop = 99484
              mmWidth = 41804
              BandType = 4
            end
            object ppLine37: TppLine
              UserName = 'Line37'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 81492
              mmTop = 106892
              mmWidth = 41804
              BandType = 4
            end
            object ppLine38: TppLine
              UserName = 'Line38'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 81492
              mmTop = 114300
              mmWidth = 41804
              BandType = 4
            end
            object ppLine39: TppLine
              UserName = 'Line39'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 81492
              mmTop = 121709
              mmWidth = 41804
              BandType = 4
            end
            object ppLine40: TppLine
              UserName = 'Line40'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 81492
              mmTop = 129911
              mmWidth = 41804
              BandType = 4
            end
            object ppLine41: TppLine
              UserName = 'Line41'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 127794
              mmTop = 92075
              mmWidth = 60854
              BandType = 4
            end
            object ppLine42: TppLine
              UserName = 'Line42'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 127794
              mmTop = 99484
              mmWidth = 60854
              BandType = 4
            end
            object ppLine43: TppLine
              UserName = 'Line43'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 127794
              mmTop = 106892
              mmWidth = 60854
              BandType = 4
            end
            object ppLine44: TppLine
              UserName = 'Line44'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 127794
              mmTop = 114300
              mmWidth = 60854
              BandType = 4
            end
            object ppLine45: TppLine
              UserName = 'Line45'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 127794
              mmTop = 121709
              mmWidth = 60854
              BandType = 4
            end
            object ppLine46: TppLine
              UserName = 'Line401'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 127794
              mmTop = 129911
              mmWidth = 60854
              BandType = 4
            end
          end
          object ppFooterBand11: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand12: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13494
            mmPrintPosition = 0
            object ppRichText24: TppRichText
              UserName = 'RichText6'
              Caption = 'RichText6'
              RichText = 
                '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fswiss\fp' +
                'rq2 Arial;}{\f1\fswiss\fprq2\fcharset0 Arial;}{\f2\fswiss MS San' +
                's Serif;}}'#13#10'\viewkind4\uc1\pard\fi-142\li142\tx142\tx900\f0\fs18' +
                ' * \b\f1 Termo de Transa\'#39'e7\'#39'e3o Judicial - \b0 Acordo assinado' +
                ' pelas Entidades representativas dos Empregados e Assistidos da ' +
                'Brasil Telecom em mar\'#39'e7o de 2002 e  aprovado pelas Assembl\'#39'e9' +
                'ias Gerais dos mesmos.\f0\fs22\par'#13#10'\pard\f2\fs16\par'#13#10'}'#13#10
              mmHeight = 9260
              mmLeft = 5821
              mmTop = 2381
              mmWidth = 187061
              BandType = 7
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
            end
          end
        end
      end
    end
  end
  object ppTermoPensao: TppBDEPipeline
    DataSource = dsTermoPensao
    SkipWhenNoRecords = False
    UserName = 'TermoAssist1'
    Left = 457
    Top = 150
    object ppPensaoppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object ppPensaoppField2: TppField
      FieldAlias = 'NOMEPARTICIPANTE'
      FieldName = 'NOMEPARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppPensaoppField3: TppField
      FieldAlias = 'NOMEPLANOATUAL'
      FieldName = 'NOMEPLANOATUAL'
      FieldLength = 11
      DisplayWidth = 11
      Position = 2
    end
    object ppPensaoppField4: TppField
      FieldAlias = 'NOMEPATROCINADORA'
      FieldName = 'NOMEPATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppPensaoppField5: TppField
      FieldAlias = 'DATADADOS'
      FieldName = 'DATADADOS'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppPensaoppField6: TppField
      FieldAlias = 'DATATRANSACAO'
      FieldName = 'DATATRANSACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object ppPensaoppField7: TppField
      FieldAlias = 'CAMPORELAT1'
      FieldName = 'CAMPORELAT1'
      FieldLength = 100
      DisplayWidth = 100
      Position = 6
    end
    object ppPensaoppField8: TppField
      FieldAlias = 'CAMPORELAT2'
      FieldName = 'CAMPORELAT2'
      FieldLength = 100
      DisplayWidth = 100
      Position = 7
    end
    object ppPensaoppField9: TppField
      FieldAlias = 'CAMPORELAT3'
      FieldName = 'CAMPORELAT3'
      FieldLength = 100
      DisplayWidth = 100
      Position = 8
    end
    object ppPensaoppField10: TppField
      FieldAlias = 'CAMPORELAT4'
      FieldName = 'CAMPORELAT4'
      FieldLength = 100
      DisplayWidth = 100
      Position = 9
    end
    object ppPensaoppField11: TppField
      FieldAlias = 'CAMPORELAT5'
      FieldName = 'CAMPORELAT5'
      FieldLength = 100
      DisplayWidth = 100
      Position = 10
    end
    object ppPensaoppField12: TppField
      FieldAlias = 'CAMPORELAT6'
      FieldName = 'CAMPORELAT6'
      FieldLength = 100
      DisplayWidth = 100
      Position = 11
    end
    object ppPensaoppField13: TppField
      FieldAlias = 'CAMPORELAT7'
      FieldName = 'CAMPORELAT7'
      FieldLength = 100
      DisplayWidth = 100
      Position = 12
    end
    object ppPensaoppField14: TppField
      FieldAlias = 'CAMPORELAT8'
      FieldName = 'CAMPORELAT8'
      FieldLength = 100
      DisplayWidth = 100
      Position = 13
    end
    object ppPensaoppField15: TppField
      FieldAlias = 'CAMPORELAT9'
      FieldName = 'CAMPORELAT9'
      FieldLength = 100
      DisplayWidth = 100
      Position = 14
    end
    object ppPensaoppField16: TppField
      FieldAlias = 'CAMPORELAT10'
      FieldName = 'CAMPORELAT10'
      FieldLength = 100
      DisplayWidth = 100
      Position = 15
    end
  end
  object dsTermoPensao: TwwDataSource
    DataSet = qryTermoPensao
    Left = 457
    Top = 166
  end
  object qryTermoPensao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EL.MATRICULA,'
      '       P.NOME AS NOMEPARTICIPANTE,'
      
        '       DECODE(PL.IDPLANOPREV, 3, '#39'FUNDADOR'#39', '#39'ALTERNATIVO'#39') NOME' +
        'PLANOATUAL,'
      '       PT.NOME AS NOMEPATROCINADORA,'
      '       :DATADADOS,'
      '       SYSDATE AS DATATRANSACAO,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT1,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT2,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT3,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT4,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT5,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT6,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT7,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT8,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT9,'
      
        '       '#39'                                                        ' +
        '                                            '#39' AS CAMPORELAT10'
      
        'FROM   PESSOA P, PESSOA PT, ELEGPATRO EL, PARTPREVPLAN PP, PLANP' +
        'REV PL,'
      '       EVENTOGERADOR EG'
      'WHERE  EL.IDPESSJUR      = :IDPESSJUR'
      'AND    EL.IDPESSOA       = :IDPESSOA'
      'AND    P.IDPESSOA        = EL.IDPESSOA'
      'AND    PT.IDPESSOA       = EL.IDPESSJUR '
      'AND    PP.IDPESSJUR      = EL.IDPESSJUR'
      'AND    PP.IDPESSOA       = EL.IDPESSOA'
      'AND    PP.FLGDESATIVADO  = 0'
      'AND    PL.IDPLANOPREV    = PP.IDPLANOPREV'
      'AND    EG.IDEVENTOGERADOR = :IDEVENTOGERADOR'
      ''
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updPensao
    ValidateWithMask = True
    Left = 465
    Top = 192
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATADADOS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '8636'
      end
      item
        DataType = ftInteger
        Name = 'IDEVENTOGERADOR'
        ParamType = ptUnknown
        Value = '45'
      end>
  end
  object updPensao: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 460
    Top = 196
  end
  object DsgnPENSAO: TppDesigner
    Caption = 'ReportBuilder'
    DataSettings.DatabaseName = 'BaseDados'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Position = poScreenCenter
    Report = rpTermoPensao
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 460
    Top = 211
  end
  object ppOBSPag1: TppBDEPipeline
    DataSource = dsOBSPag1
    UserName = 'OBSPag1'
    Left = 123
    Top = 107
    object ppOBSPag1ppField1: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 163
      DisplayWidth = 163
      Position = 0
    end
  end
  object dsOBSPag1: TwwDataSource
    DataSet = qryOBSPag1
    Left = 122
    Top = 142
  end
  object qryOBSPag1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TO_CHAR(ROWNUM)||'#39'.) '#39'||NOME AS OBSERVACAO'
      'FROM   TIPOSTRANSFPLANO'
      'WHERE  FLGTIPO = '#39'R'#39
      'AND    TIPOOBS = 1'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 126
    Top = 170
  end
  object ppOBSPag2: TppBDEPipeline
    DataSource = dsOBSPag2
    UserName = 'OBSPag2'
    Left = 211
    Top = 99
    object ppOBSPag2ppField1: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 163
      DisplayWidth = 163
      Position = 0
    end
  end
  object dsOBSPag2: TwwDataSource
    DataSet = qryOBSPag2
    Left = 210
    Top = 134
  end
  object qryOBSPag2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TO_CHAR(ROWNUM)||'#39'.) '#39'||NOME AS OBSERVACAO'
      'FROM   TIPOSTRANSFPLANO'
      'WHERE  FLGTIPO = '#39'R'#39
      'AND    TIPOOBS = 1'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 214
    Top = 162
  end
end
