inherited DmRelFundosEmol: TDmRelFundosEmol
  Left = 399
  Top = 191
  Width = 194
  Height = 240
  Caption = 'DmRelFundosEmol'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 10
    Top = 0
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
    Left = 10
    Top = 0
  end
  inherited qryExemplo: TwwQuery
    Left = 10
    Top = 0
  end
  inherited rpExemplo: TppReport
    Left = 10
    Top = 0
    DataPipelineName = 'pplExemplo'
  end
  object RpConsFundoEmol: TppReport
    AutoStop = False
    DataPipeline = ppBDEConsFundoEmol
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Movimentação dos Fundos de Investimento'
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
    Left = 91
    Top = 9
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEConsFundoEmol'
    object ppHeaderBand29: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 26194
      mmPrintPosition = 0
      object ppShape40: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 0
        mmTop = 20638
        mmWidth = 284692
        BandType = 0
      end
      object ppLine144: TppLine
        UserName = 'ppLine42'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 20638
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel284: TppLabel
        UserName = 'ppLabel107'
        Caption = 'Tipo Oper.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 71702
        mmTop = 21960
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel285: TppLabel
        UserName = 'ppLabel108'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 185209
        mmTop = 21960
        mmWidth = 6085
        BandType = 0
      end
      object ppLabel295: TppLabel
        UserName = 'ppLabel110'
        Caption = 'Comissão Coloc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 195263
        mmTop = 21960
        mmWidth = 20108
        BandType = 0
      end
      object ppLine148: TppLine
        UserName = 'ppLine43'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 25665
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel299: TppLabel
        UserName = 'ppLabel113'
        Caption = 'Movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 2910
        mmTop = 21696
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel301: TppLabel
        UserName = 'Label125'
        Caption = 'Fundo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 20108
        mmTop = 21960
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel303: TppLabel
        UserName = 'ppLabel1101'
        Caption = 'Taxas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 227542
        mmTop = 21960
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel304: TppLabel
        UserName = 'Label129'
        Caption = 'Corretagem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 239978
        mmTop = 21960
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel305: TppLabel
        UserName = 'Label135'
        Caption = 'Liquidação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 117475
        mmTop = 21960
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel306: TppLabel
        UserName = 'Label130'
        Caption = 'Valor Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 267230
        mmTop = 21960
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel307: TppLabel
        UserName = 'Label94'
        Caption = 'Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 155311
        mmTop = 21960
        mmWidth = 5556
        BandType = 0
      end
      object LblPlanoMovEmol: TppLabel
        UserName = 'LblPlanoMov'
        Caption = 'LblPlanoMov'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 255853
        mmTop = 8731
        mmWidth = 24077
        BandType = 0
      end
      object ppLabel300: TppLabel
        UserName = 'Label300'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 88636
        mmTop = 21960
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel308: TppLabel
        UserName = 'Label3001'
        Caption = 'Cotização'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 102923
        mmTop = 21960
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel111: TppLabel
        UserName = 'Label111'
        Caption = 'Consulta da Operação em Fundos com Emolumentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 20108
        mmTop = 8731
        mmWidth = 90488
        BandType = 0
      end
      object ppLabel119: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa23'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 20108
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel223: TppLabel
        UserName = 'LCarteira20'
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
        mmLeft = 267759
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppPeriodoEmol: TppLabel
        UserName = 'LPeriodo13'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo23'
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
    object ppDetailBand31: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 284428
        BandType = 4
      end
      object ppDBText147: TppDBText
        UserName = 'ppDBText44'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = ppBDEConsFundoEmol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsFundoEmol'
        mmHeight = 3704
        mmLeft = 71702
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText148: TppDBText
        UserName = 'ppDBText50'
        DataField = 'VALOR'
        DataPipeline = ppBDEConsFundoEmol
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsFundoEmol'
        mmHeight = 3704
        mmLeft = 161132
        mmTop = 265
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText149: TppDBText
        UserName = 'ppDBText51'
        DataField = 'VLRCOLOCACAO'
        DataPipeline = ppBDEConsFundoEmol
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsFundoEmol'
        mmHeight = 3704
        mmLeft = 191559
        mmTop = 265
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText150: TppDBText
        UserName = 'DBText60'
        DataField = 'DESCFUNDOINVEST'
        DataPipeline = ppBDEConsFundoEmol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsFundoEmol'
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 265
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText151: TppDBText
        UserName = 'DBText62'
        DataField = 'VLRTAXAS'
        DataPipeline = ppBDEConsFundoEmol
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsFundoEmol'
        mmHeight = 3704
        mmLeft = 215636
        mmTop = 265
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText152: TppDBText
        UserName = 'DBText63'
        DataField = 'VLRCORRETAGEM'
        DataPipeline = ppBDEConsFundoEmol
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsFundoEmol'
        mmHeight = 3704
        mmLeft = 234950
        mmTop = 265
        mmWidth = 18785
        BandType = 4
      end
      object ppDBText153: TppDBText
        UserName = 'DBText64'
        DataField = 'VLRTOTAL'
        DataPipeline = ppBDEConsFundoEmol
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsFundoEmol'
        mmHeight = 3704
        mmLeft = 254001
        mmTop = 265
        mmWidth = 25929
        BandType = 4
      end
      object ppDBText154: TppDBText
        UserName = 'DBText65'
        DataField = 'DATALIQUIDACAO'
        DataPipeline = ppBDEConsFundoEmol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsFundoEmol'
        mmHeight = 3704
        mmLeft = 117475
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText155: TppDBText
        UserName = 'ppDBText501'
        DataField = 'VLRCOTA'
        DataPipeline = ppBDEConsFundoEmol
        DisplayFormat = '###,###,###,###0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEConsFundoEmol'
        mmHeight = 3704
        mmLeft = 131763
        mmTop = 265
        mmWidth = 29104
        BandType = 4
      end
      object ppDBText157: TppDBText
        UserName = 'DBText157'
        DataField = 'DATA'
        DataPipeline = ppBDEConsFundoEmol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsFundoEmol'
        mmHeight = 3704
        mmLeft = 88636
        mmTop = 265
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText158: TppDBText
        UserName = 'DBText158'
        DataField = 'DATA'
        DataPipeline = ppBDEConsFundoEmol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEConsFundoEmol'
        mmHeight = 3704
        mmLeft = 102923
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText156: TppDBText
        UserName = 'DBText1'
        DataField = 'DATA'
        DataPipeline = ppBDEConsFundoEmol
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ResetGroup = ppGroup12
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppBDEConsFundoEmol'
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13758
        BandType = 4
      end
    end
    object ppFooterBand28: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine149: TppLine
        UserName = 'Line52'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel309: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'Label131'
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
        mmWidth = 280459
        BandType = 8
      end
      object ppSystemVariable24: TppSystemVariable
        OnPrint = LblSistemaPrint
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
        mmLeft = 0
        mmTop = 3175
        mmWidth = 280459
        BandType = 8
      end
      object ppSystemVariable25: TppSystemVariable
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
        mmLeft = 251619
        mmTop = 3175
        mmWidth = 28840
        BandType = 8
      end
    end
    object ppGroup12: TppGroup
      BreakName = 'DATA'
      DataPipeline = ppBDEConsFundoEmol
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEConsFundoEmol'
      object ppGroupHeaderBand12: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand12: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppBDEConsFundoEmol: TppBDEPipeline
    DataSource = DsConsFundoEmol
    UserName = 'BDEConsFundoEmol'
    Left = 91
    Top = 61
  end
  object DsConsFundoEmol: TwwDataSource
    AutoEdit = False
    DataSet = QryConsFundoEmol
    Left = 91
    Top = 109
  end
  object QryConsFundoEmol: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DESCFUNDOINVEST, DESCTIPOOPERACAO, DATA, VLRCOTA, DATACOT' +
        'IZACAO, DATALIQUIDACAO, VALOR,'
      
        '       VLRCOLOCACAO, VLRTAXAS, VLRCORRETAGEM, VLRTOTAL, IDTIPOOP' +
        'ERACAO, PLANPRVCONTABPATRO, DESCTIPOCOTA'
      
        'FROM ( (SELECT FUN.DESCFUNDOINVEST, TPO.DESCTIPOOPERACAO, DATAOP' +
        'ERACAO AS DATA, VLRCOTA,'
      
        '               APL.DATACOTIZACAO, APL.DATALIQUIDACAO, VLROPERACA' +
        'O AS VALOR, VLRCOLOCACAO,'
      '               VLRTAXAS, VLRCORRETAGEM,'
      
        '               (VLROPERACAO-(VLRCOLOCACAO+VLRTAXAS+VLRCORRETAGEM' +
        ')) VLRTOTAL,'
      
        '               TPO.IDTIPOOPERACAO, PLANO.PLANPRVCONTABPATRO, TC.' +
        'DESCTIPOCOTA'
      
        '        FROM HISTFUNDOINVEST FUN, OPERACAOFUNDO APL, TIPOOPERACA' +
        'O TPO,'
      
        '             (SELECT PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.ID' +
        'PATRO,'
      
        '                     (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTA' +
        'BPATRO'
      
        '              FROM   PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREV' +
        'CONTABIL PL'
      '              WHERE  (PA.IDPATRO = PE.IDPESSOA(+))'
      
        '                AND  (PA.IDPLANOPREV = PL.IDPLANOPREV) ) PLANO, ' +
        'TIPOCOTA TC'
      '        WHERE'
      '              (APL.IDTIPOINVEST = :IDTIPOINVEST)'
      ''
      
        '          AND  (((:IDPLANPREVCTBPATR IS NOT NULL) AND (APL.IDPLA' +
        'NPREVCTBPATR =:IDPLANPREVCTBPATR))  OR'
      '                 (:IDPLANPREVCTBPATR IS NULL) )'
      ''
      
        '          AND  (((:IDFUNDOINVEST IS NOT NULL) AND (APL.IDFUNDOIN' +
        'VEST =:IDFUNDOINVEST))  OR'
      '                 (:IDFUNDOINVEST IS NULL) )'
      ''
      
        '          AND (APL.DATAOPERACAO BETWEEN :DATAMOVFUNDOINICIO AND ' +
        ':DATAMOVFUNDOFIM)'
      ''
      
        '          AND  ((:IDTIPOCOTA IS NULL) OR (APL.IDTIPOCOTA =:IDTIP' +
        'OCOTA))'
      ''
      '          AND (TPO.IDTIPOINVEST      = APL.IDTIPOINVEST)'
      '          AND (TPO.IDTIPOOPERACAO    = APL.IDTIPOOPERACAO)'
      '          AND (TPO.NATUREZAOPERACAO  = '#39'A'#39')'
      ''
      '          AND (APL.IDFUNDOINVEST     = FUN.IDFUNDOINVEST)'
      '          AND  FUN.IDFUNDOINVEST || FUN.DTAVIGENCIA ='
      '                  (SELECT IDFUNDOINVEST || MAX(DTAVIGENCIA)'
      '               FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '               WHERE'
      '                    TF.IDTIPOINVEST        = :IDTIPOINVEST'
      
        '               AND ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFU' +
        'NDOINVEST = :IDTIPOFUNDOINVEST))'
      '               AND    HF.DTAVIGENCIA      <  APL.DATAOPERACAO+1'
      
        '               AND    HF.IDTIPOFUNDOINVEST =  TF.IDTIPOFUNDOINVE' +
        'ST'
      '               AND    HF.IDFUNDOINVEST     = APL.IDFUNDOINVEST'
      '                   GROUP BY IDFUNDOINVEST)'
      '          AND (PLANO.IDPLANPREVCTBPATR = APL.IDPLANPREVCTBPATR)'
      '          AND    (TC.IDTIPOCOTA(+)     = APL.IDTIPOCOTA))'
      ''
      '        UNION'
      ''
      
        '       (SELECT FUN.DESCFUNDOINVEST, TPO.DESCTIPOOPERACAO, DATAPE' +
        'DIDO AS DATA, VLRCOTA,'
      
        '               RES.DATACOTIZACAO, RES.DATALIQUIDACAO, VLRPEDIDO ' +
        'AS VALOR, VLRCOLOCACAO,'
      '               VLRTAXAS, VLRCORRETAGEM,'
      
        '               (VLRPEDIDO-(VLRCOLOCACAO+VLRTAXAS+VLRCORRETAGEM))' +
        ' VLRTOTAL,'
      
        '               TPO.IDTIPOOPERACAO, PLANO.PLANPRVCONTABPATRO, TC.' +
        'DESCTIPOCOTA'
      
        '        FROM  HISTFUNDOINVEST FUN, PEDIDOFUNDO RES, TIPOOPERACAO' +
        ' TPO,'
      
        '              (SELECT PA.IDPLANPREVCTBPATR, PA.IDPLANOPREV, PA.I' +
        'DPATRO,'
      
        '                      (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONT' +
        'ABPATRO'
      
        '               FROM   PESSOA PE, PLANPREVCONTABPATRO PA, PLANPRE' +
        'VCONTABIL PL'
      '               WHERE  (PA.IDPATRO = PE.IDPESSOA(+))'
      
        '                 AND  (PA.IDPLANOPREV = PL.IDPLANOPREV) ) PLANO,' +
        ' TIPOCOTA TC'
      '        WHERE'
      '              (RES.IDTIPOINVEST = :IDTIPOINVEST)          '
      
        '          AND  (((:IDPLANPREVCTBPATR IS NOT NULL) AND (RES.IDPLA' +
        'NPREVCTBPATR =:IDPLANPREVCTBPATR))  OR'
      '                 (:IDPLANPREVCTBPATR IS NULL) )'
      
        '          AND  (((:IDFUNDOINVEST IS NOT NULL) AND (RES.IDFUNDOIN' +
        'VEST =:IDFUNDOINVEST)) OR'
      '                 (:IDFUNDOINVEST IS NULL) )'
      
        '          AND (RES.DATAPEDIDO BETWEEN :DATAMOVFUNDOINICIO AND :D' +
        'ATAMOVFUNDOFIM)'
      
        '          AND   ((:IDTIPOCOTA IS NULL) OR (RES.IDTIPOCOTA =:IDTI' +
        'POCOTA))'
      ''
      '          AND (TPO.IDTIPOOPERACAO    = RES.IDTIPOOPERACAO)'
      ''
      '          AND (RES.IDFUNDOINVEST     = FUN.IDFUNDOINVEST)'
      '          AND  FUN.IDFUNDOINVEST || FUN.DTAVIGENCIA ='
      '                  (SELECT IDFUNDOINVEST || MAX(DTAVIGENCIA)'
      '               FROM HISTFUNDOINVEST HF, TIPOFUNDOINVEST TF'
      '               WHERE'
      '                    TF.IDTIPOINVEST        = :IDTIPOINVEST'
      
        '               AND ((:IDTIPOFUNDOINVEST IS NULL) OR (HF.IDTIPOFU' +
        'NDOINVEST = :IDTIPOFUNDOINVEST))'
      '               AND    HF.DTAVIGENCIA      <  RES.DATAPEDIDO+1'
      
        '               AND    HF.IDTIPOFUNDOINVEST =  TF.IDTIPOFUNDOINVE' +
        'ST'
      '               AND    HF.IDFUNDOINVEST     = RES.IDFUNDOINVEST'
      '                   GROUP BY IDFUNDOINVEST)'
      '          AND (PLANO.IDPLANPREVCTBPATR = RES.IDPLANPREVCTBPATR'
      '          AND    (TC.IDTIPOCOTA(+)     = RES.IDTIPOCOTA))'
      '       )'
      '     )'
      
        'ORDER BY PLANPRVCONTABPATRO, DATA, DESCFUNDOINVEST, DESCTIPOOPER' +
        'ACAO')
    ValidateWithMask = True
    Left = 92
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOINICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDOFIM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptInput
      end>
    object QryConsFundoEmolDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 34
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryConsFundoEmolDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 25
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryConsFundoEmolDATALIQUIDACAO: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATALIQUIDACAO'
    end
    object QryConsFundoEmolVLRCOTA: TFloatField
      DisplayLabel = 'Cota'
      DisplayWidth = 16
      FieldName = 'VLRCOTA'
    end
    object QryConsFundoEmolVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 16
      FieldName = 'VALOR'
    end
    object QryConsFundoEmolVLRCOLOCACAO: TFloatField
      DisplayLabel = 'Comissão Coloc.'
      DisplayWidth = 12
      FieldName = 'VLRCOLOCACAO'
    end
    object QryConsFundoEmolVLRTAXAS: TFloatField
      DisplayLabel = 'Taxas e Emol.'
      DisplayWidth = 12
      FieldName = 'VLRTAXAS'
    end
    object QryConsFundoEmolVLRCORRETAGEM: TFloatField
      DisplayLabel = 'Corretagem'
      DisplayWidth = 12
      FieldName = 'VLRCORRETAGEM'
    end
    object QryConsFundoEmolVLRTOTAL: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 16
      FieldName = 'VLRTOTAL'
    end
    object QryConsFundoEmolPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 113
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object QryConsFundoEmolDATA: TDateTimeField
      FieldName = 'DATA'
      Visible = False
    end
    object QryConsFundoEmolDATACOTIZACAO: TDateTimeField
      FieldName = 'DATACOTIZACAO'
      Visible = False
    end
    object QryConsFundoEmolIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryConsFundoEmolDESCTIPOCOTA: TStringField
      FieldName = 'DESCTIPOCOTA'
      Visible = False
      Size = 40
    end
  end
end
