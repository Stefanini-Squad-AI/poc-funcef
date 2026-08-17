inherited dtmRelConfereEnvioContrato: TdtmRelConfereEnvioContrato
  Left = 341
  Top = 223
  Width = 217
  Height = 161
  Caption = 'dtmRelConfereEnvioContrato'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 24
    Top = 56
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
    Top = 80
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object qryConfereEnvioContrato: TwwQuery
    BeforeOpen = qryConfereEnvioContratoBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      ''
      '   CON.IDPATRO, PTR.NOME AS PATRO,'
      '   CON.IDPLANOPREV, PLP.NOME AS PLANO,'
      ''
      '   CON.NOME, CON.MATRICULA, CON.TCEDESCRICAO,'
      ''
      '   NVL(HBP.VLRPREVISTO, 0) AS VLR_PREVISTO_BENEF,'
      '   NVL(HBE.VLREFETIVO, 0)  AS VLR_EFETIVO_BENEF,'
      '   NVL(HPP.VLRPREVISTO, 0) AS VLR_PREVISTO_PATRO,'
      '   NVL(HPE.VLREFETIVO, 0)  AS VLR_EFETIVO_PATRO,'
      '   NVL(HMT.VLRPREVISTO, 0) AS VLR_PREVISTO_TMP,'
      '   NVL(HMT.VLREFETIVO, 0)  AS VLR_VLREFETIVO_TMP,'
      ''
      
        '   ( NVL(HMT.VLRPREVISTO, 0) - (NVL(HBP.VLRPREVISTO, 0) + NVL(HP' +
        'P.VLRPREVISTO, 0)) ) AS VLR_PREVISTO_DIF,'
      
        '   ( NVL(HMT.VLREFETIVO, 0) - (NVL(HBE.VLREFETIVO, 0) + NVL(HPE.' +
        'VLREFETIVO, 0)) ) AS VLR_EFETIVO_DIF'
      ''
      'FROM'
      '   PESSOA       PTR,'
      '   VWCONTRATOEP CON,'
      '   PLANPREV     PLP,'
      ''
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLRPREVISTO, 0)) AS VLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'B'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 7)'
      '      AND HME.FLGENVIO         IS NULL'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 9'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HBP,'
      ''
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLREFETIVO, 0)) AS VLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'B'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 7)'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 9'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HBE,'
      ''
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(HME.HMEVLRPREVISTO) AS VLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'P'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 7)'
      '      AND HME.FLGENVIO         IS NULL'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 2'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HPP,'
      ''
      '   ('
      '   SELECT'
      '      HME.IDCONTRATOEMPTMO,'
      '      SUM(NVL(HME.HMEVLREFETIVO, 0)) AS VLREFETIVO'
      '   FROM'
      '      HISTMOVEMPTMO HME'
      '   WHERE'
      '          HME.HMEFORMACOBRANCA = '#39'F'#39
      '      AND HME.HMETIPOFOLHA     = '#39'P'#39
      '      AND HME.HMETIPOMOV       IN (1, 2, 3, 4, 7)'
      
        '      AND ( (HME.FLGESTORNADO  IS NULL) OR (HME.FLGESTORNADO = 0' +
        ') )'
      
        '      AND ( (HME.FLGQUITADO    IS NULL) OR (HME.FLGQUITADO = 0) ' +
        ')'
      
        '      AND ( (HME.FLGABONADO    IS NULL) OR (HME.FLGABONADO = 0) ' +
        ')'
      '      AND HME.HMEANOCOBRANCA   = 2002'
      '      AND HME.HMEMESCOBRANCA   = 9'
      '      AND (HME.HMECENTRALIZA   = 1 OR HME.HMEDESTACADO = 1)'
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) HPE,'
      ''
      '   ('
      '   SELECT'
      '      TMP.IDDESCONTO                   AS IDCONTRATOEMPTMO,'
      '      SUM(NVL(TMP.VALOR, 0))           AS VLRPREVISTO,'
      '      SUM(NVL(TMP.VALORRECEBIDO, 0))   AS VLREFETIVO'
      '   FROM'
      '      TMPDESC TMP'
      '   WHERE'
      '          TMP.IDMODULO     IN (15, 32)'
      '      AND TMP.IDDESCONTO   IS NOT NULL'
      '      AND TMP.MESCOBRANCA  = '#39'2002/09'#39
      '   GROUP BY'
      '      TMP.IDDESCONTO'
      '   ) HMT'
      ''
      'WHERE'
      '       CON.IDEMPRESAPROP    = 1'
      '   AND ('
      
        '       ( ( NVL(HBP.VLRPREVISTO, 0) + NVL(HPP.VLRPREVISTO, 0) ) <' +
        '> NVL(HMT.VLRPREVISTO, 0) ) OR'
      
        '       ( ( NVL(HBE.VLREFETIVO, 0)  + NVL(HPE.VLREFETIVO, 0)  ) <' +
        '> NVL(HMT.VLREFETIVO, 0)  )'
      '       )'
      '   AND CON.IDPATRO          = PTR.IDPESSOA'
      '   AND CON.IDPLANOPREV      = PLP.IDPLANOPREV'
      '   AND CON.IDCONTRATOEMPTMO = HBP.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HBE.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HPP.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HPE.IDCONTRATOEMPTMO(+)'
      '   AND CON.IDCONTRATOEMPTMO = HMT.IDCONTRATOEMPTMO(+)'
      ''
      'ORDER BY'
      '   PTR.NOME, CON.NOME')
    ValidateWithMask = True
    Left = 128
    Top = 56
    object qryConfereEnvioContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryConfereEnvioContratoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryConfereEnvioContratoPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryConfereEnvioContratoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryConfereEnvioContratoPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object qryConfereEnvioContratoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryConfereEnvioContratoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryConfereEnvioContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryConfereEnvioContratoVLR_PREVISTO_BENEF: TFloatField
      FieldName = 'VLR_PREVISTO_BENEF'
    end
    object qryConfereEnvioContratoVLR_EFETIVO_BENEF: TFloatField
      FieldName = 'VLR_EFETIVO_BENEF'
    end
    object qryConfereEnvioContratoVLR_PREVISTO_PATRO: TFloatField
      FieldName = 'VLR_PREVISTO_PATRO'
    end
    object qryConfereEnvioContratoVLR_EFETIVO_PATRO: TFloatField
      FieldName = 'VLR_EFETIVO_PATRO'
    end
    object qryConfereEnvioContratoVLR_PREVISTO_TMP: TFloatField
      FieldName = 'VLR_PREVISTO_TMP'
    end
    object qryConfereEnvioContratoVLR_VLREFETIVO_TMP: TFloatField
      FieldName = 'VLR_VLREFETIVO_TMP'
    end
    object qryConfereEnvioContratoVLR_PREVISTO_DIF: TFloatField
      FieldName = 'VLR_PREVISTO_DIF'
    end
    object qryConfereEnvioContratoVLR_EFETIVO_DIF: TFloatField
      FieldName = 'VLR_EFETIVO_DIF'
    end
  end
  object pplConfereEnvioContrato: TppBDEPipeline
    DataSource = dtsConfereEnvioContrato
    UserName = 'pplConfereEnvioContrato'
    Left = 128
    Top = 68
    object pplConfereEnvioContratoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplConfereEnvioContratoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplConfereEnvioContratoppField3: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplConfereEnvioContratoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplConfereEnvioContratoppField5: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 4
    end
    object pplConfereEnvioContratoppField6: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplConfereEnvioContratoppField7: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object pplConfereEnvioContratoppField8: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object pplConfereEnvioContratoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_PREVISTO_BENEF'
      FieldName = 'VLR_PREVISTO_BENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplConfereEnvioContratoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_EFETIVO_BENEF'
      FieldName = 'VLR_EFETIVO_BENEF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplConfereEnvioContratoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_PREVISTO_PATRO'
      FieldName = 'VLR_PREVISTO_PATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplConfereEnvioContratoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_EFETIVO_PATRO'
      FieldName = 'VLR_EFETIVO_PATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplConfereEnvioContratoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_PREVISTO_TMP'
      FieldName = 'VLR_PREVISTO_TMP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplConfereEnvioContratoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_VLREFETIVO_TMP'
      FieldName = 'VLR_VLREFETIVO_TMP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplConfereEnvioContratoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_PREVISTO_DIF'
      FieldName = 'VLR_PREVISTO_DIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplConfereEnvioContratoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLR_EFETIVO_DIF'
      FieldName = 'VLR_EFETIVO_DIF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
  end
  object dtsConfereEnvioContrato: TwwDataSource
    DataSet = qryConfereEnvioContrato
    Left = 128
    Top = 80
  end
  object rptConfereEnvioContrato: TppReport
    AutoStop = False
    DataPipeline = pplConfereEnvioContrato
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Itens Enviados (Sintético)'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 128
    Top = 8
    Version = '7.04'
    mmColumnWidth = 270542
    DataPipelineName = 'pplConfereEnvioContrato'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 43392
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Conferência de Valores Enviados / Recebidos (por Contrato)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 11113
        mmTop = 8731
        mmWidth = 248444
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
        mmLeft = 11113
        mmTop = 794
        mmWidth = 248444
        BandType = 0
      end
      object rptConfereEnvioContrato_lblMesCobranca: TppLabel
        UserName = 'Label3'
        Caption = 'Label3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 34396
        mmTop = 16669
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'Mês de Cobrança:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 16669
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
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
        mmTop = 31485
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel26: TppLabel
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
        mmLeft = 153459
        mmTop = 31485
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
        mmTop = 38894
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
        mmTop = 31485
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
        mmLeft = 165894
        mmTop = 31485
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
        mmTop = 38894
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
        mmTop = 26458
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
        mmLeft = 144198
        mmTop = 26458
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
        mmTop = 26458
        mmWidth = 102659
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
        mmLeft = 165894
        mmTop = 26458
        mmWidth = 105040
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = ppShape3Print
        UserName = 'Shape3'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppLine4: TppLine
        OnPrint = ppLine4Print
        UserName = 'Line4'
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 270542
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOME'
        DataPipeline = pplConfereEnvioContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 28310
        mmTop = 794
        mmWidth = 39423
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLR_PREVISTO_PATRO'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 144198
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLR_EFETIVO_PATRO'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 160073
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'VLR_PREVISTO_BENEF'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 175948
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLR_EFETIVO_BENEF'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 191823
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLR_PREVISTO_TMP'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 207698
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'VLR_VLREFETIVO_TMP'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 223573
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 0
        mmTop = 794
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULA'
        DataPipeline = pplConfereEnvioContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 14552
        mmTop = 794
        mmWidth = 11906
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplConfereEnvioContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 112713
        mmTop = 794
        mmWidth = 28575
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'VLR_EFETIVO_DIF'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 255323
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText101'
        DataField = 'VLR_PREVISTO_DIF'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 239448
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplConfereEnvioContrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 69586
        mmTop = 794
        mmWidth = 40217
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
        mmTop = 1852
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
        mmHeight = 3175
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23019
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 103717
        mmTop = 3175
        mmWidth = 63236
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
        mmLeft = 242888
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 1588
        mmWidth = 270542
        BandType = 7
      end
      object ppLabel19: TppLabel
        UserName = 'Label4'
        Caption = 'Total Geral:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 127265
        mmTop = 5292
        mmWidth = 15875
        BandType = 7
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 5292
        mmLeft = 142875
        mmTop = 4233
        mmWidth = 128059
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'VLR_EFETIVO_PATRO'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 160073
        mmTop = 5556
        mmWidth = 14023
        BandType = 7
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'VLR_PREVISTO_BENEF'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 175948
        mmTop = 5556
        mmWidth = 14023
        BandType = 7
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'VLR_EFETIVO_BENEF'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 191823
        mmTop = 5556
        mmWidth = 14023
        BandType = 7
      end
      object ppDBCalc11: TppDBCalc
        UserName = 'DBCalc11'
        DataField = 'VLR_PREVISTO_PATRO'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 144198
        mmTop = 5556
        mmWidth = 14023
        BandType = 7
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'VLR_PREVISTO_TMP'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 207698
        mmTop = 5556
        mmWidth = 14023
        BandType = 7
      end
      object ppDBCalc13: TppDBCalc
        UserName = 'DBCalc13'
        DataField = 'VLR_VLREFETIVO_TMP'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 223573
        mmTop = 5556
        mmWidth = 14023
        BandType = 7
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Pen.Width = 2
        mmHeight = 6085
        mmLeft = 14023
        mmTop = 4233
        mmWidth = 37306
        BandType = 7
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Contrato(s)  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 31750
        mmTop = 5556
        mmWidth = 16404
        BandType = 7
      end
      object ppDBCalc14: TppDBCalc
        UserName = 'DBCalc14'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 3175
        mmLeft = 15081
        mmTop = 5556
        mmWidth = 15875
        BandType = 7
      end
      object ppDBCalc17: TppDBCalc
        UserName = 'DBCalc17'
        DataField = 'VLR_PREVISTO_DIF'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 239448
        mmTop = 5556
        mmWidth = 14023
        BandType = 7
      end
      object ppDBCalc18: TppDBCalc
        UserName = 'DBCalc18'
        DataField = 'VLR_EFETIVO_DIF'
        DataPipeline = pplConfereEnvioContrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConfereEnvioContrato'
        mmHeight = 2381
        mmLeft = 255323
        mmTop = 5556
        mmWidth = 14023
        BandType = 7
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PATRO'
      DataPipeline = pplConfereEnvioContrato
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConfereEnvioContrato'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = 15263976
          ParentHeight = True
          ParentWidth = True
          Pen.Style = psClear
          Pen.Width = 0
          mmHeight = 11113
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'PATRO'
          DataPipeline = pplConfereEnvioContrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplConfereEnvioContrato'
          mmHeight = 3175
          mmLeft = 1058
          mmTop = 529
          mmWidth = 92604
          BandType = 3
          GroupNo = 1
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 10583
          mmWidth = 270542
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 144198
          mmTop = 7673
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Folha da Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 146844
          mmTop = 3969
          mmWidth = 27252
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 160073
          mmTop = 7673
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 175948
          mmTop = 7673
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 191823
          mmTop = 7673
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Folha de Benefícios'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 179917
          mmTop = 3704
          mmWidth = 23283
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 207698
          mmTop = 7673
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 223573
          mmTop = 7673
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object ppLine8: TppLine
          UserName = 'Line8'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 209286
          mmTop = 6879
          mmWidth = 28310
          BandType = 3
          GroupNo = 1
        end
        object ppLabel21: TppLabel
          UserName = 'Label201'
          Caption = 'Folha(s)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 218546
          mmTop = 3704
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 0
          mmTop = 7673
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 14552
          mmTop = 7673
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Mutuário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 28310
          mmTop = 7673
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 177800
          mmTop = 6879
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 145786
          mmTop = 6879
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          AutoSize = False
          Caption = 'Tipo de Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 112713
          mmTop = 7673
          mmWidth = 26723
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'Recebido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 255323
          mmTop = 7673
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label22'
          AutoSize = False
          Caption = 'Enviado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 239448
          mmTop = 7673
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 529
          mmLeft = 241036
          mmTop = 6879
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 2910
          mmLeft = 249503
          mmTop = 3704
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          AutoSize = False
          Caption = 'Tipo de Contrato'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          Visible = False
          mmHeight = 2910
          mmLeft = 69586
          mmTop = 7673
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 17463
        mmPrintPosition = 0
        object ppShape5: TppShape
          UserName = 'Shape5'
          Pen.Width = 2
          mmHeight = 6085
          mmLeft = 14023
          mmTop = 2381
          mmWidth = 37306
          BandType = 5
          GroupNo = 0
        end
        object ppShape4: TppShape
          UserName = 'Shape4'
          Pen.Width = 2
          mmHeight = 5292
          mmLeft = 142875
          mmTop = 2381
          mmWidth = 128059
          BandType = 5
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 529
          mmLeft = 0
          mmTop = 0
          mmWidth = 270542
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLR_PREVISTO_PATRO'
          DataPipeline = pplConfereEnvioContrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConfereEnvioContrato'
          mmHeight = 2381
          mmLeft = 144198
          mmTop = 3704
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLR_EFETIVO_BENEF'
          DataPipeline = pplConfereEnvioContrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConfereEnvioContrato'
          mmHeight = 2381
          mmLeft = 191823
          mmTop = 3704
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'VLR_EFETIVO_PATRO'
          DataPipeline = pplConfereEnvioContrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConfereEnvioContrato'
          mmHeight = 2381
          mmLeft = 160073
          mmTop = 3704
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'VLR_PREVISTO_TMP'
          DataPipeline = pplConfereEnvioContrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConfereEnvioContrato'
          mmHeight = 2381
          mmLeft = 207698
          mmTop = 3704
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'VLR_PREVISTO_BENEF'
          DataPipeline = pplConfereEnvioContrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConfereEnvioContrato'
          mmHeight = 2381
          mmLeft = 175948
          mmTop = 3704
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'VLR_VLREFETIVO_TMP'
          DataPipeline = pplConfereEnvioContrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConfereEnvioContrato'
          mmHeight = 2381
          mmLeft = 223573
          mmTop = 3704
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label2'
          Caption = 'Total da Patrocinadora:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 113506
          mmTop = 3440
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Contrato(s)  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 31750
          mmTop = 3704
          mmWidth = 16404
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplConfereEnvioContrato
          DisplayFormat = '#,#0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'pplConfereEnvioContrato'
          mmHeight = 3175
          mmLeft = 15081
          mmTop = 3704
          mmWidth = 15875
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'VLR_PREVISTO_DIF'
          DataPipeline = pplConfereEnvioContrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConfereEnvioContrato'
          mmHeight = 2381
          mmLeft = 239448
          mmTop = 3704
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc16: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'VLR_EFETIVO_DIF'
          DataPipeline = pplConfereEnvioContrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 6
          Font.Style = []
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplConfereEnvioContrato'
          mmHeight = 2381
          mmLeft = 255323
          mmTop = 3704
          mmWidth = 14023
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
