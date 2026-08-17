inherited DmRelParamContab: TDmRelParamContab
  Left = 472
  Top = 324
  Width = 276
  Height = 244
  Caption = 'DmRelParamContab'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  inherited rpExemplo: TppReport
    DataPipelineName = 'pplExemplo'
  end
  object QryContabil: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(USUARIOSISTEMA.NOMEUSUARIO,NULL,'#39'CM'#39',USUARIOSISTEM' +
        'A.NOMEUSUARIO) AS NOMEUSUARIO,'
      '   DESCTIPOOPERACAO,'
      '   DESCCARTINVEST,'
      '   TIPOINVEST.DESCTIPOINVEST AS TIPOINVESTIMENTO,'
      '   TITULO.DESCTITULO,'
      '   PADRLANCCONTINV.CODTIPTITULO  ,'
      '   PADRLANCCONTINV.HISTLANCINVEST AS HISTORICO,'
      
        '  (DECODE(PADRLANCCONTINV.FLGPAGRECNAO,'#39'P'#39','#39'a Pagar'#39')||DECODE(PA' +
        'DRLANCCONTINV.FLGPAGRECNAO,'#39'R'#39','#39'a Receber'#39')||DECODE(PADRLANCCONT' +
        'INV.FLGPAGRECNAO,'#39'N'#39','#39'Nenhum'#39')) AS TIPOLANCTO,'
      '   TIPOPER.TIPDESCRICAO,'
      '   TIPORECEBDESEMB.DESCRICAO AS TIPODESEMBOLSO,'
      '   CENTRESPON.NOME AS CENTRORESP,'
      '   PADRLANCCONTINV.CENCUSTDINVEST,'
      '   PADRLANCCONTINV.CODSUBCONTAD,'
      '   PADRLANCCONTINV.CONTADOPERFIN  AS CONTADEBITO,'
      '   DEBITO.PLANOME AS NOMECTADEBITO,'
      '   PADRLANCCONTINV.CODSUBCONTAC,'
      '   PADRLANCCONTINV.CENCUSTCINVEST,'
      '   PADRLANCCONTINV.CONTACOPERFIN  AS CONTACREDITO,'
      '   CREDITO.PLANOME  AS NOMECTACREDITO,'
      '   CLASSETITRENFIX.DESCCLASSETIT,'
      '   ITEMRENFIX.DESCITEMRENFIX,'
      '   TIPODESPINVEST.DESCTIPODESPINV,'
      '   PL.PLANPRVCONTABPATRO'
      ''
      'FROM'
      
        '  PLANOCONTA DEBITO, PLANOCONTA CREDITO, PADRLANCCONTINV, TIPOOP' +
        'ERACAO,'
      
        '  TIPOINVEST, TIPOPER, TIPORECEBDESEMB, CENTRESPON,CLASSETITRENF' +
        'IX,ITEMRENFIX,'
      
        '  TIPODESPINVEST, CARTEIRAINVEST, USUARIOSISTEMA,VWPLANPREVCTBPA' +
        'TR PL,'
      ''
      '  (SELECT'
      '      TT.CODTIPTITULO,'
      '      TA.DESCTIPOACAO AS DESCTITULO'
      '   FROM'
      '      TIPOTITULO TT, TIPOACAO TA'
      '   WHERE'
      
        '      (TT.IDTIPOINVEST  IN (SELECT IDTIPOINVEST FROM TIPOINVEST ' +
        'WHERE IDTIPOINVEST NOT IN(5,6)))        AND'
      '      (TT.CODTIPTITULO  = TA.CODTIPOACAO(+) )   AND'
      '      (TA.DESCTIPOACAO IS NOT NULL)'
      ''
      '   UNION'
      ''
      '   SELECT'
      '      TT.CODTIPTITULO,'
      '      TR.DESCTIPRENFIXA AS DESCTITULO'
      '   FROM'
      '      TIPOTITULO TT, TIPOTITRENFIXA TR'
      '   WHERE'
      
        '      (TT.IDTIPOINVEST  IN (SELECT IDTIPOINVEST FROM TIPOINVEST ' +
        'WHERE IDTIPOINVEST NOT IN(5,6)))        AND'
      '      (TT.CODTIPTITULO  = TR.CODTIPRENFIXA(+) ) AND'
      '      (TR.DESCTIPRENFIXA IS NOT NULL)'
      ''
      '   UNION'
      ''
      '   SELECT'
      '      TT.CODTIPTITULO,'
      '      TC.DESCTIPOCTINVEST AS DESCTITULO'
      '   FROM'
      '      TIPOCONTRINVEST TC, TIPOTITULO TT'
      '   WHERE'
      '      (TC.DESCTIPOCTINVEST IS NOT NULL)  AND'
      
        '      (TC.IDTIPOINVEST IN (SELECT IDTIPOINVEST FROM TIPOINVEST W' +
        'HERE IDTIPOINVEST NOT IN (1,5,6,8))) AND'
      '      (TT.IDTIPOINVEST = TC.IDTIPOINVEST(+))'
      ''
      '   UNION'
      ''
      '   SELECT'
      '       TT.CODTIPTITULO AS CODTIPTITULO,'
      '      (TI.DESCTIPOINVEST||'#39' - '#39' ||TT.CODTIPTITULO) AS DESCTITULO'
      '   FROM'
      '       TIPOINVEST TI,TIPOTITULO TT'
      '   WHERE'
      '      (TT.IDTIPOINVEST  = TI.IDTIPOINVEST(+))) TITULO'
      'WHERE'
      
        '   TIPOOPERACAO.IDTIPOOPERACAO(+) = PADRLANCCONTINV.IDTIPOOPERAC' +
        'AO  AND'
      
        '   TIPOOPERACAO.IDTIPOINVEST(+)   = PADRLANCCONTINV.IDTIPOINVEST' +
        '    AND'
      
        '   TIPOINVEST.IDTIPOINVEST(+)     = PADRLANCCONTINV.IDTIPOINVEST' +
        '    AND'
      
        '   TIPOPER.TIPCODIGO(+)           = PADRLANCCONTINV.TIPCODIGO   ' +
        '    AND'
      
        '   TIPORECEBDESEMB.CODTIPRECDES(+)= PADRLANCCONTINV.CODTIPRECDES' +
        '    AND'
      
        '   TIPORECEBDESEMB.RECPAG(+)      = PADRLANCCONTINV.FLGPAGRECNAO' +
        '    AND'
      
        '   CENTRESPON.CODCENTRORESPON(+)  = PADRLANCCONTINV.CODCENTRORES' +
        'PON AND'
      
        '   DEBITO.PLACONTA                = PADRLANCCONTINV.CONTADOPERFI' +
        'N   AND'
      
        '   DEBITO.PLANO                   = :PLANO                      ' +
        '    AND'
      
        '   CREDITO.PLACONTA               = PADRLANCCONTINV.CONTACOPERFI' +
        'N   AND'
      
        '   CREDITO.PLANO                  = :PLANO                      ' +
        '    AND'
      
        '   TITULO.CODTIPTITULO(+)         = PADRLANCCONTINV.CODTIPTITULO' +
        '    AND'
      
        '   CLASSETITRENFIX.IDCLASSETIT(+) = PADRLANCCONTINV.IDCLASSETIT ' +
        '    AND'
      
        '   ITEMRENFIX.IDITEMRENFIX(+)     = PADRLANCCONTINV.IDITEMRENFIX' +
        '    AND'
      
        '   PADRLANCCONTINV.IDTIPODESPINVEST = TIPODESPINVEST.IDTIPODESPI' +
        'NVEST(+) AND'
      
        '   CARTEIRAINVEST.IDCARTEIRAINVEST(+)  = PADRLANCCONTINV.IDCARTE' +
        'IRAINVEST   AND'
      
        '   (((:IDTIPOINVEST IS NOT NULL) AND (PADRLANCCONTINV.IDTIPOINVE' +
        'ST = :IDTIPOINVEST)) OR (:IDTIPOINVEST IS NULL)) AND'
      
        '   (USUARIOSISTEMA.IDUSUARIO(+)    = TO_NUMBER(DECODE(LTRIM(PADR' +
        'LANCCONTINV.TRGUSERINCLUSAO,'#39'CM'#39'),'#39#39',-1, LTRIM(PADRLANCCONTINV.T' +
        'RGUSERINCLUSAO,'#39'CM'#39')))) AND'
      
        '   (PADRLANCCONTINV.IDPLANPREVCTBPATR  = PL.IDPLANPREVCTBPATR(+)' +
        ')'
      ''
      ''
      
        'ORDER BY CARTEIRAINVEST.DESCCARTINVEST, TIPOINVESTIMENTO,DESCCLA' +
        'SSETIT, DESCTIPOOPERACAO,'
      '         DESCTITULO,HISTORICO'
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 37
    Top = 131
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end>
    object QryContabilTIPOINVESTIMENTO: TStringField
      FieldName = 'TIPOINVESTIMENTO'
      Size = 60
    end
    object QryContabilDESCTITULO: TStringField
      FieldName = 'DESCTITULO'
      Size = 68
    end
    object QryContabilCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Size = 5
    end
    object QryContabilHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 60
    end
    object QryContabilTIPOLANCTO: TStringField
      FieldName = 'TIPOLANCTO'
      Size = 10
    end
    object QryContabilTIPDESCRICAO: TStringField
      FieldName = 'TIPDESCRICAO'
      Size = 25
    end
    object QryContabilTIPODESEMBOLSO: TStringField
      FieldName = 'TIPODESEMBOLSO'
      Size = 35
    end
    object QryContabilCENTRORESP: TStringField
      FieldName = 'CENTRORESP'
      FixedChar = True
      Size = 30
    end
    object QryContabilCENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      FixedChar = True
      Size = 10
    end
    object QryContabilCODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
    end
    object QryContabilCONTADEBITO: TStringField
      FieldName = 'CONTADEBITO'
      FixedChar = True
      Size = 18
    end
    object QryContabilNOMECTADEBITO: TStringField
      FieldName = 'NOMECTADEBITO'
      Size = 40
    end
    object QryContabilCODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
    end
    object QryContabilCENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      FixedChar = True
      Size = 10
    end
    object QryContabilCONTACREDITO: TStringField
      FieldName = 'CONTACREDITO'
      FixedChar = True
      Size = 18
    end
    object QryContabilNOMECTACREDITO: TStringField
      FieldName = 'NOMECTACREDITO'
      Size = 40
    end
    object QryContabilDESCCLASSETIT: TStringField
      FieldName = 'DESCCLASSETIT'
      Size = 30
    end
    object QryContabilDESCITEMRENFIX: TStringField
      FieldName = 'DESCITEMRENFIX'
      Size = 60
    end
    object QryContabilDESCTIPODESPINV: TStringField
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object QryContabilDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryContabilDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object QryContabilNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
    end
    object QryContabilPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object BdeContabil: TppBDEPipeline
    DataSource = DsContabil
    UserName = 'BdeContabil'
    Left = 77
    Top = 131
    object BdeContabilppField1: TppField
      FieldAlias = 'TIPOINVESTIMENTO'
      FieldName = 'TIPOINVESTIMENTO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object BdeContabilppField2: TppField
      FieldAlias = 'DESCTITULO'
      FieldName = 'DESCTITULO'
      FieldLength = 68
      DisplayWidth = 68
      Position = 1
    end
    object BdeContabilppField3: TppField
      FieldAlias = 'CODTIPTITULO'
      FieldName = 'CODTIPTITULO'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
    object BdeContabilppField4: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object BdeContabilppField5: TppField
      FieldAlias = 'TIPOLANCTO'
      FieldName = 'TIPOLANCTO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 4
    end
    object BdeContabilppField6: TppField
      FieldAlias = 'TIPDESCRICAO'
      FieldName = 'TIPDESCRICAO'
      FieldLength = 25
      DisplayWidth = 25
      Position = 5
    end
    object BdeContabilppField7: TppField
      FieldAlias = 'TIPODESEMBOLSO'
      FieldName = 'TIPODESEMBOLSO'
      FieldLength = 35
      DisplayWidth = 35
      Position = 6
    end
    object BdeContabilppField8: TppField
      FieldAlias = 'CENTRORESP'
      FieldName = 'CENTRORESP'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object BdeContabilppField9: TppField
      FieldAlias = 'CENCUSTDINVEST'
      FieldName = 'CENCUSTDINVEST'
      FieldLength = 10
      DisplayWidth = 10
      Position = 8
    end
    object BdeContabilppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODSUBCONTAD'
      FieldName = 'CODSUBCONTAD'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object BdeContabilppField11: TppField
      FieldAlias = 'CONTADEBITO'
      FieldName = 'CONTADEBITO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 10
    end
    object BdeContabilppField12: TppField
      FieldAlias = 'NOMECTADEBITO'
      FieldName = 'NOMECTADEBITO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 11
    end
    object BdeContabilppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODSUBCONTAC'
      FieldName = 'CODSUBCONTAC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object BdeContabilppField14: TppField
      FieldAlias = 'CENCUSTCINVEST'
      FieldName = 'CENCUSTCINVEST'
      FieldLength = 10
      DisplayWidth = 10
      Position = 13
    end
    object BdeContabilppField15: TppField
      FieldAlias = 'CONTACREDITO'
      FieldName = 'CONTACREDITO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 14
    end
    object BdeContabilppField16: TppField
      FieldAlias = 'NOMECTACREDITO'
      FieldName = 'NOMECTACREDITO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 15
    end
    object BdeContabilppField17: TppField
      FieldAlias = 'DESCCLASSETIT'
      FieldName = 'DESCCLASSETIT'
      FieldLength = 30
      DisplayWidth = 30
      Position = 16
    end
    object BdeContabilppField18: TppField
      FieldAlias = 'DESCITEMRENFIX'
      FieldName = 'DESCITEMRENFIX'
      FieldLength = 60
      DisplayWidth = 60
      Position = 17
    end
    object BdeContabilppField19: TppField
      FieldAlias = 'DESCTIPODESPINV'
      FieldName = 'DESCTIPODESPINV'
      FieldLength = 60
      DisplayWidth = 60
      Position = 18
    end
    object BdeContabilppField20: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 19
    end
    object BdeContabilppField21: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 20
    end
    object BdeContabilppField22: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 21
    end
    object BdeContabilppField23: TppField
      FieldAlias = 'PLANPRVCONTABPATRO'
      FieldName = 'PLANPRVCONTABPATRO'
      FieldLength = 113
      DisplayWidth = 113
      Position = 22
    end
  end
  object DsContabil: TwwDataSource
    DataSet = QryContabil
    Left = 101
    Top = 131
  end
  object RptContabil: TppReport
    AutoStop = False
    DataPipeline = BdeContabil
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Integração Contábil / Financeira'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = RptContabilBeforePrint
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 77
    Top = 73
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BdeContabil'
    object ppHeaderBand27: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppLabel103: TppLabel
        UserName = 'Label103'
        Caption = 'Integração Contábil e Financeira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 55033
        BandType = 0
      end
      object ppLabel220: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLCarteiraContabil: TppLabel
        UserName = 'LCarteira1'
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
        mmLeft = 264319
        mmTop = 13758
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel224: TppLabel
        UserName = 'LPeriodo3'
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
      object ppDBImage3: TppDBImage
        UserName = 'DbLogo2'
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
      object ppLPeriodoContabil: TppLabel
        UserName = 'LPeriodoContabil'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 11113
        BandType = 0
      end
    end
    object ppDetailBand29: TppDetailBand
      BeforePrint = ppDetailBand29BeforePrint
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppDBText121: TppDBText
        UserName = 'DBText121'
        DataField = 'HISTORICO'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 2646
        mmLeft = 529
        mmTop = 3704
        mmWidth = 69056
        BandType = 4
      end
      object ppDBText122: TppDBText
        UserName = 'DBText122'
        DataField = 'TIPOLANCTO'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 2646
        mmLeft = 102923
        mmTop = 3704
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText123: TppDBText
        UserName = 'DBText123'
        DataField = 'TIPDESCRICAO'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 12171
        mmLeft = 84931
        mmTop = 3704
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText124: TppDBText
        UserName = 'DBText124'
        DataField = 'TIPODESEMBOLSO'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 5821
        mmLeft = 102923
        mmTop = 10054
        mmWidth = 36248
        BandType = 4
      end
      object ppDBText125: TppDBText
        UserName = 'DBText125'
        DataField = 'CENTRORESP'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 5556
        mmLeft = 140229
        mmTop = 3704
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText126: TppDBText
        UserName = 'DBText126'
        DataField = 'CONTADEBITO'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 2646
        mmLeft = 167746
        mmTop = 3704
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText127: TppDBText
        UserName = 'DBText127'
        DataField = 'CONTACREDITO'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 2646
        mmLeft = 167746
        mmTop = 10054
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText128: TppDBText
        UserName = 'DBText128'
        DataField = 'CODSUBCONTAD'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 2646
        mmLeft = 228071
        mmTop = 3704
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText129: TppDBText
        UserName = 'DBText129'
        DataField = 'CODSUBCONTAC'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 2646
        mmLeft = 228071
        mmTop = 10054
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText130: TppDBText
        UserName = 'DBText130'
        DataField = 'CENCUSTDINVEST'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 5821
        mmLeft = 251090
        mmTop = 3704
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText131: TppDBText
        UserName = 'DBText131'
        DataField = 'CENCUSTCINVEST'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 5821
        mmLeft = 251090
        mmTop = 10054
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText132: TppDBText
        UserName = 'DBText132'
        DataField = 'NOMECTADEBITO'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 5821
        mmLeft = 191294
        mmTop = 3704
        mmWidth = 36513
        BandType = 4
      end
      object ppDBText133: TppDBText
        UserName = 'DBText133'
        DataField = 'NOMECTACREDITO'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 5821
        mmLeft = 191294
        mmTop = 10054
        mmWidth = 36513
        BandType = 4
      end
      object ppLine142: TppLine
        UserName = 'Line142'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20108
        mmWidth = 277549
        BandType = 4
      end
      object ppLabel273: TppLabel
        UserName = 'Label273'
        Caption = 'Débito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 159279
        mmTop = 3704
        mmWidth = 6615
        BandType = 4
      end
      object ppLabel274: TppLabel
        UserName = 'Label274'
        Caption = 'Crédito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 159279
        mmTop = 10054
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText135: TppDBText
        UserName = 'DBText135'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 6879
        mmWidth = 67733
        BandType = 4
      end
      object RptContabilLabel277: TppLabel
        UserName = 'RptContabilLabel277'
        Caption = 'RptContabilLabel277'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 6879
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText134: TppDBText
        UserName = 'DBText134'
        DataField = 'DESCTIPODESPINV'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 12171
        mmLeft = 70379
        mmTop = 3704
        mmWidth = 13758
        BandType = 4
      end
      object ppDBDescClasseTit: TppDBText
        UserName = 'DBDescClasseTit'
        DataField = 'DESCCLASSETIT'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 2910
        mmLeft = 529
        mmTop = 529
        mmWidth = 69056
        BandType = 4
      end
      object ppDBText115: TppDBText
        UserName = 'DBText115'
        DataField = 'DESCCARTINVEST'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 2381
        mmLeft = 1852
        mmTop = 10054
        mmWidth = 67469
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Usuário :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 2381
        mmLeft = 2117
        mmTop = 13494
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOMEUSUARIO'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 2381
        mmLeft = 13229
        mmTop = 13494
        mmWidth = 47096
        BandType = 4
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 84402
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpRight
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 154517
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpRight
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 264319
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 0
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppLine15: TppLine
        UserName = 'Line15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 102129
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppLine16: TppLine
        UserName = 'Line16'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 102129
        mmTop = 9525
        mmWidth = 37306
        BandType = 4
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20373
        mmLeft = 139436
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppLine21: TppLine
        UserName = 'Line21'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 20108
        mmLeft = 69850
        mmTop = 0
        mmWidth = 4498
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'PLANPRVCONTABPATRO'
        DataPipeline = BdeContabil
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        DataPipelineName = 'BdeContabil'
        mmHeight = 2381
        mmLeft = 2117
        mmTop = 16933
        mmWidth = 66675
        BandType = 4
      end
    end
    object ppFooterBand26: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine143: TppLine
        UserName = 'ppLine22'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 277549
        BandType = 8
      end
      object ppLabel276: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel91'
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
        mmTop = 2117
        mmWidth = 277284
        BandType = 8
      end
      object ppSystemVariable14: TppSystemVariable
        OnPrint = LblSistemaPrint
        UserName = 'Calc11'
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
        mmTop = 2381
        mmWidth = 284163
        BandType = 8
      end
      object ppSystemVariable21: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 250032
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup10: TppGroup
      BreakName = 'TIPOINVESTIMENTO'
      DataPipeline = BdeContabil
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group10'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BdeContabil'
      object ppGroupHeaderBand10: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 21167
        mmPrintPosition = 0
        object ppDBText120: TppDBText
          UserName = 'DBText120'
          DataField = 'TIPOINVESTIMENTO'
          DataPipeline = BdeContabil
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'BdeContabil'
          mmHeight = 3175
          mmLeft = 2910
          mmTop = 1588
          mmWidth = 86519
          BandType = 3
          GroupNo = 0
        end
        object shpPosFundosCab: TppShape
          UserName = 'shpPosFundosCab'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 15610
          mmLeft = 0
          mmTop = 5292
          mmWidth = 277549
          BandType = 3
          GroupNo = 0
        end
        object ppLabel263: TppLabel
          UserName = 'Label263'
          Caption = 'Histórico / Tipo de Operação / Carteira / Plano-Patrocinadora'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 5165
          mmLeft = 8996
          mmTop = 13494
          mmWidth = 39455
          BandType = 3
          GroupNo = 0
        end
        object ppLabel264: TppLabel
          UserName = 'Label264'
          Caption = 'Tipo de Lançamento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2381
          mmLeft = 102923
          mmTop = 12700
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppLabel265: TppLabel
          UserName = 'Label265'
          Caption = 'Tipo de Operação Contábil'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 88900
          mmTop = 12700
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppLabel266: TppLabel
          UserName = 'Label266'
          Caption = 'Contas a Pagar e Receber'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 96044
          mmTop = 6615
          mmWidth = 34925
          BandType = 3
          GroupNo = 0
        end
        object ppLabel267: TppLabel
          UserName = 'Label267'
          Caption = 'Contabilidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 208492
          mmTop = 6615
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppLabel268: TppLabel
          UserName = 'Label268'
          Caption = 'Recebimento / Desembolso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2381
          mmLeft = 102923
          mmTop = 17463
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLabel270: TppLabel
          UserName = 'Label270'
          Caption = 'Conta Contábil'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2381
          mmLeft = 159279
          mmTop = 12700
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel271: TppLabel
          UserName = 'Label271'
          Caption = 'Sub-Conta'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2381
          mmLeft = 228071
          mmTop = 12700
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppLabel272: TppLabel
          UserName = 'Label272'
          Caption = 'Centro de Custo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          mmHeight = 2381
          mmLeft = 251090
          mmTop = 12700
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel269: TppLabel
          UserName = 'Label269'
          Caption = 'Centro de Responsabilidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 5027
          mmLeft = 140229
          mmTop = 12700
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Position = lpRight
          Weight = 0.75
          mmHeight = 15610
          mmLeft = 156898
          mmTop = 5292
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 10319
          mmWidth = 277549
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Tipo de Rúbrica'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          WordWrap = True
          mmHeight = 7408
          mmLeft = 73290
          mmTop = 12700
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 15346
          mmLeft = 84402
          mmTop = 5556
          mmWidth = 3969
          BandType = 3
          GroupNo = 0
        end
        object ppLine12: TppLine
          UserName = 'Line12'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10583
          mmLeft = 102129
          mmTop = 10583
          mmWidth = 2910
          BandType = 3
          GroupNo = 0
        end
        object ppLine13: TppLine
          UserName = 'Line13'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10319
          mmLeft = 139436
          mmTop = 10583
          mmWidth = 2910
          BandType = 3
          GroupNo = 0
        end
        object ppLine18: TppLine
          UserName = 'Line18'
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 102129
          mmTop = 16140
          mmWidth = 37306
          BandType = 3
          GroupNo = 0
        end
        object ppLine19: TppLine
          UserName = 'Line19'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 69586
          mmTop = 10583
          mmWidth = 3175
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 
            'Classe / Histórico / Tipo de Operação / Carteira/Usuário/Plano-P' +
            'atrocinadora'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          WordWrap = True
          mmHeight = 5292
          mmLeft = 9525
          mmTop = 13494
          mmWidth = 38894
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand10: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup11: TppGroup
      BreakName = 'DESCTITULO'
      DataPipeline = BdeContabil
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group11'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BdeContabil'
      object ppGroupHeaderBand11: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object ppDBDescTitulo: TppDBText
          UserName = 'ppDBDescTitulo'
          DataField = 'DESCTITULO'
          DataPipeline = BdeContabil
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'BdeContabil'
          mmHeight = 2910
          mmLeft = 1852
          mmTop = 794
          mmWidth = 65881
          BandType = 3
          GroupNo = 1
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10583
          mmLeft = 102129
          mmTop = 0
          mmWidth = 2910
          BandType = 3
          GroupNo = 1
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10319
          mmLeft = 139436
          mmTop = 0
          mmWidth = 2910
          BandType = 3
          GroupNo = 1
        end
        object ppLine22: TppLine
          UserName = 'Line22'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 14817
          mmLeft = 0
          mmTop = 0
          mmWidth = 3175
          BandType = 3
          GroupNo = 1
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 69850
          mmTop = 0
          mmWidth = 3175
          BandType = 3
          GroupNo = 1
        end
        object ppLine5: TppLine
          UserName = 'Line101'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 10319
          mmLeft = 158750
          mmTop = 0
          mmWidth = 2910
          BandType = 3
          GroupNo = 1
        end
        object ppLine14: TppLine
          UserName = 'Line14'
          Position = lpRight
          Weight = 0.75
          mmHeight = 20108
          mmLeft = 264055
          mmTop = 0
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object ppLine20: TppLine
          UserName = 'Line20'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9790
          mmLeft = 84402
          mmTop = 0
          mmWidth = 3175
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand11: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object QryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM DUAL')
    ValidateWithMask = True
    Left = 197
    Top = 458
  end
end
