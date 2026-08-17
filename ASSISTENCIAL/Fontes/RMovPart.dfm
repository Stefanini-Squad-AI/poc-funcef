inherited RptMovPart: TRptMovPart
  Left = 323
  Top = 200
  Width = 374
  Height = 194
  Caption = 'RptMovPart'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Movimentação de Participantes por Plano'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Patrocinadora'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
        Name = 'Patrocinadora'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
      end>
    Formheight = 200
    Left = 141
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    ChangeConnectionType = CrmRptCMChangeConnectionType
    ChangeConnection = CrmRptCMChangeConnection
    DataBaseName = 'BaseDados'
    ShowCancelDialog = False
    Report = rpMovPart
    Left = 81
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 247
    Top = 8
  end
  object DsRptCM: TwwDataSource
    DataSet = Cds
    Left = 153
    Top = 120
  end
  object Cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 104
    Top = 120
  end
  object Dsp: TDataSetProvider
    DataSet = QryRptCM
    Constraints = True
    Left = 57
    Top = 120
  end
  object QryRptCM: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  PLANASS.NOME            PLAN   ,'
      '        FAIXAS2.MESANO          PERIODO,'
      '        NVL(INCTIT.QUANT, 0)    INCTIT ,'
      '        NVL(INCDEP.QUANT, 0)    INCDEP ,         '
      
        '        NVL(INCTIT.QUANT, 0) + NVL(INCDEP.QUANT, 0) AS TOTALINC,' +
        '         '
      '        NVL(EXCTIT.QUANT, 0)    EXCTIT ,         '
      '        NVL(EXCDEP.QUANT, 0)    EXCDEP ,         '
      '        NVL(EXCTIT.QUANT, 0) + NVL(EXCDEP.QUANT, 0) AS TOTALDEP,'
      '        100 TOTALINIC'
      'FROM    PLANASS,  FAIXAS2,         '
      '        (SELECT   F.IDFAIXAS  ,  COUNT(*)  QUANT          '
      '         FROM     BENEFASS  B ,                   '
      '                  PLANASS   PA,                   '
      '                  FAIXAS2   F      '
      
        '         WHERE   TO_CHAR(B.DATAENTRADA,'#39'YYYY/MM'#39') = RTRIM(F.MESA' +
        'NO)                   '
      
        '         AND     (B.IDPLANASS  =  F.IDPLANASS)                  ' +
        ' '
      
        '         AND     (B.IDPLANASS  =  PA.IDPLANASS)                 ' +
        '  '
      
        '         AND     (B.IDTITULAR  =  B.IDDEPENDENTE)               ' +
        '    '
      
        '         GROUP    BY  PA.IDPLANASS , F.IDFAIXAS) INCTIT,        ' +
        ' '
      
        '        (SELECT  F.IDFAIXAS     , PA.IDPLANASS   ,    COUNT(*)  ' +
        'QUANT          '
      '         FROM    BENEFASS      B,                  '
      '                 PLANASS      PA,                  '
      '                 FAIXAS2       F          '
      
        '         WHERE   TO_CHAR(B.DATAENTRADA,'#39'YYYY/MM'#39') = RTRIM(F.MESA' +
        'NO)          '
      '         AND     (B.IDPLANASS  =  F.IDPLANASS)          '
      '         AND     (B.IDPLANASS  =  PA.IDPLANASS)          '
      '         AND     (B.IDTITULAR  <> B.IDDEPENDENTE)          '
      '         GROUP   BY PA.IDPLANASS , F.IDFAIXAS) INCDEP ,         '
      
        '         (SELECT  PA.IDPLANASS , F.IDFAIXAS,                  CO' +
        'UNT(*)    QUANT          '
      '          FROM    BENEFASS    B,                  '
      '                  PLANASS    PA,                  '
      '                  FAIXAS2     F          '
      
        '          WHERE   (TO_CHAR(B.DATAENTRADA , '#39'YYYY/MM'#39') <= RTRIM(F' +
        '.MESANO))          '
      
        '          AND     (TO_CHAR(DTCANCELAMENTO,'#39'YYYY/MM'#39') = RTRIM(F.M' +
        'ESANO))          '
      '          AND     (B.IDPLANASS = F.IDPLANASS)          '
      '          AND     (B.IDPLANASS = PA.IDPLANASS)          '
      '          AND     (B.IDTITULAR = B.IDDEPENDENTE)          '
      '          GROUP   BY PA.IDPLANASS , F.IDFAIXAS) EXCTIT,         '
      
        '          (SELECT  PA.IDPLANASS,  F.IDFAIXAS,  COUNT(*) QUANT   ' +
        '       '
      '           FROM    BENEFASS   B,                  '
      '                   PLANASS   PA,                  '
      '                   FAIXAS2   F           '
      
        '           WHERE TO_CHAR(B.DATAENTRADA, '#39'YYYY/MM'#39') <= RTRIM(F.ME' +
        'SANO)          '
      
        '           AND   (TO_CHAR(B.DTCANCELAMENTO , '#39'YYYY/MM'#39') = RTRIM(' +
        'F.MESANO))          '
      '           AND   (B.IDPLANASS  =   F.IDPLANASS)          '
      '           AND   (B.IDTITULAR  =  PA.IDPLANASS)          '
      '           AND   (B.IDTITULAR  <>  B.IDDEPENDENTE)          '
      '           GROUP  BY  PA.IDPLANASS,  F.IDFAIXAS)  EXCDEP  '
      'WHERE    (FAIXAS2.IDFAIXAS  = INCTIT.IDFAIXAS(+))  '
      'AND      (FAIXAS2.IDFAIXAS  = INCDEP.IDFAIXAS(+))  '
      'AND      (FAIXAS2.IDFAIXAS  = EXCTIT.IDFAIXAS(+))  '
      'AND      (FAIXAS2.IDFAIXAS  = EXCDEP.IDFAIXAS(+))  '
      
        'AND      (FAIXAS2.IDPLANASS = PLANASS.IDPLANASS)  ORDER    BY PL' +
        'ANASS.NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 11
    Top = 120
  end
  object AQryFundacao: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 305
    Top = 120
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 305
    Top = 65
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
    DataSet = CdsFundacao
    Left = 241
    Top = 66
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P,  FUNDACAO F,  ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE '
      '     ( P.IDPESSOA =  F.IDPESSOA) AND'
      '     ( P.IDPESSOA =  E.IDPESSOA) AND'
      '     (E.IDCIDADES   = C.IDCIDADES)  AND'
      '     ( P.IDIMAGEM = I.IDIMAGEM)'
      ' ')
    ValidateWithMask = True
    Left = 18
    Top = 66
  end
  object DspFundacao: TDataSetProvider
    DataSet = qryFundacao
    Constraints = True
    Left = 96
    Top = 66
  end
  object CdsFundacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFundacao'
    Left = 171
    Top = 67
  end
  object aQryRptCm: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 209
    Top = 120
  end
  object rpMovPart: TppReport
    AutoStop = False
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
    Left = 305
    Top = 14
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33602
      mmPrintPosition = 0
      object ppLabel31: TppLabel
        UserName = 'ppLabel31'
        Caption = 'Movimentação de Participantes por Plano Assistencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 48683
        mmTop = 26723
        mmWidth = 110067
        BandType = 0
      end
      object ppDBImage19: TppDBImage
        UserName = 'DBImage17'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText187: TppDBText
        UserName = 'DBText165'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText188: TppDBText
        UserName = 'DBText166'
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
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText189: TppDBText
        UserName = 'DBText167'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object ppDBText190: TppDBText
        UserName = 'DBText168'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel113: TppLabel
        UserName = 'Label98'
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
      object ppDBText191: TppDBText
        UserName = 'DBText169'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText192: TppDBText
        UserName = 'DBText170'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3440
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 23019
        BandType = 0
      end
      object ppDBText194: TppDBText
        UserName = 'DBText172'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 87842
        mmTop = 17198
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText193: TppDBText
        UserName = 'DBText171'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand11: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object insctit: TppDBText
        UserName = 'insctit'
        AutoSize = True
        DataField = 'INCTIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 67204
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object exctit: TppDBText
        UserName = 'exctit'
        DataField = 'EXCTIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 121973
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object inscdep: TppDBText
        UserName = 'inscdep'
        DataField = 'INCDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 83609
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object excdep: TppDBText
        UserName = 'excdep'
        DataField = 'EXCDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 140229
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object totalinc: TppDBText
        UserName = 'totalinc'
        DataField = 'TOTALINC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 108215
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
      object totaldep: TppDBText
        UserName = 'totaldep'
        DataField = 'TOTALDEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 163777
        mmTop = 0
        mmWidth = 8731
        BandType = 4
      end
      object periodos: TppDBText
        UserName = 'periodos'
        AutoSize = True
        DataField = 'PERIODO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 39952
        mmTop = 265
        mmWidth = 16404
        BandType = 4
      end
      object acumulado: TppLabel
        UserName = 'acumulado'
        Caption = 'acumulado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4763
        mmLeft = 179123
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine16: TppLine
        UserName = 'ppLine16'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel32: TppLabel
        UserName = 'ppLabel32'
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
        mmTop = 1852
        mmWidth = 197909
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
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197380
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
        mmLeft = 170657
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpapurainscritosGroup1: TppGroup
      BreakName = 'PLAN'
      NewPage = True
      UserName = 'rpapurainscritosGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpapurainscritosGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 19844
        mmPrintPosition = 0
        object rpapurainscritosShape4: TppShape
          UserName = 'rpapurainscritosShape4'
          Shape = stRoundRect
          mmHeight = 4233
          mmLeft = 175948
          mmTop = 7938
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosShape3: TppShape
          UserName = 'rpapurainscritosShape3'
          Shape = stRoundRect
          mmHeight = 4233
          mmLeft = 121179
          mmTop = 7938
          mmWidth = 53446
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosShape1: TppShape
          UserName = 'rpapurainscritosShape1'
          Shape = stRoundRect
          mmHeight = 4498
          mmLeft = 64558
          mmTop = 7938
          mmWidth = 52917
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosLabel1: TppLabel
          UserName = 'rpapurainscritosLabel1'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 529
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosDBText1: TppDBText
          UserName = 'rpapurainscritosDBText1'
          AutoSize = True
          DataField = 'PLAN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 10848
          mmTop = 529
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosLabel3: TppLabel
          UserName = 'rpapurainscritosLabel3'
          Caption = 'Titulares'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 65088
          mmTop = 14023
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosLabel4: TppLabel
          UserName = 'rpapurainscritosLabel4'
          Caption = 'Dependentes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 83344
          mmTop = 14023
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosLabel5: TppLabel
          UserName = 'rpapurainscritosLabel5'
          Caption = 'Titulares'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 121444
          mmTop = 14023
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosLabel6: TppLabel
          UserName = 'rpapurainscritosLabel6'
          Caption = 'Dependentes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 139436
          mmTop = 14023
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosLabel7: TppLabel
          UserName = 'rpapurainscritosLabel7'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 107950
          mmTop = 14023
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosLabel9: TppLabel
          UserName = 'rpapurainscritosLabel9'
          Caption = 'Exclusões'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 139965
          mmTop = 7938
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosLabel10: TppLabel
          UserName = 'rpapurainscritosLabel10'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 163777
          mmTop = 14023
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosLabel2: TppLabel
          UserName = 'rpapurainscritosLabel2'
          Caption = 'Período'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 39423
          mmTop = 14023
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosLabel11: TppLabel
          UserName = 'rpapurainscritosLabel11'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 181240
          mmTop = 14288
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosLabel12: TppLabel
          UserName = 'rpapurainscritosLabel12'
          Caption = 'Inicial :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 176742
          mmTop = 7938
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosLabel8: TppLabel
          UserName = 'rpapurainscritosLabel8'
          Caption = 'Inclusões'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 83609
          mmTop = 7938
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosLine2: TppLine
          UserName = 'rpapurainscritosLine2'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 265
          mmTop = 5821
          mmWidth = 197909
          BandType = 3
          GroupNo = 0
        end
        object rpapurainscritosDBText2: TppDBText
          UserName = 'rpapurainscritosDBText2'
          DataField = 'TOTALINIC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 190236
          mmTop = 7938
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
      end
      object rpapurainscritosGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
