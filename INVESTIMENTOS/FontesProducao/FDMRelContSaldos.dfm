inherited DMRelContSaldos: TDMRelContSaldos
  Left = 485
  Top = 164
  Height = 222
  Caption = 'DMRelContSaldos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  inherited qryExemplo: TwwQuery
    Left = 26
  end
  inherited rpExemplo: TppReport
    DataPipelineName = 'pplExemplo'
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 157
    Top = 72
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 95
    Top = 72
  end
  object qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT '#39'Plano/Patrocinadora: '#39'||PP.PLANPRVCONTABPATRO as PLANPRV' +
        'CONTABPATRO,'
      
        '       E.SIGLAEMISSOR || '#39' - '#39' || TO_CHAR(O.DATAOPERACAO, '#39'DD/MM' +
        '/YYYY'#39') AS CONTRATO, H.DATAHISTCONTACOES,'
      
        '       HR.QTDRECEBER, HR.SALDORECEBER, HP.QTDPAGAR, HP.SALDOPAGA' +
        'R, H.VLRMOVCONTACOES AS VARIACAO,'
      '       H.SLDVLRCONTACOES AS SALDOLIQUIDO,'
      
        '       H.VLRPROVPERDA AS PROVISAO, H.SLDPROVPERDA AS SLDPROVISAO' +
        ','
      
        '       (H.SLDVLRCONTACOES + H.SLDPROVPERDA) AS SALDOPROV, O.IDOP' +
        'ERCONTACOES, O.IDOPERCONTACOESAP'
      'FROM OPERCONTACOES O, EMISSOR E, HISTCONTACOES H,'
      
        '     (SELECT QTDSLDCONTACOES AS QTDPAGAR, VLRSLDCONTACOES AS SAL' +
        'DOPAGAR, DATASLDCONTACOES, IDOPERCONTACOESAP'
      '      FROM SALDOSCONTACOES'
      
        '      WHERE ((:IDOPERCONTACOES IS NULL) OR (IDOPERCONTACOESAP = ' +
        ':IDOPERCONTACOES))'
      '        AND (TIPOSALDO = '#39'P'#39')) HP,'
      
        '     (SELECT QTDSLDCONTACOES AS QTDRECEBER, VLRSLDCONTACOES AS S' +
        'ALDORECEBER, DATASLDCONTACOES, IDOPERCONTACOESAP'
      '      FROM SALDOSCONTACOES'
      
        '      WHERE ((:IDOPERCONTACOES IS NULL) OR (IDOPERCONTACOESAP = ' +
        ':IDOPERCONTACOES))'
      '        AND (TIPOSALDO = '#39'R'#39')) HR,'
      '      VWPLANPREVCTBPATR PP'
      ''
      
        'WHERE ((:IDOPERCONTACOES IS NULL) OR (O.IDOPERCONTACOESAP = :IDO' +
        'PERCONTACOES))'
      
        '  AND ((:DATAINI IS NULL) OR (H.DATAHISTCONTACOES >= TO_DATE(:DA' +
        'TAINI,'#39'DD/MM/YYYY'#39')))'
      '  AND O.IDEMISSOR = E.IDEMISSOR'
      
        '  AND ((:DATAFIM IS NULL) OR (H.DATAHISTCONTACOES <= TO_DATE(:DA' +
        'TAFIM,'#39'DD/MM/YYYY'#39')))'
      '  AND O.IDOPERCONTACOES = H.IDOPERCONTACOESAP'
      '  AND O.IDOPERCONTACOESAP = HP.IDOPERCONTACOESAP'
      '  AND O.IDOPERCONTACOESAP = HR.IDOPERCONTACOESAP'
      '  AND H.DATAHISTCONTACOES = HP.DATASLDCONTACOES'
      '  AND H.DATAHISTCONTACOES = HR.DATASLDCONTACOES'
      '  AND O.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '  AND HR.QTDRECEBER <> 0'
      ''
      
        'ORDER BY PLANPRVCONTABPATRO,O.IDOPERCONTACOESAP, H.DATAHISTCONTA' +
        'COES'
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
      ' ')
    UpdateObject = updQry
    ValidateWithMask = True
    Left = 26
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end>
    object qryCONTRATO: TStringField
      FieldName = 'CONTRATO'
      Size = 28
    end
    object qryDATAHISTCONTACOES: TDateTimeField
      FieldName = 'DATAHISTCONTACOES'
    end
    object qryQTDRECEBER: TFloatField
      FieldName = 'QTDRECEBER'
    end
    object qrySALDORECEBER: TFloatField
      FieldName = 'SALDORECEBER'
    end
    object qryQTDPAGAR: TFloatField
      FieldName = 'QTDPAGAR'
    end
    object qrySALDOPAGAR: TFloatField
      FieldName = 'SALDOPAGAR'
    end
    object qryVARIACAO: TFloatField
      FieldName = 'VARIACAO'
    end
    object qrySALDOLIQUIDO: TFloatField
      FieldName = 'SALDOLIQUIDO'
    end
    object qryPROVISAO: TFloatField
      FieldName = 'PROVISAO'
    end
    object qrySALDOPROV: TFloatField
      FieldName = 'SALDOPROV'
    end
    object qryIDOPERCONTACOES: TFloatField
      FieldName = 'IDOPERCONTACOES'
    end
    object qrySLDPROVISAO: TFloatField
      FieldName = 'SLDPROVISAO'
    end
    object qryIDOPERCONTACOESAP: TFloatField
      FieldName = 'IDOPERCONTACOESAP'
    end
    object qryPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 134
    end
  end
  object rpt: TppReport
    AutoStop = False
    DataPipeline = ppl
    OnStartPage = rptStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldos de Contrato de Ações'
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 218
    Top = 72
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Saldos de Contrato de Ações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 48948
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
        mmHeight = 5027
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object lblContrato: TppLabel
        UserName = 'lblContrato'
        Caption = 'Contrato'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3725
        mmLeft = 183092
        mmTop = 8202
        mmWidth = 13208
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
      object lblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 14023
        mmWidth = 68527
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'shpGrupoContrato2'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 7408
        mmLeft = 0
        mmTop = 18785
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label2'
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 794
        mmTop = 18785
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Saldo a Receber'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 42333
        mmTop = 18785
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Saldo a Pagar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 67998
        mmTop = 18785
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Variação Saldo Liq'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 111919
        mmTop = 18785
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Saldo Líquido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 94721
        mmTop = 18785
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Variação Prov.Perda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 156104
        mmTop = 18785
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label8'
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 22225
        mmTop = 18785
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Saldo   Provisão Perda'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 130704
        mmTop = 18785
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label10'
        Caption = 'Saldo Liq. Prov.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6879
        mmLeft = 183092
        mmTop = 18785
        mmWidth = 13758
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3969
        mmLeft = 94192
        mmTop = 14023
        mmWidth = 102394
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAHISTCONTACOES'
        DataPipeline = ppl
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'SALDORECEBER'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 38629
        mmTop = 0
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SALDOPAGAR'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 62706
        mmTop = 0
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VARIACAO'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 109802
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'SALDOLIQUIDO'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 86254
        mmTop = 0
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PROVISAO'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'QTDRECEBER'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 16404
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'SLDPROVISAO'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 130704
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'SALDOPROV'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 177007
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
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
        mmTop = 3175
        mmWidth = 197909
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppPageStyle1: TppPageStyle
      EndPage = 0
      SinglePage = 0
      StartPage = 0
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = ppl
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CONTRATO'
      DataPipeline = ppl
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3440
        mmPrintPosition = 0
        object shpGrupoContrato: TppShape
          UserName = 'shpGrupoContrato'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'CONTRATO'
          DataPipeline = ppl
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppl'
          mmHeight = 3440
          mmLeft = 18256
          mmTop = 0
          mmWidth = 124090
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label1'
          Caption = 'Contrato:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 794
          mmTop = 0
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 88900
        mmPrintPosition = 0
        object graGrafico: TppDPTeeChart
          OnPrint = graGraficoPrint
          UserName = 'graGrafico'
          mmHeight = 80698
          mmLeft = 794
          mmTop = 5556
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
          object ppDPTeeChartControl1: TppDPTeeChartControl
            Left = 0
            Top = 0
            Width = 400
            Height = 250
            MarginBottom = 5
            MarginLeft = 0
            MarginRight = 0
            MarginTop = 0
            Title.Text.Strings = (
              'Chart')
            Title.Visible = False
            BackColor = clWhite
            BottomAxis.DateTimeFormat = 'dd/mm/yyyy'
            BottomAxis.Grid.SmallDots = True
            Chart3DPercent = 5
            LeftAxis.Grid.SmallDots = True
            Legend.LegendStyle = lsSeries
            Legend.TextStyle = ltsPlain
            View3D = False
            BevelOuter = bvNone
            BorderWidth = 1
            BorderStyle = bsSingle
            Color = clWhite
            object Series1: TFastLineSeries
              Tag = 3
              Marks.ArrowLength = 8
              Marks.Style = smsValue
              Marks.Visible = False
              DataSource = pplGraf
              SeriesColor = clRed
              Title = 'Saldos a Pagar'
              XLabelsSource = 'DATAHISTCONTACOES'
              LinePen.Color = clRed
              LinePen.Style = psDash
              LinePen.Width = 2
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              XValues.ValueSource = 'DATAHISTCONTACOES'
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'SALDOPAGAR'
            end
            object Series2: TFastLineSeries
              Tag = 3
              Marks.ArrowLength = 8
              Marks.Visible = False
              DataSource = pplGraf
              SeriesColor = clGreen
              Title = 'Saldos a Receber'
              XLabelsSource = 'DATAHISTCONTACOES'
              LinePen.Color = clGreen
              LinePen.Width = 2
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              XValues.ValueSource = 'DATAHISTCONTACOES'
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'SALDORECEBER'
            end
            object Series3: TLineSeries
              Tag = 3
              Marks.ArrowLength = 8
              Marks.Style = smsValue
              Marks.Visible = False
              DataSource = pplGraf
              SeriesColor = 10485760
              Title = 'Saldos do Contrato'
              ValueFormat = 'R$ #,##0.00'
              XLabelsSource = 'DATAHISTCONTACOES'
              LinePen.Color = 10485760
              LinePen.Width = 4
              Pointer.InflateMargins = True
              Pointer.Style = psRectangle
              Pointer.Visible = False
              XValues.DateTime = True
              XValues.Name = 'X'
              XValues.Multiplier = 1
              XValues.Order = loAscending
              XValues.ValueSource = 'DATAHISTCONTACOES'
              YValues.DateTime = False
              YValues.Name = 'Y'
              YValues.Multiplier = 1
              YValues.Order = loNone
              YValues.ValueSource = 'SALDOLIQUIDO'
            end
          end
        end
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
  end
  object qryGraf: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT '#39'Plano/Patrocinadora: '#39'||PP.PLANPRVCONTABPATRO as PLANPRV' +
        'CONTABPATRO,'
      
        '       E.SIGLAEMISSOR || '#39' - '#39' || TO_CHAR(O.DATAOPERACAO, '#39'DD/MM' +
        '/YYYY'#39') AS CONTRATO,'
      
        '       H.DATAHISTCONTACOES, HR.SALDORECEBER, HP.SALDOPAGAR, H.VL' +
        'RMOVCONTACOES AS VARIACAO,'
      '       H.SLDVLRCONTACOES AS SALDOLIQUIDO,'
      '       HR.QTDRECEBER,'
      
        '       H.VLRPROVPERDA AS PROVISAO, H.SLDPROVPERDA AS SLDPROVISAO' +
        ','
      
        '       (H.SLDVLRCONTACOES + H.SLDPROVPERDA) AS SALDOPROV, O.IDOP' +
        'ERCONTACOES,O.IDOPERCONTACOESAP'
      'FROM OPERCONTACOES O, EMISSOR E, HISTCONTACOES H,'
      
        '     (SELECT QTDSLDCONTACOES AS QTDPAGAR,VLRSLDCONTACOES AS SALD' +
        'OPAGAR, DATASLDCONTACOES, IDOPERCONTACOESAP'
      '      FROM SALDOSCONTACOES'
      
        '      WHERE ((:IDOPERCONTACOES IS NULL) OR (IDOPERCONTACOESAP = ' +
        ':IDOPERCONTACOES))'
      '        AND (TIPOSALDO = '#39'P'#39')) HP,'
      
        '     (SELECT QTDSLDCONTACOES AS QTDRECEBER,VLRSLDCONTACOES AS SA' +
        'LDORECEBER, DATASLDCONTACOES, IDOPERCONTACOESAP'
      '      FROM SALDOSCONTACOES'
      
        '      WHERE ((:IDOPERCONTACOES IS NULL) OR (IDOPERCONTACOESAP = ' +
        ':IDOPERCONTACOES))'
      '        AND (TIPOSALDO = '#39'R'#39')) HR,'
      '      VWPLANPREVCTBPATR PP'
      ''
      
        'WHERE ((:IDOPERCONTACOES IS NULL) OR (O.IDOPERCONTACOESAP = :IDO' +
        'PERCONTACOES))'
      
        '  AND ((:DATAINI IS NULL) OR (H.DATAHISTCONTACOES >= TO_DATE(:DA' +
        'TAINI,'#39'DD/MM/YYYY'#39')))'
      '  AND O.IDEMISSOR = E.IDEMISSOR'
      
        '  AND ((:DATAFIM IS NULL) OR (H.DATAHISTCONTACOES <= TO_DATE(:DA' +
        'TAFIM,'#39'DD/MM/YYYY'#39')))'
      '  AND O.IDOPERCONTACOES = H.IDOPERCONTACOESAP'
      '  AND O.IDOPERCONTACOESAP = HP.IDOPERCONTACOESAP'
      '  AND O.IDOPERCONTACOESAP = HR.IDOPERCONTACOESAP'
      '  AND H.DATAHISTCONTACOES = HP.DATASLDCONTACOES'
      '  AND H.DATAHISTCONTACOES = HR.DATASLDCONTACOES'
      '  AND O.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '  AND HR.QTDRECEBER <> 0'
      ''
      
        'ORDER BY PLANPRVCONTABPATRO,O.IDOPERCONTACOESAP, H.DATAHISTCONTA' +
        'COES'
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
      ' ')
    ValidateWithMask = True
    Left = 26
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDOPERCONTACOES'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptResult
      end>
    object StringField1: TStringField
      FieldName = 'CONTRATO'
      Size = 28
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'DATAHISTCONTACOES'
    end
    object FloatField1: TFloatField
      FieldName = 'SALDORECEBER'
    end
    object FloatField2: TFloatField
      FieldName = 'SALDOPAGAR'
    end
    object FloatField3: TFloatField
      FieldName = 'VARIACAO'
    end
    object FloatField4: TFloatField
      FieldName = 'SALDOLIQUIDO'
    end
    object FloatField5: TFloatField
      FieldName = 'PROVISAO'
    end
    object FloatField6: TFloatField
      FieldName = 'SALDOPROV'
    end
    object qryGrafIDOPERCONTACOES: TFloatField
      FieldName = 'IDOPERCONTACOES'
    end
    object qryGrafSLDPROVISAO: TFloatField
      FieldName = 'SLDPROVISAO'
    end
    object qryGrafIDOPERCONTACOESAP: TFloatField
      FieldName = 'IDOPERCONTACOESAP'
    end
    object qryGrafPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 134
    end
    object qryGrafQTDRECEBER: TFloatField
      FieldName = 'QTDRECEBER'
    end
  end
  object dsGraf: TwwDataSource
    AutoEdit = False
    DataSet = qryGraf
    Left = 95
    Top = 120
  end
  object pplGraf: TppBDEPipeline
    DataSource = dsGraf
    UserName = 'ppl1'
    Left = 157
    Top = 120
    object pplGrafppField1: TppField
      FieldAlias = 'CONTRATO'
      FieldName = 'CONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplGrafppField2: TppField
      FieldAlias = 'DATAHISTCONTACOES'
      FieldName = 'DATAHISTCONTACOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplGrafppField3: TppField
      FieldAlias = 'SALDORECEBER'
      FieldName = 'SALDORECEBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplGrafppField4: TppField
      FieldAlias = 'SALDOPAGAR'
      FieldName = 'SALDOPAGAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplGrafppField5: TppField
      FieldAlias = 'VARIACAO'
      FieldName = 'VARIACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplGrafppField6: TppField
      FieldAlias = 'SALDOLIQUIDO'
      FieldName = 'SALDOLIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplGrafppField7: TppField
      FieldAlias = 'PROVISAO'
      FieldName = 'PROVISAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplGrafppField8: TppField
      FieldAlias = 'SALDOPROV'
      FieldName = 'SALDOPROV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplGrafppField9: TppField
      FieldAlias = 'IDOPERCONTACOES'
      FieldName = 'IDOPERCONTACOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplGrafppField10: TppField
      FieldAlias = 'SLDPROVISAO'
      FieldName = 'SLDPROVISAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplGrafppField11: TppField
      FieldAlias = 'IDOPERCONTACOESAP'
      FieldName = 'IDOPERCONTACOESAP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
  end
  object updQry: TUpdateSQL
    ModifySQL.Strings = (
      '')
    InsertSQL.Strings = (
      'insert into OPERCONTACOES'
      '  (IDOPERCONTACOES, IDOPERCONTACOESAP)'
      'values'
      '  (:IDOPERCONTACOES, :IDOPERCONTACOESAP)')
    Left = 220
    Top = 122
  end
end
