inherited DmRelPosPlanoModulo: TDmRelPosPlanoModulo
  Left = 402
  Top = 168
  Caption = 'DmRelPosPlanoModulo'
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
  end
  object pplPosicao: TppBDEPipeline
    DataSource = dsPosicao
    UserName = 'pplPosicao'
    Left = 157
    Top = 80
    object pplPosicaoppField1: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplPosicaoppField2: TppField
      FieldAlias = 'DESCTIPOINVEST'
      FieldName = 'DESCTIPOINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplPosicaoppField3: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplPosicaoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'SLDINV'
      FieldName = 'SLDINV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 3
    end
    object pplPosicaoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SLDPLANO'
      FieldName = 'SLDPLANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 22
      Position = 4
    end
    object pplPosicaoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCPLANO'
      FieldName = 'PERCPLANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 5
    end
    object pplPosicaoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SLDTPINVEST'
      FieldName = 'SLDTPINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 6
    end
    object pplPosicaoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCTPINV'
      FieldName = 'PERCTPINV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 7
    end
  end
  object dsPosicao: TwwDataSource
    AutoEdit = False
    DataSet = qryPosicao
    Left = 95
    Top = 80
  end
  object qryPosicao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PP.PLANPRVCONTABPATRO, TI.DESCTIPOINVEST, IV.DESCINVESTIM' +
        'ENTO, TOTIV.SALDO AS SLDINV,'
      
        '       TOTPLANO.SALDO AS SLDPLANO,    ((TOTIV.SALDO / TOTPLANO.S' +
        'ALDO) * 100) AS PERCPLANO,'
      
        '       TOTCART.SALDO  AS SLDTPINVEST, ((TOTIV.SALDO / TOTCART.SA' +
        'LDO) * 100)  AS PERCTPINV'
      ''
      
        'FROM (SELECT 1 AS IDTIPOINVEST, HR.IDPLANPREVCTBPATR, HR.IDINVES' +
        'TIMENTO, SUM(HR.SALDOVLRHISTRENFI) AS SALDO'
      '      FROM   HISTRENFIX HR, OPERRENFIX OP'
      
        '      WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))' +
        ' OR (OP.VENCOPERACAO IS NULL))'
      
        '        AND (HR.IDHISTRENFIX IN (SELECT MAX(H1.IDHISTRENFIX) AS ' +
        'IDHISTRENFIX'
      '                                 FROM HISTRENFIX H1'
      
        '                                 WHERE (H1.DATAHISTRENFIX = TO_D' +
        'ATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                   AND ((H1.DATAHISTRENFIX || H1' +
        '.IDPLANPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC)' +
        ' IN'
      
        '                                               (SELECT MAX(H2.DA' +
        'TAHISTRENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2' +
        '.IDOPERRENFIXAPLIC'
      
        '                                                FROM HISTRENFIX ' +
        'H2'
      
        '                                                WHERE ( H2.DATAH' +
        'ISTRENFIX = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                                GROUP BY H2.IDPL' +
        'ANPREVCTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                                 GROUP BY H1.DATAHISTRENFIX, H1.' +
        'IDPLANPREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '        AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '        AND (HR.SALDOQTDHISTRENFI > 0)'
      '        AND (HR.SALDOVLRHISTRENFI > 0)'
      '      GROUP BY HR.IDPLANPREVCTBPATR, HR.IDINVESTIMENTO'
      '      UNION'
      
        '      SELECT 2 AS IDTIPOINVEST, H.IDPLANPREVCTBPATR, H.IDINVESTI' +
        'MENTO, SUM(H.SALDOVLRINVCART) AS SALDO'
      '      FROM HISTCARTINV H'
      '      WHERE H.IDHISTCARTINV IN'
      '                (SELECT MAX(H1.IDHISTCARTINV)'
      '                 FROM HISTCARTINV H1'
      '                 WHERE (H1.IDCARTEIRAGERENC IS NULL)'
      '                   AND (H1.IDTIPOINVEST = 2)'
      
        '                   AND (H1.DATAMOVCARTINV || H1.IDINVESTIMENTO) ' +
        'IN'
      
        '                            (SELECT MAX(H2.DATAMOVCARTINV) || H2' +
        '.IDINVESTIMENTO'
      '                             FROM HISTCARTINV H2'
      
        '                             WHERE (H2.DATAMOVCARTINV <= TO_DATE' +
        '(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '                               AND (H2.IDCARTEIRAGERENC IS NULL)'
      '                               AND (H2.IDTIPOINVEST = 2)'
      '                             GROUP BY H2.IDINVESTIMENTO)'
      '                 GROUP BY H1.IDINVESTIMENTO)'
      '        AND H.IDCARTEIRAGERENC IS NULL'
      '        AND H.IDTIPOINVEST = 2'
      '        AND H.SALDOQTDEINVCART <> 0'
      '      GROUP BY H.IDPLANPREVCTBPATR, H.IDINVESTIMENTO) TOTIV,'
      ''
      '     (SELECT IDPLANPREVCTBPATR, SUM(SALDO) AS SALDO'
      '      FROM'
      
        '        (SELECT HR.IDPLANPREVCTBPATR, SUM(HR.SALDOVLRHISTRENFI) ' +
        'AS SALDO'
      '         FROM   HISTRENFIX HR, OPERRENFIX OP'
      
        '         WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39')) OR (OP.VENCOPERACAO IS NULL))'
      
        '           AND (HR.IDHISTRENFIX IN (SELECT MAX(H1.IDHISTRENFIX) ' +
        'AS IDHISTRENFIX'
      '                                    FROM HISTRENFIX H1'
      
        '                                    WHERE (H1.DATAHISTRENFIX = T' +
        'O_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND ((H1.DATAHISTRENFIX ||' +
        ' H1.IDPLANPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPL' +
        'IC) IN'
      
        '                                                  (SELECT MAX(H2' +
        '.DATAHISTRENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO ||' +
        ' H2.IDOPERRENFIXAPLIC'
      
        '                                                   FROM HISTRENF' +
        'IX H2'
      
        '                                                   WHERE ( H2.DA' +
        'TAHISTRENFIX = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                                   GROUP BY H2.I' +
        'DPLANPREVCTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                                    GROUP BY H1.DATAHISTRENFIX, ' +
        'H1.IDPLANPREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '           AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '           AND (HR.SALDOQTDHISTRENFI > 0)'
      '         GROUP BY HR.IDPLANPREVCTBPATR'
      '         UNION'
      
        '         SELECT H.IDPLANPREVCTBPATR, SUM(H.SALDOVLRINVCART) AS S' +
        'ALDO'
      '         FROM HISTCARTINV H'
      '         WHERE H.IDHISTCARTINV IN'
      '                   (SELECT MAX(H1.IDHISTCARTINV)'
      '                    FROM HISTCARTINV H1'
      '                    WHERE (H1.IDCARTEIRAGERENC IS NULL)'
      '                      AND (H1.IDTIPOINVEST = 2)'
      
        '                      AND (H1.DATAMOVCARTINV || H1.IDINVESTIMENT' +
        'O) IN'
      
        '                               (SELECT MAX(H2.DATAMOVCARTINV) ||' +
        ' H2.IDINVESTIMENTO'
      '                                FROM HISTCARTINV H2'
      
        '                                WHERE (H2.DATAMOVCARTINV <= TO_D' +
        'ATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                  AND (H2.IDCARTEIRAGERENC IS NU' +
        'LL)'
      '                                  AND (H2.IDTIPOINVEST = 2)'
      '                                GROUP BY H2.IDINVESTIMENTO)'
      '                    GROUP BY H1.IDINVESTIMENTO)'
      '           AND H.IDCARTEIRAGERENC IS NULL'
      '           AND H.IDTIPOINVEST = 2'
      '           AND H.SALDOQTDEINVCART <> 0'
      '         GROUP BY H.IDPLANPREVCTBPATR)'
      '      GROUP BY IDPLANPREVCTBPATR) TOTPLANO,'
      ''
      
        '     (SELECT 1 AS IDTIPOINVEST, SUM(HR.SALDOVLRHISTRENFI) AS SAL' +
        'DO'
      '      FROM   HISTRENFIX HR, OPERRENFIX OP'
      
        '      WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))' +
        ' OR (OP.VENCOPERACAO IS NULL))'
      
        '        AND (HR.IDHISTRENFIX IN (SELECT MAX(H1.IDHISTRENFIX) AS ' +
        'IDHISTRENFIX'
      '                                 FROM HISTRENFIX H1'
      
        '                                 WHERE (H1.DATAHISTRENFIX = TO_D' +
        'ATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                   AND ((H1.DATAHISTRENFIX || H1' +
        '.IDPLANPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC)' +
        ' IN'
      
        '                                               (SELECT MAX(H2.DA' +
        'TAHISTRENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2' +
        '.IDOPERRENFIXAPLIC'
      
        '                                                FROM HISTRENFIX ' +
        'H2'
      
        '                                                WHERE ( H2.DATAH' +
        'ISTRENFIX = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                                GROUP BY H2.IDPL' +
        'ANPREVCTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                                 GROUP BY H1.DATAHISTRENFIX, H1.' +
        'IDPLANPREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '        AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '        AND (HR.SALDOQTDHISTRENFI > 0)'
      '      GROUP BY HR.IDTIPOINVEST'
      '      UNION'
      '      SELECT 2 AS IDTIPOINVEST, SUM(H.SALDOVLRINVCART) AS SALDO'
      '      FROM HISTCARTINV H'
      '      WHERE H.IDHISTCARTINV IN'
      '                (SELECT MAX(H1.IDHISTCARTINV)'
      '                 FROM HISTCARTINV H1'
      '                 WHERE (H1.IDCARTEIRAGERENC IS NULL)'
      '                   AND (H1.IDTIPOINVEST = 2)'
      
        '                   AND (H1.DATAMOVCARTINV || H1.IDINVESTIMENTO) ' +
        'IN'
      
        '                            (SELECT MAX(H2.DATAMOVCARTINV) || H2' +
        '.IDINVESTIMENTO'
      '                             FROM HISTCARTINV H2'
      
        '                             WHERE (H2.DATAMOVCARTINV <= TO_DATE' +
        '(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '                               AND (H2.IDCARTEIRAGERENC IS NULL)'
      '                               AND (H2.IDTIPOINVEST = 2)'
      '                             GROUP BY H2.IDINVESTIMENTO)'
      '                 GROUP BY H1.IDINVESTIMENTO)'
      '        AND H.IDCARTEIRAGERENC IS NULL'
      '        AND H.IDTIPOINVEST = 2'
      '        AND H.SALDOQTDEINVCART <> 0'
      '      GROUP BY H.IDPLANPREVCTBPATR) TOTCART,'
      ''
      '     (SELECT PA.IDPLANPREVCTBPATR,'
      
        '             SUBSTR((PL.NOME ||'#39' - '#39'|| PE.NOME),1,60) AS PLANPRV' +
        'CONTABPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP,'
      ''
      '     INVESTIMENTO IV, TIPOINVEST TI'
      ''
      'WHERE TOTIV.IDPLANPREVCTBPATR = TOTPLANO.IDPLANPREVCTBPATR'
      '  AND TOTIV.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      '  AND TOTIV.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND TOTIV.IDTIPOINVEST = TI.IDTIPOINVEST'
      '  AND TOTIV.IDTIPOINVEST = TOTCART.IDTIPOINVEST'
      ''
      
        'ORDER BY PLANPRVCONTABPATRO, PERCPLANO DESC, DESCTIPOINVEST, DES' +
        'CINVESTIMENTO'
      '')
    ValidateWithMask = True
    Left = 34
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end>
    object qryPosicaoPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 60
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 60
    end
    object qryPosicaoDESCTIPOINVEST: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCTIPOINVEST'
      Size = 60
    end
    object qryPosicaoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryPosicaoSLDINV: TFloatField
      DisplayLabel = 'Saldo do Investimento'
      DisplayWidth = 18
      FieldName = 'SLDINV'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryPosicaoSLDPLANO: TFloatField
      DisplayLabel = 'Saldo do Plano'
      DisplayWidth = 22
      FieldName = 'SLDPLANO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryPosicaoPERCPLANO: TFloatField
      DisplayLabel = 'Percentual s/ o Plano'
      DisplayWidth = 17
      FieldName = 'PERCPLANO'
      DisplayFormat = '#,##0.000000'
    end
    object qryPosicaoSLDTPINVEST: TFloatField
      DisplayLabel = 'Saldo da Carteira'
      DisplayWidth = 19
      FieldName = 'SLDTPINVEST'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryPosicaoPERCTPINV: TFloatField
      DisplayLabel = 'Percentual s/ a Carteira'
      DisplayWidth = 19
      FieldName = 'PERCTPINV'
      DisplayFormat = '#,##0.000000'
    end
  end
  object rptPosPlanoModulo: TppReport
    AutoStop = False
    DataPipeline = pplPosicao
    OnStartPage = rptPosPlanoModuloStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldos por Planos'
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
    Left = 218
    Top = 80
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplPosicao'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Saldos por Planos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 30692
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
      object ppLabel3: TppLabel
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
        mmLeft = 268288
        mmTop = 12171
        mmWidth = 11906
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
      object lblDataRef: TppLabel
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
      object ppShape1: TppShape
        UserName = 'shpDetalhe1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 8202
        mmLeft = 0
        mmTop = 19579
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label1'
        Caption = 'Plano'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 23813
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label2'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 52388
        mmTop = 23813
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 80963
        mmTop = 23813
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Saldo do Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 142346
        mmTop = 23813
        mmWidth = 33867
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label3'
        Caption = 'Saldo do Plano'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182298
        mmTop = 23813
        mmWidth = 23019
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label4'
        Caption = '% Plano'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 215636
        mmTop = 19844
        mmWidth = 8731
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Saldo da Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 234421
        mmTop = 23813
        mmWidth = 26194
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = '% Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 268553
        mmTop = 20108
        mmWidth = 11906
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = pplPosicao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'pplPosicao'
        mmHeight = 3704
        mmLeft = 529
        mmTop = 0
        mmWidth = 50006
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCTIPOINVEST'
        DataPipeline = pplPosicao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPosicao'
        mmHeight = 3704
        mmLeft = 52388
        mmTop = 0
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplPosicao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplPosicao'
        mmHeight = 3704
        mmLeft = 80963
        mmTop = 0
        mmWidth = 63236
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SLDINV'
        DataPipeline = pplPosicao
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPosicao'
        mmHeight = 3704
        mmLeft = 145786
        mmTop = 0
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'SLDPLANO'
        DataPipeline = pplPosicao
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPosicao'
        mmHeight = 3704
        mmLeft = 178065
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PERCPLANO'
        DataPipeline = pplPosicao
        DisplayFormat = '#,##0.000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPosicao'
        mmHeight = 3704
        mmLeft = 207698
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'SLDTPINVEST'
        DataPipeline = pplPosicao
        DisplayFormat = '###,###,###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPosicao'
        mmHeight = 3704
        mmLeft = 233363
        mmTop = 0
        mmWidth = 27252
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'PERCTPINV'
        DataPipeline = pplPosicao
        DisplayFormat = '#,##0.000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPosicao'
        mmHeight = 3704
        mmLeft = 262996
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
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
        mmWidth = 283634
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
        mmWidth = 283634
        BandType = 8
      end
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
        mmLeft = 257705
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 96044
      mmPrintPosition = 0
      object ppDPTeeChart1: TppDPTeeChart
        UserName = 'DPTeeChart1'
        mmHeight = 94192
        mmLeft = 265
        mmTop = 0
        mmWidth = 141288
        BandType = 7
        object ppDPTeeChartControl1: TppDPTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          MarginBottom = 0
          MarginLeft = 2
          MarginRight = 2
          MarginTop = 0
          Title.Text.Strings = (
            'Chart')
          Title.Visible = False
          AxisVisible = False
          Chart3DPercent = 10
          ClipPoints = False
          Frame.Visible = False
          Legend.Alignment = laBottom
          Legend.LegendStyle = lsValues
          Legend.TextStyle = ltsRightValue
          View3DWalls = False
          BevelOuter = bvNone
          Color = clWhite
          object Series1: TPieSeries
            Tag = 3
            Marks.ArrowLength = 8
            Marks.Style = smsLabelPercent
            Marks.Visible = True
            DataSource = pplPercPlano
            SeriesColor = clRed
            ValueFormat = 'R$ #,##0.###'
            XLabelsSource = 'PLANPRVCONTABPATRO'
            OtherSlice.Text = 'Other'
            PieValues.DateTime = False
            PieValues.Name = 'Pie'
            PieValues.Multiplier = 1
            PieValues.Order = loNone
            PieValues.ValueSource = 'SALDO'
          end
        end
      end
      object ppDPTeeChart2: TppDPTeeChart
        UserName = 'DPTeeChart2'
        mmHeight = 94986
        mmLeft = 142082
        mmTop = 0
        mmWidth = 140759
        BandType = 7
        object ppDPTeeChartControl2: TppDPTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          MarginBottom = 0
          MarginLeft = 0
          MarginRight = 0
          MarginTop = 0
          Title.Text.Strings = (
            'Chart')
          Title.Visible = False
          AxisVisible = False
          Chart3DPercent = 10
          ClipPoints = False
          Frame.Visible = False
          Legend.Alignment = laBottom
          Legend.TextStyle = ltsRightValue
          View3DWalls = False
          BevelOuter = bvNone
          Color = clWhite
          object Series2: TPieSeries
            Tag = 3
            Marks.ArrowLength = 8
            Marks.Style = smsLabelPercent
            Marks.Visible = True
            DataSource = pplPercCarteira
            SeriesColor = clRed
            ValueFormat = 'R$ #,##0.###'
            XLabelsSource = 'DESCTIPOINVEST'
            OtherSlice.Text = 'Other'
            PieValues.DateTime = False
            PieValues.Name = 'Pie'
            PieValues.Multiplier = 1
            PieValues.Order = loNone
            PieValues.ValueSource = 'SALDO'
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = pplPosicao
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplPosicao'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
      end
    end
  end
  object qryPercPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PP.PLANPRVCONTABPATRO, TOTPLANO.SALDO'
      ''
      'FROM (SELECT IDPLANPREVCTBPATR, SUM(SALDO) AS SALDO'
      '      FROM'
      
        '        (SELECT HR.IDPLANPREVCTBPATR, SUM(HR.SALDOVLRHISTRENFI) ' +
        'AS SALDO'
      '         FROM   HISTRENFIX HR, OPERRENFIX OP'
      
        '         WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATAREF,'#39'DD/MM/YYYY' +
        #39')) OR (OP.VENCOPERACAO IS NULL))'
      
        '           AND (HR.IDHISTRENFIX IN (SELECT MAX(H1.IDHISTRENFIX) ' +
        'AS IDHISTRENFIX'
      '                                    FROM HISTRENFIX H1'
      
        '                                    WHERE (H1.DATAHISTRENFIX = T' +
        'O_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                      AND ((H1.DATAHISTRENFIX ||' +
        ' H1.IDPLANPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPL' +
        'IC) IN'
      
        '                                                  (SELECT MAX(H2' +
        '.DATAHISTRENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO ||' +
        ' H2.IDOPERRENFIXAPLIC'
      
        '                                                   FROM HISTRENF' +
        'IX H2'
      
        '                                                   WHERE ( H2.DA' +
        'TAHISTRENFIX = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                                   GROUP BY H2.I' +
        'DPLANPREVCTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                                    GROUP BY H1.DATAHISTRENFIX, ' +
        'H1.IDPLANPREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '           AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '           AND (HR.SALDOQTDHISTRENFI > 0)'
      '         GROUP BY HR.IDPLANPREVCTBPATR'
      '         UNION'
      
        '         SELECT H.IDPLANPREVCTBPATR, SUM(H.SALDOVLRINVCART) AS S' +
        'ALDO'
      '         FROM HISTCARTINV H'
      '         WHERE H.IDHISTCARTINV IN'
      '                   (SELECT MAX(H1.IDHISTCARTINV)'
      '                    FROM HISTCARTINV H1'
      '                    WHERE (H1.IDCARTEIRAGERENC IS NULL)'
      '                      AND (H1.IDTIPOINVEST = 2)'
      
        '                      AND (H1.DATAMOVCARTINV || H1.IDINVESTIMENT' +
        'O) IN'
      
        '                               (SELECT MAX(H2.DATAMOVCARTINV) ||' +
        ' H2.IDINVESTIMENTO'
      '                                FROM HISTCARTINV H2'
      
        '                                WHERE (H2.DATAMOVCARTINV <= TO_D' +
        'ATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                  AND (H2.IDCARTEIRAGERENC IS NU' +
        'LL)'
      '                                  AND (H2.IDTIPOINVEST = 2)'
      '                                GROUP BY H2.IDINVESTIMENTO)'
      '                    GROUP BY H1.IDINVESTIMENTO)'
      '           AND H.IDCARTEIRAGERENC IS NULL'
      '           AND H.IDTIPOINVEST = 2'
      '           AND H.SALDOQTDEINVCART <> 0'
      '         GROUP BY H.IDPLANPREVCTBPATR)'
      '      GROUP BY IDPLANPREVCTBPATR) TOTPLANO,'
      ''
      '     (SELECT PA.IDPLANPREVCTBPATR,'
      
        '             SUBSTR((PL.NOME ||'#39' - '#39'|| PE.NOME),1,60) AS PLANPRV' +
        'CONTABPATRO'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PP'
      ''
      'WHERE TOTPLANO.IDPLANPREVCTBPATR = PP.IDPLANPREVCTBPATR'
      ''
      'ORDER BY PLANPRVCONTABPATRO, SALDO DESC'
      '')
    ValidateWithMask = True
    Left = 34
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end>
    object qryPercPlanoPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 60
    end
    object qryPercPlanoSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object qryPercCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TI.DESCTIPOINVEST, TOTCART.SALDO'
      ''
      
        'FROM (SELECT 1 AS IDTIPOINVEST, SUM(HR.SALDOVLRHISTRENFI) AS SAL' +
        'DO'
      '      FROM   HISTRENFIX HR, OPERRENFIX OP'
      
        '      WHERE ((OP.VENCOPERACAO >= TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))' +
        ' OR (OP.VENCOPERACAO IS NULL))'
      
        '        AND (HR.IDHISTRENFIX IN (SELECT MAX(H1.IDHISTRENFIX) AS ' +
        'IDHISTRENFIX'
      '                                 FROM HISTRENFIX H1'
      
        '                                 WHERE (H1.DATAHISTRENFIX = TO_D' +
        'ATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                   AND ((H1.DATAHISTRENFIX || H1' +
        '.IDPLANPREVCTBPATR || H1.IDINVESTIMENTO || H1.IDOPERRENFIXAPLIC)' +
        ' IN'
      
        '                                               (SELECT MAX(H2.DA' +
        'TAHISTRENFIX) || H2.IDPLANPREVCTBPATR || H2.IDINVESTIMENTO || H2' +
        '.IDOPERRENFIXAPLIC'
      
        '                                                FROM HISTRENFIX ' +
        'H2'
      
        '                                                WHERE ( H2.DATAH' +
        'ISTRENFIX = TO_DATE(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      
        '                                                GROUP BY H2.IDPL' +
        'ANPREVCTBPATR, H2.IDINVESTIMENTO, H2.IDOPERRENFIXAPLIC))'
      
        '                                 GROUP BY H1.DATAHISTRENFIX, H1.' +
        'IDPLANPREVCTBPATR, H1.IDINVESTIMENTO, H1.IDOPERRENFIXAPLIC))'
      '        AND (HR.IDOPERRENFIXAPLIC = OP.IDOPERRENFIX)'
      '        AND (HR.SALDOQTDHISTRENFI > 0)'
      '      GROUP BY HR.IDTIPOINVEST'
      '      UNION'
      '      SELECT 2 AS IDTIPOINVEST, SUM(H.SALDOVLRINVCART) AS SALDO'
      '      FROM HISTCARTINV H'
      '      WHERE H.IDHISTCARTINV IN'
      '                (SELECT MAX(H1.IDHISTCARTINV)'
      '                 FROM HISTCARTINV H1'
      '                 WHERE (H1.IDCARTEIRAGERENC IS NULL)'
      '                   AND (H1.IDTIPOINVEST = 2)'
      
        '                   AND (H1.DATAMOVCARTINV || H1.IDINVESTIMENTO) ' +
        'IN'
      
        '                            (SELECT MAX(H2.DATAMOVCARTINV) || H2' +
        '.IDINVESTIMENTO'
      '                             FROM HISTCARTINV H2'
      
        '                             WHERE (H2.DATAMOVCARTINV <= TO_DATE' +
        '(:DATAREF,'#39'DD/MM/YYYY'#39'))'
      '                               AND (H2.IDCARTEIRAGERENC IS NULL)'
      '                               AND (H2.IDTIPOINVEST = 2)'
      '                             GROUP BY H2.IDINVESTIMENTO)'
      '                 GROUP BY H1.IDINVESTIMENTO)'
      '        AND H.IDCARTEIRAGERENC IS NULL'
      '        AND H.IDTIPOINVEST = 2'
      '        AND H.SALDOQTDEINVCART <> 0'
      '      GROUP BY H.IDPLANPREVCTBPATR) TOTCART, TIPOINVEST TI'
      ''
      'WHERE TOTCART.IDTIPOINVEST = TI.IDTIPOINVEST'
      ''
      'ORDER BY DESCTIPOINVEST')
    ValidateWithMask = True
    Left = 34
    Top = 192
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptResult
      end>
    object qryPercCarteiraDESCTIPOINVEST: TStringField
      FieldName = 'DESCTIPOINVEST'
      Size = 60
    end
    object qryPercCarteiraSALDO: TFloatField
      FieldName = 'SALDO'
    end
  end
  object dsPercPlano: TwwDataSource
    AutoEdit = False
    DataSet = qryPercPlano
    Left = 95
    Top = 136
  end
  object pplPercPlano: TppBDEPipeline
    DataSource = dsPercPlano
    UserName = 'pplPosicao1'
    Left = 157
    Top = 136
    object pplPercPlanoppField1: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplPercPlanoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
  end
  object dsPercCarteira: TwwDataSource
    AutoEdit = False
    DataSet = qryPercCarteira
    Left = 95
    Top = 192
  end
  object pplPercCarteira: TppBDEPipeline
    DataSource = dsPercCarteira
    UserName = 'lPercCarteira'
    Left = 157
    Top = 192
  end
end
