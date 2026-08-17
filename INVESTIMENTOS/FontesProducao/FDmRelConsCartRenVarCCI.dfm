inherited DmRelConsCartRenVarCCI: TDmRelConsCartRenVarCCI
  Left = 564
  Top = 300
  Width = 326
  Caption = 'DmRelConsCartRenVarCCI'
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
    Left = 226
    DataPipelineName = 'pplExemplo'
  end
  object pplConsCartRenVarCCI: TppBDEPipeline
    DataSource = dsConsCartRenVarCCI
    UserName = 'pplConsCartRenVarCCI'
    Left = 165
    Top = 72
  end
  object dsConsCartRenVarCCI: TwwDataSource
    DataSet = qryConsCartRenVarCCI
    Left = 103
    Top = 72
  end
  object qryConsCartRenVarCCI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DESCCARTINVEST, PLANPRVCONTABPATRO, NOMEEMISSOR, DESCINVE' +
        'STIMENTO, CODISIN, '
      '       IDCARTEIRAINVEST, DATAMOVCARTINV, IDEMISSOR,'
      '       SUM(QTDE) AS QTDE,'
      '       SUM(QTDECC) AS QTDECC,'
      '       SUM(QTDECCI) AS QTDECCI,'
      '       SUM(QTDEANTERIOR) AS QTDEANTERIOR,'
      '       SUM(QTDECCANTERIOR) AS QTDECCANTERIOR,'
      '       SUM(QTDECCIANTERIOR) AS QTDECCIANTERIOR'
      'FROM ('
      
        '   SELECT DECODE(:VARGROUP,'#39'A'#39',DESCCARTINVEST,'#39#39') AS DESCCARTINV' +
        'EST, PLANPRVCONTABPATRO,'
      
        '          NOMEEMISSOR, DESCINVESTIMENTO, CODISIN, IDEMISSOR, DAT' +
        'AMOVCARTINV,'
      
        '          DECODE(:VARGROUP,'#39'A'#39',IDCARTEIRAINVEST,1) AS IDCARTEIRA' +
        'INVEST,'
      '          QTDE,'
      '          QTDECC,'
      '          QTDECCI,'
      '          QTDEANTERIOR,'
      '          QTDECCANTERIOR,'
      '          QTDECCIANTERIOR'
      '   FROM ('
      
        '      SELECT DESCCARTINVEST, PLANPRVCONTABPATRO, NOMEEMISSOR, DE' +
        'SCINVESTIMENTO,'
      
        '             CODISIN, DATAMOVCARTINV, IDEMISSOR, IDCARTEIRAINVES' +
        'T,'
      '             QTDE,'
      '             QTDECC,'
      '             QTDECCI,'
      '             QTDEANTERIOR,'
      '             QTDECCANTERIOR,'
      '             QTDECCIANTERIOR'
      '      FROM ('
      '         SELECT DISTINCT'
      
        '            DECODE(:IDCARTEIRAGERENC, NULL, CA.DESCCARTINVEST, C' +
        'G.DESCCARTGERENC) AS DESCCARTINVEST,'
      '            PP.PLANPRVCONTABPATRO,'
      '            PS.NOME AS NOMEEMISSOR,'
      '            IV.DESCINVESTIMENTO,'
      '            IV.CODISIN,'
      '            NVL(H1.SALDOQTDEINVCART,0) AS QTDE,'
      '            NVL(H1.SALDOQTDECPMF,0) AS QTDECC,'
      
        '            (NVL(H1.SALDOQTDEINVCART,0) - NVL(H1.SALDOQTDECPMF,0' +
        ')) AS QTDECCI,'
      '            SALDOANTERIOR.SALDOQTDEINVCART AS QTDEANTERIOR,'
      '            SALDOANTERIOR.QTDECC AS QTDECCANTERIOR,'
      '            SALDOANTERIOR.QTDECCI AS QTDECCIANTERIOR,'
      '            H1.DATAMOVCARTINV, IV.IDEMISSOR,'
      '            H1.IDCARTEIRAINVEST'
      '         FROM'
      '            HISTCARTINV H1,'
      
        '           (SELECT HA.IDPLANPREVCTBPATR, HA.IDCARTEIRAINVEST, HA' +
        '.IDINVESTIMENTO, HA.SALDOQTDEINVCART,'
      '               NVL(HA.SALDOQTDECPMF,0) AS QTDECC,'
      
        '              (NVL(HA.SALDOQTDEINVCART,0) - NVL(HA.SALDOQTDECPMF' +
        ',0)) AS QTDECCI, HA.SALDOVLRINVCART'
      '            FROM HISTCARTINV HA'
      '            WHERE (HA.IDHISTCARTINV IN'
      '                   (SELECT MAX(HA2.IDHISTCARTINV)'
      '                    FROM HISTCARTINV HA2'
      '                    WHERE (HA2.IDTIPOINVEST = 2)'
      
        '                      AND ((:IDPLANPREVCTBPATR IS NULL) OR (HA2.' +
        'IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                      AND ((:IDCARTEIRAINVEST IS NULL)  OR (HA2.' +
        'IDCARTEIRAINVEST = :IDCARTEIRAINVEST))'
      
        '                      AND (((:IDCARTEIRAGERENC IS NOT NULL) AND ' +
        '(HA2.IDCARTEIRAGERENC = :IDCARTEIRAGERENC)) OR'
      
        '                           ((:IDCARTEIRAGERENC IS NULL)     AND ' +
        '(HA2.IDCARTEIRAGERENC IS NULL) ) )'
      
        '                      AND (HA2.DATAMOVCARTINV || HA2.IDINVESTIME' +
        'NTO) IN'
      
        '                                (SELECT (MAX(HA3.DATAMOVCARTINV)' +
        ' || HA3.IDINVESTIMENTO)'
      '                                 FROM HISTCARTINV HA3'
      '                                 WHERE (HA3.IDTIPOINVEST = 2)'
      
        '                                   AND ((:IDPLANPREVCTBPATR IS N' +
        'ULL) OR (HA3.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                                   AND ((:IDCARTEIRAINVEST IS NU' +
        'LL)  OR (HA3.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))'
      
        '                                   AND (((:IDCARTEIRAGERENC IS N' +
        'OT NULL) AND (HA3.IDCARTEIRAGERENC = :IDCARTEIRAGERENC))    OR'
      
        '                                        ((:IDCARTEIRAGERENC IS N' +
        'ULL)     AND (HA3.IDCARTEIRAGERENC IS NULL)) )'
      
        '                                   AND (HA3.DATAMOVCARTINV = TO_' +
        'DATE(:DATAANT,'#39'DD/MM/YYYY'#39'))'
      '                                 GROUP BY HA3.IDINVESTIMENTO)'
      
        '                    GROUP BY HA2.IDPLANPREVCTBPATR, HA2.IDCARTEI' +
        'RAINVEST, HA2.IDINVESTIMENTO) )'
      
        '              AND (HA.SALDOVLRINVCART IS NOT NULL )) SALDOANTERI' +
        'OR,'
      ''
      
        '            INVESTIMENTO IV, CARTEIRAINVEST CA, CARTEIRAGERENC C' +
        'G, PESSOA PS, VWPLANPREVCTBPATR PP'
      ''
      '         WHERE (H1.IDTIPOINVEST = 2)'
      
        '           AND ((:IDPLANPREVCTBPATR IS NULL) OR (H1.IDPLANPREVCT' +
        'BPATR = :IDPLANPREVCTBPATR))'
      
        '           AND ((:IDCARTEIRAINVEST IS NULL)  OR (H1.IDCARTEIRAIN' +
        'VEST = :IDCARTEIRAINVEST))'
      
        '           AND (((:IDCARTEIRAGERENC IS NOT NULL) AND (H1.IDCARTE' +
        'IRAGERENC = :IDCARTEIRAGERENC))    OR'
      
        '                ((:IDCARTEIRAGERENC IS NULL)     AND (H1.IDCARTE' +
        'IRAGERENC IS NULL) ) )'
      '           AND (H1.IDHISTCARTINV  IN'
      '                (SELECT MAX(H2.IDHISTCARTINV)'
      '                 FROM HISTCARTINV H2'
      '                 WHERE (H2.IDTIPOINVEST = 2)'
      
        '                   AND ((:IDPLANPREVCTBPATR IS NULL) OR (H2.IDPL' +
        'ANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                   AND ((:IDCARTEIRAINVEST IS NULL)  OR (H2.IDCA' +
        'RTEIRAINVEST = :IDCARTEIRAINVEST))'
      
        '                   AND (((:IDCARTEIRAGERENC IS NOT NULL) AND (H2' +
        '.IDCARTEIRAGERENC = :IDCARTEIRAGERENC))    OR'
      
        '                        ((:IDCARTEIRAGERENC IS NULL)     AND (H2' +
        '.IDCARTEIRAGERENC IS NULL) ) )'
      
        '                   AND (H2.DATAMOVCARTINV || H2.IDINVESTIMENTO) ' +
        'IN'
      
        '                            (SELECT (MAX(H3.DATAMOVCARTINV) || H' +
        '3.IDINVESTIMENTO)'
      '                             FROM HISTCARTINV H3'
      '                             WHERE (H3.IDTIPOINVEST = 2)'
      
        '                               AND ((:IDPLANPREVCTBPATR IS NULL)' +
        ' OR (H3.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '                               AND ((:IDCARTEIRAINVEST IS NULL) ' +
        ' OR (H3.IDCARTEIRAINVEST = :IDCARTEIRAINVEST))'
      
        '                               AND (((:IDCARTEIRAGERENC IS NOT N' +
        'ULL) AND (H3.IDCARTEIRAGERENC = :IDCARTEIRAGERENC))    OR'
      
        '                                    ((:IDCARTEIRAGERENC IS NULL)' +
        '     AND (H3.IDCARTEIRAGERENC IS NULL) ) )'
      
        '                               AND'#9'(H3.DATAMOVCARTINV  = TO_DATE' +
        '(:DATAATU,'#39'DD/MM/YYYY'#39'))'
      '                             GROUP BY H3.IDINVESTIMENTO)'
      
        '                 GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINV' +
        'EST, H2.IDINVESTIMENTO))'
      '           AND (NVL(H1.SALDOQTDEINVCART,0)        <> 0)'
      
        '           AND ((:IDEMISSOR IS NULL) OR (IV.IDEMISSOR = :IDEMISS' +
        'OR))'
      
        '           AND (IV.IDINVESTIMENTO(+)              = H1.IDINVESTI' +
        'MENTO)'
      '           AND (IV.IDEMISSOR                      = PS.IDPESSOA)'
      
        '           AND (CA.IDCARTEIRAINVEST(+)            = H1.IDCARTEIR' +
        'AINVEST)'
      
        '           AND (CG.IDCARTEIRAGERENC(+)            = H1.IDCARTEIR' +
        'AGERENC)'
      
        '           AND (SALDOANTERIOR.IDCARTEIRAINVEST(+) = H1.IDCARTEIR' +
        'AINVEST)'
      
        '           AND (SALDOANTERIOR.IDINVESTIMENTO(+)   = H1.IDINVESTI' +
        'MENTO)'
      
        '           AND (SALDOANTERIOR.IDPLANPREVCTBPATR(+)= H1.IDPLANPRE' +
        'VCTBPATR)'
      
        '           AND (PP.IDPLANPREVCTBPATR              = H1.IDPLANPRE' +
        'VCTBPATR)'
      
        '         ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, NOMEEMISSO' +
        'R, IV.DESCINVESTIMENTO'
      '      ) '
      '     )'
      '    )'
      
        'GROUP BY PLANPRVCONTABPATRO, DESCCARTINVEST, NOMEEMISSOR, DESCIN' +
        'VESTIMENTO, DATAMOVCARTINV,'
      '         CODISIN, IDCARTEIRAINVEST, IDEMISSOR'
      
        'ORDER BY PLANPRVCONTABPATRO, DESCCARTINVEST, NOMEEMISSOR, DESCIN' +
        'VESTIMENTO')
    ValidateWithMask = True
    Left = 42
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'VARGROUP'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'VARGROUP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAANT'
        ParamType = ptInput
        Value = '31/08/2006'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
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
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAATU'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptInput
      end>
    object qryConsCartRenVarCCIPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryConsCartRenVarCCIDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 30
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryConsCartRenVarCCIQTDECC: TFloatField
      DisplayLabel = 'Quantidade~Antiga'
      DisplayWidth = 15
      FieldName = 'QTDECC'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryConsCartRenVarCCIQTDECCI: TFloatField
      DisplayLabel = 'Quantidade~Nova'
      DisplayWidth = 15
      FieldName = 'QTDECCI'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryConsCartRenVarCCIQTDE: TFloatField
      DisplayLabel = 'Quantidade~ Total'
      DisplayWidth = 15
      FieldName = 'QTDE'
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryConsCartRenVarCCIDESCCARTINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 33
      FieldName = 'DESCCARTINVEST'
      Visible = False
      Size = 60
    end
    object qryConsCartRenVarCCIQTDEANTERIOR: TFloatField
      DisplayLabel = 'Quantidade~ Anterior'
      DisplayWidth = 15
      FieldName = 'QTDEANTERIOR'
      Visible = False
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryConsCartRenVarCCIQTDECCANTERIOR: TFloatField
      DisplayLabel = 'Quantidade~ Antiga Anterior'
      DisplayWidth = 15
      FieldName = 'QTDECCANTERIOR'
      Visible = False
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryConsCartRenVarCCIQTDECCIANTERIOR: TFloatField
      DisplayLabel = 'Quantidade~ Nova Anterior'
      DisplayWidth = 15
      FieldName = 'QTDECCIANTERIOR'
      Visible = False
      DisplayFormat = '###,###,###,###,##0'
    end
    object qryConsCartRenVarCCINOMEEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 33
      FieldName = 'NOMEEMISSOR'
      Visible = False
      Size = 60
    end
    object qryConsCartRenVarCCICODISIN: TStringField
      DisplayLabel = 'Código ISIN'
      DisplayWidth = 16
      FieldName = 'CODISIN'
      Visible = False
      Size = 14
    end
    object qryConsCartRenVarCCIDATAMOVCARTINV: TDateTimeField
      DisplayLabel = 'Data da~Cotação'
      DisplayWidth = 10
      FieldName = 'DATAMOVCARTINV'
      Visible = False
    end
    object qryConsCartRenVarCCIIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
  end
  object rptConsCartRenVarCCI: TppReport
    AutoStop = False
    DataPipeline = pplConsCartRenVarCCI
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldo de Quantidades da Carteira de Renda Variável'
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
    Left = 226
    Top = 72
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplConsCartRenVarCCI'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28840
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'shpEmissor1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 10319
        mmLeft = 0
        mmTop = 18521
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Saldo de Quantidades da Carteira de Renda Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 87577
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
      object lblData: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 14023
        mmWidth = 11113
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplConsCartRenVarCCI
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsCartRenVarCCI'
        mmHeight = 3704
        mmLeft = 83079
        mmTop = 14023
        mmWidth = 112448
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label2'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 24342
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 162984
        mmTop = 24342
        mmWidth = 32545
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Antiga'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3970
        mmLeft = 88636
        mmTop = 24342
        mmWidth = 32545
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Nova'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3970
        mmLeft = 125413
        mmTop = 24342
        mmWidth = 32545
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 85725
        mmTop = 19315
        mmWidth = 111654
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10054
        mmLeft = 85725
        mmTop = 18785
        mmWidth = 6350
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 85725
        mmTop = 23813
        mmWidth = 111390
        BandType = 0
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 122238
        mmTop = 23813
        mmWidth = 2910
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 159015
        mmTop = 23813
        mmWidth = 2910
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplConsCartRenVarCCI
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsCartRenVarCCI'
        mmHeight = 3704
        mmLeft = 112713
        mmTop = 8731
        mmWidth = 83344
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppRepExeDireitoShape2: TppShape
        OnPrint = ppRepExeDireitoShape2Print
        UserName = 'ppRepExeDireitoShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 265
        mmTop = 0
        mmWidth = 197115
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplConsCartRenVarCCI
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConsCartRenVarCCI'
        mmHeight = 3175
        mmLeft = 4498
        mmTop = 794
        mmWidth = 79375
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'QTDECC'
        DataPipeline = pplConsCartRenVarCCI
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsCartRenVarCCI'
        mmHeight = 3175
        mmLeft = 88900
        mmTop = 794
        mmWidth = 32544
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'QTDECCI'
        DataPipeline = pplConsCartRenVarCCI
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsCartRenVarCCI'
        mmHeight = 3175
        mmLeft = 125413
        mmTop = 794
        mmWidth = 32544
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'QTDE'
        DataPipeline = pplConsCartRenVarCCI
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsCartRenVarCCI'
        mmHeight = 3175
        mmLeft = 163248
        mmTop = 794
        mmWidth = 32544
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
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
        mmWidth = 196850
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
        mmWidth = 196586
        BandType = 8
      end
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
        mmLeft = 170657
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplConsCartRenVarCCI
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConsCartRenVarCCI'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = pplConsCartRenVarCCI
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConsCartRenVarCCI'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object rptConsCartRVCCIGroup: TppReport
    AutoStop = False
    DataPipeline = pplConsCartRVCCIGroup
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldo de Quantidades da Carteira de Renda Variável'
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
    Left = 226
    Top = 136
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplConsCartRVCCIGroup'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 56621
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'shpEmissor1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 10319
        mmLeft = 0
        mmTop = 46302
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label11'
        Caption = 'Saldo de Quantidades da Carteira de Renda Variável'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 87577
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
      object lblDataGroup: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 14023
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label2'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 4233
        mmTop = 52123
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 162984
        mmTop = 52123
        mmWidth = 32544
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Antiga'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 88636
        mmTop = 52123
        mmWidth = 32544
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Nova'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 125413
        mmTop = 52123
        mmWidth = 32544
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Quantidade'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 3969
        mmLeft = 85725
        mmTop = 47096
        mmWidth = 111654
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 10054
        mmLeft = 85725
        mmTop = 46567
        mmWidth = 6350
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 85725
        mmTop = 51594
        mmWidth = 111390
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 122238
        mmTop = 51594
        mmWidth = 2910
        BandType = 0
      end
      object ppLine7: TppLine
        UserName = 'Line101'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 159015
        mmTop = 51594
        mmWidth = 2910
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText2'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplConsCartRVCCIGroup
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsCartRVCCIGroup'
        mmHeight = 3704
        mmLeft = 112713
        mmTop = 8202
        mmWidth = 83344
        BandType = 0
      end
      object ppShape19: TppShape
        UserName = 'Shape19'
        mmHeight = 22490
        mmLeft = 24871
        mmTop = 23283
        mmWidth = 172244
        BandType = 0
      end
      object ppMemoGroup: TppMemo
        UserName = 'MemoGroup'
        Caption = 'MemoGroup'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 20902
        mmLeft = 25665
        mmTop = 24077
        mmWidth = 170657
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel66: TppLabel
        UserName = 'Label66'
        Caption = 'Carteira de Investimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 19050
        mmWidth = 43127
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppRepExeDireitoShape2Print
        UserName = 'ppRepExeDireitoShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 265
        mmTop = 0
        mmWidth = 197115
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplConsCartRVCCIGroup
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConsCartRVCCIGroup'
        mmHeight = 3175
        mmLeft = 4498
        mmTop = 794
        mmWidth = 79375
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText9'
        DataField = 'QTDECC'
        DataPipeline = pplConsCartRVCCIGroup
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsCartRVCCIGroup'
        mmHeight = 3175
        mmLeft = 88900
        mmTop = 794
        mmWidth = 32544
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText10'
        DataField = 'QTDECCI'
        DataPipeline = pplConsCartRVCCIGroup
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsCartRVCCIGroup'
        mmHeight = 3175
        mmLeft = 125413
        mmTop = 794
        mmWidth = 32544
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText8'
        DataField = 'QTDE'
        DataPipeline = pplConsCartRVCCIGroup
        DisplayFormat = '###,###,###,###,##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsCartRVCCIGroup'
        mmHeight = 3175
        mmLeft = 163248
        mmTop = 794
        mmWidth = 32544
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLabel17: TppLabel
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
        mmWidth = 196850
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 196586
        BandType = 8
      end
      object ppLine8: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
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
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplConsCartRVCCIGroup
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConsCartRVCCIGroup'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplConsCartRVCCIGroup: TppBDEPipeline
    DataSource = dsConsCartRenVarCCI
    UserName = 'pplConsCartRVCCIGroup'
    Left = 165
    Top = 136
  end
end
