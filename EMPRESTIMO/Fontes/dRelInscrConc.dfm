inherited dtmRelInscrConc: TdtmRelInscrConc
  Left = 240
  Top = 210
  Width = 396
  Height = 221
  Caption = 'dtmRelInscrConc'
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
  object pplInscrConc: TppBDEPipeline
    DataSource = dtsInscrConc
    CloseDataSource = True
    UserName = 'lExemplo1'
    Left = 257
    Top = 126
  end
  object dtsInscrConc: TwwDataSource
    DataSet = cdsInscrConc
    Left = 199
    Top = 98
  end
  object qryInscrConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT INSC.IDINSCRICAOEMPTMO ,'
      '       PESS.NOME AS BENEFICIARIO,'
      '       PPAT.NOME AS PATROCINADORA,'
      '       PPLA.NOME AS PLANO,'
      '       IDCBANCARIA,'
      '       FLGSITUACAO,'
      '       FLGFORMAPAG,'
      '       DATAINSC,'
      '       VLRSOLIC,'
      '       NUMPARCELAS'
      ''
      'FROM   PESSOA           PESS,'
      '       PESSOA           PPAT,'
      '       PESSOA           PPLA,'
      '       INSCRICAOEMPTMO  INSC,'
      '       ('
      '        SELECT IDINSCRICAOEMPTMO FROM INSCRICAOEMPTMO'
      '        MINUS'
      '        SELECT IDINSCRICAOEMPTMO FROM CONTRATOEMPTMO'
      '       )                INSR'
      ''
      'WHERE  INSC.IDINSCRICAOEMPTMO = INSR.IDINSCRICAOEMPTMO'
      '   AND INSC.IDPESSOA          = PESS.IDPESSOA'
      '   AND INSC.IDPATRO           = PPAT.IDPESSOA'
      '   AND INSC.IDPLANOPREV       = PPLA.IDPESSOA')
    ValidateWithMask = True
    Left = 32
    Top = 76
    object qryInscrConcIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryInscrConcBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryInscrConcPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object qryInscrConcPLANO: TStringField
      FieldName = 'PLANO'
      Size = 60
    end
    object qryInscrConcIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryInscrConcFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryInscrConcFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryInscrConcDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryInscrConcVLRSOLIC: TFloatField
      FieldName = 'VLRSOLIC'
    end
    object qryInscrConcNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
  end
  object rpInscrConc: TppReport
    AutoStop = False
    DataPipeline = pplInscrConc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = '210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 328
    Top = 126
    Version = '5.5'
    mmColumnWidth = 197300
    object rptContratosAdminSint_CabecalhoRelat: TppHeaderBand
      BeforePrint = rptContratosAdminSint_CabecalhoRelatBeforePrint
      mmBottomOffset = 40
      mmHeight = 38100
      mmPrintPosition = 0
      object pplbTitulo: TppLabel
        UserName = 'lbTitulo'
        AutoSize = False
        Caption = 'pplbTitulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 9260
        mmTop = 9790
        mmWidth = 161396
        BandType = 0
      end
      object pplbNomeEmpresa: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'lbNomeEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 9260
        mmTop = 2910
        mmWidth = 161396
        BandType = 0
      end
      object rptContratosLocatarioLabel3: TppLabel
        UserName = 'rptContratosLocatarioLabel3'
        AutoSize = False
        Caption = 'Data Inscricão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 22754
        mmWidth = 37306
        BandType = 0
      end
      object pplbidInscricao: TppLabel
        UserName = 'lbidInscricao'
        Caption = '<Todos>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 40217
        mmTop = 19315
        mmWidth = 10848
        BandType = 0
      end
      object rptContratosAdminSint_LinhaTitulo: TppLine
        UserName = 'rptContratosAdminSint_LinhaTitulo'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 529
        mmLeft = 0
        mmTop = 37571
        mmWidth = 183622
        BandType = 0
      end
      object rptContratosAdminSintLabel17: TppLabel
        UserName = 'rptContratosAdminSintLabel17'
        AutoSize = False
        Caption = 'Data Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 67733
        mmTop = 31750
        mmWidth = 14552
        BandType = 0
      end
      object rptContratosAdminSintLabel18: TppLabel
        UserName = 'rptContratosAdminSintLabel18'
        AutoSize = False
        Caption = 'Nome do Beneficiário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 16404
        mmTop = 34660
        mmWidth = 49477
        BandType = 0
      end
      object rptContratosAdminSintLabel19: TppLabel
        UserName = 'rptContratosAdminSintLabel19'
        AutoSize = False
        Caption = 'Nº Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 34925
        mmWidth = 14817
        BandType = 0
      end
      object rptContratosAdminSintLabel23: TppLabel
        UserName = 'rptContratosAdminSintLabel23'
        AutoSize = False
        Caption = 'Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 19315
        mmWidth = 37306
        BandType = 0
      end
      object pplbDataInscricao: TppLabel
        UserName = 'lbDataInscricao'
        Caption = '<Todos>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 40217
        mmTop = 22754
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Valor Solicitado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 31750
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Nº Parcelas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 106098
        mmTop = 34660
        mmWidth = 16669
        BandType = 0
      end
    end
    object ppItensContrato: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 3440
      mmPrintPosition = 0
      object rptContrato: TppShape
        OnPrint = ppShape1Print
        UserName = 'rptContrato'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 183622
        BandType = 4
      end
      object rptContratosAdminSint_Separador: TppLine
        UserName = 'rptContratosAdminSint_Separador'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 183622
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'IDINSCRICAOEMPTMO'
        DataPipeline = pplInscrConc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 0
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'BENEFICIARIO'
        DataPipeline = pplInscrConc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 16404
        mmTop = 265
        mmWidth = 49477
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DATAINSC'
        DataPipeline = pplInscrConc
        DisplayFormat = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 67733
        mmTop = 265
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VLRSOLIC'
        DataPipeline = pplInscrConc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 84931
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'NUMPARCELAS'
        DataPipeline = pplInscrConc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 106098
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'ppLine37'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 183622
        BandType = 8
      end
      object pplbNomeSistema: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'lbNomeSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 3175
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 84402
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 157427
        mmTop = 3175
        mmWidth = 25400
        BandType = 8
      end
    end
    object rptContratosAdminSintSummaryBand1: TppSummaryBand
      mmBottomOffset = 40
      mmHeight = 21431
      mmPrintPosition = 0
      object rptContratosAdminSintLine1: TppLine
        UserName = 'rptContratosAdminSintLine1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 2646
        mmWidth = 183622
        BandType = 7
      end
    end
  end
  object dtpInscrConc: TDataSetProvider
    DataSet = qryInscrConc
    Constraints = True
    Left = 87
    Top = 98
  end
  object cdsInscrConc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dtpInscrConc'
    Left = 144
    Top = 130
    object cdsInscrConcIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object cdsInscrConcBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object cdsInscrConcPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object cdsInscrConcPLANO: TStringField
      FieldName = 'PLANO'
      Size = 60
    end
    object cdsInscrConcIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object cdsInscrConcFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object cdsInscrConcFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object cdsInscrConcDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object cdsInscrConcVLRSOLIC: TFloatField
      FieldName = 'VLRSOLIC'
    end
    object cdsInscrConcNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
  end
  object adoqryInscrConc: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'SELECT INSC.IDINSCRICAOEMPTMO,'
      '       INSC.IDPESSOA,'
      '       INSC.IDPATRO,'
      '       INSC.IDPLANOPREV,'
      '       INSC.IDBENEF,'
      '       IDCBANCARIA,'
      '       FLGSITUACAO,'
      '       FLGFORMAPAG,'
      '       DATAINSC,'
      '       VLRSOLIC,'
      '       NUMPARCELAS,'
      '       PESS.NOME AS BENEFICIARIO'
      'FROM   PESSOA           PESS,'
      '       INSCRICAOEMPTMO  INSC,'
      '       ('
      '        SELECT IDINSCRICAOEMPTMO FROM INSCRICAOEMPTMO'
      '        MINUS'
      '        SELECT IDINSCRICAOEMPTMO FROM CONTRATOEMPTMO'
      '       )               INSR'
      ''
      'WHERE  INSC.IDINSCRICAOEMPTMO = INSR.IDINSCRICAOEMPTMO'
      '   AND INSC.IDPESSOA          = PESS.IDPESSOA'
      '')
    Left = 32
    Top = 136
  end
end
