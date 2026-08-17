inherited DMConsComposicaoCarteira: TDMConsComposicaoCarteira
  Left = 317
  Top = 220
  Caption = 'DMConsComposicaoCarteira'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      mmHeight = 28840
      inherited Label11: TppLabel [0]
      end
      inherited LblEmpresa: TppLabel [1]
      end
      inherited ppLCarteiraEx: TppLabel [2]
      end
      inherited ppDbLogo: TppDBImage [3]
      end
      inherited ppLPeriodo: TppLabel [4]
      end
      inherited Line1: TppLine [5]
        mmTop = 28046
      end
    end
  end
  object qryPlanPrevCtbPatr: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLAN' +
        'PRVCONTABPATRO'
      'FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      'WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '  AND (PA.IDPLANOPREV = PL.IDPLANOPREV)')
    ValidateWithMask = True
    Left = 210
    Top = 75
    object qryPlanPrevCtbPatrPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanPrevCtbPatrIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
  end
  object qryConsCompCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   (OP.DATAOPERACAO) AS DATAOPERACAO,'
      '   (OP.VENCOPERACAO) AS DATAVENCTO,'
      '   (SALDOQTDHISTRENFI) AS QUANTIDADE,'
      '   (HR.SALDOVLRHISTRENFI) AS VALORMERCADO,'
      '   (IV.DESCINVESTIMENTO) AS ATIVO,'
      '   (EM.SIGLAEMISSOR) AS EMISSOR,'
      '   (IV.IDCLASSETIT) AS IDCLASSE,'
      '   (CL.DESCCLASSETIT) AS CLASSETITULO,'
      '   (PP.PLANPRVCONTABPATRO) AS PLANPATRO,'
      '   ('#39'RENDA FIXA'#39') AS TIPOMODULO'
      'FROM'
      
        '   HISTRENFIX HR,  INVESTIMENTO IV, EMISSOR EM, PARAMINVEST PV, ' +
        'CLASSETITRENFIX CL,'
      
        '   (SELECT PA.IDPLANPREVCTBPATR, ('#39'Plano / Patrocinadora: '#39' || P' +
        'L.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      '    FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL PL'
      '    WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '      AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      
        '(SELECT IDOPERRENFIXAPLIC, DATAOPERACAO, VENCOPERACAO FROM OPERR' +
        'ENFIX'
      ' WHERE IDOPERRENFIX = IDOPERRENFIXAPLIC) OP'
      'WHERE'
      
        '  ((:IDPLANPREVCTBPATR IS NULL)  OR (HR.IDPLANPREVCTBPATR = :IDP' +
        'LANPREVCTBPATR))'
      
        '  AND ((OP.VENCOPERACAO >= TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39')) OR (O' +
        'P.VENCOPERACAO IS NULL))'
      '  AND (HR.IDHISTRENFIX IN (SELECT MAX(H1.IDHISTRENFIX)'
      '                           FROM HISTRENFIX H1'
      
        '                           WHERE ((:IDPLANPREVCTBPATR IS NULL) O' +
        'R (H1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                             AND (H1.DATAHISTRENFIX <= TO_DATE(:' +
        'DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                             AND ((H1.DATAHISTRENFIX || H1.IDPLA' +
        'NPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC) IN'
      
        '                                         (SELECT MAX(H2.DATAHIST' +
        'RENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2.IDOPE' +
        'RRENFIXAPLIC'
      '                                          FROM HISTRENFIX H2'
      
        '                                          WHERE ((:IDPLANPREVCTB' +
        'PATR IS NULL) OR (H2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                            AND ( H2.DATAHISTREN' +
        'FIX <= TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                          GROUP BY H2.IDPLANPREV' +
        'CTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                           GROUP BY H1.DATAHISTRENFIX, H1.IDPLAN' +
        'PREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '  AND (HR.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR)'
      '  AND (HR.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      '  AND (IV.IDEMISSOR = EM.IDEMISSOR)'
      '  AND (IV.IDCLASSETIT = CL.IDCLASSETIT)'
      '  AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIXAPLIC)'
      '  AND (HR.SALDOQTDHISTRENFI > 0)'
      
        'ORDER BY TIPOMODULO, CL.DESCCLASSETIT, IV.DESCINVESTIMENTO, OP.D' +
        'ATAOPERACAO, PP.PLANPRVCONTABPATRO'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 50
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end>
    object qryConsCompCarteiraTIPOMODULO: TStringField
      DisplayLabel = 'Módulo'
      DisplayWidth = 15
      FieldName = 'TIPOMODULO'
      FixedChar = True
      Size = 10
    end
    object qryConsCompCarteiraCLASSETITULO: TStringField
      DisplayLabel = 'Classe'
      DisplayWidth = 39
      FieldName = 'CLASSETITULO'
      Size = 30
    end
    object qryConsCompCarteiraATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 28
      FieldName = 'ATIVO'
      Size = 60
    end
    object qryConsCompCarteiraEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 15
      FieldName = 'EMISSOR'
      Size = 15
    end
    object qryConsCompCarteiraDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data Emissão'
      DisplayWidth = 12
      FieldName = 'DATAOPERACAO'
    end
    object qryConsCompCarteiraDATAVENCTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 11
      FieldName = 'DATAVENCTO'
    end
    object qryConsCompCarteiraQUANTIDADE: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 15
      FieldName = 'QUANTIDADE'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryConsCompCarteiraVALORMERCADO: TFloatField
      DisplayLabel = 'Valor Mercado'
      DisplayWidth = 18
      FieldName = 'VALORMERCADO'
      DisplayFormat = '###,###,###,###,##0.00'
    end
    object qryConsCompCarteiraPLANPATRO: TStringField
      DisplayLabel = 'Plano / Patro'
      DisplayWidth = 42
      FieldName = 'PLANPATRO'
      Size = 136
    end
    object qryConsCompCarteiraIDCLASSE: TFloatField
      FieldName = 'IDCLASSE'
      Visible = False
    end
  end
  object dsConsCompCarteira: TwwDataSource
    AutoEdit = False
    DataSet = qryConsCompCarteira
    Left = 55
    Top = 136
  end
  object pplConsCompCarteira: TppBDEPipeline
    DataSource = dsConsCompCarteira
    UserName = 'lConsCompCarteira'
    Left = 205
    Top = 128
  end
  object rptComposicaoCarteira: TppReport
    AutoStop = False
    DataPipeline = pplConsCompCarteira
    OnStartPage = rptComposicaoCarteiraStartPage
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
    Left = 202
    Top = 184
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplConsCompCarteira'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object shpCabecalho: TppShape
        UserName = 'shpCabecalho'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 5556
        mmLeft = 0
        mmTop = 21431
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Composição da Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 41275
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
        mmHeight = 5292
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
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'LPeriodo'
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
        mmWidth = 11113
        BandType = 0
      end
      object pplDescInvestimento: TppLabel
        UserName = 'Label1'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 3969
        mmTop = 22754
        mmWidth = 15081
        BandType = 0
      end
      object pplDesEmissor: TppLabel
        UserName = 'Label2'
        Caption = 'Emissor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 89429
        mmTop = 22754
        mmWidth = 9790
        BandType = 0
      end
      object pplDtEmissao: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Emissão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 2911
        mmLeft = 58208
        mmTop = 22754
        mmWidth = 12171
        BandType = 0
      end
      object pplDtVencto: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Vencimentos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 2911
        mmLeft = 73819
        mmTop = 22754
        mmWidth = 12700
        BandType = 0
      end
      object pplQuantidade: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 2911
        mmLeft = 122238
        mmTop = 22754
        mmWidth = 16933
        BandType = 0
      end
      object pplVlrMercado: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Valor de Mercado'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 2910
        mmLeft = 141552
        mmTop = 22754
        mmWidth = 25135
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3175
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 4
      end
      object ppdbQuantidade: TppDBText
        UserName = 'dbQuantidade'
        DataField = 'QUANTIDADE'
        DataPipeline = pplConsCompCarteira
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsCompCarteira'
        mmHeight = 2910
        mmLeft = 113506
        mmTop = 794
        mmWidth = 26458
        BandType = 4
      end
      object ppdbVencto: TppDBText
        UserName = 'dbVencto'
        DataField = 'DATAVENCTO'
        DataPipeline = pplConsCompCarteira
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConsCompCarteira'
        mmHeight = 2910
        mmLeft = 73025
        mmTop = 795
        mmWidth = 15080
        BandType = 4
      end
      object ppdbDtEmisssao: TppDBText
        UserName = 'dbDtEmisssao'
        DataField = 'DATAOPERACAO'
        DataPipeline = pplConsCompCarteira
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConsCompCarteira'
        mmHeight = 2910
        mmLeft = 57150
        mmTop = 794
        mmWidth = 15081
        BandType = 4
      end
      object ppdbDescEmissor: TppDBText
        UserName = 'dbDescEmissor'
        DataField = 'EMISSOR'
        DataPipeline = pplConsCompCarteira
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConsCompCarteira'
        mmHeight = 2910
        mmLeft = 89165
        mmTop = 794
        mmWidth = 23283
        BandType = 4
      end
      object ppdbDescInvestimento: TppDBText
        UserName = 'dbDescInvestimento'
        DataField = 'ATIVO'
        DataPipeline = pplConsCompCarteira
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConsCompCarteira'
        mmHeight = 2910
        mmLeft = 3969
        mmTop = 794
        mmWidth = 52388
        BandType = 4
      end
      object ppdbVlrMercado: TppDBText
        UserName = 'dbQuantidade1'
        DataField = 'VALORMERCADO'
        DataPipeline = pplConsCompCarteira
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsCompCarteira'
        mmHeight = 2910
        mmLeft = 141023
        mmTop = 794
        mmWidth = 26458
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
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
        mmWidth = 197909
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
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
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'TIPOMODULO'
      DataPipeline = pplConsCompCarteira
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConsCompCarteira'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppdbTipoModulo: TppDBText
          UserName = 'dbTipoModulo'
          DataField = 'TIPOMODULO'
          DataPipeline = pplConsCompCarteira
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'pplConsCompCarteira'
          mmHeight = 2910
          mmLeft = 1588
          mmTop = 1058
          mmWidth = 51065
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
