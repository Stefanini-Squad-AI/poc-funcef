inherited DmRelRFMapaMensal: TDmRelRFMapaMensal
  Left = 408
  Top = 229
  Width = 283
  Height = 213
  Caption = 'DmRelRFMapaMensal'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 45
    Top = 8
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
    Left = 39
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 26
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 34
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplMapaMensalRF: TppBDEPipeline
    DataSource = dsMapaMensalRF
    UserName = 'pplMapaMensalRF'
    Left = 293
    Top = 88
    object pplMapaMensalRFppField1: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplMapaMensalRFppField2: TppField
      FieldAlias = 'CLASSE'
      FieldName = 'CLASSE'
      FieldLength = 30
      DisplayWidth = 30
      Position = 1
    end
    object pplMapaMensalRFppField3: TppField
      FieldAlias = 'INVESTIMENTO'
      FieldName = 'INVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplMapaMensalRFppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplMapaMensalRFppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORAPLICADO'
      FieldName = 'VALORAPLICADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplMapaMensalRFppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplMapaMensalRFppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplMapaMensalRFppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'CORRECAO'
      FieldName = 'CORRECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplMapaMensalRFppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'JUROS'
      FieldName = 'JUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplMapaMensalRFppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPROVPERDA'
      FieldName = 'VLRPROVPERDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplMapaMensalRFppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'AGIODESAGIO'
      FieldName = 'AGIODESAGIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplMapaMensalRFppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOF'
      FieldName = 'VLRIOF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplMapaMensalRFppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'RESGATES'
      FieldName = 'RESGATES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplMapaMensalRFppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'LUCPREJ'
      FieldName = 'LUCPREJ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplMapaMensalRFppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'APLICACOES'
      FieldName = 'APLICACOES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplMapaMensalRFppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'PAGTOJUR'
      FieldName = 'PAGTOJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplMapaMensalRFppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'TRCPLANO'
      FieldName = 'TRCPLANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplMapaMensalRFppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplMapaMensalRFppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRINCIPAL'
      FieldName = 'PRINCIPAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplMapaMensalRFppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIF'
      FieldName = 'DIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplMapaMensalRFppField21: TppField
      FieldAlias = 'CAMPO25'
      FieldName = 'CAMPO25'
      FieldLength = 100
      DisplayWidth = 100
      Position = 20
    end
    object pplMapaMensalRFppField22: TppField
      FieldAlias = 'SEGMENTACAO'
      FieldName = 'SEGMENTACAO'
      FieldLength = 100
      DisplayWidth = 100
      Position = 21
    end
  end
  object dsMapaMensalRF: TwwDataSource
    AutoEdit = False
    DataSet = qryMapaMensalRF
    Left = 135
    Top = 64
  end
  object qryMapaMensalRF: TwwQuery
    Active = True
    AfterScroll = qryMapaMensalRFAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'SUM(TO_NUMBER(CAMPO21)) PRINCIPAL'
      ',CAMPO3 PLANPRVCONTABPATRO'
      ',CAMPO4 CLASSE'
      ',CAMPO5 INVESTIMENTO'
      ',IDPLANPREVCTBPATR IDPLANPREVCTBPATR'
      ',IDINVESTIMENTO'
      ',campo25'
      ',SUM(TO_NUMBER(CAMPO10)) VALORAPLICADO'
      ',SUM(TO_NUMBER(CAMPO11)) SALDOANTERIOR'
      ',SUM(TO_NUMBER(CAMPO12)) SALDO'
      ',SUM(TO_NUMBER(CAMPO13)) CORRECAO'
      ',SUM(TO_NUMBER(CAMPO14)) JUROS'
      ',SUM(TO_NUMBER(CAMPO15)) VLRPROVPERDA'
      ',SUM(TO_NUMBER(CAMPO16)) AGIODESAGIO'
      ',SUM(TO_NUMBER(CAMPO17)) VLRIOF'
      ',SUM(TO_NUMBER(CAMPO18)) RESGATES'
      ',SUM(TO_NUMBER(CAMPO19)) LUCPREJ'
      ',SUM(TO_NUMBER(CAMPO20)) APLICACOES'
      ',SUM(TO_NUMBER(CAMPO22)) PAGTOJUR'
      ',SUM(TO_NUMBER(CAMPO23)) TRCPLANO'
      ',SUM(TO_NUMBER(CAMPO24)) DIF'
      ',CAMPO27 SEGMENTACAO'
      ' FROM INVESTIMENTOGLOBAL'
      'WHERE IDCHAVETEMP = '#39'MAPARF'#39
      
        'GROUP BY CAMPO3,CAMPO4,CAMPO5,IDPLANPREVCTBPATR,IDINVESTIMENTO,c' +
        'ampo25, CAMPO27'
      'ORDER BY CAMPO3, CAMPO4, CAMPO5'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 72
    object qryMapaMensalRFPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 136
    end
    object qryMapaMensalRFCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 30
    end
    object qryMapaMensalRFINVESTIMENTO: TStringField
      FieldName = 'INVESTIMENTO'
      Size = 60
    end
    object qryMapaMensalRFIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryMapaMensalRFVALORAPLICADO: TFloatField
      FieldName = 'VALORAPLICADO'
    end
    object qryMapaMensalRFSALDOANTERIOR: TFloatField
      FieldName = 'SALDOANTERIOR'
    end
    object qryMapaMensalRFSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qryMapaMensalRFCORRECAO: TFloatField
      FieldName = 'CORRECAO'
    end
    object qryMapaMensalRFJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object qryMapaMensalRFVLRPROVPERDA: TFloatField
      FieldName = 'VLRPROVPERDA'
    end
    object qryMapaMensalRFAGIODESAGIO: TFloatField
      FieldName = 'AGIODESAGIO'
    end
    object qryMapaMensalRFVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object qryMapaMensalRFRESGATES: TFloatField
      FieldName = 'RESGATES'
    end
    object qryMapaMensalRFLUCPREJ: TFloatField
      FieldName = 'LUCPREJ'
    end
    object qryMapaMensalRFAPLICACOES: TFloatField
      FieldName = 'APLICACOES'
    end
    object qryMapaMensalRFPAGTOJUR: TFloatField
      FieldName = 'PAGTOJUR'
    end
    object qryMapaMensalRFTRCPLANO: TFloatField
      FieldName = 'TRCPLANO'
    end
    object qryMapaMensalRFIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryMapaMensalRFPRINCIPAL: TFloatField
      FieldName = 'PRINCIPAL'
    end
    object qryMapaMensalRFDIF: TFloatField
      FieldName = 'DIF'
    end
    object qryMapaMensalRFCAMPO25: TStringField
      FieldName = 'CAMPO25'
      Size = 100
    end
    object qryMapaMensalRFSEGMENTACAO: TStringField
      FieldName = 'SEGMENTACAO'
      Size = 100
    end
  end
  object rptMapaMensalRF: TppReport
    AutoStop = False
    DataPipeline = pplMapaMensalRF
    OnStartPage = rptMapaMensalRFStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Mapa de Investimentos'
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
    Left = 178
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplMapaMensalRF'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Mapa de Movimentação em Renda Fixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 66146
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
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
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 8731
        mmLeft = 0
        mmTop = 18521
        mmWidth = 284300
        BandType = 0
      end
      object lblInvestimento: TppLabel
        UserName = 'lblInvestimento'
        Caption = 'Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 1323
        mmTop = 19579
        mmWidth = 15346
        BandType = 0
      end
      object lblVlrAplic: TppLabel
        UserName = 'lblVlrAplic'
        Caption = 'Valor Aplicado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 98425
        mmTop = 19579
        mmWidth = 16933
        BandType = 0
      end
      object lblJuros: TppLabel
        UserName = 'lblJuros'
        Caption = 'Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 180975
        mmTop = 19579
        mmWidth = 6615
        BandType = 0
      end
      object lblCorrecao: TppLabel
        UserName = 'Label101'
        Caption = 'Correção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 176742
        mmTop = 23548
        mmWidth = 10848
        BandType = 0
      end
      object lblAgioDesagio: TppLabel
        UserName = 'lblAgioDesagio'
        Caption = 'Agio/Deságio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 196057
        mmTop = 23548
        mmWidth = 15610
        BandType = 0
      end
      object lblResgates: TppLabel
        UserName = 'lblResgates'
        Caption = 'Resgates/Recbtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2921
        mmLeft = 214620
        mmTop = 19579
        mmWidth = 21124
        BandType = 0
      end
      object lblSaldo: TppLabel
        UserName = 'lblSaldo'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 277019
        mmTop = 19579
        mmWidth = 6615
        BandType = 0
      end
      object lblSaldoAnt: TppLabel
        UserName = 'lblSaldoAnt'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 123031
        mmTop = 19579
        mmWidth = 16669
        BandType = 0
      end
      object lblProvPerda: TppLabel
        UserName = 'lblProvPerda'
        Caption = 'Prov. Perda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 197909
        mmTop = 19579
        mmWidth = 13758
        BandType = 0
      end
      object lblIOF: TppLabel
        UserName = 'lblIOF'
        Caption = 'IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 159544
        mmTop = 23283
        mmWidth = 3969
        BandType = 0
      end
      object lblAplicacao: TppLabel
        UserName = 'lblAplicacao'
        Caption = 'Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 152136
        mmTop = 19579
        mmWidth = 11377
        BandType = 0
      end
      object lblPagtoJuros: TppLabel
        UserName = 'lblPagtoJuros'
        Caption = 'Pagto. Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 244740
        mmTop = 19579
        mmWidth = 14817
        BandType = 0
      end
      object lblLucPrej: TppLabel
        UserName = 'lblLucPrej'
        Caption = 'Lucro / Prejuízo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 217223
        mmTop = 23548
        mmWidth = 18521
        BandType = 0
      end
      object pplTrcPlano: TppLabel
        UserName = 'lblPagtoJuros1'
        Caption = 'Transf. Planos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 242888
        mmTop = 23548
        mmWidth = 16933
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplMapaMensalRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 3703
        mmLeft = 191823
        mmTop = 14023
        mmWidth = 89959
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CAMPO25'
        DataPipeline = pplMapaMensalRF
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 3704
        mmLeft = 24342
        mmTop = 14023
        mmWidth = 66675
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        DrillDownComponent = ppdbDescInvestimento
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplMapaMensalRFAnalitico'
        mmHeight = 8466
        mmLeft = 0
        mmTop = 8202
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplMapaMensalRFAnalitico
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Mapa de Investimentos'
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
          Left = 136
          Top = 72
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplMapaMensalRFAnalitico'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 8731
            mmPrintPosition = 0
            object ppShape2: TppShape
              UserName = 'shpCabecalho2'
              Brush.Color = clSilver
              mmHeight = 8731
              mmLeft = 58208
              mmTop = 0
              mmWidth = 226219
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'lblDtAplic1'
              Caption = 'Dt. Aplic.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 62971
              mmTop = 1058
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'Dt. Vencto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 78581
              mmTop = 1058
              mmWidth = 12171
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Valor Aplicado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 98161
              mmTop = 1058
              mmWidth = 16933
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'Saldo Anterior'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 122767
              mmTop = 1058
              mmWidth = 16669
              BandType = 1
            end
            object ppLabel20: TppLabel
              UserName = 'pplblAplicacao1'
              Caption = 'Aplicação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 151871
              mmTop = 1058
              mmWidth = 11377
              BandType = 1
            end
            object ppLabel21: TppLabel
              UserName = 'pplblIOF1'
              Caption = 'IOF'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 159279
              mmTop = 5027
              mmWidth = 3969
              BandType = 1
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'Correção'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 176213
              mmTop = 4763
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label102'
              Caption = 'Juros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 180446
              mmTop = 1059
              mmWidth = 6615
              BandType = 1
            end
            object ppLabel24: TppLabel
              UserName = 'Label24'
              Caption = 'Agio/Deságio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 195527
              mmTop = 5027
              mmWidth = 15610
              BandType = 1
            end
            object ppLabel25: TppLabel
              UserName = 'pplProvPerda1'
              Caption = 'Prov. Perda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 197380
              mmTop = 1058
              mmWidth = 13758
              BandType = 1
            end
            object ppLabel26: TppLabel
              UserName = 'pplblLucPrej1'
              Caption = 'Lucro / Prejuízo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 216959
              mmTop = 5027
              mmWidth = 18256
              BandType = 1
            end
            object ppLabel27: TppLabel
              UserName = 'Label27'
              Caption = 'Resgates/Recbtos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2921
              mmLeft = 214091
              mmTop = 1058
              mmWidth = 21124
              BandType = 1
            end
            object ppLabel28: TppLabel
              UserName = 'pplblPagtoJuros1'
              Caption = 'Pagto. Juros'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 244475
              mmTop = 1058
              mmWidth = 14817
              BandType = 1
            end
            object ppLabel29: TppLabel
              UserName = 'Label29'
              Caption = 'Saldo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 276226
              mmTop = 1058
              mmWidth = 6615
              BandType = 1
            end
            object pplTransfPlanoAnal: TppLabel
              UserName = 'lTransfPlanoAnal'
              Caption = 'Transf. Plano'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 243946
              mmTop = 5027
              mmWidth = 15346
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 8996
            mmPrintPosition = 0
            object shpDetalhe1: TppShape
              OnPrint = shpDetalhePrint
              UserName = 'shpDetalhe1'
              Pen.Style = psClear
              mmHeight = 9260
              mmLeft = 58207
              mmTop = 0
              mmWidth = 226218
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              DataField = 'VENCIMENTO'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 75936
              mmTop = 1058
              mmWidth = 15081
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'DATAOPERACAO'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 59796
              mmTop = 1058
              mmWidth = 15081
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'VALORAPLICADO'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 92075
              mmTop = 1058
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'SALDOANTERIOR'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 116152
              mmTop = 1058
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'APLICACOES'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 140229
              mmTop = 1058
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'VLRIOF'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 140229
              mmTop = 5292
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'CORRECAO'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 164042
              mmTop = 5292
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'JUROS'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 164042
              mmTop = 1058
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'AGIODESAGIO'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 188119
              mmTop = 5292
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'dbProvPerda1'
              DataField = 'VLRPROVPERDA'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 188119
              mmTop = 1058
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              DataField = 'LUCPREJ'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 212196
              mmTop = 5292
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              DataField = 'RESGATES'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 212196
              mmTop = 1058
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              DataField = 'PAGTOJUR'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 236273
              mmTop = 1058
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText102'
              DataField = 'SALDO'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 260351
              mmTop = 1058
              mmWidth = 23019
              BandType = 4
            end
            object ppdbTrcPlanoAnal: TppDBText
              UserName = 'dbTrcPlanoAnal'
              DataField = 'TRCPLANO'
              DataPipeline = pplMapaMensalRFAnalitico
              DisplayFormat = '###,###,###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplMapaMensalRFAnalitico'
              mmHeight = 2910
              mmLeft = 236274
              mmTop = 5291
              mmWidth = 23019
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 1588
            mmPrintPosition = 0
            object ppLine3: TppLine
              UserName = 'Line3'
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 58473
              mmTop = 0
              mmWidth = 226218
              BandType = 7
            end
          end
        end
      end
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 7938
        mmLeft = 0
        mmTop = 264
        mmWidth = 284300
        BandType = 4
      end
      object ppdbDescInvestimento: TppDBText
        UserName = 'dbDescInvestimento'
        DataField = 'INVESTIMENTO'
        DataPipeline = pplMapaMensalRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 1323
        mmTop = 529
        mmWidth = 89959
        BandType = 4
      end
      object ppdbVlrAplic: TppDBText
        UserName = 'ppdbVlrAplic'
        DataField = 'VALORAPLICADO'
        DataPipeline = pplMapaMensalRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 92604
        mmTop = 529
        mmWidth = 23019
        BandType = 4
      end
      object ppdbVlrJuros: TppDBText
        UserName = 'ppdbVlrJuros'
        DataField = 'JUROS'
        DataPipeline = pplMapaMensalRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 529
        mmWidth = 23020
        BandType = 4
      end
      object pdbVlrCorrecao: TppDBText
        UserName = 'pdbVlrCorrecao'
        DataField = 'CORRECAO'
        DataPipeline = pplMapaMensalRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 4763
        mmWidth = 23019
        BandType = 4
      end
      object ppdbAgioDesagio: TppDBText
        UserName = 'ppdbAgioDesagio'
        DataField = 'AGIODESAGIO'
        DataPipeline = pplMapaMensalRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 188913
        mmTop = 4763
        mmWidth = 23019
        BandType = 4
      end
      object ppdbResgates: TppDBText
        UserName = 'ppdbResgates'
        DataField = 'RESGATES'
        DataPipeline = pplMapaMensalRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 212990
        mmTop = 529
        mmWidth = 23019
        BandType = 4
      end
      object ppdbSaldoAtu: TppDBText
        UserName = 'ppdbSaldoAtu'
        DataField = 'SALDO'
        DataPipeline = pplMapaMensalRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 261144
        mmTop = 529
        mmWidth = 23019
        BandType = 4
      end
      object ppdbSaldoAnt: TppDBText
        UserName = 'ppdbSaldoAnt'
        DataField = 'SALDOANTERIOR'
        DataPipeline = pplMapaMensalRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 116681
        mmTop = 529
        mmWidth = 23020
        BandType = 4
      end
      object ppdbProvPerda: TppDBText
        UserName = 'ppdbProvPerda'
        DataField = 'VLRPROVPERDA'
        DataPipeline = pplMapaMensalRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 188913
        mmTop = 529
        mmWidth = 23019
        BandType = 4
      end
      object ppdbAplicacoes: TppDBText
        UserName = 'ppdbAplicacoes'
        DataField = 'APLICACOES'
        DataPipeline = pplMapaMensalRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 140759
        mmTop = 529
        mmWidth = 23019
        BandType = 4
      end
      object ppdbVlrIOF: TppDBText
        UserName = 'ppdbVlrIOF'
        DataField = 'VLRIOF'
        DataPipeline = pplMapaMensalRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 140759
        mmTop = 4763
        mmWidth = 23019
        BandType = 4
      end
      object ppdbPagtoJur: TppDBText
        UserName = 'ppdbPagtoJur'
        DataField = 'PAGTOJUR'
        DataPipeline = pplMapaMensalRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 237067
        mmTop = 529
        mmWidth = 23019
        BandType = 4
      end
      object ppdbLucPrej: TppDBText
        UserName = 'ppdbLucPrej'
        DataField = 'LUCPREJ'
        DataPipeline = pplMapaMensalRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 212990
        mmTop = 4763
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'ppdbPagtoJur1'
        DataField = 'TRCPLANO'
        DataPipeline = pplMapaMensalRF
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplMapaMensalRF'
        mmHeight = 2910
        mmLeft = 237066
        mmTop = 4763
        mmWidth = 23019
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 1852
        mmWidth = 283369
        BandType = 8
      end
      object ppLabel5: TppLabel
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
        mmTop = 1852
        mmWidth = 283369
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 284300
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
        mmLeft = 257440
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplMapaMensalRF
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplMapaMensalRF'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'SEGMENTACAO'
      DataPipeline = pplMapaMensalRF
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplMapaMensalRF'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppDBText65: TppDBText
          UserName = 'ppdbDescPlano'
          DataField = 'SEGMENTACAO'
          DataPipeline = pplMapaMensalRF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1058
          mmWidth = 78846
          BandType = 3
          GroupNo = 1
        end
        object ppLine8: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLine9: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6350
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'CLASSE'
      DataPipeline = pplMapaMensalRF
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplMapaMensalRF'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object shpCabClasse: TppShape
          UserName = 'shpCabClasse'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object lblDescClasse: TppLabel
          UserName = 'lblDescClasse'
          Caption = 'Classe :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 1852
          mmTop = 529
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'CLASSE'
          DataPipeline = pplMapaMensalRF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 3175
          mmLeft = 13758
          mmTop = 529
          mmWidth = 113771
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object lblTotClasse: TppLabel
          UserName = 'lblTotClasse'
          Caption = 'Total da Classe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 5821
          mmTop = 1058
          mmWidth = 20638
          BandType = 5
          GroupNo = 1
        end
        object ppShape1: TppShape
          UserName = 'shpCabecalho1'
          mmHeight = 9260
          mmLeft = 4763
          mmTop = 0
          mmWidth = 279665
          BandType = 5
          GroupNo = 1
        end
        object ppdbSumSldAnt: TppDBCalc
          UserName = 'ppdbSumSldAnt'
          DataField = 'SALDOANTERIOR'
          DataPipeline = pplMapaMensalRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 2910
          mmLeft = 116681
          mmTop = 1058
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppdbSumVlrIOF: TppDBCalc
          UserName = 'ppdbSumVlrIOF'
          DataField = 'VLRIOF'
          DataPipeline = pplMapaMensalRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 2910
          mmLeft = 140759
          mmTop = 5292
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppdbSumAplicacoes: TppDBCalc
          UserName = 'ppdbSumAplicacoes'
          DataField = 'APLICACOES'
          DataPipeline = pplMapaMensalRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 2910
          mmLeft = 140759
          mmTop = 1058
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppdbSumVlrJuros: TppDBCalc
          UserName = 'ppdbSumVlrJuros'
          DataField = 'JUROS'
          DataPipeline = pplMapaMensalRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 2910
          mmLeft = 164836
          mmTop = 1058
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppdbSumVlrCorrecao: TppDBCalc
          UserName = 'ppdbSumVlrCorrecao'
          DataField = 'CORRECAO'
          DataPipeline = pplMapaMensalRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 2910
          mmLeft = 164836
          mmTop = 5292
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppdbSumAgioDesagio: TppDBCalc
          UserName = 'ppdbSumAgioDesagio'
          DataField = 'AGIODESAGIO'
          DataPipeline = pplMapaMensalRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 2910
          mmLeft = 189177
          mmTop = 5292
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppdbSumProvPerda: TppDBCalc
          UserName = 'ppdbSumProvPerda'
          DataField = 'VLRPROVPERDA'
          DataPipeline = pplMapaMensalRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 2910
          mmLeft = 189177
          mmTop = 1058
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppdbSumResgates: TppDBCalc
          UserName = 'ppdbSumResgates'
          DataField = 'RESGATES'
          DataPipeline = pplMapaMensalRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 2910
          mmLeft = 212990
          mmTop = 1058
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppdbSumLucPrej: TppDBCalc
          UserName = 'ppdbSumLucPrej'
          DataField = 'LUCPREJ'
          DataPipeline = pplMapaMensalRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 2910
          mmLeft = 212990
          mmTop = 5292
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'ppdbSumPagtoJuros1'
          DataField = 'TRCPLANO'
          DataPipeline = pplMapaMensalRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 2910
          mmLeft = 237067
          mmTop = 5292
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppdbSumPagtoJuros: TppDBCalc
          UserName = 'ppdbSumPagtoJuros'
          DataField = 'PAGTOJUR'
          DataPipeline = pplMapaMensalRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 2910
          mmLeft = 237067
          mmTop = 1058
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppdbSumSaldoAtu: TppDBCalc
          UserName = 'ppdbSumSaldoAtu'
          DataField = 'SALDO'
          DataPipeline = pplMapaMensalRF
          DisplayFormat = '###,###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplMapaMensalRF'
          mmHeight = 2910
          mmLeft = 261144
          mmTop = 1058
          mmWidth = 23019
          BandType = 5
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 4763
          mmTop = 9525
          mmWidth = 279665
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryMapaMensalRFAnalitico: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      'SELECT'
      'IDCHAVETEMP'
      ',CAMPO3 PLANPRVCONTABPATRO'
      ',CAMPO4 CLASSE'
      ',CAMPO5 INVESTIMENTO'
      ',TO_DATE(CAMPO6,'#39'DD/MM/YYYY'#39') DATAOPERACAO'
      ',TO_DATE(CAMPO7,'#39'DD/MM/YYYY'#39') VENCIMENTO'
      ',TO_NUMBER(CAMPO8) IDOPERRENFIXAPLIC'
      ',IDINVESTIMENTO IDINVESTIMENTO'
      ',TO_NUMBER(CAMPO9) IDOPERRENFIX'
      ',TO_NUMBER(IDPLANPREVCTBPATR) IDPLANPREVCTBPATR'
      ',TO_NUMBER(CAMPO10) VALORAPLICADO'
      ',TO_NUMBER(CAMPO11) SALDOANTERIOR'
      ',TO_NUMBER(CAMPO12) SALDO'
      ',TO_NUMBER(CAMPO13) CORRECAO'
      ',TO_NUMBER(CAMPO14) JUROS'
      ',TO_NUMBER(CAMPO15) VLRPROVPERDA'
      ',TO_NUMBER(CAMPO16) AGIODESAGIO'
      ',TO_NUMBER(CAMPO17) VLRIOF'
      ',TO_NUMBER(CAMPO18) RESGATES'
      ',TO_NUMBER(CAMPO19) LUCPREJ'
      ',TO_NUMBER(CAMPO20) APLICACOES'
      ',TO_NUMBER(CAMPO21) PRINCIPAL'
      ',TO_NUMBER(CAMPO22) PAGTOJUR'
      ',TO_NUMBER(CAMPO23) TRCPLANO'
      ',TO_NUMBER(CAMPO24) DIF'
      ',CAMPO27 SEGMENTACAO'
      ' FROM INVESTIMENTOGLOBAL'
      'WHERE IDCHAVETEMP = '#39'MAPARF'#39
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 125
    object qryMapaMensalRFAnaliticoPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 136
    end
    object qryMapaMensalRFAnaliticoCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 30
    end
    object qryMapaMensalRFAnaliticoINVESTIMENTO: TStringField
      FieldName = 'INVESTIMENTO'
      Size = 60
    end
    object qryMapaMensalRFAnaliticoDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryMapaMensalRFAnaliticoVENCIMENTO: TDateTimeField
      FieldName = 'VENCIMENTO'
    end
    object qryMapaMensalRFAnaliticoIDOPERRENFIX: TFloatField
      FieldName = 'IDOPERRENFIX'
    end
    object qryMapaMensalRFAnaliticoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryMapaMensalRFAnaliticoIDOPERRENFIXAPLIC: TFloatField
      FieldName = 'IDOPERRENFIXAPLIC'
    end
    object qryMapaMensalRFAnaliticoIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryMapaMensalRFAnaliticoVALORAPLICADO: TFloatField
      FieldName = 'VALORAPLICADO'
    end
    object qryMapaMensalRFAnaliticoSALDOANTERIOR: TFloatField
      FieldName = 'SALDOANTERIOR'
    end
    object qryMapaMensalRFAnaliticoSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qryMapaMensalRFAnaliticoCORRECAO: TFloatField
      FieldName = 'CORRECAO'
    end
    object qryMapaMensalRFAnaliticoJUROS: TFloatField
      FieldName = 'JUROS'
    end
    object qryMapaMensalRFAnaliticoVLRPROVPERDA: TFloatField
      FieldName = 'VLRPROVPERDA'
    end
    object qryMapaMensalRFAnaliticoAGIODESAGIO: TFloatField
      FieldName = 'AGIODESAGIO'
    end
    object qryMapaMensalRFAnaliticoVLRIOF: TFloatField
      FieldName = 'VLRIOF'
    end
    object qryMapaMensalRFAnaliticoRESGATES: TFloatField
      FieldName = 'RESGATES'
    end
    object qryMapaMensalRFAnaliticoLUCPREJ: TFloatField
      FieldName = 'LUCPREJ'
    end
    object qryMapaMensalRFAnaliticoAPLICACOES: TFloatField
      FieldName = 'APLICACOES'
    end
    object qryMapaMensalRFAnaliticoPAGTOJUR: TFloatField
      FieldName = 'PAGTOJUR'
    end
    object qryMapaMensalRFAnaliticoTRCPLANO: TFloatField
      FieldName = 'TRCPLANO'
    end
    object qryMapaMensalRFAnaliticoDIF: TFloatField
      FieldName = 'DIF'
    end
    object qryMapaMensalRFAnaliticoPRINCIPAL: TFloatField
      FieldName = 'PRINCIPAL'
    end
    object qryMapaMensalRFAnaliticoSEGMENTACAO: TStringField
      FieldName = 'SEGMENTACAO'
      Size = 100
    end
  end
  object dsMapaMensalRFAnalitico: TwwDataSource
    AutoEdit = False
    DataSet = qryMapaMensalRFAnalitico
    Left = 135
    Top = 112
  end
  object pplMapaMensalRFAnalitico: TppBDEPipeline
    DataSource = dsMapaMensalRFAnalitico
    UserName = 'pplMapaMensalRFAnalitico'
    Left = 224
    Top = 112
  end
end
