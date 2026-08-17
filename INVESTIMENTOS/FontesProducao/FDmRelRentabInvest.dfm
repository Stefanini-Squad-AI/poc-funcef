inherited DmRelRentabInvest: TDmRelRentabInvest
  Left = 463
  Top = 192
  Width = 349
  Height = 301
  Caption = 'DmRelRentabInvest'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 291
    Top = 8
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
    Left = 291
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Left = 291
    Top = 8
  end
  inherited rpExemplo: TppReport
    Left = 291
    Top = 8
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      mmHeight = 22490
      inherited ppLCarteiraEx: TppLabel [0]
      end
      inherited ppDbLogo: TppDBImage [1]
      end
      inherited ppLPeriodo: TppLabel [2]
      end
      inherited Label11: TppLabel [3]
        mmLeft = 25400
      end
      inherited Line1: TppLine [4]
        mmTop = 22490
      end
      inherited LblEmpresa: TppLabel [5]
        mmLeft = 25400
      end
      object ppLCarteira: TppLabel
        UserName = 'LCarteira1'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
    end
  end
  object QryMovRentabilidade: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DATA, SUM(QUANTIDADE) AS QUANTIDADE, SUM(VLRCOTA) AS VLRC' +
        'OTA, 0 AS VLRCOTAIND,'
      
        '       SUM(SALDO) AS SALDO, SUM(SALDOCOT) AS SALDOCOT, SUM(VLRAP' +
        'LICACAO) AS VLRAPLICACAO,'
      
        '       SUM(VLRRESGATE) AS VLRRESGATE, SUM(VLRIOF+VLRTAXAS) AS VL' +
        'RDESPESAS, SUM(VLRTAXAS) AS VLRTAXAS,'
      '       IDRELATORIO'
      'FROM ('
      
        'SELECT SALDO.DATAMOVFUNDO AS DATA,0 AS QUANTIDADE, 0 AS VLRCOTA,' +
        ' SALDO.SALDOVLRFUNDO AS SALDO,'
      
        '      (SALDO.SALDOVLRFUNDO - NVL(APL.VLRMOVFUNDO,0) + NVL(RESG.V' +
        'LRMOVFUNDO,0)) AS SALDOCOT,'
      '       NVL(APL.VLRMOVFUNDO,0)  AS VLRAPLICACAO ,'
      '       NVL(RESG.VLRMOVFUNDO,0) AS VLRRESGATE,'
      '       NVL(IOF.VLRMOVFUNDO,0)  AS VLRIOF,'
      '       NVL(TXA.VLRMOVFUNDO,0)  AS VLRTAXAS,'
      '       1 AS IDRELATORIO'
      'FROM'
      
        '(SELECT SUM(H1.SALDOQTDCOTAS) AS SALDOQTDCOTAS, SUM(H1.SALDOVLRF' +
        'UNDO) AS SALDOVLRFUNDO, H1.DATAMOVFUNDO'
      ' FROM HISTFUNDO H1'
      
        ' WHERE (H1.IDHISTFUNDO IN (SELECT MAX(IDHISTFUNDO) AS IDHISTFUND' +
        'O '
      '                           FROM HISTFUNDO HF, FUNDOINVEST FI'
      '                           WHERE'
      
        '                             (((:IDPLANPREVCTBPATR IS NOT NULL) ' +
        '    AND'
      
        '                             (HF.IDPLANPREVCTBPATR=:IDPLANPREVCT' +
        'BPATR)) OR'
      
        '                               (:IDPLANPREVCTBPATR IS NULL))    ' +
        '    AND'
      
        '                             (HF.IDFUNDOINVEST IN (:FUNDOINVEST)' +
        ') AND'
      
        '                            ((HF.DATAMOVFUNDO      >= TO_DATE(:D' +
        'ATAINI,'#39'DD/MM/YYYY'#39'))   AND'
      
        '                             (HF.DATAMOVFUNDO      <= TO_DATE(:D' +
        'ATAFIM,'#39'DD/MM/YYYY'#39')))  AND'
      
        '                             (HF.TIPMOVFUNDO       <>'#39'PIR'#39')     ' +
        '  AND'
      
        '                             (FI.IDTIPOFUNDOINVEST IN (:TIPOFUND' +
        'OINVEST))               AND'
      
        '                             (FI.IDFUNDOINVEST       = HF.IDFUND' +
        'OINVEST)'
      
        '                           GROUP BY HF.IDPLANPREVCTBPATR, HF.IDF' +
        'UNDOINVEST, HF.DATAAPLICACAO, HF.DATAMOVFUNDO)) AND'
      '       (H1.SALDOQTDCOTAS > 0)'
      ' GROUP BY H1.DATAMOVFUNDO) SALDO,'
      
        '(SELECT DATAOPERACAO AS DATAMOVFUNDO, SUM(VLROPERACAO) AS VLRMOV' +
        'FUNDO'
      ' FROM  OPERACAOFUNDO HF, FUNDOINVEST FI'
      ' WHERE'
      '     (((:IDPLANPREVCTBPATR IS NOT NULL)         AND'
      '     (HF.IDPLANPREVCTBPATR    =:IDPLANPREVCTBPATR)) OR'
      '       (:IDPLANPREVCTBPATR IS NULL))            AND'
      '     (HF.IDFUNDOINVEST     IN (:FUNDOINVEST)) AND'
      
        '    ((HF.DATAOPERACAO     >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))  AN' +
        'D'
      
        '     (HF.DATAOPERACAO     <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))) AN' +
        'D'
      '     (HF.IDTIPOOPERACAO    IN (:TIPOOPERACAO))    AND'
      '     (FI.IDTIPOFUNDOINVEST IN (:TIPOFUNDOINVEST)) AND'
      '     (HF.IDFUNDOINVEST     = FI.IDFUNDOINVEST)'
      ' GROUP BY DATAOPERACAO  ) APL,'
      ''
      
        '(SELECT DATAPEDIDO AS DATAMOVFUNDO, SUM(VLRPEDIDO) AS VLRMOVFUND' +
        'O'
      ' FROM PEDIDOFUNDO HF, FUNDOINVEST FI'
      ' WHERE'
      '    (((:IDPLANPREVCTBPATR IS NOT NULL)         AND'
      '    (HF.IDPLANPREVCTBPATR    =:IDPLANPREVCTBPATR)) OR'
      '      (:IDPLANPREVCTBPATR IS NULL))            AND'
      '    (HF.IDFUNDOINVEST     IN (:FUNDOINVEST)) AND'
      
        '   ((HF.DATAPEDIDO        >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))  AN' +
        'D'
      
        '    (HF.DATAPEDIDO        <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))) AN' +
        'D'
      '    (HF.IDTIPOOPERACAO     IN (:TIPOOPERACAO))    AND'
      '    (FI.IDTIPOFUNDOINVEST  IN (:TIPOFUNDOINVEST)) AND'
      '    (FI.IDFUNDOINVEST      = HF.IDFUNDOINVEST)'
      ' GROUP BY DATAPEDIDO ) RESG,'
      ''
      
        '(SELECT HF.DATAOPERACAO AS DATAMOVFUNDO, SUM(NVL(HF.VLRIOF,0)) A' +
        'S VLRMOVFUNDO'
      ' FROM OPERACAOFUNDO HF, FUNDOINVEST FI,'
      '     (SELECT'
      '         IDTIPOINVEST,'
      '         IDTIPOOPERACAO'
      '      FROM  TIPOOPERACAO'
      '      WHERE'
      '           (IDTIPOOPERACAO   > 0)'
      '      AND  (NATUREZAOPERACAO = '#39'D'#39')'
      '      AND  (RECPAG           = '#39'R'#39')'
      '      AND  (FLGTRANSF        = '#39'N'#39')'
      '      AND  (CODTIPDOC IS NOT NULL) ) TP'
      ' WHERE'
      '    (((:IDPLANPREVCTBPATR IS NOT NULL)           AND'
      '    (HF.IDPLANPREVCTBPATR  =:IDPLANPREVCTBPATR)) OR'
      '      (:IDPLANPREVCTBPATR IS NULL))              AND'
      ''
      '    (HF.IDFUNDOINVEST     IN (:FUNDOINVEST))     AND'
      ''
      
        '   ((HF.DATAOPERACAO      >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))  AN' +
        'D'
      
        '    (HF.DATAOPERACAO      <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))) AN' +
        'D'
      ''
      '    (HF.IDTIPOINVEST       = TP.IDTIPOINVEST)     AND'
      '    (HF.IDTIPOOPERACAO     = TP.IDTIPOOPERACAO)   AND'
      ''
      '    (FI.IDTIPOFUNDOINVEST  IN (:TIPOFUNDOINVEST)) AND'
      '    (FI.IDFUNDOINVEST      = HF.IDFUNDOINVEST)'
      ' GROUP BY DATAOPERACAO) IOF,'
      ''
      
        '(SELECT DATAOPERACAO AS DATAMOVFUNDO, SUM(NVL(VLRTAXAS,0)) AS VL' +
        'RMOVFUNDO'
      ' FROM OPERACAOFUNDO HF, FUNDOINVEST FI'
      ' WHERE'
      '    (((:IDPLANPREVCTBPATR IS NOT NULL)         AND'
      '    (HF.IDPLANPREVCTBPATR  =:IDPLANPREVCTBPATR)) OR'
      '      (:IDPLANPREVCTBPATR IS NULL))            AND'
      '    (HF.IDFUNDOINVEST     IN (:FUNDOINVEST)) AND'
      
        '   ((HF.DATAOPERACAO      >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))  AN' +
        'D'
      
        '    (HF.DATAOPERACAO      <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))) AN' +
        'D'
      '    (HF.IDTIPOOPERACAO     IN (-174,-175,-176,-177))    AND'
      '    (FI.IDTIPOFUNDOINVEST  IN (:TIPOFUNDOINVEST)) AND'
      '    (FI.IDFUNDOINVEST      = HF.IDFUNDOINVEST)'
      ' GROUP BY DATAOPERACAO) TXA'
      ''
      'WHERE'
      '   (APL.DATAMOVFUNDO(+)   = SALDO.DATAMOVFUNDO) AND'
      '   (RESG.DATAMOVFUNDO(+)  = SALDO.DATAMOVFUNDO) AND'
      '   (IOF.DATAMOVFUNDO(+)  = SALDO.DATAMOVFUNDO)  AND'
      '   (TXA.DATAMOVFUNDO(+)  = SALDO.DATAMOVFUNDO)'
      
        'GROUP BY SALDO.DATAMOVFUNDO, APL.VLRMOVFUNDO, RESG.VLRMOVFUNDO, ' +
        'IOF.VLRMOVFUNDO, TXA.VLRMOVFUNDO,'
      '         SALDO.SALDOVLRFUNDO, SALDO.SALDOQTDCOTAS'
      ') GROUP BY DATA, IDRELATORIO'
      ''
      ''
      ' '
      ' ')
    UpdateObject = UpdMovRentabilidade
    ValidateWithMask = True
    Left = 48
    Top = 166
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FUNDOINVEST'
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
        Name = 'TIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FUNDOINVEST'
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
        Name = 'TIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FUNDOINVEST'
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
        Name = 'TIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'TIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FUNDOINVEST'
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
        Name = 'TIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'FUNDOINVEST'
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
        Name = 'TIPOFUNDOINVEST'
        ParamType = ptResult
      end>
    object QryMovRentabilidadeDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATA'
    end
    object QryMovRentabilidadeQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade de Cotas'
      DisplayWidth = 20
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,###,###,##0'
    end
    object QryMovRentabilidadeVLRCOTA: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 18
      FieldName = 'VLRCOTA'
      DisplayFormat = '###,###,##0.0000'
    end
    object QryMovRentabilidadeSALDO: TFloatField
      DisplayLabel = 'Saldo'
      DisplayWidth = 20
      FieldName = 'SALDO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMovRentabilidadeVLRAPLICACAO: TFloatField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 18
      FieldName = 'VLRAPLICACAO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMovRentabilidadeVLRRESGATE: TFloatField
      DisplayLabel = 'Resgate'
      DisplayWidth = 18
      FieldName = 'VLRRESGATE'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMovRentabilidadeVLRDESPESAS: TFloatField
      DisplayLabel = 'Despesas'
      DisplayWidth = 16
      FieldName = 'VLRDESPESAS'
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMovRentabilidadeSALDOCOT: TFloatField
      DisplayLabel = 'Saldo Líquido'
      DisplayWidth = 19
      FieldName = 'SALDOCOT'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
    object QryMovRentabilidadeIDRELATORIO: TFloatField
      FieldName = 'IDRELATORIO'
      Visible = False
    end
    object QryMovRentabilidadeVLRCOTAIND: TFloatField
      FieldName = 'VLRCOTAIND'
      Visible = False
    end
    object QryMovRentabilidadeVLRTAXAS: TFloatField
      FieldName = 'VLRTAXAS'
    end
  end
  object dsMovRentabilidade: TwwDataSource
    AutoEdit = False
    DataSet = QryMovRentabilidade
    Left = 48
    Top = 118
  end
  object UpdMovRentabilidade: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCARTINV'
      'set'
      '  DATAMOVCARTINV = :DATAMOVCARTINV,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VLRCOTA = :VLRCOTA,'
      '  VLRCOTAIND = :VLRCOTAIND,'
      '  SALDO = :SALDO,'
      '  VLRAPLICACAO = :VLRAPLICACAO,'
      '  VLRRESGATE = :VLRRESGATE'
      'where'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    InsertSQL.Strings = (
      'insert into HISTCARTINV'
      
        '  (DATAMOVCARTINV, QUANTIDADE, VLRCOTA, VLRCOTAIND, SALDO, VLRAP' +
        'LICACAO, VLRRESGATE)'
      'values'
      
        '  (:DATAMOVCARTINV, :QUANTIDADE, :VLRCOTA, :VLRCOTAIND, :SALDO, ' +
        ':VLRAPLICACAO, :VLRRESGATE)')
    DeleteSQL.Strings = (
      'delete from HISTCARTINV'
      'where'
      '  DATAMOVCARTINV = :OLD_DATAMOVCARTINV')
    Left = 48
    Top = 214
  end
  object DsRelatorio: TwwDataSource
    AutoEdit = False
    DataSet = QryRelatorio
    Left = 151
    Top = 119
  end
  object QryRelatorio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM DUAL')
    ValidateWithMask = True
    Left = 151
    Top = 167
  end
  object ppRConsRentabilidade: TppReport
    AutoStop = False
    DataPipeline = ppBdeRelatorio
    OnStartPage = ppRConsRentabilidadeStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Rentabilidade dos Investimentos'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 149
    Top = 15
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBdeRelatorio'
    object ppHeaderBand24: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44186
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 6350
        mmLeft = 165365
        mmTop = 37835
        mmWidth = 31750
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 6350
        mmLeft = 126207
        mmTop = 37835
        mmWidth = 39423
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 6350
        mmLeft = 87313
        mmTop = 37835
        mmWidth = 39158
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 6350
        mmLeft = 0
        mmTop = 37835
        mmWidth = 87577
        BandType = 0
      end
      object ppShape32: TppShape
        UserName = 'Shape32'
        mmHeight = 10583
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197115
        BandType = 0
      end
      object ppShape33: TppShape
        UserName = 'Shape302'
        Brush.Color = 14024703
        mmHeight = 6350
        mmLeft = 126207
        mmTop = 31750
        mmWidth = 39423
        BandType = 0
      end
      object ppShape35: TppShape
        UserName = 'Shape35'
        Brush.Color = 14024703
        mmHeight = 6350
        mmLeft = 165365
        mmTop = 31750
        mmWidth = 31750
        BandType = 0
      end
      object lblTitPersInd: TppLabel
        UserName = 'lblTitPersInd'
        AutoSize = False
        Caption = '% sobre Indicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 166423
        mmTop = 33338
        mmWidth = 29104
        BandType = 0
      end
      object ppLabel260: TppLabel
        UserName = 'Label260'
        AutoSize = False
        Caption = 'Valorização da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 134938
        mmTop = 33338
        mmWidth = 29369
        BandType = 0
      end
      object ppShape37: TppShape
        UserName = 'Shape37'
        Brush.Color = 14024703
        mmHeight = 6350
        mmLeft = 0
        mmTop = 31750
        mmWidth = 87577
        BandType = 0
      end
      object ppLabel218: TppLabel
        UserName = 'Label218'
        AutoSize = False
        Caption = 'Indicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 33338
        mmWidth = 20902
        BandType = 0
      end
      object lblIndicador: TppLabel
        UserName = 'lblIndicador'
        Caption = 'lblIndicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 39423
        mmWidth = 15610
        BandType = 0
      end
      object lblValorizacao: TppLabel
        UserName = 'lblValorizacao'
        Caption = '0,0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 152400
        mmTop = 39423
        mmWidth = 11377
        BandType = 0
      end
      object lblPerIndicador: TppLabel
        UserName = 'lblPerIndicador'
        Caption = '0,0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 74348
        mmTop = 39423
        mmWidth = 11377
        BandType = 0
      end
      object lblPerSind: TppLabel
        UserName = 'lblPerSind'
        Caption = '0,0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 184150
        mmTop = 39423
        mmWidth = 11377
        BandType = 0
      end
      object ppLine125: TppLine
        UserName = 'Line125'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 12435
        mmLeft = 0
        mmTop = 31750
        mmWidth = 5027
        BandType = 0
      end
      object ppLabel261: TppLabel
        UserName = 'Label261'
        Caption = 'VARIAÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 85725
        mmTop = 23019
        mmWidth = 25400
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = 14024703
        mmHeight = 6350
        mmLeft = 87313
        mmTop = 31750
        mmWidth = 39158
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Taxa de Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 99484
        mmTop = 33338
        mmWidth = 25665
        BandType = 0
      end
      object lblTxJuros: TppLabel
        UserName = 'lblTxJuros'
        Caption = '0,0000 %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 113242
        mmTop = 39423
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Rentabilidade dos Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8202
        mmWidth = 55298
        BandType = 0
      end
      object ppLabel4: TppLabel
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
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object lblPlano: TppLabel
        UserName = 'lblPlano'
        Caption = 'Plano'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3725
        mmLeft = 186447
        mmTop = 14023
        mmWidth = 8551
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'LPeriodo1'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
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
    end
    object ppDetailBand24: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 16404
      mmPrintPosition = 0
      object ppSCenario: TppSubReport
        UserName = 'SCenario'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppBdeCenario'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppBdeCenario
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Rentabilidade dos Investimentos'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 352
          Top = 256
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBdeCenario'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand27: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object shpDetPortfolio: TppShape
              OnPrint = shpDetPortfolioPrint
              UserName = 'shpDetPortfolio'
              Pen.Style = psClear
              mmHeight = 5027
              mmLeft = 529
              mmTop = 0
              mmWidth = 196586
              BandType = 4
            end
            object ppLine105: TppLine
              UserName = 'Line105'
              ParentHeight = True
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 529
              mmTop = 0
              mmWidth = 1323
              BandType = 4
            end
            object ppLine112: TppLine
              UserName = 'Line112'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 193675
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object ppDBText113: TppDBText
              UserName = 'DBText113'
              DataField = 'TIPO'
              DataPipeline = ppBdeCenario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              SuppressRepeatedValues = True
              Transparent = True
              DataPipelineName = 'ppBdeCenario'
              mmHeight = 3704
              mmLeft = 4233
              mmTop = 265
              mmWidth = 90488
              BandType = 4
            end
            object ppDBText1: TppDBText
              UserName = 'DBText1'
              DataField = 'INVESTIMENTO'
              DataPipeline = ppBdeCenario
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBdeCenario'
              mmHeight = 3704
              mmLeft = 102923
              mmTop = 265
              mmWidth = 93398
              BandType = 4
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              ParentHeight = True
              Position = lpRight
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 98689
              mmTop = 0
              mmWidth = 265
              BandType = 4
            end
            object ppLine2: TppLine
              UserName = 'Line1201'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 529
              mmTop = 4763
              mmWidth = 196057
              BandType = 4
            end
          end
          object ppGroup7: TppGroup
            BreakName = 'IDRELATORIO'
            DataPipeline = ppBdeCenario
            OutlineSettings.CreateNode = True
            UserName = 'Group7'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppBdeCenario'
            object ppGroupHeaderBand7: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 25665
              mmPrintPosition = 0
              object ppShape1: TppShape
                UserName = 'Shape1'
                Brush.Color = 14024703
                mmHeight = 5821
                mmLeft = 98690
                mmTop = 19844
                mmWidth = 98161
                BandType = 3
                GroupNo = 0
              end
              object ppShape22: TppShape
                UserName = 'Shape22'
                mmHeight = 10583
                mmLeft = 529
                mmTop = 9525
                mmWidth = 196321
                BandType = 3
                GroupNo = 0
              end
              object ppLabel217: TppLabel
                UserName = 'Label217'
                Caption = 'PORTFÓLIO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 14
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 5556
                mmLeft = 84402
                mmTop = 11377
                mmWidth = 28575
                BandType = 3
                GroupNo = 0
              end
              object ppShape30: TppShape
                UserName = 'Shape30'
                Brush.Color = 14024703
                mmHeight = 5821
                mmLeft = 529
                mmTop = 19844
                mmWidth = 98425
                BandType = 3
                GroupNo = 0
              end
              object ppLabel219: TppLabel
                UserName = 'Label219'
                Caption = 'Tipo de Investimento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 4233
                mmTop = 21167
                mmWidth = 28310
                BandType = 3
                GroupNo = 0
              end
              object ppLabel2: TppLabel
                UserName = 'Label2'
                Caption = 'Investimento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 102923
                mmTop = 21167
                mmWidth = 17198
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand7: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppSMovimento: TppSubReport
        UserName = 'SMovimento'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSCenario
        TraverseAllData = False
        DataPipelineName = 'ppBdeConsRentabilidade'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 5556
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppBdeConsRentabilidade
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Rentabilidade dos Investimentos'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 368
          Top = 272
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBdeConsRentabilidade'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand28: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object shpDetMovimento: TppShape
              OnPrint = shpDetMovimentoPrint
              UserName = 'shpDetMovimento'
              Brush.Color = 14935011
              Pen.Style = psClear
              mmHeight = 4763
              mmLeft = 529
              mmTop = 0
              mmWidth = 196586
              BandType = 4
            end
            object ppDBText114: TppDBText
              UserName = 'DBText114'
              DataField = 'DATA'
              DataPipeline = ppBdeConsRentabilidade
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBdeConsRentabilidade'
              mmHeight = 3175
              mmLeft = 1588
              mmTop = 794
              mmWidth = 16403
              BandType = 4
            end
            object ppDBText115: TppDBText
              UserName = 'DBText115'
              DataField = 'QUANTIDADE'
              DataPipeline = ppBdeConsRentabilidade
              DisplayFormat = '###,###,###,###,###0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBdeConsRentabilidade'
              mmHeight = 3175
              mmLeft = 19315
              mmTop = 794
              mmWidth = 31221
              BandType = 4
            end
            object ppDBText116: TppDBText
              UserName = 'DBText116'
              DataField = 'VLRCOTA'
              DataPipeline = ppBdeConsRentabilidade
              DisplayFormat = '###,###,##0.0000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBdeConsRentabilidade'
              mmHeight = 3175
              mmLeft = 52123
              mmTop = 794
              mmWidth = 28310
              BandType = 4
            end
            object ppDBText117: TppDBText
              UserName = 'DBText117'
              DataField = 'SALDO'
              DataPipeline = ppBdeConsRentabilidade
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBdeConsRentabilidade'
              mmHeight = 3175
              mmLeft = 82286
              mmTop = 794
              mmWidth = 32015
              BandType = 4
            end
            object ppDBText118: TppDBText
              UserName = 'DBText118'
              DataField = 'VLRAPLICACAO'
              DataPipeline = ppBdeConsRentabilidade
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBdeConsRentabilidade'
              mmHeight = 3175
              mmLeft = 116417
              mmTop = 794
              mmWidth = 28310
              BandType = 4
            end
            object ppDBText119: TppDBText
              UserName = 'DBText119'
              DataField = 'VLRRESGATE'
              DataPipeline = ppBdeConsRentabilidade
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBdeConsRentabilidade'
              mmHeight = 3175
              mmLeft = 146315
              mmTop = 794
              mmWidth = 28310
              BandType = 4
            end
            object ppLine117: TppLine
              UserName = 'Line117'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 529
              mmTop = 0
              mmWidth = 1323
              BandType = 4
            end
            object ppLine119: TppLine
              UserName = 'Line119'
              Position = lpRight
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 193675
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object ppLine120: TppLine
              UserName = 'Line120'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 529
              mmTop = 4763
              mmWidth = 196321
              BandType = 4
            end
            object ppLine132: TppLine
              UserName = 'Line132'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 18522
              mmTop = 0
              mmWidth = 5027
              BandType = 4
            end
            object ppLine133: TppLine
              UserName = 'Line133'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 51329
              mmTop = 0
              mmWidth = 5027
              BandType = 4
            end
            object ppLine136: TppLine
              UserName = 'Line136'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 81492
              mmTop = 0
              mmWidth = 5027
              BandType = 4
            end
            object ppLine138: TppLine
              UserName = 'Line138'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 115094
              mmTop = 0
              mmWidth = 5027
              BandType = 4
            end
            object ppLine140: TppLine
              UserName = 'Line140'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 145521
              mmTop = 0
              mmWidth = 5027
              BandType = 4
            end
            object ppLine5: TppLine
              UserName = 'Line1401'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 175155
              mmTop = 0
              mmWidth = 5027
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText2'
              DataField = 'VLRDESPESAS'
              DataPipeline = ppBdeConsRentabilidade
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBdeConsRentabilidade'
              mmHeight = 3175
              mmLeft = 176213
              mmTop = 794
              mmWidth = 19579
              BandType = 4
            end
          end
          object ppGroup8: TppGroup
            BreakName = 'IDRELATORIO'
            DataPipeline = ppBdeConsRentabilidade
            OutlineSettings.CreateNode = True
            UserName = 'Group8'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppBdeConsRentabilidade'
            object ppGroupHeaderBand8: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 22490
              mmPrintPosition = 0
              object ppShape31: TppShape
                UserName = 'Shape301'
                mmHeight = 10583
                mmLeft = 529
                mmTop = 6615
                mmWidth = 196321
                BandType = 3
                GroupNo = 0
              end
              object ppLabel226: TppLabel
                UserName = 'Label226'
                Caption = 'MOVIMENTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 14
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 5821
                mmLeft = 83344
                mmTop = 8467
                mmWidth = 30427
                BandType = 3
                GroupNo = 0
              end
              object ppShape24: TppShape
                UserName = 'Shape24'
                Brush.Color = 14024703
                Pen.Style = psClear
                mmHeight = 5556
                mmLeft = 529
                mmTop = 17198
                mmWidth = 195792
                BandType = 3
                GroupNo = 0
              end
              object ppLine98: TppLine
                UserName = 'Line98'
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 529
                mmTop = 22225
                mmWidth = 196057
                BandType = 3
                GroupNo = 0
              end
              object ppLabel220: TppLabel
                UserName = 'Label220'
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 6615
                mmTop = 17992
                mmWidth = 5821
                BandType = 3
                GroupNo = 0
              end
              object ppLabel221: TppLabel
                UserName = 'Label221'
                Caption = 'Quantidade de Cotas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 20108
                mmTop = 17992
                mmWidth = 30427
                BandType = 3
                GroupNo = 0
              end
              object ppLabel222: TppLabel
                UserName = 'Label222'
                Caption = 'Valor da Cota'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 62442
                mmTop = 18256
                mmWidth = 17992
                BandType = 3
                GroupNo = 0
              end
              object ppLabel223: TppLabel
                UserName = 'Label223'
                Caption = 'Saldo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 107156
                mmTop = 18256
                mmWidth = 7408
                BandType = 3
                GroupNo = 0
              end
              object ppLabel224: TppLabel
                UserName = 'Label224'
                Caption = 'Aplicação'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 131234
                mmTop = 18256
                mmWidth = 12965
                BandType = 3
                GroupNo = 0
              end
              object ppLabel225: TppLabel
                UserName = 'Label225'
                Caption = 'Resgate'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 162190
                mmTop = 18256
                mmWidth = 10848
                BandType = 3
                GroupNo = 0
              end
              object ppLine116: TppLine
                UserName = 'Line116'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 6350
                mmLeft = 529
                mmTop = 16404
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppLine131: TppLine
                UserName = 'Line131'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5556
                mmLeft = 18521
                mmTop = 17198
                mmWidth = 5027
                BandType = 3
                GroupNo = 0
              end
              object ppLine134: TppLine
                UserName = 'Line134'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5556
                mmLeft = 51329
                mmTop = 17198
                mmWidth = 5027
                BandType = 3
                GroupNo = 0
              end
              object ppLine135: TppLine
                UserName = 'Line135'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5821
                mmLeft = 81492
                mmTop = 16933
                mmWidth = 5027
                BandType = 3
                GroupNo = 0
              end
              object ppLine137: TppLine
                UserName = 'Line137'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5821
                mmLeft = 115094
                mmTop = 16933
                mmWidth = 5027
                BandType = 3
                GroupNo = 0
              end
              object ppLine139: TppLine
                UserName = 'Line139'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5821
                mmLeft = 145521
                mmTop = 16933
                mmWidth = 5027
                BandType = 3
                GroupNo = 0
              end
              object ppLine3: TppLine
                UserName = 'Line3'
                Position = lpRight
                Weight = 0.75
                mmHeight = 5821
                mmLeft = 193675
                mmTop = 16933
                mmWidth = 3175
                BandType = 3
                GroupNo = 0
              end
              object ppLabel5: TppLabel
                UserName = 'Label1'
                Caption = 'Despesas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3440
                mmLeft = 182563
                mmTop = 17992
                mmWidth = 13229
                BandType = 3
                GroupNo = 0
              end
              object ppLine4: TppLine
                UserName = 'Line4'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 5821
                mmLeft = 175155
                mmTop = 16933
                mmWidth = 5027
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand8: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppSGrafico: TppSubReport
        UserName = 'SGrafico'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSMovimento
        TraverseAllData = False
        DataPipelineName = 'ppBdeConsRentabilidade'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 10848
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppBdeConsRentabilidade
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Rentabilidade dos Investimentos'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 368
          Top = 272
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBdeConsRentabilidade'
          object ppTitleBand3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppGroup1: TppGroup
            BreakName = 'IDRELATORIO'
            DataPipeline = ppBdeConsRentabilidade
            KeepTogether = True
            OutlineSettings.CreateNode = True
            UserName = 'Group8'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            DataPipelineName = 'ppBdeConsRentabilidade'
            object ppGroupHeaderBand1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 22490
              mmPrintPosition = 0
              object ppShape8: TppShape
                UserName = 'Shape301'
                mmHeight = 10583
                mmLeft = 529
                mmTop = 6615
                mmWidth = 196321
                BandType = 3
                GroupNo = 0
              end
              object ppLabel6: TppLabel
                UserName = 'Label226'
                Caption = 'GRÁFICO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 14
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 5715
                mmLeft = 87297
                mmTop = 8467
                mmWidth = 22521
                BandType = 3
                GroupNo = 0
              end
              object ppShape9: TppShape
                UserName = 'Shape24'
                Brush.Color = 14024703
                Pen.Style = psClear
                mmHeight = 5556
                mmLeft = 529
                mmTop = 17198
                mmWidth = 195792
                BandType = 3
                GroupNo = 0
              end
              object ppLine15: TppLine
                UserName = 'Line98'
                Weight = 0.75
                mmHeight = 1058
                mmLeft = 529
                mmTop = 22225
                mmWidth = 196057
                BandType = 3
                GroupNo = 0
              end
              object ppLine16: TppLine
                UserName = 'Line116'
                Position = lpLeft
                Weight = 0.75
                mmHeight = 6350
                mmLeft = 529
                mmTop = 16404
                mmWidth = 1323
                BandType = 3
                GroupNo = 0
              end
              object ppLine22: TppLine
                UserName = 'Line3'
                Position = lpRight
                Weight = 0.75
                mmHeight = 5821
                mmLeft = 193675
                mmTop = 16933
                mmWidth = 3175
                BandType = 3
                GroupNo = 0
              end
              object ppLabel7: TppLabel
                UserName = 'Label7'
                Caption = 'Variação da Cota'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3440
                mmLeft = 794
                mmTop = 17992
                mmWidth = 195792
                BandType = 3
                GroupNo = 0
              end
            end
            object ppGroupFooterBand1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 85196
              mmPrintPosition = 0
              object tchGrafico: TppDPTeeChart
                UserName = 'tchGrafico'
                mmHeight = 76200
                mmLeft = 529
                mmTop = 1588
                mmWidth = 196586
                BandType = 5
                GroupNo = 0
                object ppDPTeeChartControl1: TppDPTeeChartControl
                  Left = 0
                  Top = 0
                  Width = 400
                  Height = 250
                  Foot.Visible = False
                  Gradient.Direction = gdBottomTop
                  Gradient.EndColor = 13041663
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clBlack
                  Title.Font.Height = -16
                  Title.Font.Name = 'Arial'
                  Title.Font.Style = []
                  Title.Frame.Width = 2
                  Title.Text.Strings = (
                    '')
                  Title.Visible = False
                  BottomAxis.DateTimeFormat = 'dd/mm/yyyy'
                  BottomAxis.Visible = False
                  Chart3DPercent = 5
                  Legend.Alignment = laBottom
                  Legend.LegendStyle = lsSeries
                  Legend.TextStyle = ltsRightValue
                  BevelInner = bvLowered
                  BorderStyle = bsSingle
                  Color = clWhite
                  object Series1: TLineSeries
                    Tag = 3
                    Marks.ArrowLength = 8
                    Marks.Visible = False
                    DataSource = ppBdeConsRentabilidade
                    SeriesColor = clRed
                    Title = 'Variação da Cota'
                    XLabelsSource = 'DATA'
                    Pointer.InflateMargins = True
                    Pointer.Style = psRectangle
                    Pointer.Visible = False
                    XValues.DateTime = True
                    XValues.Name = 'X'
                    XValues.Multiplier = 1
                    XValues.Order = loAscending
                    XValues.ValueSource = 'DATA'
                    YValues.DateTime = False
                    YValues.Name = 'Y'
                    YValues.Multiplier = 1
                    YValues.Order = loNone
                    YValues.ValueSource = 'VLRCOTA'
                  end
                  object Series2: TLineSeries
                    Tag = 3
                    Marks.ArrowLength = 8
                    Marks.Visible = False
                    DataSource = ppBdeConsRentabilidade
                    SeriesColor = clGreen
                    Title = 'Variação do Indicador'
                    Pointer.InflateMargins = True
                    Pointer.Style = psRectangle
                    Pointer.Visible = False
                    XValues.DateTime = True
                    XValues.Name = 'X'
                    XValues.Multiplier = 1
                    XValues.Order = loAscending
                    XValues.ValueSource = 'DATA'
                    YValues.DateTime = False
                    YValues.Name = 'Y'
                    YValues.Multiplier = 1
                    YValues.Order = loNone
                    YValues.ValueSource = 'VLRCOTAIND'
                  end
                end
              end
            end
          end
        end
      end
    end
    object ppFooterBand23: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14288
      mmPrintPosition = 0
      object ppLine56: TppLine
        UserName = 'Line56'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel252: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'Label252'
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
        mmWidth = 196321
        BandType = 8
      end
      object ppSystemVariable12: TppSystemVariable
        OnPrint = LblSistemaPrint
        UserName = 'SystemVariable12'
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
        mmWidth = 196586
        BandType = 8
      end
      object ppSystemVariable13: TppSystemVariable
        UserName = 'SystemVariable13'
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
    object ppGroup6: TppGroup
      BreakName = 'DUMMY'
      DataPipeline = ppBdeRelatorio
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBdeRelatorio'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand6: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppBdeConsRentabilidade: TppBDEPipeline
    DataSource = dsMovRentabilidade
    UserName = 'BdeConsRentabilidade'
    Left = 48
    Top = 71
  end
  object ppBdeCenario: TppBDEPipeline
    DataSource = dsPortfolio
    UserName = 'BdeConsRentabilidade1'
    Left = 225
    Top = 71
    object ppBdeCenarioppField1: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppBdeCenarioppField2: TppField
      FieldAlias = 'INVESTIMENTO'
      FieldName = 'INVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBdeCenarioppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDRELATORIO'
      FieldName = 'IDRELATORIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object ppBdeRelatorio: TppBDEPipeline
    DataSource = DsRelatorio
    UserName = 'BdeRelatorio'
    Left = 150
    Top = 71
    object ppBdeRelatorioppField1: TppField
      FieldAlias = 'DUMMY'
      FieldName = 'DUMMY'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
  end
  object dsPortfolio: TDataSource
    AutoEdit = False
    DataSet = qryPortfolio
    Left = 226
    Top = 119
  end
  object qryPortfolio: TQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 AS IDRELATORIO,'
      
        '       '#39'                                                        ' +
        '    '#39' AS TIPO,'
      
        '       '#39'                                                        ' +
        '    '#39' AS INVESTIMENTO'
      'FROM TIPOINVEST TI'
      'WHERE TI.IDTIPOINVEST = 0 '
      'ORDER BY TIPO, INVESTIMENTO'
      ' ')
    UpdateObject = updPortfolio
    Left = 226
    Top = 167
    object qryPortfolioTIPO: TStringField
      DisplayWidth = 60
      FieldName = 'TIPO'
      FixedChar = True
      Size = 60
    end
    object qryPortfolioINVESTIMENTO: TStringField
      DisplayWidth = 60
      FieldName = 'INVESTIMENTO'
      FixedChar = True
      Size = 60
    end
    object qryPortfolioIDRELATORIO: TFloatField
      FieldName = 'IDRELATORIO'
    end
  end
  object updPortfolio: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOINVEST'
      'set'
      '  TIPO = :TIPO,'
      '  INVESTIMENTO = :INVESTIMENTO'
      'where'
      '  ID = :OLD_ID')
    InsertSQL.Strings = (
      'insert into TIPOINVEST'
      '  (TIPO, INVESTIMENTO)'
      'values'
      '  (:TIPO, :INVESTIMENTO)')
    DeleteSQL.Strings = (
      'delete from TIPOINVEST'
      'where'
      '  ID = :OLD_ID')
    Left = 228
    Top = 215
  end
end
