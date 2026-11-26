inherited dtmRelPagtoIndiv: TdtmRelPagtoIndiv
  Left = 260
  Top = 164
  Width = 237
  Height = 269
  Caption = 'dtmRelPagtoIndiv'
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
    Top = 101
  end
  inherited qryExemplo: TwwQuery
    Left = 24
    Top = 147
  end
  inherited rpExemplo: TppReport
    Left = 24
    Top = 12
    DataPipelineName = 'pplExemplo'
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      
        'SELECT P.NOME          , P.RAZAOSOCIAL, E.LOGRADOURO            ' +
        '   ,'
      
        '       E.NUMERO        , E.COMPLEMENTO, E.BAIRRO                ' +
        '   ,'
      
        '       C.NOME AS CIDADE, C.CODESTADO  , E.CEP                   ' +
        '   ,'
      
        '       I.IMAGEM        , (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDER' +
        'ECO,'
      
        '       (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO)    AS BARCI' +
        'DUF           '
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND '
      '      (E.IDPESSOA(+) = P.IDPESSOA) AND'
      '      (E.IDCIDADES   = C.IDCIDADES(+))  AND'
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 164
    Top = 147
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pFundacao'
        ParamType = ptUnknown
      end>
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 164
    Top = 101
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    CloseDataSource = True
    UserName = 'Fundacao'
    Left = 164
    Top = 56
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFundacaoppField11: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 70
      DisplayWidth = 70
      Position = 10
    end
    object ppFundacaoppField12: TppField
      FieldAlias = 'BARCIDUF'
      FieldName = 'BARCIDUF'
      FieldLength = 79
      DisplayWidth = 79
      Position = 11
    end
  end
  object qryPagtoIndiv: TwwQuery
    CachedUpdates = True
    AfterOpen = qryPagtoIndivAfterOpen
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT H.CODPORTFORMA,'
      '       PF.DESCRICAO AS CENTRALIZA,'
      '       P1.NOME AS NOMEPESSJUR,'
      '       P2.NOME AS BENEF,'
      '       P2.NUMDOCUMENTO,'
      '       EL.MATRICULA,'
      '       D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAVENCTO,'
      '       SUM(DECODE(PR.FLGDESCONTO,0,'
      '                  DECODE(PR.FLGESPECIAL,0,H.VALORPROVENTO,0),'
      
        '                  DECODE(PR.FLGESPECIAL,0,H.VALORPROVENTO*-1,0))' +
        ') VALOR'
      
        'FROM HISTRUBSAL H, HSTFOLHABENEFCAP HCAP, PROVDESC PR, ELEGPATRO' +
        ' EL,'
      '     PESSOA P1, PESSOA P2, DOCUMENTO D, PORTADORFORMA PF'
      'WHERE (H.IDHSTFOLHABENEF = :IDFOLHA)'
      'AND (NVL(H.FLGESTORNO,0) = 0)'
      'AND (PR.IDPROVENTO = H.IDRUBRICA)'
      'AND (PR.FLGESPECIAL <> 2)'
      'AND (H.IDHSTFOLHABENEF = HCAP.IDHSTFOLHABENEF)'
      'AND (HCAP.TIPOPORTADOR <> '#39'A'#39')'
      'AND (H.CODPORTFORMA = HCAP.CODPORTFORMA)'
      'AND (H.CODDOCUMENTO = HCAP.CODDOCUMENTO)'
      'AND (PF.CODPORTFORMA = H.CODPORTFORMA)'
      'AND (EL.IDPESSOA = H.IDTITULAR)'
      'AND (EL.IDPESSJUR = H.IDPATRO)'
      'AND (P1.IDPESSOA = H.IDPATRO)'
      'AND (P2.IDPESSOA = H.IDRESPONSAVEL)'
      'AND (H.CODDOCUMENTO = D.CODDOCUMENTO(+))'
      
        'GROUP BY H.CODPORTFORMA, PF.DESCRICAO, P1.NOME, EL.MATRICULA, P2' +
        '.NUMDOCUMENTO,'
      '         P2.NOME,D.NODOCUMENTO, D.COMPLDOCUMENTO, D.DATAVENCTO')
    ValidateWithMask = True
    Left = 95
    Top = 147
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFOLHA'
        ParamType = ptUnknown
        Value = 1607
      end>
  end
  object dsPagtoIndiv: TwwDataSource
    DataSet = qryPagtoIndiv
    Left = 95
    Top = 101
  end
  object ppPagtoIndiv: TppReport
    AutoStop = False
    DataPipeline = plPagtoIndiv
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Pagamentos Individuais'
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 95
    Top = 12
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'plPagtoIndiv'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 40217
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'ppDBImage1'
        MaintainAspectRatio = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 794
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
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
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Relatório de Pagamentos Individuais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 55827
        mmTop = 27517
        mmWidth = 89429
        BandType = 0
      end
      object ppPagtoIndivLine4: TppLine
        UserName = 'ppPagtoIndivLine4'
        Weight = 1
        mmHeight = 1588
        mmLeft = 0
        mmTop = 38629
        mmWidth = 195263
        BandType = 0
      end
      object rpCredBenefAgenLabel10: TppLabel
        UserName = 'rpCredBenefAgenLabel10'
        Caption = 'rpCredBenefAgenLabel10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 33867
        mmWidth = 51858
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText6: TppDBText
        UserName = 'ppDBText6'
        DataField = 'MATRICULA'
        DataPipeline = plPagtoIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plPagtoIndiv'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppPagtoIndivDBText1: TppDBText
        UserName = 'ppPagtoIndivDBText1'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = plPagtoIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plPagtoIndiv'
        mmHeight = 3969
        mmLeft = 19579
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppPagtoIndivDBText2: TppDBText
        UserName = 'ppPagtoIndivDBText2'
        DataField = 'BENEF'
        DataPipeline = plPagtoIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plPagtoIndiv'
        mmHeight = 3969
        mmLeft = 44715
        mmTop = 0
        mmWidth = 72496
        BandType = 4
      end
      object ppPagtoIndivDBText5: TppDBText
        UserName = 'ppPagtoIndivDBText5'
        DataField = 'VALOR'
        DataPipeline = plPagtoIndiv
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plPagtoIndiv'
        mmHeight = 3969
        mmLeft = 166423
        mmTop = 0
        mmWidth = 26988
        BandType = 4
      end
      object ppPagtoIndivDBText6: TppDBText
        UserName = 'ppPagtoIndivDBText6'
        DataField = 'NODOCUMENTO'
        DataPipeline = plPagtoIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plPagtoIndiv'
        mmHeight = 3969
        mmLeft = 119592
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppPagtoIndivDBText7: TppDBText
        UserName = 'ppPagtoIndivDBText7'
        DataField = 'COMPLDOCUMENTO'
        DataPipeline = plPagtoIndiv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plPagtoIndiv'
        mmHeight = 3969
        mmLeft = 137848
        mmTop = 0
        mmWidth = 4763
        BandType = 4
      end
      object ppPagtoIndivDBText8: TppDBText
        UserName = 'ppPagtoIndivDBText8'
        DataField = 'DATAVENCTO'
        DataPipeline = plPagtoIndiv
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Times New Roman'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plPagtoIndiv'
        mmHeight = 3969
        mmLeft = 147638
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppPagtoIndivLabel8: TppLabel
        UserName = 'ppPagtoIndivLabel8'
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 135996
        mmTop = 0
        mmWidth = 1058
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 25929
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel5: TppLabel
        UserName = 'ppLabel5'
        AutoSize = False
        Caption = 'Folha de benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 26458
        mmWidth = 197909
        BandType = 8
      end
      object rpCredBenefAgenLine3: TppLine
        UserName = 'rpCredBenefAgenLine3'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 10054
        mmTop = 12700
        mmWidth = 74877
        BandType = 8
      end
      object lblAssina1: TppLabel
        UserName = 'lblAssina1'
        Caption = 'lblAssina1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 35983
        mmTop = 14023
        mmWidth = 15081
        BandType = 8
      end
      object rpCredBenefAgenLine4: TppLine
        UserName = 'rpCredBenefAgenLine4'
        Weight = 0.75
        mmHeight = 2910
        mmLeft = 116417
        mmTop = 12965
        mmWidth = 74877
        BandType = 8
      end
      object lblAssina2: TppLabel
        UserName = 'lblAssina2'
        Caption = 'lblAssina2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 148167
        mmTop = 14288
        mmWidth = 14023
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
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
        mmTop = 26458
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 26458
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppPagtoIndivGroup1: TppGroup
      BreakName = 'CODPORTFORMA'
      DataPipeline = plPagtoIndiv
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'PagtoIndivGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plPagtoIndiv'
      object ppPagtoIndivGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppPagtoIndivDBText3: TppDBText
          UserName = 'ppPagtoIndivDBText3'
          AutoSize = True
          DataField = 'CENTRALIZA'
          DataPipeline = plPagtoIndiv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'plPagtoIndiv'
          mmHeight = 4233
          mmLeft = 38629
          mmTop = 529
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppPagtoIndivLine2: TppLine
          UserName = 'ppPagtoIndivLine2'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5292
          mmWidth = 195263
          BandType = 3
          GroupNo = 0
        end
        object ppPagtoIndivLabel5: TppLabel
          UserName = 'ppPagtoIndivLabel5'
          Caption = 'Forma de Pagamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 529
          mmWidth = 37571
          BandType = 3
          GroupNo = 0
        end
      end
      object ppPagtoIndivGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppPagtoIndivLabel3: TppLabel
          UserName = 'ppPagtoIndivLabel3'
          Caption = 'Total da Forma de Pagamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 113506
          mmTop = 529
          mmWidth = 52388
          BandType = 5
          GroupNo = 0
        end
        object ppPagtoIndivDBCalc2: TppDBCalc
          UserName = 'ppPagtoIndivDBCalc2'
          DataField = 'VALOR'
          DataPipeline = plPagtoIndiv
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppPagtoIndivGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plPagtoIndiv'
          mmHeight = 4233
          mmLeft = 166159
          mmTop = 529
          mmWidth = 26988
          BandType = 5
          GroupNo = 0
        end
        object ppPagtoIndivLine5: TppLine
          UserName = 'ppPagtoIndivLine5'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5556
          mmWidth = 195263
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOMEPESSJUR'
      DataPipeline = plPagtoIndiv
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'plPagtoIndiv'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppLabel2: TppLabel
          UserName = 'ppLabel2'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 5821
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'ppLabel3'
          Caption = 'CPF / CGC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 20108
          mmTop = 5821
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'ppLabel4'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 183886
          mmTop = 6085
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object ppPagtoIndivLabel1: TppLabel
          UserName = 'ppPagtoIndivLabel1'
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 44979
          mmTop = 5821
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object ppPagtoIndivLine1: TppLine
          UserName = 'ppPagtoIndivLine1'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 10583
          mmWidth = 195263
          BandType = 3
          GroupNo = 0
        end
        object ppPagtoIndivDBText4: TppDBText
          UserName = 'ppPagtoIndivDBText4'
          AutoSize = True
          DataField = 'NOMEPESSJUR'
          DataPipeline = plPagtoIndiv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'plPagtoIndiv'
          mmHeight = 4233
          mmLeft = 25665
          mmTop = 529
          mmWidth = 26988
          BandType = 3
          GroupNo = 1
        end
        object ppPagtoIndivLabel4: TppLabel
          UserName = 'ppPagtoIndivLabel4'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 529
          mmWidth = 24871
          BandType = 3
          GroupNo = 1
        end
        object ppPagtoIndivLabel6: TppLabel
          UserName = 'ppPagtoIndivLabel6'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 119327
          mmTop = 5821
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
        object ppPagtoIndivLabel7: TppLabel
          UserName = 'ppPagtoIndivLabel7'
          Caption = 'Vencto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 147902
          mmTop = 5821
          mmWidth = 11642
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLine3: TppLine
          UserName = 'ppLine3'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 195263
          BandType = 5
          GroupNo = 0
        end
        object ppPagtoIndivLabel2: TppLabel
          UserName = 'ppPagtoIndivLabel2'
          Caption = 'Total da Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 124354
          mmTop = 529
          mmWidth = 41275
          BandType = 5
          GroupNo = 1
        end
        object ppPagtoIndivDBCalc1: TppDBCalc
          UserName = 'ppPagtoIndivDBCalc1'
          DataField = 'VALOR'
          DataPipeline = plPagtoIndiv
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'plPagtoIndiv'
          mmHeight = 4233
          mmLeft = 166423
          mmTop = 529
          mmWidth = 26988
          BandType = 5
          GroupNo = 1
        end
        object ppPagtoIndivLine3: TppLine
          UserName = 'ppPagtoIndivLine3'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5292
          mmWidth = 195263
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object plPagtoIndiv: TppBDEPipeline
    DataSource = dsPagtoIndiv
    SkipWhenNoRecords = False
    UserName = 'plPagtoIndiv'
    Left = 95
    Top = 56
    object plPagtoIndivppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODPORTFORMA'
      FieldName = 'CODPORTFORMA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object plPagtoIndivppField2: TppField
      FieldAlias = 'CENTRALIZA'
      FieldName = 'CENTRALIZA'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object plPagtoIndivppField3: TppField
      FieldAlias = 'NOMEPESSJUR'
      FieldName = 'NOMEPESSJUR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object plPagtoIndivppField4: TppField
      FieldAlias = 'BENEF'
      FieldName = 'BENEF'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object plPagtoIndivppField5: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 4
    end
    object plPagtoIndivppField6: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 5
    end
    object plPagtoIndivppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object plPagtoIndivppField8: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object plPagtoIndivppField9: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object plPagtoIndivppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
end
