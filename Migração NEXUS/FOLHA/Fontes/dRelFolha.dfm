inherited dtmRelFolha: TdtmRelFolha
  Left = 882
  Top = 172
  Width = 796
  Height = 584
  Caption = 'dtmRelFolha'
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 1
    Top = 375
    Width = 787
    Height = 5
    TabOrder = 0
  end
  object Panel2: TPanel [1]
    Left = 1
    Top = 187
    Width = 787
    Height = 5
    TabOrder = 1
  end
  inherited pplExemplo: TppBDEPipeline
    CloseDataSource = True
    SkipWhenNoRecords = False
    Left = 16
    Top = 43
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
    Left = 16
    Top = 31
  end
  inherited qryExemplo: TwwQuery
    Left = 16
    Top = 17
  end
  inherited rpExemplo: TppReport
    Left = 16
    Top = 5
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      inherited Line1: TppLine [0]
      end
      inherited LblEmpresa: TppLabel [1]
      end
      inherited Label11: TppLabel [2]
        mmTop = 9790
      end
    end
    inherited FooterBand1: TppFooterBand
      inherited Calc1: TppSystemVariable [0]
      end
      inherited LblSistema: TppLabel
        mmTop = 2910
      end
      inherited Calc2: TppSystemVariable
        mmLeft = 529
        mmTop = 2910
      end
      inherited Line2: TppLine [3]
      end
    end
  end
  object ppCredBenef: TppBDEPipeline
    DataSource = dsCredBenef
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'CredBenef'
    Left = 369
    Top = 52
    object ppCredBenefppField1: TppField
      FieldAlias = 'DOCUMENTO'
      FieldName = 'DOCUMENTO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppCredBenefppField2: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppCredBenefppField3: TppField
      FieldAlias = 'BANCO'
      FieldName = 'BANCO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppCredBenefppField4: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 3
    end
    object ppCredBenefppField5: TppField
      FieldAlias = 'AGENCIA'
      FieldName = 'AGENCIA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object ppCredBenefppField6: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 5
    end
    object ppCredBenefppField7: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 6
    end
    object ppCredBenefppField8: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object ppCredBenefppField9: TppField
      FieldAlias = 'BANCOPAGADOR'
      FieldName = 'BANCOPAGADOR'
      FieldLength = 50
      DisplayWidth = 50
      Position = 8
    end
    object ppCredBenefppField10: TppField
      FieldAlias = 'DATAPAGAMENTO'
      FieldName = 'DATAPAGAMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object ppCredBenefppField11: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 10
    end
    object ppCredBenefppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppCredBenefppField13: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 12
    end
    object ppCredBenefppField14: TppField
      FieldAlias = 'CONTACORRENTE'
      FieldName = 'CONTACORRENTE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 13
    end
    object ppCredBenefppField15: TppField
      FieldAlias = 'NOMEBANCOPAG'
      FieldName = 'NOMEBANCOPAG'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object ppCredBenefppField16: TppField
      FieldAlias = 'NOMEAGENCPAG'
      FieldName = 'NOMEAGENCPAG'
      FieldLength = 60
      DisplayWidth = 60
      Position = 15
    end
    object ppCredBenefppField17: TppField
      FieldAlias = 'NUMAGENCIAPAG'
      FieldName = 'NUMAGENCIAPAG'
      FieldLength = 15
      DisplayWidth = 15
      Position = 16
    end
    object ppCredBenefppField18: TppField
      FieldAlias = 'NUMBANCOPAG'
      FieldName = 'NUMBANCOPAG'
      FieldLength = 10
      DisplayWidth = 10
      Position = 17
    end
    object ppCredBenefppField19: TppField
      FieldAlias = 'NOCONTACORR'
      FieldName = 'NOCONTACORR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 18
    end
    object ppCredBenefppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUMLIQ'
      FieldName = 'SUMLIQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
  end
  object ppPAFavor: TppBDEPipeline
    DataSource = dsPAFavor
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'PAFavor'
    Left = 748
    Top = 241
  end
  object dsPAFavor: TwwDataSource
    DataSet = qryPAFavor
    Left = 748
    Top = 284
  end
  object qryPAFavor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  H.IDRUBRICA,'
      '  P.NOME,'
      '  H.VALORPROVENTO,'
      '  PF.DATANASC'
      '  BC.NOME AS BANCO,'
      '  BANCO.NUMBANCO,'
      '  AGENCIABANCARIA.IDBANCO,'
      '  AGENCIABANCARIA.NUMAGENCIA,'
      '  AG.NOME AS AGENCIA,'
      '  PARTPREVPLAN.INSCRICAONUMERO,'
      '  PESSOA.NOME,'
      '  PESSOA.NUMDOCUMENTO,'
      '  CONTABANCARIA.CONTACORRENTE,'
      'FROM'
      '  AGENCIABANCARIA,'
      '  BANCO,'
      '  PESSOA BC,'
      '  PESSOA AG,'
      '  CONTABANCARIA CT,'
      '  PESSOA P,'
      '  HISTRUBSAL H,'
      '  PESSOAFISICA PF,'
      '  PARTPREVPLAN'
      'WHERE'
      '  (PESSOA.IDPESSOA = CONTABANCARIA.IDPESSOA)'
      '  AND (PARTPREVPLAN.IDPESSOA = H.IDTITULAR)'
      '  AND (PARTPREVPLAN.IDPESSJUR = H.IDPESSJUR)'
      '  AND (PARTPREVPLAN.IDPLANOPREV = H.IDPLANOPREV)'
      '  AND (CONTABANCARIA.IDAGENCIA = AGENCIABANCARIA.IDPESSOA)'
      '  AND (BANCO.IDPESSOA = AGENCIABANCARIA.IDBANCO)'
      '  AND (BC.IDPESSOA = BANCO.IDPESSOA)'
      '  AND (AG.IDPESSOA = AGENCIABANCARIA.IDPESSOA)'
      '  AND (H.IDPESSOA = P.IDPESSOA)'
      '  AND (H.MESCOBRANCA = '#39'1999/07'#39')'
      '  AND (P.IDPESSOA = PF.IDPESSOA)'
      'AND 1 = 2')
    ValidateWithMask = True
    Left = 748
    Top = 330
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDRUBPENSAO'
        ParamType = ptUnknown
      end>
    object qryPAFavorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryPAFavorVALORPROVENTO: TFloatField
      FieldName = 'VALORPROVENTO'
      Origin = 'HISTRUBSAL.VALORPROVENTO'
    end
  end
  object rpPAFavor: TppReport
    AutoStop = False
    DataPipeline = ppPAFavor
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 748
    Top = 196
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppPAFavor'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22754
      mmPrintPosition = 0
      object ppLabel41: TppLabel
        UserName = 'ppLabel41'
        Caption = 'ppLabel41'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 88106
        mmTop = 8731
        mmWidth = 21167
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'ppLabel42'
        Caption = 'Pensão Alimentícia dos Favorecidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 57150
        mmTop = 1588
        mmWidth = 89165
        BandType = 0
      end
      object ReportPAFavorLine1: TppLine
        UserName = 'ReportPAFavorLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 22490
        mmWidth = 197300
        BandType = 0
      end
      object ReportPAFavorLabel2: TppLabel
        UserName = 'ReportPAFavorLabel2'
        Caption = 'Favorecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 47096
        mmTop = 17727
        mmWidth = 16404
        BandType = 0
      end
      object ReportPAFavorLabel4: TppLabel
        UserName = 'ReportPAFavorLabel4'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 186532
        mmTop = 17727
        mmWidth = 7938
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ReportPAFavorDBText2: TppDBText
        UserName = 'ReportPAFavorDBText2'
        DataField = 'NOME'
        DataPipeline = ppPAFavor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppPAFavor'
        mmHeight = 4233
        mmLeft = 47096
        mmTop = 0
        mmWidth = 85196
        BandType = 4
      end
      object ReportPAFavorDBText3: TppDBText
        UserName = 'ReportPAFavorDBText3'
        DataField = 'VALORPROVENTO'
        DataPipeline = ppPAFavor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppPAFavor'
        mmHeight = 4233
        mmLeft = 166423
        mmTop = 0
        mmWidth = 28046
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel43: TppLabel
        UserName = 'ppLabel43'
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
      object ppCalc9: TppSystemVariable
        UserName = 'Calc9'
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
      object ppCalc10: TppSystemVariable
        UserName = 'ppCalc101'
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
  end
  object ppGerAtiv: TppBDEPipeline
    DataSource = dsGerAtiv
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'GerAtiv'
    Left = 490
    Top = 241
  end
  object dsGerAtiv: TwwDataSource
    DataSet = qryGerAtiv
    Left = 490
    Top = 284
  end
  object qryGerAtiv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.RAZAOSOCIAL FROM'
      'PESSOA P, '
      'EMPRESAPROP E '
      'WHERE  P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 490
    Top = 330
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object rpGerAtiv: TppReport
    AutoStop = False
    DataPipeline = ppGerAtiv
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 490
    Top = 196
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppGerAtiv'
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel53: TppLabel
        UserName = 'ppLabel53'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'ppLine17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'ppLabel54'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine18: TppLine
        UserName = 'ppLine18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel55: TppLabel
        UserName = 'ppLabel55'
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
      object ppCalc17: TppSystemVariable
        UserName = 'Calc17'
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
      object ppCalc18: TppSystemVariable
        UserName = 'Calc18'
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
  end
  object ppBenEncer: TppBDEPipeline
    DataSource = dsBenEncer
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'BenEncer'
    Left = 672
    Top = 241
  end
  object dsBenEncer: TwwDataSource
    DataSet = qryBenEncer
    Left = 672
    Top = 284
  end
  object qryBenEncer: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       PEJ.NOME               AS PATRO       ,'
      '       PEJ.IDPESSOA           AS IDPATRO     ,'
      '       PES.NOME               AS BENEFICIARIO,'
      '       PES.IDPESSOA                          ,'
      '       PP.INSCRICAONUMERO                    ,'
      '       '#39'TERMINO DO BENEFICIO'#39' AS MOTIVO      ,'
      '       B.NOME                                ,'
      '       B.IDBENEFICIO                         ,'
      '       ELG.MATRICULA                         ,'
      '       HSB.SEQBENEFICIO                      ,'
      '       BFB.DATAENCERRAMENTO                  ,'
      '       BFB.VALORATUAL                        ,'
      '       PP.DATACANCELAMENTO'
      
        'FROM PESSOA           PEJ, PARTPREVPLAN  PP , PLANPREVPATRO    P' +
        'LA, EVENTOXSITPART EVS,'
      
        '     ELEGPATRO        ELG, PESSOA        PES, BENEFBFCIARIO    B' +
        'FB, BENEFICIO      B  ,'
      
        '     HSTBENEFBFCIARIO HSB, HSTFOLHABENEF HSF, TPPAGTOBENEFICIO T' +
        'P'
      'WHERE (HSF.MESREFERENCIA   = :MESREF)'
      'AND   (TP.FLGFREQUENCIA   <> '#39'U'#39')'
      'AND   (PLA.IDPESSJUR       = PEJ.IDPESSOA)'
      'AND   (PP.IDPESSJUR        = PLA.IDPESSJUR)'
      'AND   (PP.IDPLANOPREV      = PLA.IDPLANOPREV)'
      'AND   (PES.IDPESSOA        = PP.IDPESSOA)'
      'AND   (BFB.IDPLANOPREV     = PP.IDPLANOPREV)'
      'AND   (BFB.IDPESSOA        = PP.IDPESSOA)'
      'AND   (BFB.IDPESSJUR       = PP.IDPESSJUR)'
      'AND   (B.IDBENEFICIO       = BFB.IDBENEFICIO)'
      'AND   (HSB.IDPESSJUR       = BFB.IDPESSJUR)'
      'AND   (HSB.IDTITULAR       = BFB.IDTITULAR)'
      'AND   (HSB.IDPLANOPREV     = BFB.IDPLANOPREV)'
      'AND   (HSB.IDBENEFICIO     = BFB.IDBENEFICIO)'
      'AND   (HSB.IDPESSOA        = BFB.IDPESSOA)'
      'AND   (HSB.SEQPROPOSTA     = BFB.SEQPROPOSTA)'
      'AND   (HSF.DATAEFETIVACAO  > PP.DATACANCELAMENTO)'
      'AND   (ELG.IDPESSJUR       = HSB.IDPESSJUR)'
      'AND   (ELG.IDPESSOA        = HSB.IDPESSOA)'
      'AND   (EVS.IDSITPART       = PP.IDSITPART)'
      'AND   (TP.IDTPPAGTOBENEFIC = BFB.IDTPPAGTOBENEFIC)'
      
        'AND    EVS.IDEVENTOGERADOR IN (SELECT IDEVENTOGERADOR FROM EVENT' +
        'OGERADOR WHERE FLGENCERRABENEFI=1)'
      'ORDER BY PEJ.IDPESSOA,B.IDBENEFICIO,PES.NOME'
      ' ')
    ValidateWithMask = True
    Left = 672
    Top = 330
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREF'
        ParamType = ptUnknown
        Value = '1999/08'
      end>
  end
  object rpBenEncer: TppReport
    AutoStop = False
    DataPipeline = ppBenEncer
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 209815
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = NomePatroPrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 672
    Top = 196
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBenEncer'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37042
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Relatório de Benefíciarios Encerrados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 62442
        mmTop = 31485
        mmWidth = 71702
        BandType = 0
      end
      object rpBenEncerDBImage1: TppDBImage
        UserName = 'rpBenEncerDBImage1'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object rpBenEncerDBText11: TppDBText
        UserName = 'rpBenEncerDBText11'
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
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object rpBenEncerDBText12: TppDBText
        UserName = 'rpBenEncerDBText12'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25665
        BandType = 0
      end
      object rpBenEncerDBText13: TppDBText
        UserName = 'rpBenEncerDBText13'
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
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object rpBenEncerDBText14: TppDBText
        UserName = 'rpBenEncerDBText14'
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
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object rpBenEncerLabel14: TppLabel
        UserName = 'rpBenEncerLabel14'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5027
        BandType = 0
      end
      object rpBenEncerDBText15: TppDBText
        UserName = 'rpBenEncerDBText15'
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
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object rpBenEncerDBText16: TppDBText
        UserName = 'rpBenEncerDBText16'
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
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 26723
        BandType = 0
      end
      object rpBenEncerDBText17: TppDBText
        UserName = 'rpBenEncerDBText17'
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
        mmLeft = 86519
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object rpBenEncerDBText18: TppDBText
        UserName = 'rpBenEncerDBText18'
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
        mmLeft = 92340
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpBenEncerDBText1: TppDBText
        UserName = 'rpBenEncerDBText1'
        DataField = 'BENEFICIARIO'
        DataPipeline = ppBenEncer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBenEncer'
        mmHeight = 3969
        mmLeft = 46831
        mmTop = 265
        mmWidth = 54504
        BandType = 4
      end
      object rpBenEncerDBText4: TppDBText
        UserName = 'rpBenEncerDBText4'
        DataField = 'DATACANCELAMENTO'
        DataPipeline = ppBenEncer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBenEncer'
        mmHeight = 3969
        mmLeft = 102394
        mmTop = 265
        mmWidth = 21167
        BandType = 4
      end
      object rpBenEncerDBText5: TppDBText
        UserName = 'rpBenEncerDBText5'
        DataField = 'VALORATUAL'
        DataPipeline = ppBenEncer
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBenEncer'
        mmHeight = 3969
        mmLeft = 125942
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object rpBenEncerLabel1: TppLabel
        UserName = 'rpBenEncerLabel1'
        Caption = 'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 147902
        mmTop = 265
        mmWidth = 2381
        BandType = 4
      end
      object rpBenEncerDBText6: TppDBText
        UserName = 'rpBenEncerDBText6'
        DataField = 'MOTIVO'
        DataPipeline = ppBenEncer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBenEncer'
        mmHeight = 3969
        mmLeft = 156369
        mmTop = 265
        mmWidth = 42069
        BandType = 4
      end
      object rpBenEncerDBText3: TppDBText
        UserName = 'rpBenEncerDBText3'
        DataField = 'SEQBENEFICIO'
        DataPipeline = ppBenEncer
        DisplayFormat = '0#'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBenEncer'
        mmHeight = 3969
        mmLeft = 34660
        mmTop = 265
        mmWidth = 8202
        BandType = 4
      end
      object rpBenEncerDBText2: TppDBText
        UserName = 'rpBenEncerDBText2'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppBenEncer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBenEncer'
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 265
        mmWidth = 13758
        BandType = 4
      end
      object rpBenEncerDBText19: TppDBText
        UserName = 'rpBenEncerDBText19'
        DataField = 'MATRICULA'
        DataPipeline = ppBenEncer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBenEncer'
        mmHeight = 3969
        mmLeft = 15346
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 10848
        mmWidth = 197115
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel3'
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
        mmTop = 12171
        mmWidth = 197909
        BandType = 8
      end
      object rpBenEncerLabel11: TppLabel
        UserName = 'rpBenEncerLabel11'
        Caption = 
          '* Tipo: (N) Folha Normal  /  (S) Folha Suplementar  /  (A) Folha' +
          ' Adiantamento /  (R) Recibo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1058
        mmTop = 2910
        mmWidth = 128588
        BandType = 8
      end
      object rpBenEncerLine3: TppLine
        UserName = 'rpBenEncerLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197115
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
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
        mmTop = 12171
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
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
        mmTop = 12171
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpBenEncerGroup2: TppGroup
      BreakName = 'IDPATRO'
      DataPipeline = ppBenEncer
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpBenEncerGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBenEncer'
      object rpBenEncerGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpBenEncerGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpBenEncerGroup3: TppGroup
      BreakName = 'IDBENEFICIO'
      DataPipeline = ppBenEncer
      OutlineSettings.CreateNode = True
      UserName = 'rpBenEncerGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBenEncer'
      object rpBenEncerGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 18521
        mmPrintPosition = 0
        object rpBenEncerLabel9: TppLabel
          UserName = 'rpBenEncerLabel9'
          Caption = 'Benefício   :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 7673
          mmWidth = 16669
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerDBText7: TppDBText
          UserName = 'rpBenEncerDBText7'
          DataField = 'IDBENEFICIO'
          DataPipeline = ppBenEncer
          DisplayFormat = '###'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBenEncer'
          mmHeight = 3969
          mmLeft = 24077
          mmTop = 7673
          mmWidth = 7408
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerLabel10: TppLabel
          UserName = 'rpBenEncerLabel10'
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 32808
          mmTop = 7673
          mmWidth = 1058
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerDBText8: TppDBText
          UserName = 'rpBenEncerDBText8'
          DataField = 'NOME'
          DataPipeline = ppBenEncer
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBenEncer'
          mmHeight = 3969
          mmLeft = 36513
          mmTop = 7673
          mmWidth = 95250
          BandType = 3
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'ppLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 1588
          mmWidth = 197115
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerLabel3: TppLabel
          UserName = 'rpBenEncerLabel3'
          Caption = 'Seq. Ben.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 31750
          mmTop = 11906
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerLabel4: TppLabel
          UserName = 'rpBenEncerLabel4'
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 48419
          mmTop = 11906
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerLabel5: TppLabel
          UserName = 'rpBenEncerLabel5'
          Caption = 'Data Encer.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 105834
          mmTop = 11906
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerLabel6: TppLabel
          UserName = 'rpBenEncerLabel6'
          Caption = 'Valor Bruto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 126736
          mmTop = 11906
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerLabel7: TppLabel
          UserName = 'rpBenEncerLabel7'
          Caption = 'Tipo *'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          Visible = False
          mmHeight = 3969
          mmLeft = 145257
          mmTop = 11906
          mmWidth = 8467
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerLabel8: TppLabel
          UserName = 'rpBenEncerLabel8'
          Caption = 'Descrição do Motivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 156369
          mmTop = 11906
          mmWidth = 29104
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerLine2: TppLine
          UserName = 'rpBenEncerLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 16669
          mmWidth = 197115
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerMesAno: TppLabel
          UserName = 'rpBenEncerMesAno'
          Caption = 'Mes/Ano : 08/1999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 156369
          mmTop = 2910
          mmWidth = 26723
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerLabel12: TppLabel
          UserName = 'rpBenEncerLabel12'
          Caption = 'Patrocinadora  :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 2910
          mmWidth = 22754
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerDBText9: TppDBText
          UserName = 'rpBenEncerDBText9'
          DataField = 'IDPATRO'
          DataPipeline = ppBenEncer
          DisplayFormat = '###'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBenEncer'
          mmHeight = 3969
          mmLeft = 25665
          mmTop = 2910
          mmWidth = 5821
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerDBText10: TppDBText
          UserName = 'rpBenEncerDBText10'
          DataField = 'PATRO'
          DataPipeline = ppBenEncer
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBenEncer'
          mmHeight = 3969
          mmLeft = 36513
          mmTop = 2910
          mmWidth = 95250
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerLabel13: TppLabel
          UserName = 'rpBenEncerLabel13'
          Caption = '- '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 32808
          mmTop = 2910
          mmWidth = 1852
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerLabel2: TppLabel
          UserName = 'rpBenEncerLabel2'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 11906
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object rpBenEncerLabel15: TppLabel
          UserName = 'rpBenEncerLabel15'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 17463
          mmTop = 11906
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
      end
      object rpBenEncerGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3175
        mmPrintPosition = 0
      end
    end
  end
  object qryHst: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  H.IDPESSOA ,'
      '  H.IDPESSJUR ,'
      '  H.IDMOTIVO,'
      '  P.IDPESSOA AS PATROCINADORA,'
      '  H.MESCOBRANCA,'
      '  BF.DATAINICIO'
      'FROM'
      '  HISTRUBSAL H,'
      '  BENEFBFCIARIO BF,'
      '  PATRO P'
      'WHERE'
      '  (BF.IDPESSOA = H.IDPESSOA) AND'
      '  (H.IDPESSJUR = P.IDFUNDACAO)'
      '')
    ValidateWithMask = True
    Left = 750
    Top = 13
  end
  object dsHst: TwwDataSource
    DataSet = qryHst
    Left = 750
    Top = 64
  end
  object qryProventos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsHst
    SQL.Strings = (
      'SELECT'
      '  H.IDPESSOA,'
      '  H.MESCOBRANCA,'
      '  H.IDMOTIVO,'
      '  H.MES,'
      '  H.IDPESSJUR,'
      '  H.REFERENCIA,'
      '  H.IDRUBRICA,'
      '  H.CODPROVDESC,'
      '  H.CODMOEDA,'
      '  H.VALORPROVENTO,'
      '  H.IDREGRACALCULO,'
      '  H.FLGCOMPOESALPART,'
      '  H.FLGCOMPOESALBENEF,'
      '  H.FLGIRRF,'
      '  H.VALORCOTAS,'
      '  H.IDRETROATIVO,'
      
        '  DECODE(PRM.FLGUSACODRUBEXT, 0, PV.DESCRICAO, PV.DESCRPROVDESC)' +
        ' AS DESCRICAO,'
      '  PV.FLGESPECIAL'
      'FROM'
      '  HISTRUBSAL H,'
      '  PARAMAPREV PRM,'
      '  PROVDESC PV,'
      '  PATRO P'
      'WHERE'
      '  H.IDPESSOA = :IDPESSOA AND'
      '  P.IDPESSOA = :IDPESSJUR AND'
      '  H.MESCOBRANCA = :MESCOBRANCA AND'
      '  H.IDPESSJUR = P.IDFUNDACAO AND'
      '  H.IDRUBRICA = PV.IDPROVENTO AND'
      '  PV.FLGDESCONTO = 0 AND'
      '  PV.FLGESPECIAL <> 2'
      'ORDER BY'
      '  H.MES,'
      '  H.REFERENCIA'
      ' ')
    ValidateWithMask = True
    Left = 663
    Top = 143
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end>
  end
  object qryDescontos: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsHst
    SQL.Strings = (
      'SELECT'
      '  H.IDPESSOA,'
      '  H.MESCOBRANCA,'
      '  H.IDMOTIVO,'
      '  H.MES,'
      '  H.IDPESSJUR,'
      '  H.REFERENCIA,'
      '  H.IDRUBRICA,'
      '  H.CODPROVDESC,'
      '  H.CODMOEDA,'
      '  H.VALORPROVENTO,'
      '  H.IDREGRACALCULO,'
      '  H.FLGCOMPOESALPART,'
      '  H.FLGCOMPOESALBENEF,'
      '  H.FLGIRRF,'
      '  H.VALORCOTAS,'
      '  H.IDRETROATIVO,'
      
        '  DECODE(PRM.FLGUSACODRUBEXT, 0, PV.DESCRICAO, PV.DESCRPROVDESC)' +
        ' AS DESCRICAO,'
      '  PV.FLGESPECIAL'
      'FROM'
      '  HISTRUBSAL H,'
      '  PARAMAPREV PRM,'
      '  PROVDESC PV,'
      '  PATRO P'
      'WHERE'
      '  H.IDPESSOA = :IDPESSOA AND'
      '  P.IDPESSOA = :IDPESSJUR AND'
      '  H.IDMOTIVO = :IDMOTIVO AND'
      '  H.MESCOBRANCA = :MESCOBRANCA AND'
      '  H.IDPESSJUR = P.IDFUNDACAO AND'
      '  H.IDRUBRICA = PV.IDPROVENTO AND'
      '  PV.FLGDESCONTO in (1,2) AND'
      '  PV.FLGESPECIAL <> 2'
      'ORDER BY'
      '  H.MES,'
      '  H.REFERENCIA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 730
    Top = 143
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDMOTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end>
  end
  object qryEndereco: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsHst
    SQL.Strings = (
      'SELECT'
      '  EP.IDPESSOA,'
      '  EP.IDENDERECO,'
      '  EP.LOGRADOURO,'
      '  EP.IDPAIS,'
      '  EP.CODESTADO,'
      '  EP.NUMERO,'
      '  EP.COMPLEMENTO,'
      '  EP.BAIRRO,'
      '  EP.CIDADE,'
      '  EP.CEP,'
      '  EP.TIPOENDERECO,'
      '  EP.NOME'
      'FROM'
      '  ENDPESS EP'
      'WHERE'
      '  EP.IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 598
    Top = 143
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryConta: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsHst
    SQL.Strings = (
      'SELECT AG.NUMAGENCIA, CB.CONTACORRENTE,  BC.NUMBANCO'
      'FROM   AGENCIABANCARIA AG, CONTABANCARIA CB, BANCO BC'
      'WHERE  CB.IDPESSOA =  :IDPESSOA'
      'AND    AG.IDPESSOA = CB.IDAGENCIA'
      'AND    BC.IDPESSOA = CB.IDCBANCARIA')
    ValidateWithMask = True
    Left = 542
    Top = 143
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryCredBenefBeneficio: TwwQuery
    BeforeOpen = qryCredBenefBeneficioBeforeOpen
    AfterOpen = qryCredBenefBeneficioAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       PD.DESCRICAO AS NOME,'
      
        '       SUM(DECODE(PRD.FLGDESCONTO,0,DECODE(PRD.FLGESPECIAL,0,HST' +
        '.VALORPROVENTO,0),DECODE(PRD.FLGESPECIAL,0,HST.VALORPROVENTO*-1,' +
        '0))) VLBENEFPGTO'
      'FROM'
      
        '     HISTRUBSAL    HST , CONTABANCARIA CB , PROVDESC      PRD  ,' +
        ' ELEGPATRO       ELP ,'
      
        '     PESSOA        BEN , PESSOAFISICA  PF , BANCO         BC   ,' +
        ' AGENCIABANCARIA AG  ,'
      
        '     DOCUMENTO     DC  , PORTADORFORMA POF, PORTADORCONTA POC  ,' +
        ' PESSOA          BANP,'
      
        '     PESSOA        PJR , PESSOA        AGE, BANCO         BCPAG,' +
        ' AGENCIABANCARIA AGP ,'
      
        '     BENEFPLANPREV BPP , PESSOA        FUN, PESSOA        BAN  ,' +
        ' PESSOA          AGEP,'
      '     TIPODOCRECPAG TDRP, PROVDESC      PD'
      'WHERE'
      '      (PRD.FLGESPECIAL    <> 2)                  AND'
      '      1 = 2 AND'
      '      (CB.FLGCONTAPREF     = 1)                  AND'
      '      (PF.IDPESSOA         = BEN.IDPESSOA)       AND'
      '      (PRD.IDPROVENTO      = HST.IDRUBRICA)      AND'
      '      (ELP.IDPESSJUR       = HST.IDPATRO)        AND'
      '      (ELP.IDPESSOA        = HST.IDPESSOA)       AND'
      '      (FUN.IDPESSOA        = HST.IDPESSJUR)      AND'
      '      (PJR.IDPESSOA        = HST.IDPATRO)        AND'
      '      (BEN.IDPESSOA        = HST.IDPESSOA)       AND'
      '      (DC.CODPORTFORMA     = POF.CODPORTFORMA)   AND'
      '      (HST.CODDOCUMENTO    = DC.CODDOCUMENTO)    AND'
      '      (HST.IDRUBRICA       = PD.IDPROVENTO)      AND'
      '      (PF.IDPESSOA         = BPP.IDPESSOA(+))    AND'
      '      (BPP.CODTIPDOC       = TDRP.CODTIPDOC(+))  AND'
      '      (HST.IDPESSOA        = CB.IDPESSOA(+))     AND'
      '      (CB.IDAGENCIA        = AG.IDPESSOA(+))     AND'
      '      (AG.IDBANCO          = BC.IDPESSOA(+))     AND'
      '      (AG.IDPESSOA         = AGE.IDPESSOA(+))    AND'
      '      (BC.IDPESSOA         = BAN.IDPESSOA(+))    AND'
      '      (POF.CODPORTADOR     = POC.CODPORTADOR(+)) AND'
      '      (POC.IDBANCO         = BANP.IDPESSOA(+))   AND'
      '      (POC.IDAGENCIA       = AGEP.IDPESSOA(+))   AND'
      '      (POC.IDBANCO         = BCPAG.IDPESSOA(+))  AND'
      '      (POC.IDAGENCIA       = AGP.IDPESSOA(+))'
      'GROUP BY PD.DESCRICAO'
      'ORDER BY PD.DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 534
    Top = 97
  end
  object ppCredBenefBeneficio: TppBDEPipeline
    DataSource = dsCredBenefBeneficio
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'CredBenefBeneficio'
    Left = 478
    Top = 97
  end
  object dsCredBenefBeneficio: TwwDataSource
    DataSet = qryCredBenefBeneficio
    Left = 506
    Top = 97
  end
  object qryBenefAlterRes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  BENEFICIO.NOME AS BENEFICIO,'
      '  SUM(QRY_ANT.VLBENEFPGTO) AS VALANT,'
      '  SUM(QRY_ATU.VLBENEFPGTO) AS VALATU,'
      '  SUM(QRY_ATU.VLBENEFPGTO - QRY_ANT.VLBENEFPGTO) AS DIFERENCA'
      'FROM'
      '  BENEFICIO,'
      '  (SELECT'
      '      HST.IDBENEFICIO,'
      '      HST.IDPESSOA,'
      '      HST.VLBENEFPGTO'
      '    FROM'
      '      HSTBENEFBFCIARIO HST'
      '    WHERE'
      '      (HST.MES = :MESANT)) QRY_ANT,'
      '  (SELECT'
      '      HST.IDBENEFICIO,'
      '      HST.IDPESSOA,'
      '      HST.VLBENEFPGTO'
      '    FROM'
      '      HSTBENEFBFCIARIO HST'
      '    WHERE'
      '      (HST.MES = :MESATU)) QRY_ATU'
      'WHERE'
      '  ( QRY_ANT.IDPESSOA = QRY_ATU.IDPESSOA )'
      '  AND ( QRY_ANT.VLBENEFPGTO <> QRY_ATU.VLBENEFPGTO )'
      '  AND ( BENEFICIO.IDBENEFICIO = QRY_ATU.IDBENEFICIO )'
      'GROUP BY'
      '  BENEFICIO.NOME'
      'ORDER BY'
      '  BENEFICIO.NOME'
      '')
    ValidateWithMask = True
    Left = 534
    Top = 52
    ParamData = <
      item
        DataType = ftString
        Name = 'MESANT'
        ParamType = ptUnknown
        Value = '1999/07'
      end
      item
        DataType = ftString
        Name = 'MESATU'
        ParamType = ptUnknown
        Value = '1999/08'
      end>
    object qryBenefAlterResBENEFICIO: TStringField
      FieldName = 'BENEFICIO'
      Size = 60
    end
    object qryBenefAlterResVALANT: TFloatField
      FieldName = 'VALANT'
    end
    object qryBenefAlterResVALATU: TFloatField
      FieldName = 'VALATU'
    end
    object qryBenefAlterResDIFERENCA: TFloatField
      FieldName = 'DIFERENCA'
    end
  end
  object ppBenefAlterRes: TppBDEPipeline
    DataSource = dsBenefAlterRes
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'BenefAlterRes'
    Left = 478
    Top = 52
  end
  object dsBenefAlterRes: TwwDataSource
    DataSet = qryBenefAlterRes
    Left = 506
    Top = 52
  end
  object qryTmp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.RAZAOSOCIAL FROM'
      'PESSOA P, '
      'EMPRESAPROP E '
      'WHERE  P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 498
    Top = 143
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object ppReport1: TppReport
    AutoStop = False
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RelResFolha'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 341
    Top = 52
    Version = '7.04'
    mmColumnWidth = 0
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28840
      mmPrintPosition = 0
      object ppLabel48: TppLabel
        UserName = 'ppLabel48'
        Caption = 'Relatório de Entradas/Saídas da Folha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 55033
        mmTop = 5821
        mmWidth = 93398
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'ppLabel49'
        Caption = 'lbEmpPropria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 1058
        mmTop = 0
        mmWidth = 195792
        BandType = 0
      end
      object ppLine25: TppLine
        UserName = 'ppLine25'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 529
        mmTop = 12435
        mmWidth = 196057
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
        DataField = 'PATROCINADORA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 54769
        mmTop = 14817
        mmWidth = 95250
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
        DataField = 'DPLANO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 55033
        mmTop = 22754
        mmWidth = 95250
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'ppDBText6'
        DataField = 'INSCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'ppDBText13'
        DataField = 'BENEFICIARIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 41010
        mmTop = 265
        mmWidth = 95250
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'ppDBText14'
        DataField = 'VALOR'
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 174625
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 15346
      mmPrintPosition = 0
      object ppLabel56: TppLabel
        UserName = 'ppLabel56'
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
        mmTop = 794
        mmWidth = 197909
        BandType = 8
      end
      object ppLine26: TppLine
        UserName = 'ppLine26'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppCalc21: TppSystemVariable
        UserName = 'Calc21'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 89165
        mmTop = 794
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc22: TppSystemVariable
        UserName = 'Calc22'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'rpRelaEntSaiFolhaDBText3'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 19579
        mmPrintPosition = 0
        object ppDBText15: TppDBText
          UserName = 'ppDBText15'
          DataField = 'BENEFICIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 55033
          mmTop = 794
          mmWidth = 95250
          BandType = 3
          GroupNo = 2
        end
        object ppLine27: TppLine
          UserName = 'ppLine27'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 14023
          mmWidth = 196057
          BandType = 3
          GroupNo = 2
        end
        object ppLabel57: TppLabel
          UserName = 'ppLabel57'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 15081
          mmWidth = 15081
          BandType = 3
          GroupNo = 2
        end
        object ppLabel58: TppLabel
          UserName = 'ppLabel58'
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 40746
          mmTop = 15081
          mmWidth = 20373
          BandType = 3
          GroupNo = 2
        end
        object ppLabel59: TppLabel
          UserName = 'ppLabel59'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 181505
          mmTop = 15081
          mmWidth = 8996
          BandType = 3
          GroupNo = 2
        end
        object ppLabel60: TppLabel
          UserName = 'ppLabel60'
          Caption = 'Movimento: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 9525
          mmWidth = 20638
          BandType = 3
          GroupNo = 2
        end
        object ppLabel61: TppLabel
          UserName = 'ppLabel61'
          Caption = 'lblmov'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 21696
          mmTop = 9525
          mmWidth = 11377
          BandType = 3
          GroupNo = 2
        end
        object ppLabel62: TppLabel
          UserName = 'ppLabel62'
          Caption = 'Mês Referência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 150019
          mmTop = 9525
          mmWidth = 26988
          BandType = 3
          GroupNo = 2
        end
        object ppLabel63: TppLabel
          UserName = 'ppLabel63'
          Caption = 'lblmes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 178594
          mmTop = 9525
          mmWidth = 11113
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppLabel64: TppLabel
          UserName = 'ppLabel64'
          Caption = 'Total por Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 136790
          mmTop = 529
          mmWidth = 32015
          BandType = 5
          GroupNo = 2
        end
        object ppLabel65: TppLabel
          UserName = 'ppLabel65'
          Caption = 'Total de Beneficiário(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 129911
          mmTop = 6615
          mmWidth = 38894
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'ppDBCalc1'
          DataField = 'VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 4233
          mmLeft = 174625
          mmTop = 6615
          mmWidth = 15875
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'ppDBCalc2'
          DataField = 'VALOR'
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 174625
          mmTop = 529
          mmWidth = 15875
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object wwDataSource1: TwwDataSource
    DataSet = wwQuery1
    Left = 397
    Top = 52
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  DISTINCT'
      '        B.NOME AS BENEFICIO,'
      '        PLANPREV.NOME AS PLANO,'
      '        PJ.NOME AS PATROCINADORA,'
      '        H1.IDPESSOA,'
      '        P.NOME AS BENEFICIARIO,'
      '        PP.INSCRICAONUMERO AS INSCRICAO,'
      '        H1.VLBENEFPGTO AS VALOR,'
      '        BPP.IDRUBRICA'
      'FROM'
      '        HSTBENEFBFCIARIO H1,'
      '        PESSOA P,'
      '        PESSOA PJ,'
      '        PARTPREVPLAN PP,'
      '        BENEFICIO B,'
      '        BENEFPLANPREV BPP,'
      '        PLANPREV,'
      '        PATRO,'
      '        PARAMAPREV PAP'
      'WHERE (H1.MESREFERENCIA = '#39'1999/04'#39')'
      'AND 1 = 2'
      'AND   (P.IDPESSOA = PP.IDPESSOA)'
      'AND   (H1.IDPESSOA   = PP.IDPESSOA)'
      'AND   (B.IDBENEFICIO = BPP.IDBENEFICIO)'
      'AND   (H1.IDPESSJUR = PJ.IDPESSOA)'
      'AND   (H1.IDPLANOPREV = BPP.IDPLANOPREV)'
      'AND   (H1.IDBENEFICIO = BPP.IDBENEFICIO)'
      'AND   (BPP.IDBENEFICIO = H1.IDBENEFICIO)'
      'AND   (PLANPREV.IDPLANOPREV = H1.IDPLANOPREV)'
      'AND   (BPP.IDRUBRICA NOT IN  PAP.IDRUBIRRF)'
      'AND   H1.IDBENEFICIO NOT  IN'
      '(SELECT  H2.IDBENEFICIO'
      'FROM   HSTBENEFBFCIARIO H2'
      'WHERE (H2.MESREFERENCIA = '#39'1999/03'#39')'
      'AND 1 = 2'
      'AND   (P.IDPESSOA = PP.IDPESSOA)'
      'AND   (H2.IDPESSOA   = PP.IDPESSOA)'
      'AND   (B.IDBENEFICIO = BPP.IDBENEFICIO)'
      'AND   (BPP.IDBENEFICIO = H2.IDBENEFICIO)'
      'AND   (PLANPREV.IDPLANOPREV = H2.IDPLANOPREV))'
      'ORDER BY B.NOME,PLANPREV.NOME,PJ.NOME')
    ValidateWithMask = True
    Left = 426
    Top = 52
  end
  object rpRelPensBanco: TppReport
    AutoStop = False
    DataPipeline = ppRelPensBanco
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Pensão Alimentícia de Favorecidos por Banco'
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
    Left = 122
    Top = 381
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppRelPensBanco'
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31750
      mmPrintPosition = 0
      object ppLabel66: TppLabel
        UserName = 'ppLabel66'
        Caption = 'Relatório de Pensão Alimentícia de Favorecidos por Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 44979
        mmTop = 25400
        mmWidth = 119327
        BandType = 0
      end
      object ppLine28: TppLine
        UserName = 'ppLine28'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 30692
        mmWidth = 197300
        BandType = 0
      end
      object rpRelPensBancoDBText1: TppDBText
        UserName = 'rpRelPensBancoDBText1'
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
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object rpRelPensBancoDBText2: TppDBText
        UserName = 'rpRelPensBancoDBText2'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpRelPensBancoDBText3: TppDBText
        UserName = 'rpRelPensBancoDBText3'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object rpRelPensBancoDBImage1: TppDBImage
        UserName = 'rpRelPensBancoDBImage1'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object rpRelPensBancoDBText4: TppDBText
        UserName = 'rpRelPensBancoDBText4'
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
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object rpRelPensBancoDBText5: TppDBText
        UserName = 'rpRelPensBancoDBText5'
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
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14552
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object rpRelCredPenAlimDBText6: TppDBText
        UserName = 'rpRelCredPenAlimDBText6'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppRelPensBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensBanco'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object rpRelCredPenAlimDBText7: TppDBText
        UserName = 'rpRelCredPenAlimDBText7'
        DataField = 'PENSIONISTA'
        DataPipeline = ppRelPensBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensBanco'
        mmHeight = 4233
        mmLeft = 38629
        mmTop = 265
        mmWidth = 72496
        BandType = 4
      end
      object rpRelCredPenAlimDBText8: TppDBText
        UserName = 'rpRelCredPenAlimDBText8'
        DataField = 'CPF'
        DataPipeline = ppRelPensBanco
        DisplayFormat = '!999.999.999-99;0;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensBanco'
        mmHeight = 4233
        mmLeft = 113242
        mmTop = 265
        mmWidth = 24871
        BandType = 4
      end
      object rpRelCredPenAlimDBText9: TppDBText
        UserName = 'rpRelCredPenAlimDBText9'
        DataField = 'CONTACORRENTE'
        DataPipeline = ppRelPensBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensBanco'
        mmHeight = 4233
        mmLeft = 139436
        mmTop = 265
        mmWidth = 26988
        BandType = 4
      end
      object rpRelCredPenAlimDBText10: TppDBText
        UserName = 'rpRelCredPenAlimDBText10'
        DataField = 'VALOR'
        DataPipeline = ppRelPensBanco
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelPensBanco'
        mmHeight = 4233
        mmLeft = 168805
        mmTop = 265
        mmWidth = 28575
        BandType = 4
      end
      object ppDbMatric: TppDBText
        UserName = 'DbMatric'
        DataField = 'MATRICULA'
        DataPipeline = ppRelPensBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppRelPensBanco'
        mmHeight = 4233
        mmLeft = 17463
        mmTop = 265
        mmWidth = 19315
        BandType = 4
      end
    end
    object ppFooterBand13: TppFooterBand
      AfterPrint = ppFooterBand13AfterPrint
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppLabel68: TppLabel
        UserName = 'ppLabel68'
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
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppLine29: TppLine
        UserName = 'ppLine29'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
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
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
    end
    object rpRelPensBancoGroup1: TppGroup
      BreakName = 'DOCUMENTO'
      DataPipeline = ppRelPensBanco
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpRelPensBancoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRelPensBanco'
      object rpRelPensBancoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpRelPensBancoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpRelCredPenAlimGroup1: TppGroup
      BreakName = 'BANCO'
      DataPipeline = ppRelPensBanco
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpRelCredPenAlimGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRelPensBanco'
      object rpRelCredPenAlimGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object rpRelPensBancoLabel1: TppLabel
          UserName = 'rpRelPensBancoLabel1'
          Caption = 'Documento: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 2646
          mmWidth = 21696
          BandType = 3
          GroupNo = 1
        end
        object rpRelPensBancoDBText6: TppDBText
          UserName = 'rpRelPensBancoDBText6'
          AutoSize = True
          DataField = 'DOCUMENTO'
          DataPipeline = ppRelPensBanco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppRelPensBanco'
          mmHeight = 3969
          mmLeft = 22225
          mmTop = 2646
          mmWidth = 23019
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimLabel5: TppLabel
          UserName = 'rpRelCredPenAlimLabel5'
          Caption = 'Mês Pagamento: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 144463
          mmTop = 2646
          mmWidth = 29104
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimDBText11: TppDBText
          UserName = 'rpRelCredPenAlimDBText11'
          DataField = 'MES'
          DataPipeline = ppRelPensBanco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppRelPensBanco'
          mmHeight = 4233
          mmLeft = 175155
          mmTop = 2646
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
      end
      object rpRelCredPenAlimGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object rpRelCredPenAlimLabel12: TppLabel
          UserName = 'rpRelCredPenAlimLabel12'
          Caption = 'Total do Banco: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1852
          mmWidth = 27517
          BandType = 5
          GroupNo = 0
        end
        object rpRelCredPenAlimDBCalc2: TppDBCalc
          UserName = 'rpRelCredPenAlimDBCalc2'
          DataField = 'VALOR'
          DataPipeline = ppRelPensBanco
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpRelCredPenAlimGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppRelPensBanco'
          mmHeight = 4233
          mmLeft = 28575
          mmTop = 1852
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
        end
        object rpRelPensBancoLine2: TppLine
          UserName = 'rpRelPensBancoLine2'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 1058
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object rpRelCredPenAlimGroup2: TppGroup
      BreakName = 'AGENCIA'
      DataPipeline = ppRelPensBanco
      OutlineSettings.CreateNode = True
      UserName = 'rpRelCredPenAlimGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRelPensBanco'
      object rpRelCredPenAlimGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17198
        mmPrintPosition = 0
        object rpRelCredPenAlimLine2: TppLine
          UserName = 'rpRelCredPenAlimLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimLabel6: TppLabel
          UserName = 'rpRelCredPenAlimLabel6'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 12700
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimLabel7: TppLabel
          UserName = 'rpRelCredPenAlimLabel7'
          Caption = 'Nome do Recebedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 38629
          mmTop = 12700
          mmWidth = 34660
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimLabel8: TppLabel
          UserName = 'rpRelCredPenAlimLabel8'
          Caption = 'C.P.F'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 113242
          mmTop = 12700
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimLabel9: TppLabel
          UserName = 'rpRelCredPenAlimLabel9'
          Caption = 'Conta Corrente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 139436
          mmTop = 12700
          mmWidth = 25400
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimLabel10: TppLabel
          UserName = 'rpRelCredPenAlimLabel10'
          Caption = 'Valor da Pensão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 169598
          mmTop = 12700
          mmWidth = 27781
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimLine1: TppLine
          UserName = 'rpRelCredPenAlimLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 11377
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimLabel1: TppLabel
          UserName = 'rpRelCredPenAlimLabel1'
          Caption = 'Banco:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 1323
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimDBText2: TppDBText
          UserName = 'rpRelCredPenAlimDBText2'
          DataField = 'NUMBANCO'
          DataPipeline = ppRelPensBanco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppRelPensBanco'
          mmHeight = 4233
          mmLeft = 12171
          mmTop = 1323
          mmWidth = 7144
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimLabel2: TppLabel
          UserName = 'rpRelCredPenAlimLabel2'
          Caption = ' - '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 19579
          mmTop = 1323
          mmWidth = 3175
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimDBText3: TppDBText
          UserName = 'rpRelCredPenAlimDBText3'
          DataField = 'BANCO'
          DataPipeline = ppRelPensBanco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppRelPensBanco'
          mmHeight = 4233
          mmLeft = 23019
          mmTop = 1323
          mmWidth = 54769
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimLabel3: TppLabel
          UserName = 'rpRelCredPenAlimLabel3'
          Caption = 'Ag:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 78846
          mmTop = 1323
          mmWidth = 5556
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimDBText4: TppDBText
          UserName = 'rpRelCredPenAlimDBText4'
          DataField = 'NUMAGENCIA'
          DataPipeline = ppRelPensBanco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppRelPensBanco'
          mmHeight = 4233
          mmLeft = 84931
          mmTop = 1323
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimLabel4: TppLabel
          UserName = 'rpRelCredPenAlimLabel4'
          Caption = ' - '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 98954
          mmTop = 1323
          mmWidth = 3175
          BandType = 3
          GroupNo = 1
        end
        object rpRelCredPenAlimDBText5: TppDBText
          UserName = 'rpRelCredPenAlimDBText5'
          DataField = 'AGENCIA'
          DataPipeline = ppRelPensBanco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppRelPensBanco'
          mmHeight = 4233
          mmLeft = 102394
          mmTop = 1323
          mmWidth = 95250
          BandType = 3
          GroupNo = 1
        end
        object ppLblMatric: TppLabel
          UserName = 'LblMatric'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 17463
          mmTop = 12700
          mmWidth = 15610
          BandType = 3
          GroupNo = 2
        end
        object ppLblPortForma: TppLabel
          UserName = 'LblPortForma'
          Caption = 'Portador Forma:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 6615
          mmWidth = 27781
          BandType = 3
          GroupNo = 2
        end
        object ppDbPortForma: TppDBText
          UserName = 'DbPortForma'
          DataField = 'DESCRICAO'
          DataPipeline = ppRelPensBanco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppRelPensBanco'
          mmHeight = 4233
          mmLeft = 28575
          mmTop = 6615
          mmWidth = 169069
          BandType = 3
          GroupNo = 2
        end
      end
      object rpRelCredPenAlimGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object rpRelCredPenAlimLabel11: TppLabel
          UserName = 'rpRelCredPenAlimLabel11'
          Caption = 'Total da Agência: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 132557
          mmTop = 1588
          mmWidth = 30692
          BandType = 5
          GroupNo = 1
        end
        object rpRelCredPenAlimDBCalc1: TppDBCalc
          UserName = 'rpRelCredPenAlimDBCalc1'
          DataField = 'VALOR'
          DataPipeline = ppRelPensBanco
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpRelCredPenAlimGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppRelPensBanco'
          mmHeight = 4233
          mmLeft = 164307
          mmTop = 1588
          mmWidth = 33073
          BandType = 5
          GroupNo = 1
        end
        object rpRelPensBancoLine1: TppLine
          UserName = 'rpRelPensBancoLine1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 2
        end
        object rpRelPensBancoDBCalc1: TppDBCalc
          UserName = 'rpRelPensBancoDBCalc1'
          DataField = 'PENSIONISTA'
          DataPipeline = ppRelPensBanco
          DisplayFormat = '#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpRelCredPenAlimGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppRelPensBanco'
          mmHeight = 4233
          mmLeft = 16404
          mmTop = 1058
          mmWidth = 33073
          BandType = 5
          GroupNo = 2
        end
        object rpRelPensBancoLabel2: TppLabel
          UserName = 'rpRelPensBancoLabel2'
          Caption = 'Qtd: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 7938
          mmTop = 1058
          mmWidth = 7938
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryRelPensBanco: TwwQuery
    BeforeOpen = qryRelPensBancoBeforeOpen
    AfterClose = qryRelPensBancoAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  SUM(DECODE(PV.FLGDESCONTO, 0, HRS.VALORPROVENTO, 1, (-1)*HRS.V' +
        'ALORPROVENTO)) AS VALOR,'
      '  PPP.INSCRICAONUMERO,'
      '  EL.MATRICULA,'
      '  HRS.MESCOBRANCA AS MES,'
      
        '  DECODE(HRS.CODDOCUMENTO,NULL,'#39'DOC. NÃO CADASTRADO'#39',HRS.CODDOCU' +
        'MENTO) AS DOCUMENTO,'
      '  HRS.NUMBANCO,'
      '  PB.NOME AS BANCO,'
      '  HRS.NUMAGENCIA,'
      '  PA.NOME AS AGENCIA,'
      '  PEN.NOME AS PENSIONISTA,'
      '  PEN.NUMDOCUMENTO  AS CPF,'
      '  PJ.NOME AS PATROCINADORA,'
      '  HRS.CONTACORRENTE,'
      '  PTF.DESCRICAO'
      ''
      'FROM'
      '  HISTRUBSAL HRS,'
      '  PROVDESC PV,'
      '  ELEGPATRO EL,'
      '  PARTPREVPLAN PPP,'
      '  PORTADORFORMA PTF,'
      '  BANCO BC,'
      '  AGENCIABANCARIA AG,'
      '  PESSOA PA,'
      '  PESSOA PB,'
      '  PESSOA PJ,'
      '  PESSOA PEN,'
      ' (SELECT DISTINCT'
      '    IDTITULAR,'
      '    IDFAVORECIDO'
      ''
      '  FROM'
      '    RUBRICAINDIV'
      ''
      '  WHERE (FLGPENSAOALIM = 1) AND (FLGTPRUBMANUT = '#39'1'#39')) R'
      ''
      'WHERE'
      '  (HRS.IDHSTFOLHABENEF = 226)                                AND'
      '  1 = 2 AND'
      '  (R.IDTITULAR         = HRS.IDTITULAR)                      AND'
      '  (R.IDFAVORECIDO      = HRS.IDRESPONSAVEL)                  AND'
      '  (EL.IDPESSJUR        = HRS.IDPATRO)                        AND'
      '  (EL.IDPESSOA         = HRS.IDTITULAR)                      AND'
      '  (PPP.IDPESSJUR       = HRS.IDPATRO)                        AND'
      '  (PPP.IDPESSOA        = HRS.IDTITULAR)                      AND'
      '  (PPP.IDPLANOPREV     = HRS.IDPLANOPREV)                    AND'
      '  (HRS.IDRUBRICA       = PV.IDPROVENTO)                      AND'
      '  (PV.FLGDESCONTO     IN (0,1))                              AND'
      '  (HRS.CODPORTFORMA    = PTF.CODPORTFORMA(+))                AND'
      '  (RTRIM(HRS.NUMBANCO) = BC.NUMBANCO(+))                     AND'
      '  (HRS.NUMAGENCIA      = AG.NUMAGENCIA(+))                   AND'
      '  (PA.IDPESSOA         = AG.IDPESSOA OR AG.IDPESSOA IS NULL) AND'
      '  (AG.IDBANCO          = PB.IDPESSOA OR AG.IDBANCO  IS NULL) AND'
      '  (PB.IDPESSOA(+)      = BC.IDPESSOA)                        AND'
      '  (PEN.IDPESSOA        = HRS.IDRESPONSAVEL)                  AND'
      '  (PJ.IDPESSOA         = HRS.IDPATRO)'
      ''
      'GROUP BY'
      '  HRS.CODDOCUMENTO,'
      '  HRS.MESCOBRANCA,'
      '  PEN.NOME,'
      '  PEN.NUMDOCUMENTO,'
      '  PJ.NOME,'
      '  HRS.NUMBANCO,'
      '  PB.NOME,'
      '  HRS.NUMAGENCIA,'
      '  PA.NOME,'
      '  HRS.CONTACORRENTE,'
      '  PTF.DESCRICAO,'
      '  PPP.INSCRICAONUMERO,'
      '  EL.MATRICULA'
      ''
      'ORDER BY'
      '  HRS.CODDOCUMENTO,'
      '  HRS.NUMBANCO,'
      '  HRS.NUMAGENCIA,'
      '  PEN.NOME'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 122
    Top = 511
  end
  object dsRelPensBanco: TwwDataSource
    DataSet = qryRelPensBanco
    Left = 122
    Top = 467
  end
  object ppRelPensBanco: TppBDEPipeline
    DataSource = dsRelPensBanco
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'RelPensBanco'
    Left = 122
    Top = 425
  end
  object qryRelPensAlim: TwwQuery
    BeforeOpen = qryRelPensAlimBeforeOpen
    AfterOpen = qryRelPensAlimAfterOpen
    AfterClose = qryRelPensAlimAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      SUM(DECODE(PV.FLGDESCONTO, 0, HRS.VALORPROVENTO, 1, (-1)*H' +
        'RS.VALORPROVENTO)) AS VALOR,'
      '      PPP.INSCRICAONUMERO,'
      '      EL.MATRICULA,'
      '      PEN.NOME AS PENSIONISTA,'
      '      PEN.NUMDOCUMENTO AS CPF,'
      '      PJ.NOME AS PATROCINADORA,'
      '      HRS.NUMBANCO,'
      '      PB.NOME AS BANCO,'
      '      HRS.NUMAGENCIA,'
      '      PA.NOME AS AGENCIA,'
      '      HRS.CONTACORRENTE,'
      '      PTF.DESCRICAO '
      'FROM'
      '      HISTRUBSAL HRS,'
      '      PROVDESC PV,'
      '      ELEGPATRO EL,'
      '      PARTPREVPLAN PPP,'
      '      PORTADORFORMA PTF,'
      '      AGENCIABANCARIA AG,'
      '      BANCO BC,'
      '      PESSOA PA,'
      '      PESSOA PB,'
      '      PESSOA PJ,'
      '      PESSOA PEN,'
      '('
      '      SELECT'
      '             DISTINCT IDTITULAR,'
      '             IDFAVORECIDO'
      '      FROM'
      '      RUBRICAINDIV'
      'WHERE (FLGPENSAOALIM = 1)'
      '      AND (FLGTPRUBMANUT = '#39'1'#39')) R'
      'WHERE'
      '(HRS.IDPATRO = 2003)'
      'AND'
      ' (HRS.IDHSTFOLHABENEF = 222)'
      'AND 1 = 2 '
      'AND (R.IDTITULAR = HRS.IDTITULAR) '
      'AND (R.IDFAVORECIDO = HRS.IDRESPONSAVEL) '
      'AND (EL.IDPESSJUR = HRS.IDPATRO) '
      'AND (EL.IDPESSOA = HRS.IDTITULAR) '
      'AND (PPP.IDPESSJUR = HRS.IDPATRO) '
      'AND (PPP.IDPESSOA = HRS.IDTITULAR) '
      'AND (PPP.IDPLANOPREV = HRS.IDPLANOPREV) '
      'AND (HRS.IDRUBRICA = PV.IDPROVENTO) '
      '      AND (PV.FLGDESCONTO IN (0,'
      '1)) '
      'AND (HRS.CODPORTFORMA = PTF.CODPORTFORMA(+)) '
      'AND (RTRIM(HRS.NUMBANCO) = BC.NUMBANCO(+)) '
      'AND (HRS.NUMAGENCIA = AG.NUMAGENCIA(+)) '
      'AND (PA.IDPESSOA = AG.IDPESSOA'
      'OR AG.IDPESSOA IS NULL) '
      'AND (AG.IDBANCO = PB.IDPESSOA'
      'OR AG.IDBANCO IS NULL) '
      'AND (PB.IDPESSOA(+) = BC.IDPESSOA) '
      'AND (PEN.IDPESSOA = HRS.IDRESPONSAVEL) '
      '      AND (PJ.IDPESSOA = HRS.IDPATRO) '
      '      GROUP BY PPP.INSCRICAONUMERO,'
      '      EL.MATRICULA,'
      '      PEN.NOME,'
      '      PEN.NUMDOCUMENTO,'
      '      PJ.NOME,'
      '      HRS.NUMBANCO,'
      '      PB.NOME,'
      '      HRS.NUMAGENCIA,'
      '      PA.NOME,'
      '      HRS.CONTACORRENTE,'
      'PTF.DESCRICAO '
      'ORDER BY PJ.NOME,'
      'PEN.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 210
    Top = 511
  end
  object dsRelPensAlim: TwwDataSource
    DataSet = qryRelPensAlim
    Left = 210
    Top = 467
  end
  object ppRelPensAlim: TppBDEPipeline
    DataSource = dsRelPensAlim
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'RelPensAlim'
    Left = 210
    Top = 425
  end
  object rpRelPensAlim: TppReport
    AutoStop = False
    DataPipeline = ppRelPensAlim
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Pensão Alimentícia por Favorecidos'
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
    Left = 210
    Top = 381
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppRelPensAlim'
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 52388
      mmPrintPosition = 0
      object ppLabel69: TppLabel
        UserName = 'ppLabel69'
        Caption = 'Relatório de Pensão Alimentícia por Favorecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 94721
        mmTop = 20902
        mmWidth = 96573
        BandType = 0
      end
      object ppLine30: TppLine
        UserName = 'ppLine30'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'ppLabel73'
        Caption = 'Folha Versão: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 28840
        mmWidth = 24342
        BandType = 0
      end
      object ppLine32: TppLine
        UserName = 'ppLine32'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 33867
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'ppLabel71'
        Caption = 'Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 529
        mmTop = 34660
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'ppLabel72'
        Caption = 'Nome do Pensionista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 21960
        mmTop = 34660
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'ppLabel74'
        Caption = 'C.P.F'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 21960
        mmTop = 38894
        mmWidth = 9260
        BandType = 0
      end
      object rpRelFolhaPenAlimLabel1: TppLabel
        UserName = 'rpRelFolhaPenAlimLabel1'
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 136261
        mmTop = 38894
        mmWidth = 10054
        BandType = 0
      end
      object rpRelFolhaPenAlimLabel2: TppLabel
        UserName = 'rpRelFolhaPenAlimLabel2'
        Caption = 'Agência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 136261
        mmTop = 43127
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'ppLabel75'
        Caption = 'Conta Corrente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 136261
        mmTop = 47361
        mmWidth = 24077
        BandType = 0
      end
      object rpRelFolhaPenAlimLine1: TppLine
        UserName = 'rpRelFolhaPenAlimLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 51858
        mmWidth = 284300
        BandType = 0
      end
      object rpRelPensAlimDBText1: TppDBText
        UserName = 'rpRelPensAlimDBText1'
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
        mmLeft = 36248
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object rpRelPensAlimDBText2: TppDBText
        UserName = 'rpRelPensAlimDBText2'
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
        mmLeft = 36248
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpRelPensAlimDBText3: TppDBText
        UserName = 'rpRelPensAlimDBText3'
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
        mmLeft = 36248
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object rpRelPensAlimDBImage1: TppDBImage
        UserName = 'rpRelPensAlimDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 32279
        BandType = 0
      end
      object rpRelPensAlimDBText4: TppDBText
        UserName = 'rpRelPensAlimDBText4'
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
        mmLeft = 36248
        mmTop = 12171
        mmWidth = 15875
        BandType = 0
      end
      object rpRelPensAlimDBText5: TppDBText
        UserName = 'rpRelPensAlimDBText5'
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
        mmLeft = 36248
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'ppLabel76'
        Caption = 'Valor da Pensão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 249238
        mmTop = 47096
        mmWidth = 26194
        BandType = 0
      end
      object lblFolha: TppLabel
        UserName = 'lblFolha'
        AutoSize = False
        Caption = 'lblFolha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 28840
        mmWidth = 105569
        BandType = 0
      end
      object rpRelPensAlimLabel1: TppLabel
        UserName = 'rpRelPensAlimLabel1'
        Caption = 'Patrocinadora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 137054
        mmTop = 28840
        mmWidth = 25135
        BandType = 0
      end
      object lblpatro: TppLabel
        UserName = 'lblpatro'
        AutoSize = False
        Caption = 'LBLPATRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 162190
        mmTop = 28840
        mmWidth = 18521
        BandType = 0
      end
      object ppLblMatricula: TppLabel
        UserName = 'LblMatricula'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 529
        mmTop = 38894
        mmWidth = 14552
        BandType = 0
      end
      object ppLblPortadorForma: TppLabel
        UserName = 'LblPortadorForma'
        Caption = 'Portador Forma'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 136261
        mmTop = 34660
        mmWidth = 24871
        BandType = 0
      end
    end
    object ppDetailBand15: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppDBText17: TppDBText
        UserName = 'ppDBText17'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppRelPensAlim
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensAlim'
        mmHeight = 4233
        mmLeft = 794
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'ppDBText19'
        DataField = 'PENSIONISTA'
        DataPipeline = ppRelPensAlim
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensAlim'
        mmHeight = 4233
        mmLeft = 21960
        mmTop = 0
        mmWidth = 106363
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'ppDBText20'
        DataField = 'CPF'
        DataPipeline = ppRelPensAlim
        DisplayFormat = '!999.999.999-99;0;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensAlim'
        mmHeight = 4233
        mmLeft = 21960
        mmTop = 3969
        mmWidth = 38629
        BandType = 4
      end
      object rpRelFolhaPenAlimDBText1: TppDBText
        UserName = 'rpRelFolhaPenAlimDBText1'
        DataField = 'NUMBANCO'
        DataPipeline = ppRelPensAlim
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensAlim'
        mmHeight = 4233
        mmLeft = 137054
        mmTop = 3704
        mmWidth = 9525
        BandType = 4
      end
      object rpRelFolhaPenAlimLabel3: TppLabel
        UserName = 'rpRelFolhaPenAlimLabel3'
        Caption = ' - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 146844
        mmTop = 3704
        mmWidth = 3175
        BandType = 4
      end
      object rpRelFolhaPenAlimDBText2: TppDBText
        UserName = 'rpRelFolhaPenAlimDBText2'
        DataField = 'BANCO'
        DataPipeline = ppRelPensAlim
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensAlim'
        mmHeight = 4233
        mmLeft = 150284
        mmTop = 3704
        mmWidth = 125148
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'ppDBText23'
        DataField = 'NUMAGENCIA'
        DataPipeline = ppRelPensAlim
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensAlim'
        mmHeight = 4233
        mmLeft = 137054
        mmTop = 7673
        mmWidth = 13494
        BandType = 4
      end
      object ppLabel77: TppLabel
        UserName = 'ppLabel77'
        Caption = ' - '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 150813
        mmTop = 7673
        mmWidth = 3175
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'ppDBText24'
        DataField = 'AGENCIA'
        DataPipeline = ppRelPensAlim
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensAlim'
        mmHeight = 4233
        mmLeft = 154517
        mmTop = 7673
        mmWidth = 120915
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'ppDBText21'
        DataField = 'CONTACORRENTE'
        DataPipeline = ppRelPensAlim
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensAlim'
        mmHeight = 4233
        mmLeft = 137054
        mmTop = 11642
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'MATRICULA'
        DataPipeline = ppRelPensAlim
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensAlim'
        mmHeight = 4498
        mmLeft = 794
        mmTop = 3969
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText38'
        DataField = 'DESCRICAO'
        DataPipeline = ppRelPensAlim
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensAlim'
        mmHeight = 3969
        mmLeft = 137054
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText1'
        DataField = 'VALOR'
        DataPipeline = ppRelPensAlim
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRelPensAlim'
        mmHeight = 4233
        mmLeft = 251619
        mmTop = 11642
        mmWidth = 23813
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppCalc26: TppSystemVariable
        UserName = 'Calc26'
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
        mmTop = 2910
        mmWidth = 274638
        BandType = 8
      end
      object ppLabel78: TppLabel
        UserName = 'ppLabel78'
        AutoSize = False
        Caption = '   Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 2910
        mmWidth = 274638
        BandType = 8
      end
      object ppLine31: TppLine
        UserName = 'ppLine31'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc25: TppSystemVariable
        UserName = 'Calc25'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 247915
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpRelFolhaPenAlimSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 8202
      mmPrintPosition = 0
      object rpRelFolhaPenAlimLabel5: TppLabel
        UserName = 'rpRelFolhaPenAlimLabel5'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 248444
        mmTop = 1588
        mmWidth = 9260
        BandType = 7
      end
      object rpRelFolhaPenAlimDBCalc1: TppDBCalc
        UserName = 'rpRelFolhaPenAlimDBCalc1'
        DataField = 'VALOR'
        DataPipeline = ppRelPensAlim
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRelPensAlim'
        mmHeight = 4233
        mmLeft = 259821
        mmTop = 1588
        mmWidth = 15875
        BandType = 7
      end
      object rpRelFPenAlimLine1: TppLine
        UserName = 'rpRelFPenAlimLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 7
      end
    end
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = dsCredBenef
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'BDEPipeline1'
    Left = 369
    Top = 142
  end
  object dsCredBenef: TwwDataSource
    DataSet = qryCredBenef
    Left = 397
    Top = 142
  end
  object qryCredBenef: TwwQuery
    BeforeOpen = qryCredBenefBeforeOpen
    AfterOpen = qryCredBenefAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       DECODE(TDRP.DESCRICAO,NULL,'#39'DOC. NÃO CADASTRADO !'#39',TDRP.D' +
        'ESCRICAO) AS DOCUMENTO,'
      '       PJR.NOME       AS PATROCINADORA,'
      '       BAN.NOME       AS BANCO        ,'
      '       BC.NUMBANCO                    ,'
      '       AGE.NOME       AS AGENCIA      ,'
      '       AG.NUMAGENCIA                  ,'
      '       BEN.NUMDOCUMENTO               ,'
      '       BEN.NOME                       ,'
      '       POF.DESCRICAO  AS BANCOPAGADOR ,'
      '       HST.DATAPAGAMENTO              ,'
      '       HST.MESCOBRANCA                ,'
      '       HST.CODDOCUMENTO               ,'
      '       ELP.MATRICULA                  ,'
      '       CB.CONTACORRENTE               ,'
      '       BANP.NOME      AS NOMEBANCOPAG ,'
      '       AGEP.NOME      AS NOMEAGENCPAG ,'
      '       AGP.NUMAGENCIA AS NUMAGENCIAPAG,'
      '       BCPAG.NUMBANCO AS NUMBANCOPAG  ,'
      '       POC.NOCONTACORR                ,'
      
        '       SUM(DECODE(PRD.FLGDESCONTO,0,DECODE(PRD.FLGESPECIAL,0,HST' +
        '.VALORPROVENTO,0),DECODE(PRD.FLGESPECIAL,0,HST.VALORPROVENTO*-1,' +
        '0))) SUMLIQ'
      'FROM'
      
        '     HISTRUBSAL    HST, CONTABANCARIA CB , PROVDESC      PRD  , ' +
        'ELEGPATRO       ELP ,'
      
        '     PESSOA        BEN, PESSOAFISICA  PF , BANCO         BC   , ' +
        'AGENCIABANCARIA AG  ,'
      
        '     DOCUMENTO     DC , PORTADORFORMA POF, PORTADORCONTA POC  , ' +
        'PESSOA          BANP,'
      
        '     PESSOA        PJR, PESSOA        AGE, BANCO         BCPAG, ' +
        'AGENCIABANCARIA AGP ,'
      
        '     BENEFPLANPREV BPP, PESSOA        FUN, PESSOA        BAN  , ' +
        'PESSOA          AGEP,'
      '     TIPODOCRECPAG TDRP'
      'WHERE'
      '      (HST.IDHSTFOLHABENEF = 63) AND'
      '      1 = 2 AND '
      '      (PRD.FLGESPECIAL  <> 2)                 AND'
      '      (CB.FLGCONTAPREF  = 1)                  AND'
      '      (PF.IDPESSOA      = BEN.IDPESSOA)       AND'
      '      (PRD.IDPROVENTO   = HST.IDRUBRICA)      AND'
      '      (ELP.IDPESSJUR    = HST.IDPATRO)        AND'
      '      (ELP.IDPESSOA     = HST.IDPESSOA)       AND'
      '      (FUN.IDPESSOA     = HST.IDPESSJUR)      AND'
      '      (PJR.IDPESSOA     = HST.IDPATRO)        AND'
      '      (BEN.IDPESSOA     = HST.IDPESSOA)       AND'
      '      (DC.CODPORTFORMA  = POF.CODPORTFORMA)   AND'
      '      (HST.CODDOCUMENTO = DC.CODDOCUMENTO)    AND'
      '      (PF.IDPESSOA      = BPP.IDPESSOA(+))    AND'
      '      (BPP.CODTIPDOC    = TDRP.CODTIPDOC(+))  AND'
      '      (HST.IDPESSOA     = CB.IDPESSOA(+))     AND'
      '      (CB.IDAGENCIA     = AG.IDPESSOA(+))     AND'
      '      (AG.IDBANCO       = BC.IDPESSOA(+))     AND'
      '      (AG.IDPESSOA      = AGE.IDPESSOA(+))    AND'
      '      (BC.IDPESSOA      = BAN.IDPESSOA(+))    AND'
      '      (POF.CODPORTADOR  = POC.CODPORTADOR(+)) AND'
      '      (POC.IDBANCO      = BANP.IDPESSOA(+))   AND'
      '      (POC.IDAGENCIA    = AGEP.IDPESSOA(+))   AND'
      '      (POC.IDBANCO      = BCPAG.IDPESSOA(+))  AND'
      '      (POC.IDAGENCIA    = AGP.IDPESSOA(+))'
      
        'GROUP BY HST.CODDOCUMENTO, POF.DESCRICAO  , BAN.NOME      , AGE.' +
        'NOME        , HST.DATAPAGAMENTO,'
      
        '         HST.MESCOBRANCA , ELP.MATRICULA  , PJR.NOME      , BEN.' +
        'NUMDOCUMENTO, BEN.NOME         ,'
      
        '         CB.CONTACORRENTE, AG.NUMAGENCIA  , BC.NUMBANCO   , BANP' +
        '.NOME       , AGEP.NOME        ,'
      
        '         BCPAG.NUMBANCO  , POC.NOCONTACORR, AGP.NUMAGENCIA, TDRP' +
        '.DESCRICAO'
      'ORDER BY TDRP.DESCRICAO, PJR.NOME  , BC.NUMBANCO, AG.NUMAGENCIA'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 426
    Top = 142
  end
  object ppCredBenefAgen: TppBDEPipeline
    DataSource = dsCredBenefAgen
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'CredBenefAgen'
    Left = 490
    Top = 425
    object ppCredBenefAgenppField1: TppField
      FieldAlias = 'CODPORTFORMA'
      FieldName = 'CODPORTFORMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppCredBenefAgenppField2: TppField
      FieldAlias = 'CENTRALIZA'
      FieldName = 'CENTRALIZA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppCredBenefAgenppField3: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppCredBenefAgenppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppCredBenefAgenppField5: TppField
      FieldAlias = 'AGENCIA'
      FieldName = 'AGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppCredBenefAgenppField6: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppCredBenefAgenppField7: TppField
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppCredBenefAgenppField8: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppCredBenefAgenppField9: TppField
      FieldAlias = 'NOCONTACORR'
      FieldName = 'NOCONTACORR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
  end
  object rpCredBenef: TppReport
    AutoStop = False
    DataPipeline = ppCredBenef
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relação de Pagamento de Benefícios - por Beneficiário'
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 341
    Top = 142
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppCredBenef'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 41540
      mmPrintPosition = 0
      object ppLabel45: TppLabel
        UserName = 'ppLabel45'
        Caption = 'Relação de Pagamento de Benefícios - por Beneficiário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 33602
        mmTop = 28046
        mmWidth = 129911
        BandType = 0
      end
      object rpCredBenefLabel9: TppLabel
        UserName = 'rpCredBenefLabel9'
        Caption = 'rpCredBenefLabel9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 34396
        mmWidth = 60854
        BandType = 0
      end
      object rpCredBenefDBText10: TppDBText
        UserName = 'rpCredBenefDBText10'
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
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object rpCredBenefDBText13: TppDBText
        UserName = 'rpCredBenefDBText13'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpCredBenefDBText14: TppDBText
        UserName = 'rpCredBenefDBText14'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object rpCredBenefDBImage1: TppDBImage
        UserName = 'rpCredBenefDBImage1'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object rpCredBenefDBText15: TppDBText
        UserName = 'rpCredBenefDBText15'
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
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object rpCredBenefDBText16: TppDBText
        UserName = 'rpCredBenefDBText16'
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
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14552
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object rpCredBenefDBText5: TppDBText
        UserName = 'rpCredBenefDBText5'
        DataField = 'CONTACORRENTE'
        DataPipeline = ppCredBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCredBenef'
        mmHeight = 3704
        mmLeft = 144463
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object rpCredBenefDBText2: TppDBText
        UserName = 'rpCredBenefDBText2'
        DataField = 'MATRICULA'
        DataPipeline = ppCredBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCredBenef'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object rpCredBenefDBText3: TppDBText
        UserName = 'rpCredBenefDBText3'
        CharWrap = True
        DataField = 'NUMDOCUMENTO'
        DataPipeline = ppCredBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCredBenef'
        mmHeight = 3704
        mmLeft = 116681
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object rpCredBenefDBText4: TppDBText
        UserName = 'rpCredBenefDBText4'
        DataField = 'SUMLIQ'
        DataPipeline = ppCredBenef
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCredBenef'
        mmHeight = 3704
        mmLeft = 171980
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object rpCredBenefDBText1: TppDBText
        UserName = 'rpCredBenefDBText1'
        DataField = 'NOME'
        DataPipeline = ppCredBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCredBenef'
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 0
        mmWidth = 76729
        BandType = 4
      end
      object rpCredBenefDBText18: TppDBText
        UserName = 'rpCredBenefDBText18'
        DataField = 'NUMSEQUENCIA'
        DataPipeline = ppCredBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCredBenef'
        mmHeight = 3704
        mmLeft = 25665
        mmTop = 0
        mmWidth = 3969
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 19844
      mmPrintPosition = 0
      object rpCredBenefLine7: TppLine
        UserName = 'rpCredBenefLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197300
        BandType = 8
      end
      object rpCredBenefLabel16: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'rpCredBenefLabel16'
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
        mmTop = 4498
        mmWidth = 197909
        BandType = 8
      end
      object rpCredBenefCalc1: TppSystemVariable
        UserName = 'rpCredBenefCalc1'
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
        mmTop = 4498
        mmWidth = 197380
        BandType = 8
      end
      object rpCredBenefCalc2: TppSystemVariable
        UserName = 'rpCredBenefCalc2'
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
        mmTop = 4498
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpCredBenefSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object rpCredBenefLabel14: TppLabel
        UserName = 'rpCredBenefLabel14'
        AutoSize = False
        Caption = 'Total Geral :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 128323
        mmTop = 1323
        mmWidth = 20638
        BandType = 7
      end
      object rpCredBenefDBCalc5: TppDBCalc
        UserName = 'rpCredBenefDBCalc5'
        DataField = 'SUMLIQ'
        DataPipeline = ppCredBenef
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCredBenef'
        mmHeight = 3704
        mmLeft = 149754
        mmTop = 1323
        mmWidth = 45773
        BandType = 7
      end
      object rpCredBenefDBCalc4: TppDBCalc
        UserName = 'rpCredBenefDBCalc4'
        DataPipeline = ppCredBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppCredBenef'
        mmHeight = 3704
        mmLeft = 20638
        mmTop = 1323
        mmWidth = 21960
        BandType = 7
      end
      object rpCredBenefLabel13: TppLabel
        UserName = 'rpCredBenefLabel13'
        Caption = 'Quantidade -'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 1323
        mmWidth = 18256
        BandType = 7
      end
      object rpCredBenefLine8: TppLine
        UserName = 'rpCredBenefLine8'
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 265
        mmWidth = 197380
        BandType = 7
      end
      object rpCredBenefSubReport1: TppSubReport
        UserName = 'rpCredBenefSubReport1'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        TraverseAllData = False
        DataPipelineName = 'ppCredBenefBeneficio'
        mmHeight = 4763
        mmLeft = 0
        mmTop = 6350
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpCredBenefChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppCredBenefBeneficio
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relação de Pagamento de Benefícios - por Beneficiário'
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
          Units = utMillimeters
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppCredBenefBeneficio'
          object rpCredBenefChildReport1HeaderBand1: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 37835
            mmPrintPosition = 0
            object rpCredBenefChildReport1Label1: TppLabel
              UserName = 'rpCredBenefChildReport1Label1'
              Caption = 'Resumo de Valores Pagos por Benefício'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 5027
              mmLeft = 57150
              mmTop = 29369
              mmWidth = 81492
              BandType = 0
            end
            object rpCredBenefChildReport1Label2: TppLabel
              UserName = 'rpCredBenefChildReport1Label2'
              Caption = 'Benefício'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 10000
              mmTop = 31750
              mmWidth = 15875
              BandType = 0
            end
            object rpCredBenefChildReport1Label3: TppLabel
              UserName = 'rpCredBenefChildReport1Label3'
              Caption = 'Valores'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 4233
              mmLeft = 168805
              mmTop = 32279
              mmWidth = 12700
              BandType = 0
            end
            object rpCredBenefChildReport1Line1: TppLine
              UserName = 'rpCredBenefChildReport1Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1058
              mmLeft = 0
              mmTop = 36777
              mmWidth = 197300
              BandType = 0
            end
            object rpCredBenefChildReport1DBText3: TppDBText
              UserName = 'rpCredBenefChildReport1DBText3'
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
              mmLeft = 45508
              mmTop = 3175
              mmWidth = 150284
              BandType = 0
            end
            object rpCredBenefChildReport1DBText4: TppDBText
              UserName = 'rpCredBenefChildReport1DBText4'
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
              mmTop = 22490
              mmWidth = 17198
              BandType = 0
            end
            object rpCredBenefChildReport1DBText5: TppDBText
              UserName = 'rpCredBenefChildReport1DBText5'
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
              mmLeft = 45508
              mmTop = 9790
              mmWidth = 25400
              BandType = 0
            end
            object rpCredBenefChildReport1DBImage1: TppDBImage
              UserName = 'rpCredBenefChildReport1DBImage1'
              MaintainAspectRatio = True
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
            object rpCredBenefChildReport1DBText6: TppDBText
              UserName = 'rpCredBenefChildReport1DBText6'
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
              mmTop = 14288
              mmWidth = 16140
              BandType = 0
            end
            object rpCredBenefChildReport1DBText7: TppDBText
              UserName = 'rpCredBenefChildReport1DBText7'
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
              mmTop = 18256
              mmWidth = 14552
              BandType = 0
            end
          end
          object rpCredBenefChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object rpCredBenefChildReport1DBText1: TppDBText
              UserName = 'rpCredBenefChildReport1DBText1'
              DataField = 'VLBENEFPGTO'
              DataPipeline = ppCredBenefBeneficio
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppCredBenefBeneficio'
              mmHeight = 4233
              mmLeft = 151607
              mmTop = 0
              mmWidth = 29898
              BandType = 4
            end
            object rpCredBenefChildReport1DBText2: TppDBText
              UserName = 'rpCredBenefChildReport1DBText2'
              DataField = 'NOME'
              DataPipeline = ppCredBenefBeneficio
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppCredBenefBeneficio'
              mmHeight = 4233
              mmLeft = 10054
              mmTop = 0
              mmWidth = 139700
              BandType = 4
            end
          end
          object rpCredBenefChildReport1FooterBand1: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 4763
            mmPrintPosition = 0
            object rpCredBenefChildReport1Line2: TppLine
              UserName = 'rpCredBenefChildReport1Line2'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 0
              mmWidth = 197300
              BandType = 8
            end
            object rpCredBenefChildReport1Label5: TppLabel
              OnPrint = LblSistemaPrint
              UserName = 'rpCredBenefChildReport1Label5'
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
              mmTop = 1058
              mmWidth = 197909
              BandType = 8
            end
            object rpCredBenefChildReport1Calc1: TppSystemVariable
              UserName = 'rpCredBenefChildReport1Calc1'
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
              mmTop = 1058
              mmWidth = 197380
              BandType = 8
            end
            object rpCredBenefChildReport1Calc2: TppSystemVariable
              UserName = 'rpCredBenefChildReport1Calc2'
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
              mmTop = 1058
              mmWidth = 26194
              BandType = 8
            end
          end
          object rpCredBenefChildReport1Group1: TppGroup
            BreakName = 'NOME'
            DataPipeline = ppCredBenefBeneficio
            OutlineSettings.CreateNode = True
            UserName = 'rpCredBenefChildReport1Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppCredBenefBeneficio'
            object rpCredBenefChildReport1GroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object rpCredBenefChildReport1GroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 6085
              mmPrintPosition = 0
              object rpCredBenefChildReport1Label4: TppLabel
                UserName = 'rpCredBenefChildReport1Label4'
                Caption = 'Total do Banco :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 122502
                mmTop = 1852
                mmWidth = 27517
                BandType = 5
                GroupNo = 0
              end
              object rpCredBenefChildReport1Line3: TppLine
                UserName = 'rpCredBenefChildReport1Line3'
                ParentWidth = True
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 0
                mmTop = 0
                mmWidth = 197300
                BandType = 5
                GroupNo = 0
              end
              object rpdbcalctotbenef: TppDBCalc
                UserName = 'rpdbcalctotbenef'
                DataField = 'VLBENEFPGTO'
                DataPipeline = ppCredBenefBeneficio
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                ResetGroup = rpCredBenefChildReport1Group1
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppCredBenefBeneficio'
                mmHeight = 4233
                mmLeft = 151871
                mmTop = 1852
                mmWidth = 29633
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
    end
    object rpCredBenefGroup3: TppGroup
      BreakName = 'DOCUMENTO'
      DataPipeline = ppCredBenef
      OutlineSettings.CreateNode = True
      UserName = 'rpCredBenefGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppCredBenef'
      object rpCredBenefGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object rpCredBenefDBText19: TppDBText
          UserName = 'rpCredBenefDBText19'
          AutoSize = True
          DataField = 'DOCUMENTO'
          DataPipeline = ppCredBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCredBenef'
          mmHeight = 3969
          mmLeft = 28840
          mmTop = 1058
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object rpCredBenefLabel10: TppLabel
          UserName = 'rpCredBenefLabel10'
          Caption = 'Documento :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 6879
          mmTop = 1058
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpCredBenefLine10: TppLine
          UserName = 'rpCredBenefLine10'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object rpCredBenefGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpCredBenefGroup5: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppCredBenef
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpCredBenefGroup5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppCredBenef'
      object rpCredBenefGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object rpCredBenefDBText17: TppDBText
          UserName = 'rpCredBenefDBText17'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = ppCredBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCredBenef'
          mmHeight = 3969
          mmLeft = 28840
          mmTop = 0
          mmWidth = 30692
          BandType = 3
          GroupNo = 1
        end
        object rpCredBenefLabel17: TppLabel
          UserName = 'rpCredBenefLabel17'
          Caption = 'Patrocinadora :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 0
          mmWidth = 25929
          BandType = 3
          GroupNo = 1
        end
      end
      object rpCredBenefGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpCredBenefGroup4: TppGroup
      BreakName = 'BANCOPAGADOR'
      DataPipeline = ppCredBenef
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpCredBenefGroup4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppCredBenef'
      object rpCredBenefGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object rpCredBenefDBText11: TppDBText
          UserName = 'rpCredBenefDBText11'
          AutoSize = True
          DataField = 'BANCOPAGADOR'
          DataPipeline = ppCredBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCredBenef'
          mmHeight = 3969
          mmLeft = 28840
          mmTop = 0
          mmWidth = 30163
          BandType = 3
          GroupNo = 1
        end
        object rpCredBenefLabel18: TppLabel
          UserName = 'rpCredBenefLabel18'
          Caption = 'Banco Pagador:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 0
          mmWidth = 26988
          BandType = 3
          GroupNo = 2
        end
      end
      object rpCredBenefGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object rpCredBenefDBCalc6: TppDBCalc
          UserName = 'rpCredBenefDBCalc6'
          DataField = 'SUMLIQ'
          DataPipeline = ppCredBenef
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpCredBenefGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCredBenef'
          mmHeight = 3704
          mmLeft = 151342
          mmTop = 2646
          mmWidth = 44186
          BandType = 5
          GroupNo = 1
        end
        object rpCredBenefLabel12: TppLabel
          UserName = 'rpCredBenefLabel12'
          AutoSize = False
          Caption = 'Total Banco Pagador :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 2646
          mmWidth = 31750
          BandType = 5
          GroupNo = 1
        end
        object rpCredBenefDBText12: TppDBText
          UserName = 'rpCredBenefDBText12'
          DataField = 'BANCOPAGADOR'
          DataPipeline = ppCredBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppCredBenef'
          mmHeight = 3704
          mmLeft = 33867
          mmTop = 2646
          mmWidth = 113771
          BandType = 5
          GroupNo = 1
        end
        object rpCredBenefLine3: TppLine
          UserName = 'rpCredBenefLine3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 2117
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object rpCredBenefGroup2: TppGroup
      BreakName = 'NUMBANCO'
      DataPipeline = ppCredBenef
      OutlineSettings.CreateNode = True
      UserName = 'rpCredBenefGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppCredBenef'
      object rpCredBenefGroupHeaderBand2: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object NUMBANCO: TppDBText
          UserName = 'NUMBANCO'
          AutoSize = True
          DataField = 'NUMBANCO'
          DataPipeline = ppCredBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCredBenef'
          mmHeight = 3969
          mmLeft = 29104
          mmTop = 3175
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object rpCredBenefDBText9: TppDBText
          UserName = 'rpCredBenefDBText9'
          AutoSize = True
          DataField = 'BANCO'
          DataPipeline = ppCredBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCredBenef'
          mmHeight = 3969
          mmLeft = 37571
          mmTop = 3175
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object rpCredBenefLabel15: TppLabel
          UserName = 'rpCredBenefLabel15'
          Caption = '-'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 35454
          mmTop = 3175
          mmWidth = 5821
          BandType = 3
          GroupNo = 1
        end
        object rpCredBenefLabel19: TppLabel
          UserName = 'rpCredBenefLabel19'
          Caption = 'Banco :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 15346
          mmTop = 3175
          mmWidth = 12700
          BandType = 3
          GroupNo = 3
        end
        object rpCredBenefLine9: TppLine
          UserName = 'rpCredBenefLine9'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 2117
          mmLeft = 0
          mmTop = 1058
          mmWidth = 197380
          BandType = 3
          GroupNo = 3
        end
      end
      object rpCredBenefGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object rpCredBenefLabel8: TppLabel
          UserName = 'rpCredBenefLabel8'
          Caption = 'Total Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 107421
          mmTop = 794
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
        end
        object rpCredBenefDBCalc2: TppDBCalc
          UserName = 'rpCredBenefDBCalc2'
          DataField = 'SUMLIQ'
          DataPipeline = ppCredBenef
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpCredBenefGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCredBenef'
          mmHeight = 3704
          mmLeft = 170127
          mmTop = 794
          mmWidth = 25400
          BandType = 5
          GroupNo = 1
        end
        object rpCredBenefLine6: TppLine
          UserName = 'rpCredBenefLine6'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 265
          mmWidth = 197380
          BandType = 5
          GroupNo = 1
        end
        object rpCredBenefDBText8: TppDBText
          UserName = 'rpCredBenefDBText8'
          DataField = 'BANCO'
          DataPipeline = ppCredBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCredBenef'
          mmHeight = 3704
          mmLeft = 126471
          mmTop = 794
          mmWidth = 43127
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object rpCredBenefGroup1: TppGroup
      BreakName = 'AGENCIA'
      DataPipeline = ppCredBenef
      OutlineSettings.CreateNode = True
      UserName = 'rpCredBenefGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppCredBenef'
      object rpCredBenefGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object rpCredBenefDBText6: TppDBText
          UserName = 'rpCredBenefDBText6'
          DataField = 'NUMAGENCIA'
          DataPipeline = ppCredBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCredBenef'
          mmHeight = 4233
          mmLeft = 18256
          mmTop = 1852
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object rpCredBenefLabel6: TppLabel
          UserName = 'rpCredBenefLabel6'
          Caption = 'Agência :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 1852
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpCredBenefLine2: TppLine
          UserName = 'rpCredBenefLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 10848
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object rpCredBenefDBText7: TppDBText
          UserName = 'rpCredBenefDBText7'
          AutoSize = True
          DataField = 'AGENCIA'
          DataPipeline = ppCredBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppCredBenef'
          mmHeight = 3969
          mmLeft = 36248
          mmTop = 1852
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object rpCredBenefLabel2: TppLabel
          UserName = 'rpCredBenefLabel2'
          Caption = 'Matricula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1058
          mmTop = 7408
          mmWidth = 13229
          BandType = 3
          GroupNo = 4
        end
        object rpCredBenefLabel1: TppLabel
          UserName = 'rpCredBenefLabel1'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 35454
          mmTop = 7408
          mmWidth = 17198
          BandType = 3
          GroupNo = 4
        end
        object rpCredBenefLabel3: TppLabel
          UserName = 'rpCredBenefLabel3'
          Caption = 'CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 133086
          mmTop = 7144
          mmWidth = 5556
          BandType = 3
          GroupNo = 4
        end
        object rpCredBenefLabel5: TppLabel
          UserName = 'rpCredBenefLabel5'
          Caption = 'Conta Corrente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 7144
          mmWidth = 22490
          BandType = 3
          GroupNo = 4
        end
        object rpCredBenefLabel7: TppLabel
          UserName = 'rpCredBenefLabel7'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 187855
          mmTop = 7144
          mmWidth = 7673
          BandType = 3
          GroupNo = 4
        end
        object rpCredBenefLine1: TppLine
          UserName = 'rpCredBenefLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197300
          BandType = 3
          GroupNo = 4
        end
        object rpCredBenefLabel20: TppLabel
          UserName = 'rpCredBenefLabel20'
          Caption = 'Seq. Benef.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 17198
          mmTop = 7408
          mmWidth = 16404
          BandType = 3
          GroupNo = 4
        end
      end
      object rpCredBenefGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object rpCredBenefLabel4: TppLabel
          UserName = 'rpCredBenefLabel4'
          Caption = 'Total Agência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 144198
          mmTop = 1323
          mmWidth = 17727
          BandType = 5
          GroupNo = 2
        end
        object rpCredBenefLine5: TppLine
          UserName = 'rpCredBenefLine5'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 529
          mmWidth = 197380
          BandType = 5
          GroupNo = 2
        end
        object rpCredBenefDBCalc1: TppDBCalc
          UserName = 'rpCredBenefDBCalc1'
          DataField = 'SUMLIQ'
          DataPipeline = ppCredBenef
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpCredBenefGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCredBenef'
          mmHeight = 3704
          mmLeft = 170127
          mmTop = 1323
          mmWidth = 25400
          BandType = 5
          GroupNo = 2
        end
        object rpCredBenefDBCalc3: TppDBCalc
          UserName = 'rpCredBenefDBCalc3'
          DataField = 'AGENCIA'
          DataPipeline = ppCredBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpCredBenefGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppCredBenef'
          mmHeight = 3704
          mmLeft = 20638
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
        object rpCredBenefLabel11: TppLabel
          UserName = 'rpCredBenefLabel11'
          Caption = 'Quantidade '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 1058
          mmWidth = 15346
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object rpCredBenefAgen: TppReport
    AutoStop = False
    DataPipeline = ppCredBenefAgen
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relação de Crédito de Beneficiários por Agência'
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 490
    Top = 381
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppCredBenefAgen'
    object ppHeaderBand15: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 88106
      mmPrintPosition = 0
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 43921
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'ppLabel79'
        Caption = 'Relação de Pagamentos de Benefícios - por Agência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 27252
        mmWidth = 197115
        BandType = 0
      end
      object rpCredBenefAgenLabel10: TppLabel
        UserName = 'rpCredBenefAgenLabel10'
        Caption = 'rpCredBenefAgenLabel10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 39158
        mmWidth = 43392
        BandType = 0
      end
      object rpCredBenefAgenDBText2: TppDBText
        UserName = 'rpCredBenefAgenDBText2'
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
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object rpCredBenefAgenDBText6: TppDBText
        UserName = 'rpCredBenefAgenDBText6'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpCredBenefAgenDBText7: TppDBText
        UserName = 'rpCredBenefAgenDBText7'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object rpCredBenefAgenDBImage1: TppDBImage
        UserName = 'rpCredBenefAgenDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object rpCredBenefAgenDBText10: TppDBText
        UserName = 'rpCredBenefAgenDBText10'
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
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 15875
        BandType = 0
      end
      object rpCredBenefAgenDBText11: TppDBText
        UserName = 'rpCredBenefAgenDBText11'
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
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
      object rpCredBenefAgenMemo1: TppMemo
        UserName = 'rpCredBenefAgenMemo1'
        Caption = 'memomens'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Lines.Strings = (
          
            'SOLICITAMOS EFETUAR OS PAGAMENTOS EM CONTA CORRENTE AOS PARTICIP' +
            'ANTES CONSTANTES DAS RELAÇÕES EM ANEXO ATRAVÉS DE VOSSAS AGÊNCIA' +
            'S ABAIXO RELACIONADAS DEBITANDO-NOS SOB AVISO EM NOSSA CONTA COR' +
            'RENTE NÚMERO -'
          
            'REFERÊNCIA:  SUPL. APOS. TS., SUPL. APOS. TS. PROP., SUPL. APOS.' +
            ' ESP., APOSENTADORIA PL. APOS. ESP. PROP., SUPL. PENSÁO, SUPL. A' +
            'POS.SUPL. APOS. INV., SUPL. VEL., SUPL. AUXILIO DOENÇA RENOVA, P' +
            'OS. NORM. ESP., BENEF. POR INCAPACIDADE, APOS. POSTERGADA ')
        TextAlignment = taFullJustified
        Transparent = True
        mmHeight = 25929
        mmLeft = 265
        mmTop = 60590
        mmWidth = 197380
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpCredBenefAgenLabel6: TppLabel
        UserName = 'rpCredBenefAgenLabel6'
        Caption = 'Agência (centralizadora) :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 53975
        mmWidth = 39158
        BandType = 0
      end
      object rpCredBenefAgenDBText3: TppDBText
        UserName = 'rpCredBenefAgenDBText3'
        DataField = 'NUMAGENCIAPAG'
        DataPipeline = ppCredBenefAgen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCredBenefAgen'
        mmHeight = 4233
        mmLeft = 49213
        mmTop = 54240
        mmWidth = 11113
        BandType = 0
      end
      object rpCredBenefAgenDBText4: TppDBText
        UserName = 'rpCredBenefAgenDBText4'
        DataField = 'CENTRALIZA'
        DataPipeline = ppCredBenefAgen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppCredBenefAgen'
        mmHeight = 4233
        mmLeft = 67733
        mmTop = 54240
        mmWidth = 95250
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'ppDBText25'
        DataField = 'NUMBANCO'
        DataPipeline = ppCredBenefAgen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppCredBenefAgen'
        mmHeight = 4233
        mmLeft = 52388
        mmTop = 48683
        mmWidth = 8202
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'ppDBText26'
        DataField = 'NOME'
        DataPipeline = ppCredBenefAgen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppCredBenefAgen'
        mmHeight = 4233
        mmLeft = 67733
        mmTop = 48683
        mmWidth = 97896
        BandType = 0
      end
      object rpCredBenefAgenLabel5: TppLabel
        UserName = 'rpCredBenefAgenLabel5'
        Caption = 'Banco --------------------------:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 48683
        mmWidth = 39423
        BandType = 0
      end
      object rpCredBenefAgenDBText1: TppDBText
        UserName = 'rpCredBenefAgenDBText1'
        DataField = 'NOCONTACORR'
        DataPipeline = ppCredBenefAgen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCredBenefAgen'
        mmHeight = 4233
        mmLeft = 71438
        mmTop = 69056
        mmWidth = 43921
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'ppLine33'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 86784
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object rpCredBenefAgenDBText8: TppDBText
        UserName = 'rpCredBenefAgenDBText8'
        DataField = 'NUMAGENCIA'
        DataPipeline = ppCredBenefAgen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCredBenefAgen'
        mmHeight = 3704
        mmLeft = 5027
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object rpCredBenefAgenDBText9: TppDBText
        UserName = 'rpCredBenefAgenDBText9'
        DataField = 'AGENCIA'
        DataPipeline = ppCredBenefAgen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCredBenefAgen'
        mmHeight = 3704
        mmLeft = 23548
        mmTop = 0
        mmWidth = 94986
        BandType = 4
      end
      object rpCredBenefAgenDBText12: TppDBText
        UserName = 'rpCredBenefAgenDBText12'
        DataField = 'QUANTIDADE'
        DataPipeline = ppCredBenefAgen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCredBenefAgen'
        mmHeight = 3704
        mmLeft = 125148
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object rpCredBenefAgenDBText13: TppDBText
        UserName = 'rpCredBenefAgenDBText13'
        DataField = 'VALOR'
        DataPipeline = ppCredBenefAgen
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCredBenefAgen'
        mmHeight = 3704
        mmLeft = 161925
        mmTop = 0
        mmWidth = 26723
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object rpCredBenefAgenLine5: TppLine
        UserName = 'rpCredBenefAgenLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 24606
        mmWidth = 197300
        BandType = 8
      end
      object rpCredBenefAgenLabel11: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'rpCredBenefAgenLabel11'
        AutoSize = False
        Caption = 'Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 25929
        mmWidth = 197909
        BandType = 8
      end
      object lblAssina2: TppLabel
        UserName = 'lblAssina2'
        Caption = 'lblAssina2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 14288
        mmWidth = 15081
        BandType = 8
      end
      object lblAssina1: TppLabel
        UserName = 'lblAssina1'
        Caption = 'lblAssina1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3175
        mmLeft = 38629
        mmTop = 14023
        mmWidth = 13758
        BandType = 8
      end
      object rpCredBenefAgenLine3: TppLine
        UserName = 'rpCredBenefAgenLine3'
        Visible = False
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 10054
        mmTop = 12700
        mmWidth = 74877
        BandType = 8
      end
      object rpCredBenefAgenLine4: TppLine
        UserName = 'rpCredBenefAgenLine4'
        Visible = False
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 116417
        mmTop = 12965
        mmWidth = 74877
        BandType = 8
      end
      object rpCredBenefAgenCalc1: TppSystemVariable
        UserName = 'rpCredBenefAgenCalc1'
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
        mmLeft = 0
        mmTop = 25929
        mmWidth = 197380
        BandType = 8
      end
      object rpCredBenefAgenCalc2: TppSystemVariable
        UserName = 'rpCredBenefAgenCalc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169069
        mmTop = 25929
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpCredBenefAgenSummaryBand1: TppSummaryBand
      BeforePrint = rpCredBenefAgenSummaryBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 12965
      mmPrintPosition = 0
      object rpCredBenefAgenLabel2: TppLabel
        UserName = 'rpCredBenefAgenLabel2'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 152136
        mmTop = 2117
        mmWidth = 7938
        BandType = 7
      end
      object rpCredBenefAgenDBCalc4: TppDBCalc
        UserName = 'rpCredBenefAgenDBCalc4'
        DataField = 'VALOR'
        DataPipeline = ppCredBenefAgen
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCredBenefAgen'
        mmHeight = 3704
        mmLeft = 161925
        mmTop = 1852
        mmWidth = 26988
        BandType = 7
      end
      object rpCredBenefAgenLine2: TppLine
        UserName = 'rpCredBenefAgenLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 7
      end
      object rpCredBenefAgenLabel12: TppLabel
        UserName = 'rpCredBenefAgenLabel12'
        AutoSize = False
        Caption = 'Quantidade Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 94192
        mmTop = 1852
        mmWidth = 28046
        BandType = 7
      end
      object rpCredBenefAgenDBCalc6: TppDBCalc
        UserName = 'rpCredBenefAgenDBCalc6'
        DataField = 'QUANTIDADE'
        DataPipeline = ppCredBenefAgen
        DisplayFormat = '###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCredBenefAgen'
        mmHeight = 3704
        mmLeft = 125148
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CENTRALIZA'
      DataPipeline = ppCredBenefAgen
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppCredBenefAgen'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand3BeforePrint
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object rpCredBenefAgenLabel1: TppLabel
          UserName = 'rpCredBenefAgenLabel1'
          Caption = 'Sub-Total por Agência Centralizadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 41540
          mmTop = 1588
          mmWidth = 47890
          BandType = 5
          GroupNo = 0
        end
        object rpCredBenefAgenDBCalc3: TppDBCalc
          UserName = 'rpCredBenefAgenDBCalc3'
          DataField = 'QUANTIDADE'
          DataPipeline = ppCredBenefAgen
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCredBenefAgen'
          mmHeight = 3704
          mmLeft = 125148
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpCredBenefAgenDBCalc2: TppDBCalc
          UserName = 'rpCredBenefAgenDBCalc2'
          DataField = 'VALOR'
          DataPipeline = ppCredBenefAgen
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCredBenefAgen'
          mmHeight = 3704
          mmLeft = 161925
          mmTop = 1588
          mmWidth = 26723
          BandType = 5
          GroupNo = 0
        end
        object rpCredBenefAgenLine6: TppLine
          UserName = 'rpCredBenefAgenLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpCredBenefAgenGroup2: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppCredBenefAgen
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpCredBenefAgenGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppCredBenefAgen'
      object rpCredBenefAgenGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel80: TppLabel
          UserName = 'ppLabel80'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 5027
          mmTop = 265
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLabel81: TppLabel
          UserName = 'ppLabel81'
          Caption = 'Agência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 23548
          mmTop = 265
          mmWidth = 10583
          BandType = 3
          GroupNo = 1
        end
        object ppLabel82: TppLabel
          UserName = 'ppLabel82'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 128059
          mmTop = 265
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLabel83: TppLabel
          UserName = 'ppLabel83'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 181505
          mmTop = 265
          mmWidth = 6350
          BandType = 3
          GroupNo = 1
        end
        object ppLine34: TppLine
          UserName = 'ppLine34'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 3969
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object rpCredBenefAgenGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rpCredBenefAgenLine1: TppLine
          UserName = 'rpCredBenefAgenLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
        object rpCredBenefAgenLabel3: TppLabel
          UserName = 'rpCredBenefAgenLabel3'
          Caption = 'Sub-Total por Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 41010
          mmTop = 1058
          mmWidth = 26194
          BandType = 5
          GroupNo = 1
        end
        object rpCredBenefAgenDBCalc1: TppDBCalc
          UserName = 'rpCredBenefAgenDBCalc1'
          DataField = 'QUANTIDADE'
          DataPipeline = ppCredBenefAgen
          DisplayFormat = '###,###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpCredBenefAgenGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCredBenefAgen'
          mmHeight = 3704
          mmLeft = 125148
          mmTop = 1058
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object rpCredBenefAgenDBCalc5: TppDBCalc
          UserName = 'rpCredBenefAgenDBCalc5'
          DataField = 'VALOR'
          DataPipeline = ppCredBenefAgen
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpCredBenefAgenGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppCredBenefAgen'
          mmHeight = 3704
          mmLeft = 161925
          mmTop = 1058
          mmWidth = 26723
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppBDEPipeline2: TppBDEPipeline
    DataSource = wwDataSource2
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'BDEPipeline2'
    Left = 106
    Top = 142
  end
  object wwDataSource2: TwwDataSource
    DataSet = wwQuery2
    Left = 134
    Top = 142
  end
  object wwQuery2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RUBRICAINDIV.IDPESSOA, elegpatro.matricula,RUBRICAINDIV.F' +
        'LGPERMANENTE,BENEF.IDPESSOA,pessoa.nome'
      ' FROM '
      
        ' RUBRICAINDIV, elegpatro, (SELECT DISTINCT IDPESSOA FROM BENEFBF' +
        'CIARIO ) BENEF, pessoa'
      ' WHERE '
      ' RUBRICAINDIV.IDPESSOA = BENEF.IDPESSOA(+)'
      ' AND RUBRICAINDIV.IDRUBRICA = 1165'
      ' and rubricaindiv.idpessoa = pessoa.idpessoa'
      ' and elegpatro.idpessoa = pessoa.idpessoa'
      ' AND BENEF.IDPESSOA IS NULL'
      'AND 1 = 2')
    ValidateWithMask = True
    Left = 162
    Top = 142
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline2
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 78
    Top = 142
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEPipeline2'
    object ppHeaderBand17: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLine35: TppLine
        UserName = 'ppLine35'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'ppLabel13'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
        Caption = 'Beneficiarios que descontam e nâo estão na Folha de beneficio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 41010
        mmTop = 9790
        mmWidth = 127265
        BandType = 0
      end
    end
    object ppDetailBand18: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppReport2DBText1: TppDBText
        UserName = 'ppReport2DBText1'
        DataField = 'NOME'
        DataPipeline = ppBDEPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline2'
        mmHeight = 4233
        mmLeft = 35983
        mmTop = 265
        mmWidth = 95250
        BandType = 4
      end
      object ppReport2DBText2: TppDBText
        UserName = 'ppReport2DBText2'
        DataField = 'MATRICULA'
        DataPipeline = ppBDEPipeline2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline2'
        mmHeight = 4233
        mmLeft = 5556
        mmTop = 529
        mmWidth = 20638
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel87: TppLabel
        UserName = 'ppLabel87'
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
        mmTop = 2910
        mmWidth = 197909
        BandType = 8
      end
      object ppLine36: TppLine
        UserName = 'ppLine36'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
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
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
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
        mmTop = 2910
        mmWidth = 197380
        BandType = 8
      end
    end
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO    ,'
      '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP       , I.IMAGEM, '
      '       (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDERECO   ,'
      
        '       SUBSTR((E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO),1,25' +
        '5) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 534
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 2002
      end>
    object qryFundacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryFundacaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryFundacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryFundacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryFundacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryFundacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryFundacaoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryFundacaoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFundacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object qryFundacaoBARCIDUF: TStringField
      FieldName = 'BARCIDUF'
      Size = 79
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 506
    Top = 7
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 478
    Top = 7
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
  object ppBDEPipeline3: TppBDEPipeline
    DataSource = wwDataSource3
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'BDEPipeline3'
    Left = 369
    Top = 97
  end
  object wwDataSource3: TwwDataSource
    DataSet = wwQuery3
    Left = 397
    Top = 97
  end
  object wwQuery3: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  ELEGPATRO.MATRICULA,P2.NOME AS TITULAR, PESSOA.NOME AS F' +
        'AVORECIDO,'
      'CONTABANCARIA.CONTACORRENTE'
      ''
      'FROM'
      ''
      
        '(SELECT   IDPESSOA,IDFAVORECIDO, COUNT(*) FROM RUBRICAINDIV WHER' +
        'E IDRUBRICA = 1165'
      'AND 1 = 2'
      'GROUP BY IDPESSOA,IDFAVORECIDO)  BENEF,'
      ''
      'CONTABANCARIA,'
      ''
      'PESSOA,'
      ''
      'PESSOA P2,'
      ''
      'ELEGPATRO'
      ''
      'WHERE'
      ''
      'BENEF.IDFAVORECIDO = CONTABANCARIA.IDPESSOA(+)'
      ''
      'AND PESSOA.IDPESSOA = BENEF.IDFAVORECIDO'
      ''
      'AND (CONTACORRENTE = 0 OR CONTACORRENTE IS NULL)'
      ''
      'AND (P2.IDPESSOA = BENEF.IDPESSOA)'
      ''
      'AND (ELEGPATRO.IDPESSOA = BENEF.IDPESSOA)'
      ''
      'ORDER BY PESSOA.NOME'
      '')
    ValidateWithMask = True
    Left = 426
    Top = 97
  end
  object ppReport3: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline3
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 209815
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
    Left = 341
    Top = 97
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEPipeline3'
    object ppHeaderBand18: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'ppLine37'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 28840
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'ppLabel88'
        Caption = 'REFER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 2117
        mmTop = 1058
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'ppLabel89'
        Caption = 'Relatório de Favorecidos sem Conta Corrente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 54769
        mmTop = 9790
        mmWidth = 92075
        BandType = 0
      end
      object ppReport3Line1: TppLine
        UserName = 'ppReport3Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 21960
        mmWidth = 197115
        BandType = 0
      end
      object ppReport3Label1: TppLabel
        UserName = 'ppReport3Label1'
        Caption = 'Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 40746
        mmTop = 23813
        mmWidth = 28046
        BandType = 0
      end
      object ppReport3Label2: TppLabel
        UserName = 'ppReport3Label2'
        Caption = 'Favorecido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 116152
        mmTop = 23813
        mmWidth = 21696
        BandType = 0
      end
      object ppReport3Label3: TppLabel
        UserName = 'ppReport3Label3'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 23813
        mmWidth = 15610
        BandType = 0
      end
    end
    object ppDetailBand19: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppReport3DBText1: TppDBText
        UserName = 'ppReport3DBText1'
        DataField = 'TITULAR'
        DataPipeline = ppBDEPipeline3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline3'
        mmHeight = 4233
        mmLeft = 40746
        mmTop = 1058
        mmWidth = 75142
        BandType = 4
      end
      object ppReport3DBText2: TppDBText
        UserName = 'ppReport3DBText2'
        DataField = 'FAVORECIDO'
        DataPipeline = ppBDEPipeline3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline3'
        mmHeight = 4233
        mmLeft = 116152
        mmTop = 794
        mmWidth = 80963
        BandType = 4
      end
      object ppReport3DBText3: TppDBText
        UserName = 'ppReport3DBText3'
        DataField = 'MATRICULA'
        DataPipeline = ppBDEPipeline3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline3'
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 1058
        mmWidth = 20638
        BandType = 4
      end
    end
    object ppFooterBand18: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel90: TppLabel
        UserName = 'ppLabel90'
        AutoSize = False
        Caption = 'Folha de Benefícios - 2.06.03'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 2910
        mmWidth = 197909
        BandType = 8
      end
      object ppReport3Line2: TppLine
        UserName = 'ppReport3Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 1058
        mmWidth = 197115
        BandType = 8
      end
      object ppCalc27: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 170921
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc28: TppSystemVariable
        UserName = 'Calc28'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 88900
        mmTop = 2910
        mmWidth = 18785
        BandType = 8
      end
    end
  end
  object ppBenConced: TppBDEPipeline
    DataSource = dsBenConced
    SkipWhenNoRecords = False
    UserName = 'BenConced'
    Left = 396
    Top = 241
  end
  object dsBenConced: TwwDataSource
    DataSet = qryBenConced
    Left = 396
    Top = 284
  end
  object qryBenConced: TwwQuery
    BeforeClose = qryBenConcedBeforeClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT H1.IDPESSOA                  , PJ.NOME          ' +
        '  AS PATROCINADORA, B.NOME           AS BENEFICIO,'
      
        '                P.NOME        AS BENEFICIARIO, PP.INSCRICAONUMER' +
        'O AS INSCRICAO    , H1.VALORPROVENTO AS VALOR    ,'
      
        '                ELG.MATRICULA                , BFB.VALORATUAL   ' +
        '                  , H1.IDRUBRICA                 ,'
      '                PLANPREV.NOME AS PLANO       , BFB.DATAINICIO'
      
        'FROM PREVIA H1, PESSOA PJ, PESSOA     P   , PARTPREVPLAN  PP , B' +
        'ENEFICIO B  , BENEFPLANPREV BPP,'
      
        '     PLANPREV , PATRO    , PARAMAPREV BACA, BENEFBFCIARIO BFB, E' +
        'LEGPATRO ELG, HSTFOLHABENEF HSB,'
      '     HSTBENEFBFCIARIO HBF'
      'WHERE (H1.MES               = :MESATU)         AND'
      '      (P.IDPESSOA           = PP.IDPESSOA)     AND'
      '      (H1.IDPESSOA          = PP.IDPESSOA)     AND'
      '      (B.IDBENEFICIO        = BPP.IDBENEFICIO) AND'
      '      (BPP.IDBENEFICIO      = H1.IDBENEFICIO)  AND'
      '      (PLANPREV.IDPLANOPREV = H1.IDPLANOPREV)  AND'
      '      (H1.IDPATRO           = PJ.IDPESSOA)     AND'
      '      (H1.IDRUBRICA NOT IN  BACA.IDRUBIRRF)    AND'
      '      (B.IDBENEFICIO        = BFB.IDBENEFICIO) AND'
      '      (PP.IDPESSOA          = BFB.IDPESSOA)    AND'
      '      (ELG.IDPESSJUR        = H1.IDPATRO)      AND'
      '      (ELG.IDPESSOA         = PP.IDPESSOA)     AND'
      '      (BFB.IDPESSOA         = HBF.IDPESSOA)    AND'
      '      (BFB.IDBENEFICIO      = HBF.IDBENEFICIO) AND'
      '      H1.IDBENEFICIO NOT  IN'
      '      (SELECT H2.IDBENEFICIO'
      '         FROM PREVIA H2'
      '         WHERE (H2.MES               = :MESANT)         AND'
      '               (P.IDPESSOA           = PP.IDPESSOA)     AND'
      '               (H2.IDPESSOA          = PP.IDPESSOA)     AND'
      '               (B.IDBENEFICIO        = BPP.IDBENEFICIO) AND'
      '               (BPP.IDBENEFICIO      = H2.IDBENEFICIO)  AND'
      '               (PLANPREV.IDPLANOPREV = H2.IDPLANOPREV))'
      'ORDER BY B.NOME,PP.INSCRICAONUMERO')
    ValidateWithMask = True
    Left = 396
    Top = 330
    ParamData = <
      item
        DataType = ftString
        Name = 'MESATU'
        ParamType = ptUnknown
        Value = '1999/11'
      end
      item
        DataType = ftString
        Name = 'MESANT'
        ParamType = ptUnknown
        Value = '1999/10'
      end>
  end
  object rpBenConced: TppReport
    AutoStop = False
    DataPipeline = ppBenConced
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 209815
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
    Left = 396
    Top = 196
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBenConced'
    object ppHeaderBand19: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36777
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'ppLabel8'
        Caption = 'Relatório de Benefícios Concedidos no Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 56621
        mmTop = 30427
        mmWidth = 88106
        BandType = 0
      end
      object rpBenConcedDBImage1: TppDBImage
        UserName = 'rpBenConcedDBImage1'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object rpBenConcedDBText1: TppDBText
        UserName = 'rpBenConcedDBText1'
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
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object rpBenConcedDBText2: TppDBText
        UserName = 'rpBenConcedDBText2'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object rpBenConcedDBText3: TppDBText
        UserName = 'rpBenConcedDBText3'
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
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object rpBenConcedDBText4: TppDBText
        UserName = 'rpBenConcedDBText4'
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
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object rpBenConcedLabel1: TppLabel
        UserName = 'rpBenConcedLabel1'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5027
        BandType = 0
      end
      object rpBenConcedDBText5: TppDBText
        UserName = 'rpBenConcedDBText5'
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
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object rpBenConcedDBText6: TppDBText
        UserName = 'rpBenConcedDBText6'
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
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 26723
        BandType = 0
      end
      object rpBenConcedDBText7: TppDBText
        UserName = 'rpBenConcedDBText7'
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
        mmLeft = 86519
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object rpBenConcedDBText8: TppDBText
        UserName = 'rpBenConcedDBText8'
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
        mmLeft = 92340
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
    end
    object ppDetailBand20: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object rpBenConcedDBText11: TppDBText
        UserName = 'rpBenConcedDBText11'
        DataField = 'BENEFICIO'
        DataPipeline = ppBenConced
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBenConced'
        mmHeight = 3969
        mmLeft = 2381
        mmTop = 0
        mmWidth = 59796
        BandType = 4
      end
      object rpBenConcedDBText12: TppDBText
        UserName = 'rpBenConcedDBText12'
        DataField = 'BENEFICIARIO'
        DataPipeline = ppBenConced
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBenConced'
        mmHeight = 3969
        mmLeft = 112448
        mmTop = 0
        mmWidth = 54769
        BandType = 4
      end
      object rpBenConcedDBText13: TppDBText
        UserName = 'rpBenConcedDBText13'
        DataField = 'VALOR'
        DataPipeline = ppBenConced
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBenConced'
        mmHeight = 3969
        mmLeft = 169069
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object rpBenConcedDBText14: TppDBText
        UserName = 'rpBenConcedDBText14'
        DataField = 'INSCRICAO'
        DataPipeline = ppBenConced
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBenConced'
        mmHeight = 3969
        mmLeft = 78581
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object rpBenConcedDBText9: TppDBText
        UserName = 'rpBenConcedDBText9'
        DataField = 'MATRICULA'
        DataPipeline = ppBenConced
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBenConced'
        mmHeight = 3969
        mmLeft = 92604
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object rpBenConcedDBText15: TppDBText
        UserName = 'rpBenConcedDBText15'
        DataField = 'DATAINICIO'
        DataPipeline = ppBenConced
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBenConced'
        mmHeight = 3969
        mmLeft = 63500
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
    end
    object ppFooterBand19: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object ppLabel91: TppLabel
        UserName = 'ppLabel91'
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
        mmTop = 2910
        mmWidth = 197909
        BandType = 8
      end
      object ppLine39: TppLine
        UserName = 'ppLine39'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197115
        BandType = 8
      end
      object ppCalc29: TppSystemVariable
        UserName = 'Calc29'
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
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc30: TppSystemVariable
        UserName = 'ppCalc301'
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
        mmTop = 2910
        mmWidth = 197380
        BandType = 8
      end
    end
    object rpBenConcedSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object SubReport01: TppSubReport
        UserName = 'SubReport01'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        TraverseAllData = False
        DataPipelineName = 'plBenefConcedSub'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpBenConcedChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = plBenefConcedSub
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 296863
          PrinterSetup.mmPaperWidth = 209815
          PrinterSetup.PaperSize = 9
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'plBenefConcedSub'
          object rpBenConcedChildReport1TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 46302
            mmPrintPosition = 0
            object rpBenConcedChildReport1Label1: TppLabel
              UserName = 'rpBenConcedChildReport1Label1'
              Caption = 'Relatório de Benefícios Concedidos no Mês - RESUMO GERAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5027
              mmLeft = 40481
              mmTop = 32544
              mmWidth = 126207
              BandType = 1
            end
            object rpBenConcedChildReport1DBImage1: TppDBImage
              UserName = 'rpBenConcedChildReport1DBImage1'
              MaintainAspectRatio = True
              DataField = 'IMAGEM'
              DataPipeline = ppFundacao
              GraphicType = 'Bitmap'
              ParentDataPipeline = False
              DataPipelineName = 'ppFundacao'
              mmHeight = 25135
              mmLeft = 5027
              mmTop = 3175
              mmWidth = 39688
              BandType = 1
            end
            object rpBenConcedChildReport1DBText1: TppDBText
              UserName = 'rpBenConcedChildReport1DBText1'
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
              mmLeft = 45508
              mmTop = 3440
              mmWidth = 133615
              BandType = 1
            end
            object rpBenConcedChildReport1DBText2: TppDBText
              UserName = 'rpBenConcedChildReport1DBText2'
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
              mmLeft = 45508
              mmTop = 9790
              mmWidth = 24606
              BandType = 1
            end
            object rpBenConcedChildReport1DBText3: TppDBText
              UserName = 'rpBenConcedChildReport1DBText3'
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
              mmLeft = 45508
              mmTop = 15081
              mmWidth = 41804
              BandType = 1
            end
            object rpBenConcedChildReport1DBText4: TppDBText
              UserName = 'rpBenConcedChildReport1DBText4'
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
              mmLeft = 45508
              mmTop = 19579
              mmWidth = 20108
              BandType = 1
            end
            object rpBenConcedChildReport1Label2: TppLabel
              UserName = 'rpBenConcedChildReport1Label2'
              Caption = 'CEP'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 45508
              mmTop = 24077
              mmWidth = 5027
              BandType = 1
            end
            object rpBenConcedChildReport1DBText5: TppDBText
              UserName = 'rpBenConcedChildReport1DBText5'
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
              mmLeft = 52917
              mmTop = 24077
              mmWidth = 17198
              BandType = 1
            end
            object rpBenConcedChildReport1DBText6: TppDBText
              UserName = 'rpBenConcedChildReport1DBText6'
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
              mmLeft = 66146
              mmTop = 19579
              mmWidth = 26723
              BandType = 1
            end
            object rpBenConcedChildReport1DBText7: TppDBText
              UserName = 'rpBenConcedChildReport1DBText7'
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
              mmLeft = 88636
              mmTop = 15081
              mmWidth = 17198
              BandType = 1
            end
            object rpBenConcedChildReport1DBText8: TppDBText
              UserName = 'rpBenConcedChildReport1DBText8'
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
              mmLeft = 94456
              mmTop = 19579
              mmWidth = 20108
              BandType = 1
            end
            object rpBenConcedChildReport1Label3: TppLabel
              UserName = 'rpBenConcedChildReport1Label3'
              Caption = 'Benefício'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 4763
              mmTop = 40217
              mmWidth = 14023
              BandType = 1
            end
            object rpBenConcedChildReport1Label6: TppLabel
              UserName = 'rpBenConcedChildReport1Label6'
              Caption = 'Valor Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 178330
              mmTop = 40217
              mmWidth = 16140
              BandType = 1
            end
            object rpBenConcedChildReport1Line1: TppLine
              UserName = 'rpBenConcedChildReport1Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 44715
              mmWidth = 197115
              BandType = 1
            end
          end
          object rpBenConcedChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object rpBenConcedChildReport1DBText9: TppDBText
              UserName = 'rpBenConcedChildReport1DBText9'
              DataField = 'BENEFICIO'
              DataPipeline = plBenefConcedSub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plBenefConcedSub'
              mmHeight = 3969
              mmLeft = 4763
              mmTop = 265
              mmWidth = 148432
              BandType = 4
            end
            object rpBenConcedChildReport1DBText10: TppDBText
              UserName = 'rpBenConcedChildReport1DBText10'
              DataField = 'VALOR'
              DataPipeline = plBenefConcedSub
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plBenefConcedSub'
              mmHeight = 3969
              mmLeft = 158486
              mmTop = 265
              mmWidth = 35983
              BandType = 4
            end
          end
          object rpBenConcedChildReport1SummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 17198
            mmPrintPosition = 0
            object rpBenConcedChildReport1Line2: TppLine
              UserName = 'rpBenConcedChildReport1Line2'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 0
              mmWidth = 197115
              BandType = 7
            end
            object rpBenConcedChildReport1DBCalc1: TppDBCalc
              UserName = 'rpBenConcedChildReport1DBCalc1'
              AutoSize = True
              DataField = 'VALOR'
              DataPipeline = plBenefConcedSub
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plBenefConcedSub'
              mmHeight = 3969
              mmLeft = 192617
              mmTop = 1058
              mmWidth = 1852
              BandType = 7
            end
            object rpBenConcedChildReport1Label4: TppLabel
              UserName = 'rpBenConcedChildReport1Label4'
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3969
              mmLeft = 4763
              mmTop = 1058
              mmWidth = 7408
              BandType = 7
            end
          end
        end
      end
    end
    object rpBenConcedGroup1: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppBenConced
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpBenConcedGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBenConced'
      object rpBenConcedGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object rpBenConcedLine1: TppLine
          UserName = 'rpBenConcedLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 197115
          BandType = 3
          GroupNo = 0
        end
        object rpBenConcedLabel2: TppLabel
          UserName = 'rpBenConcedLabel2'
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2646
          mmTop = 6085
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object rpBenConcedLabel3: TppLabel
          UserName = 'rpBenConcedLabel3'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 77523
          mmTop = 6085
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object rpBenConcedLabel4: TppLabel
          UserName = 'rpBenConcedLabel4'
          Caption = 'Nome do Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 112448
          mmTop = 6085
          mmWidth = 32279
          BandType = 3
          GroupNo = 0
        end
        object rpBenConcedLabel5: TppLabel
          UserName = 'rpBenConcedLabel5'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 180446
          mmTop = 6085
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object rpBenConcedLine2: TppLine
          UserName = 'rpBenConcedLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 10583
          mmWidth = 197115
          BandType = 3
          GroupNo = 0
        end
        object rpBenConcedLabel7: TppLabel
          UserName = 'rpBenConcedLabel7'
          Caption = 'Patrocinadora :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 2646
          mmTop = 1588
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object rpBenConcedDBText10: TppDBText
          UserName = 'rpBenConcedDBText10'
          DataField = 'PATROCINADORA'
          DataPipeline = ppBenConced
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'ppBenConced'
          mmHeight = 3969
          mmLeft = 26458
          mmTop = 1588
          mmWidth = 139965
          BandType = 3
          GroupNo = 0
        end
        object rpBenConcedLabel8: TppLabel
          UserName = 'rpBenConcedLabel8'
          Caption = 'Mes/Ano : 08/1999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 168805
          mmTop = 1588
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object rpBenConcedLabel6: TppLabel
          UserName = 'rpBenConcedLabel6'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 94192
          mmTop = 6085
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object rpBenConcedLabel10: TppLabel
          UserName = 'rpBenConcedLabel10'
          Caption = 'DIB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 67733
          mmTop = 6085
          mmWidth = 5027
          BandType = 3
          GroupNo = 0
        end
      end
      object rpBenConcedGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object rpBenConcedLabel9: TppLabel
          UserName = 'rpBenConcedLabel9'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 155311
          mmTop = 1852
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object rpBenConcedDBCalc1: TppDBCalc
          UserName = 'rpBenConcedDBCalc1'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = ppBenConced
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = rpBenConcedGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBenConced'
          mmHeight = 3704
          mmLeft = 174096
          mmTop = 1852
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
        end
        object rpBenConcedDBCalc2: TppDBCalc
          UserName = 'rpBenConcedDBCalc2'
          DataField = 'BENEFICIARIO'
          DataPipeline = ppBenConced
          DisplayFormat = '###,###,###'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = rpBenConcedGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppBenConced'
          mmHeight = 3969
          mmLeft = 125148
          mmTop = 1852
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
        object rpBenConcedLabel11: TppLabel
          UserName = 'rpBenConcedLabel11'
          Caption = 'Qtd:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 117211
          mmTop = 1852
          mmWidth = 6085
          BandType = 5
          GroupNo = 0
        end
        object rpBenConcedLine3: TppLine
          UserName = 'rpBenConcedLine3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 197115
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object plBenefPgto: TppBDEPipeline
    DataSource = dsBenefPgto
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plBenefPgto'
    Left = 299
    Top = 425
    object plBenefPgtoppField1: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object plBenefPgtoppField2: TppField
      FieldAlias = 'BENEF'
      FieldName = 'BENEF'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object plBenefPgtoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTD'
      FieldName = 'QTD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object plBenefPgtoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPGTO'
      FieldName = 'VLRPGTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object plBenefPgtoppField5: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 4
    end
  end
  object dsBenefPgto: TwwDataSource
    DataSet = qryBenefPgto
    Left = 299
    Top = 467
  end
  object qryBenefPgto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PJ.NOME AS PATRO,'
      '       BE.NOME AS BENEF,'
      '       COUNT(HB.IDBENEFICIO) AS QTD,'
      '       SUM(HB.VLBENEFPGTO) AS VLRPGTO,'
      '       HB.MES'
      'FROM HSTBENEFBFCIARIO HB, PESSOA PJ, BENEFICIO BE'
      'WHERE HB.MES = '#39'2001/03'#39
      'AND HB.IDPESSJUR = 2'
      'AND HB.VLBENEFPGTO > 0'
      'AND 1 = 2'
      'AND PJ.IDPESSOA = HB.IDPESSJUR'
      'AND BE.IDBENEFICIO = HB.IDBENEFICIO'
      'GROUP BY PJ.NOME, BE.NOME, HB.MES'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 299
    Top = 511
  end
  object rpBenefPgto: TppReport
    AutoStop = False
    DataPipeline = plBenefPgto
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Benefícos Pagos por Filial'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 5080
    PrinterSetup.mmMarginRight = 5080
    PrinterSetup.mmMarginTop = 5080
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
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
    Left = 299
    Top = 381
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'plBenefPgto'
    object ppHeaderBand22: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object ppLabel123: TppLabel
        UserName = 'ppLabel123'
        Caption = 'RELATÓRIO DE BENEFÍCIOS PAGOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 529
        mmTop = 27517
        mmWidth = 196850
        BandType = 0
      end
      object ppDBText55: TppDBText
        UserName = 'ppDBText55'
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
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText56: TppDBText
        UserName = 'ppDBText56'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText57: TppDBText
        UserName = 'ppDBText57'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'ppDBImage2'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText58: TppDBText
        UserName = 'ppDBText58'
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
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText59: TppDBText
        UserName = 'ppDBText59'
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
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14552
        BandType = 0
      end
    end
    object ppDetailBand23: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText60: TppDBText
        UserName = 'ppDBText60'
        DataField = 'BENEF'
        DataPipeline = plBenefPgto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plBenefPgto'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 265
        mmWidth = 94192
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'ppDBText61'
        DataField = 'QTD'
        DataPipeline = plBenefPgto
        DisplayFormat = '###,###,###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plBenefPgto'
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 265
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'ppDBText62'
        DataField = 'VLRPGTO'
        DataPipeline = plBenefPgto
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plBenefPgto'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 265
        mmWidth = 39423
        BandType = 4
      end
    end
    object ppFooterBand22: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppLabel124: TppLabel
        UserName = 'ppLabel124'
        AutoSize = False
        Caption = 'Folha de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1323
        mmWidth = 197909
        BandType = 8
      end
      object ppLine41: TppLine
        UserName = 'ppLine41'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 199919
        BandType = 8
      end
      object ppCalc35: TppSystemVariable
        UserName = 'Calc35'
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
        mmTop = 1323
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc36: TppSystemVariable
        UserName = 'Calc36'
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
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpBenefPgtoSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object rpBenefPgtoLabel1: TppLabel
        UserName = 'rpBenefPgtoLabel1'
        Caption = 'TOTAL GERAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 3969
        mmWidth = 24077
        BandType = 7
      end
      object rpBenefPgtoDBCalc2: TppDBCalc
        UserName = 'rpBenefPgtoDBCalc2'
        DataField = 'VLRPGTO'
        DataPipeline = plBenefPgto
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plBenefPgto'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 3969
        mmWidth = 39423
        BandType = 7
      end
      object rpBenefPgtoLine1: TppLine
        UserName = 'rpBenefPgtoLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 0
        mmTop = 1588
        mmWidth = 196586
        BandType = 7
      end
      object rpBenefPgtoDBCalc3: TppDBCalc
        UserName = 'rpBenefPgtoDBCalc3'
        DataField = 'QTD'
        DataPipeline = plBenefPgto
        DisplayFormat = '###,###,###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plBenefPgto'
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 3969
        mmWidth = 23813
        BandType = 7
      end
      object SubReport02: TppSubReport
        UserName = 'SubReport02'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        TraverseAllData = False
        DataPipelineName = 'plSubReport02'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 10848
        mmWidth = 199919
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpBenefPgtoChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = plSubReport02
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relatório de Benefícos Pagos por Filial'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 5080
          PrinterSetup.mmMarginLeft = 5080
          PrinterSetup.mmMarginRight = 5080
          PrinterSetup.mmMarginTop = 5080
          PrinterSetup.mmPaperHeight = 297127
          PrinterSetup.mmPaperWidth = 210079
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'plSubReport02'
          object rpBenefPgtoChildReport1TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 44450
            mmPrintPosition = 0
            object rpBenefPgtoChildReport1Label1: TppLabel
              UserName = 'rpBenefPgtoChildReport1Label1'
              Caption = 'RELATÓRIO DE BENEFÍCIOS PAGOS - RESUMO GERAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5027
              mmLeft = 44979
              mmTop = 29633
              mmWidth = 113506
              BandType = 1
            end
            object rpBenefPgtoChildReport1DBText1: TppDBText
              UserName = 'rpBenefPgtoChildReport1DBText1'
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
              mmLeft = 45508
              mmTop = 3175
              mmWidth = 153988
              BandType = 1
            end
            object rpBenefPgtoChildReport1DBText2: TppDBText
              UserName = 'rpBenefPgtoChildReport1DBText2'
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
              mmTop = 22490
              mmWidth = 17198
              BandType = 1
            end
            object rpBenefPgtoChildReport1DBText3: TppDBText
              UserName = 'rpBenefPgtoChildReport1DBText3'
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
              mmLeft = 45508
              mmTop = 9790
              mmWidth = 25665
              BandType = 1
            end
            object rpBenefPgtoChildReport1DBImage1: TppDBImage
              UserName = 'rpBenefPgtoChildReport1DBImage1'
              MaintainAspectRatio = True
              DataField = 'IMAGEM'
              DataPipeline = ppFundacao
              GraphicType = 'Bitmap'
              ParentDataPipeline = False
              DataPipelineName = 'ppFundacao'
              mmHeight = 25135
              mmLeft = 5027
              mmTop = 2910
              mmWidth = 39688
              BandType = 1
            end
            object rpBenefPgtoChildReport1DBText4: TppDBText
              UserName = 'rpBenefPgtoChildReport1DBText4'
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
              mmTop = 14288
              mmWidth = 16140
              BandType = 1
            end
            object rpBenefPgtoChildReport1DBText5: TppDBText
              UserName = 'rpBenefPgtoChildReport1DBText5'
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
              mmTop = 18256
              mmWidth = 14288
              BandType = 1
            end
            object rpBenefPgtoChildReport1Line1: TppLine
              UserName = 'rpBenefPgtoChildReport1Line1'
              Pen.Width = 2
              Weight = 1.5
              mmHeight = 2117
              mmLeft = 0
              mmTop = 42333
              mmWidth = 196586
              BandType = 1
            end
            object rpBenefPgtoChildReport1Label2: TppLabel
              UserName = 'rpBenefPgtoChildReport1Label2'
              Caption = 'Suplementação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 165629
              mmTop = 38365
              mmWidth = 26458
              BandType = 1
            end
            object rpBenefPgtoChildReport1Label3: TppLabel
              UserName = 'rpBenefPgtoChildReport1Label3'
              Caption = 'Benefício'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 2381
              mmTop = 38365
              mmWidth = 15875
              BandType = 1
            end
          end
          object rpBenefPgtoChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object rpBenefPgtoChildReport1DBText6: TppDBText
              UserName = 'rpBenefPgtoChildReport1DBText6'
              DataField = 'BENEF'
              DataPipeline = plSubReport02
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plSubReport02'
              mmHeight = 3704
              mmLeft = 2381
              mmTop = 0
              mmWidth = 142346
              BandType = 4
            end
            object rpBenefPgtoChildReport1DBText7: TppDBText
              UserName = 'rpBenefPgtoChildReport1DBText7'
              DataField = 'VLRPGTO'
              DataPipeline = plSubReport02
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plSubReport02'
              mmHeight = 3704
              mmLeft = 147373
              mmTop = 0
              mmWidth = 44715
              BandType = 4
            end
          end
          object rpBenefPgtoChildReport1SummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object rpBenefPgtoChildReport1Line2: TppLine
              UserName = 'rpBenefPgtoChildReport1Line2'
              Pen.Width = 2
              Weight = 1.5
              mmHeight = 2117
              mmLeft = 1058
              mmTop = 0
              mmWidth = 196586
              BandType = 7
            end
            object rpBenefPgtoChildReport1DBCalc1: TppDBCalc
              UserName = 'rpBenefPgtoChildReport1DBCalc1'
              DataField = 'VLRPGTO'
              DataPipeline = plSubReport02
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plSubReport02'
              mmHeight = 4233
              mmLeft = 131234
              mmTop = 1058
              mmWidth = 60854
              BandType = 7
            end
          end
        end
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'PATRO'
      DataPipeline = plBenefPgto
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plBenefPgto'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppLabel125: TppLabel
          UserName = 'ppLabel125'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 1852
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppDBText63: TppDBText
          UserName = 'ppDBText63'
          AutoSize = True
          DataField = 'PATRO'
          DataPipeline = plBenefPgto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'plBenefPgto'
          mmHeight = 3969
          mmLeft = 28575
          mmTop = 1852
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLine44: TppLine
          UserName = 'ppLine44'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1852
          mmLeft = 0
          mmTop = 529
          mmWidth = 196586
          BandType = 3
          GroupNo = 0
        end
        object ppLine43: TppLine
          UserName = 'ppLine43'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 11642
          mmWidth = 196586
          BandType = 3
          GroupNo = 0
        end
        object ppLabel126: TppLabel
          UserName = 'ppLabel126'
          Caption = 'Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 7144
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel127: TppLabel
          UserName = 'ppLabel127'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 133615
          mmTop = 7144
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object ppLabel128: TppLabel
          UserName = 'ppLabel128'
          Caption = 'Suplementação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 169334
          mmTop = 7144
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
        object rpBenefPgtoDBText1: TppDBText
          UserName = 'rpBenefPgtoDBText1'
          DataField = 'MES'
          DataPipeline = plBenefPgto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'plBenefPgto'
          mmHeight = 4233
          mmLeft = 172244
          mmTop = 1852
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object rpBenefPgtoLabel2: TppLabel
          UserName = 'rpBenefPgtoLabel2'
          Caption = 'Referência :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 150284
          mmTop = 1852
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLabel129: TppLabel
          UserName = 'ppLabel129'
          Caption = 'Total por Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 4233
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'ppDBCalc7'
          DataField = 'VLRPGTO'
          DataPipeline = plBenefPgto
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plBenefPgto'
          mmHeight = 3704
          mmLeft = 156104
          mmTop = 4233
          mmWidth = 39423
          BandType = 5
          GroupNo = 0
        end
        object ppLine42: TppLine
          UserName = 'ppLine42'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 0
          mmTop = 1852
          mmWidth = 196586
          BandType = 5
          GroupNo = 0
        end
        object rpBenefPgtoDBCalc1: TppDBCalc
          UserName = 'rpBenefPgtoDBCalc1'
          DataField = 'QTD'
          DataPipeline = plBenefPgto
          DisplayFormat = '###,###,###'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plBenefPgto'
          mmHeight = 3704
          mmLeft = 129646
          mmTop = 4233
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qrySupMaiorMenor: TwwQuery
    BeforeClose = qrySupMaiorMenorBeforeClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '       PJ.NOME   AS PATRO, PF.NOME AS PFISICA, BE.NOME AS BENEF,' +
        ' '
      
        '       PP.INSCRICAONUMERO, SUM(HS.VALORPROVENTO) AS VLRPGTO, HB.' +
        'MES'
      
        'FROM PESSOA PJ, SITBENEFICIO  SB, BENEFICIO        BE, HISTRUBSA' +
        'L   HS, '
      
        '     PESSOA PF, BENEFBFCIARIO BF, HSTBENEFBFCIARIO HB, PARTPREVP' +
        'LAN PP'
      'WHERE'
      '      (HB.MES            = :MES)         AND'
      '      (HB.MES            = HS.MES)            AND'
      '      (HS.VALORPROVENTO  > 0)                 AND'
      '      (HB.IDPESSJUR      = PJ.IDPESSOA)       AND'
      '      (HB.IDPESSJUR      = HS.IDPESSJUR)      AND'
      '      (HB.IDTITULAR      = HS.IDPESSOA)       AND'
      '      (HB.IDTITULAR      = PF.IDPESSOA)       AND'
      '      (HB.IDTITULAR      = BF.IDTITULAR)      AND'
      '      (HB.IDTITULAR      = PP.IDPESSOA)       AND'
      '      (HB.IDBENEFICIO    = BE.IDBENEFICIO)    AND'
      '      (BF.IDSITBENEFICIO = SB.IDSITBENEFICIO)'
      'GROUP BY PJ.NOME, PF.NOME, BE.NOME, PP.INSCRICAONUMERO, HB.MES'
      'ORDER BY PJ.NOME, BE.NOME, VLRPGTO ASC'
      ''
      '')
    ValidateWithMask = True
    Left = 396
    Top = 511
    ParamData = <
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end>
  end
  object dsSupMaiorMenor: TwwDataSource
    DataSet = qrySupMaiorMenor
    Left = 396
    Top = 467
  end
  object plSupMaiorMenor: TppBDEPipeline
    DataSource = dsSupMaiorMenor
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plSupMaiorMenor'
    Left = 396
    Top = 425
    object plSupMaiorMenorppField1: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object plSupMaiorMenorppField2: TppField
      FieldAlias = 'PFISICA'
      FieldName = 'PFISICA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object plSupMaiorMenorppField3: TppField
      FieldAlias = 'BENEF'
      FieldName = 'BENEF'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object plSupMaiorMenorppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object plSupMaiorMenorppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRPGTO'
      FieldName = 'VLRPGTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object plSupMaiorMenorppField6: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 5
    end
  end
  object rpSupMaiorMenor: TppReport
    AutoStop = False
    DataPipeline = plSupMaiorMenor
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Suplementação Maior / Menor'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 5080
    PrinterSetup.mmMarginRight = 5080
    PrinterSetup.mmMarginTop = 5080
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
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
    Left = 396
    Top = 381
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'plSupMaiorMenor'
    object ppHeaderBand23: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object ppLabel22: TppLabel
        UserName = 'ppLabel22'
        Caption = 'RELATÓRIO DE SUPLEMENTAÇÃO MAIOR / MENOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 46302
        mmTop = 27517
        mmWidth = 105834
        BandType = 0
      end
      object ppDBText64: TppDBText
        UserName = 'ppDBText64'
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
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText65: TppDBText
        UserName = 'ppDBText65'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText66: TppDBText
        UserName = 'ppDBText66'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25665
        BandType = 0
      end
      object ppDBImage3: TppDBImage
        UserName = 'ppDBImage3'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText67: TppDBText
        UserName = 'ppDBText67'
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
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText68: TppDBText
        UserName = 'ppDBText68'
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
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
    end
    object ppDetailBand24: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText71: TppDBText
        UserName = 'ppDBText71'
        DataField = 'VLRPGTO'
        DataPipeline = plSupMaiorMenor
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plSupMaiorMenor'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 529
        mmWidth = 39423
        BandType = 4
      end
      object rpSupMaiorMenorDBText1: TppDBText
        UserName = 'rpSupMaiorMenorDBText1'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = plSupMaiorMenor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plSupMaiorMenor'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 265
        mmWidth = 15081
        BandType = 4
      end
      object rpSupMaiorMenorDBText2: TppDBText
        UserName = 'rpSupMaiorMenorDBText2'
        DataField = 'PFISICA'
        DataPipeline = plSupMaiorMenor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plSupMaiorMenor'
        mmHeight = 3704
        mmLeft = 21960
        mmTop = 265
        mmWidth = 130175
        BandType = 4
      end
    end
    object ppFooterBand23: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 17463
      mmPrintPosition = 0
      object ppLabel44: TppLabel
        UserName = 'ppLabel44'
        AutoSize = False
        Caption = 'Folha de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1323
        mmWidth = 197909
        BandType = 8
      end
      object ppLine45: TppLine
        UserName = 'ppLine45'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 199919
        BandType = 8
      end
      object ppCalc37: TppSystemVariable
        UserName = 'Calc37'
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
        mmTop = 1323
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc38: TppSystemVariable
        UserName = 'Calc38'
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
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object ppLabel84: TppLabel
        UserName = 'ppLabel84'
        Caption = 'Total por Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 3969
        mmWidth = 39952
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'ppDBCalc8'
        DataField = 'VLRPGTO'
        DataPipeline = plSupMaiorMenor
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plSupMaiorMenor'
        mmHeight = 3704
        mmLeft = 156104
        mmTop = 3969
        mmWidth = 39423
        BandType = 7
      end
      object ppLine46: TppLine
        UserName = 'ppLine46'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 0
        mmTop = 1588
        mmWidth = 196586
        BandType = 7
      end
      object ppDBCalc9: TppDBCalc
        UserName = 'ppDBCalc9'
        DataField = 'BENEF'
        DataPipeline = plSupMaiorMenor
        DisplayFormat = '###,###,###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'plSupMaiorMenor'
        mmHeight = 3704
        mmLeft = 129646
        mmTop = 3969
        mmWidth = 23813
        BandType = 7
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'PATRO'
      DataPipeline = plSupMaiorMenor
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plSupMaiorMenor'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object rpSupMaiorMenorLabel4: TppLabel
          UserName = 'rpSupMaiorMenorLabel4'
          Caption = 'Total por Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2646
          mmTop = 1588
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
        object rpSupMaiorMenorDBCalc3: TppDBCalc
          UserName = 'rpSupMaiorMenorDBCalc3'
          DataField = 'BENEF'
          DataPipeline = plSupMaiorMenor
          DisplayFormat = '###,###,###'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'plSupMaiorMenor'
          mmHeight = 3704
          mmLeft = 129646
          mmTop = 1588
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object rpSupMaiorMenorDBCalc4: TppDBCalc
          UserName = 'rpSupMaiorMenorDBCalc4'
          DataField = 'VLRPGTO'
          DataPipeline = plSupMaiorMenor
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup9
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plSupMaiorMenor'
          mmHeight = 3704
          mmLeft = 156104
          mmTop = 1588
          mmWidth = 39423
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'BENEF'
      DataPipeline = plSupMaiorMenor
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plSupMaiorMenor'
      object ppGroupHeaderBand10: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 20902
        mmPrintPosition = 0
        object ppLine47: TppLine
          UserName = 'ppLine47'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1852
          mmLeft = 0
          mmTop = 529
          mmWidth = 196586
          BandType = 3
          GroupNo = 1
        end
        object ppLabel86: TppLabel
          UserName = 'ppLabel86'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 2117
          mmWidth = 24871
          BandType = 3
          GroupNo = 1
        end
        object ppDBText72: TppDBText
          UserName = 'ppDBText72'
          AutoSize = True
          DataField = 'PATRO'
          DataPipeline = plSupMaiorMenor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'plSupMaiorMenor'
          mmHeight = 4233
          mmLeft = 28575
          mmTop = 2117
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLine48: TppLine
          UserName = 'ppLine48'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 19579
          mmWidth = 196586
          BandType = 3
          GroupNo = 1
        end
        object ppLabel130: TppLabel
          UserName = 'ppLabel130'
          Caption = 'Benefício:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 20902
          mmTop = 7408
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel131: TppLabel
          UserName = 'ppLabel131'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 15081
          mmWidth = 15081
          BandType = 3
          GroupNo = 1
        end
        object ppLabel132: TppLabel
          UserName = 'ppLabel132'
          Caption = 'Valor da Suplementação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 153723
          mmTop = 15081
          mmWidth = 41804
          BandType = 3
          GroupNo = 1
        end
        object ppDBText69: TppDBText
          UserName = 'ppDBText69'
          AutoSize = True
          DataField = 'BENEF'
          DataPipeline = plSupMaiorMenor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'plSupMaiorMenor'
          mmHeight = 4233
          mmLeft = 39158
          mmTop = 7408
          mmWidth = 11642
          BandType = 3
          GroupNo = 1
        end
        object rpSupMaiorMenorLabel1: TppLabel
          UserName = 'rpSupMaiorMenorLabel1'
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 21960
          mmTop = 15081
          mmWidth = 20373
          BandType = 3
          GroupNo = 1
        end
        object rpSupMaiorMenorLabel3: TppLabel
          UserName = 'rpSupMaiorMenorLabel3'
          Caption = 'Mês Referencia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 144198
          mmTop = 2117
          mmWidth = 26988
          BandType = 3
          GroupNo = 1
        end
        object rpSupMaiorMenorDBText3: TppDBText
          UserName = 'rpSupMaiorMenorDBText3'
          AutoSize = True
          DataField = 'MES'
          DataPipeline = plSupMaiorMenor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'plSupMaiorMenor'
          mmHeight = 4233
          mmLeft = 171980
          mmTop = 2117
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object rpSupMaiorMenorLabel5: TppLabel
          UserName = 'rpSupMaiorMenorLabel5'
          Caption = 'Ordenação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 121709
          mmTop = 7408
          mmWidth = 19579
          BandType = 3
          GroupNo = 1
        end
        object lbOrdem01: TppLabel
          UserName = 'lbOrdem01'
          AutoSize = False
          Caption = 'lbOrdem01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 141817
          mmTop = 7408
          mmWidth = 55827
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object rpSupMaiorMenorLabel2: TppLabel
          UserName = 'rpSupMaiorMenorLabel2'
          Caption = 'Total por Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2646
          mmTop = 3440
          mmWidth = 32015
          BandType = 5
          GroupNo = 1
        end
        object rpSupMaiorMenorDBCalc1: TppDBCalc
          UserName = 'rpSupMaiorMenorDBCalc1'
          DataField = 'BENEF'
          DataPipeline = plSupMaiorMenor
          DisplayFormat = '###,###,###'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup10
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'plSupMaiorMenor'
          mmHeight = 3704
          mmLeft = 130175
          mmTop = 3440
          mmWidth = 23813
          BandType = 5
          GroupNo = 1
        end
        object rpSupMaiorMenorDBCalc2: TppDBCalc
          UserName = 'rpSupMaiorMenorDBCalc2'
          DataField = 'VLRPGTO'
          DataPipeline = plSupMaiorMenor
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup10
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plSupMaiorMenor'
          mmHeight = 3704
          mmLeft = 156634
          mmTop = 3440
          mmWidth = 39423
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qrySub01: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'P.DESCRICAO,'
      'PE.NOME, BE.NOME,'
      
        '       DECODE(P.FLGDESCONTO,0,'#39'CRÉDITO'#39',1,'#39'DÉBITO'#39') AS FLGDESCON' +
        'TO ,'
      
        '       DECODE(P.FLGDESCONTO,0,SUM(H.VALORPROVENTO),1,0) AS PROVE' +
        'NTO,'
      
        '       DECODE(P.FLGDESCONTO,1,SUM(H.VALORPROVENTO),0,0) AS DESCO' +
        'NTO'
      
        'FROM HISTRUBSAL H, PROVDESC P, PESSOA PE , PLANPREV PA, BENEFBFC' +
        'IARIO BF, BENEFICIO BE'
      'WHERE (H.IDHSTFOLHABENEF = 217)            AND'
      '1 = 2 AND'
      '      (H.IDRUBRICA       = P.IDPROVENTO)   AND'
      '      (H.IDPATRO         = PE.IDPESSOA)    AND'
      '      (H.IDPESSJUR       = PA.IDFUNDACAO)  AND'
      '      (BF.IDPLANOPREV    = PA.IDPLANOPREV) AND'
      '      (BF.IDPESSOA       = H.IDPESSOA)     AND'
      '      (BF.IDBENEFICIO    = BE.IDBENEFICIO)'
      'GROUP BY PE.NOME, P.FLGDESCONTO, BE.NOME, P.DESCRICAO'
      'ORDER BY PE.NOME, P.FLGDESCONTO, BE.NOME, P.DESCRICAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 282
    Top = 52
  end
  object dsSub01: TwwDataSource
    DataSet = qrySub01
    Left = 254
    Top = 52
  end
  object plSub01: TppBDEPipeline
    DataSource = dsSub01
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plSub01'
    Left = 225
    Top = 52
  end
  object qryBenefConcedSub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT B.NOME                AS BENEFICIO,'
      '                SUM(H1.VALORPROVENTO) AS VALOR'
      
        'FROM PREVIA H1, PESSOA PJ, PESSOA     P   , PARTPREVPLAN  PP , B' +
        'ENEFICIO B  , BENEFPLANPREV BPP,'
      
        '     PLANPREV , PATRO    , PARAMAPREV BACA, BENEFBFCIARIO BFB, E' +
        'LEGPATRO ELG, HSTFOLHABENEF HSB,'
      '     HSTBENEFBFCIARIO HBF'
      'WHERE (H1.MES               = :MESATU)         AND'
      '      (P.IDPESSOA           = PP.IDPESSOA)     AND'
      '      (H1.IDPESSOA          = PP.IDPESSOA)     AND'
      '      (B.IDBENEFICIO        = BPP.IDBENEFICIO) AND'
      '      (BPP.IDBENEFICIO      = H1.IDBENEFICIO)  AND'
      '      (PLANPREV.IDPLANOPREV = H1.IDPLANOPREV)  AND'
      '      (H1.IDPATRO           = PJ.IDPESSOA)     AND'
      '      (H1.IDRUBRICA NOT IN  BACA.IDRUBIRRF)    AND'
      '      (B.IDBENEFICIO        = BFB.IDBENEFICIO) AND'
      '      (PP.IDPESSOA          = BFB.IDPESSOA)    AND'
      '      (ELG.IDPESSJUR        = H1.IDPATRO)      AND'
      '      (ELG.IDPESSOA         = PP.IDPESSOA)     AND'
      '      (BFB.IDPESSOA         = HBF.IDPESSOA)    AND'
      '      (BFB.IDBENEFICIO      = HBF.IDBENEFICIO) AND'
      '      H1.IDBENEFICIO NOT  IN'
      '      (SELECT H2.IDBENEFICIO'
      '         FROM PREVIA H2'
      '         WHERE (H2.MES               = :MESANT)         AND'
      '               (P.IDPESSOA           = PP.IDPESSOA)     AND'
      '               (H2.IDPESSOA          = PP.IDPESSOA)     AND'
      '               (B.IDBENEFICIO        = BPP.IDBENEFICIO) AND'
      '               (BPP.IDBENEFICIO      = H2.IDBENEFICIO)  AND'
      '               (PLANPREV.IDPLANOPREV = H2.IDPLANOPREV))'
      'GROUP BY B.NOME'
      'ORDER BY B.NOME')
    ValidateWithMask = True
    Left = 299
    Top = 330
    ParamData = <
      item
        DataType = ftString
        Name = 'MESATU'
        ParamType = ptUnknown
        Value = '1999/11'
      end
      item
        DataType = ftString
        Name = 'MESANT'
        ParamType = ptUnknown
        Value = '1999/10'
      end>
  end
  object dsBenefConcedSub: TwwDataSource
    DataSet = qryBenefConcedSub
    Left = 299
    Top = 284
  end
  object plBenefConcedSub: TppBDEPipeline
    DataSource = dsBenefConcedSub
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plBenefConcedSub'
    Left = 299
    Top = 241
  end
  object qrySubReport02: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BE.NOME AS BENEF, SUM(HB.VLBENEFPGTO) AS VLRPGTO'
      'FROM HSTBENEFBFCIARIO HB, PESSOA PJ, BENEFICIO BE'
      'WHERE HB.MES = '#39'2001/03'#39
      'AND HB.IDPESSJUR = 2'
      'AND HB.VLBENEFPGTO > 0'
      'AND PJ.IDPESSOA = HB.IDPESSJUR'
      'AND BE.IDBENEFICIO = HB.IDBENEFICIO'
      'AND 1 = 2'
      'GROUP BY BE.NOME')
    ValidateWithMask = True
    Left = 282
    Top = 142
  end
  object dsSubReport02: TwwDataSource
    DataSet = qrySubReport02
    Left = 254
    Top = 142
  end
  object plSubReport02: TppBDEPipeline
    DataSource = dsSubReport02
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plSubReport02'
    Left = 225
    Top = 142
  end
  object qryBenefPendentes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '       PJ.NOME                AS PATRO     , BE.NOME            ' +
        '    AS BENEF         ,'
      
        '       PE.NOME                             , SUM(HB.VALORCALCULA' +
        'DO) AS VALORCALCULADO,'
      
        '       BF.DATAREQUERIMENTO    AS DATAREQ   , BF.DATAINICIO      ' +
        '    AS DATAINI       ,'
      
        '       BF.IDPLANOPREV         AS IDPLANO   , BE.IDBENEFICIO     ' +
        '                     ,'
      
        '       SUM(HB.VALORCALCULADO) AS VALORATUAL, BF.DATAINICIO      ' +
        '    AS DATAINICIO'
      'FROM PESSOA PE, BENEFICIO        BE, BENEFBFCIARIO BF,'
      '     PESSOA PJ, HSTBENEFBFCIARIO HB'
      'WHERE (BF.IDSITBENEFICIO = 4)              AND'
      '      (HB.IDTITULAR      = PE.IDPESSOA)    AND'
      '      (HB.IDPESSJUR      = PJ.IDPESSOA)    AND'
      '      (HB.IDBENEFICIO    = BE.IDBENEFICIO) AND'
      '      (BE.IDBENEFICIO    = BF.IDBENEFICIO)'
      
        'GROUP BY PJ.NOME, BE.NOME, PE.NOME, BF.DATAREQUERIMENTO, BF.DATA' +
        'INICIO,'
      '         BF.IDPLANOPREV  , BE.IDBENEFICIO'
      'ORDER BY PJ.NOME, BE.NOME, PE.NOME')
    ValidateWithMask = True
    Left = 582
    Top = 330
  end
  object plBenefPendentes: TppBDEPipeline
    DataSource = dsBenefPendentes
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plBenefPendentes'
    Left = 582
    Top = 241
  end
  object rpBenefPendentes: TppReport
    AutoStop = False
    DataPipeline = plBenefPendentes
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 5080
    PrinterSetup.mmMarginRight = 5080
    PrinterSetup.mmMarginTop = 5080
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
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
    Left = 582
    Top = 196
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'plBenefPendentes'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'RELATÓRIO DE BENEFÍCIOS PENDENTES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 56356
        mmTop = 27517
        mmWidth = 87048
        BandType = 0
      end
      object ppDBText81: TppDBText
        UserName = 'ppDBText81'
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
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText82: TppDBText
        UserName = 'ppDBText82'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText83: TppDBText
        UserName = 'ppDBText83'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25665
        BandType = 0
      end
      object ppDBImage5: TppDBImage
        UserName = 'ppDBImage5'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText84: TppDBText
        UserName = 'ppDBText84'
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
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText85: TppDBText
        UserName = 'ppDBText85'
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
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText86: TppDBText
        UserName = 'ppDBText86'
        DataField = 'NOME'
        DataPipeline = plBenefPendentes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plBenefPendentes'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 529
        mmWidth = 75936
        BandType = 4
      end
      object ppDBText87: TppDBText
        UserName = 'ppDBText87'
        DataField = 'DATAREQ'
        DataPipeline = plBenefPendentes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plBenefPendentes'
        mmHeight = 3704
        mmLeft = 79375
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText88: TppDBText
        UserName = 'ppDBText88'
        DataField = 'DATAINI'
        DataPipeline = plBenefPendentes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plBenefPendentes'
        mmHeight = 3704
        mmLeft = 103452
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText89: TppDBText
        UserName = 'ppDBText89'
        DataField = 'VALORCALCULADO'
        DataPipeline = plBenefPendentes
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plBenefPendentes'
        mmHeight = 3704
        mmLeft = 127794
        mmTop = 529
        mmWidth = 33602
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'ppLabel5'
        Caption = 'ppLabel5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 184944
        mmTop = 529
        mmWidth = 11642
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
        AutoSize = False
        Caption = 'Folha de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1588
        mmWidth = 197909
        BandType = 8
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 199919
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
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
        mmTop = 1588
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
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
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup13: TppGroup
      BreakName = 'PATRO'
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group13'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand13: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand13: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLabel133: TppLabel
          UserName = 'ppLabel133'
          Caption = 'Total por Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 794
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'ppDBCalc10'
          DataField = 'VALORCALCULADO'
          DataPipeline = plBenefPendentes
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plBenefPendentes'
          mmHeight = 3704
          mmLeft = 127794
          mmTop = 794
          mmWidth = 33602
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'ppLine4'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 196586
          BandType = 5
          GroupNo = 0
        end
        object ppLabel140: TppLabel
          UserName = 'ppLabel140'
          Caption = 'ppLabel140'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 181769
          mmTop = 794
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup14: TppGroup
      BreakName = 'BENEF'
      OutlineSettings.CreateNode = True
      UserName = 'Group14'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand14: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 19579
        mmPrintPosition = 0
        object ppLabel141: TppLabel
          UserName = 'ppLabel141'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 3704
          mmWidth = 24871
          BandType = 3
          GroupNo = 1
        end
        object ppLabel142: TppLabel
          UserName = 'ppLabel142'
          Caption = 'Benefício:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 20373
          mmTop = 8467
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLine11: TppLine
          UserName = 'ppLine11'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 18256
          mmWidth = 196586
          BandType = 3
          GroupNo = 1
        end
        object ppLabel143: TppLabel
          UserName = 'ppLabel143'
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 13758
          mmWidth = 20373
          BandType = 3
          GroupNo = 1
        end
        object ppLabel144: TppLabel
          UserName = 'ppLabel144'
          Caption = 'Requerido Em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 78581
          mmTop = 13758
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
        object ppLabel145: TppLabel
          UserName = 'ppLabel145'
          Caption = 'Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 108479
          mmTop = 13758
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppLabel146: TppLabel
          UserName = 'ppLabel146'
          Caption = 'Valor Calculado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 134409
          mmTop = 13758
          mmWidth = 26988
          BandType = 3
          GroupNo = 1
        end
        object ppLine50: TppLine
          UserName = 'ppLine50'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1852
          mmLeft = 0
          mmTop = 0
          mmWidth = 196586
          BandType = 3
          GroupNo = 1
        end
        object ppLabel147: TppLabel
          UserName = 'ppLabel147'
          Caption = 'Reajuste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 182034
          mmTop = 13758
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object rpBenefPendentesDBText1: TppDBText
          UserName = 'rpBenefPendentesDBText1'
          DataField = 'PATRO'
          DataPipeline = plBenefPendentes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'plBenefPendentes'
          mmHeight = 4233
          mmLeft = 28046
          mmTop = 3704
          mmWidth = 167482
          BandType = 3
          GroupNo = 1
        end
        object rpBenefPendentesDBText2: TppDBText
          UserName = 'rpBenefPendentesDBText2'
          DataField = 'BENEF'
          DataPipeline = plBenefPendentes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'plBenefPendentes'
          mmHeight = 4233
          mmLeft = 38629
          mmTop = 8467
          mmWidth = 156634
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand14: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppLabel148: TppLabel
          UserName = 'ppLabel148'
          Caption = 'Total por Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 20373
          mmTop = 794
          mmWidth = 32015
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'ppDBCalc11'
          DataField = 'VALORCALCULADO'
          DataPipeline = plBenefPendentes
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup14
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plBenefPendentes'
          mmHeight = 3704
          mmLeft = 127794
          mmTop = 794
          mmWidth = 33602
          BandType = 5
          GroupNo = 1
        end
        object ppLine53: TppLine
          UserName = 'ppLine53'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 196586
          BandType = 5
          GroupNo = 1
        end
        object ppLabel149: TppLabel
          UserName = 'ppLabel149'
          Caption = 'ppLabel149'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 181769
          mmTop = 794
          mmWidth = 14817
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup15: TppGroup
      BreakName = 'NOME'
      DataPipeline = plBenefPendentes
      OutlineSettings.CreateNode = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plBenefPendentes'
      object ppGroupHeaderBand15: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand15: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsBenefPendentes: TwwDataSource
    DataSet = qryBenefPendentes
    Left = 582
    Top = 284
  end
  object QryBenefSituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '       '#39'PATRO'#39'      AS PATRO     , '#39'BENEF'#39'       AS BENEF       ' +
        '  ,'
      
        '       '#39'NOME'#39'       AS NOME      , '#39'0'#39'           AS VALORCALCULA' +
        'DO,'
      
        '       '#39'01/01/2000'#39' AS DATAREQ   , '#39'01/01/2000'#39'  AS DATAINI     ' +
        '  ,'
      
        '       '#39'PLANO'#39'      AS PLANO     , '#39'IDBENEFICIO'#39' AS IDBENEFICIO ' +
        '  ,'
      '       '#39'0'#39'          AS VALORATUAL, '#39'01/01/2000'#39'  AS DATAINICIO'
      'FROM PARAMAPREV'
      '')
    ValidateWithMask = True
    Left = 672
    Top = 511
  end
  object plBenefSituacao: TppBDEPipeline
    DataSource = dsBenefSituacao
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plBenefSituacao'
    Left = 672
    Top = 425
  end
  object rpBenefSituacao: TppReport
    AutoStop = False
    DataPipeline = plBenefSituacao
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Benefícios por Situação'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 5080
    PrinterSetup.mmMarginLeft = 5080
    PrinterSetup.mmMarginRight = 5080
    PrinterSetup.mmMarginTop = 5080
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
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
    Left = 672
    Top = 381
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'plBenefSituacao'
    object ppHeaderBand25: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36513
      mmPrintPosition = 0
      object lbTituloSituacao: TppLabel
        UserName = 'lbTituloSituacao'
        Caption = 'lbTituloSituacao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 82815
        mmTop = 27517
        mmWidth = 32808
        BandType = 0
      end
      object ppDBText90: TppDBText
        UserName = 'ppDBText90'
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
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText91: TppDBText
        UserName = 'ppDBText91'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText92: TppDBText
        UserName = 'ppDBText92'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25665
        BandType = 0
      end
      object ppDBImage6: TppDBImage
        UserName = 'ppDBImage6'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText93: TppDBText
        UserName = 'ppDBText93'
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
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText94: TppDBText
        UserName = 'ppDBText94'
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
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
    end
    object ppDetailBand26: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText95: TppDBText
        UserName = 'ppDBText95'
        DataField = 'NOME'
        DataPipeline = plBenefSituacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plBenefSituacao'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 529
        mmWidth = 75936
        BandType = 4
      end
      object ppDBText96: TppDBText
        UserName = 'ppDBText96'
        DataField = 'DATAREQ'
        DataPipeline = plBenefSituacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plBenefSituacao'
        mmHeight = 3704
        mmLeft = 79375
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText97: TppDBText
        UserName = 'ppDBText97'
        DataField = 'DATAINI'
        DataPipeline = plBenefSituacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plBenefSituacao'
        mmHeight = 3704
        mmLeft = 103452
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText98: TppDBText
        UserName = 'ppDBText98'
        DataField = 'VALORCALCULADO'
        DataPipeline = plBenefSituacao
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plBenefSituacao'
        mmHeight = 3704
        mmLeft = 127794
        mmTop = 529
        mmWidth = 33602
        BandType = 4
      end
      object ppLabel151: TppLabel
        UserName = 'ppLabel151'
        Caption = 'ppLabel151'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 182034
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
    end
    object ppFooterBand25: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel152: TppLabel
        UserName = 'ppLabel152'
        AutoSize = False
        Caption = 'Folha de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1588
        mmWidth = 197909
        BandType = 8
      end
      object ppLine54: TppLine
        UserName = 'ppLine54'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 199919
        BandType = 8
      end
      object ppCalc41: TppSystemVariable
        UserName = 'Calc41'
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
        mmTop = 1588
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc42: TppSystemVariable
        UserName = 'Calc42'
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
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup16: TppGroup
      BreakName = 'PATRO'
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group16'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand16: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand16: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLabel153: TppLabel
          UserName = 'ppLabel153'
          Caption = 'Total por Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 794
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'ppDBCalc12'
          DataField = 'VALORCALCULADO'
          DataPipeline = plBenefSituacao
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup16
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plBenefSituacao'
          mmHeight = 3704
          mmLeft = 127794
          mmTop = 794
          mmWidth = 33602
          BandType = 5
          GroupNo = 0
        end
        object ppLine55: TppLine
          UserName = 'ppLine55'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 196586
          BandType = 5
          GroupNo = 0
        end
        object ppLabel154: TppLabel
          UserName = 'ppLabel154'
          Caption = 'ppLabel154'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 181769
          mmTop = 794
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup17: TppGroup
      BreakName = 'BENEF'
      OutlineSettings.CreateNode = True
      UserName = 'Group17'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand17: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 19579
        mmPrintPosition = 0
        object ppLabel155: TppLabel
          UserName = 'ppLabel155'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 3704
          mmWidth = 24871
          BandType = 3
          GroupNo = 1
        end
        object ppLabel156: TppLabel
          UserName = 'ppLabel156'
          Caption = 'Benefício:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 20373
          mmTop = 8467
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLine56: TppLine
          UserName = 'ppLine56'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 18256
          mmWidth = 196586
          BandType = 3
          GroupNo = 1
        end
        object ppLabel157: TppLabel
          UserName = 'ppLabel157'
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 13758
          mmWidth = 20373
          BandType = 3
          GroupNo = 1
        end
        object lbDataReq: TppLabel
          UserName = 'lbDataReq'
          AutoSize = False
          Caption = 'Requerido Em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 76465
          mmTop = 13758
          mmWidth = 27252
          BandType = 3
          GroupNo = 1
        end
        object lbDataIni: TppLabel
          UserName = 'lbDataIni'
          AutoSize = False
          Caption = 'DIB'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 105040
          mmTop = 13758
          mmWidth = 23813
          BandType = 3
          GroupNo = 1
        end
        object ppLabel160: TppLabel
          UserName = 'ppLabel160'
          Caption = 'Valor Calculado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 134409
          mmTop = 13758
          mmWidth = 26988
          BandType = 3
          GroupNo = 1
        end
        object ppLine57: TppLine
          UserName = 'ppLine57'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1852
          mmLeft = 0
          mmTop = 0
          mmWidth = 196586
          BandType = 3
          GroupNo = 1
        end
        object ppLabel161: TppLabel
          UserName = 'ppLabel161'
          Caption = 'Reajuste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 182034
          mmTop = 13758
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object ppDBText99: TppDBText
          UserName = 'ppDBText99'
          DataField = 'PATRO'
          DataPipeline = plBenefSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'plBenefSituacao'
          mmHeight = 4233
          mmLeft = 28046
          mmTop = 3704
          mmWidth = 167482
          BandType = 3
          GroupNo = 1
        end
        object ppDBText100: TppDBText
          UserName = 'ppDBText100'
          DataField = 'BENEF'
          DataPipeline = plBenefSituacao
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'plBenefSituacao'
          mmHeight = 4233
          mmLeft = 38629
          mmTop = 8467
          mmWidth = 156634
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand17: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppLabel162: TppLabel
          UserName = 'ppLabel162'
          Caption = 'Total por Benefício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 20373
          mmTop = 794
          mmWidth = 32015
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'ppDBCalc13'
          DataField = 'VALORCALCULADO'
          DataPipeline = plBenefSituacao
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup17
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plBenefSituacao'
          mmHeight = 3704
          mmLeft = 127794
          mmTop = 794
          mmWidth = 33602
          BandType = 5
          GroupNo = 1
        end
        object ppLine58: TppLine
          UserName = 'ppLine58'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 0
          mmWidth = 196586
          BandType = 5
          GroupNo = 1
        end
        object ppLabel163: TppLabel
          UserName = 'ppLabel163'
          Caption = 'ppLabel163'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 182034
          mmTop = 794
          mmWidth = 14552
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup18: TppGroup
      BreakName = 'NOME'
      DataPipeline = plBenefSituacao
      OutlineSettings.CreateNode = True
      UserName = 'Group18'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plBenefSituacao'
      object ppGroupHeaderBand18: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand18: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsBenefSituacao: TwwDataSource
    DataSet = QryBenefSituacao
    Left = 672
    Top = 467
  end
  object rpCredBenefBanAux: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline4
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 616
    Top = 7
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEPipeline4'
    object ppHeaderBand24: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 50271
      mmPrintPosition = 0
      object ppLabel67: TppLabel
        UserName = 'ppLabel67'
        Caption = 'Relação de Pagamento de Benefícios - por Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 27252
        mmWidth = 197115
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 45773
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'ppLabel70'
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 23019
        mmTop = 45773
        mmWidth = 8202
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'ppLabel92'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1323
        mmTop = 45773
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel134: TppLabel
        UserName = 'ppLabel134'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 104775
        mmTop = 45773
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel135: TppLabel
        UserName = 'ppLabel135'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 179917
        mmTop = 45773
        mmWidth = 9525
        BandType = 0
      end
      object ppLine49: TppLine
        UserName = 'ppLine49'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 49742
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel136: TppLabel
        UserName = 'ppLabel136'
        Caption = 'rpCredBenefBanLabel2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 34925
        mmWidth = 55298
        BandType = 0
      end
      object ppLabel137: TppLabel
        UserName = 'ppLabel137'
        Caption = 'REFERÊNCIA:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 40481
        mmWidth = 23019
        BandType = 0
      end
      object ppLabel138: TppLabel
        UserName = 'ppLabel138'
        Caption = 'rpCredBenefBanLabel5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 24077
        mmTop = 40217
        mmWidth = 169598
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'ppDBText16'
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
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText70: TppDBText
        UserName = 'ppDBText70'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText73: TppDBText
        UserName = 'ppDBText73'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 24606
        BandType = 0
      end
      object ppDBImage4: TppDBImage
        UserName = 'ppDBImage4'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText74: TppDBText
        UserName = 'ppDBText74'
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
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 14288
        BandType = 0
      end
      object ppDBText75: TppDBText
        UserName = 'ppDBText75'
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
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 13494
        BandType = 0
      end
    end
    object ppDetailBand25: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
      DataPipeline = ppCredBenef
    end
    object ppFooterBand24: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLine51: TppLine
        UserName = 'ppLine51'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel139: TppLabel
        UserName = 'ppLabel139'
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
        mmTop = 4498
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc39: TppSystemVariable
        UserName = 'Calc39'
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
        mmTop = 4498
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc40: TppSystemVariable
        UserName = 'ppCalc401'
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
        mmTop = 4498
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object ppLabel150: TppLabel
        UserName = 'ppLabel150'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 150019
        mmTop = 1058
        mmWidth = 6085
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'ppDBCalc14'
        DataField = 'VALOR'
        DataPipeline = ppBDEPipeline4
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline4'
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 1058
        mmWidth = 25400
        BandType = 7
      end
      object ppLine52: TppLine
        UserName = 'ppLine52'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 265
        mmWidth = 197380
        BandType = 7
      end
      object ppLabel158: TppLabel
        UserName = 'ppLabel158'
        Caption = 'Quantidade Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 79375
        mmTop = 1058
        mmWidth = 21431
        BandType = 7
      end
      object ppDBCalc15: TppDBCalc
        UserName = 'ppDBCalc15'
        DataField = 'QUANTIDADE'
        DataPipeline = ppBDEPipeline4
        DisplayFormat = '######'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline4'
        mmHeight = 3704
        mmLeft = 107421
        mmTop = 1058
        mmWidth = 17198
        BandType = 7
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'BANCOPAGADOR'
      DataPipeline = ppBDEPipeline4
      OutlineSettings.CreateNode = True
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPipeline4'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rpCredBenefBanDBText6: TppDBText
          UserName = 'rpCredBenefBanDBText6'
          DataField = 'NUMBANCO'
          DataPipeline = ppBDEPipeline4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipeline4'
          mmHeight = 3704
          mmLeft = 1323
          mmTop = 529
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object rpCredBenefBanDBText7: TppDBText
          UserName = 'rpCredBenefBanDBText7'
          DataField = 'NOME'
          DataPipeline = ppBDEPipeline4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppBDEPipeline4'
          mmHeight = 3704
          mmLeft = 23019
          mmTop = 529
          mmWidth = 81492
          BandType = 5
          GroupNo = 0
        end
        object rpCredBenefBanDBText8: TppDBText
          UserName = 'rpCredBenefBanDBText8'
          DataField = 'QUANTIDADE'
          DataPipeline = ppBDEPipeline4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipeline4'
          mmHeight = 3704
          mmLeft = 104511
          mmTop = 529
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object rpCredBenefBanDBText9: TppDBText
          UserName = 'rpCredBenefBanDBText9'
          DataField = 'VALOR'
          DataPipeline = ppBDEPipeline4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDEPipeline4'
          mmHeight = 3704
          mmLeft = 139436
          mmTop = 529
          mmWidth = 50006
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppBDEPipeline4: TppBDEPipeline
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'BDEPipeline4'
    Left = 616
    Top = 52
  end
  object dsReciboAdiantamento: TwwDataSource
    DataSet = qryReciboAdiantamento
    Left = 134
    Top = 97
  end
  object qryReciboAdiantamento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      ':extenso as Extenso, '
      ':sdetalhe as detalhe, '
      ':banco as banco, '
      ':agencia as agencia,'
      ':cc as contacorrente,'
      ':identidade as identidade,'
      ':cpf as cpf,'
      ':nome as nome '
      'from dual')
    ValidateWithMask = True
    Left = 162
    Top = 97
    ParamData = <
      item
        DataType = ftMemo
        Name = 'extenso'
        ParamType = ptUnknown
      end
      item
        DataType = ftMemo
        Name = 'sdetalhe'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'banco'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'agencia'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cc'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'identidade'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'cpf'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptUnknown
      end>
  end
  object ppReportReciboAdiantamento: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipelineReciboAdiantamento
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ppReportReciboAdiantamento'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 78
    Top = 97
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipelineReciboAdiantamento'
    object ppReportReciboAdiantamentoTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object ppReportReciboAdiantamentoShape7: TppShape
        UserName = 'ppReportReciboAdiantamentoShape7'
        Shape = stRoundRect
        mmHeight = 22490
        mmLeft = 1852
        mmTop = 1058
        mmWidth = 193675
        BandType = 1
      end
      object ppReportReciboAdiantamentoLabel1: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel1'
        Caption = 'Recibo de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = []
        Transparent = True
        mmHeight = 7144
        mmLeft = 66940
        mmTop = 11906
        mmWidth = 62971
        BandType = 1
      end
      object Titulo: TppLabel
        UserName = 'Titulo'
        Caption = 'Titulo do Relatorio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 18
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7144
        mmLeft = 71173
        mmTop = 3175
        mmWidth = 51594
        BandType = 1
      end
    end
    object ppReportReciboAdiantamentoDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 122238
      mmPrintPosition = 0
      object ppReportReciboAdiantamentoShape6: TppShape
        UserName = 'ppReportReciboAdiantamentoShape6'
        Shape = stRoundRect
        mmHeight = 118534
        mmLeft = 1852
        mmTop = 2117
        mmWidth = 193940
        BandType = 4
      end
      object ppReportReciboAdiantamentoDBMemo1: TppDBMemo
        UserName = 'ppReportReciboAdiantamentoDBMemo1'
        CharWrap = False
        DataField = 'EXTENSO'
        DataPipeline = ppBDEPipelineReciboAdiantamento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipelineReciboAdiantamento'
        mmHeight = 102923
        mmLeft = 7144
        mmTop = 9525
        mmWidth = 183886
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppReportReciboAdiantamentoFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 134938
      mmPrintPosition = 0
      object ppReportReciboAdiantamentoShape1: TppShape
        UserName = 'ppReportReciboAdiantamentoShape1'
        Shape = stRoundRect
        mmHeight = 55033
        mmLeft = 1588
        mmTop = 2117
        mmWidth = 194205
        BandType = 8
      end
      object ppReportReciboAdiantamentoShape3: TppShape
        UserName = 'ppReportReciboAdiantamentoShape3'
        Shape = stRoundRect
        mmHeight = 26988
        mmLeft = 1588
        mmTop = 80963
        mmWidth = 97367
        BandType = 8
      end
      object ppReportReciboAdiantamentoShape4: TppShape
        UserName = 'ppReportReciboAdiantamentoShape4'
        Shape = stRoundRect
        mmHeight = 26988
        mmLeft = 103452
        mmTop = 80963
        mmWidth = 92340
        BandType = 8
      end
      object ppReportReciboAdiantamentoShape2: TppShape
        UserName = 'ppReportReciboAdiantamentoShape2'
        Shape = stRoundRect
        mmHeight = 18785
        mmLeft = 1588
        mmTop = 60061
        mmWidth = 194205
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel10: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel10'
        Caption = 'Nome :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 8202
        mmTop = 5821
        mmWidth = 11113
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel11: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel11'
        Caption = 'Banco :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7938
        mmTop = 11642
        mmWidth = 11906
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel12: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel12'
        Caption = 'Agência :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7938
        mmTop = 17463
        mmWidth = 14552
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel13: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel13'
        Caption = 'CPF :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7673
        mmTop = 23283
        mmWidth = 8996
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel14: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel14'
        Caption = 'C/C: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 121709
        mmTop = 17727
        mmWidth = 7938
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel15: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel15'
        Caption = 'Identidade :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7673
        mmTop = 29369
        mmWidth = 17727
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel16: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel16'
        Caption = 'Orgão Expedidor :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 65881
        mmTop = 29369
        mmWidth = 27781
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel17: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel17'
        Caption = 'UF: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 122767
        mmTop = 28575
        mmWidth = 6615
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel19: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel19'
        Caption = 'Assinatura do Responsável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 135202
        mmTop = 49742
        mmWidth = 41540
        BandType = 8
      end
      object ppReportReciboAdiantamentoLine1: TppLine
        UserName = 'ppReportReciboAdiantamentoLine1'
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 127000
        mmTop = 48419
        mmWidth = 60325
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel20: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel20'
        Caption = 
          'Pagamento :    [     ]    EM ESPÉCIE     [     ]  EM BANCO     _' +
          '______________ AGÊNCIA : ________________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 63236
        mmWidth = 172509
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel21: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel21'
        Caption = 
          'CHEQUE Nº : ___________________     [     ]   O.B. Nº  _________' +
          '________ EM  ________/_____/__________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 70644
        mmWidth = 172244
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel22: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel22'
        Caption = 'Autorizo o Pagamento (Assinatura e carimbo)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 5292
        mmTop = 84138
        mmWidth = 69850
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel23: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel23'
        Caption = 'Tesouraria (Assinatura e carimbo)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 107686
        mmTop = 83873
        mmWidth = 51594
        BandType = 8
      end
      object ppReportReciboAdiantamentoShape5: TppShape
        UserName = 'ppReportReciboAdiantamentoShape5'
        Shape = stRoundRect
        mmHeight = 23813
        mmLeft = 1588
        mmTop = 110331
        mmWidth = 193675
        BandType = 8
      end
      object ppReportReciboAdiantamentoLabel24: TppLabel
        UserName = 'ppReportReciboAdiantamentoLabel24'
        Caption = 'Observações :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 111390
        mmWidth = 21960
        BandType = 8
      end
      object sNome: TppLabel
        UserName = 'sNome'
        Caption = 'sNome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 26723
        mmTop = 5821
        mmWidth = 10848
        BandType = 8
      end
      object sBanco: TppLabel
        UserName = 'sBanco'
        Caption = 'sBanco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 26723
        mmTop = 11906
        mmWidth = 11642
        BandType = 8
      end
      object sAgencia: TppLabel
        UserName = 'sAgencia'
        Caption = 'sAgencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 26723
        mmTop = 17463
        mmWidth = 14288
        BandType = 8
      end
      object sCPF1: TppLabel
        UserName = 'sCPF1'
        Caption = 'sCPF1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 26458
        mmTop = 23283
        mmWidth = 10583
        BandType = 8
      end
      object sIdentidade: TppLabel
        UserName = 'sIdentidade'
        Caption = 'sIdentidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 26723
        mmTop = 29369
        mmWidth = 17463
        BandType = 8
      end
      object sOE: TppLabel
        UserName = 'sOE'
        Caption = 'sOE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 94986
        mmTop = 29369
        mmWidth = 6879
        BandType = 8
      end
      object sCC: TppLabel
        UserName = 'sCC'
        Caption = 'sCC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 130704
        mmTop = 17727
        mmWidth = 6615
        BandType = 8
      end
      object sUF: TppLabel
        UserName = 'sUF'
        Caption = 'sUF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 130704
        mmTop = 28575
        mmWidth = 6350
        BandType = 8
      end
      object rpMemObs: TppMemo
        UserName = 'rpMemObs'
        Caption = 'rpMemObs'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 15346
        mmLeft = 4498
        mmTop = 116152
        mmWidth = 188913
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppReportReciboAdiantamentoCalc1: TppSystemVariable
        UserName = 'ReportReciboAdiantamentoCalc1'
        DisplayFormat = 'dddddd'#9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 35719
        mmTop = 50006
        mmWidth = 63500
        BandType = 8
      end
    end
  end
  object ppBDEPipelineReciboAdiantamento: TppBDEPipeline
    DataSource = dsReciboAdiantamento
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'BDEPipelineReciboAdiantamento'
    Left = 106
    Top = 97
  end
  object dsCredBenefAgen: TwwDataSource
    DataSet = qryCredBenefAgen
    Left = 490
    Top = 467
  end
  object qryCredBenefAgen: TwwQuery
    BeforeOpen = qryCredBenefAgenBeforeOpen
    AfterOpen = qryCredBenefAgenAfterOpen
    AfterClose = qryCredBenefAgenAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT H.CODPORTFORMA, PC.NOCONTACORR, PF.DESCRICAO AS CENTRALIZ' +
        'A,'
      '       H.NUMBANCO, H.NOME, H.NUMAGENCIA, H.AGENCIA,'
      '       SUM(H.VALORPROVENTO) AS VALOR,'
      '       COUNT(DISTINCT H.IDRESPONSAVEL) AS QUANTIDADE'
      'FROM (SELECT HS.CODPORTFORMA,'
      
        '             HS.IDRESPONSAVEL, HS.MES, BA.NUMBANCO, BAN.NOME, AG' +
        '.NUMAGENCIA,'
      
        '             AGENCIA.NOME AS AGENCIA, HS.VALORPROVENTO AS VALOR2' +
        ','
      '             PR.FLGESPECIAL, PR.FLGDESCONTO,'
      
        '             DECODE(PR.FLGDESCONTO,0,DECODE(PR.FLGESPECIAL,0,HS.' +
        'VALORPROVENTO,0),DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO*-1,0))' +
        ' VALORPROVENTO'
      
        '      FROM HISTRUBSAL HS, PROVDESC PR, CONTABANCARIA CB, AGENCIA' +
        'BANCARIA AG, BANCO BA,'
      '           PESSOA AGENCIA, PESSOA BAN, BANCOPORTFORMA BPF'
      '      WHERE (HS.IDHSTFOLHABENEF = :IDFOLHA)'
      '      AND (PR.IDPROVENTO = HS.IDRUBRICA)'
      '      AND (PR.FLGESPECIAL <> 2)'
      '      AND (CB.FLGCONTAPREF = 1)'
      '      AND (CB.IDPESSOA = HS.IDRESPONSAVEL)'
      '      AND (CB.IDAGENCIA = AG.IDPESSOA)'
      '      AND (BA.IDPESSOA = AG.IDBANCO)'
      '      AND (AGENCIA.IDPESSOA = AG.IDPESSOA)'
      '      AND (BAN.IDPESSOA = BA.IDPESSOA)'
      '      AND (HS.CODPORTFORMA = BPF.CODPORTFORMA)'
      '      AND (BPF.IDMODULO = 18)'
      '      AND (HS.FLGESTORNO = 0 OR HS.FLGESTORNO IS NULL)) H,'
      '     PORTADORFORMA PF,'
      '     PORTADORCONTA PC'
      'WHERE H.CODPORTFORMA = PF.CODPORTFORMA'
      'AND PF.CODPORTADOR = PC.CODPORTADOR'
      'GROUP BY H.CODPORTFORMA, PC.NOCONTACORR, PF.DESCRICAO,'
      '         H.NUMBANCO, H.NOME, H.NUMAGENCIA, H.AGENCIA')
    ValidateWithMask = True
    Left = 490
    Top = 511
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFOLHA'
        ParamType = ptUnknown
        Value = 1460
      end>
    object qryCredBenefAgenCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object qryCredBenefAgenCENTRALIZA: TStringField
      FieldName = 'CENTRALIZA'
      Size = 50
    end
    object qryCredBenefAgenNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryCredBenefAgenNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryCredBenefAgenAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 60
    end
    object qryCredBenefAgenVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryCredBenefAgenQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
    object qryCredBenefAgenNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Size = 15
    end
    object qryCredBenefAgenNOCONTACORR: TStringField
      FieldName = 'NOCONTACORR'
      Size = 15
    end
  end
  object ppCredBenefBan: TppBDEPipeline
    DataSource = dsCredBenefBan
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'CredBenefBan'
    Left = 582
    Top = 425
    object ppCredBenefBanppField1: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppCredBenefBanppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppCredBenefBanppField3: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppCredBenefBanppField4: TppField
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object dsCredBenefBan: TwwDataSource
    DataSet = QryCredBenefBan
    Left = 582
    Top = 467
  end
  object QryCredBenefBan: TwwQuery
    AfterOpen = QryCredBenefBanAfterOpen
    AfterClose = QryCredBenefBanAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BA.NUMBANCO, BAN.NOME,'
      '       SUM(DECODE(PR.FLGDESCONTO,0,'
      '                  DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO,0),'
      
        '                  DECODE(PR.FLGESPECIAL,0,HS.VALORPROVENTO*-1,0)' +
        ')) AS VALOR,'
      '       COUNT(DISTINCT HS.IDRESPONSAVEL) AS QUANTIDADE'
      'FROM HISTRUBSAL HS, PROVDESC PR, PESSOA PE, BANCO BA, PESSOA BAN'
      'WHERE (HS.IDHSTFOLHABENEF = :IDFOLHA)'
      'AND (PR.IDPROVENTO = HS.IDRUBRICA)'
      'AND (PR.FLGESPECIAL <> 2)'
      'AND (PE.IDPESSOA = HS.IDRESPONSAVEL)'
      'AND (HS.NUMBANCO = BA.NUMBANCO)'
      'AND (BAN.IDPESSOA = BA.IDPESSOA)'
      'AND (HS.FLGESTORNO = 0 OR HS.FLGESTORNO IS NULL)'
      'GROUP BY BA.NUMBANCO, BAN.NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 582
    Top = 511
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFOLHA'
        ParamType = ptUnknown
      end>
    object QryCredBenefBanNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object QryCredBenefBanNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QryCredBenefBanVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryCredBenefBanQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
  end
  object qryRelLayout: TwwQuery
    BeforeOpen = qryRelLayoutBeforeOpen
    AfterClose = qryRelLayoutAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PP.INSCRICAONUMERO, EL.MATRICULA,'
      #9'P.NOME, TD.VALOR, td.valorrecebido'
      'FROM TMPDESC TD, PARTPREVPLAN PP, ELEGPATRO EL, PESSOA P'
      'WHERE TD.IDLOTE = 772711'
      'AND 1 = 2     '
      
        'AND TD.IDTITULAR NOT IN (SELECT IDTITULAR FROM PREVIA           ' +
        '             '
      #9#9#9'       WHERE MESCOBRANCA = '#39'2001/05'#39'       '
      #9#9#9#9' AND IDRUBRICA = 4101) '
      'AND PP.IDPESSOA = TD.IDTITULAR'
      'AND EL.IDPESSOA = TD.IDTITULAR'
      'AND P.IDPESSOA  = TD.IDTITULAR'
      'AND PP.FLGDESATIVADO = 0'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 748
    Top = 511
  end
  object dsLayout: TwwDataSource
    DataSet = qryRelLayout
    Left = 748
    Top = 467
  end
  object plLayout: TppBDEPipeline
    DataSource = dsLayout
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plLayout'
    Left = 748
    Top = 425
    object plLayoutppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object plLayoutppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 1
    end
    object plLayoutppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object plLayoutppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object plLayoutppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
  end
  object ppLayout: TppReport
    AutoStop = False
    DataPipeline = plLayout
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Importações de Convênios'
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
    Left = 748
    Top = 381
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'plLayout'
    object ppHeaderBand29: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 57679
      mmPrintPosition = 0
      object ppLabel166: TppLabel
        UserName = 'ppLabel166'
        Caption = 'Relatório de Importação de Convênios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 72761
        mmTop = 20638
        mmWidth = 77258
        BandType = 0
      end
      object ppLine66: TppLine
        UserName = 'ppLine66'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 197300
        BandType = 0
      end
      object ppLine67: TppLine
        UserName = 'ppLine67'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 48419
        mmWidth = 197300
        BandType = 0
      end
      object ppDBText79: TppDBText
        UserName = 'ppDBText79'
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
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText80: TppDBText
        UserName = 'ppDBText80'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText103: TppDBText
        UserName = 'ppDBText103'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBImage8: TppDBImage
        UserName = 'ppDBImage8'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText104: TppDBText
        UserName = 'ppDBText104'
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
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText105: TppDBText
        UserName = 'ppDBText105'
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
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel167: TppLabel
        UserName = 'ppLabel167'
        Caption = 'Rubrica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 36513
        mmWidth = 14023
        BandType = 0
      end
      object ppLayoutLabel1: TppLabel
        UserName = 'ppLayoutLabel1'
        Caption = 'Mês Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 42863
        mmWidth = 26988
        BandType = 0
      end
      object lblRubrica: TppLabel
        UserName = 'lblRubrica'
        Caption = 'lblRubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 16933
        mmTop = 36513
        mmWidth = 17198
        BandType = 0
      end
      object lblMesRef: TppLabel
        UserName = 'lblMesRef'
        Caption = 'lblMesRef'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 30163
        mmTop = 42863
        mmWidth = 16404
        BandType = 0
      end
      object ppLayoutLabel2: TppLabel
        UserName = 'ppLayoutLabel2'
        Caption = 'Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 20373
        mmTop = 52388
        mmWidth = 15081
        BandType = 0
      end
      object ppLayoutLabel4: TppLabel
        UserName = 'ppLayoutLabel4'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 41275
        mmTop = 52388
        mmWidth = 9790
        BandType = 0
      end
      object ppLayoutLabel5: TppLabel
        UserName = 'ppLayoutLabel5'
        AutoSize = False
        Caption = 'Valor Original'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 8202
        mmLeft = 154782
        mmTop = 48419
        mmWidth = 12700
        BandType = 0
      end
      object ppLayoutLine1: TppLine
        UserName = 'ppLayoutLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 56621
        mmWidth = 197300
        BandType = 0
      end
      object ppLayoutLabel6: TppLabel
        UserName = 'ppLayoutLabel6'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 52388
        mmWidth = 15610
        BandType = 0
      end
      object lblDescricao: TppLabel
        UserName = 'Label1'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 30427
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Valor Processado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 8202
        mmLeft = 174625
        mmTop = 48419
        mmWidth = 20638
        BandType = 0
      end
    end
    object ppDetailBand30: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppLayoutDBText3: TppDBText
        UserName = 'ppLayoutDBText3'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = plLayout
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plLayout'
        mmHeight = 3969
        mmLeft = 20373
        mmTop = 0
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText108: TppDBText
        UserName = 'ppDBText108'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = plLayout
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plLayout'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppLayoutDBText1: TppDBText
        UserName = 'ppLayoutDBText1'
        DataField = 'NOME'
        DataPipeline = plLayout
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plLayout'
        mmHeight = 3969
        mmLeft = 41275
        mmTop = 0
        mmWidth = 98954
        BandType = 4
      end
      object ppLayoutDBText2: TppDBText
        UserName = 'ppLayoutDBText2'
        DataField = 'VALOR'
        DataPipeline = plLayout
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plLayout'
        mmHeight = 3969
        mmLeft = 142875
        mmTop = 0
        mmWidth = 24606
        BandType = 4
      end
      object ppDBText119: TppDBText
        UserName = 'DBText119'
        DataField = 'VALORRECEBIDO'
        DataPipeline = plLayout
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plLayout'
        mmHeight = 3969
        mmLeft = 171450
        mmTop = 0
        mmWidth = 24606
        BandType = 4
      end
    end
    object ppFooterBand29: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLine68: TppLine
        UserName = 'ppLine68'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel169: TppLabel
        UserName = 'ppLabel169'
        AutoSize = False
        Caption = 'Folha de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2910
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc47: TppSystemVariable
        UserName = 'Calc47'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc48: TppSystemVariable
        UserName = 'Calc48'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 98161
        mmTop = 2910
        mmWidth = 18785
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      AfterPrint = ppSummaryBand5AfterPrint
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLabel170: TppLabel
        UserName = 'ppLabel170'
        Caption = 'Total Geral a ser Processado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 115094
        mmTop = 7408
        mmWidth = 49742
        BandType = 7
      end
      object ppLayoutDBCalc1: TppDBCalc
        UserName = 'ppLayoutDBCalc1'
        DataField = 'VALOR'
        DataPipeline = plLayout
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plLayout'
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 7144
        mmWidth = 21431
        BandType = 7
      end
      object ppLayoutDBCalc2: TppDBCalc
        UserName = 'ppLayoutDBCalc2'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = plLayout
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'plLayout'
        mmHeight = 4233
        mmLeft = 171715
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
      end
      object ppLayoutLabel7: TppLabel
        UserName = 'ppLayoutLabel7'
        Caption = 'Quantidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 144198
        mmTop = 1852
        mmWidth = 20638
        BandType = 7
      end
      object ppLine71: TppLine
        UserName = 'Line71'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel40: TppLabel
        UserName = 'ppLabel1701'
        Caption = 'Total Geral Processado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 124619
        mmTop = 12965
        mmWidth = 40217
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'VALORRECEBIDO'
        DataPipeline = plLayout
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plLayout'
        mmHeight = 4233
        mmLeft = 167482
        mmTop = 12700
        mmWidth = 21431
        BandType = 7
      end
    end
  end
  object rpCredBenefBan: TppReport
    AutoStop = False
    DataPipeline = ppCredBenefBan
    OnStartPage = rpCredBenefBanStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relação de Crédito de Beneficiários por Banco'
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 582
    Top = 381
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppCredBenefBan'
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 50271
      mmPrintPosition = 0
      object ppLabel85: TppLabel
        UserName = 'ppLabel85'
        Caption = 'Relação de Pagamento de Benefícios - por Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 41010
        mmTop = 27781
        mmWidth = 114829
        BandType = 0
      end
      object ppReport1Line3: TppLine
        UserName = 'ppReport1Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 45773
        mmWidth = 197300
        BandType = 0
      end
      object ppReport1Label3: TppLabel
        UserName = 'ppReport1Label3'
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23019
        mmTop = 45773
        mmWidth = 8731
        BandType = 0
      end
      object ppReport1Label4: TppLabel
        UserName = 'ppReport1Label4'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 45773
        mmWidth = 10319
        BandType = 0
      end
      object ppReport1Label5: TppLabel
        UserName = 'ppReport1Label5'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 124619
        mmTop = 45773
        mmWidth = 16404
        BandType = 0
      end
      object ppReport1Label6: TppLabel
        UserName = 'ppReport1Label6'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 181769
        mmTop = 45773
        mmWidth = 7673
        BandType = 0
      end
      object ppReport1Line4: TppLine
        UserName = 'ppReport1Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 49742
        mmWidth = 197300
        BandType = 0
      end
      object ppLabelVersao: TppLabel
        UserName = 'LabelVersao'
        AutoSize = False
        Caption = 'Referência da Folha de Benefícios:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 38100
        mmWidth = 196321
        BandType = 0
      end
      object rpCredBenefBanDBText1: TppDBText
        UserName = 'rpCredBenefBanDBText1'
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
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object rpCredBenefBanDBText2: TppDBText
        UserName = 'rpCredBenefBanDBText2'
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
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpCredBenefBanDBText3: TppDBText
        UserName = 'rpCredBenefBanDBText3'
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
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object rpCredBenefBanDBImage1: TppDBImage
        UserName = 'rpCredBenefBanDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object rpCredBenefBanDBText4: TppDBText
        UserName = 'rpCredBenefBanDBText4'
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
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 15875
        BandType = 0
      end
      object rpCredBenefBanDBText5: TppDBText
        UserName = 'rpCredBenefBanDBText5'
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
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
    end
    object ppDetailBand17: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShapeCor: TppShape
        OnPrint = ppShapeCorPrint
        UserName = 'ShapeCor'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object rpCredBenefBanDBText10: TppDBText
        UserName = 'rpCredBenefBanDBText10'
        DataField = 'NUMBANCO'
        DataPipeline = ppCredBenefBan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppCredBenefBan'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object rpCredBenefBanDBText11: TppDBText
        UserName = 'rpCredBenefBanDBText11'
        DataField = 'NOME'
        DataPipeline = ppCredBenefBan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppCredBenefBan'
        mmHeight = 3704
        mmLeft = 22754
        mmTop = 529
        mmWidth = 98161
        BandType = 4
      end
      object rpCredBenefBanDBText12: TppDBText
        UserName = 'rpCredBenefBanDBText12'
        DataField = 'QUANTIDADE'
        DataPipeline = ppCredBenefBan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCredBenefBan'
        mmHeight = 3704
        mmLeft = 126736
        mmTop = 529
        mmWidth = 13758
        BandType = 4
      end
      object rpCredBenefBanDBText13: TppDBText
        UserName = 'rpCredBenefBanDBText13'
        DataField = 'VALOR'
        DataPipeline = ppCredBenefBan
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCredBenefBan'
        mmHeight = 3704
        mmLeft = 165629
        mmTop = 529
        mmWidth = 23283
        BandType = 4
      end
    end
    object ppFooterBand16: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 33338
      mmPrintPosition = 0
      object rpCredBenefBanLine1: TppLine
        UserName = 'rpCredBenefBanLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 27517
        mmWidth = 197300
        BandType = 8
      end
      object rpCredBenefBanLabel3: TppLabel
        UserName = 'rpCredBenefBanLabel3'
        AutoSize = False
        Caption = 'Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 28840
        mmWidth = 197909
        BandType = 8
      end
      object lbAssina1: TppLabel
        UserName = 'lbAssina1'
        AutoSize = False
        Caption = 'lbAssina1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 8202
        mmTop = 10583
        mmWidth = 74877
        BandType = 8
      end
      object lbAssina2: TppLabel
        UserName = 'lbAssina2'
        AutoSize = False
        Caption = 'lbAssina2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 115094
        mmTop = 11377
        mmWidth = 74877
        BandType = 8
      end
      object rpCredBenefBanLine2: TppLine
        UserName = 'rpCredBenefBanLine2'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 115094
        mmTop = 9790
        mmWidth = 74877
        BandType = 8
      end
      object rpCredBenefBanLine3: TppLine
        UserName = 'rpCredBenefBanLine3'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 8202
        mmTop = 9525
        mmWidth = 74877
        BandType = 8
      end
      object rpCredBenefBanCalc1: TppSystemVariable
        UserName = 'rpCredBenefBanCalc1'
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
        mmLeft = 0
        mmTop = 28840
        mmWidth = 197380
        BandType = 8
      end
      object rpCredBenefBanCalc2: TppSystemVariable
        UserName = 'rpCredBenefBanCalc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168805
        mmTop = 28840
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpCredBenefBanSummaryBand1: TppSummaryBand
      BeforePrint = rpCredBenefBanSummaryBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppReport1Label7: TppLabel
        UserName = 'ppReport1Label7'
        Caption = 'Valor Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 150548
        mmTop = 1058
        mmWidth = 13758
        BandType = 7
      end
      object ppReport1DBCalc1: TppDBCalc
        UserName = 'ppReport1DBCalc1'
        DataField = 'VALOR'
        DataPipeline = ppCredBenefBan
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCredBenefBan'
        mmHeight = 3704
        mmLeft = 165629
        mmTop = 1058
        mmWidth = 23283
        BandType = 7
      end
      object ppReport1Line5: TppLine
        UserName = 'ppReport1Line5'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 265
        mmWidth = 197380
        BandType = 7
      end
      object rpCredBenefBanLabel1: TppLabel
        UserName = 'rpCredBenefBanLabel1'
        AutoSize = False
        Caption = 'Total de Bancos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 56356
        mmTop = 1058
        mmWidth = 24342
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'ppDBCalc3'
        DataField = 'QUANTIDADE'
        DataPipeline = ppCredBenefBan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppCredBenefBan'
        mmHeight = 3704
        mmLeft = 126736
        mmTop = 1058
        mmWidth = 13758
        BandType = 7
      end
      object rpCredBenefBanDBCalc1: TppDBCalc
        UserName = 'rpCredBenefBanDBCalc1'
        DataField = 'QUANTIDADE'
        DataPipeline = ppCredBenefBan
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppCredBenefBan'
        mmHeight = 3969
        mmLeft = 82550
        mmTop = 1058
        mmWidth = 16933
        BandType = 7
      end
      object rpCredBenefBanLabel6: TppLabel
        UserName = 'rpCredBenefBanLabel6'
        Caption = 'Quant. Total: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 109009
        mmTop = 1058
        mmWidth = 16404
        BandType = 7
      end
    end
  end
  object ppReport4: TppReport
    AutoStop = False
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'ppReport4'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 616
    Top = 97
    Version = '7.04'
    mmColumnWidth = 0
    object ppReport4HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppReport4DetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppReport4FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
  end
end
