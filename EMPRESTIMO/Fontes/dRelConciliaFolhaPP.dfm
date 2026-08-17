inherited dtmRelConciliaFolhaPP: TdtmRelConciliaFolhaPP
  Left = 300
  Top = 294
  Width = 484
  Height = 161
  Caption = 'dtmRelConciliaFolhaPP'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 56
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
    Left = 24
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 24
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object qryConciliaFolhaPP: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS NOME_MUTUARIO,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS NOME_PLANO,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS NOME_PATRO,'
      ''
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790 / 1234567879012345678790123456787901234567879012345678790' +
        '12345678790 '#39' AS NOME_PLANOPATRO,'
      ''
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS TCEDESCRICAO,'
      ''
      '   3000000987456     AS IDDESCONTO,'
      '   '#39'1234567890123'#39'   AS MATRICULA,'
      '   9876543210        AS INSCRICAONUMERO,'
      ''
      '   '#39'9999/99'#39'         AS MESREFERENCIA,'
      ''
      '   99999             AS IDPROVENTO,'
      '   '#39'123456789012345'#39' AS CODPROVDESC,'
      '   '#39'B'#39'               AS FLGDESCFOLHA,'
      ''
      '   TO_DATE('#39'10/10/2005'#39', '#39'DD/MM/YYYY'#39') AS DATARECEBIMENTO,'
      ''
      '   999               AS PARCELA,'
      '   999               AS NUMPARCELAS,'
      '   999               AS PARC_RESTA,'
      ''
      '   999999999         AS HMEVLRPREVISTO,'
      '   999999999         AS HMEVLREFETIVO,'
      '   999999999         AS VLRNAORECEBIDO,'
      ''
      '   999999999         AS VALOR,'
      '   999999999         AS VALORRECEBIDO,'
      '   999999999         AS RESIDUO,'
      ''
      '   '#39'Folha da Patrocinadora'#39'   AS TIPO_FOLHA'
      ''
      'FROM'
      '   DUAL')
    ValidateWithMask = True
    Left = 120
    Top = 56
    object qryConciliaFolhaPPNOME_MUTUARIO: TStringField
      FieldName = 'NOME_MUTUARIO'
      FixedChar = True
      Size = 66
    end
    object qryConciliaFolhaPPNOME_PLANO: TStringField
      FieldName = 'NOME_PLANO'
      FixedChar = True
      Size = 66
    end
    object qryConciliaFolhaPPNOME_PATRO: TStringField
      FieldName = 'NOME_PATRO'
      FixedChar = True
      Size = 66
    end
    object qryConciliaFolhaPPNOME_PLANOPATRO: TStringField
      FieldName = 'NOME_PLANOPATRO'
      FixedChar = True
      Size = 136
    end
    object qryConciliaFolhaPPTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 66
    end
    object qryConciliaFolhaPPIDDESCONTO: TFloatField
      FieldName = 'IDDESCONTO'
    end
    object qryConciliaFolhaPPMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryConciliaFolhaPPINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryConciliaFolhaPPMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryConciliaFolhaPPIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
    object qryConciliaFolhaPPCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      FixedChar = True
      Size = 15
    end
    object qryConciliaFolhaPPFLGDESCFOLHA: TStringField
      FieldName = 'FLGDESCFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryConciliaFolhaPPDATARECEBIMENTO: TDateTimeField
      FieldName = 'DATARECEBIMENTO'
    end
    object qryConciliaFolhaPPPARCELA: TFloatField
      FieldName = 'PARCELA'
    end
    object qryConciliaFolhaPPNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryConciliaFolhaPPPARC_RESTA: TFloatField
      FieldName = 'PARC_RESTA'
    end
    object qryConciliaFolhaPPHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryConciliaFolhaPPHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryConciliaFolhaPPVLRNAORECEBIDO: TFloatField
      FieldName = 'VLRNAORECEBIDO'
    end
    object qryConciliaFolhaPPVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryConciliaFolhaPPVALORRECEBIDO: TFloatField
      FieldName = 'VALORRECEBIDO'
    end
    object qryConciliaFolhaPPRESIDUO: TFloatField
      FieldName = 'RESIDUO'
    end
    object qryConciliaFolhaPPTIPO_FOLHA: TStringField
      FieldName = 'TIPO_FOLHA'
      FixedChar = True
      Size = 22
    end
  end
  object pplConciliaFolhaPP: TppBDEPipeline
    DataSource = dtsConciliaFolhaPP
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 120
    Top = 68
    object pplConciliaFolhaPPppField1: TppField
      FieldAlias = 'NOME_MUTUARIO'
      FieldName = 'NOME_MUTUARIO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplConciliaFolhaPPppField2: TppField
      FieldAlias = 'NOME_PLANO'
      FieldName = 'NOME_PLANO'
      FieldLength = 66
      DisplayWidth = 66
      Position = 1
    end
    object pplConciliaFolhaPPppField3: TppField
      FieldAlias = 'NOME_PATRO'
      FieldName = 'NOME_PATRO'
      FieldLength = 66
      DisplayWidth = 66
      Position = 2
    end
    object pplConciliaFolhaPPppField4: TppField
      FieldAlias = 'NOME_PLANOPATRO'
      FieldName = 'NOME_PLANOPATRO'
      FieldLength = 136
      DisplayWidth = 136
      Position = 3
    end
    object pplConciliaFolhaPPppField5: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 66
      DisplayWidth = 66
      Position = 4
    end
    object pplConciliaFolhaPPppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDDESCONTO'
      FieldName = 'IDDESCONTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplConciliaFolhaPPppField7: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 6
    end
    object pplConciliaFolhaPPppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplConciliaFolhaPPppField9: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 8
    end
    object pplConciliaFolhaPPppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPROVENTO'
      FieldName = 'IDPROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplConciliaFolhaPPppField11: TppField
      FieldAlias = 'CODPROVDESC'
      FieldName = 'CODPROVDESC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 10
    end
    object pplConciliaFolhaPPppField12: TppField
      FieldAlias = 'FLGDESCFOLHA'
      FieldName = 'FLGDESCFOLHA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 11
    end
    object pplConciliaFolhaPPppField13: TppField
      FieldAlias = 'DATARECEBIMENTO'
      FieldName = 'DATARECEBIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object pplConciliaFolhaPPppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARCELA'
      FieldName = 'PARCELA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplConciliaFolhaPPppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMPARCELAS'
      FieldName = 'NUMPARCELAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplConciliaFolhaPPppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'PARC_RESTA'
      FieldName = 'PARC_RESTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplConciliaFolhaPPppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRPREVISTO'
      FieldName = 'HMEVLRPREVISTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object pplConciliaFolhaPPppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLREFETIVO'
      FieldName = 'HMEVLREFETIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplConciliaFolhaPPppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRNAORECEBIDO'
      FieldName = 'VLRNAORECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplConciliaFolhaPPppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplConciliaFolhaPPppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplConciliaFolhaPPppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'RESIDUO'
      FieldName = 'RESIDUO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplConciliaFolhaPPppField23: TppField
      FieldAlias = 'TIPO_FOLHA'
      FieldName = 'TIPO_FOLHA'
      FieldLength = 22
      DisplayWidth = 22
      Position = 22
    end
  end
  object dtsConciliaFolhaPP: TwwDataSource
    DataSet = qryConciliaFolhaPP
    Left = 120
    Top = 80
  end
  object rptConciliaFolhaPP: TppReport
    AutoStop = False
    DataPipeline = pplConciliaFolhaPP
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Valores a Receber - Folha(s)'
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
    Left = 120
    Top = 8
    Version = '7.04'
    mmColumnWidth = 284300
    DataPipelineName = 'pplConciliaFolhaPP'
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 66146
      mmPrintPosition = 0
      object linCabecalhoFolha: TppLine
        UserName = 'linCabecalhoFolha'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 38100
        mmWidth = 63765
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 
          'Conciliação de Recebimentos - Folha(s) - por Plano e Patrocinado' +
          'ra'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 53446
        mmTop = 8731
        mmWidth = 163777
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Mês de Cobrança:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 22490
        mmWidth = 26988
        BandType = 0
      end
      object lblMesCobranca: TppLabel
        UserName = 'Label2'
        Caption = 'Label2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 27517
        mmTop = 22490
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Label4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 53446
        mmTop = 2117
        mmWidth = 163777
        BandType = 0
      end
      object lblCabecalhoFolha: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'Exibindo apenas rubricas (Folha): '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 34396
        mmWidth = 63765
        BandType = 0
      end
      object lblValorDivergFolha: TppLabel
        UserName = 'lblValorDivergFolha'
        AutoSize = False
        Caption = 'Com divergência de valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 39423
        mmWidth = 63765
        BandType = 0
      end
      object lblValorNAOZeroFolha: TppLabel
        UserName = 'lblValorNAOZeroFolha'
        AutoSize = False
        Caption = 'Recebidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 43392
        mmWidth = 63765
        BandType = 0
      end
      object lblValorZeroFolha: TppLabel
        UserName = 'lblValorZeroFolha'
        AutoSize = False
        Caption = 'Com Valor recebido ZERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 47361
        mmWidth = 63765
        BandType = 0
      end
      object lblNaoProcessadoFolha: TppLabel
        UserName = 'lblNaoProcessadoFolha'
        AutoSize = False
        Caption = 'Não processadas (pela Folha)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 51329
        mmWidth = 63765
        BandType = 0
      end
      object lblCabecalhoEP: TppLabel
        UserName = 'lblCabecalhoEP'
        AutoSize = False
        Caption = 'Exibindo apenas Itens (Empréstimo):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 70115
        mmTop = 34396
        mmWidth = 63765
        BandType = 0
      end
      object lblValorDivergEP: TppLabel
        UserName = 'lblValorDivergEP'
        AutoSize = False
        Caption = 'Com divergência de valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 70115
        mmTop = 39423
        mmWidth = 63765
        BandType = 0
      end
      object lblValorNAOZeroEP: TppLabel
        UserName = 'lblValorNAOZeroEP'
        AutoSize = False
        Caption = 'Recebidos '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 70115
        mmTop = 43392
        mmWidth = 63765
        BandType = 0
      end
      object lblValorZeroEP: TppLabel
        UserName = 'lblValorZeroEP'
        AutoSize = False
        Caption = 'Não recebidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 70115
        mmTop = 47361
        mmWidth = 63765
        BandType = 0
      end
      object lblNaoProcessadoEP: TppLabel
        UserName = 'lblNaoProcessadoEP'
        AutoSize = False
        Caption = 'Não processados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 70115
        mmTop = 51329
        mmWidth = 63765
        BandType = 0
      end
      object lblDivergFolhaEP: TppLabel
        UserName = 'lblDivergFolhaEP'
        AutoSize = False
        Caption = 'Com divergência de valor (em relação à Folha)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 70115
        mmTop = 55298
        mmWidth = 63765
        BandType = 0
      end
      object linCabecalhoEP: TppLine
        UserName = 'linCabecalhoEP'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 70115
        mmTop = 38100
        mmWidth = 63765
        BandType = 0
      end
      object lblFolhaPatro: TppLabel
        UserName = 'lblFolhaPatro'
        AutoSize = False
        Caption = 'Exibindo Folha(s) da(s) Patrocinadora(s)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 70115
        mmTop = 22490
        mmWidth = 63765
        BandType = 0
      end
      object lblFolhaBenef: TppLabel
        UserName = 'lblFolhaBenef'
        AutoSize = False
        Caption = 'Exibindo Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 70115
        mmTop = 26458
        mmWidth = 63765
        BandType = 0
      end
      object lblNaoEnviado: TppLabel
        UserName = 'lblCaR1'
        AutoSize = False
        Caption = 'Não exibindo itens não enviados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 135732
        mmTop = 22490
        mmWidth = 63765
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
        DataField = 'NOME_MUTUARIO'
        DataPipeline = pplConciliaFolhaPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 3175
        mmLeft = 35983
        mmTop = 794
        mmWidth = 43127
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VALORRECEBIDO'
        DataPipeline = pplConciliaFolhaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 3175
        mmLeft = 226748
        mmTop = 794
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IDDESCONTO'
        DataPipeline = pplConciliaFolhaPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 794
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULA'
        DataPipeline = pplConciliaFolhaPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 3175
        mmLeft = 21167
        mmTop = 794
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'RESIDUO'
        DataPipeline = pplConciliaFolhaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 3175
        mmLeft = 243153
        mmTop = 794
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'MESREFERENCIA'
        DataPipeline = pplConciliaFolhaPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 3175
        mmLeft = 126471
        mmTop = 794
        mmWidth = 10319
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'IDPROVENTO'
        DataPipeline = pplConciliaFolhaPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 3175
        mmLeft = 153459
        mmTop = 794
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CODPROVDESC'
        DataPipeline = pplConciliaFolhaPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 3175
        mmLeft = 164836
        mmTop = 794
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'VLRNAORECEBIDO'
        DataPipeline = pplConciliaFolhaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 3175
        mmLeft = 258763
        mmTop = 794
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'PARCELA'
        DataPipeline = pplConciliaFolhaPP
        DisplayFormat = '#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 2910
        mmLeft = 138642
        mmTop = 794
        mmWidth = 5556
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label25'
        Caption = ' / '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 143934
        mmTop = 529
        mmWidth = 2381
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'NUMPARCELAS'
        DataPipeline = pplConciliaFolhaPP
        DisplayFormat = '#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 2910
        mmLeft = 146050
        mmTop = 794
        mmWidth = 5556
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        BlankWhenZero = True
        DataField = 'VALOR'
        DataPipeline = pplConciliaFolhaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 3175
        mmLeft = 210344
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'HMEVLREFETIVO'
        DataPipeline = pplConciliaFolhaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 3175
        mmLeft = 193940
        mmTop = 794
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplConciliaFolhaPP
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 3175
        mmLeft = 177536
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplConciliaFolhaPP
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConciliaFolhaPP'
        mmHeight = 3175
        mmLeft = 82021
        mmTop = 794
        mmWidth = 41540
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12700
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema1'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1852
        mmWidth = 25665
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
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
        mmTop = 1852
        mmWidth = 94986
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 242888
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      NewPage = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 20638
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplEnviadoSemTmpDesc'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplEnviadoSemTmpDesc
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Valores a Receber - Folha(s)'
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
          Left = 96
          Top = 64
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplEnviadoSemTmpDesc'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 17463
            mmPrintPosition = 0
            object ppShape7: TppShape
              UserName = 'Shape7'
              Brush.Color = 15263976
              mmHeight = 10848
              mmLeft = 13229
              mmTop = 6615
              mmWidth = 257440
              BandType = 1
            end
            object ppLabel34: TppLabel
              UserName = 'Label34'
              Caption = 'Vlr.Previsto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 161925
              mmTop = 14023
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel35: TppLabel
              UserName = 'Label35'
              Caption = 'Vlr.Efetivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 179652
              mmTop = 14023
              mmWidth = 12171
              BandType = 1
            end
            object ppLabel36: TppLabel
              UserName = 'Label36'
              Caption = 'Mutuário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 53711
              mmTop = 14023
              mmWidth = 10319
              BandType = 1
            end
            object ppLabel37: TppLabel
              UserName = 'Label37'
              Caption = 'Evento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 195792
              mmTop = 14023
              mmWidth = 8202
              BandType = 1
            end
            object ppLabel38: TppLabel
              UserName = 'Label38'
              Caption = 'Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 233628
              mmTop = 14023
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel39: TppLabel
              UserName = 'Label39'
              Caption = 'Nº Contrato'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 19579
              mmTop = 14023
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel40: TppLabel
              UserName = 'Label40'
              Caption = 'Matricula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 35719
              mmTop = 14023
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel48: TppLabel
              UserName = 'Label48'
              AutoSize = False
              Caption = 'Itens Enviados sem vínculo com Folhas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 15346
              mmTop = 7673
              mmWidth = 64294
              BandType = 1
            end
            object ppLabel50: TppLabel
              UserName = 'Label50'
              Caption = 'Parcela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 147109
              mmTop = 14023
              mmWidth = 8731
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppLine12: TppLine
              UserName = 'Line12'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 3440
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 4
            end
            object ppLine11: TppLine
              UserName = 'Line11'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3440
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'NOME'
              DataPipeline = pplEnviadoSemTmpDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 53711
              mmTop = 529
              mmWidth = 87313
              BandType = 4
            end
            object ppDBText21: TppDBText
              UserName = 'DBText21'
              DataField = 'EVENTO'
              DataPipeline = pplEnviadoSemTmpDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 195792
              mmTop = 529
              mmWidth = 35983
              BandType = 4
            end
            object ppDBText22: TppDBText
              UserName = 'DBText22'
              DataField = 'ORIGEM'
              DataPipeline = pplEnviadoSemTmpDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 233628
              mmTop = 529
              mmWidth = 36248
              BandType = 4
            end
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'HMEVLREFETIVO'
              DataPipeline = pplEnviadoSemTmpDesc
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 177271
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              DataField = 'HMEVLRPREVISTO'
              DataPipeline = pplEnviadoSemTmpDesc
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              DataField = 'MATRICULA'
              DataPipeline = pplEnviadoSemTmpDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 35719
              mmTop = 529
              mmWidth = 15081
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              DataField = 'IDCONTRATOEMPTMO'
              DataPipeline = pplEnviadoSemTmpDesc
              DisplayFormat = '#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 13758
              mmTop = 529
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText34: TppDBText
              UserName = 'DBText34'
              DataField = 'PARCELA'
              DataPipeline = pplConciliaFolhaPP
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplConciliaFolhaPP'
              mmHeight = 2910
              mmLeft = 144992
              mmTop = 529
              mmWidth = 5556
              BandType = 4
            end
            object ppLabel51: TppLabel
              UserName = 'Label51'
              Caption = ' / '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 150284
              mmTop = 0
              mmWidth = 2381
              BandType = 4
            end
            object ppDBText35: TppDBText
              UserName = 'DBText35'
              DataField = 'NUMPARCELAS'
              DataPipeline = pplConciliaFolhaPP
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'pplConciliaFolhaPP'
              mmHeight = 2910
              mmLeft = 152400
              mmTop = 529
              mmWidth = 5556
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppLine15: TppLine
              UserName = 'Line15'
              ParentHeight = True
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 7
            end
            object ppDBCalc13: TppDBCalc
              UserName = 'DBCalc13'
              DataField = 'HMEVLRPREVISTO'
              DataPipeline = pplEnviadoSemTmpDesc
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 794
              mmWidth = 14552
              BandType = 7
            end
            object ppDBCalc14: TppDBCalc
              UserName = 'DBCalc14'
              DataField = 'HMEVLREFETIVO'
              DataPipeline = pplEnviadoSemTmpDesc
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplEnviadoSemTmpDesc'
              mmHeight = 2910
              mmLeft = 177271
              mmTop = 794
              mmWidth = 14552
              BandType = 7
            end
          end
        end
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = True
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport1
        TraverseAllData = False
        DataPipelineName = 'pplNaoEnviado'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8467
        mmWidth = 270542
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = pplNaoEnviado
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Valores a Receber - Folha(s)'
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
          Left = 232
          Top = 64
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplNaoEnviado'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 17463
            mmPrintPosition = 0
            object ppShape8: TppShape
              UserName = 'Shape8'
              Brush.Color = 15263976
              mmHeight = 10848
              mmLeft = 13229
              mmTop = 6615
              mmWidth = 257440
              BandType = 1
            end
            object ppLabel41: TppLabel
              UserName = 'Label41'
              Caption = 'Vlr.Previsto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 161925
              mmTop = 14023
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel42: TppLabel
              UserName = 'Label42'
              Caption = 'Vlr.Efetivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 179652
              mmTop = 14023
              mmWidth = 12171
              BandType = 1
            end
            object ppLabel43: TppLabel
              UserName = 'Label43'
              Caption = 'Mutuário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 53711
              mmTop = 14023
              mmWidth = 10319
              BandType = 1
            end
            object ppLabel44: TppLabel
              UserName = 'Label44'
              Caption = 'Evento'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 195792
              mmTop = 14023
              mmWidth = 8202
              BandType = 1
            end
            object ppLabel45: TppLabel
              UserName = 'Label45'
              Caption = 'Origem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 233628
              mmTop = 14023
              mmWidth = 10583
              BandType = 1
            end
            object ppLabel46: TppLabel
              UserName = 'Label46'
              Caption = 'Nº Contrato'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 19579
              mmTop = 14023
              mmWidth = 13494
              BandType = 1
            end
            object ppLabel47: TppLabel
              UserName = 'Label47'
              Caption = 'Matricula'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 35719
              mmTop = 14023
              mmWidth = 10848
              BandType = 1
            end
            object ppLabel49: TppLabel
              UserName = 'Label49'
              AutoSize = False
              Caption = 'Itens NÃO Enviados'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 15346
              mmTop = 7673
              mmWidth = 64294
              BandType = 1
            end
            object ppLabel53: TppLabel
              UserName = 'Label501'
              Caption = 'Parcela'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 2910
              mmLeft = 147109
              mmTop = 14023
              mmWidth = 8731
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3440
            mmPrintPosition = 0
            object ppLine13: TppLine
              UserName = 'Line13'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 3440
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 4
            end
            object ppLine14: TppLine
              UserName = 'Line14'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 3440
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              DataField = 'NOME'
              DataPipeline = pplNaoEnviado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 53711
              mmTop = 529
              mmWidth = 87313
              BandType = 4
            end
            object ppDBText28: TppDBText
              UserName = 'DBText28'
              DataField = 'EVENTO'
              DataPipeline = pplNaoEnviado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 195792
              mmTop = 529
              mmWidth = 35983
              BandType = 4
            end
            object ppDBText29: TppDBText
              UserName = 'DBText29'
              DataField = 'ORIGEM'
              DataPipeline = pplNaoEnviado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 233628
              mmTop = 529
              mmWidth = 36248
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              DataField = 'HMEVLREFETIVO'
              DataPipeline = pplNaoEnviado
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 177271
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText31: TppDBText
              UserName = 'DBText31'
              DataField = 'HMEVLRPREVISTO'
              DataPipeline = pplNaoEnviado
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 529
              mmWidth = 14552
              BandType = 4
            end
            object ppDBText32: TppDBText
              UserName = 'DBText32'
              DataField = 'MATRICULA'
              DataPipeline = pplNaoEnviado
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 35719
              mmTop = 529
              mmWidth = 15081
              BandType = 4
            end
            object ppDBText33: TppDBText
              UserName = 'DBText33'
              DataField = 'IDCONTRATOEMPTMO'
              DataPipeline = pplNaoEnviado
              DisplayFormat = '#0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 13758
              mmTop = 529
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText36: TppDBText
              UserName = 'DBText36'
              DataField = 'PARCELA'
              DataPipeline = pplConciliaFolhaPP
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplConciliaFolhaPP'
              mmHeight = 2910
              mmLeft = 144992
              mmTop = 529
              mmWidth = 5556
              BandType = 4
            end
            object ppLabel52: TppLabel
              UserName = 'Label52'
              Caption = ' / '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 150284
              mmTop = 0
              mmWidth = 2381
              BandType = 4
            end
            object ppDBText37: TppDBText
              UserName = 'DBText37'
              DataField = 'NUMPARCELAS'
              DataPipeline = pplConciliaFolhaPP
              DisplayFormat = '#00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = [fsBold]
              Transparent = True
              DataPipelineName = 'pplConciliaFolhaPP'
              mmHeight = 2910
              mmLeft = 152400
              mmTop = 529
              mmWidth = 5556
              BandType = 4
            end
          end
          object ppSummaryBand3: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object ppLine16: TppLine
              UserName = 'Line16'
              ParentHeight = True
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 13229
              mmTop = 0
              mmWidth = 257440
              BandType = 7
            end
            object ppDBCalc15: TppDBCalc
              UserName = 'DBCalc15'
              DataField = 'HMEVLRPREVISTO'
              DataPipeline = pplNaoEnviado
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 160867
              mmTop = 794
              mmWidth = 14552
              BandType = 7
            end
            object ppDBCalc16: TppDBCalc
              UserName = 'DBCalc16'
              DataField = 'HMEVLREFETIVO'
              DataPipeline = pplNaoEnviado
              DisplayFormat = '#,0.00;(#,0.00)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              Visible = False
              DataPipelineName = 'pplNaoEnviado'
              mmHeight = 2910
              mmLeft = 177271
              mmTop = 794
              mmWidth = 14552
              BandType = 7
            end
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'FLGDESCFOLHA'
      DataPipeline = pplConciliaFolhaPP
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConciliaFolhaPP'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 7673
          mmLeft = 0
          mmTop = 5027
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'TIPO_FOLHA'
          DataPipeline = pplConciliaFolhaPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3704
          mmLeft = 179388
          mmTop = 6879
          mmWidth = 89694
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 15346
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 15346
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 0
        end
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          AutoSize = True
          DataField = 'TIPO_FOLHA'
          DataPipeline = pplConciliaFolhaPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 2910
          mmLeft = 149225
          mmTop = 3704
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          mmHeight = 5027
          mmLeft = 175684
          mmTop = 2646
          mmWidth = 95250
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplConciliaFolhaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3175
          mmLeft = 177536
          mmTop = 3704
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'HMEVLREFETIVO'
          DataPipeline = pplConciliaFolhaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 3704
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'VALOR'
          DataPipeline = pplConciliaFolhaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3175
          mmLeft = 210344
          mmTop = 3704
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VALORRECEBIDO'
          DataPipeline = pplConciliaFolhaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3175
          mmLeft = 226748
          mmTop = 3704
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'RESIDUO'
          DataPipeline = pplConciliaFolhaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3175
          mmLeft = 243153
          mmTop = 3704
          mmWidth = 12700
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'VLRNAORECEBIDO'
          DataPipeline = pplConciliaFolhaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3175
          mmLeft = 258763
          mmTop = 3704
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'IDDESCONTO'
          DataPipeline = pplConciliaFolhaPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 2910
          mmLeft = 1588
          mmTop = 3704
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel54: TppLabel
          UserName = 'Label27'
          Caption = 'Itens / Rubricas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 19844
          mmTop = 3704
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOME_PLANO'
      DataPipeline = pplConciliaFolhaPP
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConciliaFolhaPP'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 11377
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          Visible = False
          Weight = 0.75
          mmHeight = 11377
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Previsto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 183092
          mmTop = 7938
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
        object ppLabel21: TppLabel
          UserName = 'Label201'
          AutoSize = False
          Caption = 'Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 177536
          mmTop = 3704
          mmWidth = 30956
          BandType = 3
          GroupNo = 1
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 177536
          mmTop = 6879
          mmWidth = 30956
          BandType = 3
          GroupNo = 1
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Efetivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 200290
          mmTop = 7938
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
        object ppLabel25: TppLabel
          UserName = 'Label15'
          Caption = 'a Receber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 213519
          mmTop = 7938
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object ppLabel28: TppLabel
          UserName = 'Label28'
          AutoSize = False
          Caption = 'Folha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 210344
          mmTop = 3704
          mmWidth = 45508
          BandType = 3
          GroupNo = 1
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 210344
          mmTop = 6879
          mmWidth = 45508
          BandType = 3
          GroupNo = 1
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 229923
          mmTop = 7938
          mmWidth = 11377
          BandType = 3
          GroupNo = 1
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = 'Resíduo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 245798
          mmTop = 7938
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object ppLabel32: TppLabel
          UserName = 'Label32'
          Caption = 'Valor não'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 257969
          mmTop = 4763
          mmWidth = 11642
          BandType = 3
          GroupNo = 1
        end
        object ppLabel33: TppLabel
          UserName = 'Label33'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 258234
          mmTop = 7938
          mmWidth = 11377
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'NOME_PATRO'
      DataPipeline = pplConciliaFolhaPP
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConciliaFolhaPP'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 14552
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 2
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 14552
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 2
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 8731
          mmTop = 11113
          mmWidth = 10054
          BandType = 3
          GroupNo = 2
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 21167
          mmTop = 11113
          mmWidth = 10848
          BandType = 3
          GroupNo = 2
        end
        object ppLabel11: TppLabel
          UserName = 'Label3'
          Caption = 'Tipo de Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 82021
          mmTop = 11113
          mmWidth = 20373
          BandType = 3
          GroupNo = 2
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Comp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 127529
          mmTop = 11113
          mmWidth = 7938
          BandType = 3
          GroupNo = 2
        end
        object ppLabel15: TppLabel
          UserName = 'Label101'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 35983
          mmTop = 11113
          mmWidth = 6879
          BandType = 3
          GroupNo = 2
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'a Receber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 213784
          mmTop = 11113
          mmWidth = 11642
          BandType = 3
          GroupNo = 2
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 230453
          mmTop = 11113
          mmWidth = 10848
          BandType = 3
          GroupNo = 2
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Previsto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 183092
          mmTop = 11113
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Resíduo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 246328
          mmTop = 11113
          mmWidth = 9525
          BandType = 3
          GroupNo = 2
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'Efetivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 200290
          mmTop = 11113
          mmWidth = 8202
          BandType = 3
          GroupNo = 2
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Interna'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 153459
          mmTop = 11113
          mmWidth = 8467
          BandType = 3
          GroupNo = 2
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 164836
          mmTop = 7938
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 153459
          mmTop = 7938
          mmWidth = 9260
          BandType = 3
          GroupNo = 2
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Externa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 164836
          mmTop = 11113
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'NOME_PLANOPATRO'
          DataPipeline = pplConciliaFolhaPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3440
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 209286
          BandType = 3
          GroupNo = 2
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 210344
          mmTop = 10054
          mmWidth = 45508
          BandType = 3
          GroupNo = 2
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Folha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 210344
          mmTop = 6879
          mmWidth = 45508
          BandType = 3
          GroupNo = 2
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 177536
          mmTop = 10054
          mmWidth = 30956
          BandType = 3
          GroupNo = 2
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          AutoSize = False
          Caption = 'Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 177536
          mmTop = 6879
          mmWidth = 30956
          BandType = 3
          GroupNo = 2
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 258763
          mmTop = 11113
          mmWidth = 10848
          BandType = 3
          GroupNo = 2
        end
        object ppLabel26: TppLabel
          UserName = 'Label26'
          Caption = 'Valor não'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 258498
          mmTop = 7938
          mmWidth = 11113
          BandType = 3
          GroupNo = 2
        end
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'Parcela'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 140759
          mmTop = 11113
          mmWidth = 8731
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppLine8: TppLine
          UserName = 'Line8'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 10583
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 2
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'NOME_PLANOPATRO'
          DataPipeline = pplConciliaFolhaPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3175
          mmLeft = 40746
          mmTop = 3704
          mmWidth = 133615
          BandType = 5
          GroupNo = 2
        end
        object ppShape6: TppShape
          UserName = 'Shape6'
          mmHeight = 5027
          mmLeft = 175684
          mmTop = 2646
          mmWidth = 95250
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplConciliaFolhaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3175
          mmLeft = 177536
          mmTop = 3704
          mmWidth = 15081
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'HMEVLREFETIVO'
          DataPipeline = pplConciliaFolhaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3175
          mmLeft = 193940
          mmTop = 3704
          mmWidth = 14552
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VALOR'
          DataPipeline = pplConciliaFolhaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3175
          mmLeft = 210344
          mmTop = 3704
          mmWidth = 15081
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VALORRECEBIDO'
          DataPipeline = pplConciliaFolhaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3175
          mmLeft = 226748
          mmTop = 3704
          mmWidth = 14552
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'RESIDUO'
          DataPipeline = pplConciliaFolhaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3175
          mmLeft = 243153
          mmTop = 3704
          mmWidth = 12700
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VLRNAORECEBIDO'
          DataPipeline = pplConciliaFolhaPP
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 3175
          mmLeft = 258763
          mmTop = 3704
          mmWidth = 10848
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc18'
          DataField = 'IDDESCONTO'
          DataPipeline = pplConciliaFolhaPP
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplConciliaFolhaPP'
          mmHeight = 2910
          mmLeft = 1588
          mmTop = 3704
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object ppLabel55: TppLabel
          UserName = 'Label55'
          Caption = 'Itens / Rubricas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 19844
          mmTop = 3704
          mmWidth = 16933
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object pplEnviadoSemTmpDesc: TppBDEPipeline
    DataSource = dtsHistMovSemTmpDesc
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplEnviadoSemTmpDesc'
    Left = 248
    Top = 8
  end
  object pplNaoEnviado: TppBDEPipeline
    DataSource = dtsHistMovNaoEnviado
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplNaoEnviado'
    Left = 376
    Top = 8
  end
  object qryHistMovSemTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   30000000987546 AS IDCONTRATOEMPTMO,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS NOME,'
      '   '#39'1234567890123'#39' AS MATRICULA,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS TCEDESCRICAO,'
      '   999 AS HMEPARCELA,'
      '   999 AS HMENUMPARCELAS,'
      ''
      '   '#39'Quitação por Falecimento'#39'                      AS EVENTO,'
      '   '#39'Contabilização em Lote de Atualização Diária'#39'  AS ORIGEM,'
      ''
      '   999999 AS HMEVLRPREVISTO,'
      '   999999 AS HMEVLREFETIVO'
      ''
      'FROM'
      '   DUAL')
    ValidateWithMask = True
    Left = 248
    Top = 72
    object qryHistMovSemTmpDescIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovSemTmpDescNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 66
    end
    object qryHistMovSemTmpDescMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryHistMovSemTmpDescTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 66
    end
    object qryHistMovSemTmpDescHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovSemTmpDescHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovSemTmpDescEVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 24
    end
    object qryHistMovSemTmpDescORIGEM: TStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 44
    end
    object qryHistMovSemTmpDescHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovSemTmpDescHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
  end
  object dtsHistMovSemTmpDesc: TwwDataSource
    DataSet = qryHistMovSemTmpDesc
    Left = 248
    Top = 56
  end
  object qryHistMovNaoEnviado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   30000000987546 AS IDCONTRATOEMPTMO,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS NOME,'
      '   '#39'1234567890123'#39' AS MATRICULA,'
      
        '   '#39'123456787901234567879012345678790123456787901234567879012345' +
        '678790'#39' AS TCEDESCRICAO,'
      '   999 AS HMEPARCELA,'
      '   999 AS HMENUMPARCELAS,'
      ''
      '   '#39'Quitação por Falecimento'#39'                      AS EVENTO,'
      '   '#39'Contabilização em Lote de Atualização Diária'#39'  AS ORIGEM,'
      ''
      '   999999 AS HMEVLRPREVISTO,'
      '   999999 AS HMEVLREFETIVO'
      ''
      'FROM'
      '   DUAL')
    ValidateWithMask = True
    Left = 376
    Top = 72
    object qryHistMovNaoEnviadoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryHistMovNaoEnviadoNOME: TStringField
      FieldName = 'NOME'
      FixedChar = True
      Size = 66
    end
    object qryHistMovNaoEnviadoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryHistMovNaoEnviadoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      FixedChar = True
      Size = 66
    end
    object qryHistMovNaoEnviadoHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryHistMovNaoEnviadoHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryHistMovNaoEnviadoEVENTO: TStringField
      FieldName = 'EVENTO'
      FixedChar = True
      Size = 24
    end
    object qryHistMovNaoEnviadoORIGEM: TStringField
      FieldName = 'ORIGEM'
      FixedChar = True
      Size = 44
    end
    object qryHistMovNaoEnviadoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryHistMovNaoEnviadoHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
  end
  object dtsHistMovNaoEnviado: TwwDataSource
    DataSet = qryHistMovNaoEnviado
    Left = 376
    Top = 56
  end
end
