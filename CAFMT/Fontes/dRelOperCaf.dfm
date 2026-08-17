inherited dtmRelOperCaf: TdtmRelOperCaf
  Left = 33
  Top = 135
  Width = 737
  Height = 348
  Color = clCaptionText
  PixelsPerInch = 96
  TextHeight = 13
  inherited qryExemplo: TwwQuery [0]
    Left = 680
    Top = 153
  end
  inherited dsExemplo: TwwDataSource
    Left = 680
    Top = 140
  end
  inherited pplExemplo: TppBDEPipeline [2]
    Left = 680
    Top = 127
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
  inherited rpExemplo: TppReport
    Left = 680
    Top = 114
    inherited FooterBand1: TppFooterBand
      inherited Calc1: TppSystemVariable [1]
      end
      inherited Calc2: TppSystemVariable
        mmLeft = 74877
        mmWidth = 71702
      end
      inherited LblSistema: TppLabel [3]
        mmLeft = 0
        mmWidth = 34131
      end
    end
  end
  object updMovPatGrp: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  CLASSE = :CLASSE,'
      '  DESCGRUPO = :DESCGRUPO,'
      '  S_A = :S_A,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  VALCTB = :VALCTB'
      'where'
      '  CLASSE = :OLD_CLASSE')
    InsertSQL.Strings = (
      'insert into GRUPO'
      
        '  (CLASSE, DESCGRUPO, S_A, VALORG, CMBEM, DEPLANC, CMDEP, VALCTB' +
        ')'
      'values'
      
        '  (:CLASSE, :DESCGRUPO, :S_A, :VALORG, :CMBEM, :DEPLANC, :CMDEP,' +
        ' :VALCTB)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  CLASSE = :OLD_CLASSE')
    Left = 38
    Top = 58
  end
  object qryMovPatGrp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0)  AS SLDANT,'
      '       (0)  AS DEBITOS,'
      '       (0)  AS CREDITOS,'
      '       (0)  AS SLDATU'
      'FROM GRUPO'
      'WHERE (CLASSE IS NULL)'
      'ORDER BY CLASSE'
      '')
    UpdateObject = updMovPatGrp
    ValidateWithMask = True
    Left = 38
    Top = 46
    object qryMovPatGrpCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 15
    end
    object qryMovPatGrpDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryMovPatGrpS_A: TStringField
      FieldName = 'S_A'
      Size = 1
    end
    object qryMovPatGrpSLDANT: TFloatField
      FieldName = 'SLDANT'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryMovPatGrpDEBITOS: TFloatField
      FieldName = 'DEBITOS'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryMovPatGrpCREDITOS: TFloatField
      FieldName = 'CREDITOS'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryMovPatGrpSLDATU: TFloatField
      FieldName = 'SLDATU'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
  end
  object dsMovPatGrp: TwwDataSource
    DataSet = qryMovPatGrp
    Left = 39
    Top = 34
  end
  object ppMovPatGrp: TppBDEPipeline
    DataSource = dsMovPatGrp
    UserName = 'MovPatGrp'
    Left = 39
    Top = 22
  end
  object rpMovPatGrp: TppReport
    AutoStop = False
    DataPipeline = ppMovPatGrp
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 40
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34396
      mmPrintPosition = 0
      object ppLabel69: TppLabel
        UserName = 'ppLabel69'
        AutoSize = False
        Caption = 'Movimento Patrimonial por Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 56356
        mmTop = 7673
        mmWidth = 84402
        BandType = 0
      end
      object ppLine19: TppLine
        UserName = 'ppLine19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26194
        mmWidth = 197379
        BandType = 0
      end
      object ppLabel70: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel70'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 794
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'ppLabel71'
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 27517
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'ppLabel72'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 17992
        mmTop = 27517
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'ppLabel73'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 88106
        mmTop = 27517
        mmWidth = 6350
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'ppLabel74'
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 98954
        mmTop = 27517
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'ppLabel75'
        Caption = 'Débitos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 134938
        mmTop = 27517
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'ppLabel76'
        Caption = 'Créditos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 159544
        mmTop = 27517
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'ppLabel77'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 179652
        mmTop = 27517
        mmWidth = 17727
        BandType = 0
      end
      object pplbldata1: TppLabel
        UserName = 'pplbldata1'
        Caption = 'Movimentação de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 59002
        mmTop = 14817
        mmWidth = 31750
        BandType = 0
      end
      object rbLabel80: TppLabel
        UserName = 'rbLabel80'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 91811
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object rpMovPatGrpLine1: TppLine
        UserName = 'rpMovPatGrpLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 32544
        mmWidth = 197379
        BandType = 0
      end
      object rbLabel82: TppLabel
        UserName = 'rbLabel82'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 117740
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object rpMovPatGrpLabel1: TppLabel
        UserName = 'rpMovPatGrpLabel1'
        Caption = 'à'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 114300
        mmTop = 14817
        mmWidth = 2117
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rbdbeClasse: TppDBText
        OnPrint = rbdbeClassePrint
        UserName = 'rbdbeClasse'
        DataField = 'CLASSE'
        DataPipeline = ppMovPatGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText48: TppDBText
        UserName = 'ppDBText48'
        DataField = 'DESCGRUPO'
        DataPipeline = ppMovPatGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 529
        mmWidth = 68792
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'ppDBText49'
        BlankWhenZero = True
        DataField = 'SLDANT'
        DataPipeline = ppMovPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 95515
        mmTop = 529
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText50: TppDBText
        UserName = 'ppDBText50'
        BlankWhenZero = True
        DataField = 'DEBITOS'
        DataPipeline = ppMovPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 121179
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText51: TppDBText
        UserName = 'ppDBText51'
        BlankWhenZero = True
        DataField = 'CREDITOS'
        DataPipeline = ppMovPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 146844
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText52: TppDBText
        UserName = 'ppDBText52'
        BlankWhenZero = True
        DataField = 'SLDATU'
        DataPipeline = ppMovPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 171980
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText54: TppDBText
        UserName = 'ppDBText54'
        DataField = 'S_A'
        DataPipeline = ppMovPatGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 87577
        mmTop = 529
        mmWidth = 7408
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine20: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel81: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel81'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 2910
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc19: TppSystemVariable
        UserName = 'Calc19'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 2910
        mmWidth = 39158
        BandType = 8
      end
      object ppCalc20: TppSystemVariable
        UserName = 'ppCalc201'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryTermo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT L.NOME AS DESCLOCAL,P.NOME AS NOMERESP,TA.DESCTIPOAREA,B.' +
        'PLACA,B.DESBEM'
      'FROM   BEM         B,'
      '       CONJUNTO    C,'
      '       LOCALIZACAO L,'
      '       TIPOAREA    TA,'
      '       RESPONSAVEL R,'
      '       PESSOA      P'
      'WHERE  (C.IDCONJUNTO    = B.IDCONJUNTO)'
      '  AND  (C.IDLOCALIZACAO = L.IDLOCALIZACAO)'
      '  AND  (L.IDTIPOAREA    = TA.IDTIPOAREA)'
      '  AND  (C.IDRESPONSAVEL = R.IDRESPONSAVEL)'
      '  AND  (P.IDPESSOA      = R.IDRESPONSAVEL)'
      '')
    ValidateWithMask = True
    Left = 199
    Top = 47
    object qryTermoDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Origin = '"CM.LOCALIZACAO".NOME'
      Size = 60
    end
    object qryTermoNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryTermoDESCTIPOAREA: TStringField
      FieldName = 'DESCTIPOAREA'
      Origin = 'TIPOAREA.DESCTIPOAREA'
      Size = 30
    end
    object qryTermoPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = '"CM.BEM".PLACA'
    end
    object qryTermoDESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = '"CM.BEM".DESBEM'
      Size = 200
    end
  end
  object dsTermo: TwwDataSource
    DataSet = qryTermo
    Left = 200
    Top = 35
  end
  object ppTermo: TppBDEPipeline
    DataSource = dsTermo
    UserName = 'Termo'
    Left = 199
    Top = 22
  end
  object rpTermo: TppReport
    AutoStop = False
    DataPipeline = ppTermo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 200
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33073
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'ppLabel6'
        AutoSize = False
        Caption = 'Termo de Responsabilidade / Ítens de Patrimônio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 19050
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel7: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel7'
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
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
    end
    object ppDetailBand11: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object rpTermoDBText4: TppDBText
        UserName = 'rpTermoDBText4'
        DataField = 'PLACA'
        DataPipeline = ppTermo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 1058
        mmWidth = 22754
        BandType = 4
      end
      object rpTermoDBText5: TppDBText
        UserName = 'rpTermoDBText5'
        DataField = 'DESBEM'
        DataPipeline = ppTermo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 34660
        mmTop = 1058
        mmWidth = 161132
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine22: TppLine
        UserName = 'ppLine22'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel79: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel79'
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
        mmWidth = 80963
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
        mmLeft = 81756
        mmTop = 1588
        mmWidth = 33867
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
        mmLeft = 161925
        mmTop = 1588
        mmWidth = 35454
        BandType = 8
      end
    end
    object rpTermoGroup1: TppGroup
      BreakName = 'DESCLOCAL'
      DataPipeline = ppTermo
      NewPage = True
      ResetPageNo = True
      ReprintOnSubsequentPage = False
      UserName = 'rpTermoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpTermoGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 107421
        mmPrintPosition = 0
        object rpTermoLabel1: TppLabel
          UserName = 'rpTermoLabel1'
          Caption = 'Localização dos Bens'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 4498
          mmTop = 21431
          mmWidth = 44715
          BandType = 3
          GroupNo = 0
        end
        object rpTermoDBText1: TppDBText
          UserName = 'rpTermoDBText1'
          DataField = 'DESCLOCAL'
          DataPipeline = ppTermo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          mmHeight = 4763
          mmLeft = 4498
          mmTop = 26194
          mmWidth = 188119
          BandType = 3
          GroupNo = 0
        end
        object rpTermoLabel2: TppLabel
          UserName = 'rpTermoLabel2'
          Caption = 'Área'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 4498
          mmTop = 35190
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object rpTermoDBText3: TppDBText
          UserName = 'rpTermoDBText3'
          DataField = 'DESCTIPOAREA'
          DataPipeline = ppTermo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          mmHeight = 4763
          mmLeft = 4498
          mmTop = 39952
          mmWidth = 188119
          BandType = 3
          GroupNo = 0
        end
        object rpTextodoTermo: TppMemo
          UserName = 'rpTextodoTermo'
          Caption = 'rpTextodoTermo'
          CharWrap = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Lines.Strings = (
            
              'Declaro para os devidos fins de direito que os bens abaixo relac' +
              'ionados,  encontram-se  em  plenas condições de uso, responsabil' +
              'izando-me pela guarda e manuseio dos mesmos, sendo que em caso d' +
              'e perdas ou extravios, ocasionado por mau uso ou imprudência, se' +
              'rá submetido a apreciação para as providências cabíveis.'
            
              'Comprometo-me também que qualquer movimentação dos bens será com' +
              'unicada imediatamente ao Departamento de Patrimônio através de d' +
              'ocumento próprio.')
          Stretch = True
          TextAlignment = taFullJustified
          Transparent = True
          mmHeight = 33338
          mmLeft = 4498
          mmTop = 51594
          mmWidth = 188119
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpTermoLine1: TppLine
          UserName = 'rpTermoLine1'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 2117
          mmLeft = 0
          mmTop = 99484
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rpTermoLine2: TppLine
          UserName = 'rpTermoLine2'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 106363
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rpTermoLabel4: TppLabel
          UserName = 'rpTermoLabel4'
          Caption = 'Tombamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 4498
          mmTop = 101071
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object rpTermoLabel5: TppLabel
          UserName = 'rpTermoLabel5'
          Caption = 'Descrição'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 34660
          mmTop = 101071
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
      end
      object rpTermoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 33073
        mmPrintPosition = 0
        object rpTermoLine3: TppLine
          UserName = 'rpTermoLine3'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 265
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object rpTermoLabel3: TppLabel
          UserName = 'rpTermoLabel3'
          Caption = 'Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 4498
          mmTop = 4498
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object rpTermoDBText2: TppDBText
          UserName = 'rpTermoDBText2'
          DataField = 'NOMERESP'
          DataPipeline = ppTermo
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = []
          Transparent = True
          mmHeight = 4763
          mmLeft = 4498
          mmTop = 9260
          mmWidth = 190500
          BandType = 5
          GroupNo = 0
        end
        object rpTermoLabel6: TppLabel
          UserName = 'rpTermoLabel6'
          Caption = 'Assinatura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 4498
          mmTop = 17992
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object rpTermoLine4: TppLine
          UserName = 'rpTermoLine4'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 4498
          mmTop = 31221
          mmWidth = 93927
          BandType = 5
          GroupNo = 0
        end
        object rpTermoLabel7: TppLabel
          UserName = 'rpTermoLabel7'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 106363
          mmTop = 17992
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object rpTermoLine5: TppLine
          UserName = 'rpTermoLine5'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 106363
          mmTop = 31221
          mmWidth = 45244
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryMovBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.PLACA,'
      '       B.IDBEM,'
      '       B.DESBEM AS DESCBEM,'
      '       G.CLASSE,'
      '       G.NOME AS DESCGRUPO,'
      '       HM.DATAMOVIMENTACAO,'
      '       TM.DESCTIPOMOVIMENTACAO,'
      '       NVL(HM.VALOFI, 0) AS VALOFI,'
      '       (NVL(SCB.VALORG,0)         + NVL(SCB.CMBEM,0) -'
      '        NVL(SCB.DEPLANC,0)        - NVL(SCB.CMDEP,0) +'
      '        NVL(SCB.REAVVALORG,0)     + NVL(SCB.REAVCMBEM,0) -'
      '        NVL(SCB.REAVDEPLANC,0)    - NVL(SCB.REAVCMDEP,0) +'
      '        NVL(SCB.ULTREAVVALORG,0)  + NVL(SCB.ULTREAVCMBEM,0) -'
      
        '        NVL(SCB.ULTREAVDEPLANC,0) - NVL(SCB.ULTREAVCMDEP,0)) AS ' +
        'VALCTB'
      'FROM   BEM B, GRUPO G, HISTORICOMOVIMENTACAO HM,'
      '       TIPOMOVIMENTACAO TM, SALDOCONTABBEM SCB'
      
        'WHERE ((HM.DATAMOVIMENTACAO >= :PDATAMOVINI) and (HM.DATAMOVIMEN' +
        'TACAO <= :PDATAMOVFIM))'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      ''
      ''
      ''
      '  AND (B.IDBEM               = HM.IDBEM)'
      '  AND (B.IDPESSOA            = HM.IDPESSOA)'
      '  AND (B.IDGRUPO             = G.IDGRUPO)'
      '  AND (HM.IDTIPOMOVIMENTACAO = TM.IDTIPOMOVIMENTACAO)'
      '  AND (HM.IDBEM              = SCB.IDBEM(+))'
      '  AND (HM.IDPESSOA           = SCB.IDPESSOA(+))'
      '  AND (HM.DATAMOVIMENTACAO   = SCB.DATASLDBEM(+))'
      
        'ORDER BY G.CLASSE, B.PLACA, HM.IDBEM, HM.DATAMOVIMENTACAO, HM.ID' +
        'MOVIMENTACAO'
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 117
    Top = 48
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAMOVINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOVFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryMovBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryMovBemIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryMovBemDESCBEM: TStringField
      FieldName = 'DESCBEM'
      Size = 200
    end
    object qryMovBemCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 15
    end
    object qryMovBemDATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
    end
    object qryMovBemDESCTIPOMOVIMENTACAO: TStringField
      FieldName = 'DESCTIPOMOVIMENTACAO'
      Size = 40
    end
    object qryMovBemVALOFI: TFloatField
      FieldName = 'VALOFI'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryMovBemDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryMovBemVALCTB: TFloatField
      FieldName = 'VALCTB'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
  end
  object dsMovBem: TwwDataSource
    DataSet = qryMovBem
    Left = 119
    Top = 36
  end
  object ppMovBem: TppBDEPipeline
    DataSource = dsMovBem
    UserName = 'MovBem'
    Left = 118
    Top = 23
  end
  object rpMovBem: TppReport
    AutoStop = False
    DataPipeline = ppMovBem
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 118
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand16: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        UserName = 'ppLabel24'
        Caption = 'Extrato de Movimentação dos Bens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 62971
        mmTop = 8731
        mmWidth = 71438
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'ppLine33'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel38: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel38'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpMovBemLabel6: TppLabel
        UserName = 'rpMovBemLabel6'
        Caption = 'Movimentação de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 56621
        mmTop = 14817
        mmWidth = 31750
        BandType = 0
      end
      object rpMovBemLabel7: TppLabel
        UserName = 'rpMovBemLabel7'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 89429
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object rpMovBemLabel8: TppLabel
        UserName = 'rpMovBemLabel8'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 119592
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object rpMovBemLabel9: TppLabel
        UserName = 'rpMovBemLabel9'
        Caption = 'até'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 111919
        mmTop = 14817
        mmWidth = 6350
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object rpMovBemDBText4: TppDBText
        UserName = 'rpMovBemDBText4'
        DataField = 'DATAMOVIMENTACAO'
        DataPipeline = ppMovBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object rpMovBemDBText5: TppDBText
        UserName = 'rpMovBemDBText5'
        DataField = 'DESCTIPOMOVIMENTACAO'
        DataPipeline = ppMovBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 26723
        mmTop = 0
        mmWidth = 98690
        BandType = 4
      end
      object rpMovBemDBText6: TppDBText
        UserName = 'rpMovBemDBText6'
        DataField = 'VALOFI'
        DataPipeline = ppMovBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 134938
        mmTop = 0
        mmWidth = 29104
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VALCTB'
        DataPipeline = ppMovBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 171186
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
    end
    object ppFooterBand16: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine34: TppLine
        UserName = 'ppLine34'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel39: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel39'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 57679
        BandType = 8
      end
      object ppCalc31: TppSystemVariable
        UserName = 'Calc31'
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
      object ppCalc32: TppSystemVariable
        UserName = 'Calc32'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 73290
        mmTop = 1323
        mmWidth = 50800
        BandType = 8
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'CLASSE'
      DataPipeline = ppMovBem
      NewPage = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object rpMovBemLabel1: TppLabel
          UserName = 'rpMovBemLabel1'
          Caption = 'GRUPO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object rpMovBemDBText1: TppDBText
          UserName = 'rpMovBemDBText1'
          DataField = 'DESCGRUPO'
          DataPipeline = ppMovBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 13229
          mmTop = 0
          mmWidth = 183092
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpMovBemGroup1: TppGroup
      BreakName = 'IDBEM'
      DataPipeline = ppMovBem
      UserName = 'rpMovBemGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpMovBemGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object rpMovBemLine2: TppLine
          UserName = 'rpMovBemLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 11906
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object rpMovBemLabel2: TppLabel
          UserName = 'rpMovBemLabel2'
          Caption = 'Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemCalc1: TppVariable
          OnPrint = rpMovBemCalc1Print
          UserName = 'rpMovBemCalc1'
          CalcOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 8202
          mmTop = 1058
          mmWidth = 23548
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemDBText2: TppDBText
          UserName = 'rpMovBemDBText2'
          DataField = 'DESCBEM'
          DataPipeline = ppMovBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 32544
          mmTop = 794
          mmWidth = 163248
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemLabel5: TppLabel
          UserName = 'rpMovBemLabel5'
          Caption = 'Valor Movimentado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 134938
          mmTop = 6879
          mmWidth = 32808
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Saldo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 171186
          mmTop = 6879
          mmWidth = 25135
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemLabel4: TppLabel
          UserName = 'rpMovBemLabel4'
          Caption = 'Tipo do Movimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 26723
          mmTop = 6879
          mmWidth = 32808
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemLabel3: TppLabel
          UserName = 'rpMovBemLabel3'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 6879
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object rpMovBemLine1: TppLine
          UserName = 'rpMovBemLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 1
        end
      end
      object rpMovBemGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 265
        mmPrintPosition = 0
      end
    end
  end
  object ppInvPat: TppBDEPipeline
    DataSource = dsInvPat
    UserName = 'InvPat'
    Left = 584
    Top = 216
  end
  object dsInvPat: TwwDataSource
    DataSet = qryInvPat
    Left = 536
    Top = 211
  end
  object qryInvPat: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT L.NOME       AS DESCLOCAL,'
      '       PR.NOME      AS NOMERESP,'
      '       CB.DESCRICAO AS DESCCLASSE,'
      '       B.PLACA,'
      '       B.DESBEM'
      'FROM BEM         B,'
      '     CONJUNTO    C,'
      '     CLASSEDEBEM CB,'
      '     LOCALIZACAO L,'
      '     PESSOA      PR'
      'WHERE (B.IDPESSOA       = :PIDPESSOA)'
      ''
      ''
      ''
      ''
      ''
      ''
      '  AND ((B.BAIXATOTAL = '#39'N'#39') OR (B.BAIXATOTAL IS NULL))'
      '  AND (B.IDCONJUNTO     = C.IDCONJUNTO(+))'
      '  AND (C.IDLOCALIZACAO  = L.IDLOCALIZACAO(+))'
      '  AND (C.IDRESPONSAVEL  = PR.IDPESSOA(+))'
      '  AND (B.IDCLASSEBEM    = CB.IDCLASSEBEM(+))'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 568
    Top = 166
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryInvPatDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qryInvPatNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qryInvPatDESCCLASSE: TStringField
      FieldName = 'DESCCLASSE'
      Size = 60
    end
    object qryInvPatPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryInvPatDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
  end
  object rpInvPat: TppReport
    AutoStop = False
    DataPipeline = ppInvPat
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
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
    Left = 536
    Top = 162
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand17: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel40: TppLabel
        UserName = 'ppLabel40'
        Caption = 'Inventário Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 77258
        mmTop = 8731
        mmWidth = 43921
        BandType = 0
      end
      object ppLabel41: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel41'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object ppDetailBand17: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object rpInvPatDBText4: TppDBText
        UserName = 'rpInvPatDBText4'
        DataField = 'PLACA'
        DataPipeline = ppInvPat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 27252
        BandType = 4
      end
      object rpInvPatDBText5: TppDBText
        UserName = 'rpInvPatDBText5'
        DataField = 'DESBEM'
        DataPipeline = ppInvPat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 31221
        mmTop = 529
        mmWidth = 89165
        BandType = 4
      end
      object rpInvPatShape1: TppShape
        UserName = 'rpInvPatShape1'
        Shape = stSquare
        mmHeight = 4233
        mmLeft = 121444
        mmTop = 265
        mmWidth = 5821
        BandType = 4
      end
      object rpInvPatShape2: TppShape
        UserName = 'rpInvPatShape2'
        Shape = stSquare
        mmHeight = 4233
        mmLeft = 133350
        mmTop = 265
        mmWidth = 5821
        BandType = 4
      end
      object rpInvPatShape3: TppShape
        UserName = 'rpInvPatShape3'
        Shape = stSquare
        mmHeight = 4233
        mmLeft = 161925
        mmTop = 265
        mmWidth = 5821
        BandType = 4
      end
      object rpInvPatLabel7: TppLabel
        UserName = 'rpInvPatLabel7'
        Caption = 'Ok'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 127265
        mmTop = 529
        mmWidth = 3969
        BandType = 4
      end
      object rpInvPatLabel8: TppLabel
        UserName = 'rpInvPatLabel8'
        Caption = 'Não Encontrado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 138907
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object rpInvPatLabel9: TppLabel
        UserName = 'rpInvPatLabel9'
        Caption = 'Outro Setor _________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 167482
        mmTop = 529
        mmWidth = 29369
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLine36: TppLine
        UserName = 'ppLine36'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel42: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel42'
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
        mmWidth = 71438
        BandType = 8
      end
      object ppCalc33: TppSystemVariable
        UserName = 'Calc33'
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
      object ppCalc34: TppSystemVariable
        UserName = 'Calc34'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 72496
        mmTop = 1588
        mmWidth = 52123
        BandType = 8
      end
    end
    object rpInvPatGroup1: TppGroup
      BreakName = 'DESCLOCAL'
      DataPipeline = ppInvPat
      NewPage = True
      ResetPageNo = True
      UserName = 'rpInvPatGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpInvPatGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppLine35: TppLine
          UserName = 'ppLine35'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197379
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatLabel1: TppLabel
          UserName = 'rpInvPatLabel1'
          Caption = 'Localização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatLabel2: TppLabel
          UserName = 'rpInvPatLabel2'
          Caption = 'Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 92340
          mmTop = 794
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatDBText1: TppDBText
          UserName = 'rpInvPatDBText1'
          DataField = 'DESCLOCAL'
          DataPipeline = ppInvPat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 21431
          mmTop = 794
          mmWidth = 68792
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatDBText2: TppDBText
          UserName = 'rpInvPatDBText2'
          DataField = 'NOMERESP'
          DataPipeline = ppInvPat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 114829
          mmTop = 794
          mmWidth = 82021
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatLabel3: TppLabel
          UserName = 'rpInvPatLabel3'
          Caption = 'Nº Tombamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 7144
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatLabel4: TppLabel
          UserName = 'rpInvPatLabel4'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 31221
          mmTop = 7144
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object rpInvPatLabel5: TppLabel
          UserName = 'rpInvPatLabel5'
          Caption = 'Situação do Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 143404
          mmTop = 7408
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
      end
      object rpInvPatGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object rpInvPatGroup2: TppGroup
      BreakName = 'DESCCLASSE'
      DataPipeline = ppInvPat
      UserName = 'rpInvPatGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpInvPatGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object rpInvPatLabel6: TppLabel
          UserName = 'rpInvPatLabel6'
          Caption = 'Classe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1058
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object rpInvPatDBText3: TppDBText
          UserName = 'rpInvPatDBText3'
          DataField = 'DESCCLASSE'
          DataPipeline = ppInvPat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 11642
          mmTop = 1058
          mmWidth = 185209
          BandType = 3
          GroupNo = 1
        end
      end
      object rpInvPatGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object updSelBxBens: TUpdateSQL
    ModifySQL.Strings = (
      'update SELBAIXA'
      'set'
      '  VALCTB = :VALCTB'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into SELBAIXA'
      '  (VALCTB)'
      'values'
      '  (:VALCTB)')
    DeleteSQL.Strings = (
      'delete from SELBAIXA'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 450
    Top = 61
  end
  object qrySelBxBens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SB.SBXTERMO, SB.IDSELBAIXA,'
      '       SB.SBXPROCESSO,'
      '       SB.SBXDATA,'
      '       PR.NOME AS NOMERESP, PD.NOME AS NOMEDEST,'
      '       B.PLACA,'
      '       B.IDBEM, SBB.IDPESSOA,'
      '       B.DESBEM AS DESCBEM,'
      '       B.VALORG AS VALAQUIS,'
      '       (0)      AS VALCTB,'
      '       SB.SBXFLGEXECUTADO,'
      '       SB.SBXDTAEXECUTADO'
      'FROM'
      '       SELBAIXA SB,'
      '       SELBAIXABENS SBB,'
      '       BEM B,'
      '       PESSOA PR,'
      '       PESSOA PD'
      'WHERE'
      ''
      ''
      ''
      ''
      '      (SB.SBTIPOMOV  = 0)'
      '  AND (SB.IDSELBAIXA = SBB.IDSELBAIXA)'
      '  AND (SBB.IDBEM     = B.IDBEM)'
      '  AND (SBB.IDPESSOA  = B.IDPESSOA)'
      '  AND (SB.IDRESPONSAVEL = PR.IDPESSOA(+))'
      '  AND (SB.IDDESTINOBAIXA = PD.IDPESSOA(+))'
      ''
      ''
      ' '
      ' ')
    UpdateObject = updSelBxBens
    ValidateWithMask = True
    Left = 449
    Top = 48
    object qrySelBxBensSBXTERMO: TFloatField
      FieldName = 'SBXTERMO'
    end
    object qrySelBxBensIDSELBAIXA: TFloatField
      FieldName = 'IDSELBAIXA'
    end
    object qrySelBxBensSBXPROCESSO: TStringField
      FieldName = 'SBXPROCESSO'
      Size = 80
    end
    object qrySelBxBensSBXDATA: TDateTimeField
      FieldName = 'SBXDATA'
    end
    object qrySelBxBensNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qrySelBxBensNOMEDEST: TStringField
      FieldName = 'NOMEDEST'
      Size = 60
    end
    object qrySelBxBensPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qrySelBxBensIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qrySelBxBensIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySelBxBensDESCBEM: TStringField
      FieldName = 'DESCBEM'
      Size = 200
    end
    object qrySelBxBensVALAQUIS: TFloatField
      FieldName = 'VALAQUIS'
    end
    object qrySelBxBensVALCTB: TFloatField
      FieldName = 'VALCTB'
    end
    object qrySelBxBensSBXFLGEXECUTADO: TFloatField
      FieldName = 'SBXFLGEXECUTADO'
    end
    object qrySelBxBensSBXDTAEXECUTADO: TDateTimeField
      FieldName = 'SBXDTAEXECUTADO'
    end
  end
  object dsSelBxBens: TwwDataSource
    DataSet = qrySelBxBens
    Left = 451
    Top = 36
  end
  object ppSelBxBens: TppBDEPipeline
    DataSource = dsSelBxBens
    UserName = 'SelBxBens'
    Left = 451
    Top = 23
  end
  object updConsCafContab: TUpdateSQL
    ModifySQL.Strings = (
      'update LANCAMENTO'
      'set'
      '  DATA = :DATA,'
      '  CONTACONTABIL = :CONTACONTABIL,'
      '  CENTROCUSTO = :CENTROCUSTO,'
      '  VLCONTABDEB = :VLCONTABDEB,'
      '  VLCONTABCRE = :VLCONTABCRE,'
      '  VLCAFDEB = :VLCAFDEB,'
      '  VLCAFCRE = :VLCAFCRE,'
      '  DIFVALDEB = :DIFVALDEB,'
      '  DIFVALCRE = :DIFVALCRE'
      'where'
      '  DATA = :OLD_DATA and'
      '  CONTACONTABIL = :OLD_CONTACONTABIL and'
      '  CENTROCUSTO = :OLD_CENTROCUSTO')
    InsertSQL.Strings = (
      'insert into LANCAMENTO'
      
        '  (DATA, CONTACONTABIL, CENTROCUSTO, VLCONTABDEB, VLCONTABCRE, V' +
        'LCAFDEB, '
      '   VLCAFCRE, DIFVALDEB, DIFVALCRE)'
      'values'
      
        '  (:DATA, :CONTACONTABIL, :CENTROCUSTO, :VLCONTABDEB, :VLCONTABC' +
        'RE, :VLCAFDEB, '
      '   :VLCAFCRE, :DIFVALDEB, :DIFVALCRE)')
    DeleteSQL.Strings = (
      'delete from LANCAMENTO'
      'where'
      '  DATA = :OLD_DATA and'
      '  CONTACONTABIL = :OLD_CONTACONTABIL and'
      '  CENTROCUSTO = :OLD_CENTROCUSTO')
    Left = 296
    Top = 60
  end
  object qryConsCafContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLN.PLNDATDIA      AS DATA,'
      '       LAC.PLACONTA       AS CONTACONTABIL,'
      '       LAC.CODCENTROCUSTO AS CENTROCUSTO,'
      '       (0) AS VLCONTABDEB,'
      '       (0) AS VLCONTABCRE,'
      '       (0) AS VLCAFDEB,'
      '       (0) AS VLCAFCRE,'
      '       (0) AS DIFVALDEB,'
      '       (0) AS DIFVALCRE'
      'FROM LANCAMENTO LAC,'
      '     PLANILHA   PLN'
      'WHERE (PLN.PLNCODIGO IS NULL)'
      '  AND (PLN.PLNDATDIA >= :PDATAINI)'
      '  AND (PLN.PLNDATDIA <= :PDATAFIM)'
      '  AND (PLN.PLNCODIGO = LAC.PLNCODIGO)'
      'ORDER BY PLN.PLNDATDIA, LAC.PLACONTA, LAC.CODCENTROCUSTO'
      '')
    UpdateObject = updConsCafContab
    ValidateWithMask = True
    Left = 296
    Top = 48
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end>
    object qryConsCafContabDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryConsCafContabCONTACONTABIL: TStringField
      FieldName = 'CONTACONTABIL'
      Size = 18
    end
    object qryConsCafContabCENTROCUSTO: TStringField
      FieldName = 'CENTROCUSTO'
      Size = 10
    end
    object qryConsCafContabVLCONTABDEB: TFloatField
      FieldName = 'VLCONTABDEB'
    end
    object qryConsCafContabVLCONTABCRE: TFloatField
      FieldName = 'VLCONTABCRE'
    end
    object qryConsCafContabVLCAFDEB: TFloatField
      FieldName = 'VLCAFDEB'
    end
    object qryConsCafContabVLCAFCRE: TFloatField
      FieldName = 'VLCAFCRE'
    end
    object qryConsCafContabDIFVALDEB: TFloatField
      FieldName = 'DIFVALDEB'
    end
    object qryConsCafContabDIFVALCRE: TFloatField
      FieldName = 'DIFVALCRE'
    end
  end
  object ppConsCafContab: TppBDEPipeline
    DataSource = dsConsCafContab
    UserName = 'ConsCafContab'
    Left = 296
    Top = 35
  end
  object dsConsCafContab: TwwDataSource
    DataSet = qryConsCafContab
    Left = 296
    Top = 22
  end
  object rpConsCafContab: TppReport
    AutoStop = False
    DataPipeline = ppConsCafContab
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
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
    Left = 296
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand26: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30692
      mmPrintPosition = 0
      object ppLabel155: TppLabel
        UserName = 'ppLabel155'
        Caption = 'Conciliação entre Ativo Fixo e Contabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 43921
        mmTop = 8467
        mmWidth = 109273
        BandType = 0
      end
      object ppLabel156: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel156'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object RptConAlmoxContabLine1: TppLine
        UserName = 'RptConAlmoxContabLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 29633
        mmWidth = 197379
        BandType = 0
      end
      object LbPer13: TppLabel
        UserName = 'LbPer13'
        Caption = 'De 01/01/1999 a 01/01/1999 '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 15346
        mmWidth = 45773
        BandType = 0
      end
      object RptConAlmoxContabLabel5: TppLabel
        UserName = 'RptConAlmoxContabLabel5'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 53711
        mmTop = 26194
        mmWidth = 9260
        BandType = 0
      end
      object RptConAlmoxContabLabel6: TppLabel
        UserName = 'RptConAlmoxContabLabel6'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 109802
        mmTop = 26194
        mmWidth = 9260
        BandType = 0
      end
      object RptConAlmoxContabLabel7: TppLabel
        UserName = 'RptConAlmoxContabLabel7'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 132292
        mmTop = 26194
        mmWidth = 10848
        BandType = 0
      end
      object RptConAlmoxContabLabel8: TppLabel
        UserName = 'RptConAlmoxContabLabel8'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 180711
        mmTop = 26194
        mmWidth = 10848
        BandType = 0
      end
      object RptConAlmoxContabLabel9: TppLabel
        UserName = 'RptConAlmoxContabLabel9'
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 159809
        mmTop = 26194
        mmWidth = 9260
        BandType = 0
      end
      object RptConAlmoxContabLabel10: TppLabel
        UserName = 'RptConAlmoxContabLabel10'
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 26194
        mmWidth = 10848
        BandType = 0
      end
      object ppLine70: TppLine
        UserName = 'ppLine70'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 20902
        mmWidth = 197379
        BandType = 0
      end
      object RptConAlmoxContabLabel1: TppLabel
        UserName = 'RptConAlmoxContabLabel1'
        Caption = '  Contabilidade  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        mmHeight = 3969
        mmLeft = 57415
        mmTop = 21167
        mmWidth = 23813
        BandType = 0
      end
      object RptConAlmoxContabLabel2: TppLabel
        UserName = 'RptConAlmoxContabLabel2'
        Caption = ' Ativo Fixo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        mmHeight = 3969
        mmLeft = 116152
        mmTop = 21167
        mmWidth = 16404
        BandType = 0
      end
      object RptConAlmoxContabLabel3: TppLabel
        UserName = 'RptConAlmoxContabLabel3'
        Caption = '  Diferenças  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        mmHeight = 3969
        mmLeft = 163248
        mmTop = 21167
        mmWidth = 19844
        BandType = 0
      end
      object rpConsCafContabLabel1: TppLabel
        UserName = 'rpConsCafContabLabel1'
        AutoSize = False
        Caption = 'Conta Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 529
        mmTop = 21167
        mmWidth = 25665
        BandType = 0
      end
      object rpConsCafContabLabel2: TppLabel
        UserName = 'rpConsCafContabLabel2'
        AutoSize = False
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 529
        mmTop = 25929
        mmWidth = 25929
        BandType = 0
      end
    end
    object ppDetailBand20: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptConAlmoxContabDBText2: TppDBText
        UserName = 'RptConAlmoxContabDBText2'
        AutoSize = True
        DataField = 'VLCONTABDEB'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 42069
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object RptConAlmoxContabDBText3: TppDBText
        UserName = 'RptConAlmoxContabDBText3'
        AutoSize = True
        DataField = 'VLCONTABCRE'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 69850
        mmTop = 0
        mmWidth = 21167
        BandType = 4
      end
      object RptConAlmoxContabDBText4: TppDBText
        UserName = 'RptConAlmoxContabDBText4'
        AutoSize = True
        DataField = 'VLCAFDEB'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 110596
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object RptConAlmoxContabDBText5: TppDBText
        UserName = 'RptConAlmoxContabDBText5'
        AutoSize = True
        DataField = 'DIFVALCRE'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 181505
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object RptConAlmoxContabDBText6: TppDBText
        UserName = 'RptConAlmoxContabDBText6'
        AutoSize = True
        DataField = 'DIFVALDEB'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 159015
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object RptConAlmoxContabDBText7: TppDBText
        UserName = 'RptConAlmoxContabDBText7'
        AutoSize = True
        DataField = 'VLCAFCRE'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 134673
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object rpConsCafContabDBText1: TppDBText
        UserName = 'rpConsCafContabDBText1'
        DataField = 'CENTROCUSTO'
        DataPipeline = ppConsCafContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 31485
        BandType = 4
      end
    end
    object ppFooterBand26: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine71: TppLine
        UserName = 'ppLine71'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel179: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel179'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 62706
        BandType = 8
      end
      object ppCalc50: TppSystemVariable
        UserName = 'ppCalc501'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 77788
        mmTop = 529
        mmWidth = 41804
        BandType = 8
      end
      object ppCalc51: TppSystemVariable
        UserName = 'Calc51'
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
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptConAlmoxContabSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object RptConAlmoxContabLabel13: TppLabel
        UserName = 'RptConAlmoxContabLabel13'
        Caption = 'TOTAL :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 529
        mmTop = 0
        mmWidth = 11642
        BandType = 7
      end
      object RptConAlmoxContabDBCalc1: TppDBCalc
        UserName = 'RptConAlmoxContabDBCalc1'
        AutoSize = True
        DataField = 'VLCONTABDEB'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 31485
        mmTop = 0
        mmWidth = 31485
        BandType = 7
      end
      object RptConAlmoxContabDBCalc2: TppDBCalc
        UserName = 'RptConAlmoxContabDBCalc2'
        AutoSize = True
        DataField = 'VLCONTABCRE'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 59267
        mmTop = 0
        mmWidth = 31750
        BandType = 7
      end
      object RptConAlmoxContabDBCalc3: TppDBCalc
        UserName = 'RptConAlmoxContabDBCalc3'
        AutoSize = True
        DataField = 'VLCAFDEB'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 100013
        mmTop = 0
        mmWidth = 25400
        BandType = 7
      end
      object RptConAlmoxContabDBCalc4: TppDBCalc
        UserName = 'RptConAlmoxContabDBCalc4'
        AutoSize = True
        DataField = 'VLCAFCRE'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 123825
        mmTop = 0
        mmWidth = 25665
        BandType = 7
      end
      object RptConAlmoxContabDBCalc5: TppDBCalc
        UserName = 'RptConAlmoxContabDBCalc5'
        AutoSize = True
        DataField = 'DIFVALDEB'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 148432
        mmTop = 0
        mmWidth = 26194
        BandType = 7
      end
      object RptConAlmoxContabDBCalc6: TppDBCalc
        UserName = 'RptConAlmoxContabDBCalc6'
        AutoSize = True
        DataField = 'DIFVALCRE'
        DataPipeline = ppConsCafContab
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 170657
        mmTop = 0
        mmWidth = 26458
        BandType = 7
      end
    end
    object rpConsCafContabGroup1: TppGroup
      BreakName = 'DATA'
      DataPipeline = ppConsCafContab
      UserName = 'rpConsCafContabGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpConsCafContabGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object rpConsCafContabDBText3: TppDBText
          UserName = 'rpConsCafContabDBText3'
          DataField = 'DATA'
          DataPipeline = ppConsCafContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 529
          mmTop = 0
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
      end
      object rpConsCafContabGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 794
        mmPrintPosition = 0
        object rpConsCafContabLine3: TppLine
          UserName = 'rpConsCafContabLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 0
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpConsCafContabGroup2: TppGroup
      BreakName = 'CONTACONTABIL'
      DataPipeline = ppConsCafContab
      UserName = 'rpConsCafContabGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpConsCafContabGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object rpConsCafContabDBText2: TppDBText
          UserName = 'rpConsCafContabDBText2'
          DataField = 'CONTACONTABIL'
          DataPipeline = ppConsCafContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 529
          mmTop = 0
          mmWidth = 31485
          BandType = 3
          GroupNo = 1
        end
        object rpConsCafContabLine1: TppLine
          UserName = 'rpConsCafContabLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 3704
          mmWidth = 197379
          BandType = 3
          GroupNo = 1
        end
      end
      object rpConsCafContabGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 794
        mmPrintPosition = 0
        object rpConsCafContabLine2: TppLine
          UserName = 'rpConsCafContabLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 0
          mmWidth = 197379
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object qryAutSaiMat: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.PLACA, B.DESBEM, B.PUBAUTOR, B.PUBEDITORA, B.PUBANO,'
      '       STB.IDBEM, '
      '       ST.STPTERMO, ST.STPDATA,'
      '       TST.DESCTIPSAITEMP, '
      '       L.NOME AS DESCDESTINO, '
      '       L.ENDERECO, '
      '       P.NOME AS NOMERESPSAIDA, '
      '       ST.STPOBSERVACOES'
      'FROM SAIDATEMPORARIA ST,'
      '     SAIDATEMPBENS   STB,'
      '     BEM             B,'
      '     LOCALIZACAO     L,'
      '     PESSOA          P,'
      '     TIPOSAIDATEMP   TST '
      'WHERE (ST.IDSAIDATEMPORARIA = STB.IDSAIDATEMPORARIA)'
      '  AND (STB.IDBEM            = B.IDBEM)'
      '  AND (STB.IDPESSOA         = B.IDPESSOA)'
      '  AND (ST.IDLOCALIZACAO     = L.IDLOCALIZACAO)'
      '  AND (ST.IDPESSOA          = L.IDPESSOA)'
      '  AND (ST.IDRESPONSAVEL     = P.IDPESSOA)'
      '  AND (ST.IDTIPOSAIDATEMP   = TST.IDTIPOSAIDATEMP)'
      'ORDER BY ST.STPTERMO, B.PLACA')
    ValidateWithMask = True
    Left = 523
    Top = 48
    object qryAutSaiMatPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = '"CM.BEM".PLACA'
    end
    object qryAutSaiMatDESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = '"CM.BEM".DESBEM'
      Size = 200
    end
    object qryAutSaiMatIDBEM: TFloatField
      FieldName = 'IDBEM'
      Origin = 'SAIDATEMPBENS.IDBEM'
    end
    object qryAutSaiMatSTPTERMO: TFloatField
      FieldName = 'STPTERMO'
      Origin = 'SAIDATEMPORARIA.STPTERMO'
    end
    object qryAutSaiMatSTPDATA: TDateTimeField
      FieldName = 'STPDATA'
      Origin = 'SAIDATEMPORARIA.STPDATA'
    end
    object qryAutSaiMatDESCTIPSAITEMP: TStringField
      FieldName = 'DESCTIPSAITEMP'
      Origin = 'TIPOSAIDATEMP.DESCTIPSAITEMP'
      Size = 60
    end
    object qryAutSaiMatDESCDESTINO: TStringField
      FieldName = 'DESCDESTINO'
      Origin = '"CM.LOCALIZACAO".NOME'
      Size = 60
    end
    object qryAutSaiMatENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = '"CM.LOCALIZACAO".ENDERECO'
      Size = 120
    end
    object qryAutSaiMatNOMERESPSAIDA: TStringField
      FieldName = 'NOMERESPSAIDA'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryAutSaiMatSTPOBSERVACOES: TStringField
      FieldName = 'STPOBSERVACOES'
      Origin = 'SAIDATEMPORARIA.STPOBSERVACOES'
      Size = 120
    end
    object qryAutSaiMatPUBAUTOR: TStringField
      FieldName = 'PUBAUTOR'
      Origin = '"CM.BEM".PUBAUTOR'
      Size = 60
    end
    object qryAutSaiMatPUBEDITORA: TStringField
      FieldName = 'PUBEDITORA'
      Origin = '"CM.BEM".PUBEDITORA'
      Size = 60
    end
    object qryAutSaiMatPUBANO: TFloatField
      FieldName = 'PUBANO'
      Origin = '"CM.BEM".PUBANO'
    end
  end
  object dsAutSaiMat: TwwDataSource
    DataSet = qryAutSaiMat
    Left = 523
    Top = 36
  end
  object ppAutSaiMat: TppBDEPipeline
    DataSource = dsAutSaiMat
    UserName = 'AutSaiMat'
    Left = 523
    Top = 23
  end
  object rpAutSaiMat: TppReport
    AutoStop = False
    DataPipeline = ppAutSaiMat
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
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
    Left = 523
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'ppLabel3'
        Caption = 'Autorização para Saída de Material'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 56092
        mmTop = 8731
        mmWidth = 85196
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'ppLine5'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16933
        mmWidth = 197379
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
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        DataField = 'PLACA'
        DataPipeline = ppAutSaiMat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object rpAutSaiMatLine10: TppLine
        UserName = 'rpAutSaiMatLine10'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 4
      end
      object rpAutSaiMatDesBem: TppVariable
        OnPrint = rpAutSaiMatDesBemPrint
        UserName = 'rpAutSaiMatDesBem1'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 29104
        mmTop = 529
        mmWidth = 34925
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel12'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 72496
        BandType = 8
      end
      object rpAutSaiMatLine9: TppLine
        UserName = 'rpAutSaiMatLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 8
      end
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 73290
        mmTop = 1323
        mmWidth = 50800
        BandType = 8
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpAutSaiMatGroup1: TppGroup
      BreakName = 'STPTERMO'
      DataPipeline = ppAutSaiMat
      NewPage = True
      ResetPageNo = True
      UserName = 'rpAutSaiMatGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpAutSaiMatGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rpAutSaiMatLabel1: TppLabel
          UserName = 'rpAutSaiMatLabel1'
          Caption = 'Patrimônio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object rpAutSaiMatLabel2: TppLabel
          UserName = 'rpAutSaiMatLabel2'
          Caption = 'Descrição do Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 29104
          mmTop = 0
          mmWidth = 30956
          BandType = 3
          GroupNo = 0
        end
      end
      object rpAutSaiMatGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 71438
        mmPrintPosition = 0
        object rpAutSaiMatLine2: TppLine
          UserName = 'rpAutSaiMatLine2'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel3: TppLabel
          UserName = 'rpAutSaiMatLabel3'
          Caption = 'Motivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 794
          mmWidth = 11113
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText1: TppDBText
          UserName = 'rpAutSaiMatDBText1'
          AutoSize = True
          DataField = 'DESCTIPSAITEMP'
          DataPipeline = ppAutSaiMat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 24077
          mmTop = 794
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText2: TppDBText
          UserName = 'rpAutSaiMatDBText2'
          AutoSize = True
          DataField = 'STPTERMO'
          DataPipeline = ppAutSaiMat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 24077
          mmTop = 4763
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel4: TppLabel
          UserName = 'rpAutSaiMatLabel4'
          Caption = 'Termo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 4763
          mmWidth = 10848
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel5: TppLabel
          UserName = 'rpAutSaiMatLabel5'
          Caption = 'Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 8731
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText3: TppDBText
          UserName = 'rpAutSaiMatDBText3'
          AutoSize = True
          DataField = 'DESCDESTINO'
          DataPipeline = ppAutSaiMat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 24077
          mmTop = 8731
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText5: TppDBText
          UserName = 'rpAutSaiMatDBText5'
          AutoSize = True
          DataField = 'ENDERECO'
          DataPipeline = ppAutSaiMat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 24077
          mmTop = 12700
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel7: TppLabel
          UserName = 'rpAutSaiMatLabel7'
          Caption = 'Endereço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 12700
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel8: TppLabel
          UserName = 'rpAutSaiMatLabel8'
          Caption = 'Observações'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 16669
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText6: TppDBText
          UserName = 'rpAutSaiMatDBText6'
          AutoSize = True
          DataField = 'STPOBSERVACOES'
          DataPipeline = ppAutSaiMat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 24077
          mmTop = 16669
          mmWidth = 34131
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel9: TppLabel
          UserName = 'rpAutSaiMatLabel9'
          Caption = 'Responsável pela Saída'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 22225
          mmWidth = 40481
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText7: TppDBText
          UserName = 'rpAutSaiMatDBText7'
          AutoSize = True
          DataField = 'NOMERESPSAIDA'
          DataPipeline = ppAutSaiMat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 42333
          mmTop = 22225
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel6: TppLabel
          UserName = 'rpAutSaiMatLabel6'
          Caption = 'Saída em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 160867
          mmTop = 4763
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatDBText4: TppDBText
          UserName = 'rpAutSaiMatDBText4'
          AutoSize = True
          DataField = 'STPDATA'
          DataPipeline = ppAutSaiMat
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 178859
          mmTop = 4763
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine3: TppLine
          UserName = 'rpAutSaiMatLine3'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 26458
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine6: TppLine
          UserName = 'rpAutSaiMatLine6'
          Pen.Width = 2
          Position = lpLeft
          Weight = 1.5
          mmHeight = 43656
          mmLeft = 102129
          mmTop = 26723
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine4: TppLine
          UserName = 'rpAutSaiMatLine4'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 48419
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel10: TppLabel
          UserName = 'rpAutSaiMatLabel10'
          Caption = 'Autorizo a saída do(s) material(is) acima identificado(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 11377
          mmTop = 28575
          mmWidth = 84138
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel12: TppLabel
          UserName = 'rpAutSaiMatLabel12'
          Caption = 'Chefe do Patrimônio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 50271
          mmTop = 43921
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine8: TppLine
          UserName = 'rpAutSaiMatLine8'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 0
          mmTop = 70379
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel13: TppLabel
          UserName = 'rpAutSaiMatLabel13'
          Caption = 'Recebi o(s) material(is) acima identificado(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 117740
          mmTop = 28575
          mmWidth = 67998
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel15: TppLabel
          UserName = 'rpAutSaiMatLabel15'
          Caption = 'Firma / Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 153194
          mmTop = 43921
          mmWidth = 29369
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel16: TppLabel
          UserName = 'rpAutSaiMatLabel16'
          Caption = 'Solicito a saída do(s) material(is) acima identificado(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 9790
          mmTop = 50536
          mmWidth = 82815
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel17: TppLabel
          UserName = 'rpAutSaiMatLabel17'
          Caption = '       /       /         '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 61119
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel18: TppLabel
          UserName = 'rpAutSaiMatLabel18'
          Caption = 'Solicitante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 57679
          mmTop = 65881
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel19: TppLabel
          UserName = 'rpAutSaiMatLabel19'
          Caption = 'Autorizo a liberação do(s) material(is) acima identificado(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 105304
          mmTop = 50536
          mmWidth = 89694
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel21: TppLabel
          UserName = 'rpAutSaiMatLabel21'
          Caption = 'Assinatura / Carimbo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 152400
          mmTop = 65881
          mmWidth = 30692
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine5: TppLine
          UserName = 'rpAutSaiMatLine5'
          Pen.Width = 2
          Position = lpLeft
          Weight = 1.5
          mmHeight = 70379
          mmLeft = 0
          mmTop = 529
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine7: TppLine
          UserName = 'rpAutSaiMatLine7'
          Pen.Width = 2
          Position = lpLeft
          Weight = 1.5
          mmHeight = 70644
          mmLeft = 197115
          mmTop = 265
          mmWidth = 1058
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine1: TppLine
          UserName = 'rpAutSaiMatLine1'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 794
          mmTop = 42863
          mmWidth = 100542
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine11: TppLine
          UserName = 'rpAutSaiMatLine11'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 794
          mmTop = 65088
          mmWidth = 100542
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel11: TppLabel
          UserName = 'rpAutSaiMatLabel11'
          Caption = '       /       /         '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 38894
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel14: TppLabel
          UserName = 'rpAutSaiMatLabel14'
          Caption = '       /       /         '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 102923
          mmTop = 38894
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine12: TppLine
          UserName = 'rpAutSaiMatLine12'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 102923
          mmTop = 42863
          mmWidth = 93398
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLabel20: TppLabel
          UserName = 'rpAutSaiMatLabel20'
          Caption = '       /       /         '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 102923
          mmTop = 61119
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object rpAutSaiMatLine13: TppLine
          UserName = 'rpAutSaiMatLine13'
          Weight = 0.75
          mmHeight = 794
          mmLeft = 102923
          mmTop = 65088
          mmWidth = 93398
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryGuiaTransfBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT (TO_CHAR(SBB.IDSELBAIXA, '#39'0999999999'#39')||'
      '        TO_CHAR(SBB.IDCONJATUAL,'#39'0999999999'#39')||'
      
        '        TO_CHAR(SBB.IDCONJUNTO, '#39'0999999999'#39')) AS TERMOCONJGRUPO' +
        ','
      '       SB.SBXTERMO,'
      '       SB.SBXDATA,'
      '       SB.SBXDTAEXECUTADO,'
      '       LO.NOME     AS NOMELOCORIG,'
      '       LO.ENDERECO AS ENDELOCORIG,'
      '       RO.NOME     AS NOMERSPORIG,'
      '       LD.NOME     AS NOMELOCDEST,'
      '       LD.ENDERECO AS ENDELOCDEST,'
      '       RD.NOME     AS NOMERSPDEST,'
      '       B.PLACA,'
      '       B.DESBEM,'
      '       B.VALORG'
      'FROM SELBAIXA        SB,'
      '     SELBAIXABENS    SBB,'
      '     BEM             B,'
      '     CONJUNTO        CO,'
      '     CONJUNTO        CD,'
      '     LOCALIZACAO     LO,'
      '     LOCALIZACAO     LD,'
      '     PESSOA          RO,'
      '     PESSOA          RD'
      'WHERE (SB.SBTIPOMOV         = 1)'
      '  AND (SB.IDSELBAIXA        = SBB.IDSELBAIXA)'
      '  AND (SBB.IDBEM            = B.IDBEM)'
      '  AND (SBB.IDPESSOA         = B.IDPESSOA)'
      '  AND (SBB.IDCONJATUAL      = CO.IDCONJUNTO(+))'
      '  AND (SBB.IDCONJUNTO       = CD.IDCONJUNTO(+))'
      '  AND (CO.IDLOCALIZACAO     = LO.IDLOCALIZACAO(+))'
      '  AND (CO.IDRESPONSAVEL     = RO.IDPESSOA(+))'
      '  AND (CD.IDLOCALIZACAO     = LD.IDLOCALIZACAO(+))'
      '  AND (CD.IDRESPONSAVEL     = RD.IDPESSOA(+))'
      'ORDER BY (TO_CHAR(SBB.IDSELBAIXA, '#39'0999999999'#39')||'
      '          TO_CHAR(SBB.IDCONJATUAL,'#39'0999999999'#39')||'
      '          TO_CHAR(SBB.IDCONJUNTO, '#39'0999999999'#39')), B.PLACA'
      '')
    ValidateWithMask = True
    Left = 611
    Top = 48
    object qryGuiaTransfBemTERMOCONJGRUPO: TStringField
      FieldName = 'TERMOCONJGRUPO'
      Size = 33
    end
    object qryGuiaTransfBemSBXTERMO: TFloatField
      FieldName = 'SBXTERMO'
    end
    object qryGuiaTransfBemSBXDATA: TDateTimeField
      FieldName = 'SBXDATA'
    end
    object qryGuiaTransfBemSBXDTAEXECUTADO: TDateTimeField
      FieldName = 'SBXDTAEXECUTADO'
    end
    object qryGuiaTransfBemNOMELOCORIG: TStringField
      FieldName = 'NOMELOCORIG'
      Size = 60
    end
    object qryGuiaTransfBemENDELOCORIG: TStringField
      FieldName = 'ENDELOCORIG'
      Size = 120
    end
    object qryGuiaTransfBemNOMERSPORIG: TStringField
      FieldName = 'NOMERSPORIG'
      Size = 60
    end
    object qryGuiaTransfBemNOMELOCDEST: TStringField
      FieldName = 'NOMELOCDEST'
      Size = 60
    end
    object qryGuiaTransfBemENDELOCDEST: TStringField
      FieldName = 'ENDELOCDEST'
      Size = 120
    end
    object qryGuiaTransfBemNOMERSPDEST: TStringField
      FieldName = 'NOMERSPDEST'
      Size = 60
    end
    object qryGuiaTransfBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryGuiaTransfBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryGuiaTransfBemVALORG: TFloatField
      FieldName = 'VALORG'
    end
  end
  object dsGuiaTransfBem: TwwDataSource
    DataSet = qryGuiaTransfBem
    Left = 611
    Top = 36
  end
  object ppGuiaTransfBem: TppBDEPipeline
    DataSource = dsGuiaTransfBem
    UserName = 'GuiaTransfBem'
    Left = 611
    Top = 23
  end
  object rpGuiaTransfBem: TppReport
    AutoStop = False
    DataPipeline = ppGuiaTransfBem
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 611
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppLabel13: TppLabel
        UserName = 'ppLabel13'
        Caption = 'Guia de Transferência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 73025
        mmTop = 8731
        mmWidth = 54504
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'ppLine6'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 17463
        mmWidth = 197379
        BandType = 0
      end
      object ppLabel15: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel15'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'ppDBText9'
        DataField = 'PLACA'
        DataPipeline = ppGuiaTransfBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 16669
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object rpGuiaTransfBemDBMemo1: TppDBMemo
        UserName = 'rpGuiaTransfBemDBMemo1'
        CharWrap = True
        DataField = 'DESBEM'
        DataPipeline = ppGuiaTransfBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 9790
        mmLeft = 43127
        mmTop = 529
        mmWidth = 120915
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpGuiaTransfBemDBText1: TppDBText
        UserName = 'rpGuiaTransfBemDBText1'
        AutoSize = True
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppGuiaTransfBem
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 182827
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpGuiaTransfBemDBCalc3: TppDBCalc
        UserName = 'rpGuiaTransfBemDBCalc3'
        DataField = 'PLACA'
        DataPipeline = ppGuiaTransfBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 4233
        mmLeft = 0
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object rpGuiaTransfBemLine11: TppLine
        UserName = 'rpGuiaTransfBemLine11'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 10848
        mmWidth = 197379
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 62706
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel16'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 58208
        mmWidth = 72496
        BandType = 8
      end
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 56886
        mmWidth = 197379
        BandType = 8
      end
      object rpGuiaTransfBemMemo1: TppMemo
        UserName = 'rpGuiaTransfBemMemo1'
        Caption = 'rpGuiaTransfBemMemo1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Lines.Strings = (
          'Autorizo a movimentação do(s) Bem(ns) Patrimonial(is).')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 9790
        mmLeft = 1323
        mmTop = 1323
        mmWidth = 61648
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpGuiaTransfBemLine1: TppLine
        UserName = 'rpGuiaTransfBemLine1'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.5
        mmHeight = 41804
        mmLeft = 0
        mmTop = 529
        mmWidth = 1323
        BandType = 8
      end
      object rpGuiaTransfBemLine2: TppLine
        UserName = 'rpGuiaTransfBemLine2'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.5
        mmHeight = 41804
        mmLeft = 63500
        mmTop = 529
        mmWidth = 1323
        BandType = 8
      end
      object rpGuiaTransfBemLine3: TppLine
        UserName = 'rpGuiaTransfBemLine3'
        Pen.Width = 2
        Position = lpLeft
        StretchWithParent = True
        Weight = 1.5
        mmHeight = 41804
        mmLeft = 127000
        mmTop = 529
        mmWidth = 1323
        BandType = 8
      end
      object rpGuiaTransfBemLine4: TppLine
        UserName = 'rpGuiaTransfBemLine4'
        Pen.Width = 2
        Position = lpRight
        StretchWithParent = True
        Weight = 1.5
        mmHeight = 41804
        mmLeft = 196321
        mmTop = 529
        mmWidth = 1323
        BandType = 8
      end
      object rpGuiaTransfBemLine5: TppLine
        UserName = 'rpGuiaTransfBemLine5'
        Pen.Width = 2
        StretchWithParent = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 197644
        BandType = 8
      end
      object rpGuiaTransfBemLine6: TppLine
        UserName = 'rpGuiaTransfBemLine6'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 0
        mmTop = 41540
        mmWidth = 197644
        BandType = 8
      end
      object rpGuiaTransfBemMemo2: TppMemo
        UserName = 'rpGuiaTransfBemMemo2'
        Caption = 'rpGuiaTransfBemMemo2'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Lines.Strings = (
          
            'Atesto que recebi os bens patrimoniais constantes neste termo, a' +
            'ssumindo total responsabilidade pela guarda e zelo dos mesmos.'
          '')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 17992
        mmLeft = 128588
        mmTop = 1323
        mmWidth = 67733
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpGuiaTransfBemLabel1: TppLabel
        UserName = 'rpGuiaTransfBemLabel1'
        Caption = 'Em ____/____/__________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 75936
        mmTop = 25400
        mmWidth = 41804
        BandType = 8
      end
      object rpGuiaTransfBemLabel2: TppLabel
        UserName = 'rpGuiaTransfBemLabel2'
        Caption = 'Em ____/____/__________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 25400
        mmWidth = 41804
        BandType = 8
      end
      object rpGuiaTransfBemLabel3: TppLabel
        UserName = 'rpGuiaTransfBemLabel3'
        Caption = 'Em ____/____/__________'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 143404
        mmTop = 25400
        mmWidth = 41804
        BandType = 8
      end
      object rpGuiaTransfBemLine7: TppLine
        UserName = 'rpGuiaTransfBemLine7'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 265
        mmTop = 36777
        mmWidth = 197380
        BandType = 8
      end
      object rpGuiaTransfBemLabel4: TppLabel
        UserName = 'rpGuiaTransfBemLabel4'
        Caption = 'Ass./Carimbo Patrimonio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10848
        mmTop = 37571
        mmWidth = 41540
        BandType = 8
      end
      object rpGuiaTransfBemLabel5: TppLabel
        UserName = 'rpGuiaTransfBemLabel5'
        Caption = 'Ass./Carimbo Cedente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 78317
        mmTop = 37571
        mmWidth = 37042
        BandType = 8
      end
      object rpGuiaTransfBemLabel6: TppLabel
        UserName = 'rpGuiaTransfBemLabel6'
        Caption = 'Ass./Carimbo Recebedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 143669
        mmTop = 37571
        mmWidth = 41275
        BandType = 8
      end
      object ppCalc8: TppSystemVariable
        UserName = 'Calc8'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 73290
        mmTop = 58208
        mmWidth = 50800
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
        mmLeft = 170921
        mmTop = 58208
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpGuiaTransfBemGroup1: TppGroup
      BreakName = 'TERMOCONJGRUPO'
      DataPipeline = ppGuiaTransfBem
      NewPage = True
      ResetPageNo = True
      UserName = 'rpGuiaTransfBemGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpGuiaTransfBemGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 38100
        mmPrintPosition = 0
        object rpGuiaTransfBemLabel7: TppLabel
          UserName = 'rpGuiaTransfBemLabel7'
          Caption = 'Nº Termo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 265
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel8: TppLabel
          UserName = 'rpGuiaTransfBemLabel8'
          Caption = 'Cedente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 4763
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel9: TppLabel
          UserName = 'rpGuiaTransfBemLabel9'
          Caption = 'Local Origem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 19579
          mmTop = 4763
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel10: TppLabel
          UserName = 'rpGuiaTransfBemLabel10'
          Caption = 'Endereço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 19579
          mmTop = 9260
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel11: TppLabel
          UserName = 'rpGuiaTransfBemLabel11'
          Caption = 'Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 19579
          mmTop = 13758
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel12: TppLabel
          UserName = 'rpGuiaTransfBemLabel12'
          Caption = 'Local Destino'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 19579
          mmTop = 18256
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel13: TppLabel
          UserName = 'rpGuiaTransfBemLabel13'
          Caption = 'Endereço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 19579
          mmTop = 22754
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel14: TppLabel
          UserName = 'rpGuiaTransfBemLabel14'
          Caption = 'Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 19579
          mmTop = 27252
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel15: TppLabel
          UserName = 'rpGuiaTransfBemLabel15'
          Caption = 'Recebedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 18256
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemDBText2: TppDBText
          UserName = 'rpGuiaTransfBemDBText2'
          AutoSize = True
          DataField = 'SBXTERMO'
          DataPipeline = ppGuiaTransfBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 43392
          mmTop = 265
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemDBText3: TppDBText
          UserName = 'rpGuiaTransfBemDBText3'
          AutoSize = True
          DataField = 'NOMELOCDEST'
          DataPipeline = ppGuiaTransfBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 43392
          mmTop = 18256
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemDBText4: TppDBText
          UserName = 'rpGuiaTransfBemDBText4'
          AutoSize = True
          DataField = 'NOMERSPORIG'
          DataPipeline = ppGuiaTransfBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 43392
          mmTop = 13758
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemDBText5: TppDBText
          UserName = 'rpGuiaTransfBemDBText5'
          AutoSize = True
          DataField = 'ENDELOCORIG'
          DataPipeline = ppGuiaTransfBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 43392
          mmTop = 9260
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemDBText6: TppDBText
          UserName = 'rpGuiaTransfBemDBText6'
          AutoSize = True
          DataField = 'NOMELOCORIG'
          DataPipeline = ppGuiaTransfBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 43392
          mmTop = 4763
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemDBText7: TppDBText
          UserName = 'rpGuiaTransfBemDBText7'
          AutoSize = True
          DataField = 'ENDELOCDEST'
          DataPipeline = ppGuiaTransfBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 43392
          mmTop = 22754
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemDBText8: TppDBText
          UserName = 'rpGuiaTransfBemDBText8'
          AutoSize = True
          DataField = 'NOMERSPDEST'
          DataPipeline = ppGuiaTransfBem
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 43392
          mmTop = 27252
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel16: TppLabel
          UserName = 'rpGuiaTransfBemLabel16'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 77788
          mmTop = 265
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel17: TppLabel
          UserName = 'rpGuiaTransfBemLabel17'
          Caption = 'Data da Movimentação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 130704
          mmTop = 265
          mmWidth = 38629
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemDBText9: TppDBText
          UserName = 'rpGuiaTransfBemDBText9'
          DataField = 'SBXDATA'
          DataPipeline = ppGuiaTransfBem
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 85725
          mmTop = 265
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemDBText10: TppDBText
          UserName = 'rpGuiaTransfBemDBText10'
          DataField = 'SBXDTAEXECUTADO'
          DataPipeline = ppGuiaTransfBem
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 172244
          mmTop = 265
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLine9: TppLine
          UserName = 'rpGuiaTransfBemLine9'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 31750
          mmWidth = 197379
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel18: TppLabel
          UserName = 'rpGuiaTransfBemLabel18'
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3175
          mmTop = 32808
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel19: TppLabel
          UserName = 'rpGuiaTransfBemLabel19'
          Caption = 'Patrimônio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 16669
          mmTop = 32808
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel20: TppLabel
          UserName = 'rpGuiaTransfBemLabel20'
          Caption = 'Valor Aquisição (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 163513
          mmTop = 32808
          mmWidth = 33867
          BandType = 3
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel21: TppLabel
          UserName = 'rpGuiaTransfBemLabel21'
          Caption = 'Descrição do Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 43127
          mmTop = 32808
          mmWidth = 30427
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'ppLine7'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 0
          mmTop = 37571
          mmWidth = 197379
          BandType = 3
          GroupNo = 0
        end
      end
      object rpGuiaTransfBemGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object rpGuiaTransfBemDBCalc1: TppDBCalc
          UserName = 'rpGuiaTransfBemDBCalc1'
          DataField = 'VALORG'
          DataPipeline = ppGuiaTransfBem
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 169863
          mmTop = 1588
          mmWidth = 28046
          BandType = 5
          GroupNo = 0
        end
        object rpGuiaTransfBemLine8: TppLine
          UserName = 'rpGuiaTransfBemLine8'
          Pen.Width = 2
          StretchWithParent = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 0
          mmWidth = 197644
          BandType = 5
          GroupNo = 0
        end
        object rpGuiaTransfBemLabel22: TppLabel
          UserName = 'rpGuiaTransfBemLabel22'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 156634
          mmTop = 1588
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object rpGuiaTransfBemLine10: TppLine
          UserName = 'rpGuiaTransfBemLine10'
          Pen.Width = 3
          StretchWithParent = True
          Weight = 2
          mmHeight = 794
          mmLeft = 0
          mmTop = 6879
          mmWidth = 197644
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object qryRelGuiaTransf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.RAZAOSOCIAL FROM'
      'PESSOA P, '
      'EMPRESAPROP E '
      'WHERE  P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 313
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsRelGuiaTransf: TwwDataSource
    DataSet = qryRelGuiaTransf
    Left = 313
    Top = 139
  end
  object ppRelGuiaTransf: TppBDEPipeline
    DataSource = dsRelGuiaTransf
    UserName = 'RelGuiaTransf'
    Left = 312
    Top = 126
  end
  object rpRelGuiaTransf: TppReport
    AutoStop = False
    DataPipeline = ppRelGuiaTransf
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 312
    Top = 113
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel32: TppLabel
        UserName = 'ppLabel32'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 79640
        mmTop = 8731
        mmWidth = 37835
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'ppLine11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'ppLabel33'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
      object ppLabel34: TppLabel
        UserName = 'ppLabel34'
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
        mmWidth = 34131
        BandType = 8
      end
      object ppCalc9: TppSystemVariable
        UserName = 'Calc9'
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
      object ppCalc10: TppSystemVariable
        UserName = 'ppCalc101'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 74877
        mmTop = 3175
        mmWidth = 71702
        BandType = 8
      end
    end
  end
  object qryResLevInv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IB.IDINVENTARIOBENS, IB.DATAINILEVANT, IB.DATAFIMLEVANT,'
      '       I.IIBPLACA,'
      '       DECODE(I.IIBFLGPLACA,0,'#39'       ....         '#39','
      '       DECODE(I.IIBFLGPLACA,1,'#39'        Ok          '#39','
      '       DECODE(I.IIBFLGPLACA,2,'#39'Placa não encontrada'#39','
      '       DECODE(I.IIBFLGPLACA,3,'#39'Placa EM outro Local'#39','
      
        '       DECODE(I.IIBFLGPLACA,4,'#39'Placa DE outro Local'#39',DECODE(I.II' +
        'BFLGPLACA,5,'#39'Placa não Cadastrada'#39','
      
        '                              '#39'       ....         '#39')))))) AS DE' +
        'SCFLGPLACA,'
      '       CONJ_DE.DESCCONJUNTO AS DESCCONJUNTO_DE,'
      '       LOCAL_DE.NOME AS DESCLOCAL_DE,'
      '       RESP_DE.NOME AS NOMERESP_DE,'
      '       CONJ_PARA.DESCCONJUNTO AS DESCCONJUNTO_PARA,'
      
        '       DECODE(LOCAL_PARA.NOME,NULL,'#39'Não Encontrado'#39',LOCAL_PARA.N' +
        'OME) AS DESCLOCAL_PARA,'
      '       RESP_PARA.NOME AS NOMERESP_PARA,'
      '       DECODE(I.IIBFLGSITFISICA,0,'#39' Normal  '#39','
      '       DECODE(I.IIBFLGSITFISICA,1,'#39'Avariado '#39','
      
        '       DECODE(I.IIBFLGSITFISICA,2,'#39'Destruido'#39','#39' Normal  '#39'))) AS ' +
        'DESCFLGSITFISICA,'
      '       B.DESBEM'
      'FROM ITENSINVBENS    I,'
      '     INVENTARIOBENS IB,'
      '     BEM             B,'
      '     CONJUNTO        CONJ_DE,'
      '     LOCALIZACAO     LOCAL_DE,   PESSOA RESP_DE,'
      '     CONJUNTO        CONJ_PARA,'
      '     LOCALIZACAO     LOCAL_PARA, PESSOA RESP_PARA'
      'WHERE (I.IDINVENTARIOBENS = :PIDINVENTARIOBENS)'
      '  AND (I.IDEMPRESA        = :PIDEMPRESA)'
      ''
      '  AND (I.IDINVENTARIOBENS       = IB.IDINVENTARIOBENS)'
      '  AND (I.IDEMPRESA              = IB.IDEMPRESA)'
      '  AND (I.IIBPLACA               = B.PLACA(+))'
      '  AND (I.IDEMPRESA              = B.IDPESSOA(+))'
      '  AND (I.IIBCONJUNTOATUAL       = CONJ_DE.IDCONJUNTO(+))'
      '  AND (I.IIBCONJUNTONOVO        = CONJ_PARA.IDCONJUNTO(+))'
      '  AND (CONJ_DE.IDLOCALIZACAO    = LOCAL_DE.IDLOCALIZACAO(+))'
      '  AND (CONJ_PARA.IDLOCALIZACAO  = LOCAL_PARA.IDLOCALIZACAO(+))'
      '  AND (LOCAL_DE.IDRESPONSAVEL   = RESP_DE.IDPESSOA(+))'
      '  AND (LOCAL_PARA.IDRESPONSAVEL = RESP_PARA.IDPESSOA(+))'
      'ORDER BY I.IIBFLGPLACA DESC,'
      '         I.IIBPLACA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 151
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINVENTARIOBENS'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESA'
        ParamType = ptUnknown
      end>
    object qryResLevInvIDINVENTARIOBENS: TFloatField
      FieldName = 'IDINVENTARIOBENS'
    end
    object qryResLevInvDATAINILEVANT: TDateTimeField
      FieldName = 'DATAINILEVANT'
    end
    object qryResLevInvDATAFIMLEVANT: TDateTimeField
      FieldName = 'DATAFIMLEVANT'
    end
    object qryResLevInvDESCFLGPLACA: TStringField
      FieldName = 'DESCFLGPLACA'
    end
    object qryResLevInvDESCCONJUNTO_DE: TStringField
      FieldName = 'DESCCONJUNTO_DE'
      Size = 200
    end
    object qryResLevInvDESCLOCAL_DE: TStringField
      FieldName = 'DESCLOCAL_DE'
      Size = 60
    end
    object qryResLevInvNOMERESP_DE: TStringField
      FieldName = 'NOMERESP_DE'
      Size = 60
    end
    object qryResLevInvDESCCONJUNTO_PARA: TStringField
      FieldName = 'DESCCONJUNTO_PARA'
      Size = 200
    end
    object qryResLevInvDESCLOCAL_PARA: TStringField
      FieldName = 'DESCLOCAL_PARA'
      Size = 60
    end
    object qryResLevInvNOMERESP_PARA: TStringField
      FieldName = 'NOMERESP_PARA'
      Size = 60
    end
    object qryResLevInvDESCFLGSITFISICA: TStringField
      FieldName = 'DESCFLGSITFISICA'
      Size = 9
    end
    object qryResLevInvDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryResLevInvIIBPLACA: TFloatField
      FieldName = 'IIBPLACA'
    end
  end
  object dsResLevInv: TwwDataSource
    DataSet = qryResLevInv
    Left = 129
    Top = 139
  end
  object ppResLevInv: TppBDEPipeline
    DataSource = dsResLevInv
    UserName = 'ResLevInv'
    Left = 128
    Top = 126
  end
  object rpResLevInv: TppReport
    AutoStop = False
    DataPipeline = ppResLevInv
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 129
    Top = 113
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33867
      mmPrintPosition = 0
      object ppLabel35: TppLabel
        UserName = 'ppLabel35'
        Caption = 'Resultado do Levantamento de Inventário Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 87842
        mmTop = 8731
        mmWidth = 108479
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'ppLine21'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel36: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel36'
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
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 26194
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label1'
        Caption = 'Levantamento Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 17198
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label2'
        Caption = 'Data Início'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 85725
        mmTop = 17198
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label3'
        Caption = 'Encerrado em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 135996
        mmTop = 17198
        mmWidth = 22225
        BandType = 0
      end
      object lblSelecao: TppLabel
        UserName = 'Label4'
        Caption = 'Seleção'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 21696
        mmWidth = 12700
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'IDINVENTARIOBENS'
        DataPipeline = ppResLevInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 27252
        mmTop = 17198
        mmWidth = 24606
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAINILEVANT'
        DataPipeline = ppResLevInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 103717
        mmTop = 17198
        mmWidth = 22754
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAFIMLEVANT'
        DataPipeline = ppResLevInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 159015
        mmTop = 17198
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label5'
        Caption = 'PLACA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 26723
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label6'
        Caption = 'DESCRIÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 21431
        mmTop = 26723
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label7'
        Caption = 'RESULTADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 110331
        mmTop = 26723
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'SITUAÇÃO FÍSICA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 142611
        mmTop = 26723
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label9'
        Caption = 'LOCALIZAÇÃO '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 168011
        mmTop = 26723
        mmWidth = 20902
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'LOCALIZAÇÃO LEVANTADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 226219
        mmTop = 26723
        mmWidth = 39952
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 33602
        mmWidth = 284300
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'IIBPLACA'
        DataPipeline = ppResLevInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DESBEM'
        DataPipeline = ppResLevInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 21431
        mmTop = 0
        mmWidth = 89165
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DESCFLGPLACA'
        DataPipeline = ppResLevInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 110331
        mmTop = 0
        mmWidth = 32808
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DESCFLGSITFISICA'
        DataPipeline = ppResLevInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 142611
        mmTop = 0
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DESCLOCAL_DE'
        DataPipeline = ppResLevInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 168011
        mmTop = 0
        mmWidth = 57944
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DESCLOCAL_PARA'
        DataPipeline = ppResLevInv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 226219
        mmTop = 0
        mmWidth = 58208
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLine23: TppLine
        UserName = 'ppLine23'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel37: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel37'
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
        mmTop = 265
        mmWidth = 62971
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
        mmLeft = 257969
        mmTop = 265
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
        mmLeft = 106363
        mmTop = 265
        mmWidth = 71702
        BandType = 8
      end
    end
  end
  object rpSelBxBens: TppReport
    AutoStop = False
    DataPipeline = ppSelBxBens
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 451
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Termo de Baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 77788
        mmTop = 8467
        mmWidth = 41804
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
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object rpSelBxBensDBCalc1: TppDBCalc
        UserName = 'rpSelBxBensDBCalc1'
        DataField = 'SBXTERMO'
        DataPipeline = ppSelBxBens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ResetGroup = rpSelBxBensGroup1
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        OnGroupBreak = rpSelBxBensDBCalc1GroupBreak
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 7673
        BandType = 4
      end
      object rpSelBxBensDBText7: TppDBText
        UserName = 'rpSelBxBensDBText7'
        DataField = 'PLACA'
        DataPipeline = ppSelBxBens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object rpSelBxBensDBText9: TppDBText
        UserName = 'rpSelBxBensDBText9'
        DataField = 'VALAQUIS'
        DataPipeline = ppSelBxBens
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 168275
        mmTop = 0
        mmWidth = 29104
        BandType = 4
      end
      object rpSelBxBensDBMemo1: TppDBMemo
        UserName = 'rpSelBxBensDBMemo1'
        CharWrap = True
        DataField = 'DESCBEM'
        DataPipeline = ppSelBxBens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 8731
        mmLeft = 38365
        mmTop = 0
        mmWidth = 128323
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel14: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel14'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 794
        mmWidth = 70908
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 171450
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 72231
        mmTop = 794
        mmWidth = 52917
        BandType = 8
      end
    end
    object rpSelBxBensGroup1: TppGroup
      BreakName = 'SBXTERMO'
      DataPipeline = ppSelBxBens
      NewPage = True
      ResetPageNo = True
      UserName = 'rpSelBxBensGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpSelBxBensGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 22754
        mmPrintPosition = 0
        object rpSelBxBensLabel1: TppLabel
          UserName = 'rpSelBxBensLabel1'
          Caption = 'Termo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel2: TppLabel
          UserName = 'rpSelBxBensLabel2'
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 3969
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel3: TppLabel
          UserName = 'rpSelBxBensLabel3'
          Caption = 'Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 7938
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel4: TppLabel
          UserName = 'rpSelBxBensLabel4'
          Caption = 'Destinatário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 11906
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel6: TppLabel
          UserName = 'rpSelBxBensLabel6'
          Caption = 'Patrimônio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 10583
          mmTop = 17463
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel5: TppLabel
          UserName = 'rpSelBxBensLabel5'
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 17463
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel7: TppLabel
          UserName = 'rpSelBxBensLabel7'
          Caption = 'Descrição do Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 38365
          mmTop = 17463
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel8: TppLabel
          UserName = 'rpSelBxBensLabel8'
          Caption = 'Valor Aquisição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 173302
          mmTop = 17463
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLine1: TppLine
          UserName = 'rpSelBxBensLine1'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 16669
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLine2: TppLine
          UserName = 'rpSelBxBensLine2'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 22225
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText1: TppDBText
          UserName = 'rpSelBxBensDBText1'
          AutoSize = True
          DataField = 'SBXTERMO'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 23283
          mmTop = 0
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText2: TppDBText
          UserName = 'rpSelBxBensDBText2'
          DataField = 'SBXPROCESSO'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 23283
          mmTop = 3969
          mmWidth = 110596
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText3: TppDBText
          UserName = 'rpSelBxBensDBText3'
          DataField = 'NOMERESP'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 23283
          mmTop = 7938
          mmWidth = 174096
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel9: TppLabel
          UserName = 'rpSelBxBensLabel9'
          Caption = 'Selecionado em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 134938
          mmTop = 0
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel10: TppLabel
          UserName = 'rpSelBxBensLabel10'
          Caption = 'Executado em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 134938
          mmTop = 3969
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText4: TppDBText
          UserName = 'rpSelBxBensDBText4'
          DataField = 'NOMEDEST'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 23283
          mmTop = 11906
          mmWidth = 174096
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText5: TppDBText
          UserName = 'rpSelBxBensDBText5'
          AutoSize = True
          DataField = 'SBXDATA'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 162719
          mmTop = 0
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText6: TppDBText
          UserName = 'rpSelBxBensDBText6'
          AutoSize = True
          DataField = 'SBXDTAEXECUTADO'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 162719
          mmTop = 3969
          mmWidth = 36248
          BandType = 3
          GroupNo = 0
        end
      end
      object rpSelBxBensGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object rpSelBxBensLabel11: TppLabel
          UserName = 'rpSelBxBensLabel11'
          Caption = 'SOMA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 529
          mmWidth = 10319
          BandType = 5
          GroupNo = 0
        end
        object rpSelBxBensDBCalc2: TppDBCalc
          UserName = 'rpSelBxBensDBCalc2'
          DataField = 'VALAQUIS'
          DataPipeline = ppSelBxBens
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpSelBxBensGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 168275
          mmTop = 529
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object rpSelBxBensLine3: TppLine
          UserName = 'rpSelBxBensLine3'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object rpSelBxBensLine4: TppLine
          UserName = 'rpSelBxBensLine4'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 265
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object updMovAnaPer: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  CLASSE = :CLASSE,'
      '  DESCGRUPO = :DESCGRUPO,'
      '  S_A = :S_A,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  VALCTB = :VALCTB'
      'where'
      '  CLASSE = :OLD_CLASSE')
    InsertSQL.Strings = (
      'insert into GRUPO'
      
        '  (CLASSE, DESCGRUPO, S_A, VALORG, CMBEM, DEPLANC, CMDEP, VALCTB' +
        ')'
      'values'
      
        '  (:CLASSE, :DESCGRUPO, :S_A, :VALORG, :CMBEM, :DEPLANC, :CMDEP,' +
        ' :VALCTB)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  CLASSE = :OLD_CLASSE')
    Left = 233
    Top = 266
  end
  object qryMovAnaPer: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       L.NOME AS DESCLOCAL,'
      '       BEM.PLACA,'
      '       G.CLASSE AS CODGRUPO,'
      '       ROUND(HMOV.VALOFI,2) AS VALOFI,'
      '       (0) AS VALCTB,'
      
        '       F.NOME  AS NOMEFORNEC,   /* Entrada       - Fornecedor   ' +
        '  */'
      
        '       D.NOME  AS NOMEDESTIN,   /* Baixa         - Destinatário ' +
        '  */'
      
        '       LA.NOME AS DESCLOCALANT, /* Transferência - Local Anterio' +
        'r */'
      '       BEM.DESBEM AS DESCBEM,'
      '       HMOV.IDBEM,'
      '       HMOV.IDPESSOA,'
      '       HMOV.DATAMOVIMENTACAO,'
      '       HMOV.IDTIPOMOVIMENTACAO'
      'FROM'
      '       BEM,'
      '       HISTORICOMOVIMENTACAO HMOV,'
      '       GRUPO G,'
      '       CONJUNTO C,'
      '       LOCALIZACAO L,'
      '       PESSOA F,'
      '       LOCALIZACAO LA,'
      '       SELBAIXABENS SBB,'
      '       SELBAIXA SB,'
      '       PESSOA D'
      'WHERE'
      
        '      (HMOV.DATAMOVIMENTACAO >= TO_DATE('#39'01/10/2000'#39','#39'DD/MM/YYYY' +
        #39')) AND'
      
        '      (HMOV.DATAMOVIMENTACAO <= TO_DATE('#39'01/10/2000'#39','#39'DD/MM/YYYY' +
        #39')) AND'
      '      (HMOV.IDTIPOMOVIMENTACAO IN (05,11,12)) AND'
      
        '      (HMOV.IDPESSOA     = :PIDPESSOA)             /* EMPRESA PR' +
        'OPRIETÁRIA */'
      
        '  AND (G.FLGIMOVEL       = 0)                      /* BENS PATRI' +
        'MONIAIS */'
      '  AND (BEM.DATAINICIODEP <= :PDATAFIM)'
      '  AND (BEM.IDBEM         = HMOV.IDBEM(+))'
      '  AND (BEM.IDPESSOA      = HMOV.IDPESSOA(+))'
      
        '  AND (BEM.IDGRUPO       = G.IDGRUPO(+))           /* GRUPO CONT' +
        'ÁBIL */'
      
        '  AND (BEM.IDCONJUNTO    = C.IDCONJUNTO(+))        /* LOCALIZAÇÃ' +
        'O ATUAL */'
      '  AND (C.IDLOCALIZACAO   = L.IDLOCALIZACAO(+))'
      
        '  AND (BEM.IDFORNSERV    = F.IDPESSOA(+))          /* FORNECEDOR' +
        '     */'
      
        '  AND (HMOV.IDLOCALANT   = LA.IDLOCALIZACAO(+))    /* LOCALIZAÇÃ' +
        'O ANTERIOR */'
      
        '  AND (BEM.IDBEM         = SBB.IDBEM(+))           /* DESTINATÁR' +
        'IO   */'
      '  AND (BEM.IDPESSOA      = SBB.IDPESSOA(+))'
      '  AND (SBB.IDSELBAIXA    = SB.IDSELBAIXA(+))'
      '  AND (SB.IDDESTINOBAIXA = D.IDPESSOA(+))'
      ''
      'ORDER BY HMOV.DATAMOVIMENTACAO, BEM.PLACA'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updMovAnaPer
    ValidateWithMask = True
    Left = 232
    Top = 254
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end>
    object qryMovAnaPerDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qryMovAnaPerPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryMovAnaPerCODGRUPO: TStringField
      FieldName = 'CODGRUPO'
      FixedChar = True
      Size = 15
    end
    object qryMovAnaPerVALOFI: TFloatField
      FieldName = 'VALOFI'
    end
    object qryMovAnaPerVALCTB: TFloatField
      FieldName = 'VALCTB'
    end
    object qryMovAnaPerNOMEFORNEC: TStringField
      FieldName = 'NOMEFORNEC'
      Size = 60
    end
    object qryMovAnaPerNOMEDESTIN: TStringField
      FieldName = 'NOMEDESTIN'
      Size = 60
    end
    object qryMovAnaPerDESCLOCALANT: TStringField
      FieldName = 'DESCLOCALANT'
      Size = 60
    end
    object qryMovAnaPerDESCBEM: TStringField
      FieldName = 'DESCBEM'
      Size = 200
    end
    object qryMovAnaPerIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryMovAnaPerIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryMovAnaPerDATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
    end
    object qryMovAnaPerIDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
    end
  end
  object dsMovAnaPer: TwwDataSource
    DataSet = qryMovAnaPer
    Left = 233
    Top = 242
  end
  object ppMovAnaPer: TppBDEPipeline
    DataSource = dsMovAnaPer
    UserName = 'MovAnaPer'
    Left = 233
    Top = 229
  end
  object rpMovAnaPer: TppReport
    AutoStop = False
    DataPipeline = ppMovAnaPer
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 233
    Top = 216
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object ppLabel95: TppLabel
        UserName = 'ppLabel95'
        Caption = 'Movimentação Analítica no Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 106363
        mmTop = 8731
        mmWidth = 71438
        BandType = 0
      end
      object ppLabel96: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel96'
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
      object ppLabel118: TppLabel
        UserName = 'ppLabel118'
        Caption = 'Movimentação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 128059
        mmTop = 15346
        mmWidth = 29369
        BandType = 0
      end
    end
    object ppDetailBand14: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object rpMovAnaPerDBCalc1: TppDBCalc
        UserName = 'rpMovAnaPerDBCalc1'
        DataField = 'PLACA'
        DataPipeline = ppMovAnaPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
      object rpMovAnaPerDBText1: TppDBText
        UserName = 'rpMovAnaPerDBText1'
        DataField = 'DESCLOCAL'
        DataPipeline = ppMovAnaPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 9790
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object rpMovAnaPerDBText2: TppDBText
        UserName = 'rpMovAnaPerDBText2'
        DataField = 'PLACA'
        DataPipeline = ppMovAnaPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 37042
        mmTop = 0
        mmWidth = 24606
        BandType = 4
      end
      object rpMovAnaPerDBText3: TppDBText
        UserName = 'rpMovAnaPerDBText3'
        DataField = 'CODGRUPO'
        DataPipeline = ppMovAnaPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 62442
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object rpMovAnaPerDBText4: TppDBText
        UserName = 'rpMovAnaPerDBText4'
        DataField = 'VALOFI'
        DataPipeline = ppMovAnaPer
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 88371
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object rpMovAnaPerDBText5: TppDBText
        UserName = 'rpMovAnaPerDBText5'
        DataField = 'NOMEFORNEC'
        DataPipeline = ppMovAnaPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 114829
        mmTop = 0
        mmWidth = 65352
        BandType = 4
      end
      object rpMovAnaPerDBMemo1: TppDBMemo
        UserName = 'rpMovAnaPerDBMemo1'
        CharWrap = True
        DataField = 'DESCBEM'
        DataPipeline = ppMovAnaPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 10583
        mmLeft = 180975
        mmTop = 0
        mmWidth = 103717
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine32: TppLine
        UserName = 'ppLine32'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 284427
        BandType = 8
      end
      object ppLabel97: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel97'
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
        mmWidth = 67998
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
        mmHeight = 3704
        mmLeft = 258234
        mmTop = 1058
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
        mmHeight = 3704
        mmLeft = 106363
        mmTop = 1058
        mmWidth = 71702
        BandType = 8
      end
    end
    object rpMovAnaPerSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object rpMovAnaPerLabel10: TppLabel
        UserName = 'rpMovAnaPerLabel10'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 794
        mmWidth = 7144
        BandType = 7
      end
      object rpMovAnaPerLine3: TppLine
        UserName = 'rpMovAnaPerLine3'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 284692
        BandType = 7
      end
      object rpMovAnaPerDBCalc3: TppDBCalc
        UserName = 'rpMovAnaPerDBCalc3'
        DataField = 'VALCTB'
        DataPipeline = ppMovAnaPer
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 84667
        mmTop = 794
        mmWidth = 28840
        BandType = 7
      end
      object rpMovAnaPerLine4: TppLine
        UserName = 'rpMovAnaPerLine4'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 5027
        mmWidth = 284692
        BandType = 7
      end
    end
    object rpMovAnaPerGroup1: TppGroup
      BreakName = 'DATAMOVIMENTACAO'
      DataPipeline = ppMovAnaPer
      UserName = 'rpMovAnaPerGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpMovAnaPerGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object rpMovAnaPerLabel1: TppLabel
          UserName = 'rpMovAnaPerLabel1'
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 6615
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel2: TppLabel
          UserName = 'rpMovAnaPerLabel2'
          Caption = 'Localização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 9790
          mmTop = 6615
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel3: TppLabel
          UserName = 'rpMovAnaPerLabel3'
          Caption = 'Patrimônio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 37042
          mmTop = 6615
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel4: TppLabel
          UserName = 'rpMovAnaPerLabel4'
          Caption = 'Grupo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 62442
          mmTop = 6615
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel5: TppLabel
          UserName = 'rpMovAnaPerLabel5'
          AutoSize = False
          Caption = 'Valor (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 88106
          mmTop = 6615
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel6: TppLabel
          UserName = 'rpMovAnaPerLabel6'
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 114829
          mmTop = 6615
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel7: TppLabel
          UserName = 'rpMovAnaPerLabel7'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 180975
          mmTop = 6615
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLine31: TppLine
          UserName = 'ppLine31'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLine1: TppLine
          UserName = 'rpMovAnaPerLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 11377
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerLabel8: TppLabel
          UserName = 'rpMovAnaPerLabel8'
          Caption = 'Movimentação em '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1058
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object rpMovAnaPerDBText6: TppDBText
          UserName = 'rpMovAnaPerDBText6'
          DataField = 'DATAMOVIMENTACAO'
          DataPipeline = ppMovAnaPer
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 32015
          mmTop = 1058
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
      end
      object rpMovAnaPerGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object rpMovAnaPerLine2: TppLine
          UserName = 'rpMovAnaPerLine2'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 5
          GroupNo = 0
        end
        object rpMovAnaPerLabel9: TppLabel
          UserName = 'rpMovAnaPerLabel9'
          Caption = 'Soma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1058
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object rpMovAnaPerDBCalc2: TppDBCalc
          UserName = 'rpMovAnaPerDBCalc2'
          DataField = 'VALCTB'
          DataPipeline = ppMovAnaPer
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpMovAnaPerGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 84667
          mmTop = 794
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object updParamContab: TUpdateSQL
    ModifySQL.Strings = (
      'update BEM'
      'set'
      ''
      '  GRUPOCONTABIL = :GRUPOCONTABIL,'
      '  CCUSTO = :CCUSTO,'
      '  SUBCONTA = :SUBCONTA,'
      '  DESBEM = :DESBEM'
      'where'
      '  PLACA = :OLD_PLACA')
    InsertSQL.Strings = (
      'insert into BEM'
      '  (PLACA, GRUPOCONTABIL, CCUSTO, SUBCONTA, DESBEM)'
      'values'
      '  (:PLACA, :GRUPOCONTABIL, :CCUSTO, :SUBCONTA, :DESBEM)')
    DeleteSQL.Strings = (
      'delete from BEM'
      'where'
      '  PLACA = :OLD_PLACA')
    Left = 40
    Top = 165
  end
  object qryParamContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PLACA,'
      
        '       ('#39'                                                       ' +
        '               '#39') As GrupoContabil,'
      
        '       ('#39'                                                       ' +
        '                         '#39') As CCusto,'
      
        '       ('#39'                                                       ' +
        '                         '#39') As SubConta,'
      '       DESBEM'
      'FROM BEM'
      'WHERE (IDBEM IS NULL)')
    UpdateObject = updParamContab
    ValidateWithMask = True
    Left = 40
    Top = 152
    object qryParamContabPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryParamContabGRUPOCONTABIL: TStringField
      FieldName = 'GRUPOCONTABIL'
      Size = 70
    end
    object qryParamContabCCUSTO: TStringField
      FieldName = 'CCUSTO'
      Size = 80
    end
    object qryParamContabSUBCONTA: TStringField
      FieldName = 'SUBCONTA'
      Size = 80
    end
    object qryParamContabDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
  end
  object dsParamContab: TwwDataSource
    DataSet = qryParamContab
    Left = 40
    Top = 139
  end
  object ppParamContab: TppBDEPipeline
    DataSource = dsParamContab
    UserName = 'ParamContab'
    Left = 40
    Top = 126
  end
  object rpParamContab: TppReport
    AutoStop = False
    DataPipeline = ppParamContab
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 41
    Top = 114
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Parametrização Contábil dos Bens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 107686
        mmTop = 8731
        mmWidth = 69850
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 15081
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
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpParamContabLabel1: TppLabel
        UserName = 'rpParamContabLabel1'
        Caption = 'Placa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 16140
        mmWidth = 6879
        BandType = 0
      end
      object rpParamContabLabel2: TppLabel
        UserName = 'rpParamContabLabel2'
        Caption = 'Grupo Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 21696
        mmTop = 16140
        mmWidth = 18785
        BandType = 0
      end
      object rpParamContabLabel3: TppLabel
        UserName = 'rpParamContabLabel3'
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 84931
        mmTop = 16140
        mmWidth = 20638
        BandType = 0
      end
      object rpParamContabLabel4: TppLabel
        UserName = 'rpParamContabLabel4'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 214578
        mmTop = 16140
        mmWidth = 12965
        BandType = 0
      end
      object rpParamContabLine1: TppLine
        UserName = 'rpParamContabLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 20638
        mmWidth = 284300
        BandType = 0
      end
      object rpParamContabLabel5: TppLabel
        UserName = 'rpParamContabLabel5'
        Caption = 'SubConta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 149490
        mmTop = 16140
        mmWidth = 12435
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpParamContabDBText1: TppDBText
        UserName = 'rpParamContabDBText1'
        DataField = 'PLACA'
        DataPipeline = ppParamContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object rpParamContabDBMemo1: TppDBMemo
        UserName = 'rpParamContabDBMemo1'
        CharWrap = True
        DataField = 'DESBEM'
        DataPipeline = ppParamContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 214578
        mmTop = 0
        mmWidth = 69850
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpParamContabDBMemo2: TppDBMemo
        UserName = 'rpParamContabDBMemo2'
        CharWrap = True
        DataField = 'GRUPOCONTABIL'
        DataPipeline = ppParamContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 21167
        mmTop = 0
        mmWidth = 62971
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpParamContabDBMemo3: TppDBMemo
        UserName = 'rpParamContabDBMemo3'
        CharWrap = True
        DataField = 'CCUSTO'
        DataPipeline = ppParamContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 84931
        mmTop = 0
        mmWidth = 63500
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpParamContabDBMemo4: TppDBMemo
        UserName = 'rpParamContabDBMemo4'
        CharWrap = True
        DataField = 'SUBCONTA'
        DataPipeline = ppParamContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 149490
        mmTop = 0
        mmWidth = 64029
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
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
        mmLeft = 0
        mmTop = 1058
        mmWidth = 69850
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258498
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 106363
        mmTop = 1058
        mmWidth = 71702
        BandType = 8
      end
    end
  end
  object qrySelBensCustom: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.IDBEM, B.IDPESSOA, B.PLACA, B.DESBEM, B.DATAULTDEP, B.D' +
        'ATAINICIODEP, B.IDNOTA, B.COMPLNOTA,'
      
        '       B.NUMSERIE, B.REGISTRO, B.CONTROLE, B.TAXADEP, CC.NOME AS' +
        ' DESCCCUSTO,'
      
        '       L.NOME AS DESCLOCAL, PR.NOME AS NOMERESP, G.NOME AS DESCG' +
        'RUPO,'
      
        '       C.DESCCONJUNTO, B.DTAINCLUSAO, NVL(B.VALHISTORICO,0) AS V' +
        'ALHISTORICO,'
      
        '       PF.NOME AS NOMEFORN, B.IDOPCIONAL, CB.DESCRICAO AS DESCCL' +
        'ASSE,'
      '       S.DESCSITUACAO,'
      
        '       (SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG)    AS VALO' +
        'RG0,'
      
        '       (SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM)       AS CMBE' +
        'M0,'
      
        '       (SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC) AS DEPL' +
        'ANC0,'
      
        '       (SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP)       AS CMDE' +
        'P0,'
      '       (SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      '        SB.REAVDEPLANC - SB.REAVCMDEP +'
      '        SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)             AS VALC' +
        'TB0'
      ''
      'FROM BEM         B, GRUPO       G,'
      '     CLASSEDEBEM CB,'
      '     CONJUNTO    C,'
      '     LOCALIZACAO L,'
      '     CENTCUST    CC,'
      '     PESSOA      PR,'
      '     PESSOA      PF,'
      '     SITUACAO    S,'
      '     (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      '             SCB.VALORG,  SCB.REAVVALORG,  SCB.ULTREAVVALORG,'
      '             SCB.CMBEM,   SCB.REAVCMBEM,   SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP,   SCB.REAVCMDEP,   SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB'
      ''
      'WHERE (B.DATAINICIODEP <= :PDATASLD)'
      '  AND (G.FLGIMOVEL = 0)'
      ''
      '  AND (B.IDCONJUNTO     = C.IDCONJUNTO(+))'
      '  AND (B.IDGRUPO        = G.IDGRUPO(+))'
      '  AND (C.IDLOCALIZACAO  = L.IDLOCALIZACAO(+))'
      '  AND (C.IDRESPONSAVEL  = PR.IDPESSOA(+))'
      '  AND (B.IDFORNSERV     = PF.IDPESSOA(+))'
      '  AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (L.IDEMPRESA      = CC.IDEMPRESA(+))'
      '  AND (B.IDCLASSEBEM    = CB.IDCLASSEBEM(+))'
      '  AND (B.IDSITUACAO     = S.IDSITUACAO(+))'
      '  AND (B.IDBEM          = SB.IDBEM(+))'
      'ORDER BY B.PLACA'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 217
    Top = 152
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    object qrySelBensCustomPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qrySelBensCustomDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qrySelBensCustomDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qrySelBensCustomDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qrySelBensCustomIDNOTA: TStringField
      FieldName = 'IDNOTA'
      FixedChar = True
      Size = 18
    end
    object qrySelBensCustomCOMPLNOTA: TStringField
      FieldName = 'COMPLNOTA'
      FixedChar = True
      Size = 5
    end
    object qrySelBensCustomNUMSERIE: TStringField
      FieldName = 'NUMSERIE'
      FixedChar = True
    end
    object qrySelBensCustomREGISTRO: TStringField
      FieldName = 'REGISTRO'
      FixedChar = True
      Size = 1
    end
    object qrySelBensCustomCONTROLE: TStringField
      FieldName = 'CONTROLE'
      FixedChar = True
      Size = 1
    end
    object qrySelBensCustomTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qrySelBensCustomDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qrySelBensCustomDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qrySelBensCustomNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qrySelBensCustomDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qrySelBensCustomDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qrySelBensCustomDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qrySelBensCustomVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qrySelBensCustomNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 60
    end
    object qrySelBensCustomIDOPCIONAL: TStringField
      FieldName = 'IDOPCIONAL'
      Size = 30
    end
    object qrySelBensCustomDESCCLASSE: TStringField
      FieldName = 'DESCCLASSE'
      Size = 60
    end
    object qrySelBensCustomDESCSITUACAO: TStringField
      FieldName = 'DESCSITUACAO'
      Size = 45
    end
    object qrySelBensCustomVALORG0: TFloatField
      FieldName = 'VALORG0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qrySelBensCustomCMBEM0: TFloatField
      FieldName = 'CMBEM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qrySelBensCustomDEPLANC0: TFloatField
      FieldName = 'DEPLANC0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qrySelBensCustomCMDEP0: TFloatField
      FieldName = 'CMDEP0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qrySelBensCustomVALCTB0: TFloatField
      FieldName = 'VALCTB0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qrySelBensCustomIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qrySelBensCustomIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  object dsSelBensCustom: TwwDataSource
    DataSet = qrySelBensCustom
    Left = 217
    Top = 140
  end
  object ppSelBensCustom: TppBDEPipeline
    DataSource = dsSelBensCustom
    UserName = 'ppSelBensCustom'
    Left = 216
    Top = 127
  end
  object rpSelBensCustom: TppReport
    AutoStop = False
    DataPipeline = ppSelBensCustom
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 216
    Top = 114
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25400
      mmPrintPosition = 0
      object ppLabel19: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório Customizável de Bens'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 66411
        mmTop = 7673
        mmWidth = 64558
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 19315
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel27: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 794
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        AutoSize = False
        Caption = 'Placa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 20108
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 22490
        mmTop = 20108
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        AutoSize = False
        Caption = 'Saldo Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 175419
        mmTop = 20108
        mmWidth = 21431
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 23813
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel121: TppLabel
        UserName = 'ppLabel121'
        Caption = 'Sub-Título'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 89694
        mmTop = 13758
        mmWidth = 17992
        BandType = 0
      end
    end
    object ppDetailBand7: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText13: TppDBText
        UserName = 'DBText1'
        DataField = 'PLACA'
        DataPipeline = ppSelBensCustom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3970
        mmLeft = 0
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'VALCTB0'
        DataPipeline = ppSelBensCustom
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 171715
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'DESBEM'
        DataPipeline = ppSelBensCustom
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 22225
        mmTop = 0
        mmWidth = 148432
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine14: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
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
        mmLeft = 170921
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
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
        mmLeft = 74877
        mmTop = 1588
        mmWidth = 71702
        BandType = 8
      end
      object ppLabel31: TppLabel
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
        mmWidth = 55298
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine45: TppLine
        UserName = 'Line45'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'ppDBCalc7'
        DataField = 'VALCTB0'
        DataPipeline = ppSelBensCustom
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 172244
        mmTop = 1058
        mmWidth = 24606
        BandType = 7
      end
      object ppLabel120: TppLabel
        UserName = 'Label120'
        AutoSize = False
        Caption = 'Totalização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3970
        mmLeft = 0
        mmTop = 1058
        mmWidth = 16933
        BandType = 7
      end
      object ppLine47: TppLine
        UserName = 'Line47'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 5556
        mmWidth = 197300
        BandType = 7
      end
    end
  end
  object qryMovAnaPer2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       BEM.PROCESSOAQUIS,'
      '       L.NOME AS DESCLOCAL,'
      '       BEM.PLACA,'
      '       BEM.IDNOTA,'
      '       HMOV.VALOFI,'
      '       BEM.DESBEM AS DESCBEM,'
      '       HMOV.IDBEM,'
      '       HMOV.IDPESSOA,'
      '       HMOV.DATAMOVIMENTACAO,'
      '       HMOV.IDTIPOMOVIMENTACAO'
      'FROM'
      '       HISTORICOMOVIMENTACAO HMOV,'
      '       BEM,'
      '       GRUPO G,'
      '       CONJUNTO C,'
      '       LOCALIZACAO L'
      'WHERE'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      
        '      (HMOV.IDPESSOA       = :PIDPESSOA)             /* EMPRESA ' +
        'PROPRIETARIA */'
      
        '  AND (G.FLGIMOVEL         = 0)                      /* BENS PAT' +
        'RIMONIAIS */'
      '  AND (HMOV.IDBEM          = BEM.IDBEM(+))'
      '  AND (HMOV.IDPESSOA       = BEM.IDPESSOA(+))'
      
        '  AND (BEM.IDGRUPO         = G.IDGRUPO(+))           /* GRUPO CO' +
        'NTÁBIL */'
      
        '  AND (BEM.IDCONJUNTO      = C.IDCONJUNTO(+))        /* LOCALIZA' +
        'ÇÃO    */'
      '  AND (C.IDLOCALIZACAO     = L.IDLOCALIZACAO(+))'
      'ORDER BY HMOV.DATAMOVIMENTACAO, BEM.PLACA'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 328
    Top = 255
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryMovAnaPer2PROCESSOAQUIS: TStringField
      FieldName = 'PROCESSOAQUIS'
      Size = 30
    end
    object qryMovAnaPer2DESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qryMovAnaPer2PLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryMovAnaPer2IDNOTA: TStringField
      FieldName = 'IDNOTA'
      FixedChar = True
      Size = 18
    end
    object qryMovAnaPer2VALOFI: TFloatField
      FieldName = 'VALOFI'
    end
    object qryMovAnaPer2DESCBEM: TStringField
      FieldName = 'DESCBEM'
      Size = 200
    end
    object qryMovAnaPer2IDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryMovAnaPer2IDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryMovAnaPer2DATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
    end
    object qryMovAnaPer2IDTIPOMOVIMENTACAO: TFloatField
      FieldName = 'IDTIPOMOVIMENTACAO'
    end
  end
  object dsMovAnaPer2: TwwDataSource
    DataSet = qryMovAnaPer2
    Left = 329
    Top = 243
  end
  object ppMovAnaPer2: TppBDEPipeline
    DataSource = dsMovAnaPer2
    UserName = 'MovAnaPer1'
    Left = 329
    Top = 230
    object ppMovAnaPer2ppField1: TppField
      FieldAlias = 'PROCESSOAQUIS'
      FieldName = 'PROCESSOAQUIS'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppMovAnaPer2ppField2: TppField
      FieldAlias = 'DESCLOCAL'
      FieldName = 'DESCLOCAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppMovAnaPer2ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLACA'
      FieldName = 'PLACA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppMovAnaPer2ppField4: TppField
      FieldAlias = 'IDNOTA'
      FieldName = 'IDNOTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 3
    end
    object ppMovAnaPer2ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOFI'
      FieldName = 'VALOFI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppMovAnaPer2ppField6: TppField
      FieldAlias = 'DESCBEM'
      FieldName = 'DESCBEM'
      FieldLength = 200
      DisplayWidth = 200
      Position = 5
    end
    object ppMovAnaPer2ppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBEM'
      FieldName = 'IDBEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppMovAnaPer2ppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppMovAnaPer2ppField9: TppField
      FieldAlias = 'DATAMOVIMENTACAO'
      FieldName = 'DATAMOVIMENTACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object ppMovAnaPer2ppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOMOVIMENTACAO'
      FieldName = 'IDTIPOMOVIMENTACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object rpMovAnaPer2: TppReport
    AutoStop = False
    DataPipeline = ppMovAnaPer2
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 329
    Top = 217
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppLabel43: TppLabel
        UserName = 'ppLabel95'
        Caption = 'Movimentação Analítica no Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 106627
        mmTop = 8731
        mmWidth = 70908
        BandType = 0
      end
      object ppLabel44: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel96'
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
      object ppLabel119: TppLabel
        UserName = 'ppLabel119'
        Caption = 'Movimentação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 128323
        mmTop = 15081
        mmWidth = 29369
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'rpMovAnaPerDBCalc1'
        DataField = 'PLACA'
        DataPipeline = ppMovAnaPer2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'rpMovAnaPerDBText1'
        DataField = 'DESCLOCAL'
        DataPipeline = ppMovAnaPer2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 9790
        mmTop = 0
        mmWidth = 54769
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'rpMovAnaPerDBText2'
        DataField = 'PLACA'
        DataPipeline = ppMovAnaPer2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 66146
        mmTop = 0
        mmWidth = 24606
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'rpMovAnaPerDBText3'
        DataField = 'IDNOTA'
        DataPipeline = ppMovAnaPer2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 118798
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'rpMovAnaPerDBText4'
        DataField = 'VALOFI'
        DataPipeline = ppMovAnaPer2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 92075
        mmTop = 0
        mmWidth = 25135
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'rpMovAnaPerDBText5'
        DataField = 'PROCESSOAQUIS'
        DataPipeline = ppMovAnaPer2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 145257
        mmTop = 0
        mmWidth = 34925
        BandType = 4
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'rpMovAnaPerDBMemo1'
        CharWrap = True
        DataField = 'DESCBEM'
        DataPipeline = ppMovAnaPer2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 10583
        mmLeft = 180975
        mmTop = 0
        mmWidth = 103717
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLine16: TppLine
        UserName = 'ppLine32'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 284427
        BandType = 8
      end
      object ppLabel45: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel97'
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
        mmWidth = 67998
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258234
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'Calc28'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 106363
        mmTop = 1058
        mmWidth = 71702
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppLabel46: TppLabel
        UserName = 'rpMovAnaPerLabel10'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 794
        mmWidth = 7144
        BandType = 7
      end
      object ppLine17: TppLine
        UserName = 'rpMovAnaPerLine3'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 0
        mmWidth = 284692
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'rpMovAnaPerDBCalc3'
        DataField = 'VALOFI'
        DataPipeline = ppMovAnaPer2
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 91546
        mmTop = 794
        mmWidth = 25665
        BandType = 7
      end
      object ppLine18: TppLine
        UserName = 'rpMovAnaPerLine4'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 5027
        mmWidth = 284692
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DATAMOVIMENTACAO'
      DataPipeline = ppMovAnaPer2
      UserName = 'rpMovAnaPerGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppLabel47: TppLabel
          UserName = 'rpMovAnaPerLabel1'
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 6615
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object ppLabel48: TppLabel
          UserName = 'rpMovAnaPerLabel2'
          Caption = 'Localização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 9790
          mmTop = 6615
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppLabel49: TppLabel
          UserName = 'rpMovAnaPerLabel3'
          Caption = 'Patrimônio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 66146
          mmTop = 6615
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel50: TppLabel
          UserName = 'rpMovAnaPerLabel4'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 118798
          mmTop = 6879
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel51: TppLabel
          UserName = 'rpMovAnaPerLabel5'
          AutoSize = False
          Caption = 'Valor (R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 91811
          mmTop = 6615
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel52: TppLabel
          UserName = 'rpMovAnaPerLabel6'
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 145257
          mmTop = 6879
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel53: TppLabel
          UserName = 'rpMovAnaPerLabel7'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 180975
          mmTop = 6615
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLine24: TppLine
          UserName = 'ppLine31'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
        object ppLine25: TppLine
          UserName = 'rpMovAnaPerLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 11113
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
        object ppLabel54: TppLabel
          UserName = 'rpMovAnaPerLabel8'
          Caption = 'Movimentação em '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1058
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'rpMovAnaPerDBText6'
          DataField = 'DATAMOVIMENTACAO'
          DataPipeline = ppMovAnaPer2
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 32015
          mmTop = 1058
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLine26: TppLine
          UserName = 'rpMovAnaPerLine2'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 5
          GroupNo = 0
        end
        object ppLabel55: TppLabel
          UserName = 'rpMovAnaPerLabel9'
          Caption = 'Soma'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1058
          mmWidth = 8202
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'rpMovAnaPerDBCalc2'
          DataField = 'VALOFI'
          DataPipeline = ppMovAnaPer2
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 91546
          mmTop = 794
          mmWidth = 25665
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppCafObras: TppBDEPipeline
    DataSource = dsCafObras
    UserName = 'CafObras'
    Left = 400
    Top = 152
  end
  object dsCafObras: TwwDataSource
    DataSet = qryCafObras
    Left = 400
    Top = 140
  end
  object qryCafObras: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT O.IDCAFOBRA, O.IDPESSOA, O.IDMODULO,'
      
        '       O.DESCCAFOBRA, O.DTAINICIOOBRA, O.DTAENCERRAOBRA, O.FLGOB' +
        'RA,'
      
        '       EO.DESCOBRATIPOETAPA, L.DTALANCAMENTO, L.VALOFI, L.DTANOT' +
        'A, L.NUMNOTA, L.COMPLNOTA,'
      '       L.IDGRUPO, L.CODSUBCONTA, L.UNIDNEGOC,'
      
        '       G.NOME AS DESCGRUPO, AV.NOME AS DESCATIVPROJ, SC.NOMESUBC' +
        'ONTA'
      'FROM   CAFOBRALANC L,'
      '       CAFOBRATIPOETAPA EO,'
      '       CAFOBRA O,'
      '       GRUPO G,'
      '       PLANOGRUPO PG,'
      '       UNIDNEGOCIO AV,'
      '       SUBCONTA SC'
      'WHERE'
      ''
      ''
      ''
      '       (O.IDCAFOBRA   = L.IDCAFOBRA(+))'
      '  AND  (O.IDPESSOA    = L.IDPESSOA(+))'
      '  AND  (L.IDGRUPO     = PG.IDGRUPO)'
      '  AND  (L.IDPESSOA    = PG.IDPESSOA)'
      '  AND  (PG.IDGRUPO    = G.IDGRUPO)'
      '  AND  (L.IDPESSOA    = AV.IDPESSOA(+))'
      '  AND  (L.UNIDNEGOC   = AV.UNIDNEGOC(+))'
      '  AND  (L.IDPESSOA    = SC.IDPESSOA(+))'
      '  AND  (L.CODSUBCONTA = SC.CODSUBCONTA(+))'
      '  AND  (L.IDOBRATIPOETAPA = EO.IDOBRATIPOETAPA)'
      ''
      
        'ORDER BY O.IDCAFOBRA, O.IDPESSOA, L.DTALANCAMENTO, L.IDGRUPO, L.' +
        'IDOBRATIPOETAPA'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 127
    object qryCafObrasIDCAFOBRA: TFloatField
      FieldName = 'IDCAFOBRA'
    end
    object qryCafObrasIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryCafObrasIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryCafObrasDESCCAFOBRA: TStringField
      FieldName = 'DESCCAFOBRA'
      Size = 250
    end
    object qryCafObrasDTAINICIOOBRA: TDateTimeField
      FieldName = 'DTAINICIOOBRA'
    end
    object qryCafObrasDTAENCERRAOBRA: TDateTimeField
      FieldName = 'DTAENCERRAOBRA'
    end
    object qryCafObrasFLGOBRA: TFloatField
      FieldName = 'FLGOBRA'
    end
    object qryCafObrasDESCOBRATIPOETAPA: TStringField
      FieldName = 'DESCOBRATIPOETAPA'
      Size = 50
    end
    object qryCafObrasDTALANCAMENTO: TDateTimeField
      FieldName = 'DTALANCAMENTO'
    end
    object qryCafObrasVALOFI: TFloatField
      FieldName = 'VALOFI'
    end
    object qryCafObrasDTANOTA: TDateTimeField
      FieldName = 'DTANOTA'
    end
    object qryCafObrasNUMNOTA: TStringField
      FieldName = 'NUMNOTA'
      Size = 13
    end
    object qryCafObrasCOMPLNOTA: TStringField
      FieldName = 'COMPLNOTA'
      Size = 5
    end
    object qryCafObrasIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryCafObrasCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
    end
    object qryCafObrasUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryCafObrasDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryCafObrasDESCATIVPROJ: TStringField
      FieldName = 'DESCATIVPROJ'
      Size = 25
    end
    object qryCafObrasNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Size = 60
    end
  end
  object rpCafObras: TppReport
    AutoStop = False
    DataPipeline = ppCafObras
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 400
    Top = 115
    Version = '5.5'
    mmColumnWidth = 197379
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
      object ppLabel56: TppLabel
        UserName = 'ppLabel40'
        Caption = 'Relação de Obras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 124884
        mmTop = 8731
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel57: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel41'
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
        mmWidth = 28310
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText21: TppDBText
        UserName = 'rpInvPatDBText4'
        DataField = 'DTALANCAMENTO'
        DataPipeline = ppCafObras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 41010
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'rpInvPatDBText5'
        DataField = 'DESCOBRATIPOETAPA'
        DataPipeline = ppCafObras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'VALOFI'
        DataPipeline = ppCafObras
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 59267
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'NUMNOTA'
        DataPipeline = ppCafObras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'COMPLNOTA'
        DataPipeline = ppCafObras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 103717
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'DTANOTA'
        DataPipeline = ppCafObras
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 120650
        mmTop = 0
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'DESCGRUPO'
        DataPipeline = ppCafObras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3703
        mmLeft = 137584
        mmTop = 0
        mmWidth = 65088
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'NOMESUBCONTA'
        DataPipeline = ppCafObras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 248709
        mmTop = 0
        mmWidth = 35190
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'DESCATIVPROJ'
        DataPipeline = ppCafObras
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 203730
        mmTop = 0
        mmWidth = 43921
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine27: TppLine
        UserName = 'ppLine36'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 284427
        BandType = 8
      end
      object ppLabel61: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel42'
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
        mmWidth = 104246
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'Calc33'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258234
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'Calc34'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 116152
        mmTop = 1588
        mmWidth = 52123
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDCAFOBRA'
      DataPipeline = ppCafObras
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13758
        mmPrintPosition = 0
        object ppLabel58: TppLabel
          UserName = 'Label58'
          AutoSize = False
          Caption = 'Data de Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 4498
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText23'
          DataField = 'DTAINICIOOBRA'
          DataPipeline = ppCafObras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 20638
          mmTop = 4498
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel59: TppLabel
          UserName = 'Label59'
          AutoSize = False
          Caption = 'Grupo Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 137584
          mmTop = 9790
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppLabel60: TppLabel
          UserName = 'Label60'
          AutoSize = False
          Caption = 'Atividade/Projeto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 203730
          mmTop = 9790
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel62: TppLabel
          UserName = 'Label62'
          AutoSize = False
          Caption = 'Sub Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 248709
          mmTop = 9790
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppLabel63: TppLabel
          UserName = 'Label63'
          AutoSize = False
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 265
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLabel64: TppLabel
          OnPrint = ppLabel64Print
          UserName = 'Label64'
          AutoSize = False
          Caption = 'Encerrado em 99/99/9999'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 38894
          mmTop = 4498
          mmWidth = 36248
          BandType = 3
          GroupNo = 0
        end
        object ppLine28: TppLine
          UserName = 'Line28'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 8996
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
        object ppLabel65: TppLabel
          UserName = 'Label65'
          AutoSize = False
          Caption = 'Etapa da Obra '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 265
          mmTop = 9790
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel66: TppLabel
          UserName = 'Label66'
          AutoSize = False
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3175
          mmLeft = 41010
          mmTop = 9790
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel67: TppLabel
          UserName = 'Label67'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 65352
          mmTop = 9790
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object ppLabel68: TppLabel
          UserName = 'Label68'
          Caption = 'D o c u m e n t o   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 89165
          mmTop = 9790
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppLabel80: TppLabel
          UserName = 'Label80'
          AutoSize = False
          Caption = 'Data Doc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 120650
          mmTop = 9790
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLine29: TppLine
          UserName = 'Line29'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 13493
          mmWidth = 284427
          BandType = 3
          GroupNo = 0
        end
        object ppDBText31: TppDBText
          UserName = 'DBText31'
          DataField = 'DESCCAFOBRA'
          DataPipeline = ppCafObras
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 15875
          mmTop = 265
          mmWidth = 238655
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOFI'
          DataPipeline = ppCafObras
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 59267
          mmTop = 794
          mmWidth = 20109
          BandType = 5
          GroupNo = 0
        end
        object ppLine30: TppLine
          UserName = 'Line30'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 0
          mmWidth = 284427
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object updTransfPatGrp: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  CLASSE = :CLASSE,'
      '  DESCGRUPO = :DESCGRUPO,'
      '  S_A = :S_A,'
      '  ENTRADAS = :ENTRADAS,'
      '  SAIDAS = :SAIDAS,'
      '  SALDO = :SALDO'
      'where'
      '  CLASSE = :OLD_CLASSE')
    InsertSQL.Strings = (
      'insert into GRUPO'
      '  (CLASSE, DESCGRUPO, S_A, ENTRADAS, SAIDAS, SALDO)'
      'values'
      '  (:CLASSE, :DESCGRUPO, :S_A, :ENTRADAS, :SAIDAS, :SALDO)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  CLASSE = :OLD_CLASSE')
    Left = 38
    Top = 266
  end
  object qryTransfPatGrp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0)  AS ENTRADAS,'
      '       (0)  AS SAIDAS,'
      '       (0)  AS SALDO'
      'FROM GRUPO'
      'WHERE (CLASSE IS NULL)'
      'ORDER BY CLASSE'
      ''
      ' ')
    UpdateObject = updTransfPatGrp
    ValidateWithMask = True
    Left = 38
    Top = 254
    object qryTransfPatGrpCLASSE: TStringField
      FieldName = 'CLASSE'
      FixedChar = True
      Size = 15
    end
    object qryTransfPatGrpDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryTransfPatGrpS_A: TStringField
      FieldName = 'S_A'
      FixedChar = True
      Size = 1
    end
    object qryTransfPatGrpENTRADAS: TFloatField
      FieldName = 'ENTRADAS'
    end
    object qryTransfPatGrpSAIDAS: TFloatField
      FieldName = 'SAIDAS'
    end
    object qryTransfPatGrpSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object dsTransfPatGrp: TwwDataSource
    DataSet = qryTransfPatGrp
    Left = 39
    Top = 242
  end
  object ppTransfPatGrp: TppBDEPipeline
    DataSource = dsTransfPatGrp
    UserName = 'ppTransfPatGrp'
    Left = 39
    Top = 230
  end
  object rpTransfPatGrp: TppReport
    AutoStop = False
    DataPipeline = ppTransfPatGrp
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 40
    Top = 218
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 37306
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'ppLine19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 24606
        mmWidth = 197379
        BandType = 0
      end
      object ppLabel83: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel70'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 794
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'ppLabel71'
        Caption = 'Grupo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 25929
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel85: TppLabel
        UserName = 'ppLabel72'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 17992
        mmTop = 25929
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'ppLabel73'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 101336
        mmTop = 25929
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel88: TppLabel
        UserName = 'ppLabel75'
        Caption = 'Entradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 121973
        mmTop = 31485
        mmWidth = 14023
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'ppLabel76'
        Caption = 'Saídas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 156104
        mmTop = 31485
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel90: TppLabel
        UserName = 'ppLabel77'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 188384
        mmTop = 31485
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'pplbldata1'
        Caption = 'Movimentação de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 59002
        mmTop = 14817
        mmWidth = 31750
        BandType = 0
      end
      object ppLabel92: TppLabel
        UserName = 'ppLabel92'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 91811
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object ppLine38: TppLine
        UserName = 'rpMovPatGrpLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 529
        mmLeft = 0
        mmTop = 36513
        mmWidth = 197379
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'ppLabel93'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 117740
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel94: TppLabel
        UserName = 'rpMovPatGrpLabel1'
        Caption = 'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 114300
        mmTop = 14817
        mmWidth = 2117
        BandType = 0
      end
      object ppLabel82: TppLabel
        UserName = 'Label82'
        AutoSize = False
        Caption = 'Transferência Patrimonial por Grupos - Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 38629
        mmTop = 7673
        mmWidth = 120121
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'Label87'
        Caption = 'Custo de Aquisição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 145257
        mmTop = 25929
        mmWidth = 33073
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText32: TppDBText
        OnPrint = rbdbeClassePrint
        UserName = 'ppDBText32'
        DataField = 'CLASSE'
        DataPipeline = ppTransfPatGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'ppDBText48'
        DataField = 'DESCGRUPO'
        DataPipeline = ppTransfPatGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 529
        mmWidth = 80433
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'ppDBText35'
        BlankWhenZero = True
        DataField = 'ENTRADAS'
        DataPipeline = ppTransfPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 110596
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'ppDBText36'
        BlankWhenZero = True
        DataField = 'SAIDAS'
        DataPipeline = ppTransfPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 141552
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'ppDBText37'
        BlankWhenZero = True
        DataField = 'SALDO'
        DataPipeline = ppTransfPatGrp
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 171980
        mmTop = 529
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'ppDBText54'
        DataField = 'S_A'
        DataPipeline = ppTransfPatGrp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 100806
        mmTop = 529
        mmWidth = 7408
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppLine39: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel98: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel81'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 1852
        mmWidth = 56621
        BandType = 8
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'Calc19'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 79111
        mmTop = 1852
        mmWidth = 39158
        BandType = 8
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'ppCalc201'
        AutoSize = False
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 1852
        mmWidth = 27517
        BandType = 8
      end
    end
  end
  object qryTransfPatGrpA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.CLASSE AS CODGRUPO, G.NOME AS NOMEGRUPO,'
      '       GA.CLASSE AS CODGRUPOANT, GA.NOME AS NOMEGRUPOANT,'
      '       B.PLACA, SC.VALORG, B.DESBEM, HM.DATAMOVIMENTACAO'
      'FROM HISTORICOMOVIMENTACAO HM,'
      '     BEM B,'
      '     SALDOCONTABBEM SC,'
      '     GRUPO GA,'
      '     GRUPO G'
      'WHERE (HM.DATAMOVIMENTACAO >= :PDATAINI)'
      '  AND (HM.DATAMOVIMENTACAO <= :PDATAFIM)'
      '  AND (HM.IDTIPOMOVIMENTACAO = 05)'
      ''
      '  '
      '  AND (HM.IDBEM            = SC.IDBEM)'
      '  AND (HM.IDPESSOA         = SC.IDPESSOA)'
      '  AND (HM.DATAMOVIMENTACAO = SC.DATASLDBEM)'
      '  AND (HM.IDBEM            = B.IDBEM)'
      '  AND (HM.IDPESSOA         = B.IDPESSOA)'
      '  AND (SC.IDGRUPO          = G.IDGRUPO)'
      '  AND (HM.IDGRUPANT        = GA.IDGRUPO)'
      'ORDER BY SC.IDGRUPO, HM.IDGRUPANT'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 134
    Top = 255
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAFIM'
        ParamType = ptUnknown
      end>
    object qryTransfPatGrpACODGRUPO: TStringField
      FieldName = 'CODGRUPO'
      Origin = 'BASEDADOS.GRUPO.CLASSE'
      FixedChar = True
      Size = 15
    end
    object qryTransfPatGrpACODGRUPOANT: TStringField
      FieldName = 'CODGRUPOANT'
      Origin = 'BASEDADOS.GRUPO.CLASSE'
      FixedChar = True
      Size = 15
    end
    object qryTransfPatGrpAPLACA: TFloatField
      FieldName = 'PLACA'
      Origin = 'BASEDADOS.BEM.PLACA'
    end
    object qryTransfPatGrpAVALORG: TFloatField
      FieldName = 'VALORG'
      Origin = 'BASEDADOS.SALDOCONTABBEM.VALORG'
    end
    object qryTransfPatGrpADESBEM: TStringField
      FieldName = 'DESBEM'
      Origin = 'BASEDADOS.BEM.DESBEM'
      Size = 200
    end
    object qryTransfPatGrpANOMEGRUPO: TStringField
      FieldName = 'NOMEGRUPO'
      Origin = 'BASEDADOS.GRUPO.NOME'
      Size = 60
    end
    object qryTransfPatGrpANOMEGRUPOANT: TStringField
      FieldName = 'NOMEGRUPOANT'
      Origin = 'BASEDADOS.GRUPO.NOME'
      Size = 60
    end
    object qryTransfPatGrpADATAMOVIMENTACAO: TDateTimeField
      FieldName = 'DATAMOVIMENTACAO'
      Origin = 'BASEDADOS.HISTORICOMOVIMENTACAO.DATAMOVIMENTACAO'
    end
  end
  object dsTransfPatGrpA: TwwDataSource
    DataSet = qryTransfPatGrpA
    Left = 135
    Top = 243
  end
  object ppTransfPatGrpA: TppBDEPipeline
    DataSource = dsTransfPatGrpA
    UserName = 'ppTransfPatGrpA'
    Left = 135
    Top = 231
  end
  object rpTransfPatGrpA: TppReport
    AutoStop = False
    DataPipeline = ppTransfPatGrpA
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297127
    PrinterSetup.mmPaperWidth = 210079
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 136
    Top = 219
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand13: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23019
      mmPrintPosition = 0
      object ppLabel99: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'ppLabel70'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 794
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel106: TppLabel
        UserName = 'pplbldata1'
        Caption = 'Movimentação de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 59002
        mmTop = 14817
        mmWidth = 31750
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'ppLabel107'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 91811
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'ppLabel108'
        Caption = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 117740
        mmTop = 14817
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel109: TppLabel
        UserName = 'rpMovPatGrpLabel1'
        Caption = 'a'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 114300
        mmTop = 14817
        mmWidth = 2117
        BandType = 0
      end
      object ppLabel110: TppLabel
        UserName = 'Label82'
        AutoSize = False
        Caption = 'Transferência Patrimonial por Grupos - Analítico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 38629
        mmTop = 7673
        mmWidth = 120121
        BandType = 0
      end
    end
    object ppDetailBand13: TppDetailBand
      BeforePrint = ppDetailBand13BeforePrint
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText34: TppDBText
        OnPrint = rbdbeClassePrint
        UserName = 'ppDBText32'
        DataField = 'PLACA'
        DataPipeline = ppTransfPatGrpA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'ppDBText39'
        DataField = 'DESBEM'
        DataPipeline = ppTransfPatGrpA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 529
        mmWidth = 125942
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'ppDBText41'
        BlankWhenZero = True
        DataField = 'VALORG'
        DataPipeline = ppTransfPatGrpA
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 165894
        mmTop = 529
        mmWidth = 31221
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'ppDBText42'
        BlankWhenZero = True
        DataField = 'DATAMOVIMENTACAO'
        DataPipeline = ppTransfPatGrpA
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 145257
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
    end
    object ppFooterBand13: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppLine42: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197379
        BandType = 8
      end
      object ppLabel112: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel81'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 1852
        mmWidth = 56621
        BandType = 8
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'Calc19'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 79111
        mmTop = 1852
        mmWidth = 39158
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'ppCalc201'
        AutoSize = False
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 1852
        mmWidth = 27517
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CODGRUPO'
      DataPipeline = ppTransfPatGrpA
      NewPage = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppLabel104: TppLabel
          UserName = 'Label104'
          Caption = 'Grupo Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 265
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppDBText44: TppDBText
          OnPrint = rbdbeClassePrint
          UserName = 'ppDBText44'
          DataField = 'CODGRUPO'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 26194
          mmTop = 265
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppDBText45: TppDBText
          OnPrint = rbdbeClassePrint
          UserName = 'DBText45'
          DataField = 'NOMEGRUPO'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 45244
          mmTop = 265
          mmWidth = 150284
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel113: TppLabel
          UserName = 'Label113'
          Caption = 'Total dos Valores Recebidos pelo Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 68792
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'ppDBCalc6'
          DataField = 'VALORG'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 165894
          mmTop = 794
          mmWidth = 31221
          BandType = 5
          GroupNo = 0
        end
        object ppLine46: TppLine
          UserName = 'Line46'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197379
          BandType = 5
          GroupNo = 0
        end
        object ppLabel117: TppLabel
          UserName = 'ppLabel117'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 69056
          mmTop = 794
          mmWidth = 15081
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'CODGRUPOANT'
      DataPipeline = ppTransfPatGrpA
      KeepTogether = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11377
        mmPrintPosition = 0
        object ppLine40: TppLine
          UserName = 'ppLine19'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 197379
          BandType = 3
          GroupNo = 1
        end
        object ppLabel100: TppLabel
          UserName = 'ppLabel71'
          Caption = 'Placa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 6085
          mmWidth = 9260
          BandType = 3
          GroupNo = 1
        end
        object ppLabel101: TppLabel
          UserName = 'ppLabel72'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 17992
          mmTop = 6085
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel102: TppLabel
          UserName = 'Label102'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 151342
          mmTop = 6085
          mmWidth = 7673
          BandType = 3
          GroupNo = 1
        end
        object ppLabel111: TppLabel
          UserName = 'Label87'
          Caption = 'Custo Aquisição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 167482
          mmTop = 6085
          mmWidth = 28046
          BandType = 3
          GroupNo = 1
        end
        object ppLine41: TppLine
          UserName = 'rpMovPatGrpLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 10848
          mmWidth = 197379
          BandType = 3
          GroupNo = 1
        end
        object ppLabel103: TppLabel
          UserName = 'ppLabel103'
          Caption = 'Grupo Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 25400
          BandType = 3
          GroupNo = 1
        end
        object ppDBText40: TppDBText
          OnPrint = rbdbeClassePrint
          UserName = 'ppDBText40'
          DataField = 'CODGRUPOANT'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 26194
          mmTop = 794
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppDBText43: TppDBText
          OnPrint = rbdbeClassePrint
          UserName = 'DBText401'
          DataField = 'NOMEGRUPOANT'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 45244
          mmTop = 794
          mmWidth = 150284
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand4BeforePrint
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel105: TppLabel
          UserName = 'Label105'
          Caption = 'Soma dos Custos Transferidos do Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 1058
          mmWidth = 64294
          BandType = 5
          GroupNo = 1
        end
        object ppLine43: TppLine
          UserName = 'Line43'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 265
          mmWidth = 197379
          BandType = 5
          GroupNo = 1
        end
        object ppLine44: TppLine
          UserName = 'Line44'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 5556
          mmWidth = 197379
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'ppDBCalc5'
          DataField = 'VALORG'
          DataPipeline = ppTransfPatGrpA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 165894
          mmTop = 1058
          mmWidth = 31221
          BandType = 5
          GroupNo = 1
        end
        object ppLabel114: TppLabel
          UserName = 'ppLabel114'
          ShiftWithParent = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 64558
          mmTop = 1058
          mmWidth = 14552
          BandType = 5
          GroupNo = 1
        end
        object ppLabel115: TppLabel
          UserName = 'ppLabel115'
          ShiftWithParent = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 101600
          mmTop = 1058
          mmWidth = 15081
          BandType = 5
          GroupNo = 1
        end
        object ppLabel116: TppLabel
          UserName = 'Label116'
          ShiftWithParent = True
          Caption = ' para o Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 79375
          mmTop = 1058
          mmWidth = 21960
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
