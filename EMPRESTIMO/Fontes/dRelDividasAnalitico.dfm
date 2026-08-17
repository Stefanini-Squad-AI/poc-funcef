inherited dtmRelDividasAnalitico: TdtmRelDividasAnalitico
  Left = 455
  Top = 273
  Width = 180
  Height = 171
  Caption = 'dtmRelDividasAnalitico'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 80
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
    Left = 24
    Top = 68
  end
  inherited qryExemplo: TwwQuery
    Left = 24
    Top = 56
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
  end
  object pplDividas: TppBDEPipeline
    DataSource = dsDividas
    UserName = 'lExemplo1'
    Left = 88
    Top = 88
  end
  object dsDividas: TwwDataSource
    DataSet = qryDividas
    Left = 112
    Top = 68
  end
  object qryDividas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ INDEX(CON) */ '
      '   CON.IDCONTRATOEMPTMO, '
      '   PTI.NOME AS NOME_TITULAR, '
      '   PBF.NOME AS NOME_BENEF, '
      '   SIT.DESCRICAO AS SIT_PART, '
      '   ELP.MATRICULA, '
      '   SLD.HMEDATAATUALIZA, '
      '   SLD.HMESALDODEV, '
      '   SLD.HMEPARCELA, '
      '   SLD.HMENUMPARCELAS,'
      '   SLD.IDITEMEMPTMO,'
      '   ITM.ITEDESCRICAO,'
      '   SLD.HMEVLRPREVISTO,'
      '   PAR.VALOR_DEVIDO, '
      '   (SLD.HMESALDODEV + PAR.VALOR_DEVIDO) AS TOTAL '
      'FROM '
      '   PESSOA PBF, '
      '   PESSOA PTI, '
      '   CONTRATOEMPTMO CON, '
      '   ELEGPATRO ELP, '
      '   PARTPREVPLAN PPP, '
      '   TIPOCONTREMPTMO TCE, '
      '   TIPOEMPTMO TEP, '
      '   PATRO PTR, '
      '   PLANPREV PLP, '
      '   SITPART SIT, '
      '   ITEMEMPTMO ITM,'
      '   ( '
      '   SELECT '
      '      CON.IDCONTRATOEMPTMO, '
      '      HME.HMEDATAATUALIZA, '
      '      HME.HMESALDODEV, '
      '      HME.HMEPARCELA, '
      '      HME.HMENUMPARCELAS,'
      '      HME.IDITEMEMPTMO,'
      '      HME.HMEVLRPREVISTO'
      '   FROM '
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '
      '      ( '
      '      SELECT /*+ INDEX(ITC) */ '
      '         CON.IDCONTRATOEMPTMO, IDHISTMOVEMPTMO'
      '      FROM '
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON, '
      
        '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE' +
        ' '
      '      WHERE '
      '             ( ITC.ITCTRATASALDODEV   <> 0 ) '
      
        '         AND ( HME.HMEDATAATUALIZA    <= TO_DATE('#39'30/06/2002'#39', '#39 +
        'DD/MM/YYYY'#39') ) '
      
        '         AND ( (HME.FLGESTORNADO       IS NULL) OR (HME.FLGESTOR' +
        'NADO = 0) ) '
      '         AND ( CON.FLGSITUACAO        <> '#39'C'#39' ) '
      '         AND ( HMETIPOMOV             IN (1, 2, 3, 4, 6, 7) ) '
      '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '
      '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '
      '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '
      '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO ) '
      '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO ) '
      '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '
      '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO ) '
      '      ) MAX '
      '   WHERE '
      '          ( CON.FLGSITUACAO        <> '#39'C'#39' ) '
      '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO ) '
      '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO ) '
      '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO ) '
      '   ) SLD, '
      '   ( '
      '   SELECT '
      
        '      CON.IDCONTRATOEMPTMO, SUM(HME.HMEVLRPREVISTO) AS VALOR_DEV' +
        'IDO '
      '   FROM '
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON '
      '   WHERE '
      '          HMETIPOMOV             IN (1, 2, 3, 4, 6, 7) '
      '      AND ( CON.FLGSITUACAO      NOT IN ('#39'C'#39', '#39'Q'#39' ) ) '
      
        '      AND ( HME.HMEDATAPREVISTA  <= TO_DATE('#39'30/06/2002'#39', '#39'DD/MM' +
        '/YYYY'#39') ) '
      
        '      AND ( HME.HMEDATAPREVISTA  < TO_DATE('#39'30/06/2002'#39','#39'DD/MM/Y' +
        'YYY'#39') ) '
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ') '
      
        '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) ) '
      
        '      AND ( (HME.FLGQUITADO      IS NULL) OR ((HME.FLGQUITADO IS' +
        ' NOT NULL) AND (HME.HMEDATAQUITABONO > TO_DATE('#39'30/06/2002'#39','#39'DD/' +
        'MM/YYYY'#39'))) ) '
      
        '      AND ( (HME.FLGABONADO      IS NULL) OR ((HME.FLGABONADO IS' +
        ' NOT NULL) AND (HME.HMEDATAQUITABONO > TO_DATE('#39'30/06/2002'#39','#39'DD/' +
        'MM/YYYY'#39'))) ) '
      
        '      AND ( (HME.HMEDATAEFETIVA  IS NULL) OR (HME.HMEDATAEFETIVA' +
        ' > TO_DATE('#39'30/06/2002'#39','#39'DD/MM/YYYY'#39')) ) '
      '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO ) '
      '   GROUP BY '
      '      CON.IDCONTRATOEMPTMO '
      '   ) PAR '
      'WHERE '
      '       TEP.IDEMPRESAPROP        = 1'
      '   AND PTR.IDPESSOA             IN (50031, 50028, 1) '
      '   AND PLP.IDPLANOPREV          IN (16, 3) '
      '   AND ( CON.FLGSITUACAO        <> '#39'Q'#39' ) '
      '   AND ( PPP.FLGDESATIVADO      = 0 ) '
      '   AND ( CON.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO ) '
      '   AND ( CON.IDCONTRATOEMPTMO   = PAR.IDCONTRATOEMPTMO ) '
      '   AND ( CON.IDCONTRATOEMPTMO   = SLD.IDCONTRATOEMPTMO ) '
      '   AND ( CON.IDPESSOA           = PTI.IDPESSOA ) '
      '   AND ( CON.IDPESSOA           = ELP.IDPESSOA ) '
      '   AND ( CON.IDPATRO            = PTR.IDPESSOA ) '
      '   AND ( CON.IDBENEF            = PBF.IDPESSOA ) '
      '   AND ( CON.IDPESSOA           = PPP.IDPESSOA ) '
      '   AND ( CON.IDPATRO            = PPP.IDPESSJUR ) '
      '   AND ( CON.IDPLANOPREV        = PPP.IDPLANOPREV ) '
      '   AND ( ELP.IDPESSOA           = PPP.IDPESSOA ) '
      '   AND ( ELP.IDPESSJUR          = PPP.IDPESSJUR ) '
      '   AND ( PTR.IDPESSOA           = ELP.IDPESSJUR ) '
      '   AND ( CON.IDBENEF            = PBF.IDPESSOA ) '
      '   AND ( PTI.IDPESSOA           = ELP.IDPESSOA ) '
      '   AND ( PTI.IDPESSOA           = PPP.IDPESSOA ) '
      '   AND ( CON.IDPLANOPREV        = PLP.IDPLANOPREV ) '
      '   AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO ) '
      '   AND ( TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO ) '
      '   AND ( PPP.IDSITPART          = SIT.IDSITPART ) '
      '   AND ( SLD.IDITEMEMPTMO       = ITM.IDITEMEMPTMO )'
      'ORDER BY '
      '   PBF.NOME, CON.IDCONTRATOEMPTMO'
      '')
    ValidateWithMask = True
    Left = 112
    Top = 56
    object qryDividasIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryDividasNOME_TITULAR: TStringField
      FieldName = 'NOME_TITULAR'
      Size = 60
    end
    object qryDividasNOME_BENEF: TStringField
      FieldName = 'NOME_BENEF'
      Size = 60
    end
    object qryDividasMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryDividasSIT_PART: TStringField
      FieldName = 'SIT_PART'
      Size = 50
    end
    object qryDividasHMEDATAATUALIZA: TDateTimeField
      FieldName = 'HMEDATAATUALIZA'
    end
    object qryDividasHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryDividasHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryDividasHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryDividasVALOR_DEVIDO: TFloatField
      FieldName = 'VALOR_DEVIDO'
    end
    object qryDividasTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qryDividasIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryDividasITEDESCRICAO: TStringField
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryDividasHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object rptDividasAnalitico: TppReport
    AutoStop = False
    DataPipeline = pplDividas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Valores Devidos por Contrato (Analítico)'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 112
    Top = 8
    Version = '5.5'
    mmColumnWidth = 183542
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34925
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Valores Devidos por Contrato (Analítico)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 36777
        mmTop = 8731
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
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
        mmLeft = 36777
        mmTop = 794
        mmWidth = 196850
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clSilver
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 8996
        mmLeft = 0
        mmTop = 25665
        mmWidth = 270542
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Nº Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 30692
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Beneficiário(a)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 22225
        mmTop = 30692
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'do(a) Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 115623
        mmTop = 30692
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Devedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 216430
        mmTop = 30427
        mmWidth = 11113
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 34131
        mmWidth = 270542
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Data de Referência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 18521
        mmWidth = 28840
        BandType = 0
      end
      object rptDividas_lblDataRef: TppLabel
        OnPrint = rptDividas_lblDataRefPrint
        UserName = 'rptDividas_lblDataRef'
        Caption = 'Janeiro/2002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 28840
        mmTop = 18521
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label3'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 219869
        mmTop = 27252
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Itens em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 238390
        mmTop = 27517
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 240507
        mmTop = 30692
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 263261
        mmTop = 30692
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 115623
        mmTop = 27781
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'do(a) Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 136790
        mmTop = 30692
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 136790
        mmTop = 27781
        mmWidth = 11906
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clNone
        Pen.Style = psClear
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppLine3: TppLine
        OnPrint = ppLine3Print
        UserName = 'Line3'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'HMESALDODEV'
        DataPipeline = pplDividas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 208227
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplDividas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 230188
        mmTop = 1058
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TOTAL'
        DataPipeline = pplDividas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 250561
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'ITEDESCRICAO'
        DataPipeline = pplDividas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 112184
        mmTop = 794
        mmWidth = 91546
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 529
        mmWidth = 270542
        BandType = 8
      end
      object ppLabel3: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 2117
        mmWidth = 23813
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
        mmHeight = 3440
        mmLeft = 126207
        mmTop = 2117
        mmWidth = 18256
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
        mmHeight = 3440
        mmLeft = 243682
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        Visible = False
        mmHeight = 5821
        mmLeft = 3704
        mmTop = 4233
        mmWidth = 33602
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label2'
        Caption = 'Total:  '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 217753
        mmTop = 4763
        mmWidth = 9260
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 5821
        mmLeft = 228336
        mmTop = 3704
        mmWidth = 41540
        BandType = 7
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplDividas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 230188
        mmTop = 4763
        mmWidth = 19315
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplDividas
        DisplayFormat = '#00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        SuppressRepeatedValues = True
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DBCalcType = dcCount
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 5292
        mmWidth = 15346
        BandType = 7
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Contratos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 3440
        mmLeft = 21167
        mmTop = 5292
        mmWidth = 14288
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDCONTRATOEMPTMO'
      DataPipeline = pplDividas
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplDividas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 1058
          mmTop = 529
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'NOME_BENEF'
          DataPipeline = pplDividas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 22225
          mmTop = 529
          mmWidth = 91546
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'MATRICULA'
          DataPipeline = pplDividas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 115623
          mmTop = 529
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'SIT_PART'
          DataPipeline = pplDividas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 136790
          mmTop = 529
          mmWidth = 71702
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Pen.Width = 2
          mmHeight = 5821
          mmLeft = 228336
          mmTop = 2381
          mmWidth = 41540
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Total:  '
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 217753
          mmTop = 3440
          mmWidth = 9260
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplDividas
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 230188
          mmTop = 3440
          mmWidth = 19315
          BandType = 5
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Width = 3
          ParentWidth = True
          Weight = 2.25
          mmHeight = 794
          mmLeft = 0
          mmTop = 265
          mmWidth = 270542
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
