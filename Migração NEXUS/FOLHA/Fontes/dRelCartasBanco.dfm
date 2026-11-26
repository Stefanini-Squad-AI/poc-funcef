inherited dtmRelCartasBanco: TdtmRelCartasBanco
  Left = 258
  Top = 196
  Width = 247
  Height = 238
  Caption = 'dtmRelCartasBanco'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 22
    Top = 57
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
    Left = 22
    Top = 108
  end
  inherited qryExemplo: TwwQuery
    Left = 22
    Top = 156
  end
  inherited rpExemplo: TppReport
    Left = 22
    Top = 8
  end
  object rpCartasBanco: TppReport
    AutoStop = False
    DataPipeline = ppCartasBanco
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Cartas Para Banco - Folha de Benefícios'
    PrinterSetup.PaperName = 'A4 (210 x 297 mm)'
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
    BeforePrint = rpCartasBancoBeforePrint
    DeviceType = 'Screen'
    Left = 100
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 138377
      mmPrintPosition = 0
      object ppRichText1: TppRichText
        UserName = 'RichText1'
        Caption = 
          'Clique aqui com o botão direito do mouse e selecione editar e di' +
          'gite o texto da carta'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1046{\fonttbl{\f0\fnil MS S' +
          'ans Serif;}{\f1\fnil\fcharset0 MS Sans Serif;}}'#13#10'\viewkind4\uc1\' +
          'pard\f0\fs16 Clique aqui com o bot\f1\'#39'e3o direito do mouse e se' +
          'lecione editar e digite o texto da carta\f0\par'#13#10'}'#13#10
        mmHeight = 47361
        mmLeft = 5027
        mmTop = 80169
        mmWidth = 183621
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object qrRelResumoRubricaDBText1: TppDBText
        UserName = 'qrRelResumoRubricaDBText1'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object qrRelResumoRubricaDBText7: TppDBText
        UserName = 'qrRelResumoRubricaDBText7'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object qrRelResumoRubricaDBText8: TppDBText
        UserName = 'qrRelResumoRubricaDBText8'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 15875
        BandType = 0
      end
      object qrRelResumoRubricaDBText9: TppDBText
        UserName = 'qrRelResumoRubricaDBText9'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
      object qrRelResumoRubricaDBText2: TppDBText
        UserName = 'qrRelResumoRubricaDBText2'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Rio de Janeiro,'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 38100
        mmWidth = 23813
        BandType = 0
      end
      object ppLblDia: TppLabel
        UserName = 'LblDia'
        Caption = 'LblDia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 28046
        mmTop = 38100
        mmWidth = 10054
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 33602
        mmTop = 38100
        mmWidth = 3969
        BandType = 0
      end
      object ppLblMes: TppLabel
        UserName = 'LblMes'
        Caption = 'LblMes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 38629
        mmTop = 38100
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 57415
        mmTop = 38100
        mmWidth = 3969
        BandType = 0
      end
      object ppLblAno: TppLabel
        UserName = 'LblAno'
        Caption = 'LblAno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 62177
        mmTop = 38100
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Carta Nº:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 54504
        mmWidth = 14552
        BandType = 0
      end
      object ppLblNumCarta: TppLabel
        UserName = 'LblNumCarta'
        Caption = 'NumCarta - Nao exclua este label'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 19315
        mmTop = 54504
        mmWidth = 53446
        BandType = 0
      end
      object ppLabelPotadorForma: TppLabel
        UserName = 'LabelPotadorForma'
        Caption = 'Portador Forma - Não exclua este Label.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 67469
        mmWidth = 64294
        BandType = 0
      end
      object ppDbDataPrev: TppDBText
        UserName = 'DbDataPrev'
        AutoSize = True
        DataField = 'DATAPREVPAGTO'
        DataPipeline = ppCartasBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 84402
        mmTop = 112448
        mmWidth = 31750
        BandType = 0
      end
      object ppLblVersao: TppLabel
        UserName = 'LblVersao'
        Caption = 'VERSÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 6879
        mmTop = 134409
        mmWidth = 14817
        BandType = 0
      end
      object ppLblValorLiq: TppLabel
        UserName = 'LblValorLiq'
        Caption = 'VALOR (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 63765
        mmTop = 134409
        mmWidth = 19844
        BandType = 0
      end
      object ppLblDataPagto: TppLabel
        UserName = 'LblDataPagto'
        Caption = 'DATA PAGTº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 109538
        mmTop = 134409
        mmWidth = 21431
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'QUANT.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 166423
        mmTop = 134409
        mmWidth = 13494
        BandType = 0
      end
      object ppDBImage7: TppDBImage
        UserName = 'ppDBImage7'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Banco:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 44450
        mmWidth = 11113
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'BANCO'
        DataPipeline = ppCartasBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 14817
        mmTop = 44450
        mmWidth = 12700
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'AGENCIA'
        DataPipeline = ppCartasBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17198
        mmTop = 49477
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Agência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 2910
        mmTop = 49477
        mmWidth = 13758
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDbVersao: TppDBText
        UserName = 'DbVersao'
        AutoSize = True
        DataField = 'IDHSTFOLHABENEF'
        DataPipeline = ppCartasBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 6879
        mmTop = 265
        mmWidth = 34396
        BandType = 4
      end
      object ppDbListaDataPrev: TppDBText
        UserName = 'DbListaDataPrev'
        AutoSize = True
        DataField = 'DATAPAGAMENTO'
        DataPipeline = ppCartasBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 109538
        mmTop = 265
        mmWidth = 32279
        BandType = 4
      end
      object ppDbQuant: TppDBText
        UserName = 'DbQuant'
        AutoSize = True
        DataField = 'QTD'
        DataPipeline = ppCartasBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 166423
        mmTop = 265
        mmWidth = 7408
        BandType = 4
      end
      object ppDbValorLiq: TppDBText
        UserName = 'DbValorLiq'
        AutoSize = True
        DataField = 'VALORTOTAL'
        DataPipeline = ppCartasBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 60061
        mmTop = 265
        mmWidth = 23548
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9790
      mmPrintPosition = 0
      object ppLabel174: TppLabel
        UserName = 'ppLabel174'
        AutoSize = False
        Caption = 'Folha de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 2646
        mmWidth = 280194
        BandType = 8
      end
      object ppCalc44: TppSystemVariable
        UserName = 'Calc44'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 89959
        mmTop = 2910
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc43: TppSystemVariable
        UserName = 'Calc43'
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
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
      object ppLine62: TppLine
        UserName = 'ppLine62'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 78317
      mmPrintPosition = 0
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Valor Líquido Total (R$):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 3175
        mmTop = 1323
        mmWidth = 35190
        BandType = 7
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Quantidade Total de Participantes:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 6350
        mmWidth = 50271
        BandType = 7
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VALORLIQUIDO'
        DataPipeline = ppCartasBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 40217
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'QTD'
        DataPipeline = ppCartasBanco
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 55563
        mmTop = 6879
        mmWidth = 17198
        BandType = 7
      end
      object ppRichText2: TppRichText
        UserName = 'RichText2'
        Caption = 'RichText2'
        mmHeight = 47625
        mmLeft = 2646
        mmTop = 12965
        mmWidth = 192088
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
  end
  object ppCartasBanco: TppBDEPipeline
    DataSource = dsCartasBanco
    UserName = 'CartasBanco'
    Left = 100
    Top = 57
  end
  object dsCartasBanco: TwwDataSource
    DataSet = qryCartasBanco
    Left = 100
    Top = 108
  end
  object qryCartasBanco: TwwQuery
    BeforeOpen = qryCartasBancoBeforeOpen
    AfterOpen = qryCartasBancoAfterOpen
    AfterClose = qryCartasBancoAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      BC.NOME AS BANCO,'
      '      AG.NOME AS AGENCIA,'
      '      H.NUMBANCO,'
      '      H.CODPORTFORMA,'
      '      PF.DESCRICAO,'
      '      H.IDHSTFOLHABENEF,'
      '      H.DATAPAGAMENTO,'
      '      COUNT(DISTINCT(PP.INSCRICAONUMERO)) AS QTD,'
      
        '      SUM(DECODE(FLGDESCONTO,  0,  VALORPROVENTO, VALORPROVENTO ' +
        '* -1)) AS VALORTOTAL,'
      
        '      SUM(DECODE(FLGDESCONTO,0,VALORPROVENTO,0.0)) - SUM(DECODE(' +
        'FLGDESCONTO,1,VALORPROVENTO,0.0)) AS VALORLIQUIDO'
      'FROM'
      '      HISTRUBSAL H,'
      '      PESSOA P,'
      '      PARTPREVPLAN PP,'
      '      DEPENTIT DP,'
      '      PROVDESC PD,'
      '      PORTADORFORMA PF,'
      '      PORTADORCONTA PC,'
      '      PESSOA BC,'
      '      PESSOA AG'
      'WHERE P.IDPESSOA = H.IDPESSOA'
      '  AND H.IDTITULAR = PP.IDPESSOA'
      '  AND H.IDPLANOPREV = PP.IDPLANOPREV'
      '  AND H.IDPATRO = PP.IDPESSJUR'
      '  AND H.IDPESSOA = DP.IDPESSOA(+)'
      '  AND H.IDTITULAR = DP.IDTITULAR(+)'
      '  AND H.IDRUBRICA = PD.IDPROVENTO'
      '  AND (H.FLGESTORNO = 0 OR H.FLGESTORNO IS NULL)'
      '  AND IDHSTFOLHABENEF IN (2090)'
      '  AND H.CODPORTFORMA = 12'
      '  AND H.CODPORTFORMA = PF.CODPORTFORMA'
      '  AND PF.CODPORTADOR = PC.CODPORTADOR'
      '  AND PC.IDBANCO = BC.IDPESSOA'
      '  AND PC.IDAGENCIA = AG.IDPESSOA'
      
        'GROUP BY H.DATAPAGAMENTO, H.CODPORTFORMA, H.NUMBANCO, PF.DESCRIC' +
        'AO, H.IDHSTFOLHABENEF, BC.NOME, AG.NOME')
    ValidateWithMask = True
    Left = 100
    Top = 156
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO    ,'
      '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP       , I.IMAGEM, '
      '       (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDERECO   ,'
      '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)'
      ' ')
    ValidateWithMask = True
    Left = 180
    Top = 156
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
        Value = 2002
      end>
    object qryFundacaoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryFundacaoLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qryFundacaoNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qryFundacaoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qryFundacaoBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryFundacaoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object qryFundacaoCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qryFundacaoCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFundacaoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 70
    end
    object qryFundacaoBARCIDUF: TStringField
      FieldName = 'BARCIDUF'
      Size = 79
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 180
    Top = 108
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 180
    Top = 57
  end
end
