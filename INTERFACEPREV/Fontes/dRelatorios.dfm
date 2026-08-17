inherited dtmRelatorios: TdtmRelatorios
  Left = 203
  Top = 107
  Width = 774
  Height = 550
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel [0]
    Left = 528
    Top = 176
    Width = 201
    Height = 105
  end
  inherited pplExemplo: TppBDEPipeline
    Left = 107
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
    Left = 59
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 9
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 151
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object qryAUX2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 75
    Top = 72
  end
  object dsAUX2: TwwDataSource
    DataSet = qryAUX2
    Left = 103
    Top = 72
  end
  object qryResRubRec: TwwQuery
    AfterOpen = qryResRubRecAfterOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PJ.NOME,'
      '       DECODE(NVL(P.FLGTPRUBRICA,'#39'G'#39'),'#39'G'#39','#39'Geral'#39','
      '                             '#39'P'#39','#39'Previdenciário'#39','
      '                             '#39'E'#39','#39'Empréstimo'#39','
      '                             '#39'A'#39','#39'Assistencial'#39') FLGTPRUBRICA,'
      '       DECODE(NVL(P.FLGATRASODEVOL,'#39'N'#39'),'#39'N'#39','#39'Normal'#39','
      '                                '#39'A'#39', '#39'Atraso'#39','
      
        '                                '#39'D'#39', '#39'Devolução'#39') FLGATRASODEVOL' +
        ','
      
        '       DECODE(P.FLGDESCONTO,'#39'0'#39','#39'Provento'#39', '#39'1'#39', '#39'Desconto'#39') FLG' +
        'DESCONTO,'
      '       H.IDRUBRICA,'
      '       R.DESCRPROVDESC,'
      '       COUNT(*) QTDE,'
      '       SUM(H.VALORPROVENTO) TOTAL'
      'FROM   HISTRUBSAL H, PROVDESC P, RUBRICAXPESS R, PESSOA PJ'
      'WHERE  (MESCOBRANCA =:MESCOBRANCA)'
      'AND    (H.IDPESSJUR IN (:IDPESSJUR))'
      'AND    (H.IDRUBRICA = R.IDRUBRICA)'
      'AND    (H.IDPESSJUR = R.IDPESSOA)'
      'AND    (R.IDRUBRICA = P.IDPROVENTO)'
      'AND    (H.IDPESSJUR = PJ.IDPESSOA)'
      'GROUP BY PJ.NOME,'
      '       P.FLGTPRUBRICA,'
      '       P.FLGATRASODEVOL,'
      '       P.FLGDESCONTO,'
      '       H.IDRUBRICA,'
      '       R.DESCRPROVDESC'
      ''
      'UNION'
      ''
      'SELECT PJ.NOME,'
      '       DECODE(NVL(P.FLGTPRUBRICA,'#39'G'#39'),'#39'G'#39','#39'Geral'#39','
      '                             '#39'P'#39','#39'Previdenciário'#39','
      '                             '#39'E'#39','#39'Empréstimo'#39','
      '                             '#39'A'#39','#39'Assistencial'#39') FLGTPRUBRICA,'
      '       DECODE(NVL(P.FLGATRASODEVOL,'#39'N'#39'),'#39'N'#39','#39'Normal'#39','
      '                                '#39'A'#39', '#39'Atraso'#39','
      
        '                                '#39'D'#39', '#39'Devolução'#39') FLGATRASODEVOL' +
        ','
      
        '       DECODE(P.FLGDESCONTO,'#39'0'#39','#39'Provento'#39', '#39'1'#39', '#39'Desconto'#39') FLG' +
        'DESCONTO,'
      '       R.IDRUBRICA,'
      '       R.DESCRPROVDESC,'
      '       COUNT(*) QTDE,'
      '       SUM(T.VALORRECEBIDO) TOTAL     '
      'FROM TMPDESC T, PROVDESC P, RUBRICAXPESS R, PESSOA PJ'
      'where  (MESCOBRANCA =:MESCOBRANCA)      '
      'AND    (T.IDPESSJUR IN (:IDPESSJUR))'
      'AND    (T.IDPROVENTO = R.IDRUBRICA)'
      'AND    (T.IDPESSJUR = R.IDPESSOA)'
      'AND    (R.IDRUBRICA = P.IDPROVENTO)'
      'AND    (T.IDPESSJUR = PJ.IDPESSOA)'
      'GROUP BY PJ.NOME,'
      '       P.FLGTPRUBRICA,'
      '       P.FLGATRASODEVOL,'
      '       P.FlgDesconto,'
      '       R.IDRUBRICA,'
      '       R.DESCRPROVDESC '
      'ORDER BY NOME,'
      '         FLGTPRUBRICA,'
      '         FLGATRASODEVOL, '
      '         FLGDESCONTO,'
      '         IDRUBRICA'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 34
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
    object qryResRubRecNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryResRubRecFLGTPRUBRICA: TStringField
      FieldName = 'FLGTPRUBRICA'
      Size = 14
    end
    object qryResRubRecFLGATRASODEVOL: TStringField
      FieldName = 'FLGATRASODEVOL'
      Size = 9
    end
    object qryResRubRecFLGDESCONTO: TStringField
      FieldName = 'FLGDESCONTO'
      Size = 8
    end
    object qryResRubRecIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object qryResRubRecDESCRPROVDESC: TStringField
      FieldName = 'DESCRPROVDESC'
      Size = 130
    end
    object qryResRubRecQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object qryResRubRecTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object dsResRubRec: TwwDataSource
    DataSet = qryResRubRec
    Left = 75
    Top = 136
  end
  object ppResRubRec: TppBDEPipeline
    DataSource = dsResRubRec
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'ResRubRec'
    Left = 123
    Top = 136
    object ppResRubRecppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppResRubRecppField2: TppField
      FieldAlias = 'FLGTPRUBRICA'
      FieldName = 'FLGTPRUBRICA'
      FieldLength = 14
      DisplayWidth = 14
      Position = 1
    end
    object ppResRubRecppField3: TppField
      FieldAlias = 'FLGATRASODEVOL'
      FieldName = 'FLGATRASODEVOL'
      FieldLength = 9
      DisplayWidth = 9
      Position = 2
    end
    object ppResRubRecppField4: TppField
      FieldAlias = 'FLGDESCONTO'
      FieldName = 'FLGDESCONTO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppResRubRecppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRUBRICA'
      FieldName = 'IDRUBRICA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppResRubRecppField6: TppField
      FieldAlias = 'DESCRPROVDESC'
      FieldName = 'DESCRPROVDESC'
      FieldLength = 130
      DisplayWidth = 130
      Position = 5
    end
    object ppResRubRecppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppResRubRecppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
  end
  object rpResRubRec: TppReport
    AutoStop = False
    DataPipeline = ppResRubRec
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
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 167
    Top = 136
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppResRubRec'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39688
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Resumo das Rubricas Recebidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 66675
        mmTop = 8731
        mmWidth = 66940
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel2'
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
      object rpResRubRecLabel1: TppLabel
        UserName = 'rpResRubRecLabel1'
        Caption = 'Patrocinadora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 17463
        mmWidth = 22225
        BandType = 0
      end
      object rpResRubRecDBText1: TppDBText
        UserName = 'rpResRubRecDBText1'
        DataField = 'NOME'
        DataPipeline = ppResRubRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResRubRec'
        mmHeight = 4233
        mmLeft = 22754
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object rpResRubRecLabel9: TppLabel
        UserName = 'rpResRubRecLabel9'
        Caption = 'Mês de Cobrança: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 117740
        mmTop = 17463
        mmWidth = 29104
        BandType = 0
      end
      object lblMes: TppLabel
        UserName = 'lblMes'
        Caption = 'lblMes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 147373
        mmTop = 17463
        mmWidth = 10054
        BandType = 0
      end
      object rpResRubRecLabel2: TppLabel
        UserName = 'rpResRubRecLabel2'
        Caption = 'Tipo de Rubrica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 22754
        mmWidth = 26194
        BandType = 0
      end
      object rpResRubRecDBText2: TppDBText
        UserName = 'rpResRubRecDBText2'
        DataField = 'FLGTPRUBRICA'
        DataPipeline = ppResRubRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResRubRec'
        mmHeight = 4233
        mmLeft = 25135
        mmTop = 22754
        mmWidth = 49742
        BandType = 0
      end
      object rpResRubRecLabel3: TppLabel
        UserName = 'rpResRubRecLabel3'
        Caption = 'Situação da Rúbrica:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 117740
        mmTop = 22754
        mmWidth = 32015
        BandType = 0
      end
      object rpResRubRecDBText3: TppDBText
        UserName = 'rpResRubRecDBText3'
        DataField = 'FLGATRASODEVOL'
        DataPipeline = ppResRubRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResRubRec'
        mmHeight = 4233
        mmLeft = 150019
        mmTop = 22754
        mmWidth = 36513
        BandType = 0
      end
      object rpResRubRecLabel4: TppLabel
        UserName = 'rpResRubRecLabel4'
        Caption = 'Incidência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 27781
        mmWidth = 16404
        BandType = 0
      end
      object rpResRubRecDBText4: TppDBText
        UserName = 'rpResRubRecDBText4'
        DataField = 'FLGDESCONTO'
        DataPipeline = ppResRubRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResRubRec'
        mmHeight = 4233
        mmLeft = 16669
        mmTop = 27781
        mmWidth = 28575
        BandType = 0
      end
      object rpResRubRecLabel5: TppLabel
        UserName = 'rpResRubRecLabel5'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 33867
        mmWidth = 10583
        BandType = 0
      end
      object rpResRubRecLabel6: TppLabel
        UserName = 'rpResRubRecLabel6'
        Caption = 'Descrição '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 22225
        mmTop = 33867
        mmWidth = 16404
        BandType = 0
      end
      object rpResRubRecLabel7: TppLabel
        UserName = 'rpResRubRecLabel7'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 144198
        mmTop = 33867
        mmWidth = 17463
        BandType = 0
      end
      object rpResRubRecLabel8: TppLabel
        UserName = 'rpResRubRecLabel8'
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 176742
        mmTop = 33867
        mmWidth = 16404
        BandType = 0
      end
      object rpResRubRecLine1: TppLine
        UserName = 'rpResRubRecLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 33073
        mmWidth = 197300
        BandType = 0
      end
      object rpResRubRecLine2: TppLine
        UserName = 'rpResRubRecLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 38629
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpResRubRecDBText5: TppDBText
        UserName = 'rpResRubRecDBText5'
        DataField = 'IDRUBRICA'
        DataPipeline = ppResRubRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResRubRec'
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpResRubRecDBText6: TppDBText
        UserName = 'rpResRubRecDBText6'
        DataField = 'DESCRPROVDESC'
        DataPipeline = ppResRubRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResRubRec'
        mmHeight = 4233
        mmLeft = 22225
        mmTop = 265
        mmWidth = 105834
        BandType = 4
      end
      object rpResRubRecDBText7: TppDBText
        UserName = 'rpResRubRecDBText7'
        DataField = 'QTDE'
        DataPipeline = ppResRubRec
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResRubRec'
        mmHeight = 4233
        mmLeft = 144463
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpResRubRecDBText8: TppDBText
        UserName = 'rpResRubRecDBText8'
        DataField = 'TOTAL'
        DataPipeline = ppResRubRec
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResRubRec'
        mmHeight = 4233
        mmLeft = 174890
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
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
        mmTop = 3175
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
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
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
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpResRubRecGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppResRubRec
      OutlineSettings.CreateNode = True
      UserName = 'rpResRubRecGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResRubRec'
      object rpResRubRecGroupHeaderBand1: TppGroupHeaderBand
        BeforePrint = rpResRubRecGroupHeaderBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpResRubRecGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpResRubRecGroup2: TppGroup
      BreakName = 'FLGTPRUBRICA'
      DataPipeline = ppResRubRec
      OutlineSettings.CreateNode = True
      UserName = 'rpResRubRecGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResRubRec'
      object rpResRubRecGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpResRubRecGroupFooterBand2: TppGroupFooterBand
        BeforePrint = rpResRubRecGroupFooterBand2BeforePrint
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object lblTotTipo: TppLabel
          OnPrint = lblTotTipoPrint
          UserName = 'lblTotTipo'
          Caption = 'lblTotTipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 177536
          mmTop = 0
          mmWidth = 14552
          BandType = 5
          GroupNo = 1
        end
        object lblDescTip: TppLabel
          UserName = 'lblDescTip'
          Caption = 'lblDescTip'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 103188
          mmTop = 529
          mmWidth = 62971
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object rpResRubRecGroup3: TppGroup
      BreakName = 'FLGATRASODEVOL'
      DataPipeline = ppResRubRec
      OutlineSettings.CreateNode = True
      UserName = 'rpResRubRecGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResRubRec'
      object rpResRubRecGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpResRubRecGroupFooterBand3: TppGroupFooterBand
        AfterPrint = rpResRubRecGroupFooterBand3AfterPrint
        BeforePrint = rpResRubRecGroupFooterBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object lblTotSituacao: TppLabel
          OnPrint = lblTotSituacaoPrint
          UserName = 'lblTotSituacao'
          Caption = 'lblTotSituação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 170392
          mmTop = 265
          mmWidth = 21696
          BandType = 5
          GroupNo = 2
        end
        object lblDescSit: TppLabel
          UserName = 'lblDescSit'
          Caption = 'lblDescSit'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 103452
          mmTop = 529
          mmWidth = 15875
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object rpResRubRecGroup4: TppGroup
      BreakName = 'FLGDESCONTO'
      DataPipeline = ppResRubRec
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpResRubRecGroup4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResRubRec'
      object rpResRubRecGroupHeaderBand4: TppGroupHeaderBand
        BeforePrint = rpResRubRecGroupHeaderBand4BeforePrint
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpResRubRecGroupFooterBand4: TppGroupFooterBand
        AfterPrint = rpResRubRecGroupFooterBand4AfterPrint
        BeforePrint = rpResRubRecGroupFooterBand4BeforePrint
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object lblTotIncidencia: TppDBCalc
          UserName = 'lblTotIncidencia'
          DataField = 'TOTAL'
          DataPipeline = ppResRubRec
          DisplayFormat = '#,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpResRubRecGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResRubRec'
          mmHeight = 4233
          mmLeft = 172509
          mmTop = 529
          mmWidth = 19579
          BandType = 5
          GroupNo = 3
        end
        object lblDescInc: TppLabel
          UserName = 'lblDescInc'
          Caption = 'lblDescInc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 102659
          mmTop = 265
          mmWidth = 16404
          BandType = 5
          GroupNo = 3
        end
      end
    end
  end
  object qryEvSalPart: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select qry01.Patrocinadora,'
      '       qry01.Elegivel,'
      '       qry11.mescobranca    as mescob11,'
      '       qry11.ValorProvento  as VProv11,'
      '       qry10.mescobranca    as mescob10,'
      '       qry10.ValorProvento  as VProv10,'
      '       qry09.mescobranca    as mescob09,'
      '       qry09.ValorProvento  as VProv09,'
      '       qry08.mescobranca    as mescob08,'
      '       qry08.ValorProvento  as VProv08,'
      '       qry07.mescobranca    as mescob07,'
      '       qry07.ValorProvento  as VProv07,'
      '       qry06.mescobranca    as mescob06,'
      '       qry06.ValorProvento  as VProv06,'
      '       qry05.mescobranca    as mescob05,'
      '       qry05.ValorProvento  as VProv05,'
      '       qry04.mescobranca    as mescob04,'
      '       qry04.ValorProvento  as VProv04,'
      '       qry03.mescobranca    as mescob03,'
      '       qry03.ValorProvento  as VProv03,'
      '       qry02.mescobranca    as mescob02,'
      '       qry02.ValorProvento  as VProv02,'
      '       qry01.mescobranca    as mescob01,'
      '       qry01.ValorProvento  as VProv01,'
      '       qry00.mescobranca    as mescob0,'
      '       qry00.ValorProvento  as VProv0'
      'from'
      '(Select h.mescobranca,'
      '        pet.nome Patrocinadora,'
      '        pe.nome Elegivel,'
      '       h.ValorProvento'
      
        'From   Histrubsal H, ProvDesc P, RubricaXPess R, Patro PT, Pesso' +
        'a Pe, Pessoa Pet'
      
        'where  (h.mescobranca = to_char(to_date(:MesCobranca,'#39'dd/mm/yyyy' +
        #39'),'#39'yyyy/mm'#39'))'
      'and    (h.idpessjur in (:idpessjur))'
      'and    (h.idpessoa in (:idpessoa))'
      'and    (h.idpessjur = r.idpessoa)'
      'and    (h.idrubrica = r.idrubrica)'
      'and    (r.idrubrica = p.idprovento)'
      'and    (pt.idpessoa = h.idpessjur)'
      'and    (pe.idpessoa = h.idpessoa)'
      'and    (pt.idpessoa = pet.idpessoa)'
      'and    (pt.idrubsalparticip = h.idrubrica )) qry00,'
      '(Select h.mescobranca,'
      '        pet.nome Patrocinadora,'
      '        pe.nome Elegivel,'
      '       h.ValorProvento'
      
        'From   Histrubsal H, ProvDesc P, RubricaXPess R, Patro PT, Pesso' +
        'a Pe, Pessoa Pet'
      
        'where  (h.mescobranca = to_char(add_months(to_date(:MesCobranca,' +
        #39'dd/mm/yyyy'#39'),-1),'#39'yyyy/mm'#39'))'
      'and    (h.idpessjur in (:idpessjur))'
      'and    (h.idpessoa in (:idpessoa))'
      'and    (h.idpessjur = r.idpessoa)'
      'and    (h.idrubrica = r.idrubrica)'
      'and    (r.idrubrica = p.idprovento)'
      'and    (pt.idpessoa = h.idpessjur)'
      'and    (pe.idpessoa = h.idpessoa)'
      'and    (pt.idpessoa = pet.idpessoa)'
      'and    (pt.idrubsalparticip = h.idrubrica )) qry11,'
      '(Select h.mescobranca,'
      '        pet.nome Patrocinadora,'
      '        pe.nome Elegivel,'
      '       h.ValorProvento'
      
        'From   Histrubsal H, ProvDesc P, RubricaXPess R, Patro PT, Pesso' +
        'a Pe, Pessoa Pet'
      
        'where  (h.mescobranca = to_char(add_months(to_date(:MesCobranca,' +
        #39'dd/mm/yyyy'#39'),-2),'#39'yyyy/mm'#39'))'
      'and    (h.idpessjur in (:idpessjur))'
      'and    (h.idpessoa in (:idpessoa))'
      'and    (h.idpessjur = r.idpessoa)'
      'and    (h.idrubrica = r.idrubrica)'
      'and    (r.idrubrica = p.idprovento)'
      'and    (pt.idpessoa = h.idpessjur)'
      'and    (pe.idpessoa = h.idpessoa)'
      'and    (pt.idpessoa = pet.idpessoa)'
      'and    (pt.idrubsalparticip = h.idrubrica )) qry02,'
      '(Select h.mescobranca,'
      '        pet.nome Patrocinadora,'
      '        pe.nome Elegivel,'
      '        h.ValorProvento'
      
        'From   Histrubsal H, ProvDesc P, RubricaXPess R, Patro PT, Pesso' +
        'a Pe, Pessoa Pet'
      
        'where  (h.mescobranca = to_char(add_months(to_date(:MesCobranca,' +
        #39'dd/mm/yyyy'#39'),-3),'#39'yyyy/mm'#39'))'
      'and    (h.idpessjur in (:idpessjur))'
      'and    (h.idpessoa in (:idpessoa))'
      'and    (h.idpessjur = r.idpessoa)'
      'and    (h.idrubrica = r.idrubrica)'
      'and    (r.idrubrica = p.idprovento)'
      'and    (pt.idpessoa = h.idpessjur)'
      'and    (pe.idpessoa = h.idpessoa)'
      'and    (pt.idpessoa = pet.idpessoa)'
      'and    (pt.idrubsalparticip = h.idrubrica )) qry03,'
      '(Select h.mescobranca,'
      '        pet.nome Patrocinadora,'
      '        pe.nome Elegivel,'
      '        h.ValorProvento'
      
        'From   Histrubsal H, ProvDesc P, RubricaXPess R, Patro PT, Pesso' +
        'a Pe, Pessoa Pet'
      
        'where  (h.mescobranca = to_char(add_months(to_date(:MesCobranca,' +
        #39'dd/mm/yyyy'#39'),-4),'#39'yyyy/mm'#39'))'
      'and    (h.idpessjur in (:idPessjur))'
      'and    (h.idpessoa in (:idpessoa))'
      'and    (h.idpessjur = r.idpessoa)'
      'and    (h.idrubrica = r.idrubrica)'
      'and    (r.idrubrica = p.idprovento)'
      'and    (pt.idpessoa = h.idpessjur)'
      'and    (pe.idpessoa = h.idpessoa)'
      'and    (pt.idpessoa = pet.idpessoa)'
      'and    (pt.idrubsalparticip = h.idrubrica )) qry04,'
      '(Select h.mescobranca,'
      '        pet.nome Patrocinadora,'
      '        pe.nome Elegivel,'
      '        h.ValorProvento'
      
        'From   Histrubsal H, ProvDesc P, RubricaXPess R, Patro PT, Pesso' +
        'a Pe, Pessoa Pet'
      
        'where  (h.mescobranca = to_char(add_months(to_date(:MesCobranca,' +
        #39'dd/mm/yyyy'#39'),-5),'#39'yyyy/mm'#39'))'
      'and    (h.idpessjur in (:idPessjur))'
      'and    (h.idpessoa in (:idpessoa))'
      'and    (h.idpessjur = r.idpessoa)'
      'and    (h.idrubrica = r.idrubrica)'
      'and    (r.idrubrica = p.idprovento)'
      'and    (pt.idpessoa = h.idpessjur)'
      'and    (pe.idpessoa = h.idpessoa)'
      'and    (pt.idpessoa = pet.idpessoa)'
      'and    (pt.idrubsalparticip = h.idrubrica )) qry05,'
      '(Select h.mescobranca,'
      '        pet.nome Patrocinadora,'
      '        pe.nome Elegivel,'
      '       h.ValorProvento'
      
        'From   Histrubsal H, ProvDesc P, RubricaXPess R, Patro PT, Pesso' +
        'a Pe, Pessoa Pet'
      
        'where  (h.mescobranca = to_char(add_months(to_date(:MesCobranca,' +
        #39'dd/mm/yyyy'#39'),-6),'#39'yyyy/mm'#39'))'
      'and    (h.idpessjur in (:idPessjur))'
      'and    (h.idpessoa in (:idpessoa))'
      'and    (h.idpessjur = r.idpessoa)'
      'and    (h.idrubrica = r.idrubrica)'
      'and    (r.idrubrica = p.idprovento)'
      'and    (pt.idpessoa = h.idpessjur)'
      'and    (pe.idpessoa = h.idpessoa)'
      'and    (pt.idpessoa = pet.idpessoa)'
      'and    (pt.idrubsalparticip = h.idrubrica )) qry06,'
      '(Select h.mescobranca,'
      '        pet.nome Patrocinadora,'
      '        pe.nome Elegivel,'
      '        h.ValorProvento'
      
        'From   Histrubsal H, ProvDesc P, RubricaXPess R, Patro PT, Pesso' +
        'a Pe, Pessoa Pet'
      
        'where  (h.mescobranca = to_char(add_months(to_date(:MesCobranca,' +
        #39'dd/mm/yyyy'#39'),-7),'#39'yyyy/mm'#39'))'
      'and    (h.idpessjur in (:idPessjur))'
      'and    (h.idpessoa in (:idpessoa))'
      'and    (h.idpessjur = r.idpessoa)'
      'and    (h.idrubrica = r.idrubrica)'
      'and    (r.idrubrica = p.idprovento)'
      'and    (pt.idpessoa = h.idpessjur)'
      'and    (pe.idpessoa = h.idpessoa)'
      'and    (pt.idpessoa = pet.idpessoa)'
      'and    (pt.idrubsalparticip = h.idrubrica )) qry07,'
      '(Select h.mescobranca,'
      '        pet.nome Patrocinadora,'
      '        pe.nome Elegivel,'
      '        h.ValorProvento'
      
        'From   Histrubsal H, ProvDesc P, RubricaXPess R, Patro PT, Pesso' +
        'a Pe, Pessoa Pet'
      
        'where  (h.mescobranca = to_char(add_months(to_date(:MesCobranca,' +
        #39'dd/mm/yyyy'#39'),-8),'#39'yyyy/mm'#39'))'
      'and    (h.idpessjur in (:idPessjur))'
      'and    (h.idpessoa in (:idpessoa))'
      'and    (h.idpessjur = r.idpessoa)'
      'and    (h.idrubrica = r.idrubrica)'
      'and    (r.idrubrica = p.idprovento)'
      'and    (pt.idpessoa = h.idpessjur)'
      'and    (pe.idpessoa = h.idpessoa)'
      'and    (pt.idpessoa = pet.idpessoa)'
      'and    (pt.idrubsalparticip = h.idrubrica )) qry08,'
      '(Select h.mescobranca,'
      '        pet.nome Patrocinadora,'
      '        pe.nome Elegivel,'
      '       h.ValorProvento'
      
        'From   Histrubsal H, ProvDesc P, RubricaXPess R, Patro PT, Pesso' +
        'a Pe, Pessoa Pet'
      
        'where  (h.mescobranca = to_char(add_months(to_date(:MesCobranca,' +
        #39'dd/mm/yyyy'#39'),-9),'#39'yyyy/mm'#39'))'
      'and    (h.idpessjur in (:idPessjur))'
      'and    (h.idpessoa in (:idpessoa))'
      'and    (h.idpessjur = r.idpessoa)'
      'and    (h.idrubrica = r.idrubrica)'
      'and    (r.idrubrica = p.idprovento)'
      'and    (pt.idpessoa = h.idpessjur)'
      'and    (pe.idpessoa = h.idpessoa)'
      'and    (pt.idpessoa = pet.idpessoa)'
      'and    (pt.idrubsalparticip = h.idrubrica )) qry09,'
      '(Select h.mescobranca,'
      '        pet.nome Patrocinadora,'
      '        pe.nome Elegivel,'
      '        h.ValorProvento'
      
        'From   Histrubsal H, ProvDesc P, RubricaXPess R, Patro PT, Pesso' +
        'a Pe, Pessoa Pet'
      
        'where  (h.mescobranca = to_char(add_months(to_date(:MesCobranca,' +
        #39'dd/mm/yyyy'#39'),-10),'#39'yyyy/mm'#39'))'
      'and    (h.idpessjur in (:idPessjur))'
      'and    (h.idpessoa in (:idpessoa))'
      'and    (h.idpessjur = r.idpessoa)'
      'and    (h.idrubrica = r.idrubrica)'
      'and    (r.idrubrica = p.idprovento)'
      'and    (pt.idpessoa = h.idpessjur)'
      'and    (pe.idpessoa = h.idpessoa)'
      'and    (pt.idpessoa = pet.idpessoa)'
      'and    (pt.idrubsalparticip = h.idrubrica)) qry10,'
      '(Select'
      '        h.mescobranca,'
      '        pet.nome Patrocinadora,'
      '        pe.nome Elegivel,'
      '        h.ValorProvento'
      
        'From    Histrubsal H, ProvDesc P, RubricaXPess R, Patro PT, Pess' +
        'oa Pet, Pessoa Pe'
      
        'where   (h.mescobranca = to_char(add_months(to_date(:MesCobranca' +
        ','#39'dd/mm/yyyy'#39'),-11),'#39'yyyy/mm'#39'))'
      'and     (h.idpessjur in (:idPessjur))'
      'and     (h.idpessoa in (:idpessoa))'
      'and     (h.idpessjur = r.idpessoa)'
      'and     (h.idrubrica = r.idrubrica)'
      'and     (r.idrubrica = p.idprovento)'
      'and     (pt.idpessoa = h.idpessjur)'
      'and     (pe.idpessoa = h.idpessoa)'
      'and     (pt.idpessoa = pet.idpessoa)'
      'and     (pt.idrubsalparticip = h.idrubrica )) qry11'
      'where qry00.Elegivel = qry1.Elegivel(+)'
      'and   qry00.Elegivel = qry2.Elegivel(+)'
      'and   qry00.Elegivel = qry3.Elegivel(+)'
      'and   qry00.Elegivel = qry4.Elegivel(+)'
      'and   qry00.Elegivel = qry5.Elegivel(+)'
      'and   qry00.Elegivel = qry6.Elegivel(+)'
      'and   qry00.Elegivel = qry7.Elegivel(+)'
      'and   qry00.Elegivel = qry8.Elegivel(+)'
      'and   qry00.Elegivel = qry9.Elegivel(+)'
      'and   qry00.Elegivel = qry10.Elegivel(+)'
      'and   qry00.Elegivel = qry11.Elegivel(+)'
      ''
      '')
    ValidateWithMask = True
    Left = 34
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'MesCobranca'
        ParamType = ptUnknown
        Value = '01/11/1999'
      end
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = '65334'
      end
      item
        DataType = ftString
        Name = 'MesCobranca'
        ParamType = ptUnknown
        Value = '01/11/1999'
      end
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = '65334'
      end
      item
        DataType = ftString
        Name = 'MesCobranca'
        ParamType = ptUnknown
        Value = '01/11/1999'
      end
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = '65334'
      end
      item
        DataType = ftString
        Name = 'MesCobranca'
        ParamType = ptUnknown
        Value = '01/11/1999'
      end
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = '65334'
      end
      item
        DataType = ftString
        Name = 'MesCobranca'
        ParamType = ptUnknown
        Value = '01/11/1999'
      end
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = '65334'
      end
      item
        DataType = ftString
        Name = 'MesCobranca'
        ParamType = ptUnknown
        Value = '01/11/1999'
      end
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = '65334'
      end
      item
        DataType = ftString
        Name = 'MesCobranca'
        ParamType = ptUnknown
        Value = '01/11/1999'
      end
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = '65334'
      end
      item
        DataType = ftString
        Name = 'MesCobranca'
        ParamType = ptUnknown
        Value = '01/11/1999'
      end
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = '65334'
      end
      item
        DataType = ftString
        Name = 'MesCobranca'
        ParamType = ptUnknown
        Value = '01/11/1999'
      end
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = '65334'
      end
      item
        DataType = ftString
        Name = 'MesCobranca'
        ParamType = ptUnknown
        Value = '01/11/1999'
      end
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = '65334'
      end
      item
        DataType = ftString
        Name = 'MesCobranca'
        ParamType = ptUnknown
        Value = '01/11/1999'
      end
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = '65334'
      end
      item
        DataType = ftString
        Name = 'MesCobranca'
        ParamType = ptUnknown
        Value = '01/11/1999'
      end
      item
        DataType = ftString
        Name = 'idpessjur'
        ParamType = ptUnknown
        Value = '99'
      end
      item
        DataType = ftString
        Name = 'idpessoa'
        ParamType = ptUnknown
        Value = '65334'
      end>
  end
  object dsEvSalPart: TwwDataSource
    DataSet = qryEvSalPart
    Left = 75
    Top = 232
  end
  object ppEvSalPart: TppBDEPipeline
    DataSource = dsEvSalPart
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'EvSalPart'
    Left = 123
    Top = 232
  end
  object rpEvSalPart: TppReport
    AutoStop = False
    DataPipeline = ppEvSalPart
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 167
    Top = 232
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppEvSalPart'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Relatório de Evolução de Salário de Participação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 92869
        mmTop = 8731
        mmWidth = 98690
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel5: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel5'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object rpEvSalPartDBText2: TppDBText
        UserName = 'rpEvSalPartDBText2'
        DataField = 'ELEGIVEL'
        DataPipeline = ppEvSalPart
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEvSalPart'
        mmHeight = 3175
        mmLeft = 265
        mmTop = 265
        mmWidth = 50536
        BandType = 4
      end
      object rpEvSalPartDBText4: TppDBText
        UserName = 'rpEvSalPartDBText4'
        DataField = 'VPROV10'
        DataPipeline = ppEvSalPart
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvSalPart'
        mmHeight = 3175
        mmLeft = 70644
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpEvSalPartDBText5: TppDBText
        UserName = 'rpEvSalPartDBText5'
        DataField = 'VPROV09'
        DataPipeline = ppEvSalPart
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvSalPart'
        mmHeight = 3175
        mmLeft = 89429
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpEvSalPartDBText6: TppDBText
        UserName = 'rpEvSalPartDBText6'
        DataField = 'VPROV08'
        DataPipeline = ppEvSalPart
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvSalPart'
        mmHeight = 3175
        mmLeft = 107686
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpEvSalPartDBText7: TppDBText
        UserName = 'rpEvSalPartDBText7'
        DataField = 'VPROV07'
        DataPipeline = ppEvSalPart
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvSalPart'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpEvSalPartDBText8: TppDBText
        UserName = 'rpEvSalPartDBText8'
        DataField = 'VPROV06'
        DataPipeline = ppEvSalPart
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvSalPart'
        mmHeight = 3175
        mmLeft = 143934
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpEvSalPartDBText9: TppDBText
        UserName = 'rpEvSalPartDBText9'
        DataField = 'VPROV05'
        DataPipeline = ppEvSalPart
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvSalPart'
        mmHeight = 3175
        mmLeft = 161925
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpEvSalPartDBText10: TppDBText
        UserName = 'rpEvSalPartDBText10'
        DataField = 'VPROV04'
        DataPipeline = ppEvSalPart
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvSalPart'
        mmHeight = 3175
        mmLeft = 180446
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpEvSalPartDBText11: TppDBText
        UserName = 'rpEvSalPartDBText11'
        DataField = 'VPROV03'
        DataPipeline = ppEvSalPart
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvSalPart'
        mmHeight = 3175
        mmLeft = 198438
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpEvSalPartDBText12: TppDBText
        UserName = 'rpEvSalPartDBText12'
        DataField = 'VPROV02'
        DataPipeline = ppEvSalPart
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvSalPart'
        mmHeight = 3175
        mmLeft = 216694
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpEvSalPartDBText13: TppDBText
        UserName = 'rpEvSalPartDBText13'
        DataField = 'VPROV01'
        DataPipeline = ppEvSalPart
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvSalPart'
        mmHeight = 3175
        mmLeft = 235215
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpEvSalPartDBText26: TppDBText
        UserName = 'rpEvSalPartDBText26'
        DataField = 'VPROV0'
        DataPipeline = ppEvSalPart
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvSalPart'
        mmHeight = 3175
        mmLeft = 253471
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object rpEvSalPartDBText3: TppDBText
        UserName = 'rpEvSalPartDBText3'
        DataField = 'VPROV11'
        DataPipeline = ppEvSalPart
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEvSalPart'
        mmHeight = 3175
        mmLeft = 51329
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel6: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel6'
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
        mmWidth = 274638
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 274373
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
        mmLeft = 246857
        mmTop = 3175
        mmWidth = 27781
        BandType = 8
      end
    end
    object rpEvSalPartGroup1: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppEvSalPart
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpEvSalPartGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEvSalPart'
      object rpEvSalPartGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object rpEvSalPartLabel1: TppLabel
          UserName = 'rpEvSalPartLabel1'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 0
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object rpEvSalPartDBText1: TppDBText
          UserName = 'rpEvSalPartDBText1'
          DataField = 'PATROCINADORA'
          DataPipeline = ppEvSalPart
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEvSalPart'
          mmHeight = 4233
          mmLeft = 23019
          mmTop = 0
          mmWidth = 92869
          BandType = 3
          GroupNo = 0
        end
        object rpEvSalPartLabel2: TppLabel
          UserName = 'rpEvSalPartLabel2'
          Caption = 'Mês de Cobrança:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 212725
          mmTop = 0
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object lblMesCob: TppLabel
          UserName = 'lblMesCob'
          Caption = 'lblMesCob'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 242094
          mmTop = 0
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object rpEvSalPartLabel4: TppLabel
          UserName = 'rpEvSalPartLabel4'
          Caption = 'Nome do Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 5556
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object rpEvSalPartLine1: TppLine
          UserName = 'rpEvSalPartLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 4763
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object rpEvSalPartLine2: TppLine
          UserName = 'rpEvSalPartLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 10054
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object lblMes11: TppLabel
          UserName = 'lblMes11'
          AutoSize = False
          Caption = 'lblMes11'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 50800
          mmTop = 5556
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object lblMes10: TppLabel
          UserName = 'lblMes10'
          AutoSize = False
          Caption = 'lblMes10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 70644
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object lblMes09: TppLabel
          UserName = 'lblMes09'
          AutoSize = False
          Caption = 'lblMes09'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 89429
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object lblMes08: TppLabel
          UserName = 'lblMes08'
          AutoSize = False
          Caption = 'lblMes08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 107686
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object lblMes07: TppLabel
          UserName = 'lblMes07'
          AutoSize = False
          Caption = 'lblMes07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 125677
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object lblMes06: TppLabel
          UserName = 'lblMes06'
          AutoSize = False
          Caption = 'lblMes06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 143934
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object lblMes05: TppLabel
          UserName = 'lblMes05'
          AutoSize = False
          Caption = 'lblMes05'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 161925
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object lblMes04: TppLabel
          UserName = 'lblMes04'
          AutoSize = False
          Caption = 'lblMes04'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 180446
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object lblMes03: TppLabel
          UserName = 'lblMes03'
          AutoSize = False
          Caption = 'lblMes03'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 198438
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object lblMes02: TppLabel
          UserName = 'lblMes02'
          AutoSize = False
          Caption = 'lblMes02'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 216694
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object lblMes01: TppLabel
          UserName = 'lblMes01'
          AutoSize = False
          Caption = 'lblMes01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 235215
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object lblMesInf: TppLabel
          UserName = 'lblMesInf'
          AutoSize = False
          Caption = 'lblMesInf'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 253471
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
      end
      object rpEvSalPartGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryResEnvio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '       PJ.NOME                                AS PATROCINADORA,'
      '       PP.NOME                                AS PLANO        ,'
      '       DECODE(TD.FLGTIPODESC,'#39'B'#39','#39'Benefício'#39') AS FLGTIPODESC  ,'
      '       PD.DESCRICAO                           AS DESCRICAO    ,'
      '       COUNT(PD.DESCRICAO)                    AS QTD          ,'
      '       SUM(TD.VALOR)                          AS TOTAL'
      
        'FROM TMPDESC TD, PESSOA PJ, PLANPREV PP, PROVDESC PD, PLANPREVPA' +
        'TRO PL,'
      '     (SELECT COUNT(*) AS NUMCOUNT FROM SINCRONPREV'
      
        '     WHERE (IDMODULO = 32) AND (OPERACAO = '#39'B'#39') AND (ANOMESREF =' +
        ' '#39'1999/12'#39')) SINC'
      'WHERE (SINC.NUMCOUNT   > 0)              AND'
      '      (TD.MESCOBRANCA  = '#39'1999/12'#39')      AND'
      '      (TD.FLGDESCFOLHA = '#39'P'#39')            AND'
      '      (TD.FLGTIPODESC  = '#39'B'#39')            AND'
      '      (TD.IDPROVENTO   = PD.IDPROVENTO)  AND'
      '      (TD.IDPESSJUR    = PJ.IDPESSOA)    AND'
      '      (TD.IDPLANOPREV  = PP.IDPLANOPREV) AND'
      '      (PL.IDPESSJUR    = PJ.IDPESSOA)    AND'
      '      (PL.IDPLANOPREV  = PP.IDPLANOPREV)'
      'GROUP BY PJ.NOME, PP.NOME, TD.FLGTIPODESC, PD.DESCRICAO'
      
        '/*--------------------------------------------------------------' +
        '---------------------*/'
      'UNION'
      'SELECT DISTINCT '
      
        '       PJ.NOME                                                  ' +
        'AS PATROCINADORA,'
      
        '       PP.NOME                                                  ' +
        'AS PLANO        ,'
      
        '       DECODE(TD.FLGTIPODESC,'#39'A'#39','#39'Contribuições Assistenciais'#39') ' +
        'AS FLGTIPODESC  ,'
      
        '       PD.DESCRICAO                                             ' +
        'AS DESCRICAO    ,'
      
        '       COUNT(PD.DESCRICAO)                                      ' +
        'AS QTD          ,'
      
        '       SUM(TD.VALOR)                                            ' +
        'AS TOTAL'
      
        'FROM TMPDESC TD, PESSOA PJ, PLANPREV PP, PROVDESC PD, PLANPREVPA' +
        'TRO PL,'
      '     (SELECT COUNT(*) AS NUMCOUNT FROM SINCRONPREV '
      
        '     WHERE (IDMODULO = 32) AND (OPERACAO = '#39'A'#39') AND (ANOMESREF =' +
        ' '#39'1999/12'#39')) SINC'
      'WHERE (SINC.NUMCOUNT   > 0)              AND'
      '      (TD.MESCOBRANCA  = '#39'1999/12'#39')      AND'
      '      (TD.FLGDESCFOLHA = '#39'P'#39')            AND'
      '      (TD.FLGTIPODESC  = '#39'A'#39')            AND'
      '      (TD.IDPROVENTO   = PD.IDPROVENTO)  AND'
      '      (TD.IDPESSJUR    = PJ.IDPESSOA)    AND'
      '      (TD.IDPLANOPREV  = PP.IDPLANOPREV) AND'
      '      (PL.IDPLANOPREV  = PP.IDPLANOPREV) '
      'GROUP BY PJ.NOME, PP.NOME, TD.FLGTIPODESC, PD.DESCRICAO'
      
        '/*--------------------------------------------------------------' +
        '---------------------*/'
      'UNION'
      'SELECT DISTINCT'
      
        '       PJ.NOME                                                  ' +
        'AS PATROCINADORA,'
      
        '       PP.NOME                                                  ' +
        'AS PLANO        ,'
      
        '       DECODE(TD.FLGTIPODESC,'#39'E'#39','#39'Contribuições de Empréstimo'#39') ' +
        'AS FLGTIPODESC  ,'
      
        '       PD.DESCRICAO                                             ' +
        'AS DESCRICAO    ,'
      
        '       COUNT(PD.DESCRICAO)                                      ' +
        'AS QTD          ,'
      
        '       SUM(TD.VALOR)                                            ' +
        'AS TOTAL'
      
        'FROM TMPDESC TD, PESSOA PJ, PLANPREV PP, PROVDESC PD, PLANPREVPA' +
        'TRO PL,'
      '     (SELECT COUNT(*) AS NUMCOUNT FROM SINCRONPREV '
      
        '     WHERE (IDMODULO = 32) AND (OPERACAO = '#39'E'#39') AND (ANOMESREF =' +
        ' '#39'1999/12'#39')) SINC'
      'WHERE (SINC.NUMCOUNT   > 0)              AND'
      '      (TD.MESCOBRANCA  = '#39'1999/12'#39')      AND'
      '      (TD.FLGDESCFOLHA = '#39'P'#39')            AND'
      '      (TD.FLGTIPODESC  = '#39'E'#39')            AND'
      '      (TD.IDPROVENTO   = PD.IDPROVENTO)  AND'
      '      (TD.IDPESSJUR    = PJ.IDPESSOA)    AND'
      '      (TD.IDPLANOPREV  = PP.IDPLANOPREV) AND'
      '      (PL.IDPLANOPREV  = PP.IDPLANOPREV)'
      'GROUP BY PJ.NOME, PP.NOME, TD.FLGTIPODESC, PD.DESCRICAO'
      
        '/*--------------------------------------------------------------' +
        '---------------------*/'
      'UNION'
      'SELECT DISTINCT'
      
        '       PJ.NOME                                                  ' +
        '               AS PATROCINADORA,'
      
        '       PP.NOME                                                  ' +
        '               AS PLANO        ,'
      
        '       DECODE(TD.FLGTIPODESC,'#39'P'#39','#39'Taxas ou Valores das Contribui' +
        'ções Normais'#39') AS FLGTIPODESC  ,'
      
        '       PD.DESCRICAO                                             ' +
        '               AS DESCRICAO    ,'
      
        '       COUNT(PD.DESCRICAO)                                      ' +
        '               AS QTD          ,'
      
        '       SUM(TD.VALOR)                                            ' +
        '               AS TOTAL'
      
        'FROM TMPDESC TD, PESSOA PJ, PLANPREV PP, PROVDESC PD, PLANPREVPA' +
        'TRO PL,'
      '     (SELECT COUNT(*) AS NUMCOUNT FROM SINCRONPREV '
      
        '     WHERE (IDMODULO = 32) AND (OPERACAO = '#39'P'#39') AND (ANOMESREF =' +
        ' '#39'1999/12'#39') AND'
      '           (TIPOENVPREV IN('#39'V'#39','#39'A'#39'))) SINC'
      'WHERE (SINC.NUMCOUNT     > 0)              AND'
      '      (TD.MESCOBRANCA    = '#39'1999/12'#39')      AND'
      '      (TD.FLGDESCFOLHA   = '#39'P'#39')            AND'
      '      (TD.FLGTIPODESC    = '#39'P'#39')            AND'
      '      (TD.FLGATRASODEVOL = '#39'N'#39')            AND'
      '      (TD.IDPROVENTO     = PD.IDPROVENTO)  AND'
      '      (TD.IDPESSJUR      = PJ.IDPESSOA)    AND'
      '      (TD.IDPLANOPREV    = PP.IDPLANOPREV) AND'
      '      (PL.IDPLANOPREV    = PP.IDPLANOPREV)'
      'GROUP BY PJ.NOME, PP.NOME, TD.FLGTIPODESC, PD.DESCRICAO'
      
        '/*--------------------------------------------------------------' +
        '---------------------*/'
      'UNION'
      'SELECT DISTINCT'
      
        '       PJ.NOME                                             AS PA' +
        'TROCINADORA,'
      
        '       PP.NOME                                             AS PL' +
        'ANO        ,'
      
        '       DECODE(TD.FLGTIPODESC,'#39'P'#39','#39'Inscritos'#39')              AS FL' +
        'GTIPODESC  ,'
      
        '       PD.DESCRICAO                                        AS DE' +
        'SCRICAO    ,'
      
        '       COUNT(PD.DESCRICAO)                                 AS QT' +
        'D          ,'
      
        '       SUM(TD.VALOR)                                       AS TO' +
        'TAL'
      
        'FROM TMPDESC TD, PESSOA PJ, PLANPREV PP, PROVDESC PD, PLANPREVPA' +
        'TRO PL,'
      '     (SELECT COUNT(*) AS NUMCOUNT FROM SINCRONPREV '
      
        '     WHERE (IDMODULO = 32) AND (OPERACAO = '#39'P'#39') AND (ANOMESREF =' +
        ' '#39'1999/12'#39') AND'
      '           (TIPOENVPREV IN('#39'N'#39','#39'A'#39'))) SINC'
      'WHERE (SINC.NUMCOUNT   > 0)                                  AND'
      '      (TD.MESCOBRANCA  = '#39'1999/12'#39')                          AND'
      '      (FLGINTEVENTO IN ('#39'IP'#39','#39'RM'#39'))                          AND'
      '      (TD.FLGDESCFOLHA = '#39'P'#39')                                AND'
      '      (TD.FLGTIPODESC  = '#39'P'#39')                                AND'
      '      (TD.IDPROVENTO   = PD.IDPROVENTO)                      AND'
      '      (TD.IDPESSJUR    = PJ.IDPESSOA)                        AND'
      '      (TD.IDPLANOPREV  = PP.IDPLANOPREV)                     AND'
      '      (PL.IDPLANOPREV  = PP.IDPLANOPREV)'
      'GROUP BY PJ.NOME, PP.NOME, TD.FLGTIPODESC, PD.DESCRICAO'
      
        '/*--------------------------------------------------------------' +
        '---------------------*/'
      'UNION'
      'SELECT DISTINCT'
      
        '       PJ.NOME                                             AS PA' +
        'TROCINADORA,'
      
        '       PP.NOME                                             AS PL' +
        'ANO        ,'
      
        '       DECODE(TD.FLGTIPODESC,'#39'P'#39','#39'Desligados'#39')             AS FL' +
        'GTIPODESC  ,'
      
        '       PD.DESCRICAO                                        AS DE' +
        'SCRICAO    ,'
      
        '       COUNT(PD.DESCRICAO)                                 AS QT' +
        'D          ,'
      
        '       SUM(TD.VALOR)                                       AS TO' +
        'TAL'
      
        'FROM TMPDESC TD, PESSOA PJ, PLANPREV PP, PROVDESC PD, PLANPREVPA' +
        'TRO PL,'
      '     (SELECT COUNT(*) AS NUMCOUNT FROM SINCRONPREV '
      
        '     WHERE (IDMODULO = 32) AND (OPERACAO = '#39'P'#39') AND (ANOMESREF =' +
        ' '#39'1999/12'#39') AND'
      '           (TIPOENVPREV IN('#39'N'#39','#39'A'#39'))) SINC'
      'WHERE (SINC.NUMCOUNT   > 0)                                  AND'
      '      (TD.MESCOBRANCA  = '#39'1999/12'#39')                          AND'
      '      (FLGINTEVENTO IN ('#39'DC'#39','#39'RA'#39','#39'DM'#39','#39'DS'#39','#39'DA'#39'))           AND'
      '      (TD.FLGDESCFOLHA = '#39'P'#39')                                AND'
      '      (TD.FLGTIPODESC  = '#39'P'#39')                                AND'
      '      (TD.IDPROVENTO   = PD.IDPROVENTO)                      AND'
      '      (TD.IDPESSJUR    = PJ.IDPESSOA)                        AND'
      '      (TD.IDPLANOPREV  = PP.IDPLANOPREV)                     AND'
      '      (PL.IDPLANOPREV  = PP.IDPLANOPREV)'
      'GROUP BY PJ.NOME, PP.NOME, TD.FLGTIPODESC, PD.DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 34
    Top = 288
  end
  object dsResEnvio: TwwDataSource
    DataSet = qryResEnvio
    Left = 75
    Top = 288
  end
  object ppResEnvio: TppBDEPipeline
    DataSource = dsResEnvio
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'ResEnvio'
    Left = 123
    Top = 288
  end
  object rpResEnvio: TppReport
    AutoStop = False
    DataPipeline = ppResEnvio
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 167
    Top = 288
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppResEnvio'
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33073
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Resumo de Envio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 123561
        mmTop = 8731
        mmWidth = 35454
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16140
        mmWidth = 274638
        BandType = 0
      end
      object ppLabel8: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel8'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127000
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rpResEnvioLabel1: TppLabel
        UserName = 'rpResEnvioLabel1'
        Caption = 'Patrocinadora: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 16669
        mmWidth = 23283
        BandType = 0
      end
      object rpResEnvioLabel2: TppLabel
        UserName = 'rpResEnvioLabel2'
        Caption = 'Plano: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 21167
        mmWidth = 10848
        BandType = 0
      end
      object rpResEnvioLabel3: TppLabel
        UserName = 'rpResEnvioLabel3'
        Caption = 'Mês Cobrança:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 225955
        mmTop = 16669
        mmWidth = 23283
        BandType = 0
      end
      object lblMesCobranca: TppLabel
        UserName = 'lblMesCobranca'
        Caption = 'lblMesCobranca'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 249767
        mmTop = 16669
        mmWidth = 24606
        BandType = 0
      end
      object rpResEnvioLine1: TppLine
        UserName = 'rpResEnvioLine1'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 26194
        mmWidth = 274109
        BandType = 0
      end
      object rpResEnvioLine2: TppLine
        UserName = 'rpResEnvioLine2'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26194
        mmWidth = 274638
        BandType = 0
      end
      object rpResEnvioLabel8: TppLabel
        UserName = 'rpResEnvioLabel8'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 227278
        mmTop = 27517
        mmWidth = 17727
        BandType = 0
      end
      object rpResEnvioLabel9: TppLabel
        UserName = 'rpResEnvioLabel9'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 266965
        mmTop = 27517
        mmWidth = 7673
        BandType = 0
      end
      object rpResEnvioLabel7: TppLabel
        UserName = 'rpResEnvioLabel7'
        Caption = 'Contribuições'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 27517
        mmWidth = 21696
        BandType = 0
      end
      object rpResEnvioLine4: TppLine
        UserName = 'rpResEnvioLine4'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 31750
        mmWidth = 274638
        BandType = 0
      end
      object rpResEnvioDBText1: TppDBText
        UserName = 'rpResEnvioDBText1'
        AutoSize = True
        DataField = 'PATROCINADORA'
        DataPipeline = ppResEnvio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResEnvio'
        mmHeight = 3969
        mmLeft = 23548
        mmTop = 16669
        mmWidth = 30692
        BandType = 0
      end
      object rpResEnvioDBText2: TppDBText
        UserName = 'rpResEnvioDBText2'
        AutoSize = True
        DataField = 'PLANO'
        DataPipeline = ppResEnvio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResEnvio'
        mmHeight = 3969
        mmLeft = 11377
        mmTop = 21167
        mmWidth = 11906
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpResEnvioDBText5: TppDBText
        UserName = 'rpResEnvioDBText5'
        DataField = 'QTD'
        DataPipeline = ppResEnvio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResEnvio'
        mmHeight = 4233
        mmLeft = 227807
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object rpResEnvioDBText6: TppDBText
        UserName = 'rpResEnvioDBText6'
        DataField = 'TOTAL'
        DataPipeline = ppResEnvio
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResEnvio'
        mmHeight = 4233
        mmLeft = 257440
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object rpResEnvioDBText4: TppDBText
        UserName = 'rpResEnvioDBText4'
        DataField = 'DESCRICAO'
        DataPipeline = ppResEnvio
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResEnvio'
        mmHeight = 4233
        mmLeft = 265
        mmTop = 265
        mmWidth = 206640
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine6: TppLine
        UserName = 'ppLine6'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 794
        mmWidth = 274903
        BandType = 8
      end
      object ppLabel9: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel9'
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
        mmWidth = 274903
        BandType = 8
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
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
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 248973
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpResEnvioGroup1: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppResEnvio
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpResEnvioGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResEnvio'
      object rpResEnvioGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpResEnvioGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object rpResEnvioLabel11: TppLabel
          UserName = 'rpResEnvioLabel11'
          Caption = 'Total da Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 208757
          mmTop = 0
          mmWidth = 34396
          BandType = 5
          GroupNo = 0
        end
        object rpResEnvioDBCalc3: TppDBCalc
          UserName = 'rpResEnvioDBCalc3'
          DataField = 'TOTAL'
          DataPipeline = ppResEnvio
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpResEnvioGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResEnvio'
          mmHeight = 4233
          mmLeft = 259028
          mmTop = 0
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpResEnvioGroup2: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppResEnvio
      OutlineSettings.CreateNode = True
      UserName = 'rpResEnvioGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResEnvio'
      object rpResEnvioGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpResEnvioGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object rpResEnvioLabel5: TppLabel
          UserName = 'rpResEnvioLabel5'
          Caption = 'Total do Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 208757
          mmTop = 0
          mmWidth = 21960
          BandType = 5
          GroupNo = 1
        end
        object rpResEnvioDBCalc2: TppDBCalc
          UserName = 'rpResEnvioDBCalc2'
          DataField = 'TOTAL'
          DataPipeline = ppResEnvio
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpResEnvioGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResEnvio'
          mmHeight = 4233
          mmLeft = 259028
          mmTop = 265
          mmWidth = 15875
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object rpResEnvioGroup3: TppGroup
      BreakName = 'FLGTIPODESC'
      DataPipeline = ppResEnvio
      OutlineSettings.CreateNode = True
      UserName = 'rpResEnvioGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResEnvio'
      object rpResEnvioGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpResEnvioShape1: TppShape
          UserName = 'rpResEnvioShape1'
          Brush.Color = clSilver
          mmHeight = 6085
          mmLeft = 0
          mmTop = 0
          mmWidth = 274903
          BandType = 3
          GroupNo = 2
        end
        object rpResEnvioDBText3: TppDBText
          UserName = 'rpResEnvioDBText3'
          AutoSize = True
          DataField = 'FLGTIPODESC'
          DataPipeline = ppResEnvio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppResEnvio'
          mmHeight = 4233
          mmLeft = 794
          mmTop = 1058
          mmWidth = 25135
          BandType = 3
          GroupNo = 2
        end
      end
      object rpResEnvioGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object lblDescTipoEnvio: TppLabel
          UserName = 'lblDescTipoEnvio'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 208757
          mmTop = 794
          mmWidth = 7408
          BandType = 5
          GroupNo = 2
        end
        object rpResEnvioLine3: TppLine
          UserName = 'rpResEnvioLine3'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 794
          mmTop = 265
          mmWidth = 274109
          BandType = 5
          GroupNo = 2
        end
        object rpResEnvioDBCalc1: TppDBCalc
          UserName = 'rpResEnvioDBCalc1'
          DataField = 'TOTAL'
          DataPipeline = ppResEnvio
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpResEnvioGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResEnvio'
          mmHeight = 4233
          mmLeft = 259028
          mmTop = 794
          mmWidth = 15875
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryResRecebimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.RAZAOSOCIAL FROM'
      'PESSOA P, '
      'EMPRESAPROP E '
      'WHERE  P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 34
    Top = 343
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsResRecebimento: TwwDataSource
    DataSet = qryResRecebimento
    Left = 75
    Top = 337
  end
  object ppResRecebimento: TppBDEPipeline
    DataSource = dsResRecebimento
    UserName = 'ResRecebimento'
    Left = 126
    Top = 340
  end
  object rpResRecebimento: TppReport
    AutoStop = False
    DataPipeline = ppResRecebimento
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
    Left = 176
    Top = 343
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppResRecebimento'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel10: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Resumo de Recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 74348
        mmTop = 8731
        mmWidth = 50800
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'ppLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel11: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel11'
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
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel12: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel12'
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
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
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
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
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
  object QryGeral: TwwQuery
    BeforeOpen = QryGeralBeforeOpen
    AfterClose = QryGeralAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOMEPATROC , DATAREF       ,'
      '       MATRICULA  , DESCSITFUNC   ,'
      '       DESCSITPART, MSGEXPLICATIVA,'
      '       CODPROVENTO, VALOR         ,'
      '       COUNT(IDCONTROLE) AS QTD   ,'
      
        '       DECODE(IDCONTROLE,1 ,'#39'LANÇAMENTOS NÃO ENVIADOS PELA PATRO' +
        'CINADORA'#39'                       ,'
      
        '                         2 ,'#39'LANÇAMENTOS NÃO ESPERADOS PELA FUND' +
        'AÇÃO'#39'                           ,'
      
        '                         3 ,'#39'MATRÍCULAS NÃO ENCONTRADAS NA FUNDA' +
        'ÇÃO'#39'                            ,'
      
        '                         4 ,'#39'PARTICIPANTES NÃO ATIVOS'#39'          ' +
        '                                ,'
      
        '                         5 ,'#39'PARTICIPANTES DE OUTRAS PATROCINADO' +
        'RAS'#39'                            ,'
      
        '                         6 ,'#39'CÓDIGO DE PROVENTOS NÃO ENCONTRADOS' +
        #39'                               ,'
      
        '                         7 ,'#39'SALÁRIO DE PARTICIPAÇÃO ZERADOS'#39'   ' +
        '                                ,'
      
        '                         8 ,'#39'LANÇAMENTOS ZERADOS'#39'               ' +
        '                                ,'
      
        '                         9 ,'#39'CÓDIGO DE PROVENTO COM LANÇAMENTO I' +
        'NDEVIDO DE SALÁRIO PARTICIPAÇÃO'#39','
      
        '                         10,'#39'CONTRA-CHEQUE CANCELADO'#39'           ' +
        '                                ,'
      
        '                         11,'#39'ESTORNO PENDENTE'#39'                  ' +
        '                                ,'
      
        '                         12,'#39'CONTRA-CHEQUE CANCELADO RELATIVO AO' +
        ' MÊS ANTERIOR PENDENTE'#39'         ,'
      
        '                         13,'#39'ESTORNO PENDENTE DE CONTRIBUIÇÃO DA' +
        ' DATA ANTERIOR'#39'                 ,'
      '                         14,'#39'PAGAMENTO POR APP'#39') AS IDCONTROLE'
      'FROM TABERROSCCP'
      
        'GROUP BY NOMEPATROC , IDCONTROLE , DATAREF    , MATRICULA, VALOR' +
        ','
      '         DESCSITFUNC, DESCSITPART, CODPROVENTO, MSGEXPLICATIVA'
      
        'ORDER BY NOMEPATROC , IDCONTROLE , DATAREF    , MATRICULA, VALOR' +
        ','
      '         DESCSITFUNC, DESCSITPART, CODPROVENTO, MSGEXPLICATIVA'
      '')
    ValidateWithMask = True
    Left = 421
    Top = 45
  end
  object dsGeral: TwwDataSource
    DataSet = QryGeral
    Left = 422
    Top = 32
  end
  object plGeral: TppBDEPipeline
    DataSource = dsGeral
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plGeral'
    Left = 423
    Top = 20
  end
  object rpGeral: TppReport
    AutoStop = False
    DataPipeline = plGeral
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
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 423
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'plGeral'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33338
      mmPrintPosition = 0
      object rpTotalizadorDBText1: TppDBText
        UserName = 'rpTotalizadorDBText1'
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
        mmWidth = 152400
        BandType = 0
      end
      object rpTotalizadorDBText2: TppDBText
        UserName = 'rpTotalizadorDBText2'
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
      object rpTotalizadorDBText3: TppDBText
        UserName = 'rpTotalizadorDBText3'
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
      object rpTotalizadorDBImage1: TppDBImage
        UserName = 'rpTotalizadorDBImage1'
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
      object rpTotalizadorDBText4: TppDBText
        UserName = 'rpTotalizadorDBText4'
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
      object rpTotalizadorDBText5: TppDBText
        UserName = 'rpTotalizadorDBText5'
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
      object rpTotalizadorLabel1: TppLabel
        UserName = 'rpTotalizadorLabel1'
        AutoSize = False
        Caption = 'RELATÓRIO DE CRÍTICAS DO CCP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 1323
        mmTop = 25929
        mmWidth = 195580
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpTotalizadorDBText8: TppDBText
        UserName = 'rpTotalizadorDBText8'
        DataField = 'MATRICULA'
        DataPipeline = plGeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plGeral'
        mmHeight = 4233
        mmLeft = 2117
        mmTop = 265
        mmWidth = 17727
        BandType = 4
      end
      object rpTotalizadorDBText9: TppDBText
        UserName = 'rpTotalizadorDBText9'
        DataField = 'CODPROVENTO'
        DataPipeline = plGeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plGeral'
        mmHeight = 4233
        mmLeft = 22490
        mmTop = 265
        mmWidth = 17727
        BandType = 4
      end
      object rpTotalizadorDBText10: TppDBText
        UserName = 'rpTotalizadorDBText10'
        DataPipeline = plGeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plGeral'
        mmHeight = 4233
        mmLeft = 42069
        mmTop = 265
        mmWidth = 46831
        BandType = 4
      end
      object rpTotalizadorDBText11: TppDBText
        UserName = 'rpTotalizadorDBText11'
        DataField = 'DATAREF'
        DataPipeline = plGeral
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'plGeral'
        mmHeight = 4233
        mmLeft = 113242
        mmTop = 265
        mmWidth = 26723
        BandType = 4
      end
      object rpTotalizadorDBText12: TppDBText
        UserName = 'rpTotalizadorDBText12'
        DataField = 'VALOR'
        DataPipeline = plGeral
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plGeral'
        mmHeight = 4233
        mmLeft = 168011
        mmTop = 265
        mmWidth = 23813
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel25: TppLabel
        UserName = 'ppLabel25'
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
        mmWidth = 195580
        BandType = 8
      end
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
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
        mmWidth = 195527
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
        mmLeft = 197380
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpGeralSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object SubRelatorio01: TppSubReport
        UserName = 'SubRelatorio01'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        TraverseAllData = False
        DataPipelineName = 'plTotalizador01'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpGeralChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = plTotalizador01
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
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'plTotalizador01'
          object rpGeralChildReport1HeaderBand1: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 35719
            mmPrintPosition = 0
            object rpGeralChildReport1DBText1: TppDBText
              UserName = 'rpGeralChildReport1DBText1'
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
              mmLeft = 43391
              mmTop = 3175
              mmWidth = 239184
              BandType = 0
            end
            object rpGeralChildReport1DBText2: TppDBText
              UserName = 'rpGeralChildReport1DBText2'
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
              mmLeft = 43391
              mmTop = 22490
              mmWidth = 17198
              BandType = 0
            end
            object rpGeralChildReport1DBText3: TppDBText
              UserName = 'rpGeralChildReport1DBText3'
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
              mmTop = 9790
              mmWidth = 25929
              BandType = 0
            end
            object rpGeralChildReport1DBImage1: TppDBImage
              UserName = 'rpGeralChildReport1DBImage1'
              MaintainAspectRatio = True
              DataField = 'IMAGEM'
              DataPipeline = ppFundacao
              GraphicType = 'Bitmap'
              ParentDataPipeline = False
              DataPipelineName = 'ppFundacao'
              mmHeight = 25135
              mmLeft = 2911
              mmTop = 2910
              mmWidth = 39688
              BandType = 0
            end
            object rpGeralChildReport1DBText4: TppDBText
              UserName = 'rpGeralChildReport1DBText4'
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
              mmTop = 14288
              mmWidth = 15875
              BandType = 0
            end
            object rpGeralChildReport1DBText5: TppDBText
              UserName = 'rpGeralChildReport1DBText5'
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
              mmTop = 18256
              mmWidth = 14288
              BandType = 0
            end
            object rpGeralChildReport1Label2: TppLabel
              UserName = 'rpGeralChildReport1Label2'
              AutoSize = False
              Caption = 'TOTALIZAÇÕES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5027
              mmLeft = 1323
              mmTop = 28046
              mmWidth = 279401
              BandType = 0
            end
          end
          object rpGeralChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4233
            mmPrintPosition = 0
            object rpGeralChildReport1DBText7: TppDBText
              UserName = 'rpGeralChildReport1DBText7'
              DataField = 'CODPROVDESC'
              DataPipeline = plTotalizador01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plTotalizador01'
              mmHeight = 4233
              mmLeft = 2117
              mmTop = 0
              mmWidth = 13758
              BandType = 4
            end
            object rpGeralChildReport1DBText8: TppDBText
              UserName = 'rpGeralChildReport1DBText8'
              DataField = 'DESCRPROVDESC'
              DataPipeline = plTotalizador01
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plTotalizador01'
              mmHeight = 4233
              mmLeft = 19844
              mmTop = 0
              mmWidth = 112977
              BandType = 4
            end
            object rpGeralChildReport1DBText9: TppDBText
              UserName = 'rpGeralChildReport1DBText9'
              DataField = 'VALORESPERADO'
              DataPipeline = plTotalizador01
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plTotalizador01'
              mmHeight = 4233
              mmLeft = 143669
              mmTop = 0
              mmWidth = 43921
              BandType = 4
            end
            object rpGeralChildReport1DBText10: TppDBText
              UserName = 'rpGeralChildReport1DBText10'
              DataField = 'VALORRECEBIDO'
              DataPipeline = plTotalizador01
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plTotalizador01'
              mmHeight = 4233
              mmLeft = 203994
              mmTop = 0
              mmWidth = 43921
              BandType = 4
            end
          end
          object rpGeralChildReport1FooterBand1: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object rpGeralChildReport1Label1: TppLabel
              UserName = 'rpGeralChildReport1Label1'
              AutoSize = False
              Caption = 'Nome do Sistema'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 1058
              mmTop = 2117
              mmWidth = 283634
              BandType = 8
            end
            object rpGeralChildReport1Line1: TppLine
              UserName = 'rpGeralChildReport1Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 794
              mmWidth = 284300
              BandType = 8
            end
            object rpGeralChildReport1Calc1: TppSystemVariable
              UserName = 'rpGeralChildReport1Calc1'
              VarType = vtPageSetDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 1058
              mmTop = 2117
              mmWidth = 283634
              BandType = 8
            end
            object rpGeralChildReport1Calc2: TppSystemVariable
              UserName = 'rpGeralChildReport1Calc2'
              VarType = vtDateTime
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 197380
              mmTop = 2117
              mmWidth = 26194
              BandType = 8
            end
          end
          object rpGeralChildReport1Group1: TppGroup
            BreakName = 'SIT'
            DataPipeline = plTotalizador01
            OutlineSettings.CreateNode = True
            UserName = 'rpGeralChildReport1Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'plTotalizador01'
            object rpGeralChildReport1GroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 15081
              mmPrintPosition = 0
              object rpGeralChildReport1Line2: TppLine
                UserName = 'rpGeralChildReport1Line2'
                Weight = 0.75
                mmHeight = 1852
                mmLeft = 0
                mmTop = 14023
                mmWidth = 282311
                BandType = 3
                GroupNo = 0
              end
              object rpGeralChildReport1Label3: TppLabel
                UserName = 'rpGeralChildReport1Label3'
                Caption = 'Código'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 2117
                mmTop = 9260
                mmWidth = 11906
                BandType = 3
                GroupNo = 0
              end
              object rpGeralChildReport1Label4: TppLabel
                UserName = 'rpGeralChildReport1Label4'
                Caption = 'Provento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 19845
                mmTop = 9260
                mmWidth = 15081
                BandType = 3
                GroupNo = 0
              end
              object rpGeralChildReport1Label5: TppLabel
                UserName = 'rpGeralChildReport1Label5'
                Caption = 'Situação :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 2117
                mmTop = 0
                mmWidth = 16933
                BandType = 3
                GroupNo = 0
              end
              object rpGeralChildReport1DBText6: TppDBText
                UserName = 'rpGeralChildReport1DBText6'
                DataField = 'SIT'
                DataPipeline = plTotalizador01
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'plTotalizador01'
                mmHeight = 4233
                mmLeft = 19844
                mmTop = 0
                mmWidth = 17198
                BandType = 3
                GroupNo = 0
              end
              object rpGeralChildReport1Label6: TppLabel
                UserName = 'rpGeralChildReport1Label6'
                Caption = 'Valor Esperado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 161925
                mmTop = 9260
                mmWidth = 25665
                BandType = 3
                GroupNo = 0
              end
              object rpGeralChildReport1Label7: TppLabel
                UserName = 'rpGeralChildReport1Label7'
                Caption = 'Valor Recebido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 221986
                mmTop = 9260
                mmWidth = 25929
                BandType = 3
                GroupNo = 0
              end
            end
            object rpGeralChildReport1GroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 19050
              mmPrintPosition = 0
              object rpGeralChildReport1DBText11: TppDBText
                UserName = 'rpGeralChildReport1DBText11'
                DataField = 'TOTALPORTIPO'
                DataPipeline = plTotalizador01
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'plTotalizador01'
                mmHeight = 4233
                mmLeft = 237861
                mmTop = 265
                mmWidth = 44450
                BandType = 5
                GroupNo = 0
              end
              object rpGeralChildReport1Line3: TppLine
                UserName = 'rpGeralChildReport1Line3'
                Weight = 0.75
                mmHeight = 1852
                mmLeft = 0
                mmTop = 0
                mmWidth = 282311
                BandType = 5
                GroupNo = 0
              end
              object rpGeralChildReport1Label8: TppLabel
                UserName = 'rpGeralChildReport1Label8'
                Caption = 'Total :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 224367
                mmTop = 265
                mmWidth = 10583
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
      object SubRelatorio02: TppSubReport
        UserName = 'SubRelatorio02'
        ExpandAll = False
        NewPrintJob = True
        OutlineSettings.CreateNode = True
        PrintBehavior = pbSection
        ShiftRelativeTo = SubRelatorio01
        TraverseAllData = False
        DataPipelineName = 'plTotalizador02'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 4763
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpGeralChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = plTotalizador02
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
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'plTotalizador02'
          object rpGeralChildReport2HeaderBand1: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 32544
            mmPrintPosition = 0
            object rpGeralChildReport2DBText1: TppDBText
              UserName = 'rpGeralChildReport2DBText1'
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
              mmLeft = 43391
              mmTop = 265
              mmWidth = 239184
              BandType = 0
            end
            object rpGeralChildReport2DBText2: TppDBText
              UserName = 'rpGeralChildReport2DBText2'
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
              mmLeft = 43391
              mmTop = 19579
              mmWidth = 17198
              BandType = 0
            end
            object rpGeralChildReport2DBText3: TppDBText
              UserName = 'rpGeralChildReport2DBText3'
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
              mmTop = 6879
              mmWidth = 25929
              BandType = 0
            end
            object rpGeralChildReport2DBImage1: TppDBImage
              UserName = 'rpGeralChildReport2DBImage1'
              MaintainAspectRatio = True
              DataField = 'IMAGEM'
              DataPipeline = ppFundacao
              GraphicType = 'Bitmap'
              ParentDataPipeline = False
              DataPipelineName = 'ppFundacao'
              mmHeight = 25135
              mmLeft = 2911
              mmTop = 0
              mmWidth = 39688
              BandType = 0
            end
            object rpGeralChildReport2DBText4: TppDBText
              UserName = 'rpGeralChildReport2DBText4'
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
              mmTop = 11377
              mmWidth = 15875
              BandType = 0
            end
            object rpGeralChildReport2DBText5: TppDBText
              UserName = 'rpGeralChildReport2DBText5'
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
              mmTop = 15346
              mmWidth = 14288
              BandType = 0
            end
            object rpGeralChildReport2Label2: TppLabel
              UserName = 'rpGeralChildReport2Label2'
              AutoSize = False
              Caption = 'TOTALIZAÇÕES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 12
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 5027
              mmLeft = 1323
              mmTop = 25135
              mmWidth = 279401
              BandType = 0
            end
          end
          object rpGeralChildReport2DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object rpGeralChildReport2DBText7: TppDBText
              UserName = 'rpGeralChildReport2DBText7'
              DataField = 'CODPROVDESC'
              DataPipeline = plTotalizador02
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plTotalizador02'
              mmHeight = 4233
              mmLeft = 1323
              mmTop = 265
              mmWidth = 13758
              BandType = 4
            end
            object rpGeralChildReport2DBText8: TppDBText
              UserName = 'rpGeralChildReport2DBText8'
              DataField = 'DESCRPROVDESC'
              DataPipeline = plTotalizador02
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              DataPipelineName = 'plTotalizador02'
              mmHeight = 4233
              mmLeft = 19050
              mmTop = 265
              mmWidth = 112977
              BandType = 4
            end
            object rpGeralChildReport2DBText9: TppDBText
              UserName = 'rpGeralChildReport2DBText9'
              DataField = 'VALORESPERADO'
              DataPipeline = plTotalizador02
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plTotalizador02'
              mmHeight = 4233
              mmLeft = 142875
              mmTop = 265
              mmWidth = 43921
              BandType = 4
            end
            object rpGeralChildReport2DBText10: TppDBText
              UserName = 'rpGeralChildReport2DBText10'
              DataField = 'VALORRECEBIDO'
              DataPipeline = plTotalizador02
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'plTotalizador02'
              mmHeight = 4233
              mmLeft = 203200
              mmTop = 265
              mmWidth = 43921
              BandType = 4
            end
          end
          object rpGeralChildReport2FooterBand1: TppFooterBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object rpGeralChildReport2Label1: TppLabel
              UserName = 'rpGeralChildReport2Label1'
              AutoSize = False
              Caption = 'Nome do Sistema'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 1058
              mmTop = 1852
              mmWidth = 283634
              BandType = 8
            end
            object rpGeralChildReport2Line1: TppLine
              UserName = 'rpGeralChildReport2Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 8
            end
            object rpGeralChildReport2Calc1: TppSystemVariable
              UserName = 'rpGeralChildReport2Calc1'
              VarType = vtPageSetDesc
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 1058
              mmTop = 1852
              mmWidth = 283634
              BandType = 8
            end
            object rpGeralChildReport2Calc2: TppSystemVariable
              UserName = 'rpGeralChildReport2Calc2'
              VarType = vtDateTime
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 197380
              mmTop = 1852
              mmWidth = 26194
              BandType = 8
            end
          end
          object rpGeralChildReport2Group1: TppGroup
            BreakName = 'SIT'
            DataPipeline = plTotalizador02
            OutlineSettings.CreateNode = True
            UserName = 'rpGeralChildReport2Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'plTotalizador02'
            object rpGeralChildReport2GroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 17992
              mmPrintPosition = 0
              object rpGeralChildReport2Line2: TppLine
                UserName = 'rpGeralChildReport2Line2'
                Weight = 0.75
                mmHeight = 1852
                mmLeft = 0
                mmTop = 16140
                mmWidth = 282311
                BandType = 3
                GroupNo = 0
              end
              object rpGeralChildReport2Label3: TppLabel
                UserName = 'rpGeralChildReport2Label3'
                Caption = 'Código'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 2117
                mmTop = 11377
                mmWidth = 11906
                BandType = 3
                GroupNo = 0
              end
              object rpGeralChildReport2Label4: TppLabel
                UserName = 'rpGeralChildReport2Label4'
                Caption = 'Provento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 19845
                mmTop = 11377
                mmWidth = 15081
                BandType = 3
                GroupNo = 0
              end
              object rpGeralChildReport2Label5: TppLabel
                UserName = 'rpGeralChildReport2Label5'
                Caption = 'Situação :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 2116
                mmTop = 2117
                mmWidth = 16933
                BandType = 3
                GroupNo = 0
              end
              object rpGeralChildReport2DBText6: TppDBText
                UserName = 'rpGeralChildReport2DBText6'
                DataField = 'SIT'
                DataPipeline = plTotalizador02
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                DataPipelineName = 'plTotalizador02'
                mmHeight = 4233
                mmLeft = 19845
                mmTop = 2117
                mmWidth = 17198
                BandType = 3
                GroupNo = 0
              end
              object rpGeralChildReport2Label6: TppLabel
                UserName = 'rpGeralChildReport2Label6'
                Caption = 'Valor Esperado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 160867
                mmTop = 11377
                mmWidth = 25665
                BandType = 3
                GroupNo = 0
              end
              object rpGeralChildReport2Label7: TppLabel
                UserName = 'rpGeralChildReport2Label7'
                Caption = 'Valor Recebido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 220928
                mmTop = 11377
                mmWidth = 25929
                BandType = 3
                GroupNo = 0
              end
            end
            object rpGeralChildReport2GroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 18521
              mmPrintPosition = 0
              object rpGeralChildReport2Line3: TppLine
                UserName = 'rpGeralChildReport2Line3'
                Weight = 0.75
                mmHeight = 1852
                mmLeft = 2117
                mmTop = 0
                mmWidth = 282311
                BandType = 5
                GroupNo = 0
              end
              object rpGeralChildReport2Label8: TppLabel
                UserName = 'rpGeralChildReport2Label8'
                Caption = 'Total :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 224367
                mmTop = 265
                mmWidth = 10583
                BandType = 5
                GroupNo = 0
              end
              object rpGeralChildReport2DBText11: TppDBText
                UserName = 'rpGeralChildReport2DBText11'
                DataField = 'TOTALPORTIPO'
                DataPipeline = plTotalizador01
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'plTotalizador01'
                mmHeight = 4233
                mmLeft = 237861
                mmTop = 265
                mmWidth = 44450
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
    end
    object rpTotalizadorGroup1: TppGroup
      BreakName = 'NOMEPATROC'
      DataPipeline = plGeral
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpTotalizadorGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plGeral'
      object rpTotalizadorGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpTotalizadorLabel2: TppLabel
          UserName = 'rpTotalizadorLabel2'
          Caption = 'Patrocinadora :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 1058
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object rpTotalizadorDBText6: TppDBText
          UserName = 'rpTotalizadorDBText6'
          AutoSize = True
          DataField = 'NOMEPATROC'
          DataPipeline = plGeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'plGeral'
          mmHeight = 3969
          mmLeft = 28310
          mmTop = 1058
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
      end
      object rpTotalizadorGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object rpTotalizadorLine3: TppLine
          UserName = 'rpTotalizadorLine3'
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 0
          mmWidth = 282311
          BandType = 5
          GroupNo = 0
        end
        object rpTotalizadorLabel12: TppLabel
          UserName = 'rpTotalizadorLabel12'
          Caption = 'Quantidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4763
          mmTop = 794
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
        object rpTotalizadorDBCalc3: TppDBCalc
          UserName = 'rpTotalizadorDBCalc3'
          DataField = 'MATRICULA'
          DataPipeline = plGeral
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpTotalizadorGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'plGeral'
          mmHeight = 4233
          mmLeft = 26988
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object rpTotalizadorLabel13: TppLabel
          UserName = 'rpTotalizadorLabel13'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 156898
          mmTop = 794
          mmWidth = 9525
          BandType = 5
          GroupNo = 0
        end
        object rpTotalizadorDBCalc4: TppDBCalc
          UserName = 'rpTotalizadorDBCalc4'
          DataField = 'VALOR'
          DataPipeline = plGeral
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpTotalizadorGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGeral'
          mmHeight = 4233
          mmLeft = 168011
          mmTop = 794
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpTotalizadorGroup2: TppGroup
      BreakName = 'IDCONTROLE'
      DataPipeline = plGeral
      OutlineSettings.CreateNode = True
      UserName = 'rpTotalizadorGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plGeral'
      object rpTotalizadorGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14817
        mmPrintPosition = 0
        object rpTotalizadorDBText7: TppDBText
          UserName = 'rpTotalizadorDBText7'
          DataField = 'IDCONTROLE'
          DataPipeline = plGeral
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'plGeral'
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 2381
          mmWidth = 195580
          BandType = 3
          GroupNo = 1
        end
        object rpTotalizadorLabel3: TppLabel
          UserName = 'rpTotalizadorLabel3'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 8467
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object rpTotalizadorLine1: TppLine
          UserName = 'rpTotalizadorLine1'
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 265
          mmTop = 12435
          mmWidth = 282311
          BandType = 3
          GroupNo = 1
        end
        object rpTotalizadorLabel4: TppLabel
          UserName = 'rpTotalizadorLabel4'
          Caption = 'Código       Provento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 22490
          mmTop = 8467
          mmWidth = 34396
          BandType = 3
          GroupNo = 1
        end
        object rpTotalizadorLabel5: TppLabel
          UserName = 'rpTotalizadorLabel5'
          Caption = 'Data Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 113242
          mmTop = 8467
          mmWidth = 26988
          BandType = 3
          GroupNo = 1
        end
        object rpTotalizadorLabel6: TppLabel
          UserName = 'rpTotalizadorLabel6'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 183092
          mmTop = 8467
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
      end
      object rpTotalizadorGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object rpTotalizadorLine2: TppLine
          UserName = 'rpTotalizadorLine2'
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 0
          mmWidth = 282311
          BandType = 5
          GroupNo = 1
        end
        object rpTotalizadorLabel10: TppLabel
          UserName = 'rpTotalizadorLabel10'
          Caption = 'Quantidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 43392
          mmTop = 794
          mmWidth = 20638
          BandType = 5
          GroupNo = 1
        end
        object rpTotalizadorDBCalc1: TppDBCalc
          UserName = 'rpTotalizadorDBCalc1'
          DataField = 'MATRICULA'
          DataPipeline = plGeral
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpTotalizadorGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'plGeral'
          mmHeight = 4233
          mmLeft = 65617
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object rpTotalizadorDBCalc2: TppDBCalc
          UserName = 'rpTotalizadorDBCalc2'
          DataField = 'VALOR'
          DataPipeline = plGeral
          DisplayFormat = '###,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = rpTotalizadorGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plGeral'
          mmHeight = 4233
          mmLeft = 168011
          mmTop = 794
          mmWidth = 23813
          BandType = 5
          GroupNo = 1
        end
        object rpTotalizadorLabel11: TppLabel
          UserName = 'rpTotalizadorLabel11'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 156898
          mmTop = 794
          mmWidth = 9525
          BandType = 5
          GroupNo = 1
        end
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
      '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 242
    Top = 34
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = '1'
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 275
    Top = 65526
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 196
    Top = 65521
  end
  object qryTotalizador01: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE, A.CODPROVDESC, B.DESCRPROVDESC,'
      
        '       DECODE(SITENVIO,0,'#39'0 - ENVIADO PELA FUNDAÇÃO MAS NÃO RECE' +
        'BIDO'#39','
      
        '                       1,'#39'1 - VALORES DIVERGENTES'#39'              ' +
        '     ,'
      
        '                       2,'#39'2 - VALORES COINCIDENTES'#39'             ' +
        '     ,'#39'OUTROS'#39') AS SIT,'
      '       COUNT(*)           AS TOTALPORTIPO ,'
      '       SUM(VALOR)         AS VALORESPERADO,'
      '       SUM(VALORRECEBIDO) AS VALORRECEBIDO'
      'FROM TMPDESC A, RUBRICAXPESS B'
      'WHERE (IDPESSJUR     = :IDPESSJUR)    AND'
      '      (MESCOBRANCA   = :MESCOBRANCA)  AND'
      '      (IDLOTE        = :IDLOTE)       AND'
      '      (A.CODPROVDESC = B.CODPROVDESC) AND'
      '      (A.IDPESSJUR   = B.IDPESSOA)'
      'GROUP BY IDLOTE, A.CODPROVDESC, B.DESCRPROVDESC, SITENVIO')
    ValidateWithMask = True
    Left = 421
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
  end
  object dsTotalizador01: TwwDataSource
    DataSet = qryTotalizador01
    Left = 422
    Top = 103
  end
  object plTotalizador01: TppBDEPipeline
    DataSource = dsTotalizador01
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plTotalizador01'
    Left = 423
    Top = 91
    object plTotalizador01ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object plTotalizador01ppField2: TppField
      FieldAlias = 'CODPROVDESC'
      FieldName = 'CODPROVDESC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object plTotalizador01ppField3: TppField
      FieldAlias = 'DESCRPROVDESC'
      FieldName = 'DESCRPROVDESC'
      FieldLength = 130
      DisplayWidth = 130
      Position = 2
    end
    object plTotalizador01ppField4: TppField
      FieldAlias = 'SIT'
      FieldName = 'SIT'
      FieldLength = 42
      DisplayWidth = 42
      Position = 3
    end
    object plTotalizador01ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALPORTIPO'
      FieldName = 'TOTALPORTIPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object plTotalizador01ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORESPERADO'
      FieldName = 'VALORESPERADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object plTotalizador01ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object qryTotalizador02: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE, A.CODPROVDESC, B.DESCRPROVDESC,'
      
        '       DECODE(SITENVIO,0,'#39'0 - REGISTRO EFETIVADO COM ERRO'#39'      ' +
        '          ,'
      
        '                       1,'#39'1 - VALORES DIVERGENTES'#39'              ' +
        '          ,'
      
        '                       2,'#39'2 - VALORES COINCIDENTES - SITUAÇÃO CO' +
        'NFLITANTE'#39','#39'OUTROS'#39') AS SIT,'
      '       COUNT(*)           AS TOTALPORTIPO ,'
      '       SUM(VALOR)         AS VALORESPERADO,'
      '       SUM(VALORRECEBIDO) AS VALORRECEBIDO'
      'FROM TMPDESC A, RUBRICAXPESS B'
      'WHERE (IDPESSJUR     = :IDPESSJUR)    AND'
      '      (MESCOBRANCA   = :MESCOBRANCA)  AND'
      '      (IDLOTE        = :IDLOTE)       AND'
      '      (A.CODPROVDESC = B.CODPROVDESC) AND'
      '      (A.IDPESSJUR   = B.IDPESSOA)'
      'GROUP BY IDLOTE, A.CODPROVDESC, B.DESCRPROVDESC, SITENVIO')
    ValidateWithMask = True
    Left = 421
    Top = 188
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
  end
  object dsTotalizador02: TwwDataSource
    DataSet = qryTotalizador02
    Left = 422
    Top = 175
  end
  object plTotalizador02: TppBDEPipeline
    DataSource = dsTotalizador02
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plTotalizador02'
    Left = 423
    Top = 163
    object plTotalizador02ppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDLOTE'
      FieldName = 'IDLOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object plTotalizador02ppField2: TppField
      FieldAlias = 'CODPROVDESC'
      FieldName = 'CODPROVDESC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object plTotalizador02ppField3: TppField
      FieldAlias = 'DESCRPROVDESC'
      FieldName = 'DESCRPROVDESC'
      FieldLength = 130
      DisplayWidth = 130
      Position = 2
    end
    object plTotalizador02ppField4: TppField
      FieldAlias = 'SIT'
      FieldName = 'SIT'
      FieldLength = 47
      DisplayWidth = 47
      Position = 3
    end
    object plTotalizador02ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTALPORTIPO'
      FieldName = 'TOTALPORTIPO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object plTotalizador02ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORESPERADO'
      FieldName = 'VALORESPERADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object plTotalizador02ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object rpCriticasCcp: TppReport
    AutoStop = False
    DataPipeline = ppCriticasCcp
    OnStartPage = rpCriticasCcpStartPage
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
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 167
    Top = 189
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppCriticasCcp'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 39688
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        UserName = 'ppLabel13'
        Caption = 'Críticas da Importação de Dados Cadastrais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 58473
        mmTop = 8731
        mmWidth = 88371
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
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
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
      object ppLabel15: TppLabel
        UserName = 'ppLabel15'
        Caption = 'Patrocinadora:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 17463
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'ppLabel16'
        Caption = 'Mês:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 117740
        mmTop = 17463
        mmWidth = 7673
        BandType = 0
      end
      object pplblMes: TppLabel
        UserName = 'pplblMes'
        Caption = 'pplblMes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 126471
        mmTop = 17463
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'ppLabel18'
        Caption = 'Ocorrência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 22754
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'ppLabel21'
        Caption = 'Valor Chave'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 33867
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'ppLabel22'
        Caption = 'Informação Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 32279
        mmTop = 33867
        mmWidth = 29633
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 33073
        mmWidth = 197300
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'ppLine11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 38629
        mmWidth = 197300
        BandType = 0
      end
      object pplblPatro: TppLabel
        UserName = 'pplblPatro'
        AutoSize = False
        Caption = 'pplblPatro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 23019
        mmTop = 17463
        mmWidth = 91017
        BandType = 0
      end
      object pplblOco: TppLabel
        UserName = 'pplblOco'
        AutoSize = False
        Caption = 'pplblOco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 18785
        mmTop = 22754
        mmWidth = 94456
        BandType = 0
      end
      object rpCriticasCcpLabel1: TppLabel
        UserName = 'rpCriticasCcpLabel1'
        Caption = 'Chave:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 117740
        mmTop = 22754
        mmWidth = 10319
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
        DataField = 'CHAVE'
        DataPipeline = ppCriticasCcp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCriticasCcp'
        mmHeight = 4498
        mmLeft = 128852
        mmTop = 22754
        mmWidth = 17198
        BandType = 0
      end
      object rpCriticasCcpLabel2: TppLabel
        UserName = 'rpCriticasCcpLabel2'
        Caption = 'Informação Importada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 115359
        mmTop = 33867
        mmWidth = 32808
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'ppDBText6'
        DataField = 'VALORCHAVE'
        DataPipeline = ppCriticasCcp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCriticasCcp'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 265
        mmWidth = 22754
        BandType = 4
      end
      object rpCriticasCcpDBText1: TppDBText
        UserName = 'rpCriticasCcpDBText1'
        DataField = 'VALORNAFUNDACAO'
        DataPipeline = ppCriticasCcp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCriticasCcp'
        mmHeight = 3704
        mmLeft = 32279
        mmTop = 265
        mmWidth = 79904
        BandType = 4
      end
      object rpCriticasCcpDBText2: TppDBText
        UserName = 'rpCriticasCcpDBText2'
        DataField = 'VALORNOINTERFACE'
        DataPipeline = ppCriticasCcp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppCriticasCcp'
        mmHeight = 3704
        mmLeft = 115359
        mmTop = 265
        mmWidth = 79904
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel26: TppLabel
        UserName = 'ppLabel26'
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
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
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
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
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
  object ppCriticasCcp: TppBDEPipeline
    DataSource = dsCriticasCcp
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'CriticasCcp'
    Left = 123
    Top = 189
  end
  object dsCriticasCcp: TwwDataSource
    AutoEdit = False
    DataSet = frmConsCriticasCcp.qryDet
    Left = 75
    Top = 189
  end
  object ppEnvioArqPatroSint: TppBDEPipeline
    DataSource = dsEnvioArqPatroSint
    CloseDataSource = True
    UserName = 'EnvioArqPatroSint'
    Left = 306
    Top = 264
  end
  object dsEnvioArqPatroSint: TwwDataSource
    DataSet = qryEnvioArqPatroSint
    Left = 269
    Top = 264
  end
  object qryEnvioArqPatroSint: TwwQuery
    BeforeOpen = qryEnvioArqPatroSintBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        T.IDPESSJUR, PATRO.NOME, T.IDPLANOPREV, PL.NOME ,'
      '        M.NOMEMODULO, T.IDPROVENTO, RB.DESCRPROVDESC ,'
      '         SUM(T.VALOR) AS VALOR, COUNT(1) AS QUANTIDADE'
      'FROM'
      
        '        TMPDESC T, PESSOA PATRO , PLANPREV PL , RUBRICAXPESS RB,' +
        ' MODULO M'
      'WHERE'
      '        ROWNUM <=10'
      'GROUP BY '
      '        T.IDPESSJUR, PATRO.NOME, T.IDPLANOPREV, PL.NOME ,'
      '        M.NOMEMODULO,T.IDPROVENTO, RB.DESCRPROVDESC'
      '        '
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
      ' ')
    ValidateWithMask = True
    Left = 234
    Top = 264
    object qryEnvioArqPatroSintIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryEnvioArqPatroSintNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryEnvioArqPatroSintIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryEnvioArqPatroSintNOME_1: TStringField
      FieldName = 'NOME_1'
      Size = 50
    end
    object qryEnvioArqPatroSintNOMEMODULO: TStringField
      FieldName = 'NOMEMODULO'
      FixedChar = True
      Size = 50
    end
    object qryEnvioArqPatroSintIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
    object qryEnvioArqPatroSintDESCRPROVDESC: TStringField
      FieldName = 'DESCRPROVDESC'
      Size = 130
    end
    object qryEnvioArqPatroSintVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryEnvioArqPatroSintQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
  end
  object rpEnvioArqPatroSint: TppReport
    AutoStop = False
    DataPipeline = ppEnvioArqPatroSint
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
    Left = 344
    Top = 264
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppEnvioArqPatroSint'
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32808
      mmPrintPosition = 0
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 0
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
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
        mmLeft = 44186
        mmTop = 265
        mmWidth = 152400
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
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
        mmLeft = 44186
        mmTop = 6879
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
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
        mmLeft = 44186
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
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
        mmLeft = 44186
        mmTop = 16404
        mmWidth = 14552
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText201'
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
        mmLeft = 44186
        mmTop = 20638
        mmWidth = 17198
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'Line20'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 3175
        mmTop = 32015
        mmWidth = 191823
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label44'
        Caption = 'Espelho de Envio dos Arquivos para Patrocinadora - Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 40481
        mmTop = 26194
        mmWidth = 125148
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'DESCRPROVDESC'
        DataPipeline = ppEnvioArqPatroSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEnvioArqPatroSint'
        mmHeight = 3969
        mmLeft = 31221
        mmTop = 0
        mmWidth = 64823
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppEnvioArqPatroSint
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEnvioArqPatroSint'
        mmHeight = 3969
        mmLeft = 177007
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText112: TppDBText
        UserName = 'DBText112'
        DataField = 'QUANTIDADE'
        DataPipeline = ppEnvioArqPatroSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEnvioArqPatroSint'
        mmHeight = 3969
        mmLeft = 107156
        mmTop = 0
        mmWidth = 14023
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
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
        mmTop = 1058
        mmWidth = 197380
        BandType = 8
      end
      object ppLine17: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel27: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'InterfacePREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1058
        mmWidth = 197909
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
        mmLeft = 170657
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'Total Geral :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 0
        mmWidth = 20902
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppEnvioArqPatroSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEnvioArqPatroSint'
        mmHeight = 3969
        mmLeft = 164307
        mmTop = 0
        mmWidth = 24606
        BandType = 7
      end
      object ppDBCalc25: TppDBCalc
        UserName = 'DBCalc25'
        DataField = 'QUANTIDADE'
        DataPipeline = ppEnvioArqPatroSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEnvioArqPatroSint'
        mmHeight = 3969
        mmLeft = 109273
        mmTop = 0
        mmWidth = 11906
        BandType = 7
      end
      object ppLabel136: TppLabel
        UserName = 'Label136'
        Caption = 'registros no valor total de R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 122502
        mmTop = 0
        mmWidth = 45508
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppEnvioArqPatroSint
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEnvioArqPatroSint'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppLabel36: TppLabel
          UserName = 'Label36'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4233
          mmTop = 0
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = ppEnvioArqPatroSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroSint'
          mmHeight = 4233
          mmLeft = 31221
          mmTop = 0
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppLabel45: TppLabel
          UserName = 'Label45'
          Caption = 'Mês de Referência :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 115359
          mmTop = 0
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object LbMesReferenciaSint: TppLabel
          UserName = 'LbMesReferenciaSint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 149490
          mmTop = 0
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel134: TppLabel
          UserName = 'Label134'
          Caption = 'Total da Patrocinadora :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 794
          mmWidth = 41010
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc23: TppDBCalc
          UserName = 'DBCalc202'
          DataField = 'QUANTIDADE'
          DataPipeline = ppEnvioArqPatroSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroSint'
          mmHeight = 3969
          mmLeft = 109273
          mmTop = 1058
          mmWidth = 11906
          BandType = 5
          GroupNo = 0
        end
        object ppLabel135: TppLabel
          UserName = 'Label135'
          Caption = 'registros no valor total de R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 122502
          mmTop = 1058
          mmWidth = 45508
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc24: TppDBCalc
          UserName = 'DBCalc24'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = ppEnvioArqPatroSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroSint'
          mmHeight = 3969
          mmLeft = 164307
          mmTop = 1058
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'NOME_1'
      DataPipeline = ppEnvioArqPatroSint
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEnvioArqPatroSint'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppLabel37: TppLabel
          UserName = 'Label37'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4233
          mmTop = 0
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          AutoSize = True
          DataField = 'NOME_1'
          DataPipeline = ppEnvioArqPatroSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroSint'
          mmHeight = 4233
          mmLeft = 31221
          mmTop = 0
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppLabel131: TppLabel
          UserName = 'Label131'
          Caption = 'Total do Plano :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4233
          mmTop = 529
          mmWidth = 26988
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc21: TppDBCalc
          UserName = 'DBCalc201'
          DataField = 'QUANTIDADE'
          DataPipeline = ppEnvioArqPatroSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroSint'
          mmHeight = 3969
          mmLeft = 109273
          mmTop = 794
          mmWidth = 11906
          BandType = 5
          GroupNo = 1
        end
        object ppLabel133: TppLabel
          UserName = 'Label133'
          Caption = 'registros no valor total de R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 122502
          mmTop = 794
          mmWidth = 45508
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc22: TppDBCalc
          UserName = 'DBCalc22'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = ppEnvioArqPatroSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroSint'
          mmHeight = 3969
          mmLeft = 164307
          mmTop = 794
          mmWidth = 24606
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'NOMEMODULO'
      DataPipeline = ppEnvioArqPatroSint
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEnvioArqPatroSint'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppLabel38: TppLabel
          UserName = 'Label38'
          Caption = 'Módulo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4233
          mmTop = 0
          mmWidth = 12700
          BandType = 3
          GroupNo = 2
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'NOMEMODULO'
          DataPipeline = ppEnvioArqPatroSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroSint'
          mmHeight = 4233
          mmLeft = 31221
          mmTop = 0
          mmWidth = 26458
          BandType = 3
          GroupNo = 2
        end
        object ppLabel39: TppLabel
          UserName = 'Label39'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 31221
          mmTop = 6615
          mmWidth = 13229
          BandType = 3
          GroupNo = 2
        end
        object ppLabel40: TppLabel
          UserName = 'Label40'
          Caption = 'Valor R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 174625
          mmTop = 6350
          mmWidth = 14288
          BandType = 3
          GroupNo = 2
        end
        object ppLine19: TppLine
          UserName = 'Line19'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 3175
          mmTop = 5027
          mmWidth = 191823
          BandType = 3
          GroupNo = 2
        end
        object ppLabel130: TppLabel
          UserName = 'Label130'
          Caption = 'Quantidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 101600
          mmTop = 7408
          mmWidth = 19579
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Total do Módulo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4233
          mmTop = 1323
          mmWidth = 30163
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = ppEnvioArqPatroSint
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroSint'
          mmHeight = 3969
          mmLeft = 164307
          mmTop = 1323
          mmWidth = 24606
          BandType = 5
          GroupNo = 2
        end
        object ppLabel132: TppLabel
          UserName = 'Label132'
          Caption = 'registros no valor total de R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 122502
          mmTop = 1323
          mmWidth = 45508
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc20: TppDBCalc
          UserName = 'DBCalc20'
          DataField = 'QUANTIDADE'
          DataPipeline = ppEnvioArqPatroSint
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroSint'
          mmHeight = 3969
          mmLeft = 109273
          mmTop = 1323
          mmWidth = 11906
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object ppEnvioArqPatroAnal: TppBDEPipeline
    DataSource = dsEnvioArqPatroAnal
    CloseDataSource = True
    UserName = 'EnvioArqPatroAnal'
    Left = 306
    Top = 232
  end
  object dsEnvioArqPatroAnal: TwwDataSource
    DataSet = qryEnvioArqPatroAnal
    Left = 269
    Top = 232
  end
  object qryEnvioArqPatroAnal: TwwQuery
    BeforeOpen = qryEnvioArqPatroAnalBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        T.IDPESSJUR, PATRO.NOME , T.IDPLANOPREV, PL.NOME ,'
      '        T.IDPROVENTO, RB.DESCRPROVDESC , PART.IDPESSOA,'
      '        PART.NOME ,  M.NOMEMODULO,'
      '        EL.MATRICULA, PT.INSCRICAONUMERO, SUM(T.VALOR) AS VALOR,'
      '        COUNT(*) AS QUANTIDADE'
      ''
      'FROM'
      '     TMPDESC T, PESSOA PATRO ,  PESSOA PART, ELEGPATRO EL,'
      '     PARTPREVPLAN PT, PLANPREV PL , RUBRICAXPESS RB, MODULO M'
      'WHERE  ROWNUM <=10'
      'GROUP BY'
      '        T.IDPESSJUR, PATRO.NOME , T.IDPLANOPREV, PL.NOME ,'
      '        T.IDPROVENTO, RB.DESCRPROVDESC , PART.IDPESSOA,'
      '        PART.NOME , M.NOMEMODULO,'
      '        EL.MATRICULA, PT.INSCRICAONUMERO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 234
    Top = 232
    object qryEnvioArqPatroAnalIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryEnvioArqPatroAnalNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryEnvioArqPatroAnalIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryEnvioArqPatroAnalNOME_1: TStringField
      FieldName = 'NOME_1'
      Size = 50
    end
    object qryEnvioArqPatroAnalIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
    object qryEnvioArqPatroAnalDESCRPROVDESC: TStringField
      FieldName = 'DESCRPROVDESC'
      Size = 130
    end
    object qryEnvioArqPatroAnalIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryEnvioArqPatroAnalNOME_2: TStringField
      FieldName = 'NOME_2'
      Size = 60
    end
    object qryEnvioArqPatroAnalNOMEMODULO: TStringField
      FieldName = 'NOMEMODULO'
      FixedChar = True
      Size = 50
    end
    object qryEnvioArqPatroAnalMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryEnvioArqPatroAnalINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryEnvioArqPatroAnalVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryEnvioArqPatroAnalQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
  end
  object rpEnvioArqPatroAnal: TppReport
    AutoStop = False
    DataPipeline = ppEnvioArqPatroAnal
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
    Left = 344
    Top = 232
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppEnvioArqPatroAnal'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34131
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 33073
        mmWidth = 197300
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 0
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
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
        mmLeft = 44186
        mmTop = 0
        mmWidth = 152400
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
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
        mmLeft = 44186
        mmTop = 7144
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
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
        mmLeft = 44186
        mmTop = 12435
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
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
        mmLeft = 44186
        mmTop = 16933
        mmWidth = 14552
        BandType = 0
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
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
        mmLeft = 44186
        mmTop = 21431
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label8'
        Caption = 'Espelho de Envio dos Arquivos para Patrocinadora - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 36777
        mmTop = 27252
        mmWidth = 125148
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppEnvioArqPatroAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEnvioArqPatroAnal'
        mmHeight = 3969
        mmLeft = 75406
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppEnvioArqPatroAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEnvioArqPatroAnal'
        mmHeight = 3969
        mmLeft = 108744
        mmTop = 0
        mmWidth = 35190
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppEnvioArqPatroAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEnvioArqPatroAnal'
        mmHeight = 3969
        mmLeft = 157427
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'NOME_2'
        DataPipeline = ppEnvioArqPatroAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEnvioArqPatroAnal'
        mmHeight = 3969
        mmLeft = 4763
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
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
        mmTop = 1323
        mmWidth = 197380
        BandType = 8
      end
      object ppLine15: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel20: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'InterfacePREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1323
        mmWidth = 197909
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
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape3'
        ParentHeight = True
        ParentWidth = True
        mmHeight = 6350
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Total Geral :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 1058
        mmWidth = 20902
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppEnvioArqPatroAnal
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEnvioArqPatroAnal'
        mmHeight = 3969
        mmLeft = 145257
        mmTop = 1058
        mmWidth = 24606
        BandType = 7
      end
      object ppDBCalc19: TppDBCalc
        UserName = 'DBCalc19'
        DataField = 'QUANTIDADE'
        DataPipeline = ppEnvioArqPatroAnal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEnvioArqPatroAnal'
        mmHeight = 3969
        mmLeft = 78581
        mmTop = 1058
        mmWidth = 17198
        BandType = 7
      end
      object ppLabel129: TppLabel
        UserName = 'Label129'
        Caption = 'registros no valor de R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 97367
        mmTop = 1058
        mmWidth = 37571
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppEnvioArqPatroAnal
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEnvioArqPatroAnal'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppLabel28: TppLabel
          UserName = 'Label1'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4763
          mmTop = 0
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = ppEnvioArqPatroAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroAnal'
          mmHeight = 3969
          mmLeft = 31485
          mmTop = 0
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppLabel43: TppLabel
          UserName = 'Label9'
          Caption = 'Mês de Referência :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 118798
          mmTop = 0
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object LbMesReferencia: TppLabel
          UserName = 'Label10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 151342
          mmTop = 0
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel127: TppLabel
          UserName = 'Label127'
          Caption = 'Total da Patrocinadora : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4763
          mmTop = 529
          mmWidth = 41804
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc17: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'QUANTIDADE'
          DataPipeline = ppEnvioArqPatroAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroAnal'
          mmHeight = 3969
          mmLeft = 78581
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel128: TppLabel
          UserName = 'Label128'
          Caption = 'registros no valor  total de R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 97367
          mmTop = 794
          mmWidth = 46567
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc18: TppDBCalc
          UserName = 'DBCalc18'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = ppEnvioArqPatroAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroAnal'
          mmHeight = 3969
          mmLeft = 145257
          mmTop = 794
          mmWidth = 24606
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'NOME_1'
      DataPipeline = ppEnvioArqPatroAnal
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEnvioArqPatroAnal'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLabel29: TppLabel
          UserName = 'Label2'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4763
          mmTop = 0
          mmWidth = 9790
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'NOME_1'
          DataPipeline = ppEnvioArqPatroAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroAnal'
          mmHeight = 3969
          mmLeft = 31485
          mmTop = 265
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel125: TppLabel
          UserName = 'Label125'
          Caption = 'Total do Plano :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4763
          mmTop = 529
          mmWidth = 26988
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'QUANTIDADE'
          DataPipeline = ppEnvioArqPatroAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroAnal'
          mmHeight = 3969
          mmLeft = 78581
          mmTop = 794
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
        end
        object ppLabel126: TppLabel
          UserName = 'Label126'
          Caption = 'registros no valor total de R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 97367
          mmTop = 794
          mmWidth = 45508
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = ppEnvioArqPatroAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroAnal'
          mmHeight = 3969
          mmLeft = 145521
          mmTop = 794
          mmWidth = 24606
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'NOMEMODULO'
      DataPipeline = ppEnvioArqPatroAnal
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEnvioArqPatroAnal'
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppLabel31: TppLabel
          UserName = 'Label301'
          Caption = 'Módulo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4763
          mmTop = 0
          mmWidth = 12700
          BandType = 3
          GroupNo = 2
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'NOMEMODULO'
          DataPipeline = ppEnvioArqPatroAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroAnal'
          mmHeight = 3969
          mmLeft = 31485
          mmTop = 265
          mmWidth = 25929
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = ppEnvioArqPatroAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroAnal'
          mmHeight = 3969
          mmLeft = 144727
          mmTop = 794
          mmWidth = 24606
          BandType = 5
          GroupNo = 2
        end
        object ppLabel17: TppLabel
          UserName = 'Label7'
          Caption = 'Total do Módulo :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4763
          mmTop = 529
          mmWidth = 30163
          BandType = 5
          GroupNo = 2
        end
        object ppLabel124: TppLabel
          UserName = 'Label124'
          Caption = 'registros no valor total de R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 97367
          mmTop = 529
          mmWidth = 45508
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'QUANTIDADE'
          DataPipeline = ppEnvioArqPatroAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroAnal'
          mmHeight = 3969
          mmLeft = 78581
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'DESCRPROVDESC'
      DataPipeline = ppEnvioArqPatroAnal
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppEnvioArqPatroAnal'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppLabel32: TppLabel
          UserName = 'Label302'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4763
          mmTop = 2646
          mmWidth = 13229
          BandType = 3
          GroupNo = 3
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'DESCRPROVDESC'
          DataPipeline = ppEnvioArqPatroAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroAnal'
          mmHeight = 3969
          mmLeft = 31485
          mmTop = 2646
          mmWidth = 32015
          BandType = 3
          GroupNo = 3
        end
        object ppLabel33: TppLabel
          UserName = 'Label3'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 80169
          mmTop = 8996
          mmWidth = 15610
          BandType = 3
          GroupNo = 3
        end
        object ppLabel34: TppLabel
          UserName = 'Label4'
          Caption = 'Nº Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 123561
          mmTop = 8996
          mmWidth = 20373
          BandType = 3
          GroupNo = 3
        end
        object ppLabel35: TppLabel
          UserName = 'Label5'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 160338
          mmTop = 8996
          mmWidth = 8996
          BandType = 3
          GroupNo = 3
        end
        object ppLabel30: TppLabel
          UserName = 'Label6'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4763
          mmTop = 8996
          mmWidth = 20373
          BandType = 3
          GroupNo = 3
        end
        object ppLine18: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 1323
          mmTop = 1323
          mmWidth = 194734
          BandType = 3
          GroupNo = 3
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'Total da Rubrica :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4763
          mmTop = 1852
          mmWidth = 30163
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = ppEnvioArqPatroAnal
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroAnal'
          mmHeight = 3969
          mmLeft = 144727
          mmTop = 2117
          mmWidth = 24606
          BandType = 5
          GroupNo = 3
        end
        object ppLabel123: TppLabel
          UserName = 'Label123'
          Caption = 'registros no valor total de R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 97367
          mmTop = 2117
          mmWidth = 45508
          BandType = 5
          GroupNo = 3
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'QUANTIDADE'
          DataPipeline = ppEnvioArqPatroAnal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppEnvioArqPatroAnal'
          mmHeight = 3969
          mmLeft = 78581
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 3
        end
      end
    end
  end
  object rpHistContribAnalit: TppReport
    AutoStop = False
    DataPipeline = ppHistContribAnalit
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 17780
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
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
    Left = 322
    Top = 120
    Version = '7.04'
    mmColumnWidth = 197379
    DataPipelineName = 'ppHistContribAnalit'
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel46: TppLabel
        UserName = 'ppLabel6'
        Caption = 'Espelho das Contribuições Recebidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 62442
        mmTop = 26723
        mmWidth = 77258
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 32279
        mmWidth = 197379
        BandType = 0
      end
      object ppDBImage3: TppDBImage
        UserName = 'ppDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 529
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'ppDBText1'
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
      object ppDBText27: TppDBText
        UserName = 'ppDBText2'
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
      object ppDBText28: TppDBText
        UserName = 'ppDBText3'
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
      object ppDBText29: TppDBText
        UserName = 'ppDBText4'
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
      object ppDBText30: TppDBText
        UserName = 'ppDBText5'
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
        mmLeft = 86254
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText31: TppDBText
        UserName = 'ppDBText6'
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
        mmWidth = 21960
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'ppDBText7'
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
      object ppLabel47: TppLabel
        UserName = 'ppLabel7'
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
      object ppDBText33: TppDBText
        UserName = 'ppDBText8'
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
      object rpHistContribAnaliticoLabel1: TppLabel
        UserName = 'rpHistContribAnaliticoLabel1'
        Caption = 'Referência :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 148432
        mmTop = 26458
        mmWidth = 24342
        BandType = 0
      end
      object rpHistContribAnaliticoDBText1: TppDBText
        UserName = 'rpHistContribAnaliticoDBText1'
        DataField = 'MESCOBRANCA'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 5027
        mmLeft = 173567
        mmTop = 26458
        mmWidth = 18256
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpHistContribAnaliticoDBText4: TppDBText
        UserName = 'rpHistContribAnaliticoDBText4'
        DataField = 'MATRICULA'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object rpHistContribAnaliticoDBText5: TppDBText
        UserName = 'rpHistContribAnaliticoDBText5'
        DataField = 'PARTICIPANTE'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 19579
        mmTop = 0
        mmWidth = 54769
        BandType = 4
      end
      object rpHistContribAnaliticoDBText6: TppDBText
        UserName = 'rpHistContribAnaliticoDBText6'
        DataField = 'CONTRIBUICAO'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 75671
        mmTop = 0
        mmWidth = 49477
        BandType = 4
      end
      object rpHistContribAnaliticoDBText7: TppDBText
        UserName = 'rpHistContribAnaliticoDBText7'
        DataField = 'VALORESPERADO'
        DataPipeline = ppHistContribAnalit
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 140759
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpHistContribAnaliticoDBText8: TppDBText
        UserName = 'rpHistContribAnaliticoDBText8'
        DataField = 'VALORRECEBIDO'
        DataPipeline = ppHistContribAnalit
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 157957
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpHistContribAnaliticoDBText10: TppDBText
        UserName = 'rpHistContribAnaliticoDBText10'
        DataField = 'DIFERENCA'
        DataPipeline = ppHistContribAnalit
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 175948
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'DBText51'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine21: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel48: TppLabel
        UserName = 'ppLabel8'
        AutoSize = False
        Caption = '     InterfacePrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 119856
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc5'
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
        mmWidth = 166952
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'Calc6'
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
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppHistContribAnalit
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppHistContribAnalit'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpHistContribAnaliticoGroup1: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppHistContribAnalit
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpHistContribAnaliticoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppHistContribAnalit'
      object rpHistContribAnaliticoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
        object rpHistContribAnaliticoLabel2: TppLabel
          UserName = 'rpHistContribAnaliticoLabel2'
          Caption = 'Patrocinadora : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 1323
          mmWidth = 26988
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel3: TppLabel
          UserName = 'rpHistContribAnaliticoLabel3'
          Caption = 'Plano Previdenciário :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 102923
          mmTop = 1323
          mmWidth = 37571
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoDBText2: TppDBText
          UserName = 'rpHistContribAnaliticoDBText2'
          DataField = 'PATROCINADORA'
          DataPipeline = ppHistContribAnalit
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppHistContribAnalit'
          mmHeight = 4233
          mmLeft = 31221
          mmTop = 1323
          mmWidth = 69321
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoDBText3: TppDBText
          UserName = 'rpHistContribAnaliticoDBText3'
          DataField = 'PLANO'
          DataPipeline = ppHistContribAnalit
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppHistContribAnalit'
          mmHeight = 4233
          mmLeft = 141288
          mmTop = 1323
          mmWidth = 55298
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLine1: TppLine
          UserName = 'rpHistContribAnaliticoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197379
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel4: TppLabel
          UserName = 'rpHistContribAnaliticoLabel4'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 7408
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel5: TppLabel
          UserName = 'rpHistContribAnaliticoLabel5'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 19579
          mmTop = 7408
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel6: TppLabel
          UserName = 'rpHistContribAnaliticoLabel6'
          Caption = 'Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 75671
          mmTop = 7408
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel7: TppLabel
          UserName = 'rpHistContribAnaliticoLabel7'
          Caption = 'Esperado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 141023
          mmTop = 7673
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel8: TppLabel
          UserName = 'rpHistContribAnaliticoLabel8'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 160073
          mmTop = 7408
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel9: TppLabel
          UserName = 'rpHistContribAnaliticoLabel9'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 177271
          mmTop = 7408
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLine2: TppLine
          UserName = 'rpHistContribAnaliticoLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 11377
          mmWidth = 197379
          BandType = 3
          GroupNo = 1
        end
        object ppLabel62: TppLabel
          UserName = 'Label62'
          Caption = 'Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 128059
          mmTop = 7408
          mmWidth = 5556
          BandType = 3
          GroupNo = 1
        end
      end
      object rpHistContribAnaliticoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rpHistContribAnaliticoDBCalc1: TppDBCalc
          UserName = 'rpHistContribAnaliticoDBCalc1'
          DataField = 'VALORESPERADO'
          DataPipeline = ppHistContribAnalit
          DisplayFormat = '#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpHistContribAnaliticoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppHistContribAnalit'
          mmHeight = 3704
          mmLeft = 136790
          mmTop = 265
          mmWidth = 19844
          BandType = 5
          GroupNo = 1
        end
        object rpHistContribAnaliticoDBCalc2: TppDBCalc
          UserName = 'rpHistContribAnaliticoDBCalc2'
          DataField = 'VALORRECEBIDO'
          DataPipeline = ppHistContribAnalit
          DisplayFormat = '#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpHistContribAnaliticoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppHistContribAnalit'
          mmHeight = 3704
          mmLeft = 158221
          mmTop = 265
          mmWidth = 15875
          BandType = 5
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel11: TppLabel
          UserName = 'rpHistContribAnaliticoLabel11'
          Caption = 'Total :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 111125
          mmTop = 265
          mmWidth = 8467
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'DIFERENCA'
          DataPipeline = ppHistContribAnalit
          DisplayFormat = '#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpHistContribAnaliticoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppHistContribAnalit'
          mmHeight = 3704
          mmLeft = 175948
          mmTop = 265
          mmWidth = 15875
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object ppHistContribAnalit: TppBDEPipeline
    DataSource = dsHistContribAnalit
    UserName = 'HistContribAnalit'
    Left = 349
    Top = 96
    object ppHistContribAnalitppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object ppHistContribAnalitppField2: TppField
      FieldAlias = 'PARTICIPANTE'
      FieldName = 'PARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppHistContribAnalitppField3: TppField
      FieldAlias = 'CONTRIBUICAO'
      FieldName = 'CONTRIBUICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppHistContribAnalitppField4: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppHistContribAnalitppField5: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object ppHistContribAnalitppField6: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 5
    end
    object ppHistContribAnalitppField7: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 6
    end
    object ppHistContribAnalitppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppHistContribAnalitppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORESPERADO'
      FieldName = 'VALORESPERADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppHistContribAnalitppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppHistContribAnalitppField11: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 13
      DisplayWidth = 13
      Position = 10
    end
  end
  object dsHistContribAnalit: TwwDataSource
    DataSet = qryHistContribAnalit
    Left = 287
    Top = 96
  end
  object qryHistContribAnalit: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT EL.MATRICULA, P.NOME AS PARTICIPANTE, C.NOME AS CONTRIBUI' +
        'CAO,'
      '       PAT.NOME AS PATROCINADORA, PL.NOME AS PLANO,'
      
        '       HST.MESREFERENCIA, HST.MESCOBRANCA, HST.VALORRECEBIDO, HS' +
        'T.VALORESPERADO,'
      '       (HST.VALORRECEBIDO - HST.VALORESPERADO) AS DIFERENCA,'
      '       DECODE(HST.VALORRECEBIDO, 0, '#39'Não Recebida'#39','
      
        '                                 DECODE(HST.SITRECEBIMENTO, 0, '#39 +
        'Não Enviadas'#39','
      
        '                                                            1, '#39 +
        'Não Recebidas'#39','
      
        '                                                            2, '#39 +
        'Recebidas OK'#39','
      
        '                                                            3, '#39 +
        'Divergente'#39','
      
        '                                                            4, '#39 +
        'Divergente'#39','
      
        '                                                            5, '#39 +
        'Divergente'#39','
      
        '                                                            6, '#39 +
        'Divergente'#39','
      
        '                                                            7, '#39 +
        'Renegociada'#39','
      
        '                                                            8, '#39 +
        'Canceladas'#39','
      
        '                                                            9, '#39 +
        'Divergente'#39','
      
        '                                                            '#39'Out' +
        'ros'#39') ) AS SITUACAO'
      
        'FROM   PESSOA P, PESSOA PAT, PLANPREV PL, CONTRIBUICAO C, ELEGPA' +
        'TRO EL, HSTCONTRIBPREV HST'
      'WHERE  HST.IDPESSJUR     = :IDPESSJUR'
      'AND    HST.IDPLANOPREV   = :IDPLANOPREV'
      'AND    HST.MESREFERENCIA = :MESREFERENCIA'
      'AND    EL.IDPESSJUR      = HST.IDPESSJUR'
      'AND    EL.IDPESSOA       = HST.IDPESSOA'
      'AND    PAT.IDPESSOA      = HST.IDPESSJUR'
      'AND    P.IDPESSOA        = HST.IDPESSOA'
      'AND    PL.IDPLANOPREV    = HST.IDPLANOPREV'
      'AND    C.IDCONTRIBUICAO  = HST.IDCONTRIBUICAO'
      'ORDER BY EL.MATRICULA ')
    ValidateWithMask = True
    Left = 226
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 4
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = 3
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
        Value = '2000/11'
      end>
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppHistContribAnalit
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
    Left = 329
    Top = 18
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppHistContribAnalit'
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel49: TppLabel
        UserName = 'ppLabel6'
        Caption = 'Histórico Mensal de Contribuições - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 53446
        mmTop = 26723
        mmWidth = 90223
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 32279
        mmWidth = 197300
        BandType = 0
      end
      object ppDBImage4: TppDBImage
        UserName = 'ppDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 529
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText34: TppDBText
        UserName = 'ppDBText1'
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
      object ppDBText35: TppDBText
        UserName = 'ppDBText2'
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
      object ppDBText36: TppDBText
        UserName = 'ppDBText3'
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
      object ppDBText37: TppDBText
        UserName = 'ppDBText4'
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
      object ppDBText38: TppDBText
        UserName = 'ppDBText5'
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
        mmLeft = 86254
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText39: TppDBText
        UserName = 'ppDBText6'
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
        mmWidth = 20902
        BandType = 0
      end
      object ppDBText40: TppDBText
        UserName = 'ppDBText7'
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
      object ppLabel50: TppLabel
        UserName = 'ppLabel7'
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
      object ppDBText41: TppDBText
        UserName = 'ppDBText8'
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
      object ppLabel51: TppLabel
        UserName = 'rpHistContribAnaliticoLabel1'
        Caption = 'Referência :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 152400
        mmTop = 26723
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'rpHistContribAnaliticoDBText1'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 5027
        mmLeft = 177536
        mmTop = 26723
        mmWidth = 18256
        BandType = 0
      end
    end
    object ppDetailBand11: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText43: TppDBText
        UserName = 'rpHistContribAnaliticoDBText4'
        DataField = 'MATRICULA'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText44: TppDBText
        UserName = 'rpHistContribAnaliticoDBText5'
        DataField = 'PARTICIPANTE'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 19579
        mmTop = 0
        mmWidth = 52652
        BandType = 4
      end
      object ppDBText45: TppDBText
        UserName = 'rpHistContribAnaliticoDBText6'
        DataField = 'CONTRIBUICAO'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 73290
        mmTop = 0
        mmWidth = 49477
        BandType = 4
      end
      object ppDBText46: TppDBText
        UserName = 'rpHistContribAnaliticoDBText7'
        DataField = 'VALORESPERADO'
        DataPipeline = ppHistContribAnalit
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 124884
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText47: TppDBText
        UserName = 'rpHistContribAnaliticoDBText8'
        DataField = 'VALORRECEBIDO'
        DataPipeline = ppHistContribAnalit
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpHistContribAnaliticoDBText9: TppDBText
        UserName = 'rpHistContribAnaliticoDBText9'
        DataField = 'SITUACAO'
        DataPipeline = ppHistContribAnalit
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 175684
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'rpHistContribAnaliticoDBText10'
        DataField = 'DIFERENCA'
        DataPipeline = ppHistContribAnalit
        DisplayFormat = '#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppHistContribAnalit'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine23: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel52: TppLabel
        UserName = 'ppLabel8'
        AutoSize = False
        Caption = 'AdmPREV'
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
      object ppSystemVariable7: TppSystemVariable
        UserName = 'Calc5'
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
      object ppSystemVariable8: TppSystemVariable
        UserName = 'Calc6'
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
    object ppGroup10: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppHistContribAnalit
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppHistContribAnalit'
      object ppGroupHeaderBand10: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppHistContribAnalit
      OutlineSettings.CreateNode = True
      UserName = 'rpHistContribAnaliticoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppHistContribAnalit'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
        object ppLabel53: TppLabel
          UserName = 'rpHistContribAnaliticoLabel2'
          Caption = 'Patrocinadora : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 1323
          mmWidth = 26988
          BandType = 3
          GroupNo = 1
        end
        object ppLabel54: TppLabel
          UserName = 'rpHistContribAnaliticoLabel3'
          Caption = 'Plano Previdenciário :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 102923
          mmTop = 1323
          mmWidth = 37571
          BandType = 3
          GroupNo = 1
        end
        object ppDBText49: TppDBText
          UserName = 'rpHistContribAnaliticoDBText2'
          DataField = 'PATROCINADORA'
          DataPipeline = ppHistContribAnalit
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppHistContribAnalit'
          mmHeight = 4233
          mmLeft = 31221
          mmTop = 1323
          mmWidth = 69321
          BandType = 3
          GroupNo = 1
        end
        object ppDBText50: TppDBText
          UserName = 'rpHistContribAnaliticoDBText3'
          DataField = 'PLANO'
          DataPipeline = ppHistContribAnalit
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppHistContribAnalit'
          mmHeight = 4233
          mmLeft = 141288
          mmTop = 1323
          mmWidth = 55298
          BandType = 3
          GroupNo = 1
        end
        object ppLine24: TppLine
          UserName = 'rpHistContribAnaliticoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel55: TppLabel
          UserName = 'rpHistContribAnaliticoLabel4'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 529
          mmTop = 7408
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object ppLabel56: TppLabel
          UserName = 'rpHistContribAnaliticoLabel5'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 19579
          mmTop = 7408
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppLabel57: TppLabel
          UserName = 'rpHistContribAnaliticoLabel6'
          Caption = 'Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 73290
          mmTop = 7408
          mmWidth = 18521
          BandType = 3
          GroupNo = 1
        end
        object ppLabel58: TppLabel
          UserName = 'rpHistContribAnaliticoLabel7'
          Caption = 'Esperado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 127000
          mmTop = 7408
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object ppLabel59: TppLabel
          UserName = 'rpHistContribAnaliticoLabel8'
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 7408
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
        object ppLabel60: TppLabel
          UserName = 'rpHistContribAnaliticoLabel9'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 160338
          mmTop = 7408
          mmWidth = 13758
          BandType = 3
          GroupNo = 1
        end
        object rpHistContribAnaliticoLabel10: TppLabel
          UserName = 'rpHistContribAnaliticoLabel10'
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 175684
          mmTop = 7408
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLine25: TppLine
          UserName = 'rpHistContribAnaliticoLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 11377
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBCalc6: TppDBCalc
          UserName = 'rpHistContribAnaliticoDBCalc1'
          DataField = 'VALORESPERADO'
          DataPipeline = ppHistContribAnalit
          DisplayFormat = '#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppHistContribAnalit'
          mmHeight = 3704
          mmLeft = 120915
          mmTop = 529
          mmWidth = 19844
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'rpHistContribAnaliticoDBCalc2'
          DataField = 'VALORRECEBIDO'
          DataPipeline = ppHistContribAnalit
          DisplayFormat = '#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup11
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppHistContribAnalit'
          mmHeight = 3704
          mmLeft = 142082
          mmTop = 529
          mmWidth = 15875
          BandType = 5
          GroupNo = 1
        end
        object ppLabel61: TppLabel
          UserName = 'rpHistContribAnaliticoLabel11'
          Caption = 'Total :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 110861
          mmTop = 529
          mmWidth = 8731
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryRubricasReceb: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT 1 AS CONT, H.MESCOBRANCA, H.MES MESREFERENCIA ,H.VALORPRO' +
        'VENTO VALORRECEBIDO, H.CODPROVDESC,'
      'PROVDESC.DESCRICAO, H.IDPESSOA , H.IDPESSJUR,  '
      'DECODE(H.FLGCOMPOESALPART,0,0,1,H.VALORPROVENTO) SALARIO,'
      'EL.MATRICULA , P.NOME PARTICIPANTE , PATRO.NOME PATRO'
      'FROM HISTRUBSAL H , PESSOA P , PESSOA PATRO,'
      'ELEGPATRO EL,  PROVDESC '
      'WHERE H.MES = '#39'2002/03'#39' '
      'AND H.MESCOBRANCA = '#39'2002/03'#39
      'AND H.IDPESSJUR = 99'
      'AND H.IDMODULO = 32'
      'AND P.IDPESSOA = H.IDPESSOA '
      'AND PATRO.IDPESSOA = H.IDPESSJUR'
      'AND EL.IDPESSJUR = H.IDPESSJUR'
      'AND EL.IDPESSOA = H.IDPESSOA'
      'AND PROVDESC.IDPROVENTO = H.IDRUBRICA'
      'AND ROWNUM <= 300'
      'ORDER BY EL.MATRICULA, '
      'H.FLGCOMPOESALPART desc, PROVDESC.DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 266
    Top = 328
  end
  object dsRubricasReceb: TwwDataSource
    DataSet = qryRubricasReceb
    Left = 303
    Top = 328
  end
  object ppRubricasReceb: TppBDEPipeline
    DataSource = dsRubricasReceb
    UserName = 'RubricasReceb'
    Left = 347
    Top = 328
  end
  object rpRubricasReceb: TppReport
    AutoStop = False
    DataPipeline = ppRubricasReceb
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 17780
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.DatabaseSettings.DataPipeline = ppRubricasReceb
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
    Left = 391
    Top = 324
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppRubricasReceb'
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel74: TppLabel
        UserName = 'ppLabel6'
        Caption = 'Espelho das Rubricas Recebidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 67204
        mmTop = 26723
        mmWidth = 66940
        BandType = 0
      end
      object ppLine26: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 32279
        mmWidth = 197300
        BandType = 0
      end
      object ppDBImage5: TppDBImage
        UserName = 'ppDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 529
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText52: TppDBText
        UserName = 'ppDBText1'
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
      object ppDBText53: TppDBText
        UserName = 'ppDBText2'
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
      object ppDBText54: TppDBText
        UserName = 'ppDBText3'
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
      object ppDBText55: TppDBText
        UserName = 'ppDBText4'
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
      object ppDBText56: TppDBText
        UserName = 'ppDBText5'
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
        mmLeft = 86254
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText57: TppDBText
        UserName = 'ppDBText6'
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
        mmWidth = 21960
        BandType = 0
      end
      object ppDBText58: TppDBText
        UserName = 'ppDBText7'
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
      object ppLabel75: TppLabel
        UserName = 'ppLabel7'
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
      object ppDBText59: TppDBText
        UserName = 'ppDBText8'
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
      object ppLabel76: TppLabel
        UserName = 'rpHistContribAnaliticoLabel1'
        Caption = 'Referência :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 149490
        mmTop = 26194
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText60: TppDBText
        UserName = 'rpHistContribAnaliticoDBText1'
        DataField = 'MESCOBRANCA'
        DataPipeline = ppRubricasReceb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppRubricasReceb'
        mmHeight = 5027
        mmLeft = 174625
        mmTop = 26194
        mmWidth = 18256
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText63: TppDBText
        UserName = 'rpHistContribAnaliticoDBText6'
        DataField = 'DESCRICAO'
        DataPipeline = ppRubricasReceb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRubricasReceb'
        mmHeight = 3704
        mmLeft = 88371
        mmTop = 0
        mmWidth = 73819
        BandType = 4
      end
      object ppDBText65: TppDBText
        UserName = 'rpHistContribAnaliticoDBText8'
        DataField = 'VALORRECEBIDO'
        DataPipeline = ppRubricasReceb
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRubricasReceb'
        mmHeight = 3704
        mmLeft = 177536
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText67: TppDBText
        UserName = 'DBText51'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppRubricasReceb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRubricasReceb'
        mmHeight = 3704
        mmLeft = 163513
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText64: TppDBText
        UserName = 'DBText64'
        DataField = 'CODPROVDESC'
        DataPipeline = ppRubricasReceb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRubricasReceb'
        mmHeight = 3704
        mmLeft = 75142
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine27: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel77: TppLabel
        UserName = 'ppLabel8'
        AutoSize = False
        Caption = '     InterfacePrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 155311
        BandType = 8
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'Calc5'
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
        mmWidth = 166688
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'Calc6'
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
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup13: TppGroup
      BreakName = 'PATRO'
      DataPipeline = ppRubricasReceb
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRubricasReceb'
      object ppGroupHeaderBand13: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLabel78: TppLabel
          UserName = 'rpHistContribAnaliticoLabel2'
          Caption = 'Patrocinadora : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 1588
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppDBText68: TppDBText
          UserName = 'rpHistContribAnaliticoDBText2'
          DataField = 'PATRO'
          DataPipeline = ppRubricasReceb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppRubricasReceb'
          mmHeight = 4233
          mmLeft = 31221
          mmTop = 1588
          mmWidth = 69321
          BandType = 3
          GroupNo = 0
        end
        object ppLine28: TppLine
          UserName = 'rpHistContribAnaliticoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 6615
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand13: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel137: TppLabel
          UserName = 'Label137'
          Caption = 'Total da Patrocinadora :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 529
          mmWidth = 41010
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc26: TppDBCalc
          UserName = 'DBCalc26'
          DataField = 'CONT'
          DataPipeline = ppRubricasReceb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppRubricasReceb'
          mmHeight = 4233
          mmLeft = 92340
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLabel138: TppLabel
          UserName = 'Label138'
          Caption = 'rubricas recebidas no valor total de R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 110067
          mmTop = 529
          mmWidth = 65617
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc27: TppDBCalc
          UserName = 'DBCalc27'
          DataField = 'VALORRECEBIDO'
          DataPipeline = ppRubricasReceb
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup13
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppRubricasReceb'
          mmHeight = 4233
          mmLeft = 176213
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup14: TppGroup
      BreakName = 'MATRICULA'
      DataPipeline = ppRubricasReceb
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group14'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRubricasReceb'
      object ppGroupHeaderBand14: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppLine29: TppLine
          UserName = 'rpHistContribAnaliticoLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel82: TppLabel
          UserName = 'rpHistContribAnaliticoLabel6'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 75142
          mmTop = 1058
          mmWidth = 10319
          BandType = 3
          GroupNo = 1
        end
        object ppLabel86: TppLabel
          UserName = 'Label62'
          Caption = 'Mês'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 163513
          mmTop = 1058
          mmWidth = 5556
          BandType = 3
          GroupNo = 1
        end
        object ppLabel84: TppLabel
          UserName = 'rpHistContribAnaliticoLabel8'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 186532
          mmTop = 1058
          mmWidth = 6879
          BandType = 3
          GroupNo = 1
        end
        object ppDBText61: TppDBText
          UserName = 'rpHistContribAnaliticoDBText4'
          DataField = 'MATRICULA'
          DataPipeline = ppRubricasReceb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppRubricasReceb'
          mmHeight = 3704
          mmLeft = 265
          mmTop = 1058
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppDBText62: TppDBText
          UserName = 'rpHistContribAnaliticoDBText5'
          DataField = 'PARTICIPANTE'
          DataPipeline = ppRubricasReceb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppRubricasReceb'
          mmHeight = 3704
          mmLeft = 19050
          mmTop = 1058
          mmWidth = 54769
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand14: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object rpLayOutReceb: TppReport
    AutoStop = False
    DataPipeline = ppLayOutReceb
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
    Left = 179
    Top = 442
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppLayOutReceb'
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel79: TppLabel
        UserName = 'ppLabel10'
        Caption = 'Resumo de Recebimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 74348
        mmTop = 8731
        mmWidth = 50800
        BandType = 0
      end
      object ppLine30: TppLine
        UserName = 'ppLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel80: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel11'
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
    object ppDetailBand13: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine32: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel81: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel12'
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
      object ppSystemVariable11: TppSystemVariable
        UserName = 'Calc7'
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
      object ppSystemVariable12: TppSystemVariable
        UserName = 'Calc8'
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
  object qryLayOutReceb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.RAZAOSOCIAL FROM'
      'PESSOA P, '
      'EMPRESAPROP E '
      'WHERE  P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 25
    Top = 448
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsLayOutReceb: TwwDataSource
    DataSet = qryLayOutReceb
    Left = 81
    Top = 448
  end
  object ppLayOutReceb: TppBDEPipeline
    DataSource = dsLayOutReceb
    UserName = 'ResRecebimento1'
    Left = 126
    Top = 433
  end
  object qryEstatisticaSPC: TwwQuery
    BeforeOpen = QryGeralBeforeOpen
    AfterClose = QryGeralAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  E.ANOMES, E.CODARVORE,'
      ''
      '  SUM(E.TOTANTERIOR) AS TOTANTERIOR,'
      '  SUM(E.TOTCONCEDIDO) AS TOTCONCEDIDO,'
      '  SUM(E.TOTCANCELADO) AS TOTCANCELADO,'
      ''
      
        '  ( SUM(E.TOTANTERIOR) + SUM(E.TOTCONCEDIDO) - SUM(E.TOTCANCELAD' +
        'O) ) AS TOTATUAL'
      ''
      'FROM'
      '  ESTBENEFSPC E'
      ''
      'WHERE'
      '      E.ANOMES      = :ANOMES'
      '  AND E.IDFUNDACAO  = :IDFUNDACAO'
      ''
      'GROUP BY'
      '  E.ANOMES,  E.CODARVORE'
      ''
      'ORDER BY'
      '  E.CODARVORE')
    ValidateWithMask = True
    Left = 656
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptUnknown
        Value = '2004/01'
      end
      item
        DataType = ftString
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
        Value = '1'
      end>
  end
  object dsEstatisticaSPC: TwwDataSource
    DataSet = qryEstatisticaSPC
    Left = 568
    Top = 224
  end
  object ppEstatisticaSPC: TppBDEPipeline
    DataSource = dsEstatisticaSPC
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'plGeral1'
    Left = 568
    Top = 208
  end
  object rpEstatisticaSPC: TppReport
    AutoStop = False
    DataPipeline = ppEstatisticaSPC
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
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 568
    Top = 192
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppEstatisticaSPC'
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 52917
      mmPrintPosition = 0
      object ppDBText66: TppDBText
        UserName = 'rpTotalizadorDBText1'
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
        mmWidth = 152400
        BandType = 0
      end
      object ppDBText69: TppDBText
        UserName = 'rpTotalizadorDBText2'
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
      object ppDBText70: TppDBText
        UserName = 'rpTotalizadorDBText3'
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
      object ppDBImage6: TppDBImage
        UserName = 'rpTotalizadorDBImage1'
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
      object ppDBText71: TppDBText
        UserName = 'rpTotalizadorDBText4'
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
      object ppDBText72: TppDBText
        UserName = 'rpTotalizadorDBText5'
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
      object ppLabel83: TppLabel
        UserName = 'rpTotalizadorLabel1'
        AutoSize = False
        Caption = 
          'Relatórios de Estatísticas para a Secretaria de Previdência Comp' +
          'lementar (SPC)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 1323
        mmTop = 26458
        mmWidth = 195580
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'Label87'
        Caption = 'Referência : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 88106
        mmTop = 32015
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText73: TppDBText
        UserName = 'DBText73'
        DataField = 'ANOMES'
        DataPipeline = ppEstatisticaSPC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppEstatisticaSPC'
        mmHeight = 4233
        mmLeft = 109802
        mmTop = 32015
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 3440
        mmTop = 46831
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label73'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 22225
        mmTop = 46831
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'Label1001'
        Caption = 'Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 106098
        mmTop = 46831
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'Label89'
        Caption = 'Concedidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 131234
        mmTop = 46831
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'Label90'
        Caption = 'Cancelados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 156104
        mmTop = 46831
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'Label91'
        Caption = 'Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 184415
        mmTop = 46831
        mmWidth = 6879
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'Line35'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 51329
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetEstatisticaSPC: TppDetailBand
      BeforePrint = ppDetEstatisticaSPCBeforePrint
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText76: TppDBText
        UserName = 'DBText76'
        DataField = 'CODARVORE'
        DataPipeline = ppEstatisticaSPC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppEstatisticaSPC'
        mmHeight = 3175
        mmLeft = 265
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object lblDescEstSPC: TppLabel
        UserName = 'lblDescEstSPC'
        Caption = 'lblDescEstSPC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 22490
        mmTop = 794
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'DBText77'
        DataField = 'TOTANTERIOR'
        DataPipeline = ppEstatisticaSPC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatisticaSPC'
        mmHeight = 3175
        mmLeft = 103188
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText78: TppDBText
        UserName = 'DBText78'
        DataField = 'TOTCONCEDIDO'
        DataPipeline = ppEstatisticaSPC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatisticaSPC'
        mmHeight = 3175
        mmLeft = 130175
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText79: TppDBText
        UserName = 'DBText79'
        DataField = 'TOTCANCELADO'
        DataPipeline = ppEstatisticaSPC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatisticaSPC'
        mmHeight = 3175
        mmLeft = 155840
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText80: TppDBText
        UserName = 'DBText80'
        DataField = 'TOTATUAL'
        DataPipeline = ppEstatisticaSPC
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppEstatisticaSPC'
        mmHeight = 3175
        mmLeft = 177800
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppSystemVariable13: TppSystemVariable
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
        mmWidth = 195527
        BandType = 8
      end
      object ppLabel85: TppLabel
        UserName = 'ppLabel25'
        AutoSize = False
        Caption = 'InterfacePREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 195527
        BandType = 8
      end
      object ppLine33: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable14: TppSystemVariable
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
        mmLeft = 168805
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand3: TppSummaryBand
      NewPage = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
    end
  end
  object qryInterfCadSintetico: TwwQuery
    BeforeOpen = QryGeralBeforeOpen
    AfterClose = QryGeralAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(1) AS TOTAL,'
      
        '       SUBSTR(MESCOBRANCA,5,2)||'#39'/'#39'||SUBSTR(MESCOBRANCA,1,4) AS ' +
        'MESREFERENCIA,'
      '       DECODE(GRUPO, '#39'C'#39', '#39'Dados Cadastrais'#39','
      '                          '#39'E'#39', '#39'Endereço'#39','
      '                          '#39'D'#39', '#39'Dependentes'#39','
      '                          '#39'O'#39', '#39'Documentos'#39','
      '                          '#39'V'#39', '#39'Evolução Funcional'#39','
      '                          '#39'N'#39', '#39'Eventos'#39','
      '                          '#39'L'#39', '#39'Lotações'#39','
      '                          '#39'T'#39', '#39'Contatos'#39','
      '                          '#39'R'#39', '#39'Rubricas'#39','
      '                          '#39'F'#39', '#39'Filiais'#39','
      '                          '#39'A'#39', '#39'Agências'#39' ) AS DESCGRUPO,'
      '       CODERRO,'
      
        '       DECODE(FLGPROCESSADO, 0, '#39'Não'#39', '#39'Sim'#39') AS DESCPROCESSADO,' +
        ' '
      '       DECODE(CODERRO, 0,'#39'Participante não encontrado'#39','
      '                    1,'#39'Agência Bancária não encontrada'#39','
      '                    2,'#39'Banco não encontrado'#39','
      '                    3,'#39'Nome do Participante alterado'#39','
      '                    4,'#39'Data de Admissão alterada'#39','
      '                    5,'#39'Data de Nascimento alterada'#39','
      '                    6,'#39'CPF alterado'#39','
      '                    7,'#39'Número de Dependentes para IR alterado'#39','
      '                    8,'#39'Cargo não encontrado'#39','
      '                    9,'#39'Cargo alterado'#39','
      '                    10,'#39'Nivel não encontrado'#39','
      '                    11,'#39'Nivel alterado'#39','
      '                    12,'#39'Sexo alterado'#39','
      '                    13,'#39'Conta Corrente alterada'#39','
      '                    14,'#39'Erro ao alterar conta corrente'#39','
      '                    15,'#39'Erro ao alterar nome'#39','
      '                    16,'#39'Erro ao alterar CPF'#39','
      '                    17,'#39'Erro ao alterar sexo'#39','
      '                    18,'#39'Erro ao alterar data de nascimento'#39','
      '                    19,'#39'Erro ao altarer data de admissão'#39','
      '                    20,'#39'Erro ao alterar n. dependentes IRRF'#39','
      '                    21,'#39'Erro ao alterar cargo'#39','
      '                    22,'#39'Erro ao alterar nivel'#39','
      '                    23,'#39'Participante Assistido '#39','
      '                    24,'#39'Participante Mantido'#39','
      '                    25,'#39'Endereço Inserido'#39','
      '                    26,'#39'Logradouro alterado'#39','
      '                    27,'#39'Bairro alterado'#39','
      '                    28,'#39'CEP alterado'#39','
      '                    29,'#39'UF do Endereço alterado'#39','
      '                    30,'#39'Número do Telefone alterado'#39','
      '                    31,'#39'Cidade do Endereço alterada'#39','
      '                    32,'#39'Telefone Inserido'#39','
      
        '                    33,'#39'Número da Carteira de Identidade alterad' +
        'o'#39','
      '                    34,'#39'UF da Carteira de Identidade alterada'#39','
      
        '                    35,'#39'Data de Expedição da Carteira de Identid' +
        'ade alterada'#39','
      '                    36,'#39'Nome do Pai alterado'#39','
      '                    37,'#39'Nome da Mãe alterado'#39','
      
        '                    38,'#39'Código do Municipio de Naturalidade alte' +
        'rado'#39','
      '                    39, '#39'Matrícula do Conjuge alterada '#39','
      '                    40, '#39'Tempo de Serviço Total alterado '#39','
      
        '                    41, '#39'Tempo de Serviço Não Creditado  alterad' +
        'o '#39','
      '                    42, '#39'Documento de Identidade Inserido'#39','
      
        '                    43, '#39'Dependente Inserido (não existia no cad' +
        'astro)'#39','
      '                    44, '#39'Estado Civil  alterado '#39','
      
        '                    45, '#39'Indicador para Salário de IR  alterado ' +
        #39','
      
        '                    46, '#39'Indicador para Salário Família  alterad' +
        'o '#39','
      '                    47, '#39'Indicador de Invalidez  alterado '#39','
      
        '                    48, '#39'Data de Início do Dependente  alterada'#39 +
        ','
      '                    49, '#39'Grau de Dependência  alterado '#39','
      
        '                    50, '#39'Indicador de Cargo de Diretor  alterado' +
        ' '#39','
      '                    51, '#39'Tempo de Serviço Anterior alterado'#39','
      
        '                    52, '#39'Tempo de Serviço Publico Anterior alter' +
        'ado'#39','
      
        '                    53, '#39'Tempo de Serviço Privado Anterior alter' +
        'ado'#39','
      
        '                    54, '#39'Tempo de Serviço Anterior Real alterado' +
        #39','
      '                    55, '#39'Filial do Empregado alterada'#39','
      '                    56, '#39'Filial não encontrada'#39','
      '                    57, '#39'Situação do Empregado alterada'#39','
      
        '                    58, '#39'Vinculação Funcional do Empregado alter' +
        'ada'#39','
      '                    59, '#39'Indicador de Diretor alterado'#39','
      '                    60, '#39'Função Não Encontrada'#39','
      '                    61, '#39'Função alterada'#39','
      '                    62, '#39'Data de Demissão alterada'#39','
      '                    63, '#39'Data de Readmissão alterada'#39','
      '                    64, '#39'Data do Falecimento alterada'#39','
      '                    65, '#39'Cidade do Endereço não encontrada '#39','
      '                    66, '#39'Agência Bancária em Branco'#39','
      '                    67, '#39'UF não encontrada na tabela de Estado'#39','
      '                    68, '#39'Erro ao inserir novo dependente'#39','
      '                    69, '#39'Novo Funcionario Cadastrado'#39','
      '                    70, '#39'Centro de Custo do Empregado Alterado'#39','
      '                    71, '#39'Salário Total na Empresa Alterado'#39','
      '                    72, '#39'Matricula Alterada'#39','
      '                    73, '#39'Email do Contato Alterado'#39','
      '                    74, '#39'Cargo do Contato Alterado'#39','
      '                    75, '#39'Setor do Contato Alterado'#39','
      '                    76, '#39'Data Nascimento do Contato Alterado'#39','
      '                    77, '#39'Obs do Contato Alterado'#39','
      
        '                    78, '#39'Novo cargo inserido na evolução funcion' +
        'al'#39','
      
        '                    79, '#39'Nova função inserida na evolução funcio' +
        'nal'#39','
      '                    80, '#39'Inserido Adicional compensatório'#39','
      
        '                    81, '#39'Inserido adicional por tempo de serviço' +
        #39','
      '                    82, '#39'Inserido adicional noturno'#39','
      
        '                    83, '#39'Inserido percentual por periculosidade'#39 +
        ','
      '                    84, '#39'Inserido percentual de insalubridade'#39','
      '                    85, '#39'Data final do cargo atual alterada'#39','
      '                    86, '#39'Data final da função atual alterada'#39','
      
        '                    87, '#39'Data final do percentual por insalubrid' +
        'ade alterado'#39','
      '                    88, '#39'Percentual de insalubridade alterado'#39','
      
        '                    89, '#39'Percentual por periculosidade alterado'#39 +
        ','
      
        '                    90, '#39'Data final do adicional noturno alterad' +
        'a'#39','
      
        '                    91, '#39'Percentual do aicional noturno alterado' +
        #39','
      
        '                    92, '#39'Inserido pecentual de adicional noturno' +
        #39','
      
        '                    93, '#39'Data final d adicional por tempo de ser' +
        'viço alterada'#39','
      
        '                    94, '#39'Percentual por tempo de serviço alterad' +
        'o'#39','
      
        '                    95, '#39'Data final do adicional compensatório a' +
        'lterada'#39','
      
        '                    96, '#39'Percental de adicional compensatório al' +
        'terado'#39','
      '                    97, '#39'Situação na patrocinadora alterada'#39' ,'
      
        '                    98, '#39'Valor da opção 1 da patrocinadora alter' +
        'ado'#39' ,'
      
        '                    99, '#39'Valor da opção 2 da patrocinadora alter' +
        'ado'#39' ,'
      
        '                    100, '#39'Valor da opção 3 da patrocinadora alte' +
        'rado'#39' ,'
      
        '                    101, '#39'Valor da opção 4 da patrocinadora alte' +
        'rado'#39' ,'
      
        '                    102, '#39'Valor da opção 5 da patrocinadora alte' +
        'rado'#39' ,'
      
        '                    103, '#39'Valor da opção 6 da patrocinadora alte' +
        'rado'#39' ,'
      '                    104, '#39'Evento previdenciário inserido'#39','
      '                    105, '#39'Descrição da rubrica alterada'#39','
      
        '                    106, '#39'Indicador (Provento/Desconto) da rubri' +
        'ca alterado'#39','
      
        '                    107, '#39'Indicador (Atraso/Devolução/Normal) da' +
        ' rubrica alterado'#39','
      '                    108, '#39'Rubrica inserida'#39','
      '                    109, '#39'Nome da filial alterado'#39','
      
        '                    110, '#39'Tipo da filial (Capital/Interior) alte' +
        'rado'#39','
      '                    111, '#39'CGC da filial alterado'#39','
      '                    112, '#39'Sigla da filial alterada'#39','
      '                    113, '#39'Filial inserida'#39','
      '                    114, '#39'Noma da agência alterado'#39','
      '                    115, '#39'Agência inserida'#39','
      '                    116, '#39'Elegível inserido'#39','
      '                    117, '#39'Erro ao inserir elegível'#39
      '                    ) DESCERRO'
      'FROM  TABCRITICASCCP'
      'WHERE MESCOBRANCA = :MESCOBRANCA'
      'AND   IDPESSJUR   = :IDPESSJUR'
      'AND   GRUPO       IN (:GRUPO)'
      'GROUP BY MESCOBRANCA, GRUPO, CODERRO, FLGPROCESSADO'
      'ORDER BY GRUPO, DESCERRO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 649
    Top = 380
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
        Value = '200110'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '91008'
      end
      item
        DataType = ftString
        Name = 'GRUPO'
        ParamType = ptUnknown
        Value = 'C'
      end>
  end
  object dsInterfCadSintetico: TwwDataSource
    DataSet = qryInterfCadSintetico
    Left = 649
    Top = 423
  end
  object ppInterfCadSintetico: TppBDEPipeline
    DataSource = dsInterfCadSintetico
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'InterfCadSintetico'
    Left = 649
    Top = 353
  end
  object rpInterfCadSintetico: TppReport
    AutoStop = False
    DataPipeline = ppInterfCadSintetico
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
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 652
    Top = 326
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppInterfCadSintetico'
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37042
      mmPrintPosition = 0
      object ppDBText86: TppDBText
        UserName = 'rpTotalizadorDBText1'
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
        mmWidth = 152400
        BandType = 0
      end
      object ppDBText87: TppDBText
        UserName = 'rpTotalizadorDBText2'
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
      object ppDBText88: TppDBText
        UserName = 'rpTotalizadorDBText3'
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
      object ppDBImage7: TppDBImage
        UserName = 'rpTotalizadorDBImage1'
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
      object ppDBText89: TppDBText
        UserName = 'rpTotalizadorDBText4'
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
      object ppDBText90: TppDBText
        UserName = 'rpTotalizadorDBText5'
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
      object ppLabel104: TppLabel
        UserName = 'rpTotalizadorLabel1'
        AutoSize = False
        Caption = 'Relatório de Críticas do Interface Cadastral - Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 1323
        mmTop = 26458
        mmWidth = 195580
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'Label87'
        Caption = 'Referência : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 88106
        mmTop = 32015
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText91: TppDBText
        UserName = 'DBText73'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppInterfCadSintetico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppInterfCadSintetico'
        mmHeight = 4233
        mmLeft = 109802
        mmTop = 32015
        mmWidth = 17198
        BandType = 0
      end
    end
    object pDetBandInterfCadSintetico: TppDetailBand
      BeforePrint = pDetBandInterfCadSinteticoBeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShapeInterfCadSintetico: TppShape
        UserName = 'ShapeInterfCadSintetico'
        Brush.Color = clSilver
        ParentHeight = True
        Pen.Color = clWindow
        mmHeight = 4498
        mmLeft = 19315
        mmTop = 0
        mmWidth = 178065
        BandType = 4
      end
      object ppDBText92: TppDBText
        UserName = 'DBText92'
        AutoSize = True
        DataField = 'DESCERRO'
        DataPipeline = ppInterfCadSintetico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppInterfCadSintetico'
        mmHeight = 3175
        mmLeft = 35719
        mmTop = 794
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText93: TppDBText
        UserName = 'DBText93'
        DataField = 'TOTAL'
        DataPipeline = ppInterfCadSintetico
        DisplayFormat = '###,##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppInterfCadSintetico'
        mmHeight = 3175
        mmLeft = 178330
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText108: TppDBText
        UserName = 'DBText108'
        DataField = 'CODERRO'
        DataPipeline = ppInterfCadSintetico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppInterfCadSintetico'
        mmHeight = 3175
        mmLeft = 21167
        mmTop = 794
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText110: TppDBText
        UserName = 'DBText110'
        DataField = 'DESCPROCESSADO'
        DataPipeline = ppInterfCadSintetico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppInterfCadSintetico'
        mmHeight = 3175
        mmLeft = 157163
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6561
      mmPrintPosition = 0
      object ppSystemVariable15: TppSystemVariable
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
        mmTop = 1588
        mmWidth = 195527
        BandType = 8
      end
      object ppLabel107: TppLabel
        UserName = 'ppLabel25'
        AutoSize = False
        Caption = 'InterfacePREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1588
        mmWidth = 195527
        BandType = 8
      end
      object ppLine34: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable16: TppSystemVariable
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
        mmLeft = 168805
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand5: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'Shape5'
        Brush.Color = clSilver
        ParentHeight = True
        ParentWidth = True
        mmHeight = 5556
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel109: TppLabel
        UserName = 'Label109'
        Caption = 'Total Geral de Críticas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 529
        mmWidth = 37306
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        AutoSize = True
        DataField = 'TOTAL'
        DataPipeline = ppInterfCadSintetico
        DisplayFormat = '###,##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppInterfCadSintetico'
        mmHeight = 4233
        mmLeft = 170657
        mmTop = 529
        mmWidth = 25400
        BandType = 7
      end
    end
    object ppGroup17: TppGroup
      BreakName = 'DESCGRUPO'
      DataPipeline = ppInterfCadSintetico
      OutlineSettings.CreateNode = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppInterfCadSintetico'
      object ppGroupHeaderBand17: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 12171
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText97: TppDBText
          UserName = 'DBText97'
          AutoSize = True
          DataField = 'DESCGRUPO'
          DataPipeline = ppInterfCadSintetico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppInterfCadSintetico'
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 1323
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppLabel116: TppLabel
          UserName = 'Label116'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 21167
          mmTop = 7673
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel117: TppLabel
          UserName = 'Label117'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 35719
          mmTop = 7673
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel118: TppLabel
          UserName = 'Label118'
          Caption = 'Quant.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 186532
          mmTop = 7673
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppLabel121: TppLabel
          UserName = 'Label121'
          Caption = 'Atualizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 157163
          mmTop = 7673
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand17: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel106: TppLabel
          UserName = 'Label106'
          Caption = 'Total de Críticas do Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 44450
          mmTop = 1323
          mmWidth = 44186
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'TOTAL'
          DataPipeline = ppInterfCadSintetico
          DisplayFormat = '###,##'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup17
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppInterfCadSintetico'
          mmHeight = 3969
          mmLeft = 178859
          mmTop = 1323
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryInterfCadAnalitico: TwwQuery
    BeforeOpen = QryGeralBeforeOpen
    AfterClose = QryGeralAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUBSTR(MESCOBRANCA,5,2)||'#39'/'#39'||SUBSTR(MESCOBRANCA,1,4) AS ' +
        'MESREFERENCIA,'
      '       DECODE(GRUPO, '#39'C'#39', '#39'Dados Cadastrais'#39','
      '                          '#39'E'#39', '#39'Endereço'#39','
      '                          '#39'D'#39', '#39'Dependentes'#39','
      '                          '#39'O'#39', '#39'Documentos'#39','
      '                          '#39'V'#39', '#39'Evolução Funcional'#39','
      '                          '#39'N'#39', '#39'Eventos'#39','
      '                          '#39'L'#39', '#39'Lotações'#39','
      '                          '#39'T'#39', '#39'Contatos'#39','
      '                          '#39'R'#39', '#39'Rubricas'#39','
      '                          '#39'F'#39', '#39'Filiais'#39','
      '                          '#39'A'#39', '#39'Agências'#39'  ) AS DESCGRUPO,'
      '       CODERRO,'
      
        '       DECODE(FLGPROCESSADO, 0, '#39'Não'#39', '#39'Sim'#39') AS DESCPROCESSADO,' +
        ' '
      '       DECODE(CODERRO, 0,'#39'Participante não encontrado'#39','
      '                    1,'#39'Agência Bancária não encontrada'#39','
      '                    2,'#39'Banco não encontrado'#39','
      '                    3,'#39'Nome do Participante alterado'#39','
      '                    4,'#39'Data de Admissão alterada'#39','
      '                    5,'#39'Data de Nascimento alterada'#39','
      '                    6,'#39'CPF alterado'#39','
      '                    7,'#39'Número de Dependentes para IR alterado'#39','
      '                    8,'#39'Cargo não encontrado'#39','
      '                    9,'#39'Cargo alterado'#39','
      '                    10,'#39'Nivel não encontrado'#39','
      '                    11,'#39'Nivel alterado'#39','
      '                    12,'#39'Sexo alterado'#39','
      '                    13,'#39'Conta Corrente alterada'#39','
      '                    14,'#39'Erro ao alterar conta corrente'#39','
      '                    15,'#39'Erro ao alterar nome'#39','
      '                    16,'#39'Erro ao alterar CPF'#39','
      '                    17,'#39'Erro ao alterar sexo'#39','
      '                    18,'#39'Erro ao alterar data de nascimento'#39','
      '                    19,'#39'Erro ao altarer data de admissão'#39','
      '                    20,'#39'Erro ao alterar n. dependentes IRRF'#39','
      '                    21,'#39'Erro ao alterar cargo'#39','
      '                    22,'#39'Erro ao alterar nivel'#39','
      '                    23,'#39'Participante Assistido '#39','
      '                    24,'#39'Participante Mantido'#39','
      '                    25,'#39'Endereço Inserido'#39','
      '                    26,'#39'Logradouro alterado'#39','
      '                    27,'#39'Bairro alterado'#39','
      '                    28,'#39'CEP alterado'#39','
      '                    29,'#39'UF do Endereço alterado'#39','
      '                    30,'#39'Número do Telefone alterado'#39','
      '                    31,'#39'Cidade do Endereço alterada'#39','
      '                    32,'#39'Telefone Inserido'#39','
      
        '                    33,'#39'Número da Carteira de Identidade alterad' +
        'o'#39','
      '                    34,'#39'UF da Carteira de Identidade alterada'#39','
      
        '                    35,'#39'Data de Expedição da Carteira de Identid' +
        'ade alterada'#39','
      '                    36,'#39'Nome do Pai alterado'#39','
      '                    37,'#39'Nome da Mãe alterado'#39','
      
        '                    38,'#39'Código do Municipio de Naturalidade alte' +
        'rado'#39','
      '                    39, '#39'Matrícula do Conjuge alterada '#39','
      '                    40, '#39'Tempo de Serviço Total alterado '#39','
      
        '                    41, '#39'Tempo de Serviço Não Creditado  alterad' +
        'o '#39','
      '                    42, '#39'Documento de Identidade Inserido'#39','
      
        '                    43, '#39'Dependente Inserido (não existia no cad' +
        'astro)'#39','
      '                    44, '#39'Estado Civil  alterado '#39','
      
        '                    45, '#39'Indicador para Salário de IR  alterado ' +
        #39','
      
        '                    46, '#39'Indicador para Salário Família  alterad' +
        'o '#39','
      '                    47, '#39'Indicador de Invalidez  alterado '#39','
      
        '                    48, '#39'Data de Início do Dependente  alterada'#39 +
        ','
      '                    49, '#39'Grau de Dependência  alterado '#39','
      
        '                    50, '#39'Indicador de Cargo de Diretor  alterado' +
        ' '#39','
      '                    51, '#39'Tempo de Serviço Anterior alterado'#39','
      
        '                    52, '#39'Tempo de Serviço Publico Anterior alter' +
        'ado'#39','
      
        '                    53, '#39'Tempo de Serviço Privado Anterior alter' +
        'ado'#39','
      
        '                    54, '#39'Tempo de Serviço Anterior Real alterado' +
        #39','
      '                    55, '#39'Filial do Empregado alterada'#39','
      '                    56, '#39'Filial não encontrada'#39','
      '                    57, '#39'Situação do Empregado alterada'#39','
      
        '                    58, '#39'Vinculação Funcional do Empregado alter' +
        'ada'#39','
      '                    59, '#39'Indicador de Diretor alterado'#39','
      '                    60, '#39'Função Não Encontrada'#39','
      '                    61, '#39'Função alterada'#39','
      '                    62, '#39'Data de Demissão alterada'#39','
      '                    63, '#39'Data de Readmissão alterada'#39','
      '                    64, '#39'Data do Falecimento alterada'#39','
      '                    65, '#39'Cidade do Endereço não encontrada '#39','
      '                    66, '#39'Agência Bancária em Branco'#39','
      '                    67, '#39'UF não encontrada na tabela de Estado'#39','
      '                    68, '#39'Erro ao inserir novo dependente'#39','
      '                    69, '#39'Novo Funcionario Cadastrado'#39','
      '                    70, '#39'Centro de Custo do Empregado Alterado'#39','
      '                    71, '#39'Salário Total na Empresa Alterado'#39','
      '                    72, '#39'Matricula Alterada'#39','
      '                    73, '#39'Email do Contato Alterado'#39','
      '                    74, '#39'Cargo do Contato Alterado'#39','
      '                    75, '#39'Setor do Contato Alterado'#39','
      '                    76, '#39'Data Nascimento do Contato Alterado'#39','
      '                    77, '#39'Obs do Contato Alterado'#39','
      
        '                    78, '#39'Novo cargo inserido na evolução funcion' +
        'al'#39','
      
        '                    79, '#39'Nova função inserida na evolução funcio' +
        'nal'#39','
      '                    80, '#39'Inserido Adicional compensatório'#39','
      
        '                    81, '#39'Inserido adicional por tempo de serviço' +
        #39','
      '                    82, '#39'Inserido adicional noturno'#39','
      
        '                    83, '#39'Inserido percentual por periculosidade'#39 +
        ','
      '                    84, '#39'Inserido percentual de insalubridade'#39','
      '                    85, '#39'Data final do cargo atual alterada'#39','
      '                    86, '#39'Data final da função atual alterada'#39','
      
        '                    87, '#39'Data final do percentual por insalubrid' +
        'ade alterado'#39','
      '                    88, '#39'Percentual de insalubridade alterado'#39','
      
        '                    89, '#39'Percentual por periculosidade alterado'#39 +
        ','
      
        '                    90, '#39'Data final do adicional noturno alterad' +
        'a'#39','
      
        '                    91, '#39'Percentual do aicional noturno alterado' +
        #39','
      
        '                    92, '#39'Inserido pecentual de adicional noturno' +
        #39','
      
        '                    93, '#39'Data final d adicional por tempo de ser' +
        'viço alterada'#39','
      
        '                    94, '#39'Percentual por tempo de serviço alterad' +
        'o'#39','
      
        '                    95, '#39'Data final do adicional compensatório a' +
        'lterada'#39','
      
        '                    96, '#39'Percental de adicional compensatório al' +
        'terado'#39','
      '                    97, '#39'Situação na patrocinadora alterada'#39' ,'
      
        '                    98, '#39'Valor da opção 1 da patrocinadora alter' +
        'ado'#39' ,'
      
        '                    99, '#39'Valor da opção 2 da patrocinadora alter' +
        'ado'#39' ,'
      
        '                    100, '#39'Valor da opção 3 da patrocinadora alte' +
        'rado'#39' ,'
      
        '                    101, '#39'Valor da opção 4 da patrocinadora alte' +
        'rado'#39' ,'
      
        '                    102, '#39'Valor da opção 5 da patrocinadora alte' +
        'rado'#39' ,'
      
        '                    103, '#39'Valor da opção 6 da patrocinadora alte' +
        'rado'#39' ,'
      '                    104, '#39'Evento previdenciário inserido'#39','
      '                    105, '#39'Descrição da rubrica alterada'#39','
      
        '                    106, '#39'Indicador (Provento/Desconto) da rubri' +
        'ca alterado'#39','
      
        '                    107, '#39'Indicador (Atraso/Devolução/Normal) da' +
        ' rubrica alterado'#39','
      '                    108, '#39'Rubrica inserida'#39','
      '                    109, '#39'Nome da filial alterado'#39','
      
        '                    110, '#39'Tipo da filial (Capital/Interior) alte' +
        'rado'#39','
      '                    111, '#39'CGC da filial alterado'#39','
      '                    112, '#39'Sigla da filial alterada'#39','
      '                    113, '#39'Filial inserida'#39','
      '                    114, '#39'Noma da agência alterado'#39','
      '                    115, '#39'Agência inserida'#39','
      '                    116, '#39'Elegível inserido'#39','
      '                    117, '#39'Erro ao inserir elegível'#39
      '                    ) DESCERRO,'
      
        '      DECODE(CHAVE,'#39'M'#39','#39'Matrícula'#39','#39'I'#39','#39'Inscrição'#39','#39'A'#39','#39'Num. Agê' +
        'ncia'#39','#39'F'#39','#39'Num. Filial'#39','#39'R'#39','#39'Cod. Rubrica'#39') CHAVE,'
      
        '      1 AS CONT, VALORCHAVE,  VALORNAFUNDACAO,  VALORNOINTERFACE' +
        ','
      
        '      DECODE(FLGSITPART, '#39'AT'#39', '#39'ATIVO'#39','#39'MA'#39','#39'MANTIDO'#39','#39'MP'#39', '#39'MAN' +
        'TIDO PARCIAL'#39','#39'MS'#39','#39'MANUTENÇÃO DE SALDO DE CONTA'#39','
      
        '      '#39'AS'#39','#39'ASSISTIDO'#39','#39'CA'#39','#39'CANCELADO'#39','#39'AE'#39','#39'PN'#39', '#39'PENDENTE'#39','#39#39 +
        ' ) SITPART,'
      '      S.DESCRICAO SITFUNC,'
      
        '      DECODE(CHAVE,'#39'M'#39','#39'Categ. de Situação do Participante'#39','#39#39') ' +
        'TITULO1,'
      '      DECODE(CHAVE,'#39'M'#39','#39'Situação do Funcionário'#39','#39#39') TITULO2'
      'FROM  TABCRITICASCCP , SITFUNC S'
      'WHERE MESCOBRANCA = :MESCOBRANCA'
      'AND   IDPESSJUR   = :IDPESSJUR'
      'AND   GRUPO       IN (:GRUPO)'
      'AND S.IDSITFUNC(+) = TABCRITICASCCP.IDSITFUNC'
      'ORDER BY GRUPO, DESCERRO, VALORCHAVE'
      ''
      ''
      ''
      ''
      ''
      ' '
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 537
    Top = 380
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOBRANCA'
        ParamType = ptUnknown
        Value = '200507'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '91008'
      end
      item
        DataType = ftString
        Name = 'GRUPO'
        ParamType = ptUnknown
        Value = 'C'
      end>
  end
  object dsInterfCadAnalitico: TwwDataSource
    DataSet = qryInterfCadAnalitico
    Left = 537
    Top = 431
  end
  object ppInterfCadAnalitico: TppBDEPipeline
    DataSource = dsInterfCadAnalitico
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'InterfCadSintetico1'
    Left = 537
    Top = 353
    object ppInterfCadAnaliticoppField1: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppInterfCadAnaliticoppField2: TppField
      FieldAlias = 'DESCGRUPO'
      FieldName = 'DESCGRUPO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 1
    end
    object ppInterfCadAnaliticoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODERRO'
      FieldName = 'CODERRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppInterfCadAnaliticoppField4: TppField
      FieldAlias = 'DESCPROCESSADO'
      FieldName = 'DESCPROCESSADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 3
    end
    object ppInterfCadAnaliticoppField5: TppField
      FieldAlias = 'DESCERRO'
      FieldName = 'DESCERRO'
      FieldLength = 55
      DisplayWidth = 55
      Position = 4
    end
    object ppInterfCadAnaliticoppField6: TppField
      FieldAlias = 'CHAVE'
      FieldName = 'CHAVE'
      FieldLength = 12
      DisplayWidth = 12
      Position = 5
    end
    object ppInterfCadAnaliticoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONT'
      FieldName = 'CONT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppInterfCadAnaliticoppField8: TppField
      FieldAlias = 'VALORCHAVE'
      FieldName = 'VALORCHAVE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 7
    end
    object ppInterfCadAnaliticoppField9: TppField
      FieldAlias = 'VALORNAFUNDACAO'
      FieldName = 'VALORNAFUNDACAO'
      FieldLength = 200
      DisplayWidth = 200
      Position = 8
    end
    object ppInterfCadAnaliticoppField10: TppField
      FieldAlias = 'VALORNOINTERFACE'
      FieldName = 'VALORNOINTERFACE'
      FieldLength = 200
      DisplayWidth = 200
      Position = 9
    end
    object ppInterfCadAnaliticoppField11: TppField
      FieldAlias = 'SITPART'
      FieldName = 'SITPART'
      FieldLength = 28
      DisplayWidth = 28
      Position = 10
    end
    object ppInterfCadAnaliticoppField12: TppField
      FieldAlias = 'SITFUNC'
      FieldName = 'SITFUNC'
      FieldLength = 60
      DisplayWidth = 60
      Position = 11
    end
    object ppInterfCadAnaliticoppField13: TppField
      FieldAlias = 'TITULO1'
      FieldName = 'TITULO1'
      FieldLength = 34
      DisplayWidth = 34
      Position = 12
    end
    object ppInterfCadAnaliticoppField14: TppField
      FieldAlias = 'TITULO2'
      FieldName = 'TITULO2'
      FieldLength = 23
      DisplayWidth = 23
      Position = 13
    end
  end
  object rpInterfCadAnalitico: TppReport
    AutoStop = False
    DataPipeline = ppInterfCadAnalitico
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 540
    Top = 326
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppInterfCadAnalitico'
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37042
      mmPrintPosition = 0
      object ppDBText94: TppDBText
        UserName = 'rpTotalizadorDBText1'
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
        mmWidth = 152400
        BandType = 0
      end
      object ppDBText95: TppDBText
        UserName = 'rpTotalizadorDBText2'
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
      object ppDBText96: TppDBText
        UserName = 'rpTotalizadorDBText3'
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
      object ppDBImage8: TppDBImage
        UserName = 'rpTotalizadorDBImage1'
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
      object ppDBText98: TppDBText
        UserName = 'rpTotalizadorDBText4'
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
      object ppDBText99: TppDBText
        UserName = 'rpTotalizadorDBText5'
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
      object ppLabel108: TppLabel
        UserName = 'rpTotalizadorLabel1'
        AutoSize = False
        Caption = 'Relatório de Críticas do Interface Cadastral - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 1323
        mmTop = 26458
        mmWidth = 195580
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label87'
        Caption = 'Referência : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 78052
        mmTop = 32015
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText100: TppDBText
        UserName = 'DBText73'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppInterfCadAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppInterfCadAnalitico'
        mmHeight = 4233
        mmLeft = 99748
        mmTop = 32015
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetCritCadAnalitico: TppDetailBand
      BeforePrint = ppDetCritCadAnaliticoBeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShapeInterfCadAnalitico: TppShape
        UserName = 'ppShapeInterfCadAnalitico'
        Brush.Color = clSilver
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clWindow
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText104: TppDBText
        UserName = 'DBText104'
        DataField = 'VALORCHAVE'
        DataPipeline = ppInterfCadAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppInterfCadAnalitico'
        mmHeight = 3175
        mmLeft = 6879
        mmTop = 529
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText105: TppDBText
        UserName = 'DBText105'
        DataField = 'VALORNAFUNDACAO'
        DataPipeline = ppInterfCadAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppInterfCadAnalitico'
        mmHeight = 3175
        mmLeft = 32544
        mmTop = 529
        mmWidth = 67204
        BandType = 4
      end
      object ppDBText106: TppDBText
        UserName = 'DBText106'
        DataField = 'VALORNOINTERFACE'
        DataPipeline = ppInterfCadAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppInterfCadAnalitico'
        mmHeight = 3175
        mmLeft = 101336
        mmTop = 529
        mmWidth = 66146
        BandType = 4
      end
      object ppDBText111: TppDBText
        UserName = 'DBText111'
        DataField = 'DESCPROCESSADO'
        DataPipeline = ppInterfCadAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppInterfCadAnalitico'
        mmHeight = 3175
        mmLeft = 172509
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText74: TppDBText
        UserName = 'DBText74'
        DataField = 'SITPART'
        DataPipeline = ppInterfCadAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppInterfCadAnalitico'
        mmHeight = 3175
        mmLeft = 190236
        mmTop = 529
        mmWidth = 33338
        BandType = 4
      end
      object ppDBText75: TppDBText
        UserName = 'DBText75'
        DataField = 'SITFUNC'
        DataPipeline = ppInterfCadAnalitico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppInterfCadAnalitico'
        mmHeight = 3175
        mmLeft = 224896
        mmTop = 529
        mmWidth = 56092
        BandType = 4
      end
    end
    object ppFooterBand16: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6561
      mmPrintPosition = 0
      object ppSystemVariable17: TppSystemVariable
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
        mmLeft = 41010
        mmTop = 1588
        mmWidth = 195527
        BandType = 8
      end
      object ppLabel111: TppLabel
        UserName = 'ppLabel25'
        AutoSize = False
        Caption = 'InterfacePREV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 1852
        mmWidth = 182563
        BandType = 8
      end
      object ppLine37: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1588
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable18: TppSystemVariable
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
        mmLeft = 257176
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand6: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'Shape5'
        Brush.Color = clSilver
        ParentHeight = True
        ParentWidth = True
        mmHeight = 5556
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel112: TppLabel
        UserName = 'Label109'
        Caption = 'Total Geral de Críticas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 2117
        mmTop = 529
        mmWidth = 37306
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc10'
        AutoSize = True
        DataField = 'CONT'
        DataPipeline = ppInterfCadAnalitico
        DisplayFormat = '###,##'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppInterfCadAnalitico'
        mmHeight = 4233
        mmLeft = 172509
        mmTop = 529
        mmWidth = 23548
        BandType = 7
      end
    end
    object ppGroup18: TppGroup
      BreakName = 'DESCGRUPO'
      DataPipeline = ppInterfCadAnalitico
      OutlineSettings.CreateNode = True
      UserName = 'Group15'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppInterfCadAnalitico'
      object ppGroupHeaderBand18: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppShape7: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 6085
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText103: TppDBText
          UserName = 'DBText97'
          AutoSize = True
          DataField = 'DESCGRUPO'
          DataPipeline = ppInterfCadAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppInterfCadAnalitico'
          mmHeight = 4233
          mmLeft = 2117
          mmTop = 1323
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand18: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel113: TppLabel
          UserName = 'Label106'
          Caption = 'Total de Críticas de '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 10319
          mmTop = 1323
          mmWidth = 33338
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'CONT'
          DataPipeline = ppInterfCadAnalitico
          DisplayFormat = '###,##'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup18
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppInterfCadAnalitico'
          mmHeight = 3969
          mmLeft = 178859
          mmTop = 1323
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBText107: TppDBText
          UserName = 'DBText107'
          AutoSize = True
          DataField = 'DESCGRUPO'
          DataPipeline = ppInterfCadAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppInterfCadAnalitico'
          mmHeight = 4233
          mmLeft = 44186
          mmTop = 1323
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup19: TppGroup
      BreakName = 'DESCERRO'
      DataPipeline = ppInterfCadAnalitico
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group19'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppInterfCadAnalitico'
      object ppGroupHeaderBand19: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppShape8: TppShape
          UserName = 'Shape8'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 9525
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppDBText101: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'DESCERRO'
          DataPipeline = ppInterfCadAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppInterfCadAnalitico'
          mmHeight = 3175
          mmLeft = 7144
          mmTop = 794
          mmWidth = 19579
          BandType = 3
          GroupNo = 1
        end
        object ppDBText102: TppDBText
          UserName = 'DBText102'
          DataField = 'CHAVE'
          DataPipeline = ppInterfCadAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppInterfCadAnalitico'
          mmHeight = 3175
          mmLeft = 6879
          mmTop = 5292
          mmWidth = 20373
          BandType = 3
          GroupNo = 1
        end
        object ppLabel114: TppLabel
          UserName = 'Label114'
          Caption = 'Valor na Base de Dados da Fundação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 32544
          mmTop = 5292
          mmWidth = 45773
          BandType = 3
          GroupNo = 1
        end
        object ppLabel115: TppLabel
          UserName = 'Label115'
          Caption = 'Valor Enviado pela Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 101336
          mmTop = 5292
          mmWidth = 39952
          BandType = 3
          GroupNo = 1
        end
        object ppDBText109: TppDBText
          UserName = 'DBText109'
          DataField = 'CODERRO'
          DataPipeline = ppInterfCadAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppInterfCadAnalitico'
          mmHeight = 3175
          mmLeft = 115359
          mmTop = 794
          mmWidth = 8467
          BandType = 3
          GroupNo = 1
        end
        object ppLabel119: TppLabel
          UserName = 'Label119'
          Caption = '( Código :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 102394
          mmTop = 794
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLabel120: TppLabel
          UserName = 'Label120'
          Caption = ')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 124619
          mmTop = 794
          mmWidth = 1058
          BandType = 3
          GroupNo = 1
        end
        object ppLabel122: TppLabel
          UserName = 'Label122'
          Caption = 'Alterado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 171980
          mmTop = 5821
          mmWidth = 10054
          BandType = 3
          GroupNo = 1
        end
        object ppDBText81: TppDBText
          UserName = 'DBText81'
          DataField = 'TITULO1'
          DataPipeline = ppInterfCadAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          WordWrap = True
          DataPipelineName = 'ppInterfCadAnalitico'
          mmHeight = 7408
          mmLeft = 189971
          mmTop = 1852
          mmWidth = 33338
          BandType = 3
          GroupNo = 1
        end
        object ppDBText82: TppDBText
          UserName = 'DBText82'
          DataField = 'TITULO2'
          DataPipeline = ppInterfCadAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          WordWrap = True
          DataPipelineName = 'ppInterfCadAnalitico'
          mmHeight = 7144
          mmLeft = 224632
          mmTop = 1852
          mmWidth = 37835
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand19: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryRubricasNEncontradas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT FLGTIPODESC, T.MESCOBRANCA, T.MESREFERENCIA ,'
      'T.VALORRECEBIDO, T.CODPROVDESC, T.IDPROVENTO,'
      'T.IDPESSOA , T.IDPESSJUR,'
      'EL.MATRICULA , P.NOME PARTICIPANTE , PATRO.NOME PATRO,'
      
        'DECODE(T.FLGTIPODESC,'#39'A'#39','#39'Assistencial'#39','#39'E'#39','#39'Empréstimo'#39','#39'Previd' +
        'encial'#39')'
      'FROM TMPDESC T , PESSOA P , PESSOA PATRO,ELEGPATRO EL'
      'WHERE T.MESCOBRANCA = '#39'2002/02'#39
      'AND T.MESREFERENCIA = '#39'2002/02'#39
      'AND T.IDPESSJUR = 2002'
      'AND T.IDMODULO = 32'
      'AND NVL(T.IDDESCONTO,0) = 0'
      'AND NVL(T.VALORRECEBIDO,0) >0'
      'AND P.IDPESSOA = T.IDPESSOA'
      'AND PATRO.IDPESSOA = T.IDPESSJUR'
      'AND EL.IDPESSJUR = T.IDPESSJUR'
      'AND EL.IDPESSOA = T.IDPESSOA'
      'ORDER BY T.FLGTIPODESC,EL.MATRICULA'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 274
    Top = 415
  end
  object dsyRubricasNEncontradas: TwwDataSource
    DataSet = qryRubricasNEncontradas
    Left = 318
    Top = 415
  end
  object ppRubricasNEncontradas: TppBDEPipeline
    DataSource = dsyRubricasNEncontradas
    UserName = 'RubricasReceb1'
    Left = 362
    Top = 415
    object ppRubricasNEncontradasppField1: TppField
      FieldAlias = 'FLGTIPODESC'
      FieldName = 'FLGTIPODESC'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppRubricasNEncontradasppField2: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 1
    end
    object ppRubricasNEncontradasppField3: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 2
    end
    object ppRubricasNEncontradasppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppRubricasNEncontradasppField5: TppField
      FieldAlias = 'CODPROVDESC'
      FieldName = 'CODPROVDESC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppRubricasNEncontradasppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPROVENTO'
      FieldName = 'IDPROVENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppRubricasNEncontradasppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppRubricasNEncontradasppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppRubricasNEncontradasppField9: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 8
    end
    object ppRubricasNEncontradasppField10: TppField
      FieldAlias = 'PARTICIPANTE'
      FieldName = 'PARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object ppRubricasNEncontradasppField11: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object ppRubricasNEncontradasppField12: TppField
      FieldAlias = 'DECODE(T.FLGTIPODESC,'#39'A'#39','#39'ASSIS'
      FieldName = 'DECODE(T.FLGTIPODESC,'#39'A'#39','#39'ASSIS'
      FieldLength = 12
      DisplayWidth = 12
      Position = 11
    end
  end
  object rpRubricasNEncontradas: TppReport
    AutoStop = False
    DataPipeline = ppRubricasNEncontradas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 17780
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.DatabaseSettings.DataPipeline = ppRubricasNEncontradas
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
    Left = 406
    Top = 411
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppRubricasNEncontradas'
    object ppHeaderBand17: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object ppLabel139: TppLabel
        UserName = 'ppLabel6'
        Caption = 'Rubricas não Esperadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 76200
        mmTop = 25400
        mmWidth = 49477
        BandType = 0
      end
      object ppLine38: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 32279
        mmWidth = 197300
        BandType = 0
      end
      object ppDBImage9: TppDBImage
        UserName = 'ppDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 529
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText113: TppDBText
        UserName = 'ppDBText1'
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
      object ppDBText114: TppDBText
        UserName = 'ppDBText2'
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
      object ppDBText115: TppDBText
        UserName = 'ppDBText3'
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
      object ppDBText116: TppDBText
        UserName = 'ppDBText4'
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
      object ppDBText117: TppDBText
        UserName = 'ppDBText5'
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
        mmLeft = 86254
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText118: TppDBText
        UserName = 'ppDBText6'
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
        mmWidth = 21960
        BandType = 0
      end
      object ppDBText119: TppDBText
        UserName = 'ppDBText7'
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
      object ppLabel140: TppLabel
        UserName = 'ppLabel7'
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
      object ppDBText120: TppDBText
        UserName = 'ppDBText8'
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
      object ppLabel141: TppLabel
        UserName = 'rpHistContribAnaliticoLabel1'
        Caption = 'Referência :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 142875
        mmTop = 25400
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText121: TppDBText
        UserName = 'rpHistContribAnaliticoDBText1'
        DataField = 'MESCOBRANCA'
        DataPipeline = ppRubricasNEncontradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppRubricasNEncontradas'
        mmHeight = 5027
        mmLeft = 168011
        mmTop = 25400
        mmWidth = 18256
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText123: TppDBText
        UserName = 'rpHistContribAnaliticoDBText8'
        DataField = 'VALORRECEBIDO'
        DataPipeline = ppRubricasNEncontradas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRubricasNEncontradas'
        mmHeight = 3704
        mmLeft = 170127
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText125: TppDBText
        UserName = 'DBText64'
        DataField = 'CODPROVDESC'
        DataPipeline = ppRubricasNEncontradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRubricasNEncontradas'
        mmHeight = 3704
        mmLeft = 133350
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText128: TppDBText
        UserName = 'rpHistContribAnaliticoDBText5'
        DataField = 'PARTICIPANTE'
        DataPipeline = ppRubricasNEncontradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRubricasNEncontradas'
        mmHeight = 3704
        mmLeft = 19050
        mmTop = 0
        mmWidth = 94721
        BandType = 4
      end
      object ppDBText127: TppDBText
        UserName = 'rpHistContribAnaliticoDBText4'
        DataField = 'MATRICULA'
        DataPipeline = ppRubricasNEncontradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRubricasNEncontradas'
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppLabel142: TppLabel
        UserName = 'ppLabel8'
        AutoSize = False
        Caption = '     InterfacePrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 10848
        mmWidth = 155311
        BandType = 8
      end
      object ppSystemVariable19: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 11113
        mmTop = 11113
        mmWidth = 166688
        BandType = 8
      end
      object ppSystemVariable20: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 11113
        mmWidth = 26194
        BandType = 8
      end
      object ppDBCalc30: TppDBCalc
        UserName = 'DBCalc30'
        DataPipeline = ppRubricasNEncontradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'ppRubricasNEncontradas'
        mmHeight = 4233
        mmLeft = 88636
        mmTop = 1058
        mmWidth = 17198
        BandType = 8
      end
      object ppLabel150: TppLabel
        UserName = 'Label150'
        Caption = 'rubricas recebidas no valor total de R$'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 106892
        mmTop = 1058
        mmWidth = 65617
        BandType = 8
      end
      object ppDBCalc31: TppDBCalc
        UserName = 'DBCalc31'
        DataField = 'VALORRECEBIDO'
        DataPipeline = ppRubricasNEncontradas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRubricasNEncontradas'
        mmHeight = 4233
        mmLeft = 168805
        mmTop = 1058
        mmWidth = 17198
        BandType = 8
      end
      object ppLabel151: TppLabel
        UserName = 'Label151'
        Caption = 'Total :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 76994
        mmTop = 1058
        mmWidth = 10583
        BandType = 8
      end
      object ppLine41: TppLine
        UserName = 'Line41'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 9525
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppGroup20: TppGroup
      BreakName = 'PATRO'
      DataPipeline = ppRubricasNEncontradas
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRubricasNEncontradas'
      object ppGroupHeaderBand20: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLabel143: TppLabel
          UserName = 'rpHistContribAnaliticoLabel2'
          Caption = 'Patrocinadora : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 1588
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppDBText126: TppDBText
          UserName = 'rpHistContribAnaliticoDBText2'
          DataField = 'PATRO'
          DataPipeline = ppRubricasNEncontradas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppRubricasNEncontradas'
          mmHeight = 4233
          mmLeft = 31221
          mmTop = 1588
          mmWidth = 69321
          BandType = 3
          GroupNo = 0
        end
        object ppLine40: TppLine
          UserName = 'rpHistContribAnaliticoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 6615
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand20: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel144: TppLabel
          UserName = 'Label137'
          Caption = 'Total da Patrocinadora :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 47625
          mmTop = 529
          mmWidth = 40217
          BandType = 5
          GroupNo = 0
        end
        object ppLabel145: TppLabel
          UserName = 'Label138'
          Caption = 'rubricas recebidas no valor total de R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 106892
          mmTop = 529
          mmWidth = 65617
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc29: TppDBCalc
          UserName = 'DBCalc27'
          DataField = 'VALORRECEBIDO'
          DataPipeline = ppRubricasNEncontradas
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup20
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppRubricasNEncontradas'
          mmHeight = 4233
          mmLeft = 168805
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc28: TppDBCalc
          UserName = 'DBCalc28'
          DataPipeline = ppRubricasNEncontradas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup20
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppRubricasNEncontradas'
          mmHeight = 4233
          mmLeft = 88636
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup21: TppGroup
      BreakName = 'DECODE(T.FLGTIPODESC,'#39'A'#39','#39'ASSIS'
      DataPipeline = ppRubricasNEncontradas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group14'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRubricasNEncontradas'
      object ppGroupHeaderBand21: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10583
        mmPrintPosition = 0
        object ppLabel148: TppLabel
          UserName = 'rpHistContribAnaliticoLabel8'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 178859
          mmTop = 5292
          mmWidth = 7144
          BandType = 3
          GroupNo = 1
        end
        object ppLabel146: TppLabel
          UserName = 'rpHistContribAnaliticoLabel6'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 133350
          mmTop = 6350
          mmWidth = 10583
          BandType = 3
          GroupNo = 1
        end
        object ppLabel149: TppLabel
          UserName = 'Label149'
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 19315
          mmTop = 6350
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
        object ppDBText129: TppDBText
          UserName = 'DBText129'
          DataField = 'DECODE(T.FLGTIPODESC,'#39'A'#39','#39'ASSIS'
          DataPipeline = ppRubricasNEncontradas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppRubricasNEncontradas'
          mmHeight = 4233
          mmLeft = 24871
          mmTop = 1058
          mmWidth = 80698
          BandType = 3
          GroupNo = 1
        end
        object ppLabel152: TppLabel
          UserName = 'Label152'
          Caption = 'Tipo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3175
          mmTop = 1058
          mmWidth = 8731
          BandType = 3
          GroupNo = 1
        end
        object ppLine39: TppLine
          UserName = 'ppLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 10319
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel147: TppLabel
          UserName = 'Label147'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 3175
          mmTop = 6350
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand21: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object qryResumoRubricas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUM(T.VALORRECEBIDO),    '#39'2002/03'#39' MESCOBRANCA, '#39'csn'#39' NOM' +
        'EPATRO, '
      'T.MESREFERENCIA ,  T.CODPROVDESC, P.DESCRICAO , '
      'PL.NOME NOMEPLANO, C.NOME NOMECONTRIB'
      'FROM TMPDESC T , PROVDESC P, PLANPREV PL , CONTRIBUICAO C'
      'WHERE T.IDPESSJUR =  2002 AND '
      'T.IDPLANOPREV = t.idplanoprev AND '
      'T.MESCOBRANCA = '#39'2002/01'#39' AND '
      ' NVL(T.VALORRECEBIDO,0) > 0 AND '
      'T.FLGDESCFOLHA = '#39'P'#39' AND '
      'P.IDPROVENTO = T.IDPROVENTO  AND'
      'C.IDCONTRIBUICAO = T.IDDESCONTO AND'
      'PL.IDPLANOPREV = T.IDPLANOPREV'
      
        'GROUP BY T.MESREFERENCIA ,  T.CODPROVDESC, P.DESCRICAO , PL.NOME' +
        ','
      'C.NOME'
      'ORDER BY PL.NOME,  C.NOME, T.CODPROVDESC , T.MESREFERENCIA '
      ' ')
    ValidateWithMask = True
    Left = 578
    Top = 32
  end
  object dsResumoRubricas: TwwDataSource
    DataSet = qryResumoRubricas
    Left = 615
    Top = 32
  end
  object ppResumoRubricas: TppBDEPipeline
    DataSource = dsResumoRubricas
    UserName = 'RubricasReceb2'
    Left = 659
    Top = 32
    object ppResumoRubricasppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'SUM(T.VALORRECEBIDO)'
      FieldName = 'SUM(T.VALORRECEBIDO)'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppResumoRubricasppField2: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 1
    end
    object ppResumoRubricasppField3: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 2
    end
    object ppResumoRubricasppField4: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 3
    end
    object ppResumoRubricasppField5: TppField
      FieldAlias = 'CODPROVDESC'
      FieldName = 'CODPROVDESC'
      FieldLength = 15
      DisplayWidth = 15
      Position = 4
    end
    object ppResumoRubricasppField6: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 130
      DisplayWidth = 130
      Position = 5
    end
    object ppResumoRubricasppField7: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppResumoRubricasppField8: TppField
      FieldAlias = 'NOMECONTRIB'
      FieldName = 'NOMECONTRIB'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
  end
  object rpResumoRubricas: TppReport
    AutoStop = False
    DataPipeline = ppResumoRubricas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 17780
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.DatabaseSettings.DataPipeline = ppResumoRubricas
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
    Left = 703
    Top = 28
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppResumoRubricas'
    object ppHeaderBand18: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32544
      mmPrintPosition = 0
      object lblTitulo: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Espelho das Rubricas Recebidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 67204
        mmTop = 26723
        mmWidth = 66940
        BandType = 0
      end
      object ppLine43: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 32279
        mmWidth = 197300
        BandType = 0
      end
      object ppDBImage10: TppDBImage
        UserName = 'ppDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 529
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText122: TppDBText
        UserName = 'ppDBText1'
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
      object ppDBText124: TppDBText
        UserName = 'ppDBText2'
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
      object ppDBText130: TppDBText
        UserName = 'ppDBText3'
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
      object ppDBText131: TppDBText
        UserName = 'ppDBText4'
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
      object ppDBText132: TppDBText
        UserName = 'ppDBText5'
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
        mmLeft = 86254
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText133: TppDBText
        UserName = 'ppDBText6'
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
        mmWidth = 21960
        BandType = 0
      end
      object ppDBText134: TppDBText
        UserName = 'ppDBText7'
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
      object ppLabel154: TppLabel
        UserName = 'ppLabel7'
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
      object ppDBText135: TppDBText
        UserName = 'ppDBText8'
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
    end
    object ppDetailBand15: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText137: TppDBText
        UserName = 'rpHistContribAnaliticoDBText6'
        DataField = 'NOMECONTRIB'
        DataPipeline = ppResumoRubricas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppResumoRubricas'
        mmHeight = 3704
        mmLeft = 6879
        mmTop = 0
        mmWidth = 109538
        BandType = 4
      end
      object ppDBText139: TppDBText
        UserName = 'DBText51'
        DataField = 'SUM(T.VALORRECEBIDO)'
        DataPipeline = ppResumoRubricas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppResumoRubricas'
        mmHeight = 3704
        mmLeft = 174096
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText140: TppDBText
        UserName = 'DBText64'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppResumoRubricas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppResumoRubricas'
        mmHeight = 3704
        mmLeft = 121444
        mmTop = 265
        mmWidth = 12700
        BandType = 4
      end
    end
    object ppFooterBand18: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppLine44: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel156: TppLabel
        UserName = 'ppLabel8'
        AutoSize = False
        Caption = '     InterfacePrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 4233
        mmWidth = 155311
        BandType = 8
      end
      object ppSystemVariable21: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 14288
        mmTop = 4233
        mmWidth = 166688
        BandType = 8
      end
      object ppSystemVariable22: TppSystemVariable
        UserName = 'Calc6'
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
        mmTop = 4233
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup24: TppGroup
      BreakName = 'NOMEPATRO'
      DataPipeline = ppResumoRubricas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group24'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResumoRubricas'
      object ppGroupHeaderBand24: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand24: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel162: TppLabel
          UserName = 'Label162'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 159015
          mmTop = 1323
          mmWidth = 7673
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc34: TppDBCalc
          UserName = 'DBCalc34'
          DataField = 'SUM(T.VALORRECEBIDO)'
          DataPipeline = ppResumoRubricas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup24
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResumoRubricas'
          mmHeight = 3175
          mmLeft = 168805
          mmTop = 1058
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup22: TppGroup
      BreakName = 'NOMEPLANO'
      DataPipeline = ppResumoRubricas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group22'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResumoRubricas'
      object ppGroupHeaderBand22: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppShape9: TppShape
          UserName = 'Shape9'
          Brush.Color = clSilver
          ShiftWithParent = True
          mmHeight = 6085
          mmLeft = 0
          mmTop = 0
          mmWidth = 197909
          BandType = 3
          GroupNo = 1
        end
        object ppLabel163: TppLabel
          UserName = 'Label163'
          Caption = 'Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 108744
          mmTop = 1323
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppDBText138: TppDBText
          UserName = 'DBText138'
          DataField = 'NOMEPLANO'
          DataPipeline = ppResumoRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppResumoRubricas'
          mmHeight = 3969
          mmLeft = 120121
          mmTop = 1323
          mmWidth = 72761
          BandType = 3
          GroupNo = 1
        end
        object ppLabel158: TppLabel
          UserName = 'Label158'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 5556
          mmTop = 1323
          mmWidth = 25135
          BandType = 3
          GroupNo = 1
        end
        object ppDBText136: TppDBText
          UserName = 'DBText136'
          DataField = 'NOMEPATRO'
          DataPipeline = ppResumoRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppResumoRubricas'
          mmHeight = 3969
          mmLeft = 31750
          mmTop = 1058
          mmWidth = 71967
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand22: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel161: TppLabel
          UserName = 'Label1601'
          AutoSize = False
          Caption = 'Total do Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 142875
          mmTop = 1588
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc33: TppDBCalc
          UserName = 'DBCalc33'
          DataField = 'SUM(T.VALORRECEBIDO)'
          DataPipeline = ppResumoRubricas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup22
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResumoRubricas'
          mmHeight = 3175
          mmLeft = 169069
          mmTop = 1588
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup23: TppGroup
      BreakName = 'CODPROVDESC'
      DataPipeline = ppResumoRubricas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group23'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppResumoRubricas'
      object ppGroupHeaderBand23: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppDBText141: TppDBText
          UserName = 'DBText141'
          DataField = 'CODPROVDESC'
          DataPipeline = ppResumoRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppResumoRubricas'
          mmHeight = 3704
          mmLeft = 19315
          mmTop = 1588
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
        end
        object ppDBText142: TppDBText
          UserName = 'DBText142'
          DataField = 'DESCRICAO'
          DataPipeline = ppResumoRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppResumoRubricas'
          mmHeight = 3704
          mmLeft = 37306
          mmTop = 1588
          mmWidth = 107950
          BandType = 3
          GroupNo = 1
        end
        object ppLabel153: TppLabel
          UserName = 'Label153'
          AutoSize = False
          Caption = 'Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 6615
          mmTop = 6350
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object ppLabel155: TppLabel
          UserName = 'Label155'
          AutoSize = False
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 119327
          mmTop = 6350
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object ppLabel157: TppLabel
          UserName = 'Label157'
          AutoSize = False
          Caption = 'Vl. Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 169598
          mmTop = 6350
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object ppLine45: TppLine
          UserName = 'Line45'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel159: TppLabel
          UserName = 'Label159'
          AutoSize = False
          Caption = 'Rubrica:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 6615
          mmTop = 1852
          mmWidth = 11377
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand23: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLabel160: TppLabel
          UserName = 'Label160'
          AutoSize = False
          Caption = 'Total da Rubrica:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 138113
          mmTop = 265
          mmWidth = 28575
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc32: TppDBCalc
          UserName = 'DBCalc32'
          DataField = 'SUM(T.VALORRECEBIDO)'
          DataPipeline = ppResumoRubricas
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup23
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppResumoRubricas'
          mmHeight = 3175
          mmLeft = 169069
          mmTop = 265
          mmWidth = 21696
          BandType = 5
          GroupNo = 1
        end
        object ppLine51: TppLine
          UserName = 'Line51'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 4233
          mmWidth = 197300
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryErrosInterface: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT T.IDCONTROLE, T.CODPROVENTO , T.VALOR, T.NOMEPATROC, T.DE' +
        'SCSITFUNC, '
      
        '                                T.MATRICULA,T.DATAREF, T.MSGEXPL' +
        'ICATIVA, C.NOME '
      
        '                                FROM TABERROSCCP T, CONTRIBUICAO' +
        ' C '
      '                                WHERE T.IDPESSJUR = 2002 AND '
      '                               T.MESCOBRANCA = '#39'2002/01'#39' AND'
      
        '                                T.IDCONTRIBUICAO = C.IDCONTRIBUI' +
        'CAO(+) '
      
        '                                ORDER BY T.IDCONTROLE,T.CODPROVE' +
        'NTO, T.MATRICULA')
    ValidateWithMask = True
    Left = 562
    Top = 88
  end
  object dsErrosInterface: TwwDataSource
    DataSet = qryErrosInterface
    Left = 599
    Top = 88
  end
  object ppErrosInterface: TppBDEPipeline
    DataSource = dsErrosInterface
    UserName = 'ErrosInterface'
    Left = 643
    Top = 88
  end
  object rpErrosInterface: TppReport
    AutoStop = False
    DataPipeline = ppErrosInterface
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 17780
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.DatabaseSettings.DataPipeline = ppErrosInterface
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
    Left = 687
    Top = 84
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppErrosInterface'
    object ppHeaderBand19: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40746
      mmPrintPosition = 0
      object lbltitulocriticas: TppLabel
        UserName = 'lblTitulo'
        Caption = 'Críticas do Interface '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 81492
        mmTop = 26988
        mmWidth = 42069
        BandType = 0
      end
      object ppLine46: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 40217
        mmWidth = 197300
        BandType = 0
      end
      object ppDBImage11: TppDBImage
        UserName = 'ppDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 529
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText143: TppDBText
        UserName = 'ppDBText1'
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
      object ppDBText144: TppDBText
        UserName = 'ppDBText2'
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
      object ppDBText145: TppDBText
        UserName = 'ppDBText3'
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
      object ppDBText146: TppDBText
        UserName = 'ppDBText4'
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
      object ppDBText147: TppDBText
        UserName = 'ppDBText5'
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
        mmLeft = 86254
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText148: TppDBText
        UserName = 'ppDBText6'
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
        mmWidth = 21960
        BandType = 0
      end
      object ppDBText149: TppDBText
        UserName = 'ppDBText7'
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
      object ppLabel165: TppLabel
        UserName = 'ppLabel7'
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
      object ppDBText150: TppDBText
        UserName = 'ppDBText8'
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
      object ppDBText157: TppDBText
        UserName = 'DBText157'
        DataField = 'NOMEPATROC'
        DataPipeline = ppErrosInterface
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppErrosInterface'
        mmHeight = 5292
        mmLeft = 35719
        mmTop = 34131
        mmWidth = 81756
        BandType = 0
      end
      object ppLabel171: TppLabel
        UserName = 'Label171'
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 5556
        mmTop = 34131
        mmWidth = 28575
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText151: TppDBText
        UserName = 'DBText151'
        DataField = 'MATRICULA'
        DataPipeline = ppErrosInterface
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppErrosInterface'
        mmHeight = 3175
        mmLeft = 9260
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText152: TppDBText
        UserName = 'DBText152'
        DataField = 'CODPROVENTO'
        DataPipeline = ppErrosInterface
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppErrosInterface'
        mmHeight = 3175
        mmLeft = 30163
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText153: TppDBText
        UserName = 'DBText153'
        DataField = 'VALOR'
        DataPipeline = ppErrosInterface
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppErrosInterface'
        mmHeight = 3175
        mmLeft = 68263
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText156: TppDBText
        UserName = 'DBText156'
        DataField = 'DATAREF'
        DataPipeline = ppErrosInterface
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppErrosInterface'
        mmHeight = 3175
        mmLeft = 46567
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText155: TppDBText
        UserName = 'DBText155'
        DataField = 'NOME'
        DataPipeline = ppErrosInterface
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppErrosInterface'
        mmHeight = 3175
        mmLeft = 95779
        mmTop = 0
        mmWidth = 95779
        BandType = 4
      end
    end
    object ppFooterBand19: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppLine47: TppLine
        UserName = 'ppLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel166: TppLabel
        UserName = 'ppLabel8'
        AutoSize = False
        Caption = '     InterfacePrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 4233
        mmWidth = 155311
        BandType = 8
      end
      object ppSystemVariable23: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 14288
        mmTop = 4233
        mmWidth = 166688
        BandType = 8
      end
      object ppSystemVariable24: TppSystemVariable
        UserName = 'Calc6'
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
        mmTop = 4233
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup25: TppGroup
      BreakName = 'NOMEPATROC'
      DataPipeline = ppErrosInterface
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group24'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppErrosInterface'
      object ppGroupHeaderBand25: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand25: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppLabel167: TppLabel
          UserName = 'Label162'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 159015
          mmTop = 5556
          mmWidth = 7673
          BandType = 5
          GroupNo = 0
        end
        object ppLabel176: TppLabel
          UserName = 'Label176'
          AutoSize = False
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 19315
          mmTop = 5556
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc38: TppDBCalc
          UserName = 'DBCalc38'
          DataField = 'VALOR'
          DataPipeline = ppErrosInterface
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup25
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppErrosInterface'
          mmHeight = 3175
          mmLeft = 60854
          mmTop = 5556
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc35: TppDBCalc
          UserName = 'DBCalc35'
          DataPipeline = ppErrosInterface
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup25
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppErrosInterface'
          mmHeight = 3175
          mmLeft = 168805
          mmTop = 5556
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup26: TppGroup
      BreakName = 'IDCONTROLE'
      DataPipeline = ppErrosInterface
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group22'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppErrosInterface'
      object ppGroupHeaderBand26: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppShape10: TppShape
          UserName = 'Shape9'
          Brush.Color = clSilver
          ShiftWithParent = True
          mmHeight = 6085
          mmLeft = 1323
          mmTop = 0
          mmWidth = 197909
          BandType = 3
          GroupNo = 1
        end
        object ppLabel168: TppLabel
          UserName = 'Label168'
          Caption = 'Ocorrência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 6085
          mmTop = 794
          mmWidth = 19844
          BandType = 3
          GroupNo = 1
        end
        object ppDBText154: TppDBText
          UserName = 'DBText154'
          DataField = 'MSGEXPLICATIVA'
          DataPipeline = ppErrosInterface
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppErrosInterface'
          mmHeight = 4498
          mmLeft = 28575
          mmTop = 794
          mmWidth = 105569
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand26: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object ppLabel170: TppLabel
          UserName = 'Label1601'
          AutoSize = False
          Caption = 'Total por Ocorrências:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 19315
          mmTop = 3440
          mmWidth = 39952
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc36: TppDBCalc
          UserName = 'DBCalc33'
          DataPipeline = ppErrosInterface
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup26
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppErrosInterface'
          mmHeight = 3175
          mmLeft = 169334
          mmTop = 3440
          mmWidth = 12700
          BandType = 5
          GroupNo = 0
        end
        object ppLabel175: TppLabel
          UserName = 'Label175'
          AutoSize = False
          Caption = 'Total de Ocorrências:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 126736
          mmTop = 3440
          mmWidth = 39952
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc37: TppDBCalc
          UserName = 'DBCalc37'
          DataField = 'VALOR'
          DataPipeline = ppErrosInterface
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup26
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppErrosInterface'
          mmHeight = 3175
          mmLeft = 60854
          mmTop = 3440
          mmWidth = 21696
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup27: TppGroup
      BreakName = 'CODPROVENTO'
      DataPipeline = ppErrosInterface
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group27'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppErrosInterface'
      object ppGroupHeaderBand27: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppLabel164: TppLabel
          UserName = 'Label164'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 9260
          mmTop = 3969
          mmWidth = 14288
          BandType = 3
          GroupNo = 2
        end
        object ppLabel169: TppLabel
          UserName = 'Label169'
          Caption = 'Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 30163
          mmTop = 3969
          mmWidth = 11906
          BandType = 3
          GroupNo = 2
        end
        object ppLabel172: TppLabel
          UserName = 'Label172'
          Caption = 'Mês Ref.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 46831
          mmTop = 3969
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object ppLabel173: TppLabel
          UserName = 'Label173'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 74348
          mmTop = 3969
          mmWidth = 7938
          BandType = 3
          GroupNo = 2
        end
        object ppLabel174: TppLabel
          UserName = 'Label174'
          Caption = 'Contribuição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 95779
          mmTop = 3969
          mmWidth = 19844
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand27: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBCalc39: TppDBCalc
          UserName = 'DBCalc39'
          DataField = 'VALOR'
          DataPipeline = ppErrosInterface
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup27
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppErrosInterface'
          mmHeight = 3175
          mmLeft = 60854
          mmTop = 2117
          mmWidth = 21696
          BandType = 5
          GroupNo = 2
        end
        object ppLabel178: TppLabel
          UserName = 'Label178'
          AutoSize = False
          Caption = 'Total de Rubricas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 126736
          mmTop = 2117
          mmWidth = 39952
          BandType = 5
          GroupNo = 2
        end
        object ppLabel177: TppLabel
          UserName = 'Label177'
          AutoSize = False
          Caption = 'Total por Rubrica:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 19315
          mmTop = 2117
          mmWidth = 39952
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc40: TppDBCalc
          UserName = 'DBCalc40'
          DataPipeline = ppErrosInterface
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup27
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'ppErrosInterface'
          mmHeight = 3175
          mmLeft = 169334
          mmTop = 2117
          mmWidth = 12700
          BandType = 5
          GroupNo = 2
        end
        object ppLine48: TppLine
          UserName = 'Line48'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 32808
          mmTop = 1058
          mmWidth = 149754
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object qryResImp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HT.IDRUBRICA, RP.CODPROVDESC, '
      '       RP.DESCRPROVDESC AS NOMERUBRICA,'
      '       COUNT(1) AS QUANTD, '
      '       SUM(HT.VALORPROVENTO) AS TOTAL'
      'FROM HISTRUBSAL HT, RUBRICAXPESS RP'
      'WHERE HT.IDMODULO = 32'
      '  AND HT.MESCOBRANCA = '#39'2003/02'#39
      '  AND HT.REFERENCIA = '#39'***'#39
      '  AND HT.IDPESSJUR = 50031'
      '  AND RP.IDPESSOA = HT.IDPESSJUR'
      '  AND HT.IDRUBRICA = RP.IDRUBRICA'
      'GROUP BY RP.CODPROVDESC, HT.IDRUBRICA, RP.DESCRPROVDESC'
      'ORDER BY RP.CODPROVDESC ')
    ValidateWithMask = True
    Left = 486
    Top = 117
  end
  object dsResImp: TwwDataSource
    DataSet = qryResImp
    Left = 487
    Top = 104
  end
  object pplResImp: TppBDEPipeline
    DataSource = dsResImp
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplResImp'
    Left = 488
    Top = 92
  end
  object rpResImp: TppReport
    AutoStop = False
    DataPipeline = pplResImp
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
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 488
    Top = 80
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplResImp'
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 46831
      mmPrintPosition = 0
      object ppDBText158: TppDBText
        UserName = 'rpTotalizadorDBText1'
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
        mmTop = 5292
        mmWidth = 152400
        BandType = 0
      end
      object ppDBText159: TppDBText
        UserName = 'rpTotalizadorDBText2'
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
        mmTop = 24606
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText160: TppDBText
        UserName = 'rpTotalizadorDBText3'
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
        mmTop = 11906
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText161: TppDBText
        UserName = 'rpTotalizadorDBText4'
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
        mmTop = 16404
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText162: TppDBText
        UserName = 'rpTotalizadorDBText5'
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
        mmTop = 20373
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'rpTotalizadorLabel1'
        AutoSize = False
        Caption = 'RELATÓRIO DE RESUMO DE RUBRICAS IMPORTADAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 43392
        mmTop = 30163
        mmWidth = 152136
        BandType = 0
      end
      object ppLabel65: TppLabel
        UserName = 'Label65'
        Caption = 'Cód.Interno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 41010
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label66'
        Caption = 'Cód.Externo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 20638
        mmTop = 41010
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'Label67'
        Caption = 'Descrição da Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 40481
        mmTop = 41010
        mmWidth = 28310
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label68'
        Caption = 'Quantd.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 157163
        mmTop = 41010
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'Label69'
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 172509
        mmTop = 41010
        mmWidth = 14288
        BandType = 0
      end
      object ppLine49: TppLine
        UserName = 'Line49'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 529
        mmTop = 44715
        mmWidth = 197115
        BandType = 0
      end
      object ppDBImage12: TppDBImage
        UserName = 'rpTotalizadorDBImage1'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 34925
        mmLeft = 2910
        mmTop = 4498
        mmWidth = 39688
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = 'Patro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 36513
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'Label701'
        Caption = 'Mes:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 157692
        mmTop = 36513
        mmWidth = 6350
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppDBText163: TppDBText
        UserName = 'rpTotalizadorDBText8'
        DataField = 'IDRUBRICA'
        DataPipeline = pplResImp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplResImp'
        mmHeight = 3175
        mmLeft = 265
        mmTop = 265
        mmWidth = 11113
        BandType = 4
      end
      object ppDBText164: TppDBText
        UserName = 'rpTotalizadorDBText9'
        DataField = 'CODPROVDESC'
        DataPipeline = pplResImp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplResImp'
        mmHeight = 3175
        mmLeft = 20638
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText166: TppDBText
        UserName = 'rpTotalizadorDBText11'
        DataField = 'NOMERUBRICA'
        DataPipeline = pplResImp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplResImp'
        mmHeight = 3175
        mmLeft = 40746
        mmTop = 265
        mmWidth = 112448
        BandType = 4
      end
      object ppDBText167: TppDBText
        UserName = 'rpTotalizadorDBText12'
        DataField = 'TOTAL'
        DataPipeline = pplResImp
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResImp'
        mmHeight = 3175
        mmLeft = 171980
        mmTop = 265
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText165: TppDBText
        UserName = 'DBText165'
        DataField = 'QUANTD'
        DataPipeline = pplResImp
        DisplayFormat = '###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResImp'
        mmHeight = 3175
        mmLeft = 157957
        mmTop = 265
        mmWidth = 8202
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable25: TppSystemVariable
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
        mmWidth = 196321
        BandType = 8
      end
      object ppLabel64: TppLabel
        UserName = 'ppLabel25'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23019
        BandType = 8
      end
      object ppLine31: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable26: TppSystemVariable
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
        mmLeft = 167746
        mmTop = 3175
        mmWidth = 28310
        BandType = 8
      end
    end
    object ppSummaryBand7: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppLabel193: TppLabel
        UserName = 'rpTotalizadorLabel101'
        Caption = 'Quantidade Total de Rubricas Importadas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 2646
        mmWidth = 71967
        BandType = 7
      end
      object ppLabel194: TppLabel
        UserName = 'Label1'
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 138907
        mmTop = 2381
        mmWidth = 10319
        BandType = 7
      end
      object ppDBCalc44: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'TOTAL'
        DataPipeline = pplResImp
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResImp'
        mmHeight = 4233
        mmLeft = 150019
        mmTop = 2381
        mmWidth = 45773
        BandType = 7
      end
      object ppDBCalc41: TppDBCalc
        UserName = 'DBCalc41'
        DataField = 'QUANTD'
        DataPipeline = pplResImp
        DisplayFormat = '###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplResImp'
        mmHeight = 4233
        mmLeft = 73819
        mmTop = 2910
        mmWidth = 23813
        BandType = 7
      end
      object ppLine50: TppLine
        UserName = 'Line50'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 794
        mmWidth = 197115
        BandType = 7
      end
    end
  end
  object qryEstatisticaSPC_ant: TwwQuery
    BeforeOpen = QryGeralBeforeOpen
    AfterClose = QryGeralAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  E.ANOMES, E.CODARVORE,'
      ''
      '  SUM(E.TOTANTERIOR) AS TOTANTERIOR,'
      '  SUM(E.TOTCONCEDIDO) AS TOTCONCEDIDO,'
      '  SUM(E.TOTCANCELADO) AS TOTCANCELADO,'
      ''
      
        '  ( SUM(E.TOTANTERIOR) + SUM(E.TOTCONCEDIDO) - SUM(E.TOTCANCELAD' +
        'O) ) AS TOTATUAL'
      ''
      'FROM'
      '  ESTBENEFSPC E'
      ''
      'WHERE'
      '      E.ANOMES      = :ANOMES'
      '  AND E.IDFUNDACAO  = :IDFUNDACAO'
      ''
      'GROUP BY'
      '  E.ANOMES,  E.CODARVORE'
      ''
      'HAVING'
      
        '  SUM(E.TOTANTERIOR) + SUM(E.TOTCONCEDIDO) + SUM(E.TOTCANCELADO)' +
        ' <> 0'
      ''
      'ORDER BY'
      '  E.CODARVORE')
    ValidateWithMask = True
    Left = 656
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMES'
        ParamType = ptUnknown
        Value = '2004/01'
      end
      item
        DataType = ftString
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
        Value = '1'
      end>
  end
end
