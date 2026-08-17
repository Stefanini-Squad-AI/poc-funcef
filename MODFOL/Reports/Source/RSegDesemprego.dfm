inherited RptSegDesemprego: TRptSegDesemprego
  Left = 212
  Top = 176
  Width = 315
  Height = 283
  Caption = 'RptSegDesemprego'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpSegDesemprego
  end
  object rpSegDesemprego: TppReport
    AutoStop = False
    DataPipeline = ppSegDesemprego
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Seguro Desemprego'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 0
    PrinterSetup.mmMarginLeft = 0
    PrinterSetup.mmMarginRight = 0
    PrinterSetup.mmMarginTop = 0
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 224
    Top = 8
    Version = '7.04'
    mmColumnWidth = 210000
    DataPipelineName = 'ppSegDesemprego'
    object rpCompSaldoDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 286015
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'EMPREGADO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 21960
        mmTop = 34131
        mmWidth = 181000
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MAE'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 21960
        mmTop = 46038
        mmWidth = 181000
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ENDERECO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 21960
        mmTop = 58208
        mmWidth = 180975
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'COMPLEMENTO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 21960
        mmTop = 70644
        mmWidth = 73000
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PIS'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 21960
        mmTop = 84931
        mmWidth = 50000
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TIPO_INSC_EMPRESA'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 45773
        mmTop = 103188
        mmWidth = 4000
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'CBO1'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 21960
        mmTop = 117475
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'ADMISSAO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 21960
        mmTop = 138113
        mmWidth = 27000
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'MES_ANTEPENULT_SALARIO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 22490
        mmTop = 151342
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'SOMA_3_ULT_SAL'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 21960
        mmTop = 164836
        mmWidth = 45000
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'RECEB_SAL_6_MESES'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 61913
        mmTop = 175684
        mmWidth = 5027
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'PIS'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 20373
        mmTop = 242623
        mmWidth = 50006
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'EMPREGADO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 20373
        mmTop = 252942
        mmWidth = 179917
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'LOCAL_DATA'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 20373
        mmTop = 279401
        mmWidth = 91811
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'ESTABELECIMENTO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 76200
        mmTop = 259292
        mmWidth = 125677
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'CEP1'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 98954
        mmTop = 70644
        mmWidth = 23000
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'CEP2'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 125942
        mmTop = 70644
        mmWidth = 14000
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'UF'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 143934
        mmTop = 70644
        mmWidth = 9000
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'TELEFONE'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 157957
        mmTop = 70644
        mmWidth = 44979
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'CTPS1'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 84931
        mmTop = 84931
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText201'
        DataField = 'CTPS2'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 116946
        mmTop = 84931
        mmWidth = 14000
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText202'
        DataField = 'CTPS_UF'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 130969
        mmTop = 84931
        mmWidth = 9000
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText203'
        DataField = 'CPF'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 152929
        mmTop = 84931
        mmWidth = 50000
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'INSC_EMPRESA'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 53446
        mmTop = 103188
        mmWidth = 62971
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText204'
        DataField = 'CNAE'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 126471
        mmTop = 103188
        mmWidth = 23000
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'CBO2'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 49477
        mmTop = 117475
        mmWidth = 5000
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'OCUPACAO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 54504
        mmTop = 117475
        mmWidth = 95000
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'DEMISSAO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 57944
        mmTop = 138113
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'DBText29'
        DataField = 'SEXO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 112977
        mmTop = 138113
        mmWidth = 5000
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'DBText30'
        DataField = 'GRAU_INSTRUCAO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 135732
        mmTop = 138113
        mmWidth = 5000
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'NASCIMENTO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 147902
        mmTop = 138113
        mmWidth = 27000
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBText32'
        DataField = 'HORA_TRAB_SEMANA'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 184944
        mmTop = 138113
        mmWidth = 9000
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText33'
        DataField = 'ANTEPENULT_SALARIO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 34396
        mmTop = 151342
        mmWidth = 45000
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'MES_PENULT_SALARIO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 84402
        mmTop = 151342
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText35'
        DataField = 'PENULT_SALARIO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 96309
        mmTop = 151342
        mmWidth = 45000
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText36'
        DataField = 'MES_ULT_SALARIO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 146315
        mmTop = 151342
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText37'
        DataField = 'ULT_SALARIO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 158486
        mmTop = 151342
        mmWidth = 45000
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'DBText101'
        DataField = 'N_BANCO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 83873
        mmTop = 164836
        mmWidth = 14000
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'DBText102'
        DataField = 'N_AGENCIA1'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 97896
        mmTop = 164836
        mmWidth = 18000
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'DBText103'
        DataField = 'N_AGENCIA2'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 120915
        mmTop = 164836
        mmWidth = 3969
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'DBText104'
        DataField = 'QUANT_TRAB_36MESES'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 193940
        mmTop = 164836
        mmWidth = 8996
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        DataField = 'AVISO_PREVIO'
        DataPipeline = ppSegDesemprego
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Lucida Console'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppSegDesemprego'
        mmHeight = 3440
        mmLeft = 119856
        mmTop = 175684
        mmWidth = 5027
        BandType = 4
      end
    end
  end
  object ppSegDesemprego: TppBDEPipeline
    DataSource = dsSegDesemprego
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'SegDesemprego'
    Left = 224
    Top = 56
    object ppSegDesempregoppField1: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField2: TppField
      FieldAlias = 'MAE'
      FieldName = 'MAE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField3: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField4: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField5: TppField
      FieldAlias = 'CEP1'
      FieldName = 'CEP1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField6: TppField
      FieldAlias = 'CEP2'
      FieldName = 'CEP2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField7: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField8: TppField
      FieldAlias = 'TELEFONE'
      FieldName = 'TELEFONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField9: TppField
      FieldAlias = 'PIS'
      FieldName = 'PIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField10: TppField
      FieldAlias = 'CTPS1'
      FieldName = 'CTPS1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField11: TppField
      FieldAlias = 'CTPS2'
      FieldName = 'CTPS2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField12: TppField
      FieldAlias = 'CTPS_UF'
      FieldName = 'CTPS_UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField13: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField14: TppField
      FieldAlias = 'TIPO_INSC_EMPRESA'
      FieldName = 'TIPO_INSC_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField15: TppField
      FieldAlias = 'INSC_EMPRESA'
      FieldName = 'INSC_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField16: TppField
      FieldAlias = 'CNAE'
      FieldName = 'CNAE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField17: TppField
      FieldAlias = 'CBO1'
      FieldName = 'CBO1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField18: TppField
      FieldAlias = 'CBO2'
      FieldName = 'CBO2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField19: TppField
      FieldAlias = 'OCUPACAO'
      FieldName = 'OCUPACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField20: TppField
      FieldAlias = 'ADMISSAO'
      FieldName = 'ADMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField21: TppField
      FieldAlias = 'DEMISSAO'
      FieldName = 'DEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField22: TppField
      FieldAlias = 'SEXO'
      FieldName = 'SEXO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField23: TppField
      FieldAlias = 'GRAU_INSTRUCAO'
      FieldName = 'GRAU_INSTRUCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField24: TppField
      FieldAlias = 'NASCIMENTO'
      FieldName = 'NASCIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField25: TppField
      FieldAlias = 'HORA_TRAB_SEMANA'
      FieldName = 'HORA_TRAB_SEMANA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField26: TppField
      FieldAlias = 'MES_ANTEPENULT_SALARIO'
      FieldName = 'MES_ANTEPENULT_SALARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField27: TppField
      FieldAlias = 'ANTEPENULT_SALARIO'
      FieldName = 'ANTEPENULT_SALARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField28: TppField
      FieldAlias = 'MES_PENULT_SALARIO'
      FieldName = 'MES_PENULT_SALARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField29: TppField
      FieldAlias = 'PENULT_SALARIO'
      FieldName = 'PENULT_SALARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField30: TppField
      FieldAlias = 'MES_ULT_SALARIO'
      FieldName = 'MES_ULT_SALARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField31: TppField
      FieldAlias = 'ULT_SALARIO'
      FieldName = 'ULT_SALARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField32: TppField
      FieldAlias = 'SOMA_3_ULT_SAL'
      FieldName = 'SOMA_3_ULT_SAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField33: TppField
      FieldAlias = 'N_BANCO'
      FieldName = 'N_BANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField34: TppField
      FieldAlias = 'N_AGENCIA1'
      FieldName = 'N_AGENCIA1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField35: TppField
      FieldAlias = 'N_AGENCIA2'
      FieldName = 'N_AGENCIA2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField36: TppField
      FieldAlias = 'QUANT_TRAB_36MESES'
      FieldName = 'QUANT_TRAB_36MESES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField37: TppField
      FieldAlias = 'RECEB_SAL_6_MESES'
      FieldName = 'RECEB_SAL_6_MESES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField38: TppField
      FieldAlias = 'AVISO_PREVIO'
      FieldName = 'AVISO_PREVIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField39: TppField
      FieldAlias = 'ESTABELECIMENTO'
      FieldName = 'ESTABELECIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppSegDesempregoppField40: TppField
      FieldAlias = 'LOCAL_DATA'
      FieldName = 'LOCAL_DATA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
  end
  object dsSegDesemprego: TwwDataSource
    DataSet = CdsSegDesemprego
    Left = 224
    Top = 104
  end
  object sqlSegDesemprego: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  LPAD('#39'1'#39',80,'#39'1'#39') AS EMPREGADO,'
      '  LPAD('#39'1'#39',80,'#39'1'#39') AS MAE,'
      '  LPAD('#39'1'#39',80,'#39'1'#39') AS ENDERECO,'
      '  LPAD('#39'1'#39',36,'#39'1'#39') AS COMPLEMENTO,'
      '  LPAD('#39'1'#39',12,'#39'1'#39') AS CEP1,'
      '  LPAD('#39'1'#39',04,'#39'1'#39') AS CEP2,'
      '  LPAD('#39'1'#39',04,'#39'1'#39') AS UF,'
      '  LPAD('#39'1'#39',20,'#39'1'#39') AS TELEFONE,'
      '  LPAD('#39'1'#39',22,'#39'1'#39') AS PIS,'
      '  LPAD('#39'1'#39',14,'#39'1'#39') AS CTPS1,'
      '  LPAD('#39'1'#39',06,'#39'1'#39') AS CTPS2,'
      '  LPAD('#39'1'#39',04,'#39'1'#39') AS CTPS_UF,'
      '  LPAD('#39'1'#39',22,'#39'1'#39') AS CPF,'
      '  LPAD('#39'1'#39',02,'#39'1'#39') AS TIPO_INSC_EMPRESA,'
      '  LPAD('#39'1'#39',32,'#39'1'#39') AS INSC_EMPRESA,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS CNAE,'
      '  LPAD('#39'1'#39',10,'#39'1'#39') AS CBO1,'
      '  LPAD('#39'1'#39',02,'#39'1'#39') AS CBO2,'
      '  LPAD('#39'1'#39',35,'#39'1'#39') AS OCUPACAO,'
      '  LPAD('#39'1'#39',12,'#39'1'#39') AS ADMISSAO,'
      '  LPAD('#39'1'#39',12,'#39'1'#39') AS DEMISSAO,'
      '  LPAD('#39'1'#39',02,'#39'1'#39') AS SEXO,'
      '  LPAD('#39'1'#39',02,'#39'1'#39') AS GRAU_INSTRUCAO,'
      '  LPAD('#39'1'#39',12,'#39'1'#39') AS NASCIMENTO,'
      '  LPAD('#39'1'#39',04,'#39'1'#39') AS HORA_TRAB_SEMANA,'
      '  LPAD('#39'1'#39',04,'#39'1'#39') AS MES_ANTEPENULT_SALARIO,'
      '  LPAD('#39'1'#39',20,'#39'1'#39') AS ANTEPENULT_SALARIO,'
      '  LPAD('#39'1'#39',04,'#39'1'#39') AS MES_PENULT_SALARIO,'
      '  LPAD('#39'1'#39',20,'#39'1'#39') AS PENULT_SALARIO,'
      '  LPAD('#39'1'#39',04,'#39'1'#39') AS MES_ULT_SALARIO,'
      '  LPAD('#39'1'#39',20,'#39'1'#39') AS ULT_SALARIO,'
      ''
      '  LPAD('#39'1'#39',28,'#39'1'#39') AS SOMA_3_ULT_SAL,'
      '  LPAD('#39'1'#39',06,'#39'1'#39') AS N_BANCO,'
      '  LPAD('#39'1'#39',08,'#39'1'#39') AS N_AGENCIA1,'
      '  LPAD('#39'1'#39',02,'#39'1'#39') AS N_AGENCIA2,'
      '  LPAD('#39'1'#39',04,'#39'1'#39') AS QUANT_TRAB_36MESES,'
      '  LPAD('#39'1'#39',02,'#39'1'#39') AS RECEB_SAL_6_MESES,'
      '  LPAD('#39'1'#39',02,'#39'1'#39') AS AVISO_PREVIO,'
      '  LPAD('#39'1'#39',60,'#39'1'#39') AS ESTABELECIMENTO,'
      '  LPAD('#39'1'#39',32,'#39'1'#39') AS LOCAL_DATA'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsSegDesemprego
    Left = 224
    Top = 200
  end
  object CdsSegDesemprego: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 152
  end
  object CdsSegDes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 152
  end
end
