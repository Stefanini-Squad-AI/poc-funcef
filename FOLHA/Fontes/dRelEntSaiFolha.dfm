inherited dtmRelEntSaiFolha: TdtmRelEntSaiFolha
  Left = 394
  Top = 167
  Width = 358
  Height = 245
  Caption = 'dtmRelEntSaiFolha'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 20
    Top = 61
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
    Left = 20
    Top = 112
  end
  inherited qryExemplo: TwwQuery
    Left = 20
    Top = 164
  end
  inherited rpExemplo: TppReport
    Left = 20
    Top = 8
  end
  object ppRelaEntSaiFolha: TppBDEPipeline
    DataSource = dsRelaEntSaiFolha
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'RelaEntSaiFolha'
    Left = 110
    Top = 61
  end
  object dsRelaEntSaiFolha: TwwDataSource
    DataSet = qryEntrada
    Left = 110
    Top = 112
  end
  object qryEntrada: TwwQuery
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT DISTINCT'
      '  H1.IDRESPONSAVEL,'
      '  E.MATRICULA,'
      '  P.INSCRICAONUMERO,'
      '  BENEF.NOME,'
      '  BC.DATAINICIO,'
      '  BC.DATAFINAL,'
      '  BC.DATAFINALPREVISTA,'
      '  HB.IDBENEFICIO,'
      '  B.NOME AS BENEFICIO,'
      '  PP.NOME AS PLANO,'
      
        '  SUM(DECODE(PD.FLGESPECIAL,0,DECODE(PD.FLGDESCONTO, 0, H1.VALOR' +
        'PROVENTO),0)) AS BRUTO,'
      
        '  SUM(DECODE(PD.FLGESPECIAL,0,DECODE(PD.FLGDESCONTO, 0, H1.VALOR' +
        'PROVENTO,'
      
        '                                                     1, (-1)*H1.' +
        'VALORPROVENTO),0)) AS LIQUIDO'
      ''
      'FROM'
      
        '  HISTRUBSAL H1,     ELEGPATRO E,         PARTPREVPLAN P,   PESS' +
        'OA BENEF,'
      
        '  PROVDESC PD,       HSTBENEFBFCIARIO HB, BENEFBFCIARIO BC, BENE' +
        'FICIO B,'
      '  BENEFPLANPREV BPP, PLANPREV PP'
      ''
      'WHERE'
      '  1                  = 2                  AND'
      '  H1.IDHSTFOLHABENEF = 359                AND'
      '  H1.IDTITULAR       = E.IDPESSOA         AND'
      '  H1.IDPATRO         = E.IDPESSJUR        AND'
      '  H1.IDTITULAR       = P.IDPESSOA         AND'
      '  H1.IDPATRO         = P.IDPESSJUR        AND'
      '  H1.IDPLANOPREV     = P.IDPLANOPREV      AND'
      '  H1.IDRESPONSAVEL   = BENEF.IDPESSOA     AND'
      '  H1.IDRUBRICA       = PD.IDPROVENTO      AND'
      '  H1.IDTITULAR       = HB.IDTITULAR       AND'
      '  H1.IDPESSOA        = HB.IDPESSOA        AND'
      '  H1.IDPATRO         = HB.IDPESSJUR       AND'
      '  H1.IDPLANOPREV     = HB.IDPLANOPREV     AND'
      '  H1.IDHSTFOLHABENEF = HB.IDHSTFOLHABENEF AND'
      '  B.TIPOBENEFICIO  < 99 AND'
      '  HB.IDBENEFICIO     = B.IDBENEFICIO      AND'
      '  HB.IDBENEFICIO     = BPP.IDBENEFICIO    AND'
      '  HB.IDPLANOPREV     = BPP.IDPLANOPREV    AND'
      '  HB.IDTITULAR       = BC.IDTITULAR       AND'
      '  HB.IDPESSOA        = BC.IDPESSOA        AND'
      '  HB.IDPESSJUR       = BC.IDPESSJUR       AND'
      '  HB.IDPLANOPREV     = BC.IDPLANOPREV     AND'
      '  HB.NUMEROPROCESSO  = BC.NUMEROPROCESSO  AND'
      '  HB.SEQPROPOSTA     = BC.SEQPROPOSTA     AND'
      '  HB.IDPLANOORIGEM   = BC.IDPLANOORIGEM   AND'
      '  HB.IDBENEFICIO     = BC.IDBENEFICIO     AND'
      '  NOT EXISTS (SELECT'
      '                IDRESPONSAVEL'
      '              FROM'
      '                HISTRUBSAL H2'
      '              WHERE'
      '                H2.IDTITULAR       = H1.IDTITULAR AND'
      '                H2.IDRESPONSAVEL   = H1.IDRESPONSAVEL AND'
      '                H2.IDHSTFOLHABENEF = 345)'
      'GROUP BY'
      '  H1.IDRESPONSAVEL,'
      '  E.MATRICULA,'
      '  P.INSCRICAONUMERO,'
      '  BENEF.NOME,'
      '  BC.DATAINICIO,'
      '  BC.DATAFINAL,'
      '  BC.DATAFINALPREVISTA,'
      '  HB.IDBENEFICIO,'
      '  B.NOME,'
      '  PP.NOME'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 110
    Top = 164
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
      '      (I.IDIMAGEM(+) = P.IDIMAGEM)')
    ValidateWithMask = True
    Left = 208
    Top = 164
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
    Left = 208
    Top = 112
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 208
    Top = 61
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
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
  object qrySaida: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  H1.IDRESPONSAVEL,'
      '  E.MATRICULA,'
      '  P.INSCRICAONUMERO,'
      '  BENEF.NOME,'
      '  BC.DATAINICIO,'
      '  BC.DATAFINAL,'
      '  BC.DATAFINALPREVISTA,'
      '  HB.IDBENEFICIO,'
      '  B.NOME AS BENEFICIO,'
      '  PP.NOME AS PLANO,'
      
        '  SUM(DECODE(PD.FLGESPECIAL,0,DECODE(PD.FLGDESCONTO, 0, H1.VALOR' +
        'PROVENTO),0)) AS BRUTO,'
      
        '  SUM(DECODE(PD.FLGESPECIAL,0,DECODE(PD.FLGDESCONTO, 0, H1.VALOR' +
        'PROVENTO,'
      
        '                                                     1, (-1)*H1.' +
        'VALORPROVENTO),0)) AS LIQUIDO'
      'FROM'
      
        '  HISTRUBSAL H1,     ELEGPATRO E,         PARTPREVPLAN P,   PESS' +
        'OA BENEF,'
      
        '  PROVDESC PD,       HSTBENEFBFCIARIO HB, BENEFBFCIARIO BC, BENE' +
        'FICIO B,'
      '  BENEFPLANPREV BPP, PLANPREV PP'
      'WHERE'
      '  1                  = 2                  AND'
      '  H1.IDHSTFOLHABENEF = 359                AND'
      '  H1.IDTITULAR       = E.IDPESSOA         AND'
      '  H1.IDPATRO         = E.IDPESSJUR        AND'
      '  H1.IDTITULAR       = P.IDPESSOA         AND'
      '  H1.IDPATRO         = P.IDPESSJUR        AND'
      '  H1.IDPLANOPREV     = P.IDPLANOPREV      AND'
      '  H1.IDRESPONSAVEL   = BENEF.IDPESSOA     AND'
      '  H1.IDRUBRICA       = PD.IDPROVENTO      AND'
      '  H1.IDTITULAR       = HB.IDTITULAR       AND'
      '  H1.IDPESSOA        = HB.IDPESSOA        AND'
      '  H1.IDPATRO         = HB.IDPESSJUR       AND'
      '  H1.IDPLANOPREV     = HB.IDPLANOPREV     AND'
      '  H1.IDHSTFOLHABENEF = HB.IDHSTFOLHABENEF AND'
      '  B.TIPOBENEFICIO  < 99 AND'
      '  HB.IDBENEFICIO     = B.IDBENEFICIO      AND'
      '  HB.IDBENEFICIO     = BPP.IDBENEFICIO    AND'
      '  HB.IDPLANOPREV     = BPP.IDPLANOPREV    AND'
      '  HB.IDTITULAR       = BC.IDTITULAR       AND'
      '  HB.IDPESSOA        = BC.IDPESSOA        AND'
      '  HB.IDPESSJUR       = BC.IDPESSJUR       AND'
      '  HB.IDPLANOPREV     = BC.IDPLANOPREV     AND'
      '  HB.NUMEROPROCESSO  = BC.NUMEROPROCESSO  AND'
      '  HB.SEQPROPOSTA     = BC.SEQPROPOSTA     AND'
      '  HB.IDPLANOORIGEM   = BC.IDPLANOORIGEM   AND'
      '  HB.IDBENEFICIO     = BC.IDBENEFICIO     AND'
      '  NOT EXISTS (SELECT'
      '                IDRESPONSAVEL'
      '              FROM'
      '                HISTRUBSAL H2'
      '              WHERE'
      '                H2.IDTITULAR       = H1.IDTITULAR AND'
      '                H2.IDRESPONSAVEL   = H1.IDRESPONSAVEL AND'
      '                H2.IDHSTFOLHABENEF = 345)'
      'GROUP BY'
      '  H1.IDRESPONSAVEL,'
      '  E.MATRICULA,'
      '  P.INSCRICAONUMERO,'
      '  BENEF.NOME,'
      '  BC.DATAINICIO,'
      '  BC.DATAFINAL,'
      '  BC.DATAFINALPREVISTA,'
      '  HB.IDBENEFICIO,'
      '  B.NOME,'
      '  PP.NOME'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 288
    Top = 164
  end
  object ppSaida: TppBDEPipeline
    DataSource = dsSaida
    CloseDataSource = True
    UserName = 'Saida'
    Left = 288
    Top = 61
  end
  object dsSaida: TwwDataSource
    DataSet = qrySaida
    Left = 288
    Top = 112
  end
  object rpRelaEntSaiFolha: TppReport
    AutoStop = False
    DataPipeline = ppRelaEntSaiFolha
    OnStartPage = rpRelaEntSaiFolhaStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Entrada e Saída de Benefícios'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpRelaEntSaiFolhaBeforePrint
    DeviceType = 'Screen'
    Left = 110
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 44715
      mmPrintPosition = 0
      object rpRelaEntSaiFolhaDBText1: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText1'
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
        mmLeft = 36513
        mmTop = 1058
        mmWidth = 153988
        BandType = 0
      end
      object rpRelaEntSaiFolhaDBText7: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText7'
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
        mmLeft = 36513
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
      object rpRelaEntSaiFolhaDBText8: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText8'
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
        mmLeft = 36513
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object rpRelaEntSaiFolhaDBText9: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText9'
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
        mmLeft = 36513
        mmTop = 12171
        mmWidth = 15875
        BandType = 0
      end
      object rpRelaEntSaiFolhaDBText10: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText10'
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
        mmLeft = 36513
        mmTop = 16140
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'ppLabel21'
        AutoSize = False
        Caption = 'Relatório de Entradas/Saídas da Folha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 529
        mmTop = 26458
        mmWidth = 283369
        BandType = 0
      end
      object ppDBImage7: TppDBImage
        UserName = 'ppDBImage7'
        MaintainAspectRatio = False
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 25135
        mmLeft = 1058
        mmTop = 794
        mmWidth = 34396
        BandType = 0
      end
      object pplblMesVersaoEnt: TppLabel
        UserName = 'lblMesVersaoEnt'
        Caption = 'ANO/MES Base:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 5027
        mmTop = 33867
        mmWidth = 26988
        BandType = 0
      end
      object pplblMostraMesVersaoEnt: TppLabel
        UserName = 'lblMostraMesVersaoEnt'
        Caption = 'lblMostraMesVersaoEnt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 33602
        mmTop = 33867
        mmWidth = 39952
        BandType = 0
      end
      object pplblMesVersaoSai: TppLabel
        UserName = 'lblMesVersaoEnt1'
        Caption = 'ANO/MES de Pagamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 103188
        mmTop = 33867
        mmWidth = 42598
        BandType = 0
      end
      object pplblMostraMesVersaoSai: TppLabel
        UserName = 'lblMostraMesVersaoSai'
        Caption = 'lblMostraMesVersaoSai'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 147109
        mmTop = 33867
        mmWidth = 39688
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object shpDetPrincipal: TppShape
        OnPrint = shpDetPrincipalPrint
        UserName = 'shpDetPrincipal'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object rpRelaEntSaiFolhaDBText4: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText4'
        DataField = 'NOME'
        DataPipeline = ppRelaEntSaiFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 41804
        mmTop = 0
        mmWidth = 55033
        BandType = 4
      end
      object rpRelaEntSaiFolhaDBText6: TppDBText
        UserName = 'rpRelaEntSaiFolhaDBText6'
        DataField = 'BRUTO'
        DataPipeline = ppRelaEntSaiFolha
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 156369
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText1'
        DataField = 'MATRICULA'
        DataPipeline = ppRelaEntSaiFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3703
        mmLeft = 265
        mmTop = 0
        mmWidth = 18256
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppRelaEntSaiFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3703
        mmLeft = 20902
        mmTop = 0
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText132: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAINICIO'
        DataPipeline = ppRelaEntSaiFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 206375
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText133: TppDBText
        UserName = 'DBText133'
        DataField = 'DATAFINAL'
        DataPipeline = ppRelaEntSaiFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 227542
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText3'
        DataField = 'LIQUIDO'
        DataPipeline = ppRelaEntSaiFolha
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 179388
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAFINALPREVISTA'
        DataPipeline = ppRelaEntSaiFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 250032
        mmTop = 0
        mmWidth = 25665
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PLANO'
        DataPipeline = ppRelaEntSaiFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 101071
        mmTop = 0
        mmWidth = 51065
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object rpRelaEntSaiFolhaLabel2: TppLabel
        UserName = 'rpRelaEntSaiFolhaLabel2'
        AutoSize = False
        Caption = 'Folha de Benefícios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1588
        mmWidth = 283369
        BandType = 8
      end
      object rpRelaEntSaiFolhaLine2: TppLine
        UserName = 'rpRelaEntSaiFolhaLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 794
        mmWidth = 284300
        BandType = 8
      end
      object rpRelaEntSaiFolhaCalc1: TppSystemVariable
        UserName = 'rpRelaEntSaiFolhaCalc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 1588
        mmWidth = 283369
        BandType = 8
      end
      object rpRelaEntSaiFolhaCalc2: TppSystemVariable
        UserName = 'rpRelaEntSaiFolhaCalc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257705
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpRelaEntSaiFolhaSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object pplblMostraZeroEntrada: TppLabel
        UserName = 'Label1'
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 148432
        mmTop = 1058
        mmWidth = 1852
        BandType = 7
      end
      object rpRelaEntSaiFolhaSubReport1: TppSubReport
        UserName = 'rpRelaEntSaiFolhaSubReport1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 13229
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpRelaEntSaiFolhaChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppSaida
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Relatório de Entrada e Saída de Benefícios'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Units = utScreenPixels
          Version = '5.5'
          mmColumnWidth = 0
          object rpRelaEntSaiFolhaChildReport1TitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object rpRelaEntSaiFolhaChildReport1DetailBand1: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3704
            mmPrintPosition = 0
            object shpDetSubRel: TppShape
              OnPrint = shpDetPrincipalPrint
              UserName = 'shpDetSubRel'
              ParentHeight = True
              ParentWidth = True
              Pen.Style = psClear
              mmHeight = 3704
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 4
            end
            object rpRelaEntSaiFolhaChildReport1DBText2: TppDBText
              UserName = 'rpRelaEntSaiFolhaChildReport1DBText2'
              DataField = 'NOME'
              DataPipeline = ppSaida
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 41010
              mmTop = 0
              mmWidth = 58473
              BandType = 4
            end
            object rpRelaEntSaiFolhaChildReport1DBText3: TppDBText
              UserName = 'rpRelaEntSaiFolhaChildReport1DBText3'
              DataField = 'BRUTO'
              DataPipeline = ppSaida
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 156369
              mmTop = 0
              mmWidth = 19315
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              DataField = 'MATRICULA'
              DataPipeline = ppSaida
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 265
              mmTop = 0
              mmWidth = 18256
              BandType = 4
            end
            object ppDBText36: TppDBText
              UserName = 'DBText36'
              DataField = 'INSCRICAONUMERO'
              DataPipeline = ppSaida
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 20902
              mmTop = 0
              mmWidth = 16404
              BandType = 4
            end
            object ppDBText2: TppDBText
              UserName = 'DBText1'
              DataField = 'LIQUIDO'
              DataPipeline = ppSaida
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 179388
              mmTop = 0
              mmWidth = 23019
              BandType = 4
            end
            object ppDBText3: TppDBText
              UserName = 'DBText2'
              DataField = 'DATAINICIO'
              DataPipeline = ppSaida
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 206375
              mmTop = 0
              mmWidth = 17992
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'DATAFINAL'
              DataPipeline = ppSaida
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 227807
              mmTop = 0
              mmWidth = 17992
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'DATAFINALPREVISTA'
              DataPipeline = ppSaida
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 250032
              mmTop = 0
              mmWidth = 25665
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'PLANO'
              DataPipeline = ppSaida
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 102659
              mmTop = 0
              mmWidth = 49213
              BandType = 4
            end
          end
          object rpRelaEntSaiFolhaChildReport1SummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object ppdbQuantSaida: TppDBCalc
              UserName = 'dbQuantSaida'
              DataField = 'MATRICULA'
              DataPipeline = ppSaida
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              DBCalcType = dcCount
              mmHeight = 3440
              mmLeft = 134144
              mmTop = 1323
              mmWidth = 17198
              BandType = 7
            end
            object pplblMostraZeroSaida: TppLabel
              UserName = 'lblMostraZeroSaida'
              Caption = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Transparent = True
              Visible = False
              mmHeight = 3969
              mmLeft = 149490
              mmTop = 1323
              mmWidth = 1852
              BandType = 7
            end
            object rpRelaEntSaiFolhaChildReport1Line3: TppLine
              UserName = 'rpRelaEntSaiFolhaChildReport1Line3'
              Weight = 0.75
              mmHeight = 794
              mmLeft = 115888
              mmTop = 529
              mmWidth = 90488
              BandType = 7
            end
            object rpRelaEntSaiFolhaChildReport1Label7: TppLabel
              UserName = 'rpRelaEntSaiFolhaChildReport1Label7'
              Caption = 'Total :'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3175
              mmLeft = 120386
              mmTop = 1323
              mmWidth = 8467
              BandType = 7
            end
            object ppDBCalc1: TppDBCalc
              UserName = 'DBCalc1'
              DataField = 'BRUTO'
              DataPipeline = ppSaida
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 156369
              mmTop = 1323
              mmWidth = 19315
              BandType = 7
            end
            object rpRelaEntSaiFolhaChildReport1DBCalc2: TppDBCalc
              UserName = 'rpRelaEntSaiFolhaChildReport1DBCalc2'
              DataField = 'LIQUIDO'
              DataPipeline = ppSaida
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 179388
              mmTop = 1323
              mmWidth = 23019
              BandType = 7
            end
          end
          object rpRelaEntSaiFolhaChildReport1Group2: TppGroup
            BreakName = 'BENEFICIO'
            DataPipeline = ppSaida
            UserName = 'rpRelaEntSaiFolhaChildReport1Group2'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object rpRelaEntSaiFolhaChildReport1GroupHeaderBand2: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 17992
              mmPrintPosition = 0
              object rpRelaEntSaiFolhaChildReport1Label1: TppLabel
                UserName = 'rpRelaEntSaiFolhaChildReport1Label1'
                Caption = 'Benefício  :'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 794
                mmTop = 5556
                mmWidth = 19050
                BandType = 3
                GroupNo = 1
              end
              object rpRelaEntSaiFolhaChildReport1Line1: TppLine
                UserName = 'rpRelaEntSaiFolhaChildReport1Line1'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 529
                mmTop = 17198
                mmWidth = 283635
                BandType = 3
                GroupNo = 1
              end
              object rpRelaEntSaiFolhaChildReport1Label2: TppLabel
                UserName = 'rpRelaEntSaiFolhaChildReport1Label2'
                Caption = 'Beneficíario'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 41275
                mmTop = 13229
                mmWidth = 20373
                BandType = 3
                GroupNo = 1
              end
              object rpRelaEntSaiFolhaChildReport1Label3: TppLabel
                UserName = 'rpRelaEntSaiFolhaChildReport1Label3'
                Caption = 'Valor Bruto'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 156369
                mmTop = 13229
                mmWidth = 19315
                BandType = 3
                GroupNo = 1
              end
              object rpRelaEntSaiFolhaChildReport1DBText1: TppDBText
                UserName = 'rpRelaEntSaiFolhaChildReport1DBText1'
                AutoSize = True
                DataField = 'BENEFICIO'
                DataPipeline = ppSaida
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = []
                Transparent = True
                mmHeight = 3969
                mmLeft = 22754
                mmTop = 5556
                mmWidth = 19315
                BandType = 3
                GroupNo = 1
              end
              object rpRelaEntSaiFolhaChildReport1Line4: TppLine
                UserName = 'rpRelaEntSaiFolhaChildReport1Line4'
                Weight = 0.75
                mmHeight = 265
                mmLeft = 529
                mmTop = 5556
                mmWidth = 283635
                BandType = 3
                GroupNo = 1
              end
              object ppLabel51: TppLabel
                UserName = 'Label51'
                Caption = 'Matrícula'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 529
                mmTop = 13229
                mmWidth = 15346
                BandType = 3
                GroupNo = 1
              end
              object ppLabel93: TppLabel
                UserName = 'Label93'
                Caption = 'Inscrição'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 20902
                mmTop = 13229
                mmWidth = 15610
                BandType = 3
                GroupNo = 1
              end
              object ppLabel2: TppLabel
                UserName = 'Label2'
                Caption = 'Valor Líquido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 179388
                mmTop = 13229
                mmWidth = 23019
                BandType = 3
                GroupNo = 1
              end
              object ppLabel4: TppLabel
                UserName = 'Label4'
                Caption = 'Data Início'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 206375
                mmTop = 13229
                mmWidth = 17992
                BandType = 3
                GroupNo = 0
              end
              object ppLabel5: TppLabel
                UserName = 'Label5'
                Caption = 'Data Final'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 228865
                mmTop = 13229
                mmWidth = 16933
                BandType = 3
                GroupNo = 0
              end
              object rpRelaEntSaiFolhaChildReport1Label6: TppLabel
                UserName = 'rpRelaEntSaiFolhaChildReport1Label6'
                Caption = 'SAÍDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 794
                mmTop = 529
                mmWidth = 10848
                BandType = 3
                GroupNo = 0
              end
              object ppLabel6: TppLabel
                UserName = 'Label6'
                Caption = 'Data Final Prev'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 250032
                mmTop = 13229
                mmWidth = 25665
                BandType = 3
                GroupNo = 0
              end
              object lblPlanoSaida: TppLabel
                UserName = 'lblPlanoSaida'
                Caption = 'Plano Previdenciário'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 10
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 102659
                mmTop = 13229
                mmWidth = 35190
                BandType = 3
                GroupNo = 0
              end
            end
            object rpRelaEntSaiFolhaChildReport1GroupFooterBand2: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 4763
              mmPrintPosition = 0
            end
          end
        end
      end
      object ppdbQuantEntrada: TppDBCalc
        UserName = 'dbQuantEntrada'
        DataField = 'MATRICULA'
        DataPipeline = ppRelaEntSaiFolha
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3440
        mmLeft = 134144
        mmTop = 794
        mmWidth = 17198
        BandType = 7
      end
      object rpRelaEntSaiFolhaLabel5: TppLabel
        UserName = 'rpRelaEntSaiFolhaLabel5'
        AutoSize = False
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 120386
        mmTop = 794
        mmWidth = 8467
        BandType = 7
      end
      object rpRelaEntSaiFolhaDBCalc1: TppDBCalc
        UserName = 'rpRelaEntSaiFolhaDBCalc1'
        DataField = 'BRUTO'
        DataPipeline = ppRelaEntSaiFolha
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 156369
        mmTop = 794
        mmWidth = 19315
        BandType = 7
      end
      object rpRelaEntSaiFolhaLine4: TppLine
        UserName = 'rpRelaEntSaiFolhaLine4'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 115888
        mmTop = 0
        mmWidth = 90488
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'LIQUIDO'
        DataPipeline = ppRelaEntSaiFolha
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 179388
        mmTop = 794
        mmWidth = 23019
        BandType = 7
      end
    end
    object rpRelaEntSaiFolhaGroup2: TppGroup
      BreakName = 'BENEFICIO'
      DataPipeline = ppRelaEntSaiFolha
      UserName = 'rpRelaEntSaiFolhaGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpRelaEntSaiFolhaGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16933
        mmPrintPosition = 0
        object ppLine24: TppLine
          UserName = 'ppLine24'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 529
          mmTop = 5556
          mmWidth = 283635
          BandType = 3
          GroupNo = 1
        end
        object rpRelaEntSaiFolhaLabel4: TppLabel
          UserName = 'rpRelaEntSaiFolhaLabel4'
          Caption = 'Benefício  :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 6085
          mmWidth = 19050
          BandType = 3
          GroupNo = 1
        end
        object rpRelaEntSaiFolhaDBText5: TppDBText
          UserName = 'rpRelaEntSaiFolhaDBText5'
          AutoSize = True
          DataField = 'BENEFICIO'
          DataPipeline = ppRelaEntSaiFolha
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 22754
          mmTop = 6085
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object rpRelaEntSaiFolhaLabel3: TppLabel
          UserName = 'rpRelaEntSaiFolhaLabel3'
          Caption = 'Beneficíario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 42069
          mmTop = 12435
          mmWidth = 20373
          BandType = 3
          GroupNo = 1
        end
        object Valor: TppLabel
          UserName = 'Valor'
          Caption = 'Valor Bruto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 156369
          mmTop = 12171
          mmWidth = 19315
          BandType = 3
          GroupNo = 1
        end
        object rpRelaEntSaiFolhaLine1: TppLine
          UserName = 'rpRelaEntSaiFolhaLine1'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 265
          mmTop = 16404
          mmWidth = 283635
          BandType = 3
          GroupNo = 1
        end
        object ppLabel46: TppLabel
          UserName = 'Label46'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 12435
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object ppLabel47: TppLabel
          UserName = 'Label47'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 20902
          mmTop = 12435
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object ppLabel165: TppLabel
          UserName = 'Label165'
          Caption = 'Data Início'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 206375
          mmTop = 12171
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object ppLabel172: TppLabel
          UserName = 'Label172'
          Caption = 'Data Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 228865
          mmTop = 12171
          mmWidth = 16933
          BandType = 3
          GroupNo = 1
        end
        object ppLabel1: TppLabel
          UserName = 'Valor1'
          Caption = 'Valor Líquido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 179388
          mmTop = 12171
          mmWidth = 23019
          BandType = 3
          GroupNo = 1
        end
        object pplblEntrada: TppLabel
          UserName = 'lblEntrada'
          Caption = 'ENTRADA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 265
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Data Final Prev'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 250032
          mmTop = 12171
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object lblNomePlano: TppLabel
          UserName = 'lblNomePlano'
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 101071
          mmTop = 12435
          mmWidth = 35190
          BandType = 3
          GroupNo = 0
        end
      end
      object rpRelaEntSaiFolhaGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
      end
    end
  end
end
