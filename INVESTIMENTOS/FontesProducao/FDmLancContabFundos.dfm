inherited DmLancContabFundos: TDmLancContabFundos
  Left = 302
  Top = 154
  Width = 418
  Caption = 'DmLancContabFundos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 189
    Top = 204
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
    Left = 189
    Top = 148
  end
  inherited qryExemplo: TwwQuery
    Left = 189
    Top = 84
  end
  inherited rpExemplo: TppReport
    Left = 189
    Top = 12
    DataPipelineName = 'pplExemplo'
  end
  object pplLancContabFundos: TppBDEPipeline
    DataSource = DsLancContabFundos
    UserName = 'lExemplo1'
    Left = 62
    Top = 204
  end
  object DsLancContabFundos: TwwDataSource
    DataSet = QryLancContabFundos
    Left = 62
    Top = 148
  end
  object QryLancContabFundos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '       DB.DATA, DB.PLANPRVCONTABPATRO, DB.DESCFUNDOINVEST, DB.DE' +
        'SCTIPOOPERACAO, DB.HISTORICO,'
      
        '       DB.PLACONTA AS CTADEBITO, CD.PLACONTA AS CTACREDITO, DB.L' +
        'ACVALOR AS VLRDEBITO, CD.LACVALOR AS VLRCREDITO,'
      
        '       DB.VALOROPERACAO, DB.PLANO, DB.PLNCODIGO, DB.PLNPLANIL, D' +
        'B.IDPLANPREVCTBPATR, DB.COR,'
      
        '       TO_DATE(:DATAINI, '#39'DD/MM/YYYY'#39') AS DATA_INI, TO_DATE(:DAT' +
        'AFIM, '#39'DD/MM/YYYY'#39') AS DATA_FIM'
      
        'FROM (SELECT PD.DATAPEDIDO AS DATA, PP.PLANPRVCONTABPATRO, FI.DE' +
        'SCFUNDOINVEST, TP.DESCTIPOOPERACAO,'
      
        '            (LC.LACHIST1 || LC.LACHIST2) AS HISTORICO, LC.LACVAL' +
        'OR, PD.VLRPEDIDO AS VALOROPERACAO,'
      
        '            LC.PLANO, LC.PLACONTA, PD.PLNCODIGO, PL.PLNPLANIL, P' +
        'D.IDPLANPREVCTBPATR AS IDPLANPREVCTBPATR, 0 AS COR'
      
        '      FROM LANCAMENTO LC, PLANILHA PL, PEDIDOFUNDO PD, FUNDOINVE' +
        'ST FI, TIPOOPERACAO TP,'
      
        '           (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.N' +
        'OME) AS PLANPRVCONTABPATRO'
      
        '            FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONT' +
        'ABIL PL'
      '            WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '              AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP'
      '      WHERE PL.IDMODULO          = 79'
      '        AND LC.LACDEBCRE         = '#39'D'#39
      
        '        AND PL.PLNDATDIA BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') ' +
        'AND'
      '                                 TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      
        '        AND ((:IDPLANPREVCTBPATR IS NULL) OR (PD.IDPLANPREVCTBPA' +
        'TR =:IDPLANPREVCTBPATR))'
      
        '        AND ((:IDFUNDOINVEST     IS NULL) OR (PD.IDFUNDOINVEST  ' +
        '   =:IDFUNDOINVEST))'
      
        '        AND ((:IDTIPOOPERACAO    IS NULL) OR (PD.IDTIPOOPERACAO ' +
        '   =:IDTIPOOPERACAO))'
      '        AND PD.IDTIPOINVEST      = :IDTIPOINVEST'
      '        AND PD.PLNCODIGO         = LC.PLNCODIGO'
      '        AND PD.PLNCODIGO         = PL.PLNCODIGO'
      '        AND FI.IDFUNDOINVEST     = PD.IDFUNDOINVEST'
      '        AND TP.IDTIPOINVEST      = PD.IDTIPOINVEST'
      '        AND TP.IDTIPOOPERACAO    = PD.IDTIPOOPERACAO'
      '        AND PP.IDPLANPREVCTBPATR = PD.IDPLANPREVCTBPATR'
      ''
      '      UNION'
      ''
      
        '      SELECT OP.DATAOPERACAO AS DATA, PP.PLANPRVCONTABPATRO, FI.' +
        'DESCFUNDOINVEST, TP.DESCTIPOOPERACAO,'
      
        '             (LC.LACHIST1 || LC.LACHIST2) AS HISTORICO, LC.LACVA' +
        'LOR, OP.VLROPERACAO AS VALOROPERACAO,'
      
        '             LC.PLANO, LC.PLACONTA, OP.PLNCODIGO, PL.PLNPLANIL, ' +
        'OP.IDPLANPREVCTBPATR AS IDPLANPREVCTBPATR, 0 AS COR'
      
        '      FROM LANCAMENTO LC, PLANILHA PL, OPERACAOFUNDO OP, FUNDOIN' +
        'VEST FI, TIPOOPERACAO TP,'
      
        '           (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.N' +
        'OME) AS PLANPRVCONTABPATRO'
      
        '            FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONT' +
        'ABIL PL'
      '            WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '              AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP'
      '      WHERE PL.IDMODULO          = 79'
      '        AND LC.LACDEBCRE         = '#39'D'#39
      
        '        AND PL.PLNDATDIA BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') ' +
        'AND'
      '                                 TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      
        '        AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPA' +
        'TR =:IDPLANPREVCTBPATR))'
      
        '        AND ((:IDFUNDOINVEST     IS NULL) OR (OP.IDFUNDOINVEST  ' +
        '   =:IDFUNDOINVEST))'
      
        '        AND ((:IDTIPOOPERACAO    IS NULL) OR (OP.IDTIPOOPERACAO ' +
        '   =:IDTIPOOPERACAO))'
      '        AND OP.IDPEDIDOFUNDO     IS NULL        '
      '        AND OP.IDTIPOINVEST      = :IDTIPOINVEST'
      '        AND OP.PLNCODIGO         = LC.PLNCODIGO'
      '        AND OP.PLNCODIGO         = PL.PLNCODIGO'
      '        AND FI.IDFUNDOINVEST     = OP.IDFUNDOINVEST'
      '        AND TP.IDTIPOINVEST      = OP.IDTIPOINVEST        '
      '        AND TP.IDTIPOOPERACAO    = OP.IDTIPOOPERACAO'
      '        AND PP.IDPLANPREVCTBPATR = OP.IDPLANPREVCTBPATR) DB,'
      ''
      
        '     (SELECT PD.DATAPEDIDO AS DATA, PP.PLANPRVCONTABPATRO, FI.DE' +
        'SCFUNDOINVEST, TP.DESCTIPOOPERACAO,'
      
        '             (LC.LACHIST1 || LC.LACHIST2) AS HISTORICO, LC.LACVA' +
        'LOR, PD.VLRPEDIDO AS VALOROPERACAO,'
      
        '             LC.PLANO, LC.PLACONTA, PD.PLNCODIGO, PL.PLNPLANIL, ' +
        'PD.IDPLANPREVCTBPATR AS IDPLANPREVCTBPATR, 0 AS COR'
      
        '      FROM LANCAMENTO LC, PLANILHA PL, PEDIDOFUNDO PD, FUNDOINVE' +
        'ST FI, TIPOOPERACAO TP,'
      
        '           (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.N' +
        'OME) AS PLANPRVCONTABPATRO'
      
        '            FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONT' +
        'ABIL PL'
      '            WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '              AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP'
      '      WHERE PL.IDMODULO  '#9'= 79'
      '        AND LC.LACDEBCRE '#9'= '#39'C'#39
      
        '        AND PL.PLNDATDIA BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') ' +
        'AND'
      '                                 TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      
        '        AND ((:IDPLANPREVCTBPATR IS NULL) OR (PD.IDPLANPREVCTBPA' +
        'TR =:IDPLANPREVCTBPATR))'
      
        '        AND ((:IDFUNDOINVEST     IS NULL) OR (PD.IDFUNDOINVEST  ' +
        '   =:IDFUNDOINVEST))'
      
        '        AND ((:IDTIPOOPERACAO    IS NULL) OR (PD.IDTIPOOPERACAO ' +
        '   =:IDTIPOOPERACAO))'
      '        AND (PD.IDTIPOINVEST    =:IDTIPOINVEST)'
      '        AND PD.PLNCODIGO '#9'= LC.PLNCODIGO'
      '        AND PD.PLNCODIGO'#9'= PL.PLNCODIGO'
      '        AND FI.IDFUNDOINVEST    = PD.IDFUNDOINVEST'
      '        AND TP.IDTIPOINVEST     = PD.IDTIPOINVEST        '
      '        AND TP.IDTIPOOPERACAO   = PD.IDTIPOOPERACAO'
      '        AND PP.IDPLANPREVCTBPATR= PD.IDPLANPREVCTBPATR'
      ''
      '      UNION'
      ''
      
        '      SELECT OP.DATAOPERACAO AS DATA, PP.PLANPRVCONTABPATRO, FI.' +
        'DESCFUNDOINVEST, TP.DESCTIPOOPERACAO,'
      
        '             (LC.LACHIST1 || LC.LACHIST2) AS HISTORICO, LC.LACVA' +
        'LOR, OP.VLROPERACAO AS VALOROPERACAO,'
      
        '             LC.PLANO, LC.PLACONTA, OP.PLNCODIGO, PL.PLNPLANIL, ' +
        'OP.IDPLANPREVCTBPATR AS IDPLANPREVCTBPATR, 0 AS COR'
      
        '      FROM LANCAMENTO LC, PLANILHA PL, OPERACAOFUNDO OP, FUNDOIN' +
        'VEST FI, TIPOOPERACAO TP,'
      
        '           (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.N' +
        'OME) AS PLANPRVCONTABPATRO'
      
        '            FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONT' +
        'ABIL PL'
      '            WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '              AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP'
      '      WHERE PL.IDMODULO          = 79'
      '        AND LC.LACDEBCRE         = '#39'C'#39
      
        '        AND PL.PLNDATDIA BETWEEN TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39') ' +
        'AND'
      '                                 TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')'
      
        '        AND ((:IDPLANPREVCTBPATR IS NULL) OR (OP.IDPLANPREVCTBPA' +
        'TR =:IDPLANPREVCTBPATR))'
      
        '        AND ((:IDFUNDOINVEST     IS NULL) OR (OP.IDFUNDOINVEST  ' +
        '   =:IDFUNDOINVEST))'
      
        '        AND ((:IDTIPOOPERACAO    IS NULL) OR (OP.IDTIPOOPERACAO ' +
        '   =:IDTIPOOPERACAO))'
      '        AND OP.IDPEDIDOFUNDO     IS NULL        '
      '        AND OP.PLNCODIGO         = LC.PLNCODIGO'
      '        AND OP.PLNCODIGO         = PL.PLNCODIGO'
      '        AND FI.IDFUNDOINVEST     = OP.IDFUNDOINVEST'
      '        AND TP.IDTIPOINVEST      = OP.IDTIPOINVEST        '
      '        AND TP.IDTIPOOPERACAO    = OP.IDTIPOOPERACAO'
      '        AND PP.IDPLANPREVCTBPATR = OP.IDPLANPREVCTBPATR) CD'
      ''
      'WHERE CD.PLNCODIGO = DB.PLNCODIGO'
      ''
      
        'ORDER BY PLANPRVCONTABPATRO, DB.DATA, DESCFUNDOINVEST, DESCTIPOO' +
        'PERACAO')
    ValidateWithMask = True
    Left = 62
    Top = 84
    ParamData = <
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
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFIM'
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
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
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end>
    object QryLancContabFundosDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATA'
    end
    object QryLancContabFundosDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo de Investimentos'
      DisplayWidth = 25
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryLancContabFundosDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 15
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryLancContabFundosPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 24
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryLancContabFundosVALOROPERACAO: TFloatField
      DisplayLabel = 'Valor da Operção'
      DisplayWidth = 15
      FieldName = 'VALOROPERACAO'
      DisplayFormat = '#,0.00;-#,0.00'
    end
    object QryLancContabFundosCTADEBITO: TStringField
      DisplayLabel = 'Conta à Débito'
      DisplayWidth = 12
      FieldName = 'CTADEBITO'
      FixedChar = True
      Size = 18
    end
    object QryLancContabFundosCTACREDITO: TStringField
      DisplayLabel = 'Conta à Crédito'
      DisplayWidth = 12
      FieldName = 'CTACREDITO'
      FixedChar = True
      Size = 18
    end
    object QryLancContabFundosVLRDEBITO: TFloatField
      DisplayLabel = 'Valor à Débito'
      DisplayWidth = 15
      FieldName = 'VLRDEBITO'
      DisplayFormat = '#,0.00;-#,0.00'
    end
    object QryLancContabFundosVLRCREDITO: TFloatField
      DisplayLabel = 'Valor à Crédito'
      DisplayWidth = 15
      FieldName = 'VLRCREDITO'
      DisplayFormat = '#,0.00;-#,0.00'
    end
    object QryLancContabFundosPLNPLANIL: TFloatField
      DisplayLabel = 'Planilha'
      DisplayWidth = 9
      FieldName = 'PLNPLANIL'
    end
    object QryLancContabFundosHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 40
      FieldName = 'HISTORICO'
      Visible = False
      Size = 80
    end
    object QryLancContabFundosPLNCODIGO: TFloatField
      DisplayLabel = 'Planilha'
      DisplayWidth = 15
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object QryLancContabFundosPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Visible = False
    end
    object QryLancContabFundosIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryLancContabFundosCOR: TFloatField
      DisplayWidth = 10
      FieldName = 'COR'
      Visible = False
    end
    object QryLancContabFundosDATA_INI: TDateTimeField
      FieldName = 'DATA_INI'
      Visible = False
    end
    object QryLancContabFundosDATA_FIM: TDateTimeField
      FieldName = 'DATA_FIM'
      Visible = False
    end
  end
  object rpLancContabFundos: TppReport
    AutoStop = False
    DataPipeline = pplLancContabFundos
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
    Left = 62
    Top = 12
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplLancContabFundos'
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Lançamentos Contábeis de Fundos de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 89694
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
        mmLeft = 3175
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 8467
        mmLeft = 0
        mmTop = 19843
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Fundo de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 20373
        mmTop = 20373
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Conta à Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 146579
        mmTop = 20373
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Conta à Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 175419
        mmTop = 20373
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Tipo de Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 113771
        mmTop = 20373
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Valor à Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 221457
        mmTop = 20373
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Valor à Credito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 246592
        mmTop = 20373
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Valor da Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 267494
        mmTop = 20108
        mmWidth = 15875
        BandType = 0
      end
      object ppLlData: TppLabel
        UserName = 'LlData'
        Caption = 'Período: 00/00/0000 a 00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 14023
        mmWidth = 53181
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 1852
        mmTop = 22225
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Planilha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 97631
        mmTop = 22225
        mmWidth = 13494
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object RpConsCartRendVarShape2: TppShape
        OnPrint = RpConsCartRendVarShape2Print
        UserName = 'Shape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 265
        mmTop = 265
        mmWidth = 284957
        BandType = 4
      end
      object ppDbTipoOperaccao: TppDBText
        UserName = 'DbTipoOperaccao'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = pplLancContabFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLancContabFundos'
        mmHeight = 3175
        mmLeft = 113772
        mmTop = 529
        mmWidth = 31486
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CTADEBITO'
        DataPipeline = pplLancContabFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLancContabFundos'
        mmHeight = 3175
        mmLeft = 146579
        mmTop = 529
        mmWidth = 27780
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CTACREDITO'
        DataPipeline = pplLancContabFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLancContabFundos'
        mmHeight = 3175
        mmLeft = 175418
        mmTop = 529
        mmWidth = 30163
        BandType = 4
      end
      object ppDbVlrDebito: TppDBText
        UserName = 'DbVlrDebito'
        DataField = 'VLRDEBITO'
        DataPipeline = pplLancContabFundos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancContabFundos'
        mmHeight = 3175
        mmLeft = 206640
        mmTop = 529
        mmWidth = 26988
        BandType = 4
      end
      object ppDbVlrCredito: TppDBText
        UserName = 'DbVlrCredito'
        DataField = 'VLRCREDITO'
        DataPipeline = pplLancContabFundos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancContabFundos'
        mmHeight = 3175
        mmLeft = 234686
        mmTop = 529
        mmWidth = 24605
        BandType = 4
      end
      object ppDbVlrOperacao: TppDBText
        UserName = 'DbVlrOperacao'
        DataField = 'VALOROPERACAO'
        DataPipeline = pplLancContabFundos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancContabFundos'
        mmHeight = 3175
        mmLeft = 260086
        mmTop = 794
        mmWidth = 23284
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PLNPLANIL'
        DataPipeline = pplLancContabFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplLancContabFundos'
        mmHeight = 3175
        mmLeft = 90752
        mmTop = 529
        mmWidth = 20373
        BandType = 4
      end
      object ppDbFundoInvest: TppDBText
        UserName = 'DbFundoInvest'
        DataField = 'DESCFUNDOINVEST'
        DataPipeline = pplLancContabFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'pplLancContabFundos'
        mmHeight = 3175
        mmLeft = 20373
        mmTop = 529
        mmWidth = 69055
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATA'
        DataPipeline = pplLancContabFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplLancContabFundos'
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
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
        mmWidth = 283898
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
        mmLeft = 64823
        mmTop = 3175
        mmWidth = 154517
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
        mmLeft = 257969
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplLancContabFundos
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplLancContabFundos'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clGray
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 265
          mmTop = 265
          mmWidth = 284428
          BandType = 3
          GroupNo = 0
        end
        object ppDbPlanoPrevCtb: TppDBText
          UserName = 'DbPlanoPrevCtb'
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = pplLancContabFundos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplLancContabFundos'
          mmHeight = 3175
          mmLeft = 3175
          mmTop = 794
          mmWidth = 110067
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 2381
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 1059
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppLancCtbFdoAtu: TppBDEPipeline
    DataSource = DsLancCtbFdoAtu
    UserName = 'LancCtbFdoAtu'
    Left = 318
    Top = 204
  end
  object DsLancCtbFdoAtu: TwwDataSource
    DataSet = QryLancCtbFdoAtu
    Left = 318
    Top = 148
  end
  object QryLancCtbFdoAtu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DB.DATA, DB.HISTORICO, DB.PLACONTA AS CTADEBITO, CD.PLACO' +
        'NTA AS CTACREDITO,'
      
        '       DB.LACVALOR AS VLRDEBITO, CD.LACVALOR AS VLRCREDITO, DB.P' +
        'LANO, DB.PLNCODIGO, DB.PLNPLANIL'
      
        'FROM (SELECT PL.PLNDATDIA AS DATA, (LC.LACHIST1 ||'#39' '#39'|| LC.LACHI' +
        'ST2 ||'#39' '#39'|| LC.LACHIST3) AS HISTORICO,'
      
        '            LC.LACVALOR, LC.PLANO, LC.PLACONTA, PL.PLNCODIGO, PL' +
        '.PLNPLANIL, LC.LACNUMLAN'
      '      FROM LANCAMENTO LC, PLANILHA PL'
      '      WHERE LC.IDMODULO  = 79'
      '        AND LC.LACDEBCRE = '#39'D'#39
      '        AND PL.IDMODULO  = 79'
      
        '        AND PL.PLNDATDIA BETWEEN TO_DATE(:DATA_INI,'#39'DD/MM/YYYY'#39')' +
        ' AND'
      '                                 TO_DATE(:DATA_FIM,'#39'DD/MM/YYYY'#39')'
      '        AND LC.PLNCODIGO IN (SELECT DISTINCT PLNCODIGO'
      '                             FROM   HISTFUNDO'
      
        '                             WHERE (IDTIPOINVEST  = :IDTIPOINVES' +
        'T)'
      
        '                               AND (DATAMOVFUNDO BETWEEN TO_DATE' +
        '(:DATA_INI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                         TO_DATE' +
        '(:DATA_FIM,'#39'DD/MM/YYYY'#39'))'
      '                               AND (TIPMOVFUNDO   = '#39'ATU'#39'))'
      '        AND LC.PLNCODIGO = PL.PLNCODIGO) CD,'
      ''
      
        '      (SELECT PL.PLNDATDIA AS DATA, (LC.LACHIST1 ||'#39' '#39'|| LC.LACH' +
        'IST2 ||'#39' '#39'|| LC.LACHIST3) AS HISTORICO,'
      
        '              LC.LACVALOR, LC.PLANO, LC.PLACONTA, PL.PLNCODIGO, ' +
        'PL.PLNPLANIL, LC.LACNUMLAN'
      '       FROM LANCAMENTO LC, PLANILHA PL'
      '       WHERE LC.IDMODULO  = 79'
      '         AND LC.LACDEBCRE = '#39'C'#39
      '         AND PL.IDMODULO  = 79'
      
        '         AND PL.PLNDATDIA BETWEEN TO_DATE(:DATA_INI,'#39'DD/MM/YYYY'#39 +
        ') AND'
      
        '                                  TO_DATE(:DATA_FIM,'#39'DD/MM/YYYY'#39 +
        ')'
      '         AND LC.PLNCODIGO IN (SELECT DISTINCT PLNCODIGO'
      '                              FROM HISTFUNDO'
      
        '                              WHERE (IDTIPOINVEST = :IDTIPOINVES' +
        'T)'
      
        '                                AND (DATAMOVFUNDO BETWEEN TO_DAT' +
        'E(:DATA_INI,'#39'DD/MM/YYYY'#39') AND'
      
        '                                                          TO_DAT' +
        'E(:DATA_FIM,'#39'DD/MM/YYYY'#39'))'
      '                                AND (TIPMOVFUNDO  = '#39'ATU'#39'))'
      '         AND LC.PLNCODIGO = PL.PLNCODIGO) DB'
      ''
      'WHERE CD.DATA      = DB.DATA'
      '  AND CD.LACNUMLAN = DB.LACNUMLAN'
      ''
      'ORDER BY DB.DATA, DB.HISTORICO')
    ValidateWithMask = True
    Left = 318
    Top = 84
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA_INI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA_FIM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA_INI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA_FIM'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA_INI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA_FIM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA_INI'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATA_FIM'
        ParamType = ptResult
      end>
    object QryLancCtbFdoAtuDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATA'
    end
    object QryLancCtbFdoAtuHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 60
      FieldName = 'HISTORICO'
      Size = 120
    end
    object QryLancCtbFdoAtuCTADEBITO: TStringField
      DisplayLabel = 'Conta Débito'
      DisplayWidth = 18
      FieldName = 'CTADEBITO'
      FixedChar = True
      Size = 18
    end
    object QryLancCtbFdoAtuCTACREDITO: TStringField
      DisplayLabel = 'Conta Crédito'
      DisplayWidth = 18
      FieldName = 'CTACREDITO'
      FixedChar = True
      Size = 18
    end
    object QryLancCtbFdoAtuVLRDEBITO: TFloatField
      DisplayLabel = 'Valor Débito'
      DisplayWidth = 18
      FieldName = 'VLRDEBITO'
      DisplayFormat = '#,0.00;-#,0.00'
    end
    object QryLancCtbFdoAtuVLRCREDITO: TFloatField
      DisplayLabel = 'Valor Crédito'
      DisplayWidth = 18
      FieldName = 'VLRCREDITO'
      DisplayFormat = '#,0.00;-#,0.00'
    end
    object QryLancCtbFdoAtuPLANO: TFloatField
      DisplayLabel = 'Plano'
      DisplayWidth = 6
      FieldName = 'PLANO'
    end
    object QryLancCtbFdoAtuPLNPLANIL: TFloatField
      DisplayLabel = 'Planilha'
      DisplayWidth = 12
      FieldName = 'PLNPLANIL'
    end
    object QryLancCtbFdoAtuPLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Visible = False
    end
  end
  object rpLancCtbFdoAtu: TppReport
    AutoStop = False
    DataPipeline = ppLancCtbFdoAtu
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
    BeforePrint = rpLancCtbFdoAtuBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 318
    Top = 12
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppLancCtbFdoAtu'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30427
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'Label11'
        Caption = 'Atualizações Contábeis de Fundos de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 88106
        BandType = 0
      end
      object ppLabel7: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'LCarteira'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 271992
        mmTop = 13229
        mmWidth = 11906
        BandType = 0
      end
      object ppDBImage2: TppDBImage
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
      object ppShape2: TppShape
        UserName = 'shpCabecalho1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 8467
        mmLeft = 0
        mmTop = 21960
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 24342
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Conta à Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 154517
        mmTop = 22490
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Conta à Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 178330
        mmTop = 22490
        mmWidth = 12435
        BandType = 0
      end
      object pplDataPer: TppLabel
        UserName = 'LlData1'
        Caption = 'Período: 00/00/0000 a 00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 13229
        mmWidth = 53711
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = 'Valor à Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 217753
        mmTop = 22490
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        AutoSize = False
        Caption = 'Valor à Credito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 244740
        mmTop = 22490
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'Valor da Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7408
        mmLeft = 267759
        mmTop = 22225
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      BeforePrint = ppDetailBand2BeforePrint
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = RpConsCartRendVarShape2Print
        UserName = 'Shape3'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 284957
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CTADEBITO'
        DataPipeline = ppLancCtbFdoAtu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancCtbFdoAtu'
        mmHeight = 3175
        mmLeft = 154517
        mmTop = 529
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CTACREDITO'
        DataPipeline = ppLancCtbFdoAtu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancCtbFdoAtu'
        mmHeight = 3175
        mmLeft = 178330
        mmTop = 529
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DbFundoInvest1'
        DataField = 'HISTORICO'
        DataPipeline = ppLancCtbFdoAtu
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppLancCtbFdoAtu'
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 529
        mmWidth = 151871
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DbVlrDebito1'
        DataField = 'VLRDEBITO'
        DataPipeline = ppLancCtbFdoAtu
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLancCtbFdoAtu'
        mmHeight = 3175
        mmLeft = 203994
        mmTop = 529
        mmWidth = 25929
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DbVlrCredito1'
        DataField = 'VLRCREDITO'
        DataPipeline = ppLancCtbFdoAtu
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLancCtbFdoAtu'
        mmHeight = 3175
        mmLeft = 230453
        mmTop = 529
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DbVlrOperacao1'
        DataField = 'VLRCREDITO'
        DataPipeline = ppLancCtbFdoAtu
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppLancCtbFdoAtu'
        mmHeight = 3175
        mmLeft = 257969
        mmTop = 529
        mmWidth = 25665
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel10: TppLabel
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
        mmLeft = 0
        mmTop = 3175
        mmWidth = 283898
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
        mmLeft = 257440
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATA'
      DataPipeline = ppLancCtbFdoAtu
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppLancCtbFdoAtu'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          Brush.Color = clGray
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 0
          mmTop = 0
          mmWidth = 284692
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'DATA'
          DataPipeline = ppLancCtbFdoAtu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppLancCtbFdoAtu'
          mmHeight = 3440
          mmLeft = 33867
          mmTop = 529
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'PLNPLANIL'
          DataPipeline = ppLancCtbFdoAtu
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppLancCtbFdoAtu'
          mmHeight = 3440
          mmLeft = 78581
          mmTop = 529
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Planilha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3704
          mmLeft = 64823
          mmTop = 529
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3704
          mmLeft = 24871
          mmTop = 529
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRCREDITO'
          DataPipeline = ppLancCtbFdoAtu
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppLancCtbFdoAtu'
          mmHeight = 3440
          mmLeft = 258498
          mmTop = 1852
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLRCREDITO'
          DataPipeline = ppLancCtbFdoAtu
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppLancCtbFdoAtu'
          mmHeight = 3440
          mmLeft = 230453
          mmTop = 1852
          mmWidth = 27252
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLRDEBITO'
          DataPipeline = ppLancCtbFdoAtu
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppLancCtbFdoAtu'
          mmHeight = 3440
          mmLeft = 203465
          mmTop = 1852
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 5821
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 1058
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CTACREDITO'
      DataPipeline = ppLancCtbFdoAtu
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppLancCtbFdoAtu'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        AfterPrint = ppGroupFooterBand3AfterPrint
        BeforePrint = ppGroupFooterBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VLRDEBITO'
          DataPipeline = ppLancCtbFdoAtu
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppLancCtbFdoAtu'
          mmHeight = 3440
          mmLeft = 203465
          mmTop = 529
          mmWidth = 26458
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VLRCREDITO'
          DataPipeline = ppLancCtbFdoAtu
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppLancCtbFdoAtu'
          mmHeight = 3440
          mmLeft = 230453
          mmTop = 529
          mmWidth = 27252
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VLRCREDITO'
          DataPipeline = ppLancCtbFdoAtu
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppLancCtbFdoAtu'
          mmHeight = 3440
          mmLeft = 258498
          mmTop = 529
          mmWidth = 25135
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
