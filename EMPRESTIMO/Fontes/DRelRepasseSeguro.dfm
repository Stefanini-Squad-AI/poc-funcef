inherited dtmRelRepasseSeguro: TdtmRelRepasseSeguro
  Left = 328
  Top = 222
  Width = 223
  Height = 166
  Caption = 'dtmRelRepasseSeguro'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 48
    Top = 64
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
    Left = 48
    Top = 76
  end
  inherited qryExemplo: TwwQuery
    Left = 48
    Top = 88
  end
  inherited rpExemplo: TppReport
    Left = 48
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object qryRepasse: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO, MUT.NOME,'
      '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA,'
      '   TCE.TCEDESCRICAO,'
      '   SOL.HMEVLRPREVISTO AS VLRCONTRATO, CON.DATACREDITO,'
      '   HME.HMEVLRPREVISTO, HME.HMEDATAPREVISTA,'
      '   PFI.DATAMORTE, CXB.VLRREPASSE, CXB.VLRSALDOREC,'
      '   (HME.HMEVLRPREVISTO + CXB.VLRSALDOREC) AS VLR_ATUALIZADO,'
      '   CXB.PERCINDENIZACAO,'
      '   MUT.NOME AS NOME_MUTUARIO,'
      '   CXB.NUMBANCO, CXB.CODAGENCIA, CXB.CONTACORRENTE, CXB.OBS,'
      '   CXB.NOME AS NIME_BENEF'
      'FROM'
      '   PESSOA            MUT, '
      '   PESSOAFISICA      PFI, '
      '   HISTMOVEMPTMO     HME, '
      '   CONTRATOEMPTMO    CON, '
      '   ELEGPATRO         ELP, '
      '   DEPENTIT          DEP, '
      '   TIPOCONTREMPTMO   TCE, '
      '   TIPOEMPTMO        TEP, '
      '   CONTRATOXBENEFSEG CXB, '
      '   ( '
      '   SELECT '
      
        '      HME.IDCONTRATOEMPTMO, SUM(HME.HMEVLRPREVISTO) AS HMEVLRPRE' +
        'VISTO '
      '   FROM '
      '      HISTMOVEMPTMO  HME, '
      '      CONTRATOEMPTMO CON, '
      '      ITEMXTIPOCONTR ITC '
      '   WHERE '
      '          HME.HMETIPOMOV           = 0 '
      '      AND NVL(HME.FLGESTORNADO, 0) = 0 '
      '      AND ITC.ITCEVENTO            = 0 '
      '      AND ITC.ITCTRATASALDODEV     = 2 '
      '      AND ITC.ITCSEQCALCULO        = ( '
      '                                     SELECT '
      '                                        MIN(ITE.ITCSEQCALCULO) '
      '                                     FROM'
      '                                        ITEMXTIPOCONTR ITE '
      '                                     WHERE '
      
        '                                            ITE.ITCEVENTO       ' +
        '  = 0 '
      
        '                                        AND ITE.IDTIPOCONTREMPTM' +
        'O = CON.IDTIPOCONTREMPTMO '
      '                                     ) '
      '      AND HME.IDCONTRATOEMPTMO     = CON.IDCONTRATOEMPTMO '
      '      AND HME.IDITEMEMPTMO         = ITC.IDITEMEMPTMO '
      '      AND CON.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO '
      '   GROUP BY'
      '      HME.IDCONTRATOEMPTMO'
      '   ) SOL'
      'WHERE'
      '       TEP.IDEMPRESAPROP           = 1'
      ''
      '   AND 1 = 2'
      ''
      '   AND CON.IDPATRO                 IN (91008, 1)'
      '   AND CON.IDPLANOPREV             IN (19, 66, 2)'
      '   AND NVL(HME.FLGESTORNADO, 0)    = 0'
      '   AND (HME.HMECENTRALIZA          = 1 OR HME.HMEDESTACADO = 1)'
      '   AND HME.HMETIPOMOV              = 3'
      '   AND HME.HMEORIGEM               = 8'
      
        '   AND HME.HMEDATAPREVISTA         BETWEEN TO_DATE('#39'13/04/2005'#39',' +
        #39'dd/mm/yyyy'#39') AND TO_DATE('#39'13/04/2005'#39','#39'dd/mm/yyyy'#39')'
      '   AND CON.IDCONTRATOEMPTMO        = HME.IDCONTRATOEMPTMO'
      '   AND CON.IDBENEF                 = MUT.IDPESSOA'
      '   AND CON.IDBENEF                 = PFI.IDPESSOA'
      '   AND CON.IDBENEF                 = DEP.IDPESSOA'
      '   AND CON.IDPESSOA                = DEP.IDTITULAR '
      '   AND CON.IDPESSOA                = ELP.IDPESSOA '
      '   AND CON.IDPATRO                 = ELP.IDPESSJUR '
      '   AND CON.IDTIPOCONTREMPTMO       = TCE.IDTIPOCONTREMPTMO '
      '   AND TCE.IDTIPOEMPTMO            = TEP.IDTIPOEMPTMO '
      '   AND CON.IDINSCRICAOEMPTMO       = CXB.IDINSCRICAOEMPTMO '
      '   AND CON.IDCONTRATOEMPTMO        = SOL.IDCONTRATOEMPTMO '
      'ORDER BY '
      '   MUT.NOME, CON.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 136
    Top = 64
    object qryRepasseIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryRepasseMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryRepasseNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryRepasseTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryRepasseVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryRepasseDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryRepasseHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryRepasseHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryRepasseDATAMORTE: TDateTimeField
      FieldName = 'DATAMORTE'
    end
    object qryRepasseVLRREPASSE: TFloatField
      FieldName = 'VLRREPASSE'
    end
    object qryRepasseVLRSALDOREC: TFloatField
      FieldName = 'VLRSALDOREC'
    end
    object qryRepasseNOME_MUTUARIO: TStringField
      FieldName = 'NOME_MUTUARIO'
      Size = 60
    end
    object qryRepasseNUMBANCO: TFloatField
      FieldName = 'NUMBANCO'
    end
    object qryRepasseCODAGENCIA: TStringField
      FieldName = 'CODAGENCIA'
      Size = 10
    end
    object qryRepasseCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 10
    end
    object qryRepasseOBS: TStringField
      FieldName = 'OBS'
      Size = 200
    end
    object qryRepasseNIME_BENEF: TStringField
      FieldName = 'NIME_BENEF'
      Size = 60
    end
    object qryRepasseVLR_ATUALIZADO: TFloatField
      FieldName = 'VLR_ATUALIZADO'
    end
    object qryRepassePERCINDENIZACAO: TFloatField
      FieldName = 'PERCINDENIZACAO'
    end
  end
  object dsRepasse: TwwDataSource
    DataSet = qryRepasse
    Left = 136
    Top = 76
  end
  object pplRepasse: TppBDEPipeline
    DataSource = dsRepasse
    CloseDataSource = True
    UserName = 'lExemplo1'
    Left = 136
    Top = 88
  end
  object rptRepasse: TppReport
    AutoStop = False
    DataPipeline = pplRepasse
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
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
    Left = 136
    Top = 8
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRepasse'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 35454
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Repasse de Seguro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 29633
        mmTop = 8467
        mmWidth = 137848
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
        mmLeft = 29633
        mmTop = 1323
        mmWidth = 137848
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
        mmTop = 18785
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
        mmLeft = 102129
        mmTop = 18785
        mmWidth = 23813
        BandType = 0
      end
      object lblTipoEmptmo: TppLabel
        UserName = 'lblTipoEmptmo'
        AutoSize = False
        Caption = 'lblTipoEmptmo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 28310
        mmTop = 18785
        mmWidth = 71438
        BandType = 0
      end
      object lblTipoContr: TppLabel
        UserName = 'lblTipoContr'
        AutoSize = False
        Caption = 'lblTipoContr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 125677
        mmTop = 18785
        mmWidth = 71967
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
        mmTop = 23548
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
        mmLeft = 113242
        mmTop = 23548
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
        mmTop = 23548
        mmWidth = 73819
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
        mmLeft = 125677
        mmTop = 23548
        mmWidth = 71967
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
        mmTop = 30956
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
        mmTop = 30956
        mmWidth = 283898
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'NIME_BENEF'
        DataPipeline = pplRepasse
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRepasse'
        mmHeight = 3704
        mmLeft = 62706
        mmTop = 265
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLRREPASSE'
        DataPipeline = pplRepasse
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRepasse'
        mmHeight = 3704
        mmLeft = 179917
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label1'
        Caption = ' % = '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 172773
        mmTop = 265
        mmWidth = 7408
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        AutoSize = True
        DataField = 'PERCINDENIZACAO'
        DataPipeline = pplRepasse
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplRepasse'
        mmHeight = 3704
        mmLeft = 142346
        mmTop = 265
        mmWidth = 30692
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
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
        mmTop = 1058
        mmWidth = 46567
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
        mmLeft = 55563
        mmTop = 1058
        mmWidth = 86254
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
        mmLeft = 170921
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = pplRepasse
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplRepasse'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 57415
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          ParentWidth = True
          Shape = stRoundRect
          mmHeight = 19315
          mmLeft = 0
          mmTop = 25665
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          ParentWidth = True
          Shape = stRoundRect
          mmHeight = 23813
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 62706
          mmTop = 53446
          mmWidth = 134673
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'MATRICULA'
          DataPipeline = pplRepasse
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRepasse'
          mmHeight = 4233
          mmLeft = 23813
          mmTop = 2381
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'NOME_MUTUARIO'
          DataPipeline = pplRepasse
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRepasse'
          mmHeight = 4233
          mmLeft = 23813
          mmTop = 12435
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'VLRCONTRATO'
          DataPipeline = pplRepasse
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepasse'
          mmHeight = 3969
          mmLeft = 176213
          mmTop = 28310
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'HMEVLRPREVISTO'
          DataPipeline = pplRepasse
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepasse'
          mmHeight = 3969
          mmLeft = 176213
          mmTop = 33338
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'VLR_ATUALIZADO'
          DataPipeline = pplRepasse
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepasse'
          mmHeight = 3969
          mmLeft = 176213
          mmTop = 38365
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Repasse Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 166952
          mmTop = 53181
          mmWidth = 30163
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          AutoSize = True
          DataField = 'IDCONTRATOEMPTMO'
          DataPipeline = pplRepasse
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplRepasse'
          mmHeight = 4233
          mmLeft = 23813
          mmTop = 7408
          mmWidth = 39423
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          AutoSize = True
          DataField = 'HMEDATAPREVISTA'
          DataPipeline = pplRepasse
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRepasse'
          mmHeight = 3969
          mmLeft = 36248
          mmTop = 38365
          mmWidth = 34925
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'DATACREDITO'
          DataPipeline = pplRepasse
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRepasse'
          mmHeight = 3969
          mmLeft = 36248
          mmTop = 28310
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'DATAMORTE'
          DataPipeline = pplRepasse
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRepasse'
          mmHeight = 3969
          mmLeft = 36248
          mmTop = 33338
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 62706
          mmTop = 53181
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'TCEDESCRICAO'
          DataPipeline = pplRepasse
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplRepasse'
          mmHeight = 3969
          mmLeft = 23813
          mmTop = 17463
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Nº Contrato:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 7408
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Matrícula:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 5292
          mmTop = 2381
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Mutuário:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 6085
          mmTop = 12435
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'Tipo Contr.:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 2381
          mmTop = 17463
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Data de Concessão:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 28310
          mmWidth = 34925
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Data do Óbito:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 10583
          mmTop = 33338
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Data deQuitação:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 5821
          mmTop = 38365
          mmWidth = 30692
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label101'
          Caption = 'Valor Atualizado:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 146579
          mmTop = 33338
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Valor de Concessão:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 140759
          mmTop = 28310
          mmWidth = 35719
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          Caption = 'Vlr. Repasse Fundação:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 135467
          mmTop = 38365
          mmWidth = 41010
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentHeight = True
          ParentWidth = True
          Position = lpBottom
          Weight = 0.75
          mmHeight = 9260
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRREPASSE'
          DataPipeline = pplRepasse
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplRepasse'
          mmHeight = 3969
          mmLeft = 179917
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Weight = 0.75
          mmHeight = 5556
          mmLeft = 62706
          mmTop = 0
          mmWidth = 134673
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
