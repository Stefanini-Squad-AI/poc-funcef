inherited dtmRelFalecimento: TdtmRelFalecimento
  Left = 351
  Top = 202
  Width = 201
  Height = 265
  Caption = 'dRelRetencaoIOF'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 32
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
    Left = 32
    Top = 107
  end
  inherited qryExemplo: TwwQuery
    Left = 32
    Top = 157
  end
  inherited rpExemplo: TppReport
    Left = 32
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object pplFalecimento: TppBDEPipeline
    DataSource = dtsFalecimento
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lExemplo1'
    Left = 120
    Top = 56
    object pplFalecimentoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTRATOEMPTMO'
      FieldName = 'IDCONTRATOEMPTMO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplFalecimentoppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object pplFalecimentoppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplFalecimentoppField4: TppField
      FieldAlias = 'TCEDESCRICAO'
      FieldName = 'TCEDESCRICAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object pplFalecimentoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCONTRATO'
      FieldName = 'VLRCONTRATO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplFalecimentoppField6: TppField
      FieldAlias = 'DATACREDITO'
      FieldName = 'DATACREDITO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object pplFalecimentoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSALDODEV'
      FieldName = 'VLRSALDODEV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplFalecimentoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'HMEVLRPREVISTO'
      FieldName = 'HMEVLRPREVISTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplFalecimentoppField9: TppField
      FieldAlias = 'HMEDATAPREVISTA'
      FieldName = 'HMEDATAPREVISTA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object pplFalecimentoppField10: TppField
      FieldAlias = 'DATAMORTE'
      FieldName = 'DATAMORTE'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object pplFalecimentoppField11: TppField
      FieldAlias = 'RECEBIDO'
      FieldName = 'RECEBIDO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 10
    end
    object pplFalecimentoppField12: TppField
      FieldAlias = 'DATASOLICITACAO'
      FieldName = 'DATASOLICITACAO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 11
    end
  end
  object dtsFalecimento: TwwDataSource
    DataSet = qryFalecimento
    Left = 120
    Top = 107
  end
  object qryFalecimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO, DEP.MATRICULA, MUT.NOME,'
      '   TCE.TCEDESCRICAO,'
      '   CON.VLRCONTRATO, CON.DATACREDITO,'
      '   SLD.HMEVLRPREVISTO AS VLRSALDODEV,'
      '   HME.HMEVLRPREVISTO, HME.HMEDATAPREVISTA,'
      '   PFI.DATAMORTE,'
      
        '   DECODE(HME.FLGBAIXADO, NULL, '#39'Recebido'#39', '#39#39') AS RECEBIDO, INS' +
        'C.DATAINSC AS "DATASOLICITACAO" '
      ''
      ''
      'FROM '
      '   PESSOA          MUT, '
      '   PESSOAFISICA    PFI, '
      '   HISTMOVEMPTMO   HME, '
      '   CONTRATOEMPTMO  CON, '
      '   DEPENTIT        DEP, '
      '   TIPOCONTREMPTMO TCE, '
      '   TIPOEMPTMO      TEP,'
      '   INSCRICAOEMPTMO INSC, '
      '   ( '
      '   SELECT '
      
        '      HME.IDCONTRATOEMPTMO, HME.HMEVLRPREVISTO, HME.HMESALDODEV,' +
        ' '
      '      HME.HMEDATAPREVISTA, HME.HMEPARCELA, HME.HMENUMPARCELAS '
      '   FROM '
      '      HISTMOVEMPTMO  HME, '
      '      CONTRATOEMPTMO CON, '
      '      ( '
      '      SELECT '
      
        '         ITC.IDTIPOCONTREMPTMO, MAX(ITC.IDITEMEMPTMO) AS IDITEME' +
        'MPTMO '
      '      FROM '
      '         ITEMXTIPOCONTR ITC '
      '      WHERE '
      '             ITC.ITCEVENTO         = 3 '
      '         AND ITC.ITCTRATASALDODEV  = 2 '
      '      GROUP BY '
      '         ITC.IDTIPOCONTREMPTMO '
      '      ) ITE '
      '   WHERE '
      '          NVL(HME.FLGESTORNADO, 0) = 0 '
      '      AND HME.HMETIPOMOV           = 3 '
      '      AND HME.HMEORIGEM            = 8 '
      
        '      AND HME.HMEDATAPREVISTA    BETWEEN TO_DATE('#39'01/03/2005'#39','#39'd' +
        'd/mm/yyyy'#39') AND TO_DATE('#39'31/03/2005'#39','#39'dd/mm/yyyy'#39') '
      '      AND HME.IDITEMEMPTMO         = ITE.IDITEMEMPTMO '
      '      AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '
      '      AND CON.IDTIPOCONTREMPTMO    = ITE.IDTIPOCONTREMPTMO '
      '   ) SLD'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP            = 1'
      '   AND CON.IDPATRO                  IN (91008, 1)'
      '   AND CON.IDPLANOPREV              IN (19, 66, 2)'
      '   AND NVL(HME.FLGESTORNADO, 0)     = 0'
      '   AND (HME.HMECENTRALIZA           = 1 OR HME.HMEDESTACADO = 1)'
      '   AND HME.HMETIPOMOV               = 3'
      '   AND HME.HMEORIGEM                = 8'
      '   AND CON.IDINSCRICAOEMPTMO        = INSC.IDINSCRICAOEMPTMO(+)'
      
        '   AND HME.HMEDATAPREVISTA          BETWEEN TO_DATE('#39'01/03/2005'#39 +
        ','#39'dd/mm/yyyy'#39') AND TO_DATE('#39'31/03/2005'#39','#39'dd/mm/yyyy'#39')'
      '   AND CON.IDCONTRATOEMPTMO         = HME.IDCONTRATOEMPTMO'
      '   AND CON.IDCONTRATOEMPTMO         = SLD.IDCONTRATOEMPTMO'
      '   AND CON.IDBENEF                  = MUT.IDPESSOA'
      '   AND CON.IDBENEF                  = PFI.IDPESSOA'
      '   AND CON.IDBENEF                  = DEP.IDPESSOA'
      '   AND CON.IDPESSOA                 = DEP.IDTITULAR'
      '   AND CON.IDTIPOCONTREMPTMO        = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO             = TEP.IDTIPOEMPTMO'
      '   AND 1 = 2'
      ''
      'ORDER BY'
      '   MUT.NOME')
    ValidateWithMask = True
    Left = 120
    Top = 157
    object qryFalecimentoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryFalecimentoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryFalecimentoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryFalecimentoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryFalecimentoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryFalecimentoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryFalecimentoVLRSALDODEV: TFloatField
      FieldName = 'VLRSALDODEV'
    end
    object qryFalecimentoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryFalecimentoHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryFalecimentoDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
    end
    object qryFalecimentoRECEBIDO: TStringField
      FieldName = 'RECEBIDO'
      Size = 8
    end
    object qryFalecimentoDATASOLICITACAO: TDateTimeField
      FieldName = 'DATASOLICITACAO'
    end
  end
  object rptFalecimento: TppReport
    AutoStop = False
    DataPipeline = pplFalecimento
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Empréstimo - Retenção de IOF'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6615
    PrinterSetup.mmMarginLeft = 13229
    PrinterSetup.mmMarginRight = 13229
    PrinterSetup.mmMarginTop = 6615
    PrinterSetup.mmPaperHeight = 210080
    PrinterSetup.mmPaperWidth = 297128
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
    Left = 120
    Top = 8
    Version = '7.04'
    mmColumnWidth = 270670
    DataPipelineName = 'pplFalecimento'
    object rptContratosAdminSint_CabecalhoRelat: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 65881
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'Shape6'
        Brush.Color = 15263976
        ParentWidth = True
        mmHeight = 8467
        mmLeft = 0
        mmTop = 35719
        mmWidth = 270670
        BandType = 0
      end
      object pplbTitulo: TppLabel
        UserName = 'lbTitulo'
        AutoSize = False
        Caption = 'Quitações por Falecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 54504
        mmTop = 9790
        mmWidth = 161396
        BandType = 0
      end
      object pplbNomeEmpresa: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'lbNomeEmpresa'
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
        mmLeft = 54504
        mmTop = 2910
        mmWidth = 161396
        BandType = 0
      end
      object lblTipoData: TppLabel
        UserName = 'lblTipoData'
        AutoSize = False
        Caption = 'Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 529
        mmTop = 28046
        mmWidth = 17992
        BandType = 0
      end
      object rptRetencaoIOF_lblDataIni: TppLabel
        UserName = 'rptRetencaoIOF_lblDataIni'
        AutoSize = False
        Caption = '99/99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 19844
        mmTop = 28046
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'lbCompetenciaIni2'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 35719
        mmTop = 28046
        mmWidth = 1323
        BandType = 0
      end
      object rptRetencaoIOF_lblDataFim: TppLabel
        UserName = 'rptRetencaoIOF_lblDataFim'
        AutoSize = False
        Caption = '00/00/0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 38100
        mmTop = 28046
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel2: TppLabel
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
        mmLeft = 5821
        mmTop = 40481
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 23548
        mmTop = 40481
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 38629
        mmTop = 40481
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Tipo de Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 107950
        mmTop = 40481
        mmWidth = 19844
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Concessão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 156634
        mmTop = 40481
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Data de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 156634
        mmTop = 37306
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 'Quitação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 183621
        mmTop = 40481
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Data de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 183621
        mmTop = 37306
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Falecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 196850
        mmTop = 40481
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Data de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 197644
        mmTop = 37306
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Valor da'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 211667
        mmTop = 37306
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Concessão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 211667
        mmTop = 40481
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Sld. Dev. na'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 226484
        mmTop = 37306
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Quitação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 226484
        mmTop = 40481
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Valor de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 241300
        mmTop = 37306
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Quitação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 241300
        mmTop = 40481
        mmWidth = 14552
        BandType = 0
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
        mmTop = 49213
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
        mmLeft = 141552
        mmTop = 49213
        mmWidth = 23813
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
        mmTop = 49213
        mmWidth = 108479
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
        mmLeft = 165100
        mmTop = 49213
        mmWidth = 105834
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label5'
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
        mmTop = 53975
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel10: TppLabel
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
        mmLeft = 152665
        mmTop = 53975
        mmWidth = 12700
        BandType = 0
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
        mmTop = 53975
        mmWidth = 110861
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
        mmLeft = 165100
        mmTop = 53975
        mmWidth = 105834
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
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
        mmTop = 61383
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
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
        mmTop = 61383
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Data de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 170127
        mmTop = 37306
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 170127
        mmTop = 40481
        mmWidth = 12965
        BandType = 0
      end
    end
    object ppItensContrato: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 40
      mmHeight = 3969
      mmPrintPosition = 0
      object rptContrato: TppShape
        OnPrint = ppShape1Print
        UserName = 'rptContrato'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ReprintOnOverFlow = True
        StretchWithParent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 270670
        BandType = 4
      end
      object ppLine1: TppLine
        OnPrint = ppLine1Print
        UserName = 'Line1'
        Pen.Style = psClear
        ParentHeight = True
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 270670
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = pplFalecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 38629
        mmTop = 529
        mmWidth = 68792
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplFalecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 1058
        mmTop = 529
        mmWidth = 17727
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'MATRICULA'
        DataPipeline = pplFalecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 22225
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DATAMORTE'
        DataPipeline = pplFalecimento
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 197644
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLRSALDODEV'
        DataPipeline = pplFalecimento
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 226484
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplFalecimento
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 241300
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'DATASOLICITACAO'
        DataPipeline = pplFalecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 156634
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'TCEDESCRICAO'
        DataPipeline = pplFalecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 107950
        mmTop = 529
        mmWidth = 48419
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'HMEDATAPREVISTA'
        DataPipeline = pplFalecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 183621
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'VLRCONTRATO'
        DataPipeline = pplFalecimento
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 211667
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'RECEBIDO'
        DataPipeline = pplFalecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 256117
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DATACREDITO'
        DataPipeline = pplFalecimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 170127
        mmTop = 529
        mmWidth = 12965
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 40
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLine37: TppLine
        UserName = 'ppLine37'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 794
        mmWidth = 270670
        BandType = 8
      end
      object pplbNomeSistema: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'lbNomeSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 3175
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 126471
        mmTop = 3175
        mmWidth = 17463
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 243946
        mmTop = 3175
        mmWidth = 25400
        BandType = 8
      end
    end
    object rptContratosAdminSintSummaryBand1: TppSummaryBand
      mmBottomOffset = 40
      mmHeight = 20638
      mmPrintPosition = 0
      object rptContratosAdminSintLine1: TppLine
        UserName = 'rptContratosAdminSintLine1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 529
        mmLeft = 0
        mmTop = 2646
        mmWidth = 270670
        BandType = 7
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        mmHeight = 5292
        mmLeft = 204788
        mmTop = 6085
        mmWidth = 49742
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Total Geral:   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 187590
        mmTop = 6879
        mmWidth = 17727
        BandType = 7
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        Pen.Width = 2
        mmHeight = 5292
        mmLeft = 5292
        mmTop = 6085
        mmWidth = 27517
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'IDCONTRATOEMPTMO'
        DataPipeline = pplFalecimento
        DisplayFormat = '#,#0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 6350
        mmTop = 7144
        mmWidth = 7673
        BandType = 7
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Contrato(s)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 15346
        mmTop = 7144
        mmWidth = 13494
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'VLRCONTRATO'
        DataPipeline = pplFalecimento
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 206111
        mmTop = 7144
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'VLRSALDODEV'
        DataPipeline = pplFalecimento
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 222515
        mmTop = 7144
        mmWidth = 14552
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'HMEVLRPREVISTO'
        DataPipeline = pplFalecimento
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplFalecimento'
        mmHeight = 2910
        mmLeft = 238655
        mmTop = 7144
        mmWidth = 14552
        BandType = 7
      end
    end
  end
end
