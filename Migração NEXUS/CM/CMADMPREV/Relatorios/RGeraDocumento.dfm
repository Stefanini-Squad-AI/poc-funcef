inherited RptModeloBoleto: TRptModeloBoleto
  Left = 666
  Top = 204
  Width = 476
  Height = 340
  Caption = 'Modelo Boleto'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object DsDados: TwwDataSource
    DataSet = CdsDados
    Left = 124
    Top = 184
  end
  object CdsDados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 121
    Top = 131
    object CdsDadosCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object CdsDadosCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object CdsDadosCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object CdsDadosBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object CdsDadosCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object CdsDadosNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object CdsDadosLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object CdsDadosNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object CdsDadosNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object CdsDadosVALORDESCONTO: TFloatField
      FieldName = 'VALORDESCONTO'
    end
    object CdsDadosDATALIMITE: TDateTimeField
      FieldName = 'DATALIMITE'
    end
    object CdsDadosDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object CdsDadosCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
    end
    object CdsDadosDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object CdsDadosDATAREMESSA: TDateTimeField
      FieldName = 'DATAREMESSA'
    end
    object CdsDadosEMISBLOQ: TStringField
      FieldName = 'EMISBLOQ'
      FixedChar = True
      Size = 1
    end
    object CdsDadosSTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
    object CdsDadosNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object CdsDadosMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object CdsDadosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsDadosTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object CdsDadosNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
    end
    object CdsDadosCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object CdsDadosTIPOENDERECO: TStringField
      FieldName = 'TIPOENDERECO'
      FixedChar = True
      Size = 5
    end
    object CdsDadosNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object CdsDadosNUMCONTA: TStringField
      FieldName = 'NUMCONTA'
      FixedChar = True
      Size = 15
    end
    object CdsDadosVALORJUROS: TFloatField
      FieldName = 'VALORJUROS'
    end
    object CdsDadosCODBARRA: TStringField
      FieldName = 'CODBARRA'
      FixedChar = True
      Size = 44
    end
    object CdsDadosRSALDO: TFloatField
      FieldName = 'RSALDO'
    end
    object CdsDadosRSALDOOUTRAMOEDA: TFloatField
      FieldName = 'RSALDOOUTRAMOEDA'
    end
    object CdsDadosCODBARRADIG: TStringField
      FieldName = 'CODBARRADIG'
      FixedChar = True
      Size = 80
    end
    object CdsDadosFLGGRUPO: TStringField
      FieldName = 'FLGGRUPO'
      FixedChar = True
      Size = 1
    end
    object CdsDadosAGENCIACODCEDENTE: TStringField
      FieldName = 'AGENCIACODCEDENTE'
      FixedChar = True
      Size = 44
    end
    object CdsDadosDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object CdsDadosDATADOCUMENTO: TDateTimeField
      FieldName = 'DATADOCUMENTO'
    end
    object CdsDadosNUMEMPRESABANCO: TStringField
      FieldName = 'NUMEMPRESABANCO'
      FixedChar = True
      Size = 8
    end
  end
  object SqlDados: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  E.CEP, ES.CODESTADO, C.NOME AS CIDADE, E.BAIRRO,'
      '  E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, P.NUMDOCUMENTO,'
      
        '  P.RAZAOSOCIAL AS NOME, D.VALORDESCONTO, D.DATALIMITE, D.DATAPR' +
        'OGRAMADA,'
      
        '  D.CODPORTFORMA, D.DATAVENCTO, D.DATAREMESSA, D.EMISBLOQ, D.STA' +
        'TUS,'
      
        '  D.DATAEMISSAO, D.DATAEMISSAO AS DATADOCUMENTO, D.NODOCUMENTO, ' +
        'M.MOESIGLA, D.CODDOCUMENTO, P.TIPO, D.NOSSONUMERO,'
      
        '  D.COMPLDOCUMENTO, E.TIPOENDERECO, AB.NUMAGENCIA, PC.NOCONTACOR' +
        'R AS NUMCONTA, F.JUROSPORDIA AS VALORJUROS,'
      
        '  ('#39'01234567890123456789012345678901234567890123'#39') AS CODBARRA, ' +
        '(0) As rSaldo, (0) As rSaldoOutraMoeda,'
      
        '  ('#39'00186.99595  90309.403922  00152.059168                     ' +
        '                 000'#39') AS CODBARRADIG, ('#39' '#39') AS FLGGRUPO,'
      
        '  ('#39'01234567890123456789012345678901234567890123'#39') AS AGENCIACOD' +
        'CEDENTE,'
      '  ('#39'00000-00'#39') AS NUMEMPRESABANCO '
      ' FROM'
      '  ENDPESS E, CIDADES C, ESTADO ES, '
      '  PESSOA P,'
      '  DOCUMENTO D,'
      '  PORTADORFORMA F ,'
      '  MOEDA M,'
      '  AGENCIABANCARIA AB,'
      '  PORTADORCONTA PC'
      ' WHERE 1=2 '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsDados
    Left = 121
    Top = 76
  end
  object PpDados: TppBDEPipeline
    DataSource = DsDados
    SkipWhenNoRecords = False
    UserName = 'PpDados'
    Left = 189
    Top = 182
    object PpDadosppField1: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpDadosppField2: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpDadosppField3: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpDadosppField4: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpDadosppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpDadosppField6: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpDadosppField7: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpDadosppField8: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpDadosppField9: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpDadosppField10: TppField
      FieldAlias = 'VALORDESCONTO'
      FieldName = 'VALORDESCONTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpDadosppField11: TppField
      FieldAlias = 'DATALIMITE'
      FieldName = 'DATALIMITE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpDadosppField12: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpDadosppField13: TppField
      FieldAlias = 'CODPORTFORMA'
      FieldName = 'CODPORTFORMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpDadosppField14: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpDadosppField15: TppField
      FieldAlias = 'DATAREMESSA'
      FieldName = 'DATAREMESSA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpDadosppField16: TppField
      FieldAlias = 'EMISBLOQ'
      FieldName = 'EMISBLOQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PpDadosppField17: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PpDadosppField18: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PpDadosppField19: TppField
      FieldAlias = 'MOESIGLA'
      FieldName = 'MOESIGLA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PpDadosppField20: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object PpDadosppField21: TppField
      FieldAlias = 'TIPO'
      FieldName = 'TIPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object PpDadosppField22: TppField
      FieldAlias = 'NOSSONUMERO'
      FieldName = 'NOSSONUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object PpDadosppField23: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object PpDadosppField24: TppField
      FieldAlias = 'TIPOENDERECO'
      FieldName = 'TIPOENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object PpDadosppField25: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object PpDadosppField26: TppField
      FieldAlias = 'NUMCONTA'
      FieldName = 'NUMCONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object PpDadosppField27: TppField
      FieldAlias = 'VALORJUROS'
      FieldName = 'VALORJUROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object PpDadosppField28: TppField
      FieldAlias = 'CODBARRA'
      FieldName = 'CODBARRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object PpDadosppField29: TppField
      FieldAlias = 'RSALDO'
      FieldName = 'RSALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object PpDadosppField30: TppField
      FieldAlias = 'RSALDOOUTRAMOEDA'
      FieldName = 'RSALDOOUTRAMOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object PpDadosppField31: TppField
      FieldAlias = 'CODBARRADIG'
      FieldName = 'CODBARRADIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object PpDadosppField32: TppField
      FieldAlias = 'FLGGRUPO'
      FieldName = 'FLGGRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object PpDadosppField33: TppField
      FieldAlias = 'AGENCIACODCEDENTE'
      FieldName = 'AGENCIACODCEDENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object PpDadosppField34: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object PpDadosppField35: TppField
      FieldAlias = 'DATADOCUMENTO'
      FieldName = 'DATADOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object PpDadosppField36: TppField
      FieldAlias = 'NUMEMPRESABANCO'
      FieldName = 'NUMEMPRESABANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
  end
  object RptModelo: TppReport
    AutoStop = False
    DataPipeline = PpDados
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13350
    PrinterSetup.mmMarginLeft = 12350
    PrinterSetup.mmMarginRight = 12350
    PrinterSetup.mmMarginTop = 13350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\Teste.Txt'
    Template.Format = ftASCII
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = RptModeloBeforePrint
    DeviceType = 'Printer'
    Language = lgPortugueseBrazil
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 279
    Top = 182
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpDados'
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 248709
      mmPrintPosition = 0
      object RptBarrasBBLine36: TppLine
        UserName = 'RptBarrasBBLine36'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 66675
        mmLeft = 0
        mmTop = 36248
        mmWidth = 185209
        BandType = 4
      end
      object RptBarrasBBLine41: TppLine
        UserName = 'RptBarrasBBLine41'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 134938
        mmTop = 75936
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine29: TppLine
        UserName = 'RptBarrasBBLine29'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 89165
        mmLeft = 134938
        mmTop = 13494
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine43: TppLine
        UserName = 'RptBarrasBBLine43'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6615
        mmLeft = 134938
        mmTop = 88900
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine42: TppLine
        UserName = 'RptBarrasBBLine42'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 134938
        mmTop = 82286
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLabel42: TppLabel
        UserName = 'RptBarrasBBLabel42'
        Caption = '( - ) Outras Deduções / Abatimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 75671
        mmWidth = 30692
        BandType = 4
      end
      object RptBarrasBBLine48: TppLine
        UserName = 'RptBarrasBBLine48'
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 135202
        mmTop = 69056
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine52: TppLine
        UserName = 'RptBarrasBBLine52'
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 135202
        mmTop = 49477
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine50: TppLine
        UserName = 'RptBarrasBBLine50'
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 134938
        mmTop = 55827
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine49: TppLine
        UserName = 'RptBarrasBBLine49'
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 135202
        mmTop = 62442
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine21: TppLine
        UserName = 'RptBarrasBBLine21'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 57415
        mmTop = 171450
        mmWidth = 38100
        BandType = 4
      end
      object RptBarrasBBLine23: TppLine
        UserName = 'RptBarrasBBLine23'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 78581
        mmTop = 164836
        mmWidth = 11906
        BandType = 4
      end
      object RptBarrasBBLine22: TppLine
        UserName = 'RptBarrasBBLine22'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 57679
        mmTop = 165100
        mmWidth = 21167
        BandType = 4
      end
      object RptBarrasBBLine19: TppLine
        UserName = 'RptBarrasBBLine19'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12700
        mmLeft = 0
        mmTop = 165100
        mmWidth = 27781
        BandType = 4
      end
      object RptBarrasBBLine5: TppLine
        UserName = 'RptBarrasBBLine5'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 158750
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine13: TppLine
        UserName = 'RptBarrasBBLine13'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 59002
        mmLeft = 134938
        mmTop = 151871
        mmWidth = 50271
        BandType = 4
      end
      object LblNomeBanco2: TppLabel
        UserName = 'LblNomeBanco2'
        Caption = 'BANCO DO BRASIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde Bk BT'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 7408
        mmTop = 145786
        mmWidth = 38894
        BandType = 4
      end
      object LblNumBanco2: TppLabel
        UserName = 'LblNumBanco2'
        Caption = '001-9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde Bk BT'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 48683
        mmTop = 145521
        mmWidth = 15875
        BandType = 4
      end
      object RptBarrasBBLine1: TppLine
        UserName = 'RptBarrasBBLine1'
        Pen.Width = 2
        Position = lpRight
        Weight = 1.5
        mmHeight = 5821
        mmLeft = 46831
        mmTop = 145786
        mmWidth = 1588
        BandType = 4
      end
      object RptBarrasBBLine3: TppLine
        UserName = 'RptBarrasBBLine3'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 0
        mmTop = 150813
        mmWidth = 185473
        BandType = 4
      end
      object RptBarrasBBLine2: TppLine
        UserName = 'RptBarrasBBLine2'
        Pen.Width = 2
        Position = lpRight
        Weight = 1.5
        mmHeight = 5821
        mmLeft = 63765
        mmTop = 145786
        mmWidth = 1588
        BandType = 4
      end
      object RptBarrasBBLine4: TppLine
        UserName = 'RptBarrasBBLine4'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 152400
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine6: TppLine
        UserName = 'RptBarrasBBLine6'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 165100
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine7: TppLine
        UserName = 'RptBarrasBBLine7'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 171450
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine8: TppLine
        UserName = 'RptBarrasBBLine8'
        Pen.Width = 2
        ParentWidth = True
        Position = lpBottom
        Weight = 1.5
        mmHeight = 33867
        mmLeft = 0
        mmTop = 177536
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine9: TppLine
        UserName = 'RptBarrasBBLine9'
        Pen.Width = 2
        ParentWidth = True
        Position = lpBottom
        Weight = 1.5
        mmHeight = 15081
        mmLeft = 0
        mmTop = 210873
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine10: TppLine
        UserName = 'RptBarrasBBLine10'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 124354
        mmTop = 227542
        mmWidth = 60061
        BandType = 4
      end
      object RptBarrasBBLine11: TppLine
        UserName = 'RptBarrasBBLine11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 124354
        mmTop = 227542
        mmWidth = 2117
        BandType = 4
      end
      object RptBarrasBBLabel3: TppLabel
        UserName = 'RptBarrasBBLabel3'
        Caption = ' Autenticação Mecânica '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 142875
        mmTop = 226748
        mmWidth = 21696
        BandType = 4
      end
      object RptBarrasBBLine14: TppLine
        UserName = 'RptBarrasBBLine14'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 135202
        mmTop = 177800
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine15: TppLine
        UserName = 'RptBarrasBBLine15'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 135202
        mmTop = 184415
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine16: TppLine
        UserName = 'RptBarrasBBLine16'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 135202
        mmTop = 190765
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLine17: TppLine
        UserName = 'RptBarrasBBLine17'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6615
        mmLeft = 135202
        mmTop = 197380
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLabel4: TppLabel
        UserName = 'RptBarrasBBLabel4'
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 152400
        mmWidth = 10054
        BandType = 4
      end
      object RptBarrasBBLabel5: TppLabel
        UserName = 'RptBarrasBBLabel5'
        Caption = 'Agência/Código Cedente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 158750
        mmWidth = 21960
        BandType = 4
      end
      object RptBarrasBBLabel6: TppLabel
        UserName = 'RptBarrasBBLabel6'
        Caption = 'Nosso Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 165100
        mmWidth = 13229
        BandType = 4
      end
      object RptBarrasBBLabel7: TppLabel
        UserName = 'RptBarrasBBLabel7'
        Caption = '( = ) Valor do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 171450
        mmWidth = 22225
        BandType = 4
      end
      object RptBarrasBBLabel8: TppLabel
        UserName = 'RptBarrasBBLabel8'
        Caption = '( - ) Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 177800
        mmWidth = 12435
        BandType = 4
      end
      object RptBarrasBBLabel9: TppLabel
        UserName = 'RptBarrasBBLabel9'
        Caption = '( - ) Outras Deduções / Abatimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 184150
        mmWidth = 30692
        BandType = 4
      end
      object RptBarrasBBLabel10: TppLabel
        UserName = 'RptBarrasBBLabel10'
        Caption = '( + ) Mora / Multa / Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 190765
        mmWidth = 22490
        BandType = 4
      end
      object RptBarrasBBLabel11: TppLabel
        UserName = 'RptBarrasBBLabel11'
        Caption = '( + ) Outros Acréscimos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 197115
        mmWidth = 21431
        BandType = 4
      end
      object RptBarrasBBLabel12: TppLabel
        UserName = 'RptBarrasBBLabel12'
        Caption = '( = ) Valor Cobrado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 203994
        mmWidth = 17463
        BandType = 4
      end
      object RptBarrasBBLabel13: TppLabel
        UserName = 'RptBarrasBBLabel13'
        Caption = 'Código de baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 146315
        mmTop = 221457
        mmWidth = 14288
        BandType = 4
      end
      object RptBarrasBBLabel14: TppLabel
        UserName = 'RptBarrasBBLabel14'
        Caption = '5593'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 177800
        mmTop = 220663
        mmWidth = 6350
        BandType = 4
      end
      object RptBarrasBBLabel15: TppLabel
        UserName = 'RptBarrasBBLabel15'
        Caption = 'Sacado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 212196
        mmWidth = 7144
        BandType = 4
      end
      object RptBarrasBBLabel16: TppLabel
        UserName = 'RptBarrasBBLabel16'
        Caption = 'Sacador/Avalista:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 222515
        mmWidth = 15610
        BandType = 4
      end
      object RptBarrasBBLabel17: TppLabel
        UserName = 'RptBarrasBBLabel17'
        Caption = 'Instruções:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 177800
        mmWidth = 9790
        BandType = 4
      end
      object RptBarrasBBLabel18: TppLabel
        UserName = 'RptBarrasBBLabel18'
        Caption = '( Texto de Responsabilidade do Cedente )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold, fsItalic]
        mmHeight = 2646
        mmLeft = 11906
        mmTop = 177800
        mmWidth = 41010
        BandType = 4
      end
      object RptBarrasBBLabel19: TppLabel
        UserName = 'RptBarrasBBLabel19'
        Caption = 'Local de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 152400
        mmWidth = 17463
        BandType = 4
      end
      object RptBarrasBBLabel20: TppLabel
        UserName = 'RptBarrasBBLabel20'
        Caption = 'Cedente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 158750
        mmWidth = 7408
        BandType = 4
      end
      object RptBarrasBBLabel21: TppLabel
        UserName = 'RptBarrasBBLabel21'
        Caption = 'Data do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 165100
        mmWidth = 17198
        BandType = 4
      end
      object RptBarrasBBLabel22: TppLabel
        UserName = 'RptBarrasBBLabel22'
        Caption = 'Nº  da Conta/Respo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 0
        mmTop = 171450
        mmWidth = 17727
        BandType = 4
      end
      object RptBarrasBBLine18: TppLine
        UserName = 'RptBarrasBBLine18'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12700
        mmLeft = 27781
        mmTop = 165100
        mmWidth = 29898
        BandType = 4
      end
      object RptBarrasBBLabel23: TppLabel
        UserName = 'RptBarrasBBLabel23'
        Caption = 'Nº do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 28046
        mmTop = 165100
        mmWidth = 15346
        BandType = 4
      end
      object RptBarrasBBLine20: TppLine
        UserName = 'RptBarrasBBLine20'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 28046
        mmTop = 171186
        mmWidth = 18256
        BandType = 4
      end
      object RptBarrasBBLabel24: TppLabel
        UserName = 'RptBarrasBBLabel24'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 28046
        mmTop = 171450
        mmWidth = 7408
        BandType = 4
      end
      object RptBarrasBBLabel25: TppLabel
        UserName = 'RptBarrasBBLabel25'
        Caption = 'Espécie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 46831
        mmTop = 171450
        mmWidth = 7144
        BandType = 4
      end
      object RptBarrasBBLabel26: TppLabel
        UserName = 'RptBarrasBBLabel26'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 58208
        mmTop = 171450
        mmWidth = 10054
        BandType = 4
      end
      object RptBarrasBBLabel27: TppLabel
        UserName = 'RptBarrasBBLabel27'
        Caption = 'Espécie Doc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 58473
        mmTop = 165100
        mmWidth = 11377
        BandType = 4
      end
      object RptBarrasBBLabel28: TppLabel
        UserName = 'RptBarrasBBLabel28'
        Caption = 'Aceite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 79375
        mmTop = 165100
        mmWidth = 5556
        BandType = 4
      end
      object RptBarrasBBLabel29: TppLabel
        UserName = 'RptBarrasBBLabel29'
        Caption = 'Data do Processamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 91017
        mmTop = 165100
        mmWidth = 20902
        BandType = 4
      end
      object RptBarrasBBLabel30: TppLabel
        UserName = 'RptBarrasBBLabel30'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 96309
        mmTop = 171450
        mmWidth = 4763
        BandType = 4
      end
      object LblAceite2: TppLabel
        UserName = 'LblAceite2'
        Caption = 'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3440
        mmLeft = 83344
        mmTop = 167482
        mmWidth = 2117
        BandType = 4
      end
      object RptBarrasBBLabel32: TppLabel
        UserName = 'RptBarrasBBLabel32'
        Caption = 'FICHA DE COMPENSAÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 148432
        mmTop = 236538
        mmWidth = 35983
        BandType = 4
      end
      object RptBarrasBBLine24: TppLine
        UserName = 'RptBarrasBBLine24'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 59531
        mmTop = 32544
        mmWidth = 38100
        BandType = 4
      end
      object RptBarrasBBLine25: TppLine
        UserName = 'RptBarrasBBLine25'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 80698
        mmTop = 25929
        mmWidth = 11906
        BandType = 4
      end
      object RptBarrasBBLine26: TppLine
        UserName = 'RptBarrasBBLine26'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 59796
        mmTop = 26194
        mmWidth = 21167
        BandType = 4
      end
      object RptBarrasBBLine27: TppLine
        UserName = 'RptBarrasBBLine27'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12700
        mmLeft = 2117
        mmTop = 26194
        mmWidth = 27781
        BandType = 4
      end
      object RptBarrasBBLine28: TppLine
        UserName = 'RptBarrasBBLine28'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 19579
        mmWidth = 135202
        BandType = 4
      end
      object LblNomeBanco1: TppLabel
        UserName = 'LblNomeBanco1'
        Caption = 'BANCO DO BRASIL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde Bk BT'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 7938
        mmTop = 6879
        mmWidth = 38894
        BandType = 4
      end
      object LblNumBanco1: TppLabel
        UserName = 'LblNumBanco1'
        Caption = '001-9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde Bk BT'
        Font.Size = 16
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 6615
        mmLeft = 49213
        mmTop = 6615
        mmWidth = 15875
        BandType = 4
      end
      object RptBarrasBBLine30: TppLine
        UserName = 'RptBarrasBBLine30'
        Pen.Width = 2
        Position = lpRight
        Weight = 1.5
        mmHeight = 5821
        mmLeft = 47096
        mmTop = 6879
        mmWidth = 1588
        BandType = 4
      end
      object RptBarrasBBLine31: TppLine
        UserName = 'RptBarrasBBLine31'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1588
        mmLeft = 0
        mmTop = 11906
        mmWidth = 185473
        BandType = 4
      end
      object RptBarrasBBLine32: TppLine
        UserName = 'RptBarrasBBLine32'
        Pen.Width = 2
        Position = lpRight
        Weight = 1.5
        mmHeight = 5821
        mmLeft = 64823
        mmTop = 6879
        mmWidth = 1588
        BandType = 4
      end
      object RptBarrasBBLine33: TppLine
        UserName = 'RptBarrasBBLine33'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 13494
        mmWidth = 135202
        BandType = 4
      end
      object RptBarrasBBLine34: TppLine
        UserName = 'RptBarrasBBLine34'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 26194
        mmWidth = 135202
        BandType = 4
      end
      object RptBarrasBBLine35: TppLine
        UserName = 'RptBarrasBBLine35'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 0
        mmTop = 32544
        mmWidth = 135202
        BandType = 4
      end
      object RptBarrasBBLine37: TppLine
        UserName = 'RptBarrasBBLine37'
        Pen.Width = 2
        ParentWidth = True
        Position = lpBottom
        Weight = 1.5
        mmHeight = 15081
        mmLeft = 0
        mmTop = 105569
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine38: TppLine
        UserName = 'RptBarrasBBLine38'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 49742
        mmTop = 122238
        mmWidth = 132821
        BandType = 4
      end
      object RptBarrasBBLabel36: TppLabel
        UserName = 'RptBarrasBBLabel36'
        Caption = ' Autenticação Mecânica '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 104246
        mmTop = 121444
        mmWidth = 21696
        BandType = 4
      end
      object RptBarrasBBLine40: TppLine
        UserName = 'RptBarrasBBLine40'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 134938
        mmTop = 69321
        mmWidth = 50271
        BandType = 4
      end
      object RptBarrasBBLabel37: TppLabel
        UserName = 'RptBarrasBBLabel37'
        Caption = 'Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 136261
        mmTop = 49742
        mmWidth = 10054
        BandType = 4
      end
      object RptBarrasBBLabel39: TppLabel
        UserName = 'RptBarrasBBLabel39'
        Caption = 'Nosso Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 56092
        mmWidth = 13229
        BandType = 4
      end
      object RptBarrasBBLabel40: TppLabel
        UserName = 'RptBarrasBBLabel40'
        Caption = '( = ) Valor do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 62706
        mmWidth = 22225
        BandType = 4
      end
      object RptBarrasBBLabel41: TppLabel
        UserName = 'RptBarrasBBLabel41'
        Caption = '( - ) Desconto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 69321
        mmWidth = 12435
        BandType = 4
      end
      object RptBarrasBBLabel43: TppLabel
        UserName = 'RptBarrasBBLabel43'
        Caption = '( + ) Mora / Multa / Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 82286
        mmWidth = 22490
        BandType = 4
      end
      object RptBarrasBBLabel44: TppLabel
        UserName = 'RptBarrasBBLabel44'
        Caption = '( + ) Outros Acréscimos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 88636
        mmWidth = 21431
        BandType = 4
      end
      object RptBarrasBBLabel45: TppLabel
        UserName = 'RptBarrasBBLabel45'
        Caption = '( = ) Valor Cobrado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 2910
        mmLeft = 135996
        mmTop = 95515
        mmWidth = 17463
        BandType = 4
      end
      object RptBarrasBBLabel46: TppLabel
        UserName = 'RptBarrasBBLabel46'
        Caption = 'Código de baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 148432
        mmTop = 116152
        mmWidth = 14288
        BandType = 4
      end
      object RptBarrasBBLabel47: TppLabel
        UserName = 'RptBarrasBBLabel47'
        Caption = '5593'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 179123
        mmTop = 115359
        mmWidth = 6350
        BandType = 4
      end
      object RptBarrasBBLabel48: TppLabel
        UserName = 'RptBarrasBBLabel48'
        Caption = 'Sacado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 102923
        mmWidth = 7144
        BandType = 4
      end
      object RptBarrasBBLabel49: TppLabel
        UserName = 'RptBarrasBBLabel49'
        Caption = 'Sacador/Avalista:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 116417
        mmWidth = 15610
        BandType = 4
      end
      object RptBarrasBBLabel50: TppLabel
        UserName = 'RptBarrasBBLabel50'
        Caption = 'Instruções:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 38894
        mmWidth = 9790
        BandType = 4
      end
      object RptBarrasBBLabel51: TppLabel
        UserName = 'RptBarrasBBLabel51'
        Caption = '( Texto de Responsabilidade do Cedente )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold, fsItalic]
        mmHeight = 2646
        mmLeft = 14023
        mmTop = 38894
        mmWidth = 41010
        BandType = 4
      end
      object RptBarrasBBLabel52: TppLabel
        UserName = 'RptBarrasBBLabel52'
        Caption = 'Local de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 13494
        mmWidth = 17463
        BandType = 4
      end
      object RptBarrasBBLabel53: TppLabel
        UserName = 'RptBarrasBBLabel53'
        Caption = 'Cedente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 19844
        mmWidth = 7408
        BandType = 4
      end
      object RptBarrasBBLabel54: TppLabel
        UserName = 'RptBarrasBBLabel54'
        Caption = 'Data do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 26194
        mmWidth = 17198
        BandType = 4
      end
      object RptBarrasBBLabel55: TppLabel
        UserName = 'RptBarrasBBLabel55'
        Caption = 'Nº  da Conta/Respo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 32544
        mmWidth = 17727
        BandType = 4
      end
      object RptBarrasBBLine44: TppLine
        UserName = 'RptBarrasBBLine44'
        Position = lpRight
        Weight = 0.75
        mmHeight = 12700
        mmLeft = 29898
        mmTop = 26194
        mmWidth = 29898
        BandType = 4
      end
      object RptBarrasBBLabel56: TppLabel
        UserName = 'RptBarrasBBLabel56'
        Caption = 'Nº do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 30163
        mmTop = 26194
        mmWidth = 15346
        BandType = 4
      end
      object RptBarrasBBLine45: TppLine
        UserName = 'RptBarrasBBLine45'
        Position = lpRight
        Weight = 0.75
        mmHeight = 6350
        mmLeft = 30163
        mmTop = 32279
        mmWidth = 18256
        BandType = 4
      end
      object RptBarrasBBLabel57: TppLabel
        UserName = 'RptBarrasBBLabel57'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 30163
        mmTop = 32544
        mmWidth = 7408
        BandType = 4
      end
      object RptBarrasBBLabel58: TppLabel
        UserName = 'RptBarrasBBLabel58'
        Caption = 'Espécie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 48948
        mmTop = 32544
        mmWidth = 7144
        BandType = 4
      end
      object RptBarrasBBLabel59: TppLabel
        UserName = 'RptBarrasBBLabel59'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 60325
        mmTop = 32544
        mmWidth = 10054
        BandType = 4
      end
      object RptBarrasBBLabel60: TppLabel
        UserName = 'RptBarrasBBLabel60'
        Caption = 'Espécie Doc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 60590
        mmTop = 26194
        mmWidth = 11377
        BandType = 4
      end
      object RptBarrasBBLabel61: TppLabel
        UserName = 'RptBarrasBBLabel61'
        Caption = 'Aceite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 81492
        mmTop = 26194
        mmWidth = 5556
        BandType = 4
      end
      object RptBarrasBBLabel62: TppLabel
        UserName = 'RptBarrasBBLabel62'
        Caption = 'Data do Processamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 93134
        mmTop = 26194
        mmWidth = 20902
        BandType = 4
      end
      object RptBarrasBBLabel63: TppLabel
        UserName = 'RptBarrasBBLabel63'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 98425
        mmTop = 32544
        mmWidth = 4763
        BandType = 4
      end
      object LblAceite1: TppLabel
        UserName = 'LblAceite1'
        Caption = 'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 85461
        mmTop = 28575
        mmWidth = 3440
        BandType = 4
      end
      object RptBarrasBBLabel65: TppLabel
        UserName = 'RptBarrasBBLabel65'
        Caption = 'RECIBO DO SACADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3440
        mmLeft = 153988
        mmTop = 8202
        mmWidth = 28840
        BandType = 4
      end
      object RptBarrasBBLine46: TppLine
        UserName = 'RptBarrasBBLine46'
        Pen.Style = psDash
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 142346
        mmWidth = 185300
        BandType = 4
      end
      object RptBarrasBBLine47: TppLine
        UserName = 'RptBarrasBBLine47'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 8996
        mmLeft = 49477
        mmTop = 122238
        mmWidth = 2117
        BandType = 4
      end
      object RptBarrasBBDBText1: TppDBText
        UserName = 'RptBarrasBBDBText1'
        AutoSize = True
        DataField = 'DATAPROGRAMADA'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 139436
        mmTop = 52388
        mmWidth = 28046
        BandType = 4
      end
      object RptBarrasBBCalc1: TppCalc
        UserName = 'RptBarrasBBCalc1'
        CustomType = dtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 107156
        mmTop = 28575
        mmWidth = 14288
        BandType = 4
      end
      object RptBarrasBBDBText2: TppDBText
        UserName = 'RptBarrasBBDBText2'
        AutoSize = True
        DataField = 'rSaldo'
        DataPipeline = PpDados
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 139436
        mmTop = 65088
        mmWidth = 8731
        BandType = 4
      end
      object RptBarrasBBDBText4: TppDBText
        UserName = 'RptBarrasBBDBText4'
        AutoSize = True
        DataField = 'DATAEMISSAO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 4763
        mmTop = 28575
        mmWidth = 20373
        BandType = 4
      end
      object RptBarrasBBDBText5: TppDBText
        UserName = 'RptBarrasBBDBText5'
        DataField = 'NODOCUMENTO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 30163
        mmTop = 28575
        mmWidth = 21960
        BandType = 4
      end
      object RptBarrasBBDBText6: TppDBText
        UserName = 'RptBarrasBBDBText6'
        DataField = 'COMPLDOCUMENTO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 52388
        mmTop = 28575
        mmWidth = 6879
        BandType = 4
      end
      object RptBarrasBBLabel35: TppLabel
        UserName = 'RptBarrasBBLabel35'
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 96573
        mmTop = 33867
        mmWidth = 1852
        BandType = 4
      end
      object RptBarrasBBLabel38: TppLabel
        UserName = 'RptBarrasBBLabel38'
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 94456
        mmTop = 172773
        mmWidth = 1852
        BandType = 4
      end
      object RptBarrasBBLabel66: TppLabel
        UserName = 'RptBarrasBBLabel66'
        Caption = 'Pagável Na Rede Bancária Até o Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 16404
        mmWidth = 57415
        BandType = 4
      end
      object LblCarteira1: TppLabel
        UserName = 'LblCarteira1'
        Caption = '16-019'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 35190
        mmTop = 35190
        mmWidth = 8731
        BandType = 4
      end
      object RptBarrasBBDBText3: TppDBText
        UserName = 'RptBarrasBBDBText3'
        DataField = 'MOESIGLA'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 49213
        mmTop = 34925
        mmWidth = 9260
        BandType = 4
      end
      object RptBarrasBBDBText7: TppDBText
        UserName = 'RptBarrasBBDBText7'
        AutoSize = True
        DataField = 'rSaldoOutraMoeda'
        DataPipeline = PpDados
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 61383
        mmTop = 35190
        mmWidth = 24871
        BandType = 4
      end
      object RptBarrasBBLabel69: TppLabel
        UserName = 'RptBarrasBBLabel69'
        Caption = 'Recebimento através do cheque Nº'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 90488
        mmWidth = 30956
        BandType = 4
      end
      object RptBarrasBBLabel70: TppLabel
        UserName = 'RptBarrasBBLabel70'
        Caption = 'do banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 93398
        mmWidth = 7938
        BandType = 4
      end
      object RptBarrasBBLabel71: TppLabel
        UserName = 'RptBarrasBBLabel71'
        Caption = 
          'Esta quitação só terá validade após o pagamento do cheque pelo b' +
          'anco sacado.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsItalic]
        mmHeight = 2910
        mmLeft = 2117
        mmTop = 96309
        mmWidth = 69586
        BandType = 4
      end
      object RptBarrasBBDBText17: TppDBText
        UserName = 'RptBarrasBBDBText17'
        DataField = 'NOME'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 105834
        mmWidth = 93663
        BandType = 4
      end
      object RptBarrasBBDBText18: TppDBText
        UserName = 'RptBarrasBBDBText18'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 116681
        mmTop = 105834
        mmWidth = 61913
        BandType = 4
      end
      object RptBarrasBBLabel72: TppLabel
        UserName = 'RptBarrasBBLabel72'
        Caption = 'C.G.C \ CPF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 99219
        mmTop = 105834
        mmWidth = 16669
        BandType = 4
      end
      object RptBarrasBBDBText19: TppDBText
        UserName = 'RptBarrasBBDBText19'
        DataField = 'LOGRADOURO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 109538
        mmWidth = 89165
        BandType = 4
      end
      object RptBarrasBBDBText20: TppDBText
        UserName = 'RptBarrasBBDBText20'
        DataField = 'NUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 93927
        mmTop = 109538
        mmWidth = 11906
        BandType = 4
      end
      object RptBarrasBBDBText21: TppDBText
        UserName = 'RptBarrasBBDBText21'
        DataField = 'COMPLEMENTO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 106892
        mmTop = 109538
        mmWidth = 26458
        BandType = 4
      end
      object RptBarrasBBDBText22: TppDBText
        UserName = 'RptBarrasBBDBText22'
        DataField = 'BAIRRO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 3704
        mmTop = 113242
        mmWidth = 41540
        BandType = 4
      end
      object RptBarrasBBDBText23: TppDBText
        UserName = 'RptBarrasBBDBText23'
        DataField = 'CIDADE'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 47625
        mmTop = 113242
        mmWidth = 41540
        BandType = 4
      end
      object RptBarrasBBDBText24: TppDBText
        UserName = 'RptBarrasBBDBText24'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 90223
        mmTop = 113242
        mmWidth = 5556
        BandType = 4
      end
      object RptBarrasBBDBText25: TppDBText
        UserName = 'RptBarrasBBDBText25'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 118269
        mmTop = 113242
        mmWidth = 17727
        BandType = 4
      end
      object RptBarrasBBDBText26: TppDBText
        UserName = 'RptBarrasBBDBText26'
        DataField = 'NOME'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 211667
        mmWidth = 93663
        BandType = 4
      end
      object RptBarrasBBDBText27: TppDBText
        UserName = 'RptBarrasBBDBText27'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 120915
        mmTop = 211667
        mmWidth = 61913
        BandType = 4
      end
      object RptBarrasBBLabel73: TppLabel
        UserName = 'RptBarrasBBLabel73'
        Caption = 'C.G.C \ CPF:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 103452
        mmTop = 211667
        mmWidth = 16669
        BandType = 4
      end
      object RptBarrasBBDBText28: TppDBText
        UserName = 'RptBarrasBBDBText28'
        DataField = 'LOGRADOURO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 215371
        mmWidth = 89165
        BandType = 4
      end
      object RptBarrasBBDBText29: TppDBText
        UserName = 'RptBarrasBBDBText29'
        DataField = 'NUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 98161
        mmTop = 215371
        mmWidth = 11906
        BandType = 4
      end
      object RptBarrasBBDBText30: TppDBText
        UserName = 'RptBarrasBBDBText30'
        DataField = 'COMPLEMENTO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 111125
        mmTop = 215371
        mmWidth = 26458
        BandType = 4
      end
      object RptBarrasBBDBText31: TppDBText
        UserName = 'RptBarrasBBDBText31'
        DataField = 'BAIRRO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 219075
        mmWidth = 41540
        BandType = 4
      end
      object RptBarrasBBDBText32: TppDBText
        UserName = 'RptBarrasBBDBText32'
        DataField = 'CIDADE'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 51858
        mmTop = 219075
        mmWidth = 41540
        BandType = 4
      end
      object RptBarrasBBDBText33: TppDBText
        UserName = 'RptBarrasBBDBText33'
        AutoSize = True
        DataField = 'CEP'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 94456
        mmTop = 219075
        mmWidth = 5556
        BandType = 4
      end
      object RptBarrasBBDBText34: TppDBText
        UserName = 'RptBarrasBBDBText34'
        AutoSize = True
        DataField = 'CODESTADO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 122502
        mmTop = 219075
        mmWidth = 17727
        BandType = 4
      end
      object RptBarrasBBLabel74: TppLabel
        UserName = 'RptBarrasBBLabel74'
        Caption = 'Pagável Na Rede Bancária Até o Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 155311
        mmWidth = 57415
        BandType = 4
      end
      object LblEmpresa2: TppLabel
        UserName = 'LblEmpresa2'
        Caption = 'Empresa Proprietária do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 161132
        mmWidth = 48154
        BandType = 4
      end
      object RptBarrasBBDBText40: TppDBText
        UserName = 'RptBarrasBBDBText40'
        AutoSize = True
        DataField = 'DATAEMISSAO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 167482
        mmWidth = 20373
        BandType = 4
      end
      object RptBarrasBBDBText41: TppDBText
        UserName = 'RptBarrasBBDBText41'
        DataField = 'NODOCUMENTO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 167482
        mmWidth = 21960
        BandType = 4
      end
      object RptBarrasBBDBText42: TppDBText
        UserName = 'RptBarrasBBDBText42'
        DataField = 'COMPLDOCUMENTO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 50271
        mmTop = 167482
        mmWidth = 7144
        BandType = 4
      end
      object LblCarteira2: TppLabel
        UserName = 'LblCarteira2'
        Caption = '16-019'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 32544
        mmTop = 174096
        mmWidth = 8996
        BandType = 4
      end
      object RptBarrasBBDBText43: TppDBText
        UserName = 'RptBarrasBBDBText43'
        DataField = 'MOESIGLA'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3704
        mmLeft = 46567
        mmTop = 173832
        mmWidth = 9260
        BandType = 4
      end
      object RptBarrasBBDBText44: TppDBText
        UserName = 'RptBarrasBBDBText44'
        AutoSize = True
        DataField = 'rSaldoOutraMoeda'
        DataPipeline = PpDados
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 58738
        mmTop = 174096
        mmWidth = 24871
        BandType = 4
      end
      object RptBarrasBBCalc2: TppCalc
        UserName = 'RptBarrasBBCalc2'
        CustomType = dtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 104511
        mmTop = 167482
        mmWidth = 14288
        BandType = 4
      end
      object RptBarrasBBDBText45: TppDBText
        UserName = 'RptBarrasBBDBText45'
        AutoSize = True
        DataField = 'DATAPROGRAMADA'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 139700
        mmTop = 154782
        mmWidth = 28046
        BandType = 4
      end
      object RptBarrasBBDBText46: TppDBText
        UserName = 'RptBarrasBBDBText46'
        AutoSize = True
        DataField = 'rSaldo'
        DataPipeline = PpDados
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 139700
        mmTop = 174096
        mmWidth = 8731
        BandType = 4
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'Empresa Proprietária do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 21960
        mmWidth = 48154
        BandType = 4
      end
      object RptBarrasBBDBText47: TppDBText
        UserName = 'RptBarrasBBDBText47'
        AutoSize = True
        DataField = 'NOSSONUMERO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 139436
        mmTop = 58738
        mmWidth = 22225
        BandType = 4
      end
      object RptBarrasBBDBText48: TppDBText
        UserName = 'RptBarrasBBDBText48'
        AutoSize = True
        DataField = 'NOSSONUMERO'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 139700
        mmTop = 167482
        mmWidth = 22225
        BandType = 4
      end
      object RptBarrasBBDBText49: TppDBText
        UserName = 'RptBarrasBBDBText49'
        AutoSize = True
        DataField = 'CODBARRADIG'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'AvantGarde Bk BT'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 4233
        mmLeft = 66411
        mmTop = 146315
        mmWidth = 25135
        BandType = 4
      end
      object Barras: TppDBBarCode
        UserName = 'Barras'
        AutoSizeFont = False
        BarCodeType = bcInt2of5
        BarColor = clWindowText
        CalcCheckDigit = False
        DataField = 'CODBARRA'
        DataPipeline = PpDados
        PrintHumanReadable = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 12965
        mmLeft = 1852
        mmTop = 227542
        mmWidth = 11113
        BandType = 4
        mmBarWidth = 381
        mmWideBarRatio = 2000
      end
      object RptBarrasBBLine51: TppLine
        UserName = 'RptBarrasBBLine51'
        Pen.Style = psDash
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 243946
        mmWidth = 185300
        BandType = 4
      end
      object ImgLogo1: TppImage
        UserName = 'ImgLogo1'
        MaintainAspectRatio = False
        Stretch = True
        Transparent = True
        Picture.Data = {
          07544269746D617022040000424D22040000000000003E000000280000004800
          0000530000000100010000000000E40300000000000000000000020000000200
          000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFF7FFFFFFFF000000F9FFFFFFE3FFFFFFFF00
          0000F8FFFFFFC0FFFFFFFF000000F87FFFFF007FFFFFFF000000F83FFFFE003F
          FFFFFF000000F807FFF8000FFFFFFF000000F803FFF00003FFFFFF000000F801
          FFC00001FFFFFF000000F800FF800000FFFFFF000000FC003E0000003FFFFF00
          0000FE003C001C000FFFFF000000FF80F0003F0007FFFF000000FFC1E0007F80
          03FFFF000000FFE38001FFC001FFFF000000FFFF0007FFF0007FFF000000FFFC
          000FFFF8001FFF000000FFF8001FFFF80007FF000000FFF0003FFFF00003FF00
          0000FFC000F1FFC00001FF000000FF8003C07F8000007F000000FE0007803E00
          00003F000000FC000F001E0000001F000000FE000700078000001F000000FF00
          038003C000003F000000FFC001E000F00000FF000000FFE0007800380003FF00
          0000FFF8003C001E0007FF000000FFFC003E000F000FFF000000FFFE00FF0003
          801FFF000000FFFF83C3C001E07FFF000000FFFFC700F00078FFFF000000FFFF
          FE0078003FFFFF000000FFFFFC003C000FFFFF000000FFFFFC000F000FFFFF00
          0000FFFFFF0003803FFFFF000000FFFFC38001E070FFFF000000FFFF01C00070
          E07FFF000000FFFF00E0007B801FFF000000FFFC0078001F000FFF000000FFF8
          001E000F0007FF000000FFE0000F4003C001FF000000FFC000038001E000FF00
          0000FF000001E00070003F000000FE00000070003C001F000000FE0000003C00
          3C001F000000FF0000003F0070003F000000FF8000003F80E0007F000000FFC0
          0000FFC1C000FF000000FFF00001FFF70003FF000000FFF80003FFFE0007FF00
          0000FFFE0003FFFC000FFF000000FFFF0003FFF8003FFF000000FFFFC000FFE0
          0071FF000000FFFFE0007FC001E0FF000000FFFFF8001F0003C03F000000FFFF
          FC000C000F001F000000FFFFFE0000001F000F000000FFFFFF8000003F800F00
          0000FFFFFFC00000FFE007000000FFFFFFF00001FFF007000000FFFFFFF80007
          FFFC07000000FFFFFFFC000FFFFE07000000FFFFFFFF001FFFFF07000000FFFF
          FFFF807FFFFFC7000000FFFFFFFFE0FFFFFFE7000000FFFFFFFFF3FFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000}
        mmHeight = 8731
        mmLeft = 0
        mmTop = 3440
        mmWidth = 7408
        BandType = 4
      end
      object ImgLogo2: TppImage
        UserName = 'ImgLogo2'
        MaintainAspectRatio = False
        Stretch = True
        Transparent = True
        Picture.Data = {
          07544269746D617022040000424D22040000000000003E000000280000004800
          0000530000000100010000000000E40300000000000000000000020000000200
          000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFF7FFFFFFFF000000F9FFFFFFE3FFFFFFFF00
          0000F8FFFFFFC0FFFFFFFF000000F87FFFFF007FFFFFFF000000F83FFFFE003F
          FFFFFF000000F807FFF8000FFFFFFF000000F803FFF00003FFFFFF000000F801
          FFC00001FFFFFF000000F800FF800000FFFFFF000000FC003E0000003FFFFF00
          0000FE003C001C000FFFFF000000FF80F0003F0007FFFF000000FFC1E0007F80
          03FFFF000000FFE38001FFC001FFFF000000FFFF0007FFF0007FFF000000FFFC
          000FFFF8001FFF000000FFF8001FFFF80007FF000000FFF0003FFFF00003FF00
          0000FFC000F1FFC00001FF000000FF8003C07F8000007F000000FE0007803E00
          00003F000000FC000F001E0000001F000000FE000700078000001F000000FF00
          038003C000003F000000FFC001E000F00000FF000000FFE0007800380003FF00
          0000FFF8003C001E0007FF000000FFFC003E000F000FFF000000FFFE00FF0003
          801FFF000000FFFF83C3C001E07FFF000000FFFFC700F00078FFFF000000FFFF
          FE0078003FFFFF000000FFFFFC003C000FFFFF000000FFFFFC000F000FFFFF00
          0000FFFFFF0003803FFFFF000000FFFFC38001E070FFFF000000FFFF01C00070
          E07FFF000000FFFF00E0007B801FFF000000FFFC0078001F000FFF000000FFF8
          001E000F0007FF000000FFE0000F4003C001FF000000FFC000038001E000FF00
          0000FF000001E00070003F000000FE00000070003C001F000000FE0000003C00
          3C001F000000FF0000003F0070003F000000FF8000003F80E0007F000000FFC0
          0000FFC1C000FF000000FFF00001FFF70003FF000000FFF80003FFFE0007FF00
          0000FFFE0003FFFC000FFF000000FFFF0003FFF8003FFF000000FFFFC000FFE0
          0071FF000000FFFFE0007FC001E0FF000000FFFFF8001F0003C03F000000FFFF
          FC000C000F001F000000FFFFFE0000001F000F000000FFFFFF8000003F800F00
          0000FFFFFFC00000FFE007000000FFFFFFF00001FFF007000000FFFFFFF80007
          FFFC07000000FFFFFFFC000FFFFE07000000FFFFFFFF001FFFFF07000000FFFF
          FFFF807FFFFFC7000000FFFFFFFFE0FFFFFFE7000000FFFFFFFFF3FFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          FFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFF
          FFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF00
          0000FFFFFFFFFFFFFFFFFF000000}
        mmHeight = 8731
        mmLeft = 0
        mmTop = 142875
        mmWidth = 7408
        BandType = 4
      end
      object MemMensagem2: TppMemo
        OnPrint = MemMensagem2Print
        UserName = 'MemMensagem2'
        Caption = 'MemMensagem2'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 29633
        mmLeft = 0
        mmTop = 180711
        mmWidth = 134673
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object MemMensagem1: TppMemo
        OnPrint = MemMensagem1Print
        UserName = 'MemMensagem1'
        Caption = 'MemMensagem1'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 47625
        mmLeft = 2117
        mmTop = 42069
        mmWidth = 132821
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object LblEspecieDoc1: TppLabel
        UserName = 'LblEspecieDoc1'
        AutoSize = False
        Caption = 'LblEspecieDoc1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 61119
        mmTop = 28575
        mmWidth = 17727
        BandType = 4
      end
      object LblEspecieDoc2: TppLabel
        UserName = 'LblEspecieDoc2'
        AutoSize = False
        Caption = 'LblEspeciedoc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 59002
        mmTop = 167482
        mmWidth = 17727
        BandType = 4
      end
      object RptModeloDBText1: TppDBText
        UserName = 'RptModeloDBText1'
        AutoSize = True
        DataField = 'AGENCIACODCEDENTE'
        DataPipeline = PpDados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpDados'
        mmHeight = 3175
        mmLeft = 139700
        mmTop = 161132
        mmWidth = 32015
        BandType = 4
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
  end
  object DsgnCM: TppDesigner
    Caption = 'Gerador de Relatórios e Gráficos'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    Report = RptModelo
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 277
    Top = 126
  end
  object qryReports: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '  REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :IDREPORTS) AND'
      '   (REPORTS.ORIGEMCM  = :ORIGEMCM)')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 369
    Top = 10
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDREPORTS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ORIGEMCM'
        ParamType = ptUnknown
      end>
  end
  object qryPortForma: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'Select'
      '  PF.CODPORTFORMA,'
      '  PF.DESCRICAO,'
      '  PF.CODBLOQCHE,'
      '  PF.CODARQUIVOREMESSA,'
      '  PF.NOSSONUMERO,'
      '  PF.JUROSPORDIA,'
      '  PF.PRAZOPROTESTO,'
      '  PF.NUMEMPRESABANCO,'
      '  PF.CONTROLEREMESSA,'
      '  PF.PATHARQUIVOREM,'
      '  PF.IDCONFIGBARRAS'
      'From'
      '  PORTADORFORMA PF')
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 297
    Top = 10
  end
  object SqlBloquete: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CEP,'
      '  CODESTADO,'
      '  CIDADE,'
      '  BAIRRO,'
      '  COMPLEMENTO,'
      '  NUMERO,'
      '  LOGRADOURO,'
      '  NUMDOCUMENTO,'
      '  NOME,'
      '  VALORDESCONTO,'
      '  DATALIMITE,'
      '  DATAPROGRAMADA,'
      '  CODPORTFORMA,'
      '  DATAVENCTO,'
      '  DATAREMESSA,'
      '  EMISBLOQ,'
      '  STATUS,'
      '  DATAEMISSAO,'
      '  DATADOCUMENTO,'
      '  NODOCUMENTO,'
      '  MOESIGLA,'
      '  CODDOCUMENTO,'
      '  TIPO,'
      '  NOSSONUMERO,'
      '  COMPLDOCUMENTO,'
      '  TIPOENDERECO,'
      '  NUMAGENCIA,'
      '  NUMCONTA,'
      '  VALORJUROS,'
      '  VALOR,'
      '  VALOROM,'
      '  FLGGRUPO,'
      '  CODBARRADIG,'
      '  NUMRAZAOCC,'
      '  IDTIPOCLIENTE,'
      '  CODTIPDOC,'
      '  IDUSUARIOINCLUSAO,'
      '  IDMODULO,'
      '  NUMEMPRESABANCO'
      'FROM'
      '   (SELECT'
      '       E.CEP,'
      '       ES.CODESTADO,'
      '       C.NOME AS CIDADE,'
      '       E.BAIRRO,'
      '       E.COMPLEMENTO,'
      '       E.NUMERO,'
      '       E.LOGRADOURO,'
      
        '       DECODE(P.TIPO,'#39'J'#39',DECODE(P.NUMDOCUMENTO,NULL,'#39'00000000000' +
        '000'#39',P.NUMDOCUMENTO),DECODE(P.NUMDOCUMENTO,NULL,'#39'00000000000'#39',P.' +
        'NUMDOCUMENTO)) AS NUMDOCUMENTO,'
      '       P.RAZAOSOCIAL AS NOME,'
      '       D.VALORDESCONTO,'
      '       D.DATALIMITE,'
      '       D.DATAPROGRAMADA,'
      '       D.CODPORTFORMA,'
      '       D.DATAVENCTO,'
      
        '       (to_date(to_char(sysdate,'#39'dd/mm/yyyy'#39'),'#39'dd/mm/yyyy'#39')  ) A' +
        'S DATAEMISSAO,'
      
        '       (to_date(to_char(sysdate,'#39'dd/mm/yyyy'#39'),'#39'dd/mm/yyyy'#39')  ) A' +
        'S DATADOCUMENTO,'
      '       D.NODOCUMENTO,'
      '       M.MOESIGLA,'
      '       D.CODDOCUMENTO,'
      '       P.TIPO,'
      '       D.NOSSONUMERO,'
      '       D.COMPLDOCUMENTO,'
      '       E.TIPOENDERECO,'
      '       AB.NUMAGENCIA,'
      '       PC.NOCONTACORR AS NUMCONTA,'
      '       F.JUROSPORDIA AS VALORJUROS,'
      '       ('#39'N'#39') AS FLGGRUPO,'
      '       SALDO.VALOR,'
      '       SALDO.VALOROM,'
      '       F.NUMRAZAOCC,'
      '       CP.IDTIPOCLIENTE,'
      '       D.CODTIPDOC,'
      '       D.IDMODULO,'
      '       D.EMISBLOQ,'
      '       D.STATUS,'
      '       D.IDUSUARIOINCLUSAO,'
      
        '       ('#39'00186.99595  90309.403922  00152.059168                ' +
        '                      000'#39') AS CODBARRADIG,'
      
        '       (to_date(to_char(sysdate,'#39'dd/mm/yyyy'#39'),'#39'dd/mm/yyyy'#39')  ) A' +
        'S DATAREMESSA,'
      '       F.NUMEMPRESABANCO'
      '   FROM'
      '       (SELECT'
      
        '          D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR * -1,L' +
        '.VALOR)) AS VALOR,'
      
        '          SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA*-1,L.VALOROU' +
        'TRAMOEDA)) AS VALOROM,'
      '       FROM'
      '            LANCTODOCUM L,DOCUMENTO D'
      '             WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '              (D.RECPAG = '#39'R'#39') And (D.IDPESSOA =  :PIDPESSOA)'
      
        '              and              (D.CONTROLEREMESSA IS NULL       ' +
        '          OR'
      '        D.CONTROLEREMESSA = :PCONTROLEREMESSA)  AND'
      '                  (D.EMISBLOQ = :PEMISBLOQ)                  AND'
      '                      ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '       GROUP BY'
      '           D.CODDOCUMENTO'
      '       HAVING'
      
        '          (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR * -1,L.VALOR)) > 0) O' +
        'R'
      
        '          (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA*-1,L.VALORO' +
        'UTRAMOEDA)) > 0)'
      '           ) SALDO,'
      '       DOCUMENTO D,'
      '       PESSOA P,'
      '       ENDPESS E,'
      '       CIDADES C,'
      '       ESTADO ES,'
      '       CLIENTEPESS CP,'
      '       PORTADORFORMA F ,'
      '       MOEDA M,'
      '       AGENCIABANCARIA AB,'
      '       PORTADORCONTA PC,'
      '       MODULO'
      '   WHERE'
      
        ' (d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.' +
        'RECPAG =  '#39'R'#39' and not exists  (select 1 from UsuarioxTpdocto b w' +
        'here b.idusuario=:idusuario and recpag='#39'R'#39') union  SELECT CODTIP' +
        'DOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = '#39'R'#39
      
        '  and exists (select 1 from UsuarioxTpdocto b where a.codtipdoc=' +
        'b.codtipdoc and b.idusuario=:idusuario and recpag='#39'R'#39'))) and    ' +
        '(F.CODPORTFORMA =  :PCODPORTFORMA)         AND'
      '    (D.EMISBLOQ = :PEMISBLOQ)                  AND'
      '    (D.RECPAG = '#39'R'#39')                           AND'
      '    ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))  AND'
      '    (D.IDPESSOA =  :PIDPESSOA)                 AND'
      '    (CP.IDPESSOA = D.IDFORCLI)                 AND'
      '    (D.CODGRUPOCNAB IS NULL)                   AND'
      '    (D.OPERACAO IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'14'#39'))              AND'
      '    (D.IDMODULO = MODULO.IDMODULO)             AND'
      '    (D.CONTROLEREMESSA IS NULL                 OR'
      '     D.CONTROLEREMESSA = :PCONTROLEREMESSA)    AND'
      '    (D.IDFORCLI=P.IDPESSOA)                    AND'
      '    (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)      AND'
      '    (D.MOECODIGO = M.MOECODIGO(+))             AND'
      '    (D.CODPORTFORMA = F.CODPORTFORMA)          AND'
      '    (F.CODPORTADOR = PC.CODPORTADOR(+))        AND'
      '    (PC.IDAGENCIA = AB.IDPESSOA(+))            AND'
      '    (E.IDENDERECO(+) = P.IDENDCOBRANCA)        AND'
      '    (E.IDCIDADES = C.IDCIDADES(+))             AND'
      '    (ES.IDESTADO(+) = C.IDESTADO)'
      'UNION ALL'
      '   SELECT DISTINCT'
      
        '      E.CEP, '#9#9'   ES.CODESTADO, '#9'           C.NOME AS CIDADE, '#9' ' +
        '       E.BAIRRO,'
      '      E.COMPLEMENTO, '#9'   E.NUMERO, '#9#9'           E.LOGRADOURO,'
      
        '      DECODE(P.TIPO,'#39'J'#39',DECODE(P.NUMDOCUMENTO,NULL,'#39'000000000000' +
        '00'#39',P.NUMDOCUMENTO),DECODE(P.NUMDOCUMENTO,NULL,'#39'00000000000'#39',P.N' +
        'UMDOCUMENTO)) AS NUMDOCUMENTO,'
      
        '      P.RAZAOSOCIAL AS NOME, D.VALORDESCONTO , D.DATALIMITE, '#9'D.' +
        'DATAPROGRAMADA,'
      
        '      D.CODPORTFORMA,'#9'   D.DATAVENCTO, '#9#9'   to_date(to_char(sysd' +
        'ate,'#39'dd/mm/yyyy'#39'),'#39'dd/mm/yyyy'#39')  AS DATAEMISSAO,'
      
        '      to_date(to_char(sysdate,'#39'dd/mm/yyyy'#39'),'#39'dd/mm/yyyy'#39')  AS DA' +
        'TADOCUMENTO,'
      
        '      D.CODGRUPOCNAB,   M.MOESIGLA, '#9'   D.CODGRUPOCNAB AS CODDOC' +
        'UMENTO, P.TIPO, '#9#9'D.NOSSONUMERO,'
      
        '      ('#39#39') AS COMPLDOC,    E.TIPOENDERECO,  '#9'           AB.NUMAG' +
        'ENCIA, '#9'PC.NOCONTACORR AS NUMCONTA,'
      
        '      SUM(F.JUROSPORDIA) AS VALORJUROS, ('#39'S'#39') AS FLGGRUPO,      ' +
        ' SUM(SALDO.VALOR), SUM(SALDO.VALOROM),  F.NUMRAZAOCC, CP.IDTIPOC' +
        'LIENTE, D.CODTIPDOC, D.IDMODULO,'
      '      D.EMISBLOQ,'
      '      D.STATUS,'
      '      D.IDUSUARIOINCLUSAO,'
      
        '      ('#39'00186.99595  90309.403922  00152.059168                 ' +
        '                     000'#39') AS CODBARRADIG,'
      
        '      (to_date(to_char(sysdate,'#39'dd/mm/yyyy'#39'),'#39'dd/mm/yyyy'#39')  ) AS' +
        ' DATAREMESSA,'
      '      F.NUMEMPRESABANCO'
      '   FROM'
      '      (SELECT'
      
        '           D.CODDOCUMENTO, SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR * -1,' +
        'L.VALOR)) AS VALOR,'
      
        '           SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA*-1,L.VALORO' +
        'UTRAMOEDA)) AS VALOROM'
      '       FROM'
      '           LANCTODOCUM L   , DOCUMENTO D'
      '       WHERE'
      '           (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '           (D.RECPAG = '#39'R'#39') And'
      '           (D.IDPESSOA =  :PIDPESSOA)'
      
        '           and          (D.CONTROLEREMESSA IS NULL              ' +
        '   OR'
      '        D.CONTROLEREMESSA = :PCONTROLEREMESSA)    AND'
      '               (D.EMISBLOQ = :PEMISBLOQ)                  AND'
      '                ((D.STATUS <> '#39'2'#39') OR (D.STATUS IS NULL))'
      '       GROUP BY'
      '           D.CODDOCUMENTO'
      '       HAVING'
      
        '          (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR * -1,L.VALOR)) > 0) O' +
        'R'
      
        '          (SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOROUTRAMOEDA*-1,L.VALORO' +
        'UTRAMOEDA)) > 0)'
      '           ) SALDO,'
      '       DOCUMENTO D,'
      '       PESSOA P,'
      '       ENDPESS E, CIDADES C, ESTADO ES,'
      '       CLIENTEPESS CP,'
      '       AGENCIABANCARIA AB,'
      '       PORTADORCONTA PC,'
      '       PORTADORFORMA F ,'
      '       MOEDA M,'
      '       MODULO'
      '   WHERE'
      
        ' (d.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG a WHERE a.' +
        'RECPAG =  '#39'R'#39' and not exists  (select 1 from UsuarioxTpdocto b w' +
        'here b.idusuario=:idusuario and recpag='#39'R'#39') union  SELECT CODTIP' +
        'DOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = '#39'R'#39
      
        '  and exists (select 1 from UsuarioxTpdocto b where a.codtipdoc=' +
        'b.codtipdoc and b.idusuario=:idusuario and recpag='#39'R'#39'))) and    ' +
        '  (F.CODPORTFORMA =  :PCODPORTFORMA)         AND'
      '      (D.CODGRUPOCNAB IS NOT NULL)               AND'
      '      (D.RECPAG = '#39'R'#39')                           AND'
      '      ((D.OPERACAO = '#39'2'#39') OR (D.OPERACAO = '#39'3'#39')) AND'
      '      (D.STATUS <> '#39'2'#39')                          AND'
      '      (D.EMISBLOQ = :PEMISBLOQ)                  AND'
      '      (D.IDPESSOA =  :PIDPESSOA)                 AND'
      '      (CP.IDPESSOA = D.IDFORCLI)                 AND'
      '      (D.IDMODULO = MODULO.IDMODULO)             AND'
      '      (D.CONTROLEREMESSA IS NULL                 OR'
      '       D.CONTROLEREMESSA = :PCONTROLEREMESSA)    AND'
      '      (D.IDFORCLI=P.IDPESSOA)                    AND'
      '      (D.CODDOCUMENTO = SALDO.CODDOCUMENTO)      AND'
      '      (D.MOECODIGO = M.MOECODIGO(+))             AND'
      '      (D.CODPORTFORMA = F.CODPORTFORMA)          AND'
      '      (F.CODPORTADOR = PC.CODPORTADOR(+))        AND'
      '      (PC.IDAGENCIA = AB.IDPESSOA(+))            AND'
      '      (E.IDENDERECO(+) = P.IDENDCOBRANCA)        AND'
      '       d.CodDocumento = :coddocumento and'
      '      (E.IDCIDADES = C.IDCIDADES(+))             AND'
      '      (ES.IDESTADO(+) = C.IDESTADO)'
      '   GROUP BY'
      '       D.CODGRUPOCNAB,'
      '       E.CEP, ES.CODESTADO, C.NOME, E.BAIRRO,'
      '       E.COMPLEMENTO, E.NUMERO, E.LOGRADOURO, NUMDOCUMENTO,'
      
        '       P.RAZAOSOCIAL, D.VALORDESCONTO, D.DATALIMITE, D.DATAPROGR' +
        'AMADA,'
      '       D.CODPORTFORMA, D.DATAVENCTO,'
      '       M.MOESIGLA, P.TIPO, D.NOSSONUMERO,'
      
        '       E.TIPOENDERECO,  AB.NUMAGENCIA, PC.NOCONTACORR, F.JUROSPO' +
        'RDIA,'
      '       F.NUMRAZAOCC, CP.IDTIPOCLIENTE, D.CODTIPDOC, D.IDMODULO,'
      '       D.IDUSUARIOINCLUSAO,'
      '       D.EMISBLOQ, D.STATUS, F.NUMEMPRESABANCO)'
      'ORDER BY FLGGRUPO, NODOCUMENTO'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = CdsBloquete
    Left = 368
    Top = 89
  end
  object CdsBloquete: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 137
  end
  object CdsDadosCedente: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 216
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 73
  end
  object SqlAux: TCMSqlParams
    ClientDataSet = CdsAux
    Left = 28
    Top = 92
  end
  object qryModelo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDCONFIGBARRAS, DESCCONFIGBARRAS, CARTEIRACOBR,'
      '  IDREPORTS, ORIGEMCM, NUMEROBANCO, CODMOEDA, TAMNOSSONUMERO'
      'FROM '
      '  CONFIGBARRAS '
      'WHERE'
      '  IDCONFIGBARRAS = :iIdConfigBarra'
      '')
    ValidateWithMask = True
    Left = 228
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'iIdConfigBarra'
        ParamType = ptUnknown
      end>
  end
end
