inherited dtmRelRendasAlteradas: TdtmRelRendasAlteradas
  Left = 257
  Top = 157
  Width = 256
  Height = 227
  Caption = 'dtmRelRendasAlteradas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Left = 21
    Top = 53
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
    Left = 21
    Top = 101
  end
  inherited qryExemplo: TwwQuery
    Left = 21
    Top = 149
  end
  inherited rpExemplo: TppReport
    Left = 21
    Top = 5
    DataPipelineName = 'pplExemplo'
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
    Left = 193
    Top = 149
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
    Left = 193
    Top = 101
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 193
    Top = 53
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
  object ppRendasAlteradas: TppBDEPipeline
    DataSource = dsRendasAlteradas
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'RendasAlteradas'
    Left = 105
    Top = 53
    object ppRendasAlteradasppField1: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object ppRendasAlteradasppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAO'
      FieldName = 'INSCRICAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppRendasAlteradasppField3: TppField
      FieldAlias = 'TITULAR'
      FieldName = 'TITULAR'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppRendasAlteradasppField4: TppField
      FieldAlias = 'BENEFICIARIO'
      FieldName = 'BENEFICIARIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object ppRendasAlteradasppField5: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object ppRendasAlteradasppField6: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 5
    end
    object ppRendasAlteradasppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALBASE'
      FieldName = 'VALBASE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppRendasAlteradasppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCORRENTE'
      FieldName = 'VALCORRENTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppRendasAlteradasppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppRendasAlteradasppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARIACAO'
      FieldName = 'VARIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object dsRendasAlteradas: TwwDataSource
    DataSet = qryRendasAlteradas
    Left = 105
    Top = 101
  end
  object qryRendasAlteradas: TwwQuery
    AfterClose = qryRendasAlteradasAfterClose
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  E.MATRICULA,'
      '  PP.INSCRICAONUMERO AS INSCRICAO,'
      '  TIT.NOME AS TITULAR,'
      '  BEN.NOME AS BENEFICIARIO,'
      '  PT.NOME AS PATROCINADORA,'
      '  PL.NOME AS PLANO,'
      '  VH1.VALBASE,'
      '  VH2.VALCORRENTE,'
      '  ABS(VH2.VALCORRENTE - VH1.VALBASE) AS DIFERENCA,'
      '  TO_NUMBER(DECODE(VH1.VALBASE,'
      
        '    0, '#39#39', ROUND((VH2.VALCORRENTE - VH1.VALBASE)/VH1.VALBASE * 1' +
        '00, 2))) AS VARIACAO'
      'FROM'
      '  (SELECT'
      '     H.IDTITULAR,'
      '     H.IDRESPONSAVEL,'
      '     H.IDPATRO,'
      '     H.IDPLANOPREV,'
      '     SUM(DECODE(P.FLGDESCONTO,'
      '           0, DECODE(P.FLGESPECIAL,'
      '                0, H.VALORPROVENTO, 0),'
      '              DECODE(P.FLGESPECIAL,'
      '                0, H.VALORPROVENTO*-1, 0))) VALBASE'
      '   FROM'
      '     HISTRUBSAL H,'
      '     PROVDESC P'
      '   WHERE 1 = 2 AND'
      '     H.IDHSTFOLHABENEF = 374               AND'
      '     H.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF AND'
      '     H.IDMODULO        = 18                AND'
      '     H.IDRUBRICA       = P.IDPROVENTO'
      '   GROUP BY'
      '     H.IDTITULAR,'
      '     H.IDRESPONSAVEL,'
      '     H.IDPATRO,'
      '     H.IDPLANOPREV'
      '   ORDER BY'
      '     H.IDTITULAR) VH1,'
      '  (SELECT'
      '     H.IDTITULAR,'
      '     H.IDRESPONSAVEL,'
      '     H.IDPATRO,'
      '     H.IDPLANOPREV,'
      '     SUM(DECODE(P.FLGDESCONTO,'
      '           0, DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO, 0),'
      
        '                DECODE(P.FLGESPECIAL, 0, H.VALORPROVENTO*-1, 0))' +
        ') VALCORRENTE'
      '   FROM'
      '     HISTRUBSAL H,'
      '     PROVDESC P'
      '   WHERE 1 = 2 AND'
      '     H.IDHSTFOLHABENEF = 434               AND'
      '     H.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF AND'
      '     H.IDMODULO        = 18                AND'
      '     H.IDRUBRICA       = P.IDPROVENTO'
      '   GROUP BY'
      '     H.IDTITULAR,'
      '     H.IDRESPONSAVEL,'
      '     H.IDPATRO,'
      '     H.IDPLANOPREV) VH2,'
      '  PESSOA PT,'
      '  PESSOA TIT,'
      '  PESSOA BEN,'
      '  PLANPREV PL,'
      '  ELEGPATRO E,'
      '  PARTPREVPLAN PP'
      'WHERE 1 = 2 AND'
      '  VH1.IDTITULAR     = VH2.IDTITULAR     AND'
      '  VH1.IDRESPONSAVEL = VH2.IDRESPONSAVEL AND'
      '  VH1.IDTITULAR     = PP.IDPESSOA       AND'
      '  VH1.IDPATRO       = PP.IDPESSJUR      AND'
      '  VH1.IDPLANOPREV   = PP.IDPLANOPREV    AND'
      '  PP.SEQPROPOSTA    = 1                 AND'
      '  PP.FLGDESATIVADO  = 0                 AND'
      '  VH1.IDTITULAR     = E.IDPESSOA        AND'
      '  VH1.IDPATRO       = E.IDPESSJUR       AND'
      '  VH1.IDTITULAR     = TIT.IDPESSOA      AND'
      '  VH1.IDRESPONSAVEL = BEN.IDPESSOA      AND'
      '  VH1.IDPATRO       = PT.IDPESSOA       AND'
      '  VH1.IDPLANOPREV   = PL.IDPLANOPREV    AND'
      '  ABS(VH2.VALCORRENTE - VH1.VALBASE) >= (0*VH1.VALBASE)'
      'ORDER BY'
      '  PT.IDPESSOA,'
      '  PL.IDPLANOPREV,'
      '  PP.INSCRICAONUMERO')
    ValidateWithMask = True
    Left = 105
    Top = 149
  end
  object rpRendasAlteradas: TppReport
    AutoStop = False
    DataPipeline = ppRendasAlteradas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Rendas Alteradas'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpRendasAlteradasBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 105
    Top = 5
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppRendasAlteradas'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 60325
      mmPrintPosition = 0
      object rpBenefAlterLabel10: TppLabel
        UserName = 'rpBenefAlterLabel10'
        Caption = 'Relatório de Rendas Alteradas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 69321
        mmTop = 34660
        mmWidth = 61648
        BandType = 0
      end
      object rpBenefAlterDBImage1: TppDBImage
        UserName = 'rpBenefAlterDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 3175
        mmTop = 2646
        mmWidth = 32544
        BandType = 0
      end
      object rpBenefAlterDBText9: TppDBText
        UserName = 'rpBenefAlterDBText9'
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
        mmLeft = 36777
        mmTop = 2910
        mmWidth = 133615
        BandType = 0
      end
      object rpBenefAlterDBText10: TppDBText
        UserName = 'rpBenefAlterDBText10'
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
        mmLeft = 36777
        mmTop = 9260
        mmWidth = 25400
        BandType = 0
      end
      object rpBenefAlterDBText11: TppDBText
        UserName = 'rpBenefAlterDBText11'
        DataField = 'LOGRADOURO'
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
        mmLeft = 36777
        mmTop = 14552
        mmWidth = 41804
        BandType = 0
      end
      object rpBenefAlterDBText12: TppDBText
        UserName = 'rpBenefAlterDBText12'
        DataField = 'BAIRRO'
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
        mmLeft = 36777
        mmTop = 19050
        mmWidth = 20108
        BandType = 0
      end
      object rpBenefAlterLabel9: TppLabel
        UserName = 'rpBenefAlterLabel9'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 36777
        mmTop = 23548
        mmWidth = 5027
        BandType = 0
      end
      object rpBenefAlterDBText13: TppDBText
        UserName = 'rpBenefAlterDBText13'
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
        mmLeft = 44186
        mmTop = 23548
        mmWidth = 17198
        BandType = 0
      end
      object rpBenefAlterDBText14: TppDBText
        UserName = 'rpBenefAlterDBText14'
        DataField = 'CIDADE'
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
        mmLeft = 57415
        mmTop = 19050
        mmWidth = 26723
        BandType = 0
      end
      object rpBenefAlterDBText15: TppDBText
        UserName = 'rpBenefAlterDBText15'
        DataField = 'NUMERO'
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
        mmLeft = 79904
        mmTop = 14552
        mmWidth = 17198
        BandType = 0
      end
      object rpBenefAlterDBText16: TppDBText
        UserName = 'rpBenefAlterDBText16'
        DataField = 'CODESTADO'
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
        mmLeft = 85725
        mmTop = 19050
        mmWidth = 20108
        BandType = 0
      end
      object lblFiltroSel: TppLabel
        UserName = 'lblFiltroSel'
        AutoSize = False
        Caption = 'Filtro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 49477
        mmWidth = 11377
        BandType = 0
      end
      object lblMostraFiltroSel: TppLabel
        UserName = 'lblMostraFiltroSel'
        Caption = 'lblMostraFiltroSel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 12435
        mmTop = 49477
        mmWidth = 29633
        BandType = 0
      end
      object lblQtdRegistros: TppLabel
        UserName = 'lblQtdRegistros'
        AutoSize = False
        Caption = 'lblQtdRegistros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 54769
        mmWidth = 77258
        BandType = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object rpBenefAlterDBText4: TppDBText
        UserName = 'rpBenefAlterDBText4'
        DataField = 'INSCRICAO'
        DataPipeline = ppRendasAlteradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRendasAlteradas'
        mmHeight = 3969
        mmLeft = 0
        mmTop = 529
        mmWidth = 16669
        BandType = 4
      end
      object rpBenefAlterDBText5: TppDBText
        UserName = 'rpBenefAlterDBText5'
        DataField = 'MATRICULA'
        DataPipeline = ppRendasAlteradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRendasAlteradas'
        mmHeight = 3969
        mmLeft = 18785
        mmTop = 529
        mmWidth = 16669
        BandType = 4
      end
      object rpBenefAlterDBText6: TppDBText
        UserName = 'rpBenefAlterDBText6'
        DataField = 'TITULAR'
        DataPipeline = ppRendasAlteradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRendasAlteradas'
        mmHeight = 3969
        mmLeft = 40481
        mmTop = 529
        mmWidth = 73025
        BandType = 4
      end
      object rpBenefAlterDBText7: TppDBText
        UserName = 'rpBenefAlterDBText7'
        DataField = 'BENEFICIARIO'
        DataPipeline = ppRendasAlteradas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRendasAlteradas'
        mmHeight = 3969
        mmLeft = 116417
        mmTop = 529
        mmWidth = 73025
        BandType = 4
      end
      object rpBenefAlterDBText8: TppDBText
        UserName = 'rpBenefAlterDBText8'
        DataField = 'VALBASE'
        DataPipeline = ppRendasAlteradas
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRendasAlteradas'
        mmHeight = 3969
        mmLeft = 193411
        mmTop = 529
        mmWidth = 19579
        BandType = 4
      end
      object rpBenefAlterDBText17: TppDBText
        UserName = 'rpBenefAlterDBText17'
        DataField = 'VALCORRENTE'
        DataPipeline = ppRendasAlteradas
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRendasAlteradas'
        mmHeight = 3969
        mmLeft = 215371
        mmTop = 529
        mmWidth = 19579
        BandType = 4
      end
      object rpBenefAlterDBText18: TppDBText
        UserName = 'rpBenefAlterDBText18'
        DataField = 'DIFERENCA'
        DataPipeline = ppRendasAlteradas
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRendasAlteradas'
        mmHeight = 3969
        mmLeft = 239713
        mmTop = 529
        mmWidth = 19579
        BandType = 4
      end
      object dbVariacao: TppDBText
        UserName = 'dbVariacao'
        DataField = 'VARIACAO'
        DataPipeline = ppRendasAlteradas
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppRendasAlteradas'
        mmHeight = 3704
        mmLeft = 265113
        mmTop = 265
        mmWidth = 15610
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppLabel15: TppLabel
        OnPrint = LblSistemaPrint
        UserName = 'ppLabel15'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 2646
        mmWidth = 262203
        BandType = 8
      end
      object ppLine14: TppLine
        UserName = 'ppLine14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc13: TppSystemVariable
        UserName = 'Calc13'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 110596
        mmTop = 2646
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc14: TppSystemVariable
        UserName = 'Calc14'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 235744
        mmTop = 2646
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpBenefAlterSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
    end
    object rpBenefAlterGroup1: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = ppRendasAlteradas
      OutlineSettings.CreateNode = True
      UserName = 'rpBenefAlterGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRendasAlteradas'
      object rpBenefAlterGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object rpBenefAlterLabel1: TppLabel
          UserName = 'rpBenefAlterLabel1'
          Caption = 'PATROCINADORA :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 33073
          BandType = 3
          GroupNo = 0
        end
        object rpBenefAlterDBText1: TppDBText
          UserName = 'rpBenefAlterDBText1'
          AutoSize = True
          DataField = 'PATROCINADORA'
          DataPipeline = ppRendasAlteradas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppRendasAlteradas'
          mmHeight = 3969
          mmLeft = 33602
          mmTop = 0
          mmWidth = 30692
          BandType = 3
          GroupNo = 0
        end
      end
      object rpBenefAlterGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object rpBenefAlterLabel15: TppLabel
          UserName = 'rpBenefAlterLabel15'
          Caption = 'TOTAL PATROCINADORA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 168011
          mmTop = 0
          mmWidth = 42333
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'DIFERENCA'
          DataPipeline = ppRendasAlteradas
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpBenefAlterGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppRendasAlteradas'
          mmHeight = 4233
          mmLeft = 225425
          mmTop = 0
          mmWidth = 33867
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpBenefAlterGroup2: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppRendasAlteradas
      OutlineSettings.CreateNode = True
      UserName = 'rpBenefAlterGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRendasAlteradas'
      object rpBenefAlterGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object rpBenefAlterLabel2: TppLabel
          UserName = 'rpBenefAlterLabel2'
          Caption = 'PLANO :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 17992
          mmTop = 0
          mmWidth = 14023
          BandType = 3
          GroupNo = 1
        end
        object rpBenefAlterDBText2: TppDBText
          UserName = 'rpBenefAlterDBText2'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppRendasAlteradas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppRendasAlteradas'
          mmHeight = 3969
          mmLeft = 33602
          mmTop = 0
          mmWidth = 11906
          BandType = 3
          GroupNo = 1
        end
        object rpBenefAlterLabel4: TppLabel
          UserName = 'rpBenefAlterLabel4'
          Caption = 'Inscrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265
          mmTop = 9260
          mmWidth = 15081
          BandType = 3
          GroupNo = 1
        end
        object rpBenefAlterLabel5: TppLabel
          UserName = 'rpBenefAlterLabel5'
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 19844
          mmTop = 9260
          mmWidth = 15610
          BandType = 3
          GroupNo = 1
        end
        object rpBenefAlterLabel6: TppLabel
          UserName = 'rpBenefAlterLabel6'
          Caption = 'Titular'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 40481
          mmTop = 9260
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object rpBenefAlterLabel7: TppLabel
          UserName = 'rpBenefAlterLabel7'
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 116417
          mmTop = 9260
          mmWidth = 20373
          BandType = 3
          GroupNo = 1
        end
        object rpBenefAlterLabel8: TppLabel
          UserName = 'rpBenefAlterLabel8'
          Caption = 'Vlr Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 193411
          mmTop = 9260
          mmWidth = 19579
          BandType = 3
          GroupNo = 1
        end
        object rpBenefAlterLabel11: TppLabel
          UserName = 'rpBenefAlterLabel11'
          Caption = 'Vlr Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 220398
          mmTop = 9260
          mmWidth = 14552
          BandType = 3
          GroupNo = 1
        end
        object rpBenefAlterLabel12: TppLabel
          UserName = 'rpBenefAlterLabel12'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 243153
          mmTop = 9260
          mmWidth = 16140
          BandType = 3
          GroupNo = 1
        end
        object rpBenefAlterLine1: TppLine
          UserName = 'rpBenefAlterLine1'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 13758
          mmWidth = 284428
          BandType = 3
          GroupNo = 1
        end
        object lblVariacao: TppLabel
          UserName = 'lblVariacao'
          Caption = 'Variação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 265907
          mmTop = 9260
          mmWidth = 14817
          BandType = 3
          GroupNo = 1
        end
      end
      object rpBenefAlterGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object rpBenefAlterDBCalc2: TppDBCalc
          UserName = 'rpBenefAlterDBCalc2'
          AutoSize = True
          DataField = 'DIFERENCA'
          DataPipeline = ppRendasAlteradas
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpBenefAlterGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppRendasAlteradas'
          mmHeight = 4191
          mmLeft = 225637
          mmTop = 0
          mmWidth = 33655
          BandType = 5
          GroupNo = 1
        end
        object rpBenefAlterLabel14: TppLabel
          UserName = 'rpBenefAlterLabel14'
          Caption = 'TOTAL PLANO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 168011
          mmTop = 0
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
