inherited dtmRelParamRubricas: TdtmRelParamRubricas
  Left = 235
  Top = 186
  Width = 204
  Height = 228
  Caption = 'dtmRelParamRubricas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 21
    Top = 56
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
    Left = 21
    Top = 104
  end
  inherited qryExemplo: TwwQuery
    Left = 21
    Top = 152
  end
  inherited rpExemplo: TppReport
    Left = 21
    Top = 8
    inherited FooterBand1: TppFooterBand
      inherited Calc1: TppSystemVariable [2]
      end
      inherited Calc2: TppSystemVariable [3]
        mmLeft = 0
        mmTop = 6085
      end
    end
  end
  object qryRelParamRubricas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      '  distinct'
      
        '  DECODE(PRM.FLGUSACODRUBEXT, 0, P.DESCRICAO, P.DESCRPROVDESC) A' +
        'S DESCRICAO,'
      
        '  DECODE(PRM.FLGUSACODRUBEXT, 0, P.IDPROVENTO, P.CODPROVDESC) AS' +
        ' IDRUBRICA,'
      '  r.idpessjur,'
      '  r.idplanoprev,'
      '  p.idprovento,'
      '  R.RECPAG,'
      '  R.TIPCODIGO,'
      
        '  /*-------------------- CONTAS A PAGAR DA FOLHA ---------------' +
        '-------*/'
      '  R.CODTIPRECDES,'
      '  TI1.DESCRICAO AS TIPORECEBFOLHACAP,'
      '  R.CODTIPRECDESFAV,'
      '  TI2.DESCRICAO AS TIPORECEBFAVORECCAP,'
      
        '  /*------------------------------------------------------------' +
        '-------*/'
      
        '  /*-------------------- CONTAS A RECEBER DA FOLHA -------------' +
        '---------*/'
      '  R.CODTIPRECDESCAR,'
      '  TI3.DESCRICAO AS TIPORECEBFOLHACAR,'
      '  R.CODTIPRECDESFAVCAR,'
      '  TI4.DESCRICAO AS TIPORECEBFAVORECCAR,'
      
        '  /*------------------------------------------------------------' +
        '-------*/'
      '  R.CODTIPDOC,'
      '  R.PLANO as PLANOCONTAB,'
      
        '  /*------------------- INFORMAÇÕES GLOBAIS --------------------' +
        '-------*/'
      '  R.UNIDNEGOC AS COD_ATIV_PROJETO,'
      '  UN.NOME AS NOME_ATIV_PROJETO,'
      '  R.CODCENTRORESPON AS COD_CENTRO_DE_RESPONSABILIDADE,'
      '  CE.NOME AS NOM_CENTRO_DE_RESPONSABILIDADE,'
      '  R.CODPORTFORMA AS COD_PORTADORFORMA,'
      '  PO.DESCRICAO AS DESC_PORTADORFORMA,'
      
        '  /*------------------------------------------------------------' +
        '--------*/'
      '  PJ.NOME AS PATRO,'
      '  PP.NOME AS PLANO,'
      
        '  /*---------------------- CONTABILIDADE -----------------------' +
        '--------*/'
      
        '  DECODE(RTRIM(R.PLACONTAC),NULL,R.PLACONTAD,R.PLACONTAC) AS PLA' +
        'CONTA,'
      '  PC.PLANOME AS NOMEPLACONTA,'
      
        '  DECODE(RTRIM(R.CODCENTROCUSTOD),NULL,R.CODCENTROCUSTOC,R.CODCE' +
        'NTROCUSTOD) AS CODCENTROCUSTO,'
      '  CC.NOME AS NOMECCUSTO,'
      '  R.CODSUBCONTA,'
      '  SU.NOMESUBCONTA,'
      '  DECODE(PC.PLANATUREZA,'#39'C'#39','#39'Credito'#39','#39'Debito'#39') as SINAL, '
      
        '  /*------------------------------------------------------------' +
        '---------*/'
      
        '  DECODE(P.FLGDESCONTO, 0, '#39'Provento'#39', 1, '#39'Desconto'#39')AS TPRUBRIC' +
        'A'
      'from'
      '      rubricaxplano r,'
      '      provdesc p,'
      '      pessoa pj,'
      '      planprev pp,'
      '      centrespon ce,'
      '      unidnegocio un,'
      '      portadorforma po,'
      '      CENTCUST CC,'
      '      subconta su,'
      '      PLANOCONTA PC,'
      '      TIPORECEBDESEMB ti1,'
      '      TIPORECEBDESEMB ti2,'
      '      TIPORECEBDESEMB ti3,'
      '      TIPORECEBDESEMB ti4,'
      '      PARAMAPREV PRM'
      'where'
      #9'p.idprovento   = r.idrubrica and'
      '      r.idpessjur    = pj.idpessoa and'
      '      r.idplanoprev  = pp.idplanoprev and'
      '      TRIM(p.flgtprubrica) = '#39'B'#39' and'
      '      ce.codcentrorespon(+) = r.codcentrorespon and'
      '      ce.idpessoa(+) = r.idpessjur and'
      '      un.unidnegoc(+) = r.unidnegoc and'
      '      po.codportforma(+) = r.codportforma and'
      
        '      cc.codcentrocusto(+) = DECODE(RTRIM(R.CODCENTROCUSTOD),NUL' +
        'L,R.CODCENTROCUSTOC,R.CODCENTROCUSTOD) and'
      '      su.codsubconta(+) = r.codsubconta and'
      '      pc.plano(+) = r.plano and'
      
        '      pc.placonta(+) = DECODE(RTRIM(R.PLACONTAC),NULL,R.PLACONTA' +
        'D,R.PLACONTAC) and'
      '      ti1.CODTIPRECDES(+) = r.codtiprecdes and'
      '      ti1.RECPAG(+) = r.recpag and'
      '      ti2.CODTIPRECDES(+) = r.CODTIPRECDESFAV and'
      '      ti2.recpag(+) = r.recpag and'
      '      ti3.CODTIPRECDES(+) = r.CODTIPRECDESCAR and'
      '      ti3.recpag(+) = r.recpag and'
      '      ti4.CODTIPRECDES(+) = r.CODTIPRECDESFAVCAR and'
      '      ti4.recpag(+) = r.recpag'
      ''
      'order by r.idpessjur,r.idplanoprev,p.idprovento')
    ValidateWithMask = True
    Left = 118
    Top = 152
  end
  object ppRelParamRubricas: TppBDEPipeline
    DataSource = DsRelParamRubricas
    UserName = 'RelParamRubricas'
    Left = 118
    Top = 56
  end
  object DsRelParamRubricas: TwwDataSource
    DataSet = qryRelParamRubricas
    Left = 118
    Top = 104
  end
  object RpRelParamRubricas: TppReport
    AutoStop = False
    DataPipeline = ppRelParamRubricas
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Associação Contábil / Financeiro'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 118
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34925
      mmPrintPosition = 0
      object ppDBImage13: TppDBImage
        UserName = 'DBImage102'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmRelFolha.ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 5027
        mmTop = 2910
        mmWidth = 29633
        BandType = 0
      end
      object ppDBText152: TppDBText
        UserName = 'DBText152'
        DataField = 'NOME'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43656
        mmTop = 3175
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 43656
        mmTop = 9790
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'ENDERECO'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43656
        mmTop = 14552
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'BARCIDUF'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43656
        mmTop = 18256
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText139: TppDBText
        UserName = 'DBText139'
        DataField = 'CEP'
        DataPipeline = dtmRelFolha.ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43656
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label7'
        Caption = 'Relatório de Associação Contábil / Financeiro '
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 60061
        mmTop = 30163
        mmWidth = 85461
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 12435
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
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
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel7: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'LblSistema1'
        AutoSize = False
        Caption = 'Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 529
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
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
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDRUBRICA'
      DataPipeline = ppRelParamRubricas
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 92869
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 56621
          mmTop = 3440
          mmWidth = 33867
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'IDRUBRICA'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4763
          mmLeft = 34925
          mmTop = 3440
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Informações Globais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 60590
          mmTop = 10054
          mmWidth = 35190
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Rubrica :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 3440
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 529
          mmTop = 1588
          mmWidth = 196321
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 529
          mmTop = 91811
          mmWidth = 196321
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'TPRUBRICA'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 16933
          mmTop = 3440
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Patrocinadora: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 265
          mmTop = 16404
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'PATRO'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 24871
          mmTop = 16669
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          Transparent = True
          mmHeight = 3969
          mmLeft = 42333
          mmTop = 16404
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 52388
          mmTop = 16669
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          Caption = 'Atividade/Projeto :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 21167
          mmWidth = 31485
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Pen.Style = psDot
          Weight = 0.75
          mmHeight = 265
          mmLeft = 265
          mmTop = 8996
          mmWidth = 196321
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          AutoSize = True
          DataField = 'COD_ATIV_PROJETO'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 33867
          mmTop = 21431
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          AutoSize = True
          DataField = 'NOME_ATIV_PROJETO'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 67733
          mmTop = 21431
          mmWidth = 35454
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Centro de Responsabilidade :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 26194
          mmWidth = 50271
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'COD_CENTRO_DE_RESPONSABILIDADE'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 51858
          mmTop = 26458
          mmWidth = 62442
          BandType = 3
          GroupNo = 0
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          AutoSize = True
          DataField = 'NOM_CENTRO_DE_RESPONSABILIDADE'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 115888
          mmTop = 26458
          mmWidth = 62971
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label101'
          Caption = 'Portador Forma :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 31221
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          AutoSize = True
          DataField = 'COD_PORTADORFORMA'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 30692
          mmTop = 31750
          mmWidth = 38629
          BandType = 3
          GroupNo = 0
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          AutoSize = True
          DataField = 'DESC_PORTADORFORMA'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 70644
          mmTop = 31750
          mmWidth = 40217
          BandType = 3
          GroupNo = 0
        end
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Style = psDot
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 36777
          mmWidth = 196321
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Contabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 65617
          mmTop = 38100
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'PLACONTA'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 35983
          mmTop = 43656
          mmWidth = 36248
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'NOMEPLACONTA'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 73025
          mmTop = 43656
          mmWidth = 121444
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'C.Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 48683
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'CODCENTROCUSTOD'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 15610
          mmTop = 48948
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          DataField = 'NOMECCUSTOD'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 37306
          mmTop = 48948
          mmWidth = 52917
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'SubConta :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 53711
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText23'
          DataField = 'NOMESUBCONTA'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 46567
          mmTop = 53975
          mmWidth = 94192
          BandType = 3
          GroupNo = 0
        end
        object ppDBText24: TppDBText
          UserName = 'DBText24'
          AutoSize = True
          DataField = 'CODSUBCONTA'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 20638
          mmTop = 53975
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppLine7: TppLine
          UserName = 'Line7'
          Pen.Style = psDot
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 59002
          mmWidth = 196321
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Contas a Pagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 65088
          mmTop = 60061
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = ' Tipo de Desembolso para desconto no Contas a Pagar da Folha :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 65617
          mmWidth = 111390
          BandType = 3
          GroupNo = 0
        end
        object ppDBText25: TppDBText
          UserName = 'DBText25'
          DataField = 'CODTIPRECDES'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 112448
          mmTop = 65881
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppDBText26: TppDBText
          UserName = 'DBText202'
          DataField = 'TIPORECEBFOLHACAP'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 128323
          mmTop = 65881
          mmWidth = 67998
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = ' Tipo de Desembolso para Contas a Pagar do Favorecido :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 70644
          mmWidth = 98954
          BandType = 3
          GroupNo = 0
        end
        object ppDBText27: TppDBText
          UserName = 'DBText27'
          DataField = 'CODTIPRECDESFAV'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 100542
          mmTop = 70908
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppDBText28: TppDBText
          UserName = 'DBText28'
          DataField = 'TIPORECEBFAVORECCAP'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 117475
          mmTop = 70908
          mmWidth = 78581
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Contas a Receber'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 65617
          mmTop = 76729
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Pen.Style = psDot
          Weight = 0.75
          mmHeight = 265
          mmLeft = 529
          mmTop = 75671
          mmWidth = 196321
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Tipo de Recebimento para Devolução na Folha :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 81756
          mmWidth = 81492
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label201'
          Caption = 'Tipo de Recebimento para o Favorecido (Estorno de Pagamento) :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 86784
          mmWidth = 112184
          BandType = 3
          GroupNo = 0
        end
        object ppDBText29: TppDBText
          UserName = 'DBText29'
          DataField = 'CODTIPRECDESCAR'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 84667
          mmTop = 81756
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppDBText30: TppDBText
          UserName = 'DBText30'
          DataField = 'CODTIPRECDESFAVCAR'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 114036
          mmTop = 87048
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object ppDBText31: TppDBText
          UserName = 'DBText31'
          DataField = 'TIPORECEBFOLHACAR'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 101071
          mmTop = 81756
          mmWidth = 94721
          BandType = 3
          GroupNo = 0
        end
        object ppDBText32: TppDBText
          UserName = 'DBText32'
          DataField = 'TIPORECEBFAVORECCAR'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 130440
          mmTop = 87048
          mmWidth = 65352
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Conta :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 43392
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'SINAL'
          DataPipeline = ppRelParamRubricas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 14552
          mmTop = 43656
          mmWidth = 20373
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
    object ppGroup2: TppGroup
      BreakName = 'PATRO'
      DataPipeline = ppRelParamRubricas
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
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
end
