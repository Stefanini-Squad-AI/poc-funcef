inherited dtmRelEstatCidades: TdtmRelEstatCidades
  Left = 180
  Top = 137
  Width = 440
  Height = 308
  Caption = 'dtmRelEstatCidades'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
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
  inherited qryExemplo: TwwQuery
    Active = True
  end
  object qryRelaEstat: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DISTINCT COUNT (AT.IDATEND) AS CONTATEND,'
      '   CID.NOME AS TOPICO,'
      '   '#39'0.00%'#39'    AS PERCENT'
      'FROM'
      '   ATEND AT ,'
      '   TIPOATEND TP ,'
      '   ASSUNTO ASS,'
      '   GRUPOASSUNTO  GA,'
      '   ASSUNTOXATEND AST,'
      '   PARTPREVPLAN PP,'
      '   SITPART SP,'
      '   ELEGPATRO EL,'
      '   LOCALATENDXCPU LA,'
      '   ENDPESS EP,'
      '   CIDADES CID    '
      'WHERE  '
      ''
      
        'AT.DATA >= TO_DATE('#39'01/01/2002 00:00:01'#39', '#39'DD/MM/YYYY HH24:MI:SS' +
        #39') AND AT.DATA <= TO_DATE('#39'30/09/2002 23:59:59'#39','#39'DD/MM/YYYY HH24' +
        ':MI:SS'#39') '
      ''
      'AND      EP.IDCIDADES = CID.IDCIDADES '
      'AND      EP.IDPESSOA = AT.IDTITULAR '
      'AND      EL.IDPESSOA = AT.IDTITULAR  '
      'AND      AT.IDLOCALATENDXCPU = LA.IDLOCALATENDXCPU '
      'AND      AT.IDTIPOATEND = TP.IDTIPOATEND '
      'AND      ASS.IDASSUNTO = AST.IDASSUNTO '
      'AND      AST.IDATEND = AT.IDATEND '
      'AND      PP.IDPESSOA(+) = AT.IDTITULAR '
      
        'AND    ((PP.FLGDESATIVADO = 1 AND PP.IDPESSOA NOT IN (SELECT PPP' +
        '1.IDPESSOA FROM PARTPREVPLAN PPP1 WHERE PPP1.IDPESSOA = PP.IDPES' +
        'SOA AND PPP1.FLGDESATIVADO IN (0,NULL))) OR PP.FLGDESATIVADO IN ' +
        '(0,NULL)) '
      'AND      PP.IDPESSJUR(+) = AT.IDPESSJUR '
      'AND      PP.IDSITPART = SP.IDSITPART(+) '
      'AND      GA.IDGRUPOASSUNTO = ASS.IDGRUPOASSUNTO    '
      ''
      ''
      ''
      'GROUP BY CID.NOME '
      'ORDER BY CONTATEND DESC')
    ValidateWithMask = True
    Left = 224
    Top = 96
    object qryRelaEstatCONTATEND: TFloatField
      FieldName = 'CONTATEND'
    end
    object qryRelaEstatTOPICO: TStringField
      FieldName = 'TOPICO'
      Size = 50
    end
    object qryRelaEstatPERCENT: TStringField
      FieldName = 'PERCENT'
      FixedChar = True
      Size = 5
    end
  end
  object pprRelaEstat: TppReport
    AutoStop = False
    DataPipeline = ppRelaEstat
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 184
    Top = 152
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Relatório Estatístico de Atendimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 57415
        mmTop = 11642
        mmWidth = 74348
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 10320
        mmTop = 25929
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Percentual do Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 125149
        mmTop = 25929
        mmWidth = 33073
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 89694
        mmTop = 25929
        mmWidth = 19579
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'TOPICO'
        DataPipeline = ppRelaEstat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10320
        mmTop = 794
        mmWidth = 59002
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CONTATEND'
        DataPipeline = ppRelaEstat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 89694
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'PERCENT'
        DataPipeline = ppRelaEstat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 125148
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Total Geral: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 67733
        mmTop = 1058
        mmWidth = 19050
        BandType = 8
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'CONTATEND'
        DataPipeline = ppRelaEstat
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 89694
        mmTop = 1058
        mmWidth = 17198
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 88371
        mmTop = 265
        mmWidth = 19579
        BandType = 8
      end
    end
  end
  object ppRelaEstat: TppBDEPipeline
    DataSource = DsRelaEstat
    UserName = 'RelaEstat'
    Left = 256
    Top = 160
    object ppRelaEstatppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONTATEND'
      FieldName = 'CONTATEND'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object ppRelaEstatppField2: TppField
      FieldAlias = 'TOPICO'
      FieldName = 'TOPICO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object ppRelaEstatppField3: TppField
      FieldAlias = 'PERCENT'
      FieldName = 'PERCENT'
      FieldLength = 5
      DisplayWidth = 5
      Position = 2
    end
  end
  object DsRelaEstat: TwwDataSource
    DataSet = qryRelaEstat
    Left = 312
    Top = 104
  end
end
