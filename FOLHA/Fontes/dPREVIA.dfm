inherited dtmPREVIA: TdtmPREVIA
  Left = 309
  Top = 281
  Width = 552
  Height = 251
  Scaled = False
  OnCreate = dtmPREVIACreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 20
    Top = 59
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
    Left = 20
    Top = 104
  end
  inherited qryExemplo: TwwQuery
    Left = 20
    Top = 149
  end
  inherited rpExemplo: TppReport
    Left = 20
    Top = 15
    DataPipelineName = 'pplExemplo'
  end
  object qryPREVIA: TwwQuery
    BeforeOpen = qryPREVIABeforeOpen
    AfterOpen = qryPREVIAAfterOpen
    AfterClose = qryPREVIAAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT H.IDRESPONSAVEL,'
      '        H.IDTITULAR,'
      '        PAT.NOME AS PATRO,'
      '        RESP.NUMDOCUMENTO AS CPF,'
      '        RESP.NOME AS RESPONSAVEL,'
      '        TIT.NOME AS TITULAR,'
      '        EPP.NOME AS EPP,'
      '        H.IDPATRO,'
      '        PL.NOME AS PLANO,'
      '        H.MESCOBRANCA,'
      '        H.IDPLANOPREV,'
      '        PF.FLGISENTOIRRF,'
      '        PF.DATANASC,'
      '        H.PARCELAS,'
      '        DECODE(H.FLGTIPODESC,'#39'Y'#39',H.ORDEM,NULL) AS  ORDEM_1,'
      
        '        DECODE(H.FONTEPAGADORA,1,'#39'FUND'#39','#39'INSS'#39') AS FONTEPAGADORA' +
        ','
      '        PF.NUMDEPIRRF,'
      
        '        DECODE(PF.FLGSOMAIRSUPINSS,0,'#39'NÃO'#39','#39'SIM'#39') AS FLGSOMAIRSU' +
        'PINSS,'
      
        '        DECODE(PCJ.FLGFAZDEPOSITO,0,'#39'NÃO'#39','#39'SIM'#39' ) AS FLGFAZDEPOS' +
        'ITO,'
      '        PPP.INSCRICAONUMERO,'
      '        EL.MATRICULA,'
      '        DP.MATRICULA AS MATDEP,'
      '        H.CODPORTFORMA, '
      
        '        DECODE(PPP.TIPOOPCAOIR, '#39'1'#39', '#39'Progressiva'#39', '#39'2'#39', '#39'Regres' +
        'siva'#39' , '#39#39') AS TIPOOPCAOIR'
      'FROM HISTRUBSAL H,'
      ' PESSOAFISICA PF,'
      ' PROCJUD PCJ,'
      ' ELEGPATRO EL,'
      ' PARTPREVPLAN PPP,'
      ' PLANPREV PL,'
      ' PESSOA RESP,'
      ' PESSOA TIT,'
      ' PESSOA EPP,'
      ' DEPENTIT DP,'
      ' PESSOA PAT'
      'WHERE H.IDHSTFOLHABENEF = 1'
      'AND PL.IDPLANOPREV = H.IDPLANOPREV'
      'AND PF.IDPESSOA    = H.IDRESPONSAVEL'
      'AND PF.IDPESSOA    = PCJ.IDPESSOA(+)'
      'AND RESP.IDPESSOA  = H.IDRESPONSAVEL'
      'AND TIT.IDPESSOA   = H.IDTITULAR'
      'AND EPP.IDPESSOA   = H.IDTITULAR'
      'AND PPP.IDPESSOA   = H.IDTITULAR'
      'AND EL.IDPESSOA    = H.IDTITULAR'
      'AND PAT.IDPESSOA   = H.IDPATRO'
      'AND DP.IDTITULAR(+) = H.IDTITULAR'
      'AND DP.IDPESSOA(+) = H.IDRESPONSAVEL'
      'AND 1 = 2'
      'ORDER BY PAT.NOME, RESP.NOME'
      '')
    ValidateWithMask = True
    Left = 144
    Top = 149
  end
  object ReportPREVIA: TppReport
    AutoStop = False
    DataPipeline = ppPREVIA
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Pagemento da Folha de Benefícios'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.DatabaseSettings.DataPipeline = ppPREVIA
    Template.FileName = 'C:\ProjetosCM5\Folha\fontes\FolhaPagamento.rtm'
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 144
    Top = 16
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppPREVIA'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 38894
      mmPrintPosition = 0
      object LabTitulo: TppLabel
        UserName = 'LabTitulo'
        Caption = 'Pagamento da Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 60061
        mmTop = 25135
        mmWidth = 85725
        BandType = 0
      end
      object ReportPREVIADBImage1: TppDBImage
        UserName = 'ReportPREVIADBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 5027
        mmTop = 2910
        mmWidth = 39688
        BandType = 0
      end
      object ReportPREVIADBText16: TppDBText
        UserName = 'ReportPREVIADBText16'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 45508
        mmTop = 2910
        mmWidth = 35719
        BandType = 0
      end
      object ReportPREVIADBText17: TppDBText
        UserName = 'ReportPREVIADBText17'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 45508
        mmTop = 9525
        mmWidth = 16140
        BandType = 0
      end
      object ReportPREVIADBText18: TppDBText
        UserName = 'ReportPREVIADBText18'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 45508
        mmTop = 13758
        mmWidth = 14552
        BandType = 0
      end
      object ReportPREVIADBText19: TppDBText
        UserName = 'ReportPREVIADBText19'
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
        mmLeft = 45508
        mmTop = 17992
        mmWidth = 17198
        BandType = 0
      end
      object lblDescricao: TppLabel
        UserName = 'lblDescricao'
        Caption = 'lblDescricao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 33867
        mmWidth = 21167
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        Tag = 1
        UserName = 'Detalhe1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = False
        DataPipelineName = 'ppDetalhe'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDetalhe
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relatório de Pagemento da Folha de Benefícios'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 296863
          PrinterSetup.mmPaperWidth = 210080
          PrinterSetup.PaperSize = 9
          Template.DatabaseSettings.DataPipeline = ppPREVIA
          Units = utScreenPixels
          Left = 216
          Top = 160
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppDetalhe'
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ReportPREVIADBText11: TppDBText
              UserName = 'ReportPREVIADBText11'
              DataField = 'MES'
              DataPipeline = ppDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 3704
              mmLeft = 1323
              mmTop = 265
              mmWidth = 14288
              BandType = 4
            end
            object ReportPREVIADBText7: TppDBText
              UserName = 'ReportPREVIADBText7'
              DataField = 'IDPROVENTO'
              DataPipeline = ppDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 3704
              mmLeft = 16933
              mmTop = 265
              mmWidth = 12965
              BandType = 4
            end
            object ReportPREVIADBText4: TppDBText
              UserName = 'ReportPREVIADBText4'
              DataField = 'DESCRICAO'
              DataPipeline = ppDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 3704
              mmLeft = 30956
              mmTop = 265
              mmWidth = 62971
              BandType = 4
            end
            object DbProventos: TppDBText
              UserName = 'DbProventos'
              BlankWhenZero = True
              DataField = 'PROVENTO'
              DataPipeline = ppDetalhe
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 3704
              mmLeft = 96309
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ReportPREVIADBText6: TppDBText
              UserName = 'ReportPREVIADBText6'
              BlankWhenZero = True
              DataField = 'DESCONTO'
              DataPipeline = ppDetalhe
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 3704
              mmLeft = 116681
              mmTop = 0
              mmWidth = 16669
              BandType = 4
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              BlankWhenZero = True
              DataField = 'INFORMATIVO'
              DataPipeline = ppDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 3704
              mmLeft = 135467
              mmTop = 265
              mmWidth = 23283
              BandType = 4
            end
            object dbSumProv: TppDBCalc
              UserName = 'dbSumProv'
              DataField = 'PROVENTO'
              DataPipeline = ppDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              Visible = False
              DataPipelineName = 'ppDetalhe'
              mmHeight = 7673
              mmLeft = 74877
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object dbSumDesc: TppDBCalc
              UserName = 'dbSumDesc'
              DataField = 'DESCONTO'
              DataPipeline = ppDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              Visible = False
              DataPipelineName = 'ppDetalhe'
              mmHeight = 3969
              mmLeft = 135467
              mmTop = 0
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'PARCELAS'
              DataPipeline = ppDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 3440
              mmLeft = 164307
              mmTop = 529
              mmWidth = 9790
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'ORDEM_1'
              DataPipeline = ppDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 3440
              mmLeft = 176213
              mmTop = 529
              mmWidth = 8202
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText16'
              DataField = 'FONTEPAGADORA'
              DataPipeline = ppDetalhe
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 3440
              mmLeft = 186002
              mmTop = 265
              mmWidth = 8996
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 12435
            mmPrintPosition = 0
            object dbTotProvento: TppDBCalc
              UserName = 'dbTotProvento'
              DataField = 'PROVENTO'
              DataPipeline = ppDetalhe
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 3969
              mmLeft = 87842
              mmTop = 1058
              mmWidth = 24342
              BandType = 7
            end
            object dbTotDesconto: TppDBCalc
              UserName = 'dbTotDesconto'
              DataField = 'DESCONTO'
              DataPipeline = ppDetalhe
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppDetalhe'
              mmHeight = 3969
              mmLeft = 112184
              mmTop = 1058
              mmWidth = 24342
              BandType = 7
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 0
              mmWidth = 197380
              BandType = 7
            end
            object ppLabel6: TppLabel
              UserName = 'Label6'
              Caption = 'Líquido a Receber'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 89959
              mmTop = 6085
              mmWidth = 27781
              BandType = 7
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Totais'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 75671
              mmTop = 1058
              mmWidth = 9525
              BandType = 7
            end
            object lblTotLiq: TppLabel
              OnPrint = lblTotLiqPrint
              UserName = 'Label3'
              Caption = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 119856
              mmTop = 6085
              mmWidth = 1852
              BandType = 7
            end
            object ReportPREVIALine7: TppLine
              UserName = 'ReportPREVIALine7'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 265
              mmLeft = 0
              mmTop = 10583
              mmWidth = 197380
              BandType = 7
            end
          end
          object ppGroup2: TppGroup
            BreakName = 'IDRESPONSAVEL'
            DataPipeline = ppDetalhe
            OutlineSettings.CreateNode = True
            UserName = 'Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppDetalhe'
            object ppGroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
              object ppLabel3: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Caption = 'Mês Ref.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3175
                mmLeft = 1323
                mmTop = 794
                mmWidth = 15346
                BandType = 3
                GroupNo = 0
              end
              object ppLabel15: TppLabel
                UserName = 'Label15'
                AutoSize = False
                Caption = 'Código '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 16933
                mmTop = 794
                mmWidth = 12965
                BandType = 3
                GroupNo = 0
              end
              object ppLabel10: TppLabel
                UserName = 'Label10'
                AutoSize = False
                Caption = 'Descrição da Rubrica'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 30956
                mmTop = 794
                mmWidth = 45508
                BandType = 3
                GroupNo = 0
              end
              object ppLabel11: TppLabel
                UserName = 'Label2'
                AutoSize = False
                Caption = 'Proventos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 96044
                mmTop = 794
                mmWidth = 16140
                BandType = 3
                GroupNo = 0
              end
              object ppLabel14: TppLabel
                UserName = 'Label14'
                AutoSize = False
                Caption = 'Descontos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 115359
                mmTop = 794
                mmWidth = 17198
                BandType = 3
                GroupNo = 0
              end
              object ppLabel46: TppLabel
                UserName = 'Label101'
                AutoSize = False
                Caption = 'Informativo (*)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 135996
                mmTop = 794
                mmWidth = 21960
                BandType = 3
                GroupNo = 0
              end
              object ppLabel16: TppLabel
                UserName = 'Label16'
                AutoSize = False
                Caption = '/'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 29898
                mmTop = 265
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppLine3: TppLine
                UserName = 'Line3'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 794
                mmLeft = 0
                mmTop = 265
                mmWidth = 197380
                BandType = 3
                GroupNo = 0
              end
              object ppLabel30: TppLabel
                UserName = 'Label4'
                Caption = 'Prazo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 164307
                mmTop = 529
                mmWidth = 8731
                BandType = 3
                GroupNo = 0
              end
              object ppLabel32: TppLabel
                UserName = 'Label5'
                Caption = 'Seq.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 176213
                mmTop = 529
                mmWidth = 6879
                BandType = 3
                GroupNo = 0
              end
              object ppLabel33: TppLabel
                UserName = 'Label8'
                Caption = 'F.Pag,'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3969
                mmLeft = 185738
                mmTop = 529
                mmWidth = 9525
                BandType = 3
                GroupNo = 0
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
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLabelSistema: TppLabel
        UserName = 'LabelSistema'
        AutoSize = False
        Caption = 'Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 6879
        mmWidth = 103188
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 6879
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 6879
        mmWidth = 30692
        BandType = 8
      end
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 
          '(*) Legenda: (I) - valor informativo relativo a rubrica ; (R) re' +
          'síduo em caso de não haver margem para desconto da rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 265
        mmWidth = 145521
        BandType = 8
      end
    end
    object ReportPREVIASummaryBand1: TppSummaryBand
      BeforePrint = ReportPREVIASummaryBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ReportPREVIALabel1: TppLabel
        UserName = 'ReportPREVIALabel1'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 5292
        mmWidth = 18785
        BandType = 7
      end
      object ppLineFinished: TppLine
        UserName = 'LineFinished'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 10583
        mmWidth = 197380
        BandType = 7
      end
      object pplTotalLiquido: TppLabel
        UserName = 'lTotalLiquido'
        AutoSize = False
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 159279
        mmTop = 5556
        mmWidth = 36777
        BandType = 7
      end
      object pplTotalProvento: TppLabel
        UserName = 'lTotalLiquido1'
        AutoSize = False
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 66411
        mmTop = 5556
        mmWidth = 36777
        BandType = 7
      end
      object pplTotalDesconto: TppLabel
        UserName = 'lTotalLiquido2'
        AutoSize = False
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 113771
        mmTop = 5556
        mmWidth = 36777
        BandType = 7
      end
      object ppVarTotalGeral: TppVariable
        UserName = 'VarTotalGeral'
        CalcOrder = 0
        CalcComponent = ReportPREVIAGroup2
        CalcType = veGroupStart
        DataType = dtInteger
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ResetType = veReportStart
        Transparent = True
        mmHeight = 3969
        mmLeft = 29369
        mmTop = 5556
        mmWidth = 20638
        BandType = 7
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Total Geral Proventos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 66411
        mmTop = 529
        mmWidth = 36777
        BandType = 7
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Total Geral Descontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 113771
        mmTop = 529
        mmWidth = 36777
        BandType = 7
      end
      object ppLabel41: TppLabel
        UserName = 'Label41'
        AutoSize = False
        Caption = 'Total Geral Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 159279
        mmTop = 529
        mmWidth = 36777
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PATRO'
      DataPipeline = ppPREVIA
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppPREVIA'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppDBText8: TppDBText
          UserName = 'ppDBText8'
          DataField = 'PATRO'
          DataPipeline = ppPREVIA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppPREVIA'
          mmHeight = 4233
          mmLeft = 27781
          mmTop = 1058
          mmWidth = 115359
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'ppLabel4'
          AutoSize = False
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 1058
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'ppLabel5'
          AutoSize = False
          Caption = 'Mês Folha :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 144463
          mmTop = 1058
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ReportPREVIADBText13: TppDBText
          UserName = 'ReportPREVIADBText13'
          DataField = 'MESCOBRANCA'
          DataPipeline = ppPREVIA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppPREVIA'
          mmHeight = 4233
          mmLeft = 166159
          mmTop = 1058
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Visible = False
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object pplDataFinal: TppLabel
          UserName = 'lDataFinal'
          Caption = 'Total da Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 4233
          mmLeft = 3440
          mmTop = 794
          mmWidth = 38629
          BandType = 5
          GroupNo = 0
        end
        object DbTotProvPatro: TppDBCalc
          UserName = 'DbTotProvPatro'
          AutoSize = True
          DataField = 'PROVENTO'
          DataPipeline = ppDetalhe
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'ppDetalhe'
          mmHeight = 4233
          mmLeft = 134303
          mmTop = 794
          mmWidth = 33443
          BandType = 5
          GroupNo = 0
        end
        object ReportPREVIALine6: TppLine
          UserName = 'ReportPREVIALine6'
          ParentWidth = True
          Visible = False
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object DbTotDescPatro: TppDBCalc
          OnPrint = DbTotDescPatroPrint
          UserName = 'DbTotDescPatro'
          DataField = 'DESCONTO'
          DataPipeline = ppDetalhe
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'ppDetalhe'
          mmHeight = 4233
          mmLeft = 170921
          mmTop = 794
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
        object lbTotLiqPatro: TppLabel
          UserName = 'lbTotLiqPatro'
          Caption = '0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 103717
          mmTop = 794
          mmWidth = 6350
          BandType = 5
          GroupNo = 0
        end
        object ReportPREVIADBCalc2: TppDBCalc
          UserName = 'ReportPREVIADBCalc2'
          DataField = 'IDRESPONSAVEL'
          DataPipeline = ppPREVIA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          SuppressRepeatedValues = True
          Transparent = True
          Visible = False
          DBCalcType = dcCount
          DataPipelineName = 'ppPREVIA'
          mmHeight = 3969
          mmLeft = 50006
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'ppLine1'
          ParentWidth = True
          Visible = False
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 5556
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ReportPREVIAGroup2: TppGroup
      BreakName = 'IDRESPONSAVEL'
      DataPipeline = ppPREVIA
      OutlineSettings.CreateNode = True
      UserName = 'ReportPREVIAGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppPREVIA'
      object ReportPREVIAGroupHeaderBand2: TppGroupHeaderBand
        AfterPrint = ReportPREVIAGroupHeaderBand2AfterPrint
        BeforePrint = ReportPREVIAGroupHeaderBand2BeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object ppSubRepBenef: TppSubReport
          UserName = 'Detalhe2'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppBenef'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 265
          mmWidth = 197380
          BandType = 3
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = ppBenef
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relatório de Pagemento da Folha de Benefícios'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 296863
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.DatabaseSettings.DataPipeline = ppPREVIA
            Units = utScreenPixels
            Left = 392
            Top = 120
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppBenef'
            object ppTitleBand2: TppTitleBand
              BeforePrint = ppTitleBand2BeforePrint
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 59531
              mmPrintPosition = 0
              object ppShape2: TppShape
                UserName = 'Shape2'
                mmHeight = 20373
                mmLeft = 1588
                mmTop = 14817
                mmWidth = 193411
                BandType = 1
              end
              object ppShape1: TppShape
                UserName = 'Shape1'
                mmHeight = 6879
                mmLeft = 1588
                mmTop = 6085
                mmWidth = 193411
                BandType = 1
              end
              object ppdbtxtPatro: TppDBText
                UserName = 'dbtxtPlano1'
                DataField = 'PATRO'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3175
                mmLeft = 116946
                mmTop = 1852
                mmWidth = 78317
                BandType = 1
              end
              object ppLine2: TppLine
                UserName = 'Line1'
                ParentWidth = True
                Style = lsDouble
                Weight = 1
                mmHeight = 1323
                mmLeft = 0
                mmTop = 265
                mmWidth = 197380
                BandType = 1
              end
              object ppLblPlano: TppLabel
                UserName = 'LblPlano'
                AutoSize = False
                Caption = 'Plano'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 1323
                mmTop = 1852
                mmWidth = 8996
                BandType = 1
              end
              object ppdbtxtPlano: TppDBText
                UserName = 'dbtxtPlano'
                DataField = 'PLANO'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3175
                mmLeft = 11642
                mmTop = 1852
                mmWidth = 81492
                BandType = 1
              end
              object ppLblPatro: TppLabel
                UserName = 'LblPlano1'
                AutoSize = False
                Caption = 'Patrocinadora'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 94986
                mmTop = 1852
                mmWidth = 20902
                BandType = 1
              end
              object ReportPREVIALabel9: TppLabel
                UserName = 'ReportPREVIALabel9'
                AutoSize = False
                Caption = 'Matrícula'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 28046
                mmTop = 7938
                mmWidth = 14552
                BandType = 1
              end
              object ReportPREVIADBText8: TppDBText
                UserName = 'ReportPREVIADBText8'
                DataField = 'MATRICULA'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3175
                mmLeft = 44715
                mmTop = 7938
                mmWidth = 23813
                BandType = 1
              end
              object ReportPREVIALabel10: TppLabel
                UserName = 'ReportPREVIALabel10'
                AutoSize = False
                Caption = 'Nº Inscrição'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 70644
                mmTop = 7673
                mmWidth = 17463
                BandType = 1
              end
              object ReportPREVIADBText9: TppDBText
                UserName = 'ReportPREVIADBText9'
                BlankWhenZero = True
                DataField = 'INSCRICAONUMERO'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3175
                mmLeft = 89165
                mmTop = 7938
                mmWidth = 25665
                BandType = 1
              end
              object ReportPREVIALabel19: TppLabel
                UserName = 'ReportPREVIALabel19'
                AutoSize = False
                Caption = 'Data Nasc.:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 35983
                mmTop = 20902
                mmWidth = 16404
                BandType = 1
              end
              object ReportPREVIADBText15: TppDBText
                UserName = 'ReportPREVIADBText15'
                DataField = 'DATANASC'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3175
                mmLeft = 53975
                mmTop = 20902
                mmWidth = 20373
                BandType = 1
              end
              object ppLblIdLote: TppLabel
                UserName = 'ppLblIdLote'
                AutoSize = False
                Caption = 'Isento IRRF:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 76200
                mmTop = 20902
                mmWidth = 17463
                BandType = 1
              end
              object ppLabel8: TppLabel
                UserName = 'ppLblIdLote1'
                AutoSize = False
                Caption = 'Nº Dep. IRRF:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 139436
                mmTop = 20902
                mmWidth = 18256
                BandType = 1
              end
              object ppDBText2: TppDBText
                UserName = 'DBText2'
                DataField = 'NUMDEPIRRF'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3175
                mmLeft = 159279
                mmTop = 20902
                mmWidth = 7408
                BandType = 1
              end
              object ReportPREVIALabel2: TppLabel
                UserName = 'ReportPREVIALabel2'
                AutoSize = False
                Caption = 'Dados do Recebedor:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 2910
                mmTop = 16140
                mmWidth = 31750
                BandType = 1
              end
              object ReportPREVIADBText12: TppDBText
                UserName = 'ReportPREVIADBText12'
                DataField = 'RESPONSAVEL'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3175
                mmLeft = 89165
                mmTop = 16140
                mmWidth = 104246
                BandType = 1
              end
              object ReportPREVIALabel15: TppLabel
                UserName = 'ReportPREVIALabel15'
                AutoSize = False
                Caption = 'Nome'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 115888
                mmTop = 7938
                mmWidth = 9260
                BandType = 1
              end
              object ReportPREVIADBText10: TppDBText
                UserName = 'ReportPREVIADBText10'
                DataField = 'TITULAR'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3175
                mmLeft = 126471
                mmTop = 7938
                mmWidth = 67469
                BandType = 1
              end
              object LblBanco: TppLabel
                UserName = 'LblBanco'
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 4233
                mmLeft = 2910
                mmTop = 25400
                mmWidth = 92340
                BandType = 1
              end
              object ppLabel9: TppLabel
                UserName = 'Label9'
                AutoSize = False
                Caption = 'Portador Pagto'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 96309
                mmTop = 25400
                mmWidth = 22225
                BandType = 1
              end
              object lblForma: TppLabel
                UserName = 'Label1'
                AutoSize = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 4233
                mmLeft = 119063
                mmTop = 25400
                mmWidth = 74877
                BandType = 1
              end
              object ppLabel1: TppLabel
                UserName = 'Label2'
                AutoSize = False
                Caption = 'Dados doTitular:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 2910
                mmTop = 7938
                mmWidth = 23548
                BandType = 1
              end
              object ppLabel26: TppLabel
                UserName = 'Label26'
                AutoSize = False
                Caption = 'Matrícula:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 35983
                mmTop = 16140
                mmWidth = 14552
                BandType = 1
              end
              object ppDBText11: TppDBText
                UserName = 'DBText11'
                DataField = 'MATDEP'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3175
                mmLeft = 52123
                mmTop = 16140
                mmWidth = 23813
                BandType = 1
              end
              object ppLabel28: TppLabel
                UserName = 'Label28'
                AutoSize = False
                Caption = 'Nome'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 78317
                mmTop = 16140
                mmWidth = 9260
                BandType = 1
              end
              object ppLabel29: TppLabel
                UserName = 'ppLblIdLote2'
                AutoSize = False
                Caption = 'Base de IR Total:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 104246
                mmTop = 20902
                mmWidth = 24606
                BandType = 1
              end
              object ppDBText12: TppDBText
                UserName = 'DBText12'
                DataField = 'FLGISENTOIRRF'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3175
                mmLeft = 95250
                mmTop = 20902
                mmWidth = 7408
                BandType = 1
              end
              object ppDBText13: TppDBText
                UserName = 'DBText13'
                DataField = 'FLGSOMAIRSUPINSS'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3175
                mmLeft = 130440
                mmTop = 20902
                mmWidth = 7408
                BandType = 1
              end
              object ppRegion1: TppRegion
                UserName = 'Region1'
                Caption = 'Region1'
                Pen.Style = psClear
                Stretch = True
                mmHeight = 6615
                mmLeft = 1323
                mmTop = 36513
                mmWidth = 195527
                BandType = 1
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppSubReport2: TppSubReport
                  UserName = 'SubReport1'
                  ExpandAll = False
                  NewPrintJob = False
                  OutlineSettings.CreateNode = True
                  ParentWidth = False
                  TraverseAllData = False
                  DataPipelineName = 'ppMatricBenef'
                  mmHeight = 3704
                  mmLeft = 4762
                  mmTop = 38100
                  mmWidth = 188913
                  BandType = 1
                  mmBottomOffset = 0
                  mmOverFlowOffset = 0
                  mmStopPosition = 0
                  object ppChildReport5: TppChildReport
                    AutoStop = False
                    DataPipeline = ppMatricBenef
                    PrinterSetup.BinName = 'Default'
                    PrinterSetup.DocumentName = 'Relatório de Pagemento da Folha de Benefícios'
                    PrinterSetup.PaperName = 'A4'
                    PrinterSetup.PrinterName = 'Default'
                    PrinterSetup.mmMarginBottom = 6350
                    PrinterSetup.mmMarginLeft = 6350
                    PrinterSetup.mmMarginRight = 6350
                    PrinterSetup.mmMarginTop = 6350
                    PrinterSetup.mmPaperHeight = 296863
                    PrinterSetup.mmPaperWidth = 210080
                    PrinterSetup.PaperSize = 9
                    Template.DatabaseSettings.DataPipeline = ppPREVIA
                    Units = utScreenPixels
                    Left = 280
                    Top = 120
                    Version = '7.04'
                    mmColumnWidth = 0
                    DataPipelineName = 'ppMatricBenef'
                    object ppTitleBand4: TppTitleBand
                      mmBottomOffset = 0
                      mmHeight = 8731
                      mmPrintPosition = 0
                      object lblBenef: TppLabel
                        UserName = 'lblBenef'
                        AutoSize = False
                        Caption = 'Beneficiários'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = [fsBold]
                        Transparent = True
                        mmHeight = 3440
                        mmLeft = 3440
                        mmTop = 529
                        mmWidth = 20638
                        BandType = 1
                      end
                      object lblMatricBenef: TppLabel
                        UserName = 'lblMatricBenef'
                        AutoSize = False
                        Caption = 'Matrícula'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = [fsBold]
                        Transparent = True
                        mmHeight = 3440
                        mmLeft = 3440
                        mmTop = 4498
                        mmWidth = 14817
                        BandType = 1
                      end
                      object lblNome: TppLabel
                        UserName = 'lblNome'
                        AutoSize = False
                        Caption = 'Nome'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = [fsBold]
                        Transparent = True
                        mmHeight = 3440
                        mmLeft = 29898
                        mmTop = 4498
                        mmWidth = 9790
                        BandType = 1
                      end
                      object ppLine7: TppLine
                        UserName = 'Line7'
                        Weight = 0.75
                        mmHeight = 265
                        mmLeft = 1323
                        mmTop = 8202
                        mmWidth = 194205
                        BandType = 1
                      end
                    end
                    object ppDetailBand5: TppDetailBand
                      mmBottomOffset = 0
                      mmHeight = 3704
                      mmPrintPosition = 0
                      object dbMatricBenef: TppDBText
                        UserName = 'dbMatricBenef'
                        DataField = 'MATRICULA'
                        DataPipeline = ppMatricBenef
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        ParentDataPipeline = False
                        Transparent = True
                        DataPipelineName = 'ppMatricBenef'
                        mmHeight = 3175
                        mmLeft = 3440
                        mmTop = 529
                        mmWidth = 19050
                        BandType = 4
                      end
                      object dbNomeBenef: TppDBText
                        UserName = 'dbNomeBenef'
                        DataField = 'NOME'
                        DataPipeline = ppMatricBenef
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clBlack
                        Font.Name = 'Arial'
                        Font.Size = 8
                        Font.Style = []
                        ParentDataPipeline = False
                        Transparent = True
                        DataPipelineName = 'ppMatricBenef'
                        mmHeight = 3175
                        mmLeft = 29898
                        mmTop = 529
                        mmWidth = 91546
                        BandType = 4
                      end
                    end
                    object ppSummaryBand4: TppSummaryBand
                      mmBottomOffset = 0
                      mmHeight = 0
                      mmPrintPosition = 0
                    end
                  end
                end
              end
              object ppRegion2: TppRegion
                UserName = 'Region2'
                Pen.Style = psClear
                ShiftRelativeTo = ppRegion1
                mmHeight = 14288
                mmLeft = 1588
                mmTop = 43921
                mmWidth = 193411
                BandType = 1
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                object ppLabel18: TppLabel
                  UserName = 'Label18'
                  Caption = 'Processos de Benefício'
                  Color = 15461355
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  mmHeight = 3440
                  mmLeft = 6086
                  mmTop = 48154
                  mmWidth = 32015
                  BandType = 1
                end
                object ppLabel13: TppLabel
                  UserName = 'Label13'
                  AutoSize = False
                  Caption = 'Nº Processo'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 6086
                  mmTop = 52123
                  mmWidth = 26194
                  BandType = 1
                end
                object ppLabel12: TppLabel
                  UserName = 'Label12'
                  AutoSize = False
                  Caption = 'Data Início'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 34397
                  mmTop = 52123
                  mmWidth = 19050
                  BandType = 1
                end
                object ppDBText10: TppDBText
                  UserName = 'DBText10'
                  DataField = 'TEXTOLABEL'
                  DataPipeline = ppBenef
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  Transparent = True
                  DataPipelineName = 'ppBenef'
                  mmHeight = 4233
                  mmLeft = 55563
                  mmTop = 51858
                  mmWidth = 35190
                  BandType = 1
                end
                object ppLabel20: TppLabel
                  UserName = 'Label20'
                  AutoSize = False
                  Caption = 'Valor SRB'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 92076
                  mmTop = 52123
                  mmWidth = 24342
                  BandType = 1
                end
                object ppLabel21: TppLabel
                  UserName = 'Label21'
                  AutoSize = False
                  Caption = 'INSS'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 120915
                  mmTop = 52123
                  mmWidth = 24342
                  BandType = 1
                end
                object ppLabel22: TppLabel
                  UserName = 'Label22'
                  AutoSize = False
                  Caption = 'Valor Integral'
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Name = 'Arial'
                  Font.Size = 8
                  Font.Style = [fsBold]
                  TextAlignment = taRightJustified
                  Transparent = True
                  mmHeight = 3969
                  mmLeft = 150284
                  mmTop = 52123
                  mmWidth = 24342
                  BandType = 1
                end
                object ppLine9: TppLine
                  UserName = 'Line9'
                  ParentWidth = True
                  Style = lsDouble
                  Weight = 0.75
                  mmHeight = 1588
                  mmLeft = 1588
                  mmTop = 46038
                  mmWidth = 193411
                  BandType = 1
                end
              end
              object lblCPF: TppLabel
                UserName = 'lblCPF'
                AutoSize = False
                Caption = 'CPF:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 2910
                mmTop = 20902
                mmWidth = 6615
                BandType = 1
              end
              object ppDBText17: TppDBText
                UserName = 'DBText17'
                DataField = 'CPF'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3175
                mmLeft = 10054
                mmTop = 20902
                mmWidth = 24606
                BandType = 1
              end
              object ppLabel34: TppLabel
                UserName = 'lblCPF1'
                AutoSize = False
                Caption = 'Opção de Tributação:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 3175
                mmTop = 30692
                mmWidth = 31485
                BandType = 1
              end
              object ppDBText18: TppDBText
                UserName = 'DBText18'
                DataField = 'TIPOOPCAOIR'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3440
                mmLeft = 35719
                mmTop = 30427
                mmWidth = 59796
                BandType = 1
              end
              object ppDBText19: TppDBText
                UserName = 'DBText19'
                DataField = 'EPP'
                DataPipeline = ppPREVIA
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppPREVIA'
                mmHeight = 3440
                mmLeft = 105040
                mmTop = 30427
                mmWidth = 88636
                BandType = 1
              end
              object ppLabel35: TppLabel
                UserName = 'Label35'
                AutoSize = False
                Caption = 'EPP'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 96309
                mmTop = 30163
                mmWidth = 8202
                BandType = 1
              end
            end
            object ppDtBandBenef: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 7938
              mmPrintPosition = 0
              object ppDBText3: TppDBText
                UserName = 'DBText3'
                DataField = 'NUMEROPROCESSO'
                DataPipeline = ppBenef
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppBenef'
                mmHeight = 3175
                mmLeft = 2910
                mmTop = 265
                mmWidth = 26194
                BandType = 4
              end
              object ppDBText4: TppDBText
                UserName = 'DBText4'
                DataField = 'DATAINICIO'
                DataPipeline = ppBenef
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppBenef'
                mmHeight = 3175
                mmLeft = 31221
                mmTop = 265
                mmWidth = 19050
                BandType = 4
              end
              object ppDBText5: TppDBText
                UserName = 'DBText5'
                DataField = 'DATAFINAL'
                DataPipeline = ppBenef
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppBenef'
                mmHeight = 3175
                mmLeft = 52388
                mmTop = 265
                mmWidth = 30427
                BandType = 4
              end
              object ppDBText6: TppDBText
                UserName = 'DBText6'
                DataField = 'VALORTOTAL'
                DataPipeline = ppBenef
                DisplayFormat = '#,0.00;(#,0.00)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppBenef'
                mmHeight = 3175
                mmLeft = 147109
                mmTop = 265
                mmWidth = 24342
                BandType = 4
              end
              object ppDBText7: TppDBText
                UserName = 'DBText7'
                DataField = 'VALORSRB'
                DataPipeline = ppBenef
                DisplayFormat = '#,0.00;(#,0.00)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppBenef'
                mmHeight = 3175
                mmLeft = 88900
                mmTop = 265
                mmWidth = 24342
                BandType = 4
              end
              object ppDBText9: TppDBText
                UserName = 'DBText9'
                DataField = 'VLRINFINSS'
                DataPipeline = ppBenef
                DisplayFormat = '#,0.00;(#,0.00)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppBenef'
                mmHeight = 3175
                mmLeft = 117740
                mmTop = 265
                mmWidth = 24342
                BandType = 4
              end
              object pplNomebase1: TppLabel
                UserName = 'lNomebase1'
                AutoSize = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 2910
                mmTop = 3969
                mmWidth = 26194
                BandType = 4
              end
              object pplValorBase1: TppLabel
                UserName = 'lValorBase1'
                AutoSize = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 30163
                mmTop = 3969
                mmWidth = 21696
                BandType = 4
              end
              object pplNomebase2: TppLabel
                UserName = 'lNomebase2'
                AutoSize = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 55033
                mmTop = 3969
                mmWidth = 26194
                BandType = 4
              end
              object pplValorBase2: TppLabel
                UserName = 'lSRB1'
                AutoSize = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 82286
                mmTop = 3969
                mmWidth = 21696
                BandType = 4
              end
              object pplNomebase3: TppLabel
                UserName = 'lNomebase3'
                AutoSize = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 106892
                mmTop = 3969
                mmWidth = 26194
                BandType = 4
              end
              object pplValorBase3: TppLabel
                UserName = 'lINSS2'
                AutoSize = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 134409
                mmTop = 3969
                mmWidth = 21696
                BandType = 4
              end
              object pplNomeRateio: TppLabel
                UserName = 'lNomeRateio'
                AutoSize = False
                Caption = '% Rateio'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 158750
                mmTop = 3969
                mmWidth = 12965
                BandType = 4
              end
              object pplValorRateio: TppLabel
                UserName = 'lValorRateio'
                AutoSize = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 172773
                mmTop = 3969
                mmWidth = 21696
                BandType = 4
              end
            end
          end
        end
        object ppSubRepRubIndiv: TppSubReport
          UserName = 'Detalhe3'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = ppSubRepBenef
          TraverseAllData = False
          DataPipelineName = 'ppRubIndiv'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 4763
          mmWidth = 197380
          BandType = 3
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = ppRubIndiv
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relatório de Pagemento da Folha de Benefícios'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 296863
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.DatabaseSettings.DataPipeline = ppPREVIA
            Units = utScreenPixels
            Left = 272
            Top = 112
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppRubIndiv'
            object ppTitleBand1: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 9260
              mmPrintPosition = 0
              object pplblDataInicio: TppLabel
                UserName = 'lblDataInicio'
                AutoSize = False
                Caption = 'Data Início'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 2910
                mmTop = 6085
                mmWidth = 13494
                BandType = 1
              end
              object pplblDataFinal: TppLabel
                UserName = 'lblDataFinal'
                AutoSize = False
                Caption = 'Data Final'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 17727
                mmTop = 6085
                mmWidth = 12700
                BandType = 1
              end
              object pplblNumOcor: TppLabel
                UserName = 'lblNumOcor'
                AutoSize = False
                Caption = 'N.Ocor.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 31485
                mmTop = 6085
                mmWidth = 10054
                BandType = 1
              end
              object pplblParcelas: TppLabel
                UserName = 'lblParcelas'
                AutoSize = False
                Caption = 'Parcelas'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 42598
                mmTop = 6085
                mmWidth = 11113
                BandType = 1
              end
              object pplblCodRub: TppLabel
                UserName = 'lblCodRub'
                AutoSize = False
                Caption = 'Cód.Rub.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 54769
                mmTop = 6085
                mmWidth = 12171
                BandType = 1
              end
              object pplblNomeRub: TppLabel
                UserName = 'lblNomeRub'
                AutoSize = False
                Caption = 'Rubrica'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 67998
                mmTop = 6085
                mmWidth = 10054
                BandType = 1
              end
              object pplblSeqRub: TppLabel
                UserName = 'lblSeqRub'
                AutoSize = False
                Caption = 'Seq.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 97102
                mmTop = 6085
                mmWidth = 6085
                BandType = 1
              end
              object pplblCodRegra: TppLabel
                UserName = 'lblCodRegra'
                AutoSize = False
                Caption = 'Cód.Regra'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 104775
                mmTop = 6085
                mmWidth = 13758
                BandType = 1
              end
              object pplblRegra: TppLabel
                UserName = 'lblRegra'
                AutoSize = False
                Caption = 'Regra'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 120386
                mmTop = 6085
                mmWidth = 7938
                BandType = 1
              end
              object pplblValor: TppLabel
                UserName = 'lblValor'
                AutoSize = False
                Caption = 'Valor'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 154782
                mmTop = 6085
                mmWidth = 6879
                BandType = 1
              end
              object pplblPermanente: TppLabel
                UserName = 'lblPermanente'
                AutoSize = False
                Caption = 'Perm. ?'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 170921
                mmTop = 6085
                mmWidth = 10054
                BandType = 1
              end
              object pplblPA: TppLabel
                UserName = 'lblPA'
                AutoSize = False
                Caption = 'PA ?'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 182563
                mmTop = 6085
                mmWidth = 6615
                BandType = 1
              end
              object pplblTituloRubIndiv: TppLabel
                UserName = 'lblTituloRubIndiv'
                Caption = 
                  'Rubricas Individuais com Regra de Cálculo ou Ocorrências a Proce' +
                  'ssar'
                Color = 15461355
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                mmHeight = 3175
                mmLeft = 2910
                mmTop = 2117
                mmWidth = 94192
                BandType = 1
              end
              object ppLine5: TppLine
                UserName = 'Line5'
                ParentWidth = True
                Style = lsDouble
                Weight = 0.75
                mmHeight = 1323
                mmLeft = 0
                mmTop = 529
                mmWidth = 197380
                BandType = 1
              end
            end
            object ppDetailBand3: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppdbtDataInicio: TppDBText
                UserName = 'dbtDataInicio'
                DataField = 'DATAINICIO'
                DataPipeline = ppRubIndiv
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppRubIndiv'
                mmHeight = 3704
                mmLeft = 2910
                mmTop = 0
                mmWidth = 13494
                BandType = 4
              end
              object ppdbtDataFinal: TppDBText
                UserName = 'dbtDataFinal'
                DataField = 'DATAFINAL'
                DataPipeline = ppRubIndiv
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppRubIndiv'
                mmHeight = 3704
                mmLeft = 17727
                mmTop = 0
                mmWidth = 12700
                BandType = 4
              end
              object ppdbtNOcor: TppDBText
                UserName = 'dbtNOcor'
                DataField = 'NUMOCORRENCIAS'
                DataPipeline = ppRubIndiv
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppRubIndiv'
                mmHeight = 3704
                mmLeft = 31485
                mmTop = 0
                mmWidth = 10054
                BandType = 4
              end
              object ppdbtParcelas: TppDBText
                UserName = 'dbtParcelas'
                DataField = 'PARCELAS'
                DataPipeline = ppRubIndiv
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppRubIndiv'
                mmHeight = 3704
                mmLeft = 42598
                mmTop = 0
                mmWidth = 11113
                BandType = 4
              end
              object ppdbtCodRub: TppDBText
                UserName = 'dbtCodRub'
                DataField = 'CODRUBRICA'
                DataPipeline = ppRubIndiv
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppRubIndiv'
                mmHeight = 3704
                mmLeft = 54769
                mmTop = 0
                mmWidth = 12171
                BandType = 4
              end
              object ppdbtRubrica: TppDBText
                UserName = 'dbtRubrica'
                DataField = 'NOMERUBRICA'
                DataPipeline = ppRubIndiv
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppRubIndiv'
                mmHeight = 3704
                mmLeft = 67998
                mmTop = 0
                mmWidth = 28046
                BandType = 4
              end
              object ppdbtSeq: TppDBText
                UserName = 'dbtSeq'
                DataField = 'SEQRUBRICAINDIV'
                DataPipeline = ppRubIndiv
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppRubIndiv'
                mmHeight = 3704
                mmLeft = 97102
                mmTop = 0
                mmWidth = 6085
                BandType = 4
              end
              object ppdbtCodRegra: TppDBText
                UserName = 'dbtCodRegra'
                DataField = 'IDREGRACALCULO'
                DataPipeline = ppRubIndiv
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppRubIndiv'
                mmHeight = 3704
                mmLeft = 104775
                mmTop = 0
                mmWidth = 13758
                BandType = 4
              end
              object ppdbtNomeRegra: TppDBText
                UserName = 'dbtNomeRegra'
                DataField = 'NOMEREGRA'
                DataPipeline = ppRubIndiv
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppRubIndiv'
                mmHeight = 3704
                mmLeft = 120386
                mmTop = 0
                mmWidth = 32279
                BandType = 4
              end
              object ppdbtValor: TppDBText
                UserName = 'dbtValor'
                DataField = 'VALORRUBRICA'
                DataPipeline = ppRubIndiv
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppRubIndiv'
                mmHeight = 3704
                mmLeft = 154782
                mmTop = 0
                mmWidth = 14288
                BandType = 4
              end
              object ppdbtPerm: TppDBText
                UserName = 'dbtPerm'
                DataField = 'PERMANENTE'
                DataPipeline = ppRubIndiv
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppRubIndiv'
                mmHeight = 3704
                mmLeft = 170921
                mmTop = 0
                mmWidth = 10054
                BandType = 4
              end
              object ppdbtPA: TppDBText
                UserName = 'dbtPA'
                DataField = 'PENSAOALIM'
                DataPipeline = ppRubIndiv
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppRubIndiv'
                mmHeight = 3704
                mmLeft = 182563
                mmTop = 0
                mmWidth = 6615
                BandType = 4
              end
            end
            object ppSummaryBand2: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
        object ppSubRepAcJud: TppSubReport
          UserName = 'Detalhe4'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          ShiftRelativeTo = ppSubRepRubIndiv
          TraverseAllData = False
          DataPipelineName = 'ppAcJud'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 9260
          mmWidth = 197380
          BandType = 3
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport4: TppChildReport
            AutoStop = False
            DataPipeline = ppAcJud
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Relatório de Pagemento da Folha de Benefícios'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 296863
            PrinterSetup.mmPaperWidth = 210080
            PrinterSetup.PaperSize = 9
            Template.DatabaseSettings.DataPipeline = ppPREVIA
            Units = utScreenPixels
            Left = 288
            Top = 128
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppAcJud'
            object ppTitleBand3: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 11377
              mmPrintPosition = 0
              object ppLine6: TppLine
                UserName = 'Line6'
                ParentWidth = True
                Style = lsDouble
                Weight = 0.75
                mmHeight = 1323
                mmLeft = 0
                mmTop = 2646
                mmWidth = 197380
                BandType = 1
              end
              object pplblTituloAcaoJud: TppLabel
                UserName = 'lblTituloAcaoJud'
                Caption = 'Ação Judicial'
                Color = 15461355
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                mmHeight = 3175
                mmLeft = 5027
                mmTop = 4233
                mmWidth = 17727
                BandType = 1
              end
              object ppLabel2: TppLabel
                UserName = 'lblCodRub1'
                AutoSize = False
                Caption = 'Cód.Rub.'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 62442
                mmTop = 8202
                mmWidth = 12435
                BandType = 1
              end
              object ppLabel19: TppLabel
                UserName = 'lblNomeRub1'
                AutoSize = False
                Caption = 'Rubrica'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 78317
                mmTop = 8202
                mmWidth = 10319
                BandType = 1
              end
              object ppLabel24: TppLabel
                UserName = 'lblCodRegra1'
                AutoSize = False
                Caption = 'Cód.Regra'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 5027
                mmTop = 8202
                mmWidth = 14288
                BandType = 1
              end
              object ppLabel25: TppLabel
                UserName = 'lblRegra1'
                AutoSize = False
                Caption = 'Regra'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 20638
                mmTop = 8202
                mmWidth = 8467
                BandType = 1
              end
              object pplblFazDeposito: TppLabel
                UserName = 'lblPermanente1'
                AutoSize = False
                Caption = 'Faz Depósito'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 120121
                mmTop = 8202
                mmWidth = 17727
                BandType = 1
              end
              object ppLabel27: TppLabel
                UserName = 'lblPA1'
                AutoSize = False
                Caption = 'Situação'
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3175
                mmLeft = 139436
                mmTop = 8202
                mmWidth = 12965
                BandType = 1
              end
            end
            object ppDetailBand4: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object ppdbtCodRegraAJ: TppDBText
                UserName = 'dbtCodRub1'
                DataField = 'IDREGRA'
                DataPipeline = ppAcJud
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppAcJud'
                mmHeight = 3704
                mmLeft = 5556
                mmTop = 0
                mmWidth = 13229
                BandType = 4
              end
              object ppdbtNomeRegraAJ: TppDBText
                UserName = 'dbtRubrica1'
                DataField = 'NOMEREGRA'
                DataPipeline = ppAcJud
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppAcJud'
                mmHeight = 3704
                mmLeft = 20902
                mmTop = 0
                mmWidth = 39952
                BandType = 4
              end
              object ppdbtCodRubAJ: TppDBText
                UserName = 'dbtCodRegra1'
                DataField = 'CODRUBRICA'
                DataPipeline = ppAcJud
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppAcJud'
                mmHeight = 3704
                mmLeft = 62706
                mmTop = 0
                mmWidth = 13758
                BandType = 4
              end
              object ppdbtNomeRubAJ: TppDBText
                UserName = 'dbtNomeRegra1'
                DataField = 'NOMERUBRICA'
                DataPipeline = ppAcJud
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppAcJud'
                mmHeight = 3704
                mmLeft = 78052
                mmTop = 0
                mmWidth = 39952
                BandType = 4
              end
              object ppdbtFazDep: TppDBText
                UserName = 'dbtPerm1'
                DataField = 'FAZDEPOSITO'
                DataPipeline = ppAcJud
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppAcJud'
                mmHeight = 3704
                mmLeft = 120121
                mmTop = 0
                mmWidth = 16933
                BandType = 4
              end
              object ppdbtSituacao: TppDBText
                UserName = 'dbtPA1'
                DataField = 'SITUACAO'
                DataPipeline = ppAcJud
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                DataPipelineName = 'ppAcJud'
                mmHeight = 3704
                mmLeft = 139436
                mmTop = 0
                mmWidth = 31750
                BandType = 4
              end
            end
            object ppSummaryBand3: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object RodaPeBeneficiario: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650613
        566172546F74616C476572616C4F6E43616C630B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365065C70726F6365647572652056
        6172546F74616C476572616C4F6E43616C63287661722056616C75653A205661
        7269616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D2056616C
        7565202B20313B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D6506
        0D566172546F74616C476572616C094576656E744E616D6506064F6E43616C63
        074576656E74494402210000}
    end
  end
  object ppPREVIA: TppBDEPipeline
    DataSource = dsPREVIA
    SkipWhenNoRecords = False
    UserName = 'PREVIA'
    Left = 144
    Top = 59
  end
  object dsPREVIA: TwwDataSource
    DataSet = qryPREVIA
    Left = 144
    Top = 104
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO    ,'
      '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP       , I.IMAGEM, '
      '       (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDERECO   ,'
      '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 83
    Top = 149
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = '2'
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 83
    Top = 104
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 83
    Top = 59
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
    object ppFundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 10
    end
    object ppFundacaoppField12: TppField
      FieldAlias = 'BARCIDUF'
      FieldName = 'BARCIDUF'
      FieldLength = 79
      DisplayWidth = 79
      Position = 11
    end
  end
  object qryDetalhe: TwwQuery
    CachedUpdates = True
    AfterOpen = qryDetalheAfterOpen
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT HST.IDTITULAR, HST.IDRESPONSAVEL, RESP.NOME AS RESPONSAVE' +
        'L, HST.IDHSTFOLHABENEF,'
      
        '       HST.IDPATRO, HST.MES, HST.MESCOBRANCA, PD.IDPROVENTO, PD.' +
        'DESCRICAO, '#39' '#39' AS INFORMATIVO,'
      '       DECODE(PD.FLGDESCONTO,0,HST.VALORPROVENTO) AS PROVENTO,'
      '       DECODE(PD.FLGDESCONTO,1,HST.VALORPROVENTO) AS DESCONTO,'
      '       HST.PARCELAS,'
      '       DECODE(HST.FLGTIPODESC,'#39'Y'#39',HST.ORDEM,NULL) AS  ORDEM_1,'
      
        '       DECODE(HST.FONTEPAGADORA,1,'#39'FUND'#39','#39'INSS'#39') AS FONTEPAGADOR' +
        'A'
      'FROM HISTRUBSAL HST, PROVDESC PD, PESSOA RESP'
      'WHERE HST.IDHSTFOLHABENEF = :IDHSTFOLHABENEF'
      'AND HST.IDRESPONSAVEL = :IDRESPONSAVEL'
      'AND HST.IDTITULAR = :IDTITULAR'
      'AND PD.IDPROVENTO = HST.IDRUBRICA'
      'AND RESP.IDPESSOA = HST.IDRESPONSAVEL'
      'ORDER BY HST.MES, PD.FLGDESCONTO, PD.IDPROVENTO, HST.SEQRUBRICA'
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
      ' '
      ' ')
    ValidateWithMask = True
    Left = 264
    Top = 149
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptInputOutput
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptInputOutput
      end>
  end
  object ppDetalhe: TppBDEPipeline
    DataSource = dsDetalhe
    CloseDataSource = True
    UserName = 'Detalhe'
    Left = 264
    Top = 59
    MasterDataPipelineName = 'ppPREVIA'
  end
  object dsDetalhe: TwwDataSource
    DataSet = qryDetalhe
    Left = 264
    Top = 104
  end
  object qryBancoPort: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCRICAO'
      'FROM PORTADORFORMA'
      'WHERE  CODPORTFORMA =:CODPORTFORMA'
      ' ')
    ValidateWithMask = True
    Left = 491
    Top = 57
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODPORTFORMA'
        ParamType = ptInput
      end>
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  BBF.NUMEROPROCESSO,'
      '  BBF.DATAINICIO,'
      '  BBF.DATAFINAL,'
      '  BBF.VLRINFINSS,'
      '  BBF.VALORSRB,'
      '  BBF.VALORTOTAL,'
      '  DECODE(BBF.FLGDATAPREVISTA,'
      '    0, '#39'Data Final'#39','
      '    1, '#39'Data Final Prevista'#39') AS TEXTOLABEL'
      'FROM BENEFBFCIARIO BBF, HSTBENEFBFCIARIO HBF,'
      '     BENEFPLANPREV BPV, BENEFICIO BEN'
      'WHERE'
      '      HBF.IDHSTFOLHABENEF = 1'
      '  AND HBF.IDTITULAR = 1'
      '  AND HBF.IDTITULAR = BBF.IDTITULAR'
      '  AND HBF.IDPLANOPREV = BBF.IDPLANOPREV'
      '  AND HBF.IDBENEFICIO = BBF.IDBENEFICIO'
      '  AND BBF.IDBENEFICIO = BPV.IDBENEFICIO'
      '  AND BBF.IDPLANOPREV = BPV.IDPLANOPREV'
      '  AND BBF.IDBENEFICIO = BEN.IDBENEFICIO'
      '  AND BPV.FLGREFERENCIA = 0'
      '  AND BEN.TIPOBENEFICIO < 99')
    ValidateWithMask = True
    Left = 208
    Top = 149
  end
  object dsBenef: TwwDataSource
    DataSet = qryBenef
    Left = 208
    Top = 104
  end
  object ppBenef: TppBDEPipeline
    DataSource = dsBenef
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Benef'
    Left = 208
    Top = 59
    MasterDataPipelineName = 'ppPREVIA'
    object ppBenefppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMEROPROCESSO'
      FieldName = 'NUMEROPROCESSO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppBenefppField2: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object ppBenefppField3: TppField
      FieldAlias = 'DATAFINAL'
      FieldName = 'DATAFINAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object ppBenefppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRINFINSS'
      FieldName = 'VLRINFINSS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppBenefppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORSRB'
      FieldName = 'VALORSRB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBenefppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORTOTAL'
      FieldName = 'VALORTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBenefppField7: TppField
      FieldAlias = 'TEXTOLABEL'
      FieldName = 'TEXTOLABEL'
      FieldLength = 19
      DisplayWidth = 19
      Position = 6
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.RAZAOSOCIAL FROM'
      'PESSOA P, '
      'EMPRESAPROP E '
      'WHERE  P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 490
    Top = 103
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryRubIndiv: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPREVIA
    SQL.Strings = (
      'SELECT R.DATAINICIO,'
      '       R.DATAFINAL,'
      '       R.NUMOCORRENCIAS,'
      '       R.PARCELAS,'
      '       NVL(PD.CODPROVDESC, PD.IDPROVENTO) AS CODRUBRICA,'
      '       NVL(PD.DESCRPROVDESC, PD.DESCRICAO) AS NOMERUBRICA,'
      '       R.SEQRUBRICAINDIV,'
      '       R.IDREGRACALCULO,'
      '       RG.NOMEREGRA,'
      '       R.VALORRUBRICA,'
      '       DECODE(R.FLGPERMANENTE,1,'#39'SIM'#39','#39'NÃO'#39') AS PERMANENTE,'
      '       DECODE(R.FLGPENSAOALIM,1,'#39'SIM'#39','#39'NÃO'#39') AS PENSAOALIM'
      'FROM RUBRICAINDIV R, PROVDESC PD, REGRA RG'
      'WHERE R.IDTITULAR = :IDTITULAR'
      'AND R.IDPESSOA = :IDRESPONSAVEL'
      'AND R.IDEMPRESA = 1'
      'AND R.FLGTPRUBMANUT = '#39'1'#39
      'AND PD.IDPROVENTO = R.IDRUBRICA'
      'AND R.IDREGRACALCULO = RG.IDREGRA(+)'
      'AND R.FLGDESATIVADO = 0'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 321
    Top = 149
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object dsRubIndiv: TwwDataSource
    DataSet = qryRubIndiv
    Left = 321
    Top = 104
  end
  object ppRubIndiv: TppBDEPipeline
    DataSource = dsRubIndiv
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'RubIndiv'
    Left = 321
    Top = 59
    MasterDataPipelineName = 'ppPREVIA'
  end
  object qryAcJud: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPREVIA
    SQL.Strings = (
      'SELECT DJ.IDREGRA,'
      '       RG.NOMEREGRA,'
      '       NVL(PD.CODPROVDESC, PD.IDPROVENTO) AS CODRUBRICA,'
      '       NVL(PD.DESCRPROVDESC, PD.DESCRICAO) AS NOMERUBRICA,'
      '       DECODE(PJ.FLGFAZDEPOSITO,1,'#39'SIM'#39','#39'NÃO'#39') AS FAZDEPOSITO,'
      '       DECODE(PJ.SITPROCESSO,0,'#39'Ação Judicial em Liminar'#39','
      '                             1,'#39'Ação Judicial Julgada Ganha'#39','
      
        '                             2,'#39'Ação Judicial Julgada Perdida'#39') ' +
        'AS SITUACAO'
      'FROM PROCJUD PJ, DETPROCJUD DJ, REGRA RG, PROVDESC PD'
      'WHERE PJ.IDPESSOA = :IDRESPONSAVEL'
      'AND PJ.IDPROCJUD = DJ.IDPROCJUD'
      'AND DJ.IDREGRA = RG.IDREGRA(+)'
      'AND DJ.IDRUBRICA = PD.IDPROVENTO(+)'
      'AND DJ.FLGATIVA = 0'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 376
    Top = 149
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object dsAcJud: TwwDataSource
    DataSet = qryAcJud
    Left = 376
    Top = 104
  end
  object ppAcJud: TppBDEPipeline
    DataSource = dsAcJud
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'AcJud'
    Left = 376
    Top = 59
    MasterDataPipelineName = 'ppPREVIA'
    object ppAcJudppField1: TppField
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppAcJudppField2: TppField
      FieldAlias = 'NOMEREGRA'
      FieldName = 'NOMEREGRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppAcJudppField3: TppField
      FieldAlias = 'CODRUBRICA'
      FieldName = 'CODRUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppAcJudppField4: TppField
      FieldAlias = 'NOMERUBRICA'
      FieldName = 'NOMERUBRICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppAcJudppField5: TppField
      FieldAlias = 'FAZDEPOSITO'
      FieldName = 'FAZDEPOSITO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppAcJudppField6: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object qryMatricBenef: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsPREVIA
    SQL.Strings = (
      'SELECT DISTINCT'
      '  D.MATRICULA,'
      '  P.NOME'
      ''
      'FROM'
      '  HISTRUBSAL H,'
      '  PESSOA P,'
      '  DEPENTIT D'
      ''
      'WHERE'
      '  H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF   AND'
      '  H.IDPESSOA        = :IDRESPONSAVEL     AND'
      '  H.IDPESSOA        = D.IDPESSOA         AND'
      '  H.IDPESSOA        = P.IDPESSOA         AND'
      '  H.FLGTIPODESC     = '#39'B'#39
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
      ' ')
    ValidateWithMask = True
    Left = 432
    Top = 149
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object dsMatricBenef: TwwDataSource
    DataSet = qryMatricBenef
    Left = 432
    Top = 104
  end
  object ppMatricBenef: TppBDEPipeline
    DataSource = dsMatricBenef
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'MatricBenef'
    Left = 432
    Top = 59
    MasterDataPipelineName = 'ppPREVIA'
  end
end
