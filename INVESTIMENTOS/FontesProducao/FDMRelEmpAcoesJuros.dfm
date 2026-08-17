inherited DmRelEmpAcoesJuros: TDmRelEmpAcoesJuros
  Left = 394
  Top = 174
  Width = 375
  Height = 379
  Caption = 'DmRelEmpAcoesJurosAn'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  inherited rpExemplo: TppReport
    Left = 248
    Top = 20
    DataPipelineName = 'pplExemplo'
  end
  object pplEmpAcoesJurosAn: TppBDEPipeline
    DataSource = dsJurosAn
    UserName = 'lExemplo1'
    Left = 253
    Top = 96
  end
  object dsJurosAn: TwwDataSource
    DataSet = QryJurosAn
    Left = 121
    Top = 246
  end
  object QryJurosAn: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT PL.PLANPRVCONTABPATRO,'
      '       HS.DATAHISTEMPACOES,'
      '       IV.DESCINVESTIMENTO,'
      '       HS.NUMCONTRATOCUSTODIA,'
      '       HS.IDTIPOOPERACAO,'
      '       OP.DATAOPERACAO,'
      '       OP.DATAVENCOPER,'
      '       AB.SIGLAACAOBOLSA,'
      '       HS.QTDHISTEMPACOES,'
      '       OP.PUOPERACAO,'
      '       HS.VLRHISTEMPACOES,'
      '       OP.TAXAOPERACAO,'
      '       HS.VLRJUROSIMPORTA'
      '  FROM HISTEMPACOES      HS,'
      '       OPEREMPACOES      OP,'
      '       CARTEIRAINVEST    CA,'
      '       INVESTIMENTO      IV,'
      '       VWPLANPREVCTBPATR PL,'
      '       ACOESXBOLSA       AB'
      
        ' WHERE(HS.DATAHISTEMPACOES BETWEEN TO_DATE(:DATAINI, '#39'DD/MM/YYYY' +
        #39') AND TO_DATE(:DATAFIM, '#39'DD/MM/YYYY'#39'))'
      
        '   AND ((:IDINVESTIMENTO IS NULL) OR (HS.IDINVESTIMENTO =:IDINVE' +
        'STIMENTO))'
      
        '   AND ((:IDPLANPREVCTBPATR IS NULL) OR (HS.IDPLANPREVCTBPATR =:' +
        'IDPLANPREVCTBPATR))'
      '   AND (HS.IDTIPOOPERACAO IN (-54, -10054))'
      
        '   AND (HS.TIPOMOVIMENTO = 5) AND (OP.TIPOMOVIMENTO IN (1,4,7,8)' +
        ')'
      '   AND (HS.IDPLANPREVCTBPATR(+) = OP.IDPLANPREVCTBPATR)'
      '   AND (HS.NUMCONTRATOCUSTODIA = OP.NUMCONTRATOCUSTODIA)'
      '   AND (HS.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '   AND (HS.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST)'
      '   AND (HS.IDPLANPREVCTBPATR = PL.IDPLANPREVCTBPATR)'
      '   AND (HS.IDINVESTIMENTO = AB.IDACAO)'
      ' ORDER BY PL.PLANPRVCONTABPATRO,'
      '          HS.DATAHISTEMPACOES,'
      '          HS.NUMCONTRATOCUSTODIA,'
      '          IV.DESCINVESTIMENTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
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
    Left = 112
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end>
    object QryJurosAnPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 38
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryJurosAnNUMCONTRATOCUSTODIA: TStringField
      DisplayLabel = 'N. Contrato'
      DisplayWidth = 20
      FieldName = 'NUMCONTRATOCUSTODIA'
      FixedChar = True
    end
    object QryJurosAnDATAHISTEMPACOES: TDateTimeField
      DisplayLabel = 'Data Operação'
      DisplayWidth = 18
      FieldName = 'DATAHISTEMPACOES'
    end
    object QryJurosAnDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Data Vencimento'
      DisplayWidth = 15
      FieldName = 'DATAVENCOPER'
    end
    object QryJurosAnSIGLAACAOBOLSA: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 15
      FieldName = 'SIGLAACAOBOLSA'
      Size = 10
    end
    object QryJurosAnQTDHISTEMPACOES: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 10
      FieldName = 'QTDHISTEMPACOES'
    end
    object QryJurosAnPUOPERACAO: TFloatField
      DisplayLabel = 'PU'
      DisplayWidth = 14
      FieldName = 'PUOPERACAO'
      DisplayFormat = '###,##0.00'
    end
    object QryJurosAnVLRHISTEMPACOES: TFloatField
      DisplayLabel = 'Valor Operação'
      DisplayWidth = 13
      FieldName = 'VLRHISTEMPACOES'
    end
    object QryJurosAnTAXAOPERACAO: TFloatField
      DisplayLabel = 'Taxa'
      DisplayWidth = 10
      FieldName = 'TAXAOPERACAO'
      DisplayFormat = '###,##0.00'
    end
    object QryJurosAnVLRJUROSIMPORTA: TFloatField
      DisplayLabel = 'Valor Juros'
      DisplayWidth = 12
      FieldName = 'VLRJUROSIMPORTA'
      DisplayFormat = '###,##0.00'
    end
    object QryJurosAnDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data Operação'
      DisplayWidth = 15
      FieldName = 'DATAOPERACAO'
      Visible = False
    end
    object QryJurosAnIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
  end
  object QryJurosSi: TwwQuery
    AfterScroll = QryJurosSiAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PL.PLANPRVCONTABPATRO,'
      '       HS.DATAHISTEMPACOES,'
      '       '#39'Juros Provisionados'#39' AS DESCJUROS,'
      '       NVL(SUM( HS.VLRJUROSIMPORTA),0) AS VLRJUROSIMPORTA'
      ' FROM HISTEMPACOES  HS,'
      '      VWPLANPREVCTBPATR PL'
      
        ' WHERE (HS.DATAHISTEMPACOES BETWEEN TO_DATE(:DATAINI, '#39'DD/MM/YYY' +
        'Y'#39') AND TO_DATE(:DATAFIM, '#39'DD/MM/YYYY'#39'))'
      
        '   AND ((:IDINVESTIMENTO IS NULL) OR (HS.IDINVESTIMENTO =:IDINVE' +
        'STIMENTO))'
      
        '   AND ((:IDPLANPREVCTBPATR IS NULL) OR (HS.IDPLANPREVCTBPATR =:' +
        'IDPLANPREVCTBPATR))'
      '   AND (HS.IDTIPOOPERACAO IN (-54, -10054))'
      '--   AND (HS.TIPOMOVIMENTO = 5)'
      '   AND (HS.IDPLANPREVCTBPATR = PL.IDPLANPREVCTBPATR)'
      ' GROUP BY PL.PLANPRVCONTABPATRO,'
      '          HS.DATAHISTEMPACOES,'
      '          '#39'Juros Provisionados'#39
      ''
      ''
      ''
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
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 160
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end>
    object QryJurosSiPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryJurosSiDATAHISTEMPACOES: TDateTimeField
      FieldName = 'DATAHISTEMPACOES'
    end
    object QryJurosSiDESCJUROS: TStringField
      FieldName = 'DESCJUROS'
      FixedChar = True
      Size = 19
    end
    object QryJurosSiVLRJUROSIMPORTA: TFloatField
      FieldName = 'VLRJUROSIMPORTA'
      DisplayFormat = '###,##0.00'
    end
  end
  object rptEmpAcoesJuros: TppReport
    AutoStop = False
    DataPipeline = pplEmpAcoesJurosSi
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Juros Provisionados'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptEmpAcoesJurosBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 46
    Top = 88
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplEmpAcoesJurosSi'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24077
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'Label3'
        Caption = 'Juros Provisionados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4657
        mmLeft = 25400
        mmTop = 7938
        mmWidth = 38439
        BandType = 0
      end
      object ppLabel9: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa1'
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
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo1'
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
      object pplPeriodo: TppLabel
        UserName = 'LPeriodo1'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 25400
        mmTop = 14288
        mmWidth = 11853
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplEmpAcoesJurosSi
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplEmpAcoesJurosSi'
        mmHeight = 3810
        mmLeft = 89429
        mmTop = 14288
        mmWidth = 106627
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 19050
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label1'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 2910
        mmTop = 19844
        mmWidth = 6096
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 29633
        mmTop = 19844
        mmWidth = 13039
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label103'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 94456
        mmTop = 19844
        mmWidth = 7144
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAHISTEMPACOES'
        DataPipeline = pplEmpAcoesJurosSi
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplEmpAcoesJurosSi'
        mmHeight = 3429
        mmLeft = 2910
        mmTop = 529
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DESCJUROS'
        DataPipeline = pplEmpAcoesJurosSi
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplEmpAcoesJurosSi'
        mmHeight = 3429
        mmLeft = 29633
        mmTop = 529
        mmWidth = 38100
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'VLRJUROSIMPORTA'
        DataPipeline = pplEmpAcoesJurosSi
        DisplayFormat = '#,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplEmpAcoesJurosSi'
        mmHeight = 3440
        mmLeft = 72496
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport2'
        DrillDownComponent = ppDBText5
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplEmpAcoesJurosAn'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 4763
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplEmpAcoesJurosAn
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Juros Provisionados'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 232
          Top = 128
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplEmpAcoesJurosAn'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object ppShape6: TppShape
              UserName = 'Shape6'
              Brush.Color = clSilver
              mmHeight = 4498
              mmLeft = 26458
              mmTop = 265
              mmWidth = 170921
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label5'
              Caption = 'Quantidade'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2963
              mmLeft = 113179
              mmTop = 1058
              mmWidth = 14351
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label8'
              Caption = 'Investimento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2963
              mmLeft = 81492
              mmTop = 1058
              mmWidth = 16552
              BandType = 1
            end
            object ppLabel4: TppLabel
              UserName = 'Label1'
              Caption = 'Dt Operação'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2963
              mmLeft = 44164
              mmTop = 1058
              mmWidth = 15367
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label4'
              Caption = 'N. Contrato'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2963
              mmLeft = 28046
              mmTop = 1058
              mmWidth = 14224
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label10'
              Caption = 'PU'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2963
              mmLeft = 139182
              mmTop = 1058
              mmWidth = 3429
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label101'
              Caption = 'Valor Oper.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2963
              mmLeft = 151437
              mmTop = 1058
              mmWidth = 13928
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label102'
              Caption = 'Taxa'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2963
              mmLeft = 170244
              mmTop = 1058
              mmWidth = 5969
              BandType = 1
            end
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = 'Valor Juros'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2963
              mmLeft = 181505
              mmTop = 1058
              mmWidth = 15346
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label2'
              Caption = 'Dt Vencimento'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2963
              mmLeft = 61077
              mmTop = 1058
              mmWidth = 18203
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object ppShape4: TppShape
              UserName = 'shpDetalhe1'
              Pen.Style = psClear
              ShiftWithParent = True
              mmHeight = 4233
              mmLeft = 26458
              mmTop = 0
              mmWidth = 170657
              BandType = 4
            end
            object ppDBText14: TppDBText
              UserName = 'dbQuantidade1'
              DataField = 'QTDHISTEMPACOES'
              DataPipeline = pplEmpAcoesJurosAn
              DisplayFormat = '###,###,##0'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplEmpAcoesJurosAn'
              mmHeight = 2921
              mmLeft = 107156
              mmTop = 529
              mmWidth = 20638
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'SIGLAACAOBOLSA'
              DataPipeline = pplEmpAcoesJurosAn
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplEmpAcoesJurosAn'
              mmHeight = 2921
              mmLeft = 81756
              mmTop = 529
              mmWidth = 24342
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'DATAHISTEMPACOES'
              DataPipeline = pplEmpAcoesJurosAn
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplEmpAcoesJurosAn'
              mmHeight = 2921
              mmLeft = 45244
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'PUOPERACAO'
              DataPipeline = pplEmpAcoesJurosAn
              DisplayFormat = '#,##0.00000'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplEmpAcoesJurosAn'
              mmHeight = 2921
              mmLeft = 128852
              mmTop = 529
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'NUMCONTRATOCUSTODIA'
              DataPipeline = pplEmpAcoesJurosAn
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplEmpAcoesJurosAn'
              mmHeight = 2921
              mmLeft = 27517
              mmTop = 529
              mmWidth = 16404
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'VLRHISTEMPACOES'
              DataPipeline = pplEmpAcoesJurosAn
              DisplayFormat = '#,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplEmpAcoesJurosAn'
              mmHeight = 2921
              mmLeft = 147109
              mmTop = 529
              mmWidth = 18785
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              DataField = 'TAXAOPERACAO'
              DataPipeline = pplEmpAcoesJurosAn
              DisplayFormat = '#,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplEmpAcoesJurosAn'
              mmHeight = 2921
              mmLeft = 167746
              mmTop = 529
              mmWidth = 9260
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              DataField = 'VLRJUROSIMPORTA'
              DataPipeline = pplEmpAcoesJurosAn
              DisplayFormat = '#,##0.00'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplEmpAcoesJurosAn'
              mmHeight = 2921
              mmLeft = 178594
              mmTop = 529
              mmWidth = 17992
              BandType = 4
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              DataField = 'DATAVENCOPER'
              DataPipeline = pplEmpAcoesJurosAn
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Tahoma'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplEmpAcoesJurosAn'
              mmHeight = 2921
              mmLeft = 62706
              mmTop = 529
              mmWidth = 16140
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 794
            mmPrintPosition = 0
            object ppLine2: TppLine
              UserName = 'Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 529
              mmLeft = 0
              mmTop = 264
              mmWidth = 197300
              BandType = 7
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel16: TppLabel
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
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197380
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
        mmLeft = 265
        mmTop = 1588
        mmWidth = 197115
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplEmpAcoesJurosSi
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplEmpAcoesJurosSi'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 529
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel22: TppLabel
          UserName = 'Label16'
          Caption = 'Total Juros do Plano/Patro'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 26988
          mmTop = 1323
          mmWidth = 40481
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 26458
          mmTop = 5292
          mmWidth = 171186
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'VLRJUROSIMPORTA'
          DataPipeline = pplEmpAcoesJurosSi
          DisplayFormat = '#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Tahoma'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplEmpAcoesJurosSi'
          mmHeight = 3440
          mmLeft = 72231
          mmTop = 1323
          mmWidth = 30163
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object daDataModule1: TdaDataModule
    end
  end
  object DsJurosSi: TwwDataSource
    DataSet = QryJurosSi
    Left = 37
    Top = 246
  end
  object pplEmpAcoesJurosSi: TppBDEPipeline
    DataSource = DsJurosSi
    UserName = 'lEmpAcoesJurosSi'
    Left = 253
    Top = 160
  end
end
