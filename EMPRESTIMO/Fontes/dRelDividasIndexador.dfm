inherited dtmRelDividasIndexador: TdtmRelDividasIndexador
  Left = 398
  Top = 262
  Width = 232
  Height = 171
  Caption = 'dtmRelDividasIndexador'
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
    DataPipelineName = 'pplExemplo'
  end
  object pplDividas: TppBDEPipeline
    DataSource = dsDividas
    CloseDataSource = True
    UserName = 'lExemplo1'
    Left = 112
    Top = 80
  end
  object dsDividas: TwwDataSource
    DataSet = qryDividas
    Left = 112
    Top = 68
  end
  object qryDividas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      '   CON.VLRCONTRATO,'
      ''
      '   CON.IDTIPOEMPTMO, CON.DESCTIPOEMPTMO,'
      '   CON.MOECODIGO,'
      ''
      '   MOE.MOESIGLA, MOE.MOEDESC,'
      ''
      '   SLD.HMESALDODEV, PAR.VALOR_DEVIDO,'
      
        '   ( NVL(SLD.HMESALDODEV, 0) + NVL(PAR.VALOR_DEVIDO, 0) ) AS TOT' +
        'AL,'
      '   0 AS VLR_PAG'
      ''
      ''
      'FROM'
      '   VWCONTRATOEP CON,'
      '   MOEDA        MOE,'
      ''
      '   ('
      '   SELECT'
      '      CON.IDCONTRATOEMPTMO,'
      '      NVL(HME.HMESALDODEV, 0) AS HMESALDODEV'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '      ('
      '      SELECT'
      
        '         CON.IDCONTRATOEMPTMO, MAX(IDHISTMOVEMPTMO) AS IDHISTMOV' +
        'EMPTMO'
      '      FROM'
      '         HISTMOVEMPTMO HME, CONTRATOEMPTMO CON,'
      '         ITEMXTIPOCONTR ITC, ITEMEMPTMO ITE, TIPOCONTREMPTMO TCE'
      '      WHERE'
      '             ( ITC.ITCTRATASALDODEV   <> 0 )'
      
        '         AND ( HME.HMEDATAATUALIZA    <= TO_DATE('#39'30/09/2002'#39', '#39 +
        'DD/MM/YYYY'#39') )'
      '         AND ( CON.FLGSITUACAO        <> '#39'Q'#39' )'
      '         AND ( HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO )'
      '         AND ( CON.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '         AND ( CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO )'
      '         AND ( TCE.IDTIPOCONTREMPTMO  = ITC.IDTIPOCONTREMPTMO )'
      '         AND ( HME.IDITEMEMPTMO       = ITE.IDITEMEMPTMO )'
      '         AND ( ITE.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '         AND ( HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO )'
      '         AND CON.IDCONTRATOEMPTMO     = -1'
      '      GROUP BY'
      '         CON.IDCONTRATOEMPTMO'
      '      ) MAX'
      '   WHERE'
      '          ( CON.FLGSITUACAO        <> '#39'Q'#39' )'
      '      AND ( CON.IDCONTRATOEMPTMO   = HME.IDCONTRATOEMPTMO )'
      '      AND ( CON.IDCONTRATOEMPTMO   = MAX.IDCONTRATOEMPTMO )'
      '      AND ( HME.IDHISTMOVEMPTMO    = MAX.IDHISTMOVEMPTMO )'
      '      AND CON.IDCONTRATOEMPTMO     = -1'
      '   ) SLD,'
      ''
      '   ('
      '   SELECT'
      
        '      CON.IDCONTRATOEMPTMO, SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS V' +
        'ALOR_DEVIDO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO CON'
      '   WHERE'
      '          ( HME.HMETIPOMOV       IN (1, 2, 3, 4, 6, 7) )'
      ''
      
        '      AND (  HME.HMEDATAPREVISTA <= TO_DATE('#39'30/09/2002'#39', '#39'DD/MM' +
        '/YYYY'#39') )'
      
        '      AND ( (HME.HMEDATAEFETIVA  IS NULL) OR (HMEDATAEFETIVA > T' +
        'O_DATE('#39'30/09/2002'#39', '#39'DD/MM/YYYY'#39') ) )'
      
        '      AND ( (HME.HMEVLREFETIVO   IS NULL) OR (HMEDATAEFETIVA > T' +
        'O_DATE('#39'30/09/2002'#39', '#39'DD/MM/YYYY'#39') ) )'
      ''
      
        '      AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NU' +
        'LL) )'
      
        '      AND ( (HME.FLGQUITADO      = 0) OR (HME.FLGQUITADO IS NULL' +
        ') )'
      
        '      AND ( (HME.FLGABONADO      = 0) OR (HME.FLGABONADO IS NULL' +
        ') )'
      
        '      AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '      AND ( CON.FLGSITUACAO      <> '#39'Q'#39' )'
      '      AND ( CON.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO )'
      '      AND CON.IDCONTRATOEMPTMO     = -1'
      '   GROUP BY'
      '      CON.IDCONTRATOEMPTMO'
      '   ) PAR'
      ''
      'WHERE'
      '       ( CON.IDEMPRESAPROP      = 1 )'
      '   AND ( CON.FLGSITUACAO        <> '#39'Q'#39' )'
      '   AND ( CON.IDCONTRATOEMPTMO   = PAR.IDCONTRATOEMPTMO(+) )'
      '   AND ( CON.IDCONTRATOEMPTMO   = SLD.IDCONTRATOEMPTMO )'
      '   AND ( CON.MOECODIGO          = MOE.MOECODIGO )'
      '   AND CON.IDCONTRATOEMPTMO     = -1'
      ''
      'ORDER BY'
      '   CON.DESCTIPOEMPTMO, MOE.MOESIGLA')
    ValidateWithMask = True
    Left = 112
    Top = 56
    object qryDividasIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryDividasIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryDividasDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryDividasMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryDividasMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryDividasMOEDESC: TStringField
      FieldName = 'MOEDESC'
    end
    object qryDividasHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryDividasVALOR_DEVIDO: TFloatField
      FieldName = 'VALOR_DEVIDO'
    end
    object qryDividasTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object qryDividasVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryDividasVLR_PAG: TFloatField
      FieldName = 'VLR_PAG'
    end
  end
  object rptDividasIndexador: TppReport
    AutoStop = False
    DataPipeline = pplDividas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'EP - Relatório de Valores Devidos por Indexador'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13229
    PrinterSetup.mmMarginLeft = 6615
    PrinterSetup.mmMarginRight = 6615
    PrinterSetup.mmMarginTop = 13229
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 112
    Top = 8
    Version = '7.04'
    mmColumnWidth = 183542
    DataPipelineName = 'pplDividas'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 57415
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Valores Devidos por Indexador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
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
        mmLeft = 0
        mmTop = 794
        mmWidth = 196850
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Data de Referência:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 22490
        mmWidth = 31750
        BandType = 0
      end
      object rptDividas_lblDataRef: TppLabel
        OnPrint = rptDividas_lblDataRefPrint
        UserName = 'rptDividas_lblDataRef'
        Caption = 'Janeiro/2002'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 31221
        mmTop = 22490
        mmWidth = 18521
        BandType = 0
      end
      object lblQuitacao: TppLabel
        UserName = 'Label4'
        Caption = 'Considera Quitações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 265
        mmTop = 29104
        mmWidth = 31485
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Evento:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 13494
        mmTop = 35983
        mmWidth = 12700
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Patrocinadoras:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 45508
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'Planos:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 112184
        mmTop = 45508
        mmWidth = 12700
        BandType = 0
      end
      object ppMemo2: TppMemo
        UserName = 'Memo2'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 52917
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object memPatro: TppRichText
        UserName = 'memPatro'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todas >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 25929
        mmTop = 45508
        mmWidth = 72761
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object memPlano: TppRichText
        UserName = 'memPlano'
        Caption = 'memPatro'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil\fcha' +
          'rset0 Arial;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\fs1' +
          '6 < todos >\f1\par'#13#10'}'#13#10
        Stretch = True
        Transparent = True
        mmHeight = 7673
        mmLeft = 124619
        mmTop = 45508
        mmWidth = 72231
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ppMemo1: TppMemo
        UserName = 'Memo1'
        KeepTogether = True
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ShiftRelativeTo = memPlano
        Transparent = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 52917
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        AutoSize = False
        Caption = 'Tipo Empréstimo:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 40481
        mmWidth = 27517
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label57'
        Caption = 'Tipo Contrato:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 102923
        mmTop = 40481
        mmWidth = 21960
        BandType = 0
      end
      object lblTipoEmptmo: TppLabel
        UserName = 'lblTipoEmptmo'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28310
        mmTop = 40481
        mmWidth = 70379
        BandType = 0
      end
      object lblTipoContr: TppLabel
        UserName = 'lblTipoContr'
        AutoSize = False
        Caption = ' < todos >'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 124619
        mmTop = 40481
        mmWidth = 72231
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      Visible = False
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
        DataPipelineName = 'pplDividas'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 794
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
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
        DataPipelineName = 'pplDividas'
        mmHeight = 3175
        mmLeft = 105040
        mmTop = 529
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VALOR_DEVIDO'
        DataPipeline = pplDividas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDividas'
        mmHeight = 3175
        mmLeft = 150813
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
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
        DataPipelineName = 'pplDividas'
        mmHeight = 3175
        mmLeft = 173567
        mmTop = 794
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLRCONTRATO'
        DataPipeline = pplDividas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDividas'
        mmHeight = 3175
        mmLeft = 78846
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLR_PAG'
        DataPipeline = pplDividas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDividas'
        mmHeight = 3175
        mmLeft = 128323
        mmTop = 794
        mmWidth = 21167
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 529
        mmWidth = 196770
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
        mmHeight = 3175
        mmLeft = 0
        mmTop = 2117
        mmWidth = 23019
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
        mmLeft = 89165
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
        mmLeft = 170657
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 14288
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentHeight = True
        ParentWidth = True
        Weight = 1.5
        mmHeight = 14288
        mmLeft = 0
        mmTop = 0
        mmWidth = 196770
        BandType = 7
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Pen.Width = 2
        mmHeight = 8202
        mmLeft = 66146
        mmTop = 2910
        mmWidth = 129911
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'HMESALDODEV'
        DataPipeline = pplDividas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDividas'
        mmHeight = 4233
        mmLeft = 105569
        mmTop = 4763
        mmWidth = 21167
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VALOR_DEVIDO'
        DataPipeline = pplDividas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDividas'
        mmHeight = 4233
        mmLeft = 151607
        mmTop = 4763
        mmWidth = 21167
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'TOTAL'
        DataPipeline = pplDividas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDividas'
        mmHeight = 4233
        mmLeft = 173567
        mmTop = 4763
        mmWidth = 19844
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label2'
        Caption = 'Total Geral:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 42069
        mmTop = 4763
        mmWidth = 23019
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'VLRCONTRATO'
        DataPipeline = pplDividas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDividas'
        mmHeight = 4233
        mmLeft = 78846
        mmTop = 4498
        mmWidth = 21167
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'VLR_PAG'
        DataPipeline = pplDividas
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDividas'
        mmHeight = 4233
        mmLeft = 129382
        mmTop = 4763
        mmWidth = 21167
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCTIPOEMPTMO'
      DataPipeline = pplDividas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDividas'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14552
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'Shape4'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 14552
          mmLeft = 0
          mmTop = 0
          mmWidth = 196770
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Indexador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 10054
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Saldo Devedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 101865
          mmTop = 9790
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'em Aberto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 154517
          mmTop = 10054
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 184680
          mmTop = 9790
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Valor '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 162190
          mmTop = 5821
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          ParentWidth = True
          Position = lpBottom
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 14288
          mmWidth = 196770
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'DESCTIPOEMPTMO'
          DataPipeline = pplDividas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplDividas'
          mmHeight = 4191
          mmLeft = 1058
          mmTop = 1058
          mmWidth = 33613
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Valor Concedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 71702
          mmTop = 9790
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 130969
          mmTop = 9790
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 19050
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 19050
          mmLeft = 0
          mmTop = 0
          mmWidth = 196770
          BandType = 5
          GroupNo = 0
        end
        object ppShape3: TppShape
          UserName = 'Shape3'
          Pen.Width = 2
          mmHeight = 8202
          mmLeft = 66146
          mmTop = 2910
          mmWidth = 129911
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          DataField = 'HMESALDODEV'
          DataPipeline = pplDividas
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDividas'
          mmHeight = 4233
          mmLeft = 105569
          mmTop = 4763
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'VALOR_DEVIDO'
          DataPipeline = pplDividas
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDividas'
          mmHeight = 4233
          mmLeft = 151607
          mmTop = 4763
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'TOTAL'
          DataPipeline = pplDividas
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDividas'
          mmHeight = 4233
          mmLeft = 173567
          mmTop = 4763
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'VLR_PAG'
          DataPipeline = pplDividas
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDividas'
          mmHeight = 4233
          mmLeft = 129382
          mmTop = 4498
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'VLRCONTRATO'
          DataPipeline = pplDividas
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDividas'
          mmHeight = 4233
          mmLeft = 78846
          mmTop = 4233
          mmWidth = 21167
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'MOESIGLA'
      DataPipeline = pplDividas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDividas'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppShape2: TppShape
          OnPrint = ppShape2Print
          UserName = 'Shape2'
          Brush.Color = 13040076
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 8996
          mmLeft = 0
          mmTop = 0
          mmWidth = 196770
          BandType = 5
          GroupNo = 1
        end
        object ppLine3: TppLine
          OnPrint = ppLine3Print
          UserName = 'Line3'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 0
          mmTop = 0
          mmWidth = 196770
          BandType = 5
          GroupNo = 1
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'MOESIGLA'
          DataPipeline = pplDividas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplDividas'
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 2646
          mmWidth = 21431
          BandType = 5
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'MOEDESC'
          DataPipeline = pplDividas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplDividas'
          mmHeight = 3969
          mmLeft = 23813
          mmTop = 2646
          mmWidth = 51858
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'HMESALDODEV'
          DataPipeline = pplDividas
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDividas'
          mmHeight = 3969
          mmLeft = 105569
          mmTop = 2381
          mmWidth = 21167
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VALOR_DEVIDO'
          DataPipeline = pplDividas
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDividas'
          mmHeight = 3969
          mmLeft = 150813
          mmTop = 2646
          mmWidth = 21167
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'TOTAL'
          DataPipeline = pplDividas
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDividas'
          mmHeight = 3969
          mmLeft = 173567
          mmTop = 2646
          mmWidth = 19844
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'VLR_PAG'
          DataPipeline = pplDividas
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDividas'
          mmHeight = 3969
          mmLeft = 128323
          mmTop = 2381
          mmWidth = 21167
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'VLRCONTRATO'
          DataPipeline = pplDividas
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDividas'
          mmHeight = 3969
          mmLeft = 78846
          mmTop = 2381
          mmWidth = 21167
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
