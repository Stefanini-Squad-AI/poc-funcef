inherited dtmRelConciliaContabCCDia: TdtmRelConciliaContabCCDia
  Left = 440
  Top = 406
  Width = 244
  Height = 164
  Caption = 'dtmRelConciliaContabCCDia'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
    Top = 88
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
    Left = 32
    Top = 72
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 56
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
  end
  object pplConciliaContabCCDia: TppBDEPipeline
    DataSource = dtsConciliaContabCCDia
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'pplConciliaContabCCDia'
    Left = 144
    Top = 88
  end
  object dtsConciliaContabCCDia: TwwDataSource
    DataSet = qryConciliaContabCCDia
    Left = 144
    Top = 72
  end
  object qryConciliaContabCCDia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MOV.DATA, RTRIM(MOV.CONTACONTABIL) AS CONTACONTABIL,'
      '   PLA.PLANOME, MOD.NOMEMODULO,'
      '   MOV.NOMEPLANO, MOV.NOMEPATRO,'
      '   SUM(MOV.EPDEB) AS EPDEB,'
      '   SUM(MOV.EPCRED) AS EPCRED,'
      '   SUM(MOV.CONTABDEB) AS CONTABDEB,'
      '   SUM(MOV.CONTABCRED) AS CONTABCRED,'
      '   ABS(SUM(MOV.EPDEB) - SUM(MOV.CONTABDEB)) AS DIFDEB,'
      '   ABS(SUM(MOV.EPCRED) - SUM(MOV.CONTABCRED)) AS DIFCRED'
      
        'FROM -----------------------------------------------------------' +
        '------------------------------'
      '   ('
      '   SELECT /*+INDEX(CON XPKCONTRATOEMPTMO) */'
      '      HMEDATAPREVISTA AS DATA,'
      '      RTRIM(HME.CCDEBFINAN) AS CONTACONTABIL,'
      '      15 AS IDMODULO,'
      '      PPC.NOME AS NOMEPLANO,'
      '      PTR.NOME AS NOMEPATRO,'
      
        '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, 0, ABS(HME.HMEVLR' +
        'PREVISTO))) AS EPDEB,'
      
        '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, ABS(HME.HMEVLRPRE' +
        'VISTO), 0)) AS EPCRED,'
      '      0.00 AS CONTABDEB,'
      '      0.00 AS CONTABCRED'
      '   FROM'
      '      HISTMOVEMPTMO    HME,'
      '      CONTRATOEMPTMO   CON,'
      '      PLANPREVCONTABIL PPC,'
      '      PESSOA           PTR'
      '   WHERE'
      
        '          HME.HMEDATAPREVISTA    = TO_DATE('#39'01/12/2003'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      '      AND HME.PLNCODIGO          IS NOT NULL'
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '      AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV'
      '      AND CON.IDPATRO            = PTR.IDPESSOA'
      '   GROUP BY'
      '      HME.HMEDATAPREVISTA, HME.CCDEBFINAN, PPC.NOME, PTR.NOME'
      
        '   UNION -------------------------------------------------------' +
        '----------------------------------'
      '   SELECT /*+INDEX(CON XPKCONTRATOEMPTMO) */'
      '      HMEDATAESTORNO AS DATA,'
      '      RTRIM(HME.CCDEBFINAN) AS CONTACONTABIL,'
      '      15 AS IDMODULO,'
      '      PPC.NOME AS NOMEPLANO,'
      '      PTR.NOME AS NOMEPATRO,'
      
        '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, ABS(HME.HMEVLRPRE' +
        'VISTO), 0)) AS EPDEB,'
      
        '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, 0, ABS(HME.HMEVLR' +
        'PREVISTO))) AS EPCRED,'
      '      0.00 AS CONTABDEB,'
      '      0.00 AS CONTABCRED'
      '   FROM'
      '      HISTMOVEMPTMO    HME,'
      '      CONTRATOEMPTMO   CON,'
      '      PLANPREVCONTABIL PPC,'
      '      PESSOA           PTR'
      '   WHERE'
      
        '          HME.HMEDATAESTORNO     = TO_DATE('#39'01/12/2003'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      '      AND PLNCODIGOESTORNO       IS NOT NULL'
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '      AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV'
      '      AND CON.IDPATRO            = PTR.IDPESSOA'
      '   GROUP BY'
      '      HME.HMEDATAESTORNO, HME.CCDEBFINAN, PPC.NOME, PTR.NOME'
      
        '   UNION -------------------------------------------------------' +
        '----------------------------------'
      '   SELECT /*+INDEX(CON XPKCONTRATOEMPTMO) */'
      '      HMEDATAPREVISTA AS DATA,'
      '      RTRIM(HME.CCCREDFINAN) AS CONTACONTABIL,'
      '      15 AS IDMODULO,'
      '      PPC.NOME AS NOMEPLANO,'
      '      PTR.NOME AS NOMEPATRO,'
      
        '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, ABS(HME.HMEVLRPRE' +
        'VISTO), 0)) AS EPDEB,'
      
        '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, 0, ABS(HME.HMEVLR' +
        'PREVISTO))) AS EPCRED,'
      '      0.00 AS CONTABDEB,'
      '      0.00 AS CONTABCRED'
      '   FROM'
      '      HISTMOVEMPTMO    HME,'
      '      CONTRATOEMPTMO   CON,'
      '      PLANPREVCONTABIL PPC,'
      '      PESSOA           PTR'
      '   WHERE'
      
        '          HME.HMEDATAPREVISTA    = TO_DATE('#39'01/12/2003'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      '      AND PLNCODIGO              IS NOT NULL'
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '      AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV'
      '      AND CON.IDPATRO            = PTR.IDPESSOA'
      '   GROUP BY'
      '      HME.HMEDATAPREVISTA, HME.CCCREDFINAN, PPC.NOME, PTR.NOME'
      
        '   UNION -------------------------------------------------------' +
        '----------------------------------'
      '   SELECT /*+INDEX(CON XPKCONTRATOEMPTMO) */'
      '      HMEDATAESTORNO AS DATA,'
      '      RTRIM(HME.CCCREDFINAN) AS CONTACONTABIL,'
      '      15 AS IDMODULO,'
      '      PPC.NOME AS NOMEPLANO,'
      '      PTR.NOME AS NOMEPATRO,'
      
        '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, 0, ABS(HME.HMEVLR' +
        'PREVISTO))) AS EPDEB,'
      
        '      SUM(DECODE(SIGN(HME.HMEVLRPREVISTO), -1, ABS(HME.HMEVLRPRE' +
        'VISTO), 0)) AS EPCRED,'
      '      0.00 AS CONTABDEB,'
      '      0.00 AS CONTABCRED'
      '   FROM'
      '      HISTMOVEMPTMO    HME,'
      '      CONTRATOEMPTMO   CON,'
      '      PLANPREVCONTABIL PPC,'
      '      PESSOA           PTR'
      '   WHERE'
      
        '          HME.HMEDATAESTORNO     = TO_DATE('#39'01/12/2003'#39','#39'DD/MM/Y' +
        'YYY'#39')'
      '      AND PLNCODIGOESTORNO       IS NOT NULL'
      '      AND HME.IDCONTRATOEMPTMO   = CON.IDCONTRATOEMPTMO'
      '      AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV'
      '      AND CON.IDPATRO            = PTR.IDPESSOA'
      '   GROUP BY'
      '      HME.HMEDATAESTORNO, HME.CCCREDFINAN, PPC.NOME, PTR.NOME'
      
        '   UNION -------------------------------------------------------' +
        '----------------------------------'
      '   SELECT'
      '      PLN.PLNDATDIA AS DATA,'
      '      RTRIM(LAC.PLACONTA) AS CONTACONTABIL,'
      '      LAC.IDMODULO,'
      '      PPC.NOME AS NOMEPLANO,'
      '      PTR.NOME AS NOMEPATRO,'
      '      0.00 AS EPDEB,'
      '      0.00 AS EPCRED,'
      
        '      SUM(DECODE(LAC.LACDEBCRE, '#39'D'#39', LAC.LACVALOR, 0)) AS CONTAB' +
        'DEB,'
      
        '      SUM(DECODE(LAC.LACDEBCRE, '#39'C'#39', LAC.LACVALOR, 0)) AS CONTAB' +
        'CRED'
      '   FROM'
      '      LANCAMENTO       LAC,'
      '      PLANILHA         PLN,'
      '      PLANPREVCONTABIL PPC,'
      '      PESSOA           PTR'
      '   WHERE'
      
        '          PLN.PLNDATDIA        = TO_DATE('#39'01/12/2003'#39','#39'DD/MM/YYY' +
        'Y'#39')'
      '      AND PLN.IDPESSOA         = 2'
      '      AND PLN.PLNCODIGO        = LAC.PLNCODIGO'
      '      AND LAC.IDPLANOPREV      = PPC.IDPLANOPREV'
      '      AND LAC.IDPATRO          = PTR.IDPESSOA'
      '   GROUP BY'
      
        '      PLN.PLNDATDIA, LAC.PLACONTA, PPC.NOME, PTR.NOME, LAC.IDMOD' +
        'ULO'
      '   ) MOV,'
      ''
      '   MODULO     MOD,'
      '   PLANOCONTA PLA'
      ''
      'WHERE'
      '       MOV.CONTACONTABIL = rtrim(PLA.PLACONTA)'
      '   AND MOV.IDMODULO      = MOD.IDMODULO'
      ''
      'GROUP BY'
      
        '   MOV.DATA, MOV.CONTACONTABIL, MOV.NOMEPLANO, MOV.NOMEPATRO, PL' +
        'A.PLANOME, MOV.IDMODULO, MOD.NOMEMODULO'
      ''
      'ORDER BY'
      
        '   MOV.DATA, MOV.CONTACONTABIL, MOV.NOMEPLANO, MOV.NOMEPATRO, MO' +
        'V.NOMEMODULO'
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 56
    object qryConciliaContabCCDiaDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object qryConciliaContabCCDiaCONTACONTABIL: TStringField
      FieldName = 'CONTACONTABIL'
      Size = 18
    end
    object qryConciliaContabCCDiaNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object qryConciliaContabCCDiaNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object qryConciliaContabCCDiaEPDEB: TFloatField
      FieldName = 'EPDEB'
    end
    object qryConciliaContabCCDiaEPCRED: TFloatField
      FieldName = 'EPCRED'
    end
    object qryConciliaContabCCDiaCONTABDEB: TFloatField
      FieldName = 'CONTABDEB'
    end
    object qryConciliaContabCCDiaCONTABCRED: TFloatField
      FieldName = 'CONTABCRED'
    end
    object qryConciliaContabCCDiaDIFDEB: TFloatField
      FieldName = 'DIFDEB'
    end
    object qryConciliaContabCCDiaDIFCRED: TFloatField
      FieldName = 'DIFCRED'
    end
    object qryConciliaContabCCDiaPLANOME: TStringField
      FieldName = 'PLANOME'
      Size = 40
    end
    object qryConciliaContabCCDiaNOMEMODULO: TStringField
      FieldName = 'NOMEMODULO'
      FixedChar = True
      Size = 50
    end
  end
  object rptConciliaContabCCDia: TppReport
    AutoStop = False
    DataPipeline = pplConciliaContabCCDia
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Análise Contábil'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 144
    Top = 8
    Version = '5.5'
    mmColumnWidth = 183621
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 47625
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Conciliação Contábil - por Conta Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 47096
        mmTop = 8731
        mmWidth = 176477
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
        mmLeft = 47096
        mmTop = 794
        mmWidth = 176477
        BandType = 0
      end
      object rptConciliaContabCClblDataIni: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 25929
        mmTop = 21960
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = '  a  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 41275
        mmTop = 21960
        mmWidth = 4763
        BandType = 0
      end
      object rptConciliaContabCClblDataFim: TppLabel
        UserName = 'rptConciliaContabCClblDataFim'
        AutoSize = False
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 46567
        mmTop = 21960
        mmWidth = 15081
        BandType = 0
      end
      object lblContaEP: TppLabel
        UserName = 'lblContaEP'
        AutoSize = False
        Caption = 'Exibindo apenas contas com alguma movimentação de Empréstimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 153194
        mmTop = 30427
        mmWidth = 100277
        BandType = 0
      end
      object lblLancamentoEP: TppLabel
        UserName = 'lblLancamentoEP'
        AutoSize = False
        Caption = 'Exibindo apenas lançamentos originados do módulo de Empréstimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 153194
        mmTop = 26194
        mmWidth = 100277
        BandType = 0
      end
      object lblPlnCodigo: TppLabel
        UserName = 'lblPlnCodigo'
        AutoSize = False
        Caption = '00000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 25929
        mmTop = 26194
        mmWidth = 20108
        BandType = 0
      end
      object lblContaDiverg: TppLabel
        UserName = 'lblLancamentoEP1'
        AutoSize = False
        Caption = 'Exibindo apenas contas com divergência de valores'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 153194
        mmTop = 21960
        mmWidth = 100277
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Conta Contábil:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 30427
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Planilha:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 10848
        mmTop = 26194
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Período:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 10848
        mmTop = 21960
        mmWidth = 15346
        BandType = 0
      end
      object lblContaContabil: TppLabel
        UserName = 'lblContaContabil'
        AutoSize = False
        Caption = '1.2.4.4.01.02.02.00.00.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 25929
        mmTop = 30427
        mmWidth = 35719
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
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
        mmTop = 35719
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label201'
        AutoSize = False
        Caption = 'Planos:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 153194
        mmTop = 35719
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
        mmTop = 43127
        mmWidth = 270669
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
        mmTop = 35719
        mmWidth = 105040
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
        mmLeft = 165629
        mmTop = 35719
        mmWidth = 105040
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
        mmTop = 43127
        mmWidth = 270669
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Color = clNone
        Pen.Style = psClear
        mmHeight = 3969
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
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        BlankWhenZero = True
        DataField = 'EPDEB'
        DataPipeline = pplConciliaContabCCDia
        DisplayFormat = '#,#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 140229
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        BlankWhenZero = True
        DataField = 'EPCRED'
        DataPipeline = pplConciliaContabCCDia
        DisplayFormat = '#,#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 161396
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        DataField = 'CONTABDEB'
        DataPipeline = pplConciliaContabCCDia
        DisplayFormat = '#,#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 184680
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'CONTABCRED'
        DataPipeline = pplConciliaContabCCDia
        DisplayFormat = '#,#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 205846
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'DIFDEB'
        DataPipeline = pplConciliaContabCCDia
        DisplayFormat = '#,#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 229130
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'DIFCRED'
        DataPipeline = pplConciliaContabCCDia
        DisplayFormat = '#,#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 250296
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOMEPLANO'
        DataPipeline = pplConciliaContabCCDia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 794
        mmTop = 529
        mmWidth = 50006
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOMEPATRO'
        DataPipeline = pplConciliaContabCCDia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 53711
        mmTop = 529
        mmWidth = 50006
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'NOMEMODULO'
        DataPipeline = pplConciliaContabCCDia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 107686
        mmTop = 529
        mmWidth = 26458
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
        mmTop = 1852
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
        mmLeft = 243417
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DATA'
      DataPipeline = pplConciliaContabCCDia
      KeepTogether = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand4: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 5556
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          AutoSize = True
          DataField = 'DATA'
          DataPipeline = pplConciliaContabCCDia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 260086
          mmTop = 794
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'CONTACONTABIL'
      DataPipeline = pplConciliaContabCCDia
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          mmHeight = 10848
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 3
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Total Créditos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 205846
          mmTop = 7408
          mmWidth = 19315
          BandType = 3
          GroupNo = 3
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Total Créditos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 161396
          mmTop = 7408
          mmWidth = 19315
          BandType = 3
          GroupNo = 3
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Total Débitos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 140229
          mmTop = 7408
          mmWidth = 19315
          BandType = 3
          GroupNo = 3
        end
        object ppLabel11: TppLabel
          UserName = 'Label101'
          AutoSize = False
          Caption = 'Total Débitos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 184680
          mmTop = 7408
          mmWidth = 19315
          BandType = 3
          GroupNo = 3
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Créditos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 250296
          mmTop = 7408
          mmWidth = 19315
          BandType = 3
          GroupNo = 3
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'Débitos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 229130
          mmTop = 7408
          mmWidth = 19315
          BandType = 3
          GroupNo = 3
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 140229
          mmTop = 6879
          mmWidth = 40481
          BandType = 3
          GroupNo = 3
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 184680
          mmTop = 6879
          mmWidth = 40481
          BandType = 3
          GroupNo = 3
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 229130
          mmTop = 6879
          mmWidth = 40481
          BandType = 3
          GroupNo = 3
        end
        object ppLabel14: TppLabel
          UserName = 'Label102'
          AutoSize = False
          Caption = 'Empréstimo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 150813
          mmTop = 3704
          mmWidth = 19315
          BandType = 3
          GroupNo = 3
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Contabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 195263
          mmTop = 3704
          mmWidth = 19315
          BandType = 3
          GroupNo = 3
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          AutoSize = False
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 239713
          mmTop = 3704
          mmWidth = 19315
          BandType = 3
          GroupNo = 3
        end
        object ppDBtxtContaContabil: TppDBText
          UserName = 'DBtxtContaContabil'
          DataField = 'CONTACONTABIL'
          DataPipeline = pplConciliaContabCCDia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 1852
          mmTop = 1058
          mmWidth = 35983
          BandType = 3
          GroupNo = 3
        end
        object ppLabel4: TppLabel
          UserName = 'Label103'
          AutoSize = False
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 794
          mmTop = 7408
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 53711
          mmTop = 7408
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object ppDBText3: TppDBText
          UserName = 'DBtxtContaContabil1'
          DataField = 'PLANOME'
          DataPipeline = pplConciliaContabCCDia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 43921
          mmTop = 1058
          mmWidth = 96044
          BandType = 3
          GroupNo = 1
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          AutoSize = False
          Caption = 'Módulo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 107686
          mmTop = 7408
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12700
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentHeight = True
          ParentWidth = True
          Weight = 0.75
          mmHeight = 12700
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 1
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          mmHeight = 5821
          mmLeft = 138642
          mmTop = 1852
          mmWidth = 88900
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'EPDEB'
          DataPipeline = pplConciliaContabCCDia
          DisplayFormat = '#,#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 140229
          mmTop = 3175
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'EPCRED'
          DataPipeline = pplConciliaContabCCDia
          DisplayFormat = '#,#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 161396
          mmTop = 3175
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'CONTABDEB'
          DataPipeline = pplConciliaContabCCDia
          DisplayFormat = '#,#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 184680
          mmTop = 3175
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'DIFCRED'
          DataPipeline = pplConciliaContabCCDia
          DisplayFormat = '#,#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 2910
          mmLeft = 250296
          mmTop = 3175
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'DIFDEB'
          DataPipeline = pplConciliaContabCCDia
          DisplayFormat = '#,#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          mmHeight = 2910
          mmLeft = 229130
          mmTop = 3175
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'CONTABCRED'
          DataPipeline = pplConciliaContabCCDia
          DisplayFormat = '#,#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 205846
          mmTop = 3175
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
