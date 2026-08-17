inherited DRptSaf: TDRptSaf
  Left = 532
  Top = 218
  Width = 239
  Height = 143
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 125
    Top = 8
  end
  inherited dsExemplo: TwwDataSource
    Left = 71
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 18
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 178
    Top = 8
  end
  object PpFornCliSc: TppBDEPipeline
    DataSource = DsFornCliSc
    UserName = 'PpFornCliSc'
    Left = 125
    Top = 56
  end
  object DsFornCliSc: TwwDataSource
    DataSet = QryFornCliSc
    Left = 71
    Top = 56
  end
  object QryFornCliSc: TwwQuery
    BeforeOpen = QryFornCliScBeforeOpen
    OnCalcFields = QryFornCliScCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDFORCLI, NOME, FC FROM'
      '('
      ' SELECT'
      '    EF.IDFORCLI, P.NOME, ('#39'F'#39') AS FC'
      ' FROM'
      '    PESSOA P, EMPRESAFORN EF, FORNSERV FS'
      ' WHERE'
      '    EF.IDFORCLI = P.IDPESSOA  AND'
      '    CONTACFORN IS NULL AND'
      '    FS.IDPESSOA = P.IDPESSOA AND'
      '   (NOT FS.CODCORRESP IS NULL) AND'
      '    EF.IDPESSOA = :IDPESSOA'
      ' UNION ALL'
      ' SELECT'
      '    EC.IDFORCLI, P.NOME, ('#39'C'#39') AS FC'
      ' FROM'
      '    PESSOA P, EMPRESACLIENTE EC, CLIENTEPESS CP'
      ''
      ' WHERE'
      '    EC.IDFORCLI = P.IDPESSOA AND'
      '    CONTACCLIENTE IS NULL AND'
      '    CP.IDPESSOA = P.IDPESSOA AND'
      '    (NOT CP.CODCLIENTE IS NULL) AND'
      '    EC.IDPESSOA = :IDPESSOA'
      ')'
      'ORDER BY'
      ' FC, NOME'
      ''
      '')
    ValidateWithMask = True
    Left = 18
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryFornCliScIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object QryFornCliScNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object QryFornCliScFC: TStringField
      FieldName = 'FC'
      Size = 1
    end
    object QryFornCliScDESCGRUPO: TStringField
      FieldKind = fkCalculated
      FieldName = 'DESCGRUPO'
      Calculated = True
    end
  end
  object RptForCliSc: TppReport
    AutoStop = False
    DataPipeline = PpFornCliSc
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
    Language = lgPortugueseBrazil
    Left = 178
    Top = 56
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Fornecedores / Clientes Sem Conta Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 53975
        mmTop = 8731
        mmWidth = 89165
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
        Caption = 'Fornecedores / Clientes Sem Conta Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 44450
        mmTop = 1588
        mmWidth = 108215
        BandType = 0
      end
    end
    object BDetalhe: TppDetailBand
      BeforePrint = BDetalheBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object SpDetalhe: TppShape
        UserName = 'SpDetalhe'
        Brush.Color = 14343134
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        Pen.Width = 0
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object RptForCliScDBText1: TppDBText
        UserName = 'RptForCliScDBText1'
        DataField = 'IDFORCLI'
        DataPipeline = PpFornCliSc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 7144
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object RptForCliScDBText2: TppDBText
        UserName = 'RptForCliScDBText2'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = PpFornCliSc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 27517
        mmTop = 0
        mmWidth = 10583
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
    object RptForCliScGroup1: TppGroup
      BreakName = 'FC'
      DataPipeline = PpFornCliSc
      UserName = 'RptForCliScGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptForCliScGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object RptForCliScDBText3: TppDBText
          UserName = 'RptForCliScDBText3'
          AutoSize = True
          DataField = 'DESCGRUPO'
          DataPipeline = PpFornCliSc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5292
          mmLeft = 0
          mmTop = 794
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
      end
      object RptForCliScGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object RptForCliScLine1: TppLine
          UserName = 'RptForCliScLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
