inherited DmRelatoriosFundo: TDmRelatoriosFundo
  Left = 153
  Top = 190
  Width = 798
  Height = 461
  Caption = 'Relatórios de Fundos de Investimento'
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 217
    Top = 0
    Width = 129
    Height = 193
    TabOrder = 1
  end
  object Panel1: TPanel [1]
    Left = 216
    Top = 0
    Width = 148
    Height = 233
    TabOrder = 0
  end
  object Panel4: TPanel [2]
    Left = 364
    Top = 0
    Width = 104
    Height = 193
    TabOrder = 2
  end
  object Panel5: TPanel [3]
    Left = 468
    Top = 0
    Width = 72
    Height = 193
    TabOrder = 3
  end
  object Panel6: TPanel [4]
    Left = 540
    Top = 48
    Width = 120
    Height = 145
    TabOrder = 4
  end
  object Panel7: TPanel [5]
    Left = 540
    Top = 0
    Width = 121
    Height = 48
    TabOrder = 5
  end
  object Panel8: TPanel [6]
    Left = 0
    Top = 233
    Width = 105
    Height = 104
    TabOrder = 6
  end
  object Panel9: TPanel [7]
    Left = 105
    Top = 233
    Width = 112
    Height = 104
    TabOrder = 7
  end
  object Panel10: TPanel [8]
    Left = 1
    Top = 337
    Width = 89
    Height = 96
    TabOrder = 8
  end
  object Panel11: TPanel [9]
    Left = 218
    Top = 233
    Width = 146
    Height = 193
    TabOrder = 9
  end
  object Panel12: TPanel [10]
    Left = 364
    Top = 193
    Width = 296
    Height = 65
    TabOrder = 10
  end
  inherited pplExemplo: TppBDEPipeline
    Left = 546
    Top = 3
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
    AutoEdit = False
    Left = 562
    Top = 3
  end
  inherited qryExemplo: TwwQuery
    Left = 574
    Top = 3
  end
  inherited rpExemplo: TppReport
    Left = 590
    Top = 3
    DataPipelineName = 'pplExemplo'
    inherited HeaderBand1: TppHeaderBand
      mmHeight = 22225
      inherited Label11: TppLabel
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taLeftJustified
        mmHeight = 4233
        mmLeft = 25400
        mmWidth = 31750
      end
      inherited Line1: TppLine
        mmTop = 21167
      end
      inherited LblEmpresa: TppLabel
        Font.Size = 12
        TextAlignment = taLeftJustified
        mmHeight = 5292
        mmLeft = 25400
        mmWidth = 24342
      end
      object ppLCarteira: TppLabel
        UserName = 'LCarteira'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLPeriodo: TppLabel
        UserName = 'LPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDbLogo: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
    end
  end
  object qryConsRentFundos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Filter = 'SALDOEM > 0'
    SQL.Strings = (
      'SELECT PE.NOME AS BANCO,'
      '       FI.DESCFUNDOINVEST AS FUNDO,'
      
        '       DECODE(CF.NOMECATEGFUNDO,NULL,'#39'S/CLASS.'#39',CF.NOMECATEGFUND' +
        'O)  AS CLASS,'
      '       TF.DESCTIPOFUNDOINV AS FIFFAQ,'
      '       (DECODE(FI.STAEXCLUSIVO,'#39'S'#39','#39'SIM'#39','#39'NÃO'#39')) AS EXCLUSIVO,'
      
        '       (DECODE(FI.DATAINIAPLIC,NULL,DT.DATAAPLICACAO,FI.DATAINIA' +
        'PLIC)) AS DATAAPLICACAO,'
      '       (SD.SALDO) AS SALDOEM,'
      '       (0.00) AS PATRIMONIO,'
      '       (0.00) AS PERPL,'
      '       (0.00) AS RENTANO,'
      '       (0.00) AS PERCDIANO,'
      '       (0.00) AS RENTMES,'
      '       (0.00) AS PERCDIMES,'
      '       (0.00) AS RENTDIA, -- AL_1'
      '       (0.00) AS RENTAPLICA, -- AL_1'
      
        '       ('#39'D+'#39'||DECODE(FI.PZOLIQRESG,NULL,'#39'0'#39',FI.PZOLIQRESG)) AS R' +
        'ESGATE,'
      '       (0.00) AS VAR,'
      '       FI.IDFUNDOINVEST,'
      
        '       DECODE(CF.NIVELCATEGFUNDO,NULL,999,CF.NIVELCATEGFUNDO) AS' +
        ' NIVEL,'
      '       CF.CORCATEGFUNDO, FI.DATAINICIOFUNDO'
      ''
      
        'FROM PESSOA PE, FUNDOINVEST FI, TIPOFUNDOINVEST TF, CATEGORIAFUN' +
        'DO CF,'
      ''
      '     (SELECT MIN(DATAAPLICACAO) AS DATAAPLICACAO , IDFUNDOINVEST'
      '      FROM   HISTFUNDO'
      '      GROUP BY IDFUNDOINVEST) DT,'
      ''
      
        '     (SELECT IDFUNDOINVEST,SUM(SALDOQTDCOTAS) AS SALDOQTDCOTAS,S' +
        'UM(SALDOVLRFUNDO) AS SALDO'
      '      FROM   HISTFUNDO'
      
        '      WHERE  (IDHISTFUNDO IN (SELECT MAX(IDHISTFUNDO) AS IDHISTF' +
        'UNDO'
      '                              FROM  HISTFUNDO'
      '                              WHERE'
      
        '                                   (IDTIPOINVEST      = 5)      ' +
        '            AND'
      
        '                                   (IDPLANPREVCTBPATR = :IDPLANP' +
        'REVCTBPATR) AND'
      
        '                                   (DATAMOVFUNDO      = :DATAMOV' +
        'FUNDO)      AND'
      '                                   (TIPMOVFUNDO      <> '#39'PIR'#39')'
      
        '                             GROUP BY IDTIPOINVEST, IDPLANPREVCT' +
        'BPATR, IDFUNDOINVEST, DATAAPLICACAO, DATAMOVFUNDO)) AND'
      '             (SALDOQTDCOTAS > 0)'
      '      GROUP BY IDFUNDOINVEST   ) SD'
      ''
      'WHERE'
      '      TF.IDTIPOINVEST      = 5                      AND'
      '      FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST   AND      '
      '      PE.IDPESSOA(+)       = FI.IDGESTORCARTEIRA    AND'
      '      SD.IDFUNDOINVEST     = FI.IDFUNDOINVEST       AND'
      '      FI.IDCATEGORIAFUNDO  = CF.IDCATEGORIAFUNDO(+) AND'
      '      DT.IDFUNDOINVEST     = FI.IDFUNDOINVEST'
      'ORDER BY NIVEL, SALDOEM DESC'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updConsFundos
    ValidateWithMask = True
    Left = 148
    Top = 139
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end>
    object qryConsRentFundosBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 23
      FieldName = 'BANCO'
      Size = 60
    end
    object qryConsRentFundosFUNDO: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 50
      FieldName = 'FUNDO'
      Size = 60
    end
    object qryConsRentFundosCLASS: TStringField
      DisplayLabel = 'Categoria'
      DisplayWidth = 10
      FieldName = 'CLASS'
      Size = 12
    end
    object qryConsRentFundosFIFFAQ: TStringField
      DisplayLabel = 'FIF / FAQ'
      DisplayWidth = 9
      FieldName = 'FIFFAQ'
      Size = 80
    end
    object qryConsRentFundosEXCLUSIVO: TStringField
      DisplayLabel = 'Exclusivo'
      DisplayWidth = 7
      FieldName = 'EXCLUSIVO'
      Size = 3
    end
    object qryConsRentFundosDATAAPLICACAO: TDateTimeField
      DisplayLabel = 'Aplicação'
      DisplayWidth = 11
      FieldName = 'DATAAPLICACAO'
      DisplayFormat = 'DD/MM/YYYY'
    end
    object qryConsRentFundosSALDOEM: TFloatField
      DisplayLabel = 'Saldo na Data'
      DisplayWidth = 19
      FieldName = 'SALDOEM'
      DisplayFormat = '#,###,###,##0.00'
    end
    object qryConsRentFundosPATRIMONIO: TFloatField
      DisplayLabel = 'Patrimônio'
      DisplayWidth = 16
      FieldName = 'PATRIMONIO'
      DisplayFormat = '#,###,###,###,##0.00'
    end
    object qryConsRentFundosPERPL: TFloatField
      DisplayLabel = '%  PL'
      DisplayWidth = 11
      FieldName = 'PERPL'
      DisplayFormat = '#,##0.00'
    end
    object qryConsRentFundosRENTAPLICA: TFloatField
      DisplayLabel = 'Rent. Aplicação'
      DisplayWidth = 13
      FieldName = 'RENTAPLICA'
      DisplayFormat = '##0.00'
    end
    object qryConsRentFundosRENTANO: TFloatField
      DisplayLabel = 'Rent. no Ano'
      DisplayWidth = 12
      FieldName = 'RENTANO'
      DisplayFormat = '#,##0.0000'
    end
    object qryConsRentFundosPERCDIANO: TFloatField
      DisplayLabel = '% Indice no Ano'
      DisplayWidth = 13
      FieldName = 'PERCDIANO'
      DisplayFormat = '#,##0.00'
    end
    object qryConsRentFundosRENTMES: TFloatField
      DisplayLabel = 'Rent. no Mês'
      DisplayWidth = 10
      FieldName = 'RENTMES'
      DisplayFormat = '#,##0.0000'
    end
    object qryConsRentFundosPERCDIMES: TFloatField
      DisplayLabel = '% Indice no Mês'
      DisplayWidth = 13
      FieldName = 'PERCDIMES'
      DisplayFormat = '#,##0.00'
    end
    object qryConsRentFundosRENTDIA: TFloatField
      DisplayLabel = 'Rent. Diária'
      DisplayWidth = 10
      FieldName = 'RENTDIA'
      DisplayFormat = '##0.0000'
    end
    object qryConsRentFundosRESGATE: TStringField
      DisplayLabel = 'Resgate'
      DisplayWidth = 7
      FieldName = 'RESGATE'
      Size = 42
    end
    object qryConsRentFundosVAR: TFloatField
      FieldName = 'VAR'
      Visible = False
    end
    object qryConsRentFundosIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryConsRentFundosNIVEL: TFloatField
      FieldName = 'NIVEL'
      Visible = False
    end
    object qryConsRentFundosCORCATEGFUNDO: TFloatField
      FieldName = 'CORCATEGFUNDO'
      Visible = False
    end
    object qryConsRentFundosDATAINICIOFUNDO: TDateTimeField
      FieldName = 'DATAINICIOFUNDO'
      Visible = False
    end
  end
  object updConsFundos: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTFUNDO'
      'set'
      '  SALDOEM = :SALDOEM,'
      '  PATRIMONIO = :PATRIMONIO,'
      '  PERPL = :PERPL,'
      '  RENTANO = :RENTANO,'
      '  PERCDIANO = :PERCDIANO,'
      '  RENTMES = :RENTMES,'
      '  PERCDIMES = :PERCDIMES'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST')
    InsertSQL.Strings = (
      'insert into HISTFUNDO'
      '  (SALDOEM, PATRIMONIO, PERPL, RENTANO, PERCDIANO, RENTMES, '
      'PERCDIMES)'
      'values'
      
        '  (:SALDOEM, :PATRIMONIO, :PERPL, :RENTANO, :PERCDIANO, :RENTMES' +
        ', '
      ':PERCDIMES)')
    DeleteSQL.Strings = (
      'delete from HISTFUNDO'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST')
    Left = 145
    Top = 185
  end
  object dsConsRentFundos: TwwDataSource
    AutoEdit = False
    DataSet = qryConsRentFundos
    Left = 148
    Top = 93
  end
  object ppBdeConsRentFundos: TppBDEPipeline
    DataSource = dsConsRentFundos
    UserName = 'ppBdeConsRentFundos'
    Left = 147
    Top = 49
  end
  object rptConsRentFundos: TppReport
    AutoStop = False
    DataPipeline = ppBdeConsRentFundos
    OnStartPage = rptConsRentFundosStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Rentabilidade dos Fundos'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptConsRentFundosBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 100
    Top = 1
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBdeConsRentFundos'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32808
      mmPrintPosition = 0
      object shpConsRentFndCab: TppShape
        UserName = 'shpConsRentFndCab'
        Brush.Color = clSilver
        mmHeight = 7408
        mmLeft = 0
        mmTop = 25400
        mmWidth = 284163
        BandType = 0
      end
      object lblConsRentFndFundo: TppLabel
        UserName = 'lblConsRentFndFundo'
        Caption = 'Fundo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 43127
        mmTop = 29369
        mmWidth = 7673
        BandType = 0
      end
      object lblConsRentFndFifFaq: TppLabel
        UserName = 'lblConsRentFndFifFaq'
        Caption = 'FIF/FAQ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 115359
        mmTop = 29369
        mmWidth = 9525
        BandType = 0
      end
      object lblConsRentFndExclusivo: TppLabel
        UserName = 'lblConsRentFndExclusivo'
        Caption = 'Exclusivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 125677
        mmTop = 29369
        mmWidth = 11642
        BandType = 0
      end
      object lblConsRentFndAplicacao: TppLabel
        UserName = 'lblConsRentFndAplicacao'
        Caption = 'Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 139171
        mmTop = 29369
        mmWidth = 11377
        BandType = 0
      end
      object lblConsRentFndSaldo: TppLabel
        UserName = 'lblConsRentFndSaldo'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 164836
        mmTop = 29369
        mmWidth = 6615
        BandType = 0
      end
      object lblConsRentFndPatrimonio: TppLabel
        UserName = 'lblConsRentFndPatrimonio'
        Caption = 'Patrimônio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 182563
        mmTop = 29369
        mmWidth = 12965
        BandType = 0
      end
      object lblConsRentFndPercPL: TppLabel
        UserName = 'Label1'
        Caption = '%  PL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 199232
        mmTop = 29369
        mmWidth = 6615
        BandType = 0
      end
      object lblConsRentFndRentAno2: TppLabel
        UserName = 'Label2'
        Caption = 'no Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 223044
        mmTop = 29898
        mmWidth = 8467
        BandType = 0
      end
      object lblConsRentFndPercCDIAno2: TppLabel
        UserName = 'Label3'
        Caption = 'Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 236009
        mmTop = 29898
        mmWidth = 4763
        BandType = 0
      end
      object lblConsRentFndRentMes2: TppLabel
        UserName = 'Label4'
        Caption = 'no Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 245534
        mmTop = 29633
        mmWidth = 8467
        BandType = 0
      end
      object lblConsRentFndPercCDIMes2: TppLabel
        UserName = 'lblConsRentFndPercCDIMes2'
        Caption = 'Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2921
        mmLeft = 258234
        mmTop = 29633
        mmWidth = 4784
        BandType = 0
      end
      object lblConsRentFndResg: TppLabel
        UserName = 'lblConsRentFndResg'
        Caption = 'Resg.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 276755
        mmTop = 29369
        mmWidth = 6615
        BandType = 0
      end
      object lblConsRentFndPercCDIAno1: TppLabel
        UserName = 'Label9'
        Caption = '% Índice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 233628
        mmTop = 26723
        mmWidth = 9790
        BandType = 0
      end
      object lblConsRentFndPercCDIMes1: TppLabel
        UserName = 'lblConsRentFndPercCDIMes1'
        Caption = '% Índice'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2921
        mmLeft = 255421
        mmTop = 26458
        mmWidth = 9864
        BandType = 0
      end
      object lblConsRentFndBanco: TppLabel
        UserName = 'lblConsRentFndBanco'
        Caption = 'Banco: '
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 794
        mmTop = 29369
        mmWidth = 8996
        BandType = 0
      end
      object lblConsRentFndCategoria: TppLabel
        UserName = 'Label5'
        Caption = 'Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 102129
        mmTop = 29369
        mmWidth = 11377
        BandType = 0
      end
      object lblConsRentFndRentAno1: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Rent.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 223044
        mmTop = 26723
        mmWidth = 8467
        BandType = 0
      end
      object lblConsRentFndRentMes1: TppLabel
        UserName = 'lblConsRentFndRentMes1'
        AutoSize = False
        Caption = 'Rent.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 245534
        mmTop = 26458
        mmWidth = 8467
        BandType = 0
      end
      object LblPlanoRentFdo: TppLabel
        UserName = 'LblPlanoRentFdo'
        Caption = 'LblPlanoRentFdo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 253736
        mmTop = 8731
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'Label73'
        Caption = 'Rentabilidade de Fundos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 42333
        BandType = 0
      end
      object ppLabel74: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa1'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'LCarteira1'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 271198
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object lblConsRentFndDataRef: TppLabel
        UserName = 'LPeriodo1'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo1'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'Label70'
        Caption = 'Índice:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 25135
        mmTop = 18785
        mmWidth = 10329
        BandType = 0
      end
      object lblindicador: TppLabel
        UserName = 'lblindicador'
        Caption = 'lblindicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 37835
        mmTop = 18785
        mmWidth = 17727
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'Label72'
        Caption = 'Diária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 268288
        mmTop = 29633
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel86: TppLabel
        UserName = 'Label86'
        AutoSize = False
        Caption = 'Rent.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 267494
        mmTop = 26458
        mmWidth = 8467
        BandType = 0
      end
      object ppLabel81: TppLabel
        UserName = 'Label81'
        Caption = 'Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2921
        mmLeft = 209021
        mmTop = 29633
        mmWidth = 11472
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'Label87'
        AutoSize = False
        Caption = 'Rent. da'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 210344
        mmTop = 26458
        mmWidth = 8467
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 2646
      mmPrintPosition = 0
      object ppSConsRentFndDet: TppShape
        OnPrint = ppSConsRentFndCabPrint
        UserName = 'ppSConsRentFndDet'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ShiftWithParent = True
        mmHeight = 2646
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBConsRentFndFundo: TppDBText
        UserName = 'DBConsRentFndFundo'
        DataField = 'FUNDO'
        DataPipeline = ppBdeConsRentFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 43127
        mmTop = 0
        mmWidth = 57944
        BandType = 4
      end
      object ppDBConsRentFndFifFaq: TppDBText
        UserName = 'DBConsRentFndFifFaq'
        DataField = 'FIFFAQ'
        DataPipeline = ppBdeConsRentFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 115888
        mmTop = 0
        mmWidth = 7144
        BandType = 4
      end
      object ppDBConsRentFndExclusivo: TppDBText
        UserName = 'DBConsRentFndExclusivo'
        DataField = 'EXCLUSIVO'
        DataPipeline = ppBdeConsRentFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 128588
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object ppDBConsRentFndAplicacao: TppDBText
        UserName = 'DBConsRentFndAplicacao'
        DataField = 'DATAAPLICACAO'
        DataPipeline = ppBdeConsRentFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 138113
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object ppDBConsRentFndSaldoEm: TppDBText
        UserName = 'DBConsRentFndSaldoEm'
        DataField = 'SALDOEM'
        DataPipeline = ppBdeConsRentFundos
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 151871
        mmTop = 0
        mmWidth = 20108
        BandType = 4
      end
      object ppDBConsRentFndPatrimonio: TppDBText
        UserName = 'DBConsRentFndPatrimonio'
        DataField = 'PATRIMONIO'
        DataPipeline = ppBdeConsRentFundos
        DisplayFormat = '##,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 173038
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object ppDBConsRentFndPerPL: TppDBText
        UserName = 'DBConsRentFndPerPL'
        DataField = 'PERPL'
        DataPipeline = ppBdeConsRentFundos
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 196586
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBConsRentFndRentAno: TppDBText
        UserName = 'DBConsRentFndRentAno'
        DataField = 'RENTANO'
        DataPipeline = ppBdeConsRentFundos
        DisplayFormat = '##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 219605
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
      object ppDBConsRentFndPerCDIAno: TppDBText
        UserName = 'DBConsRentFndPerCDIAno'
        DataField = 'PERCDIANO'
        DataPipeline = ppBdeConsRentFundos
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 233363
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBConsRentFndRentMes: TppDBText
        UserName = 'DBConsRentFndRentMes'
        DataField = 'RENTMES'
        DataPipeline = ppBdeConsRentFundos
        DisplayFormat = '##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 243946
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBConsRentFndPerCDIMes: TppDBText
        UserName = 'DBConsRentFndPerCDIMes'
        DataField = 'PERCDIMES'
        DataPipeline = ppBdeConsRentFundos
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 255323
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBConsRentFndResgate: TppDBText
        UserName = 'DBConsRentFndResgate'
        DataField = 'RESGATE'
        DataPipeline = ppBdeConsRentFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 277548
        mmTop = 0
        mmWidth = 5821
        BandType = 4
      end
      object ppDBConsRentFndBanco: TppDBText
        UserName = 'DBConsRentFndBanco'
        DataField = 'BANCO'
        DataPipeline = ppBdeConsRentFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 529
        mmTop = 0
        mmWidth = 41804
        BandType = 4
      end
      object ppDBConsRentFndCategoria: TppDBText
        UserName = 'DBConsRentFndCategoria'
        DataField = 'CLASS'
        DataPipeline = ppBdeConsRentFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 102129
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'DBConsRentFndRentMes1'
        DataField = 'RENTDIA'
        DataPipeline = ppBdeConsRentFundos
        DisplayFormat = '##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 266171
        mmTop = 0
        mmWidth = 10054
        BandType = 4
      end
      object ppDBText32: TppDBText
        UserName = 'DBConsRentFndRentAno1'
        DataField = 'RENTAPLICA'
        DataPipeline = ppBdeConsRentFundos
        DisplayFormat = '##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBdeConsRentFundos'
        mmHeight = 2646
        mmLeft = 206905
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
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
        mmTop = 1588
        mmWidth = 282840
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
        mmLeft = 0
        mmTop = 1588
        mmWidth = 283105
        BandType = 8
      end
      object ppLineConsRentFnd2: TppLine
        UserName = 'LineConsRentFnd2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
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
        mmLeft = 257176
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 37835
      mmPrintPosition = 0
      object ppRConsRentFndCat: TppRegion
        UserName = 'RConsRentFndCat'
        Caption = 'RConsRentFndCat'
        Pen.Style = psClear
        Stretch = True
        mmHeight = 31750
        mmLeft = 139700
        mmTop = 6085
        mmWidth = 144727
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object SRptConsRentFndCat: TppSubReport
          UserName = 'SRptConsRentFndCat'
          ExpandAll = False
          KeepTogether = True
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppBdeConsRentFundosCat'
          mmHeight = 5027
          mmLeft = 139700
          mmTop = 6879
          mmWidth = 144727
          BandType = 7
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport3: TppChildReport
            AutoStop = False
            DataPipeline = ppBdeConsRentFundosCat
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Rentabilidade dos Fundos'
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
            Left = 368
            Top = 264
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppBdeConsRentFundosCat'
            object ppTitleBand3: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 9525
              mmPrintPosition = 0
              object ppSConsRentFndSubCatCab: TppShape
                UserName = 'SConsRentFndSubCab1'
                Brush.Color = clSilver
                mmHeight = 4233
                mmLeft = 4498
                mmTop = 5292
                mmWidth = 115623
                BandType = 1
              end
              object lblConsRentFndSubCatCategT: TppLabel
                UserName = 'lblConsRentFndSubBanco1'
                Caption = 'Categoria'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 5292
                mmTop = 5821
                mmWidth = 12700
                BandType = 1
              end
              object lblConsRentFndSubCatSaldoT: TppLabel
                UserName = 'lblConsRentFndSubSaldo1'
                Caption = 'Saldo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 94456
                mmTop = 5821
                mmWidth = 7408
                BandType = 1
              end
              object lblConsRentFndSubCatPercT: TppLabel
                UserName = 'lblConsRentFndSubPerc1'
                Caption = 'Percentual'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 103188
                mmTop = 5821
                mmWidth = 16404
                BandType = 1
              end
              object lblConsRentFndSubCatTitulo: TppLabel
                UserName = 'lblConsRentFndSubCatTitulo'
                AutoSize = False
                Caption = 'Concentração por Categoria'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3969
                mmLeft = 4763
                mmTop = 529
                mmWidth = 115359
                BandType = 1
              end
            end
            object ppDetailBand4: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3175
              mmPrintPosition = 0
              object ppSConsRentFndSubCat: TppShape
                OnPrint = ppSConsRentFndCabPrint
                UserName = 'ppSConsRentFndSubDet1'
                ParentHeight = True
                Pen.Style = psClear
                ShiftWithParent = True
                mmHeight = 3175
                mmLeft = 4498
                mmTop = 0
                mmWidth = 115888
                BandType = 4
              end
              object ppDBConsRentFndSubCatCateg: TppDBText
                UserName = 'DBConsRentFndSubBanco1'
                DataField = 'CATEGORIA'
                DataPipeline = ppBdeConsRentFundosCat
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'ppBdeConsRentFundosCat'
                mmHeight = 3175
                mmLeft = 5027
                mmTop = 0
                mmWidth = 71173
                BandType = 4
              end
              object ppDBConsRentFndSubCatSaldo: TppDBText
                UserName = 'DBConsRentFndSubSaldo1'
                DataField = 'SALDO'
                DataPipeline = ppBdeConsRentFundosCat
                DisplayFormat = '###,###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppBdeConsRentFundosCat'
                mmHeight = 3175
                mmLeft = 76729
                mmTop = 0
                mmWidth = 25400
                BandType = 4
              end
              object ppDBConsRentFndSubCatPerc: TppDBText
                UserName = 'DBConsRentFndSubPerc1'
                DataField = 'PERCENT'
                DataPipeline = ppBdeConsRentFundosCat
                DisplayFormat = '##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppBdeConsRentFundosCat'
                mmHeight = 3175
                mmLeft = 105834
                mmTop = 0
                mmWidth = 10583
                BandType = 4
              end
              object lblConsRentFndSubCatPercD: TppLabel
                UserName = 'lblConsRentFndSubCatPercD'
                Caption = '%'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 116946
                mmTop = 0
                mmWidth = 2646
                BandType = 4
              end
            end
            object ppSummaryBand4: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 66675
              mmPrintPosition = 0
              object ppDPTeeChart1: TppDPTeeChart
                UserName = 'DPTeeChart1'
                mmHeight = 63765
                mmLeft = 5292
                mmTop = 1588
                mmWidth = 114829
                BandType = 7
                object ppDPTeeChartControl1: TppDPTeeChartControl
                  Left = 0
                  Top = 0
                  Width = 400
                  Height = 250
                  BottomWall.Size = 10
                  Title.Text.Strings = (
                    'Gráfico')
                  Title.Visible = False
                  AxisVisible = False
                  ClipPoints = False
                  Frame.Visible = False
                  LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
                  LeftAxis.LabelsFont.Color = clBlack
                  LeftAxis.LabelsFont.Height = -8
                  LeftAxis.LabelsFont.Name = 'Arial'
                  LeftAxis.LabelsFont.Style = []
                  Legend.Visible = False
                  View3DWalls = False
                  BevelOuter = bvNone
                  Color = clWhite
                  object Series1: TPieSeries
                    Tag = 3
                    Marks.ArrowLength = 8
                    Marks.Font.Charset = DEFAULT_CHARSET
                    Marks.Font.Color = clBlack
                    Marks.Font.Height = -7
                    Marks.Font.Name = 'Arial'
                    Marks.Font.Style = []
                    Marks.Style = smsLabelPercent
                    Marks.Visible = True
                    DataSource = ppBdeConsRentFundosCat
                    SeriesColor = clRed
                    XLabelsSource = 'CATEGORIA'
                    CustomXRadius = 100
                    CustomYRadius = 60
                    OtherSlice.Text = 'Other'
                    PieValues.DateTime = False
                    PieValues.Name = 'Pie'
                    PieValues.Multiplier = 1
                    PieValues.Order = loNone
                    PieValues.ValueSource = 'SALDO'
                  end
                end
              end
            end
          end
        end
      end
      object ppRConsRentFndBco: TppRegion
        UserName = 'RConsRentFndBco'
        Caption = 'RConsRentFndBco'
        Pen.Style = psClear
        Stretch = True
        mmHeight = 31750
        mmLeft = 265
        mmTop = 6085
        mmWidth = 139436
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object SRptConsRentFndBco: TppSubReport
          UserName = 'SRptConsRentFndBco'
          ExpandAll = False
          KeepTogether = True
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'ppBdeConsRentFundosTot'
          mmHeight = 5027
          mmLeft = 265
          mmTop = 6879
          mmWidth = 139436
          BandType = 7
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = ppBdeConsRentFundosTot
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'Rentabilidade dos Fundos'
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
            Left = 320
            Top = 216
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'ppBdeConsRentFundosTot'
            object ppTitleBand2: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 9525
              mmPrintPosition = 0
              object ppSConsRentFndSubCab: TppShape
                UserName = 'SConsRentFndSubCab'
                Brush.Color = clSilver
                mmHeight = 4233
                mmLeft = 20373
                mmTop = 5292
                mmWidth = 115623
                BandType = 1
              end
              object lblConsRentFndSubBanco: TppLabel
                UserName = 'lblConsRentFndSubBanco'
                Caption = 'Gestor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 20902
                mmTop = 5821
                mmWidth = 8996
                BandType = 1
              end
              object lblConsRentFndSubSaldo: TppLabel
                UserName = 'lblConsRentFndSubSaldo'
                Caption = 'Saldo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 110596
                mmTop = 5821
                mmWidth = 7408
                BandType = 1
              end
              object lblConsRentFndSubPercT: TppLabel
                UserName = 'lblConsRentFndSubPercT'
                Caption = 'Percentual'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3175
                mmLeft = 118798
                mmTop = 5821
                mmWidth = 16669
                BandType = 1
              end
              object ppLabel1: TppLabel
                UserName = 'lblConsRentFndSubCatTitulo1'
                AutoSize = False
                Caption = 'Concentração por Gestor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 9
                Font.Style = [fsBold]
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3969
                mmLeft = 20638
                mmTop = 528
                mmWidth = 115359
                BandType = 1
              end
            end
            object ppDetailBand3: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 3175
              mmPrintPosition = 0
              object ppSConsRentFndSubDet: TppShape
                OnPrint = ppSConsRentFndSubDetPrint
                UserName = 'ppSConsRentFndSubDet'
                ParentHeight = True
                Pen.Style = psClear
                mmHeight = 3175
                mmLeft = 20373
                mmTop = 0
                mmWidth = 115623
                BandType = 4
              end
              object ppDBConsRentFndSubBanco: TppDBText
                UserName = 'DBConsRentFndSubBanco'
                DataField = 'BANCO'
                DataPipeline = ppBdeConsRentFundosTot
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                DataPipelineName = 'ppBdeConsRentFundosTot'
                mmHeight = 3175
                mmLeft = 20902
                mmTop = 0
                mmWidth = 71438
                BandType = 4
              end
              object ppDBConsRentFndSubSaldo: TppDBText
                UserName = 'DBConsRentFndSubSaldo'
                DataField = 'SALDO'
                DataPipeline = ppBdeConsRentFundosTot
                DisplayFormat = '###,###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppBdeConsRentFundosTot'
                mmHeight = 3175
                mmLeft = 92869
                mmTop = 0
                mmWidth = 25400
                BandType = 4
              end
              object ppDBConsRentFndSubPerc: TppDBText
                UserName = 'DBConsRentFndSubPerc'
                DataField = 'PERCENT'
                DataPipeline = ppBdeConsRentFundosTot
                DisplayFormat = '##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'ppBdeConsRentFundosTot'
                mmHeight = 3175
                mmLeft = 120915
                mmTop = 0
                mmWidth = 11113
                BandType = 4
              end
              object lblConsRentFndSubPercD: TppLabel
                UserName = 'lblConsRentFndSubPercD'
                Caption = '%'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3175
                mmLeft = 132557
                mmTop = 0
                mmWidth = 2646
                BandType = 4
              end
            end
            object ppSummaryBand3: TppSummaryBand
              mmBottomOffset = 0
              mmHeight = 60325
              mmPrintPosition = 0
              object chtConsRentGestor: TppDPTeeChart
                UserName = 'chtConsRentGestor'
                mmHeight = 59531
                mmLeft = 1323
                mmTop = 0
                mmWidth = 148167
                BandType = 7
                object ppDPTeeChartControl2: TppDPTeeChartControl
                  Left = 0
                  Top = 0
                  Width = 400
                  Height = 250
                  MarginBottom = 0
                  MarginLeft = 0
                  MarginRight = 0
                  MarginTop = 0
                  Title.Text.Strings = (
                    'Gráfico')
                  Title.Visible = False
                  AxisVisible = False
                  ClipPoints = False
                  Frame.Visible = False
                  LeftAxis.LabelsFont.Charset = DEFAULT_CHARSET
                  LeftAxis.LabelsFont.Color = clBlack
                  LeftAxis.LabelsFont.Height = -7
                  LeftAxis.LabelsFont.Name = 'Arial'
                  LeftAxis.LabelsFont.Style = []
                  LeftAxis.LabelsMultiLine = True
                  Legend.Font.Charset = DEFAULT_CHARSET
                  Legend.Font.Color = clBlack
                  Legend.Font.Height = -9
                  Legend.Font.Name = 'Arial'
                  Legend.Font.Style = []
                  Legend.Visible = False
                  View3DWalls = False
                  BevelOuter = bvNone
                  Color = clWhite
                  object Series2: TPieSeries
                    Tag = 3
                    Marks.ArrowLength = 8
                    Marks.Font.Charset = DEFAULT_CHARSET
                    Marks.Font.Color = clBlack
                    Marks.Font.Height = -7
                    Marks.Font.Name = 'Arial'
                    Marks.Font.Style = []
                    Marks.Style = smsLabelPercent
                    Marks.Visible = True
                    DataSource = ppBdeConsRentFundosTot
                    SeriesColor = clRed
                    XLabelsSource = 'BANCO'
                    CustomXRadius = 100
                    CustomYRadius = 60
                    OtherSlice.Text = 'Other'
                    PieValues.DateTime = False
                    PieValues.Name = 'Pie'
                    PieValues.Multiplier = 1
                    PieValues.Order = loNone
                    PieValues.ValueSource = 'PERCENT'
                  end
                end
              end
            end
          end
        end
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = 14935011
        mmHeight = 3704
        mmLeft = 145257
        mmTop = 1323
        mmWidth = 47096
        BandType = 7
      end
      object lblConsRentFndTotGerTit: TppLabel
        UserName = 'lblConsRentFndTotGerTit'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 145786
        mmTop = 1852
        mmWidth = 13758
        BandType = 7
      end
      object lblConsRentFndTotGer: TppLabel
        UserName = 'lblConsRentFndTotGer'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 185738
        mmTop = 1852
        mmWidth = 5821
        BandType = 7
      end
    end
  end
  object ppBdeConsRentFundosTot: TppBDEPipeline
    DataSource = dsConsRentFundoTot
    UserName = 'ppBdeConsRentFundos1'
    Left = 101
    Top = 48
  end
  object dsConsRentFundoTot: TwwDataSource
    AutoEdit = False
    DataSet = qryConsRentFundoTot
    Left = 102
    Top = 93
  end
  object updConsRentFundoTot: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTFUNDO'
      'set'
      '  SALDOEM = :SALDOEM,'
      '  PATRIMONIO = :PATRIMONIO,'
      '  PERPL = :PERPL,'
      '  RENTANO = :RENTANO,'
      '  PERCDIANO = :PERCDIANO,'
      '  RENTMES = :RENTMES,'
      '  PERCDIMES = :PERCDIMES'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST')
    InsertSQL.Strings = (
      'insert into HISTFUNDO'
      '  (SALDOEM, PATRIMONIO, PERPL, RENTANO, PERCDIANO, RENTMES, '
      'PERCDIMES)'
      'values'
      
        '  (:SALDOEM, :PATRIMONIO, :PERPL, :RENTANO, :PERCDIANO, :RENTMES' +
        ', '
      ':PERCDIMES)')
    DeleteSQL.Strings = (
      'delete from HISTFUNDO'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST')
    Left = 101
    Top = 184
  end
  object qryConsRentFundoTot: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT (PE.NOME) AS BANCO,'
      '        SUM(HI.SALDOVLRFUNDO) AS SALDO,'
      '       ((SUM(HI.SALDOVLRFUNDO)/TST.TOTAL)*100) AS PERCENT'
      ''
      
        'FROM  HISTFUNDO HI, FUNDOINVEST FI, TIPOFUNDOINVEST TF, PESSOA P' +
        'E,'
      '           (SELECT SUM(HI.SALDOVLRFUNDO) AS TOTAL'
      
        '            FROM HISTFUNDO HI, FUNDOINVEST FI, TIPOFUNDOINVEST T' +
        'F'
      '            WHERE'
      
        '                  HI.IDHISTFUNDO IN (SELECT MAX(IDHISTFUNDO) AS ' +
        'IDHISTFUNDO'
      '                                     FROM HISTFUNDO'
      '                                     WHERE'
      
        '                                            (IDTIPOINVEST      =' +
        ' 5)                  AND                                     '
      
        '                                            (IDPLANPREVCTBPATR =' +
        ' :IDPLANPREVCTBPATR) AND'
      
        '                                            (DATAMOVFUNDO      =' +
        ' :DATAMOVFUNDO)      AND'
      
        '                                            (TIPMOVFUNDO      <>' +
        ' '#39'PIR'#39')'
      
        '                                     GROUP BY IDTIPOINVEST, IDPL' +
        'ANPREVCTBPATR, IDFUNDOINVEST, DATAAPLICACAO, DATAMOVFUNDO) AND'
      '                  HI.IDFUNDOINVEST     = FI.IDFUNDOINVEST AND'
      
        '                  FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST(+)' +
        ' AND'
      '                  TF.IDTIPOINVEST      = 5 ) TST'
      'WHERE'
      ''
      '       HI.IDHISTFUNDO IN (SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                          FROM HISTFUNDO'
      '                          WHERE'
      
        '                              (IDTIPOINVEST      = 5)           ' +
        '       AND'
      
        '                              (IDPLANPREVCTBPATR = :IDPLANPREVCT' +
        'BPATR) AND'
      
        '                              (DATAMOVFUNDO      = :DATAMOVFUNDO' +
        ')      AND'
      '                              (TIPMOVFUNDO      <> '#39'PIR'#39')'
      
        '                          GROUP BY IDTIPOINVEST, IDPLANPREVCTBPA' +
        'TR, IDFUNDOINVEST, DATAAPLICACAO, DATAMOVFUNDO)'
      '   AND TF.IDTIPOINVEST      = 5'
      '   AND FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST'
      '   AND FI.IDFUNDOINVEST     = HI.IDFUNDOINVEST'
      '   AND FI.IDGESTORCARTEIRA  = PE.IDPESSOA(+)'
      'GROUP BY'
      '   PE.NOME, TST.TOTAL'
      'HAVING'
      '   SUM(HI.SALDOVLRFUNDO) > 0'
      'ORDER BY'
      '   SALDO DESC'
      ''
      ''
      ' ')
    UpdateObject = updConsRentFundoTot
    ValidateWithMask = True
    Left = 102
    Top = 139
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end>
    object qryConsRentFundoTotBANCO: TStringField
      FieldName = 'BANCO'
      Size = 60
    end
    object qryConsRentFundoTotSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qryConsRentFundoTotPERCENT: TFloatField
      FieldName = 'PERCENT'
    end
  end
  object ppBdeConsRentFundosCat: TppBDEPipeline
    DataSource = dsConsRentFundoTotCat
    UserName = 'BdeConsRentFundosCat'
    Left = 53
    Top = 48
  end
  object dsConsRentFundoTotCat: TwwDataSource
    AutoEdit = False
    DataSet = qryConsRentFundoTotCat
    Left = 53
    Top = 93
  end
  object qryConsRentFundoTotCat: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT (DECODE(CF.NOMECATEGFUNDO,NULL,'#39'SEM CLASSIFICAÇÃO'#39',CF.NOM' +
        'ECATEGFUNDO) )AS CATEGORIA,'
      '        SUM(HI.SALDOVLRFUNDO) AS SALDO,'
      '       ((SUM(HI.SALDOVLRFUNDO)/TST.TOTAL)*100) AS PERCENT,'
      
        '       (DECODE(CF.NIVELCATEGFUNDO,NULL,999,CF.NIVELCATEGFUNDO)) ' +
        'AS NIVEL,'
      '       CF.CORCATEGFUNDO'
      ''
      
        'FROM  HISTFUNDO HI, FUNDOINVEST FI, TIPOFUNDOINVEST TF, CATEGORI' +
        'AFUNDO CF,'
      '           (SELECT SUM(HI.SALDOVLRFUNDO) AS TOTAL'
      
        '            FROM HISTFUNDO HI, FUNDOINVEST FI, TIPOFUNDOINVEST T' +
        'F'
      '            WHERE'
      
        '                  HI.IDHISTFUNDO IN (SELECT MAX(IDHISTFUNDO) AS ' +
        'IDHISTFUNDO'
      '                                     FROM HISTFUNDO'
      #9#9#9#9'     WHERE'
      #9#9#9#9'          (IDTIPOINVEST      = 5)                  AND'
      #9#9#9#9'          (IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) AND'
      #9#9#9#9'          (DATAMOVFUNDO      = :DATAMOVFUNDO)      AND'
      #9#9#9#9'          (TIPMOVFUNDO      <> '#39'PIR'#39')'
      
        '                '#9#9'     GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR,' +
        ' IDFUNDOINVEST, DATAAPLICACAO, DATAMOVFUNDO) AND'
      '    '#9'          HI.IDFUNDOINVEST     = FI.IDFUNDOINVEST     AND'
      
        '                  FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST AN' +
        'D'
      '                  TF.IDTIPOINVEST      = 5) TST'
      'WHERE'
      
        '       HI.IDHISTFUNDO  IN (SELECT MAX(IDHISTFUNDO) AS IDHISTFUND' +
        'O'
      '                           FROM HISTFUNDO'
      '                           WHERE'
      
        '                               (IDTIPOINVEST      = 5)          ' +
        '        AND'
      
        '                               (IDPLANPREVCTBPATR = :IDPLANPREVC' +
        'TBPATR) AND'
      
        '                               (DATAMOVFUNDO      = :DATAMOVFUND' +
        'O)      AND'
      '                               (TIPMOVFUNDO      <> '#39'PIR'#39')'
      
        '            '#9#9'   GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR, IDFUN' +
        'DOINVEST, DATAAPLICACAO, DATAMOVFUNDO)'
      '   AND TF.IDTIPOINVEST      = 5'
      '   AND FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST   '
      '   AND FI.IDFUNDOINVEST     = HI.IDFUNDOINVEST'
      '   AND FI.IDCATEGORIAFUNDO  = CF.IDCATEGORIAFUNDO(+)'
      'GROUP BY'
      
        '   CF.NOMECATEGFUNDO, CF.NIVELCATEGFUNDO, CF.CORCATEGFUNDO, TST.' +
        'TOTAL'
      ''
      'ORDER BY NIVEL'
      ''
      ' ')
    ValidateWithMask = True
    Left = 54
    Top = 139
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVFUNDO'
        ParamType = ptResult
      end>
    object qryConsRentFundoTotCatCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      FixedChar = True
      Size = 10
    end
    object qryConsRentFundoTotCatSALDO: TFloatField
      FieldName = 'SALDO'
    end
    object qryConsRentFundoTotCatPERCENT: TFloatField
      FieldName = 'PERCENT'
    end
    object qryConsRentFundoTotCatNIVEL: TFloatField
      FieldName = 'NIVEL'
    end
    object qryConsRentFundoTotCatCORCATEGFUNDO: TFloatField
      FieldName = 'CORCATEGFUNDO'
    end
  end
  object ppBDETransferencia: TppBDEPipeline
    DataSource = dsTransferencia
    UserName = 'BDETransferencia'
    Left = 396
    Top = 47
  end
  object dsTransferencia: TwwDataSource
    AutoEdit = False
    DataSet = qryTransferencia
    Left = 396
    Top = 91
  end
  object qryTransferencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OPF.DATAOPERACAO, OPF.QTDOPERACAO, OPF.VLROPERACAO, OPF.V' +
        'LRCOTA, OPF.IDOPERACAOFUNDO,'
      
        '       (HO.DESCFUNDOINVEST) AS FNDORIGEM, (HO.DATAAPLICACAO) AS ' +
        'DTAPLORIGEM,'
      '       (HO.COTAAPLICACAO) AS COTAAPLORIGEM,'
      
        '       (HD.DESCFUNDOINVEST) AS FNDDESTINO, (HD.DATAAPLICACAO) AS' +
        ' DTAPLDESTINO,'
      '       (HD.COTAAPLICACAO) AS COTAAPLDESTINO,'
      
        '       (HO.DATAMOVFUNDO) AS DTMOVORIGEM, (HD.DATAMOVFUNDO) AS DT' +
        'MOVDESTINO,'
      '       (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      ''
      'FROM OPERACAOFUNDO OPF,'
      '     PESSOA PE,'
      '     PLANPREVCONTABPATRO PA,'
      '     PLANPREVCONTABIL PL,'
      
        '     ( SELECT HST1.DATAMOVFUNDO, FNDO.DESCFUNDOINVEST, HST1.IDFU' +
        'NDOINVEST, HST1.DATAAPLICACAO,'
      '              HST1.COTAAPLICACAO, OP1.IDOPERACAOFUNDO'
      
        '       FROM   HISTFUNDO HST1, OPERACAOFUNDO OP1, FUNDOINVEST FND' +
        'O'
      '       WHERE'
      '             (HST1.IDTIPOINVEST      = :IDTIPOINVEST)        AND'
      '             (HST1.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)   AND'
      '             (HST1.IDFUNDOINVEST    >  0)                    AND'
      
        '             (HST1.DATAAPLICACAO    <= TO_DATE(:DATAMOVFUNDO,'#39'DD' +
        '/MM/YYYY'#39')) AND'
      
        '             (HST1.DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO,'#39'DD' +
        '/MM/YYYY'#39')) AND'
      '             (HST1.IDTIPOOPERACAO IN (-39,-41))              AND'
      '             (OP1.IDTIPOOPERACAO     = -42)                  AND'
      '             (OP1.DATAOPERACAO       = HST1.DATAMOVFUNDO)    AND'
      '             (HST1.IDOPERACAOFUNDO   = OP1.IDOPERACAOORIGEM) AND'
      '             (FNDO.IDFUNDOINVEST     = HST1.IDFUNDOINVEST)) HO,'
      
        '     ( SELECT HST2.DATAMOVFUNDO, FNDD.DESCFUNDOINVEST, HST2.IDFU' +
        'NDOINVEST, HST2.DATAAPLICACAO,'
      '              HST2.COTAAPLICACAO, OP2.IDOPERACAOFUNDO'
      
        '       FROM   HISTFUNDO HST2, OPERACAOFUNDO OP2, FUNDOINVEST FND' +
        'D'
      '       WHERE'
      '             (HST2.IDTIPOINVEST      = :IDTIPOINVEST)        AND'
      '             (HST2.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR)   AND'
      '             (HST2.IDFUNDOINVEST    >  0)                    AND'
      
        '             (HST2.DATAAPLICACAO    <= TO_DATE(:DATAMOVFUNDO,'#39'DD' +
        '/MM/YYYY'#39')) AND'
      
        '             (HST2.DATAMOVFUNDO      = TO_DATE(:DATAMOVFUNDO,'#39'DD' +
        '/MM/YYYY'#39')) AND'
      '             (HST2.IDTIPOOPERACAO IN (-38,-40))              AND'
      '              (OP2.IDTIPOOPERACAO    = -42)                  AND'
      '              (OP2.DATAOPERACAO      = HST2.DATAMOVFUNDO)    AND'
      '             (HST2.IDOPERACAOFUNDO   = OP2.IDOPERACAOFUNDO)  AND'
      
        '             (FNDD.IDFUNDOINVEST     = HST2.IDFUNDOINVEST)) HD  ' +
        ' '
      'WHERE'
      '      (OPF.IDTIPOINVEST      = :IDTIPOINVEST)      AND'
      '      (OPF.IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR) AND'
      
        '      (OPF.DATAOPERACAO      = TO_DATE(:DATAMOVFUNDO,'#39'DD/MM/YYYY' +
        #39')) AND'
      '      (OPF.IDTIPOOPERACAO    = -42)                AND'
      '      (OPF.IDOPERACAOFUNDO   = HO.IDOPERACAOFUNDO) AND'
      '      (OPF.IDOPERACAOFUNDO   = HD.IDOPERACAOFUNDO) AND'
      '       (PA.IDPATRO           = PE.IDPESSOA)        AND'
      '       (PA.IDPLANOPREV       = PL.IDPLANOPREV)     AND'
      
        '      (OPF.IDPLANPREVCTBPATR = PA.IDPLANPREVCTBPATR)            ' +
        ' '
      'ORDER BY OPF.DATAOPERACAO')
    ValidateWithMask = True
    Left = 396
    Top = 134
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAMOVFUNDO'
        ParamType = ptInput
      end>
    object qryTransferenciaDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryTransferenciaQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
    end
    object qryTransferenciaVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryTransferenciaVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
    end
    object qryTransferenciaIDOPERACAOFUNDO: TFloatField
      FieldName = 'IDOPERACAOFUNDO'
    end
    object qryTransferenciaFNDORIGEM: TStringField
      FieldName = 'FNDORIGEM'
      Size = 60
    end
    object qryTransferenciaDTAPLORIGEM: TDateTimeField
      FieldName = 'DTAPLORIGEM'
    end
    object qryTransferenciaCOTAAPLORIGEM: TFloatField
      FieldName = 'COTAAPLORIGEM'
    end
    object qryTransferenciaFNDDESTINO: TStringField
      FieldName = 'FNDDESTINO'
      Size = 60
    end
    object qryTransferenciaDTAPLDESTINO: TDateTimeField
      FieldName = 'DTAPLDESTINO'
    end
    object qryTransferenciaCOTAAPLDESTINO: TFloatField
      FieldName = 'COTAAPLDESTINO'
    end
    object qryTransferenciaDTMOVORIGEM: TDateTimeField
      FieldName = 'DTMOVORIGEM'
    end
    object qryTransferenciaDTMOVDESTINO: TDateTimeField
      FieldName = 'DTMOVDESTINO'
    end
    object qryTransferenciaPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object rptTransferencia: TppReport
    AutoStop = False
    DataPipeline = ppBDETransferencia
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptTransferenciaBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 396
    Top = 1
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDETransferencia'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object shpTransfCab: TppShape
        UserName = 'shpTransfCab'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 21167
        mmWidth = 197300
        BandType = 0
      end
      object lblTransfDataCab: TppLabel
        UserName = 'lblTransfDataCab'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 529
        mmTop = 21696
        mmWidth = 6879
        BandType = 0
      end
      object lblTransfValor: TppLabel
        UserName = 'Label1'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 31485
        mmTop = 21696
        mmWidth = 7938
        BandType = 0
      end
      object lblTransfQuant: TppLabel
        UserName = 'lblTransfQuant'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 57415
        mmTop = 21696
        mmWidth = 17463
        BandType = 0
      end
      object lblTransfFundosCab: TppLabel
        UserName = 'Label2'
        Caption = 'Fundos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 76200
        mmTop = 21696
        mmWidth = 11642
        BandType = 0
      end
      object lblTransfDataApli: TppLabel
        UserName = 'lblTransfDataApli'
        Caption = 'Data Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 147638
        mmTop = 21696
        mmWidth = 22754
        BandType = 0
      end
      object lblTransfCotaApli: TppLabel
        UserName = 'lblTransfCotaApli'
        Caption = 'Cota Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 173302
        mmTop = 21431
        mmWidth = 23019
        BandType = 0
      end
      object LblPlanoTransf: TppLabel
        UserName = 'LblPlanoRentAcoes1'
        Caption = 'LblPlanoRentAcoes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 161396
        mmTop = 8731
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label3'
        Caption = 'Transferências entre Fundos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 48419
        BandType = 0
      end
      object ppLabel88: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa7'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'LCarteira7'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object lblTransfDataCabTxt: TppLabel
        UserName = 'LPeriodo7'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage7: TppDBImage
        UserName = 'DbLogo7'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object shpTransfDet: TppShape
        OnPrint = shpTransfDetPrint
        UserName = 'shpTransfDet'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 9260
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBTransfDataOpe: TppDBText
        UserName = 'DBTransfDataOpe'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppBDETransferencia
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDETransferencia'
        mmHeight = 3175
        mmLeft = 265
        mmTop = 265
        mmWidth = 14552
        BandType = 4
      end
      object ppDBTransfValor: TppDBText
        UserName = 'DBTransfValor'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDETransferencia
        DisplayFormat = '###,###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETransferencia'
        mmHeight = 3175
        mmLeft = 16404
        mmTop = 265
        mmWidth = 23548
        BandType = 4
      end
      object ppDBTransfQuantidade: TppDBText
        UserName = 'DBTransfQuantidade'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppBDETransferencia
        DisplayFormat = '###,###,##0.0000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETransferencia'
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 265
        mmWidth = 33338
        BandType = 4
      end
      object ppDBTransfFndOrigem: TppDBText
        UserName = 'DBTransfFndOrigem'
        DataField = 'FNDORIGEM'
        DataPipeline = ppBDETransferencia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDETransferencia'
        mmHeight = 3175
        mmLeft = 88636
        mmTop = 265
        mmWidth = 63236
        BandType = 4
      end
      object lblTransfFundosDetO: TppLabel
        UserName = 'lblTransfFundosDetO'
        AutoSize = False
        Caption = 'Origem:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 76200
        mmTop = 265
        mmWidth = 11906
        BandType = 4
      end
      object lblTransfFundosDetD: TppLabel
        UserName = 'lblTransfFundosDetD'
        AutoSize = False
        Caption = 'Destino:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 76200
        mmTop = 5027
        mmWidth = 12171
        BandType = 4
      end
      object ppDBTransfFndDestino: TppDBText
        UserName = 'DBTransfFndDestino'
        DataField = 'FNDDESTINO'
        DataPipeline = ppBDETransferencia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBDETransferencia'
        mmHeight = 3175
        mmLeft = 88636
        mmTop = 5027
        mmWidth = 63236
        BandType = 4
      end
      object ppDBTransfDatApliO: TppDBText
        UserName = 'DBTransfDatApliO'
        DataField = 'DTAPLORIGEM'
        DataPipeline = ppBDETransferencia
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETransferencia'
        mmHeight = 3175
        mmLeft = 153194
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBTransfDatApliD: TppDBText
        UserName = 'DBTransfDatApliD'
        DataField = 'DTAPLDESTINO'
        DataPipeline = ppBDETransferencia
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETransferencia'
        mmHeight = 3175
        mmLeft = 153194
        mmTop = 5027
        mmWidth = 17198
        BandType = 4
      end
      object ppDBTransfCotApliO: TppDBText
        UserName = 'DBTransfCotApliO'
        DataField = 'COTAAPLORIGEM'
        DataPipeline = ppBDETransferencia
        DisplayFormat = '###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETransferencia'
        mmHeight = 3175
        mmLeft = 171450
        mmTop = 265
        mmWidth = 25135
        BandType = 4
      end
      object ppDBTransfCotApliD: TppDBText
        UserName = 'DBTransfCotApliD'
        DataField = 'COTAAPLDESTINO'
        DataPipeline = ppBDETransferencia
        DisplayFormat = '###,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDETransferencia'
        mmHeight = 3175
        mmLeft = 171715
        mmTop = 5027
        mmWidth = 24871
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel6: TppLabel
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
        mmTop = 3175
        mmWidth = 196850
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 196850
        BandType = 8
      end
      object ppLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
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
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'PLANPRVCONTABPATRO'
      DataPipeline = ppBDETransferencia
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDETransferencia'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object shpTransfPlnPrevCab: TppShape
          UserName = 'shpTransfPlnPrevCab'
          Brush.Color = clSilver
          ParentWidth = True
          Pen.Style = psClear
          mmHeight = 5027
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object lblTransfPlanPrevCtbPatrTit: TppLabel
          UserName = 'lblTransfPlanPrevCtbPatrTit'
          Caption = 'Plano / Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 0
          mmTop = 529
          mmWidth = 33867
          BandType = 3
          GroupNo = 0
        end
        object ppDBTransfPlanPrev: TppDBText
          UserName = 'DBTransfPlanPrev'
          AutoSize = True
          DataField = 'PLANPRVCONTABPATRO'
          DataPipeline = ppBDETransferencia
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDETransferencia'
          mmHeight = 3969
          mmLeft = 35190
          mmTop = 529
          mmWidth = 39952
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
  end
  object ppBDEAjuste: TppBDEPipeline
    DataSource = dsAjuste
    UserName = 'BDEAjuste'
    Left = 472
    Top = 46
    object ppBDEAjusteppField1: TppField
      FieldAlias = 'DESCTIPOFUNDOINV'
      FieldName = 'DESCTIPOFUNDOINV'
      FieldLength = 80
      DisplayWidth = 80
      Position = 0
    end
    object ppBDEAjusteppField2: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppBDEAjusteppField3: TppField
      FieldAlias = 'DATAAPLICACAO'
      FieldName = 'DATAAPLICACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 2
    end
    object ppBDEAjusteppField4: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object ppBDEAjusteppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDOPERACAO'
      FieldName = 'QTDOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppBDEAjusteppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTAS'
      FieldName = 'SALDOQTDCOTAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppBDEAjusteppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object dsAjuste: TwwDataSource
    AutoEdit = False
    DataSet = qryAjuste
    Left = 472
    Top = 90
  end
  object qryAjuste: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TF.DESCTIPOFUNDOINV, FI.DESCFUNDOINVEST, HF.DATAAPLICACAO' +
        ', OPF.DATAOPERACAO,'
      '       OPF.QTDOPERACAO, HF.SALDOQTDCOTAS, OPF.IDFUNDOINVEST'
      ''
      
        'FROM OPERACAOFUNDO OPF, FUNDOINVEST FI, TIPOFUNDOINVEST TF, HIST' +
        'FUNDO HF'
      ''
      'WHERE'
      
        '      (((:IDTIPOINVEST <> 0) AND (TF.IDTIPOINVEST = :IDTIPOINVES' +
        'T))                       OR'
      '        (:IDTIPOINVEST = 0))                         AND'
      ''
      
        '      (((:IDPLANPREVCTBPATR IS NOT NULL) AND (OPF.IDPLANPREVCTBP' +
        'ATR = :IDPLANPREVCTBPATR)) OR'
      '        (:IDPLANPREVCTBPATR IS NULL))                AND'
      ''
      
        '      (((:IDFUNDOINVEST IS NOT NULL) AND (OPF.IDFUNDOINVEST = :I' +
        'DFUNDOINVEST))            OR'
      '        (:IDFUNDOINVEST IS NULL))                    AND'
      ''
      
        '      (((:DATAINI IS NOT NULL) AND (OPF.DATAOPERACAO >= :DATAINI' +
        ')) OR (:DATAINI IS NULL)) AND'
      
        '      (((:DATAFIM IS NOT NULL) AND (OPF.DATAOPERACAO <= :DATAFIM' +
        ')) OR (:DATAFIM IS NULL)) AND'
      ''
      '     (OPF.IDTIPOOPERACAO IN (-36,-37,-66,-144))      AND'
      ''
      
        '      (((:IDTIPOFUNDOINVEST IS NOT NULL) AND (FI.IDTIPOFUNDOINVE' +
        'ST = :IDTIPOFUNDOINVEST)) OR'
      '        (:IDTIPOFUNDOINVEST IS NULL))                AND'
      ''
      '     (OPF.IDFUNDOINVEST     = FI.IDFUNDOINVEST)      AND'
      ''
      '      (FI.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST)  AND'
      ''
      '      (HF.IDTIPOINVEST      = OPF.IDTIPOINVEST)      AND'
      ''
      '      (HF.IDPLANPREVCTBPATR = OPF.IDPLANPREVCTBPATR) AND'
      ''
      '      (HF.IDFUNDOINVEST     = OPF.IDFUNDOINVEST)     AND'
      ''
      '      (HF.DATAMOVFUNDO      = OPF.DATAOPERACAO)      AND'
      ''
      '      (HF.IDTIPOOPERACAO    = OPF.IDTIPOOPERACAO)    AND'
      ''
      '      (HF.IDOPERACAOFUNDO   = OPF.IDOPERACAOORIGEM)'
      ''
      
        'ORDER BY TF.DESCTIPOFUNDOINV, FI.DESCFUNDOINVEST, HF.DATAAPLICAC' +
        'AO, OPF.DATAOPERACAO')
    ValidateWithMask = True
    Left = 472
    Top = 134
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAINI'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAFIM'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptResult
      end>
    object qryAjusteDESCTIPOFUNDOINV: TStringField
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'TIPOFUNDOINVEST.DESCTIPOFUNDOINV'
      Size = 80
    end
    object qryAjusteDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object qryAjusteDATAAPLICACAO: TDateTimeField
      FieldName = 'DATAAPLICACAO'
      Origin = 'HISTFUNDO.DATAAPLICACAO'
    end
    object qryAjusteDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERACAOFUNDO.DATAOPERACAO'
    end
    object qryAjusteQTDOPERACAO: TFloatField
      FieldName = 'QTDOPERACAO'
      Origin = 'OPERACAOFUNDO.QTDOPERACAO'
    end
    object qryAjusteSALDOQTDCOTAS: TFloatField
      FieldName = 'SALDOQTDCOTAS'
      Origin = 'HISTFUNDO.SALDOQTDCOTAS'
    end
    object qryAjusteIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'OPERACAOFUNDO.IDFUNDOINVEST'
    end
  end
  object rptAjuste: TppReport
    AutoStop = False
    DataPipeline = ppBDEAjuste
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptAjusteBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 475
    Top = 1
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEAjuste'
    object ppHeaderBand4: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32808
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'shpTransfCab'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 4498
        mmLeft = 0
        mmTop = 28046
        mmWidth = 197300
        BandType = 0
      end
      object ppLine6: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26194
        mmWidth = 197300
        BandType = 0
      end
      object lblAjusteCabDataOper: TppLabel
        UserName = 'lblAjusteCabDataOper'
        Caption = 'Data da Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 83344
        mmTop = 28575
        mmWidth = 26988
        BandType = 0
      end
      object lblAjusteCabDataApli: TppLabel
        UserName = 'lblAjusteCabDataApli'
        Caption = 'Data Aplicação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 53446
        mmTop = 28575
        mmWidth = 22754
        BandType = 0
      end
      object lblAjusteDtInicio: TppLabel
        UserName = 'lblAjusteDtInicio'
        Caption = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 20373
        BandType = 0
      end
      object lblAjustePeriodoA: TppLabel
        UserName = 'lblTransfDataCabTit1'
        Caption = 'a'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 46567
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
      object lblAjusteDtFim: TppLabel
        UserName = 'lblAjusteDtFim'
        Caption = 'DD/MM/YYYY'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 50006
        mmTop = 14023
        mmWidth = 20373
        BandType = 0
      end
      object lblAjusteCabQuantidade: TppLabel
        UserName = 'lblAjusteCabQuantidade'
        Caption = 'Quantidade Ajustada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 126207
        mmTop = 28575
        mmWidth = 31750
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label2'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 187590
        mmTop = 28575
        mmWidth = 8731
        BandType = 0
      end
      object LblPlanoAjuste: TppLabel
        UserName = 'LblPlanoAjuste'
        Caption = 'LblPlanoRentAcoes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 162719
        mmTop = 8731
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label1'
        Caption = 'Ajuste de Cotas - Fundos de Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 70644
        BandType = 0
      end
      object ppLabel90: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa8'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel91: TppLabel
        UserName = 'LCarteira8'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 184415
        mmTop = 14023
        mmWidth = 11906
        BandType = 0
      end
      object ppDBImage8: TppDBImage
        UserName = 'DbLogo8'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
    end
    object bndAjusteDatalhe: TppDetailBand
      BeforePrint = bndAjusteDatalheBeforePrint
      mmBottomOffset = 0
      mmHeight = 3440
      mmPrintPosition = 0
      object ppShape3: TppShape
        OnPrint = shpTransfDetPrint
        UserName = 'shpTransfDet'
        ParentHeight = True
        Pen.Style = psClear
        mmHeight = 3440
        mmLeft = 0
        mmTop = 0
        mmWidth = 197380
        BandType = 4
      end
      object dbeAjusteDtOper: TppDBText
        UserName = 'dbeAjusteSaldoQtd1'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppBDEAjuste
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEAjuste'
        mmHeight = 3440
        mmLeft = 83344
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object dbeAjusteQtdAjustada: TppDBText
        UserName = 'dbeAjusteQtdAjustada'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppBDEAjuste
        DisplayFormat = '###,###,##0.#'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEAjuste'
        mmHeight = 3440
        mmLeft = 126207
        mmTop = 0
        mmWidth = 31485
        BandType = 4
      end
      object dbeAjusteDtAplicacao: TppDBText
        UserName = 'dbeAjusteDtAplicacao'
        DataField = 'DATAAPLICACAO'
        DataPipeline = ppBDEAjuste
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        SuppressRepeatedValues = True
        Transparent = True
        DataPipelineName = 'ppBDEAjuste'
        mmHeight = 3440
        mmLeft = 53446
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object dbeAjusteSaldoQtd: TppDBText
        UserName = 'dbeAjusteSaldoQtd'
        DataField = 'SALDOQTDCOTAS'
        DataPipeline = ppBDEAjuste
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEAjuste'
        mmHeight = 3440
        mmLeft = 163513
        mmTop = 0
        mmWidth = 33338
        BandType = 4
      end
      object dbeAjusteIdFundoinvest: TppDBText
        UserName = 'dbeAjusteIdFundoinvest'
        DataField = 'IDFUNDOINVEST'
        DataPipeline = ppBDEAjuste
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        DataPipelineName = 'ppBDEAjuste'
        mmHeight = 3440
        mmLeft = 3704
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel21: TppLabel
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
        mmTop = 3175
        mmWidth = 196850
        BandType = 8
      end
      object ppSystemVariable7: TppSystemVariable
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 196850
        BandType = 8
      end
      object ppLine7: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable8: TppSystemVariable
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
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DESCTIPOFUNDOINV'
      DataPipeline = ppBDEAjuste
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEAjuste'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object shpAjusteTipoFundo: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentHeight = True
          ParentWidth = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object lblAjusteGrpTipoFundo: TppLabel
          UserName = 'lblAjusteGrpTipoFundo'
          AutoSize = False
          Caption = 'Tipo de Fundo:  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object dbeAjusteTipoFuno: TppDBText
          UserName = 'dbeAjusteTipoFuno'
          AutoSize = True
          DataField = 'DESCTIPOFUNDOINV'
          DataPipeline = ppBDEAjuste
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDEAjuste'
          mmHeight = 4233
          mmLeft = 24606
          mmTop = 0
          mmWidth = 32808
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DESCFUNDOINVEST'
      DataPipeline = ppBDEAjuste
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEAjuste'
      object ppGroupHeaderAjusteFundo: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4775
        mmPrintPosition = 0
        object lblAjusteFundoInvest: TppLabel
          UserName = 'lblAjusteFundoInvest'
          Caption = 'Fundo de Investimento: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 17198
          mmTop = 794
          mmWidth = 36777
          BandType = 3
          GroupNo = 1
        end
        object dbeAjusteFundoInvest: TppDBText
          UserName = 'dbeAjusteFundoInvest'
          AutoSize = True
          DataField = 'DESCFUNDOINVEST'
          DataPipeline = ppBDEAjuste
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'ppBDEAjuste'
          mmHeight = 3704
          mmLeft = 53711
          mmTop = 794
          mmWidth = 31485
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'DATAAPLICACAO'
      DataPipeline = ppBDEAjuste
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEAjuste'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object BDEConsRentFndAcoes: TppBDEPipeline
    DataSource = dsConsRentFndAcoes
    UserName = 'BDEConsRentFndAcoes'
    Left = 263
    Top = 48
    object BDEConsRentFndAcoesppField1: TppField
      FieldAlias = 'BANCO'
      FieldName = 'BANCO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object BDEConsRentFndAcoesppField2: TppField
      FieldAlias = 'FUNDO'
      FieldName = 'FUNDO'
      FieldLength = 60
      DisplayWidth = 45
      Position = 1
    end
    object BDEConsRentFndAcoesppField3: TppField
      FieldAlias = 'CLASS'
      FieldName = 'CLASS'
      FieldLength = 10
      DisplayWidth = 27
      Position = 2
    end
    object BDEConsRentFndAcoesppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOEM'
      FieldName = 'SALDOEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 3
    end
    object BDEConsRentFndAcoesppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERSALDOCAT'
      FieldName = 'PERSALDOCAT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object BDEConsRentFndAcoesppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'RENTDIA'
      FieldName = 'RENTDIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 5
    end
    object BDEConsRentFndAcoesppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARMOEDIA'
      FieldName = 'VARMOEDIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 6
    end
    object BDEConsRentFndAcoesppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCDIA'
      FieldName = 'PERCDIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object BDEConsRentFndAcoesppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'RENTMES'
      FieldName = 'RENTMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 8
    end
    object BDEConsRentFndAcoesppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARMOEMES'
      FieldName = 'VARMOEMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 9
    end
    object BDEConsRentFndAcoesppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCMES'
      FieldName = 'PERCMES'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object BDEConsRentFndAcoesppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'RENTANO'
      FieldName = 'RENTANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 11
    end
    object BDEConsRentFndAcoesppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARMOEANO'
      FieldName = 'VARMOEANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 12
    end
    object BDEConsRentFndAcoesppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCANO'
      FieldName = 'PERCANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object BDEConsRentFndAcoesppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'RENTINI'
      FieldName = 'RENTINI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 14
    end
    object BDEConsRentFndAcoesppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VARMOEINIAPL'
      FieldName = 'VARMOEINIAPL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 15
    end
    object BDEConsRentFndAcoesppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCINIAPL'
      FieldName = 'PERCINIAPL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object BDEConsRentFndAcoesppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'CORCATEGFUNDO'
      FieldName = 'CORCATEGFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object BDEConsRentFndAcoesppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'MOECODIGO'
      FieldName = 'MOECODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object BDEConsRentFndAcoesppField20: TppField
      FieldAlias = 'MOEDESC'
      FieldName = 'MOEDESC'
      FieldLength = 20
      DisplayWidth = 20
      Position = 19
    end
    object BDEConsRentFndAcoesppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'NIVEL'
      FieldName = 'NIVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object BDEConsRentFndAcoesppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOTOT'
      FieldName = 'SALDOTOT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object BDEConsRentFndAcoesppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object BDEConsRentFndAcoesppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOFUNDOINVEST'
      FieldName = 'IDTIPOFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
  end
  object dsConsRentFndAcoes: TwwDataSource
    AutoEdit = False
    DataSet = qryConsRentFndAcoes
    Left = 263
    Top = 93
  end
  object qryConsRentFndAcoes: TwwQuery
    DatabaseName = 'BaseDados'
    Filter = 'SALDOEM > 0'
    SQL.Strings = (
      'SELECT'
      '       PE.NOME AS BANCO,'
      '       FI.DESCFUNDOINVEST AS FUNDO,'
      
        '       DECODE(CF.NOMECATEGFUNDO,NULL,'#39'S/CLASS.'#39',CF.NOMECATEGFUND' +
        'O)  AS CLASS,'
      '       (SD.SALDO) AS SALDOEM,'
      '      ((SD.SALDO/SDCT.SALDO)*100) AS PERSALDOCAT,'
      '       FI.IDFUNDOINVEST, TF.IDTIPOFUNDOINVEST,'
      
        '       (DECODE(CF.NOMECATEGFUNDO,NULL,999,CF.NIVELCATEGFUNDO)) A' +
        'S NIVEL, CF.CORCATEGFUNDO,'
      '       CF.MOECODIGO, MO.MOEDESC,'
      ''
      '       SDT.SALDOTOT,'
      ''
      
        '       DECODE((CFDF.VLRCOTA/CFDI.VLRCOTA),NULL,0,(((CFDF.VLRCOTA' +
        '/CFDI.VLRCOTA)-1)*100)) AS RENTDIA,'
      
        '       DECODE((CFMF.VLRCOTA/CFMI.VLRCOTA),NULL,0,(((CFMF.VLRCOTA' +
        '/CFMI.VLRCOTA)-1)*100)) AS RENTMES,'
      
        '       DECODE((CFAF.VLRCOTA/CFAI.VLRCOTA),NULL,0,(((CFAF.VLRCOTA' +
        '/CFAI.VLRCOTA)-1)*100)) AS RENTANO,'
      ''
      
        '       DECODE((CFDF.VLRCOTA/CFIA.VLRCOTA),NULL,0,(((CFDF.VLRCOTA' +
        '/CFIA.VLRCOTA)-1)*100)) AS RENTINI,'
      ''
      
        '       DECODE((CMDF.COTVALOR/CMDI.COTVALOR),NULL,0,(((CMDF.COTVA' +
        'LOR/CMDI.COTVALOR)-1)*100)) AS VARMOEDIA,'
      
        '       DECODE((CMMF.COTVALOR/CMMI.COTVALOR),NULL,0,(((CMMF.COTVA' +
        'LOR/CMMI.COTVALOR)-1)*100)) AS VARMOEMES,'
      
        '       DECODE((CMAF.COTVALOR/CMAI.COTVALOR),NULL,0,(((CMAF.COTVA' +
        'LOR/CMAI.COTVALOR)-1)*100)) AS VARMOEANO,'
      ''
      
        '       DECODE((CMIA.COTVALOR/CMDF.COTVALOR),NULL,0,(((CMIA.COTVA' +
        'LOR/CMDF.COTVALOR)-1)*100)) AS VARMOEINIAPL,'
      ''
      
        '       DECODE((CFDF.VLRCOTA/DECODE(CFDI.VLRCOTA,0,1,CFDI.VLRCOTA' +
        ')-CMDF.COTVALOR/DECODE(CMDI.COTVALOR,0,1,CMDI.COTVALOR)),NULL,0,'
      
        '                 DECODE((((CFDF.VLRCOTA/CFDI.VLRCOTA)-1)*100),AB' +
        'S(((CFDF.VLRCOTA/CFDI.VLRCOTA)-1)*100)*-1,'
      
        '                           (((CMDF.COTVALOR/CMDI.COTVALOR)-1)*10' +
        '0)/(((CFDF.VLRCOTA/CFDI.VLRCOTA)-1)*100),'
      
        '                           (((CFDF.VLRCOTA/CFDI.VLRCOTA)-1)*100)' +
        '/(((CMDF.COTVALOR/CMDI.COTVALOR)-1)*100))*100) AS PERCDIA,'
      ''
      
        '       DECODE((CFMF.VLRCOTA/DECODE(CFMI.VLRCOTA,0,1,CFMI.VLRCOTA' +
        ')-CMMF.COTVALOR/DECODE(CMMI.COTVALOR,0,1,CMMI.COTVALOR)),NULL,0,'
      
        '                 DECODE((((CFMF.VLRCOTA/CFMI.VLRCOTA)-1)*100),AB' +
        'S(((CFMF.VLRCOTA/CFMI.VLRCOTA)-1)*100)*-1,'
      
        '                           (((CMMF.COTVALOR/CMMI.COTVALOR)-1)*10' +
        '0)/(((CFMF.VLRCOTA/CFMI.VLRCOTA)-1)*100),'
      
        '                           (((CFMF.VLRCOTA/CFMI.VLRCOTA)-1)*100)' +
        '/(((CMMF.COTVALOR/CMMI.COTVALOR)-1)*100))*100) AS  PERCMES,'
      ''
      
        '       DECODE((CFAF.VLRCOTA/DECODE(CFAI.VLRCOTA,0,1,CFAI.VLRCOTA' +
        ')-CMAF.COTVALOR/DECODE(CMAI.COTVALOR,0,1,CMAI.COTVALOR)),NULL,0,'
      
        '                 DECODE((((CFAF.VLRCOTA/CFAI.VLRCOTA)-1)*100),AB' +
        'S(((CFAF.VLRCOTA/CFAI.VLRCOTA)-1)*100)*-1,'
      
        '                           (((CMAF.COTVALOR/CMAI.COTVALOR)-1)*10' +
        '0)/(((CFAF.VLRCOTA/CFAI.VLRCOTA)-1)*100),'
      
        '                           (((CFAF.VLRCOTA/CFAI.VLRCOTA)-1)*100)' +
        '/(((CMAF.COTVALOR/CMAI.COTVALOR)-1)*100))*100) AS PERCANO,'
      ''
      
        '       DECODE((CFIA.VLRCOTA/DECODE(CFDF.VLRCOTA,0,1,CFDF.VLRCOTA' +
        ')-CMIA.COTVALOR/DECODE(CMDF.COTVALOR,0,1,CMDF.COTVALOR)),NULL,0,'
      
        '                 DECODE((((CFIA.VLRCOTA/CFDF.VLRCOTA)-1)*100),AB' +
        'S(((CFIA.VLRCOTA/CFDF.VLRCOTA)-1)*100)*-1,'
      
        '                           (((CMIA.COTVALOR/CMDF.COTVALOR)-1)*10' +
        '0)/(((CFIA.VLRCOTA/CFDF.VLRCOTA)-1)*100),'
      
        '                           (((CFIA.VLRCOTA/CFDF.VLRCOTA)-1)*100)' +
        '/(((CMIA.COTVALOR/CMDF.COTVALOR)-1)*100))*100) AS PERCINIAPL'
      ''
      
        'FROM PESSOA PE, FUNDOINVEST FI, CATEGORIAFUNDO CF, MOEDA MO, TIP' +
        'OFUNDOINVEST TF,'
      
        '     (SELECT IDFUNDOINVEST,SUM(SALDOQTDCOTAS) AS SALDOQTDCOTAS,S' +
        'UM(SALDOVLRFUNDO) AS SALDO'
      '      FROM   HISTFUNDO'
      '      WHERE  (IDHISTFUNDO IN ('
      '                SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                FROM HISTFUNDO'
      '                WHERE'
      
        '                     (IDTIPOINVEST       = 6)                  A' +
        'ND'
      
        '                     (IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR) A' +
        'ND'
      
        '                     (DATAMOVFUNDO       = :DATAREF)            ' +
        'AND'
      
        '                    ((DATAMOVFUNDO       < :DATAREF) OR IDHISTFU' +
        'NDO < 999999999)'
      
        '                GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR, IDFUND' +
        'OINVEST, DATAAPLICACAO, DATAMOVFUNDO )) AND'
      '             (SALDOQTDCOTAS > 0)'
      '      GROUP BY IDFUNDOINVEST ) SD,'
      ''
      
        '     (SELECT FU.IDCATEGORIAFUNDO,SUM(H1.SALDOQTDCOTAS) AS SALDOQ' +
        'TDCOTAS,SUM(H1.SALDOVLRFUNDO) AS SALDO'
      '      FROM   HISTFUNDO H1, FUNDOINVEST FU, TIPOFUNDOINVEST TF'
      '      WHERE  (IDHISTFUNDO IN ('
      '                SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                FROM HISTFUNDO'
      '                WHERE'
      
        '                     (IDTIPOINVEST       = 6)                  A' +
        'ND'
      
        '                     (IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR) A' +
        'ND'
      
        '                     (DATAMOVFUNDO       = :DATAREF)           A' +
        'ND'
      
        '                    ((DATAMOVFUNDO       < :DATAREF) OR IDHISTFU' +
        'NDO < 999999999)'
      
        '                GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR, IDFUND' +
        'OINVEST, DATAAPLICACAO, DATAMOVFUNDO )) AND'
      '             (SALDOQTDCOTAS > 0) AND'
      '             (TF.IDTIPOINVEST      = 6)                    AND'
      '             (FU.IDTIPOFUNDOINVEST = TF.IDTIPOFUNDOINVEST) AND'
      '             (FU.IDFUNDOINVEST     = H1.IDFUNDOINVEST)'
      '      GROUP BY FU.IDCATEGORIAFUNDO ) SDCT,'
      ''
      
        '     (SELECT SUM(SALDOQTDCOTAS) AS SALDOQTDCOTAS, SUM(SALDOVLRFU' +
        'NDO) AS SALDOTOT'
      '      FROM   HISTFUNDO'
      '      WHERE  (IDHISTFUNDO IN ('
      '                SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                FROM HISTFUNDO'
      '                WHERE'
      
        '                     (IDTIPOINVEST       = 6)                  A' +
        'ND'
      
        '                     (IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR) A' +
        'ND'
      
        '                     (DATAMOVFUNDO       = :DATAREF)           A' +
        'ND'
      
        '                    ((DATAMOVFUNDO       < :DATAREF) OR IDHISTFU' +
        'NDO < 999999999)'
      
        '                GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR, IDFUND' +
        'OINVEST, DATAAPLICACAO, DATAMOVFUNDO )) AND'
      '             (SALDOQTDCOTAS > 0)) SDT,'
      ''
      
        '     (SELECT IDFUNDOINVEST, VLRCOTA  FROM COTAFUNDO    WHERE DAT' +
        'ACOTA = :DATADIA ) CFDI,'
      
        '     (SELECT IDFUNDOINVEST, VLRCOTA  FROM COTAFUNDO    WHERE DAT' +
        'ACOTA = :DATAREF ) CFDF,'
      
        '     (SELECT IDFUNDOINVEST, VLRCOTA  FROM COTAFUNDO    WHERE DAT' +
        'ACOTA = :DATAMES ) CFMI,'
      
        '     (SELECT IDFUNDOINVEST, VLRCOTA  FROM COTAFUNDO    WHERE DAT' +
        'ACOTA = :DATAREF ) CFMF,'
      
        '     (SELECT IDFUNDOINVEST, VLRCOTA  FROM COTAFUNDO    WHERE DAT' +
        'ACOTA = :DATAANO ) CFAI,'
      
        '     (SELECT IDFUNDOINVEST, VLRCOTA  FROM COTAFUNDO    WHERE DAT' +
        'ACOTA = :DATAREF ) CFAF,'
      ''
      
        '     (SELECT IDFUNDOINVEST, VLRCOTA, DATACOTA  FROM COTAFUNDO   ' +
        ' WHERE IDFUNDOINVEST||DATACOTA IN'
      '     (SELECT IDFUNDOINVEST||MIN(DATAAPLICACAO) AS DATAAPLICACAO'
      '      FROM   HISTFUNDO'
      '      WHERE  (IDHISTFUNDO IN ('
      '                SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                FROM HISTFUNDO'
      '                WHERE'
      
        '                     (IDTIPOINVEST       = 6)                  A' +
        'ND'
      
        '                     (IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR) A' +
        'ND'
      
        '                     (DATAMOVFUNDO       = :DATAREF)           A' +
        'ND'
      
        '                    ((DATAMOVFUNDO       < :DATAREF) OR IDHISTFU' +
        'NDO < 999999999)'
      
        '                GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR, IDFUND' +
        'OINVEST, DATAAPLICACAO, DATAMOVFUNDO )) AND'
      '             (SALDOQTDCOTAS > 0)'
      '      GROUP BY IDFUNDOINVEST) ) CFIA,'
      ''
      
        '     (SELECT MOECODIGO    , COTVALOR FROM COTACAOMOEDA WHERE COT' +
        'DATA  = :DATADIA ) CMDI,'
      
        '     (SELECT MOECODIGO    , COTVALOR FROM COTACAOMOEDA WHERE COT' +
        'DATA  = :DATAREF ) CMDF,'
      
        '     (SELECT MOECODIGO    , COTVALOR FROM COTACAOMOEDA WHERE COT' +
        'DATA  = :DATAMES ) CMMI,'
      
        '     (SELECT MOECODIGO    , COTVALOR FROM COTACAOMOEDA WHERE COT' +
        'DATA  = :DATAREF ) CMMF,'
      
        '     (SELECT MOECODIGO    , COTVALOR FROM COTACAOMOEDA WHERE COT' +
        'DATA  = :DATAANO ) CMAI,'
      
        '     (SELECT MOECODIGO    , COTVALOR FROM COTACAOMOEDA WHERE COT' +
        'DATA  = :DATAREF ) CMAF,'
      ''
      
        '     (SELECT MOECODIGO, COTVALOR, COTDATA FROM COTACAOMOEDA WHER' +
        'E COTDATA IN'
      '     (SELECT DISTINCT MIN(DATAAPLICACAO) AS DATAAPLICACAO'
      '      FROM   HISTFUNDO'
      '      WHERE  (IDHISTFUNDO IN ('
      '                SELECT MAX(IDHISTFUNDO) AS IDHISTFUNDO'
      '                FROM HISTFUNDO'
      '                WHERE'
      
        '                     (IDTIPOINVEST       = 6)                  A' +
        'ND'
      '                     (IDPLANPREVCTBPATR  = 1) AND'
      
        '                     (DATAMOVFUNDO       = '#39'30/03/2007'#39')        ' +
        '    AND'
      
        '                    ((DATAMOVFUNDO       < '#39'30/03/2007'#39') OR IDHI' +
        'STFUNDO < 999999999)'
      
        '                GROUP BY IDTIPOINVEST, IDPLANPREVCTBPATR, IDFUND' +
        'OINVEST, DATAAPLICACAO, DATAMOVFUNDO )) AND'
      '             (SALDOQTDCOTAS > 0)'
      '      GROUP BY IDFUNDOINVEST) ) CMIA'
      ''
      'WHERE'
      '      PE.IDPESSOA(+)           = FI.IDGESTORCARTEIRA     AND'
      '      SD.IDFUNDOINVEST(+)      = FI.IDFUNDOINVEST        AND'
      '      CF.IDCATEGORIAFUNDO(+)   = FI.IDCATEGORIAFUNDO     AND'
      '      MO.MOECODIGO(+)          = CF.MOECODIGO            AND'
      '      TF.IDTIPOINVEST          = 6                       AND'
      '      TF.IDTIPOFUNDOINVEST     = FI.IDTIPOFUNDOINVEST    AND'
      '      SDCT.IDCATEGORIAFUNDO(+) = FI.IDCATEGORIAFUNDO     AND'
      '      CFDI.IDFUNDOINVEST(+)    = FI.IDFUNDOINVEST        AND'
      '      CFDF.IDFUNDOINVEST(+)    = FI.IDFUNDOINVEST        AND'
      '      CFMI.IDFUNDOINVEST(+)    = FI.IDFUNDOINVEST        AND'
      '      CFMF.IDFUNDOINVEST(+)    = FI.IDFUNDOINVEST        AND'
      '      CFAI.IDFUNDOINVEST(+)    = FI.IDFUNDOINVEST        AND'
      '      CFAF.IDFUNDOINVEST(+)    = FI.IDFUNDOINVEST        AND'
      ''
      '      CFIA.IDFUNDOINVEST(+)    = FI.IDFUNDOINVEST        AND'
      ''
      '      CMDI.MOECODIGO(+)        = CF.MOECODIGO            AND'
      '      CMDF.MOECODIGO(+)        = CF.MOECODIGO            AND'
      '      CMMI.MOECODIGO(+)        = CF.MOECODIGO            AND'
      '      CMMF.MOECODIGO(+)        = CF.MOECODIGO            AND'
      '      CMAI.MOECODIGO(+)        = CF.MOECODIGO            AND'
      '      CMAF.MOECODIGO(+)        = CF.MOECODIGO            AND'
      ''
      '      CMIA.MOECODIGO(+)        = CF.MOECODIGO            AND'
      '      CMIA.COTDATA             = CFIA.DATACOTA'
      ''
      'ORDER BY NIVEL, CLASS, (DECODE(:ORDEM,-1,RENTDIA,'
      '                        DECODE(:ORDEM, 0,RENTDIA,'
      '                        DECODE(:ORDEM, 1,RENTMES,'
      
        '                        DECODE(:ORDEM, 2,RENTANO,RENTDIA))))) DE' +
        'SC')
    ValidateWithMask = True
    Left = 264
    Top = 138
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATADIA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAANO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATADIA'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMES'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAANO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ORDEM'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ORDEM'
        ParamType = ptInput
      end>
    object qryConsRentFndAcoesBANCO: TStringField
      DisplayLabel = 'Banco'
      DisplayWidth = 30
      FieldName = 'BANCO'
      Size = 60
    end
    object qryConsRentFndAcoesFUNDO: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 45
      FieldName = 'FUNDO'
      Size = 60
    end
    object qryConsRentFndAcoesCLASS: TStringField
      DisplayLabel = 'Categoria'
      DisplayWidth = 27
      FieldName = 'CLASS'
      Size = 10
    end
    object qryConsRentFndAcoesSALDOEM: TFloatField
      DisplayLabel = 'Saldo na Data'
      DisplayWidth = 19
      FieldName = 'SALDOEM'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryConsRentFndAcoesPERSALDOCAT: TFloatField
      DisplayLabel = '% Categoria'
      DisplayWidth = 10
      FieldName = 'PERSALDOCAT'
      DisplayFormat = '##,##0.0000%'
    end
    object qryConsRentFndAcoesRENTDIA: TFloatField
      DisplayLabel = 'Rent. Fundo Dia'
      DisplayWidth = 13
      FieldName = 'RENTDIA'
      DisplayFormat = '##0.0000'
    end
    object qryConsRentFndAcoesVARMOEDIA: TFloatField
      DisplayLabel = 'Rent. Moeda Dia'
      DisplayWidth = 13
      FieldName = 'VARMOEDIA'
      DisplayFormat = '##0.0000'
    end
    object qryConsRentFndAcoesPERCDIA: TFloatField
      DisplayLabel = 'Dif. Dia'
      DisplayWidth = 10
      FieldName = 'PERCDIA'
      DisplayFormat = '##0.0000'
    end
    object qryConsRentFndAcoesRENTMES: TFloatField
      DisplayLabel = 'Rent. Fundo Mês'
      DisplayWidth = 13
      FieldName = 'RENTMES'
      DisplayFormat = '##0.0000'
    end
    object qryConsRentFndAcoesVARMOEMES: TFloatField
      DisplayLabel = 'Rent. Moeda Mês'
      DisplayWidth = 14
      FieldName = 'VARMOEMES'
      DisplayFormat = '##0.0000'
    end
    object qryConsRentFndAcoesPERCMES: TFloatField
      DisplayLabel = 'Dif. Mês'
      DisplayWidth = 10
      FieldName = 'PERCMES'
      DisplayFormat = '##0.0000'
    end
    object qryConsRentFndAcoesRENTANO: TFloatField
      DisplayLabel = 'Rent. Fundo Ano'
      DisplayWidth = 13
      FieldName = 'RENTANO'
      DisplayFormat = '##0.0000'
    end
    object qryConsRentFndAcoesVARMOEANO: TFloatField
      DisplayLabel = 'Rent. Moeda Ano'
      DisplayWidth = 14
      FieldName = 'VARMOEANO'
      DisplayFormat = '##0.0000'
    end
    object qryConsRentFndAcoesPERCANO: TFloatField
      DisplayLabel = 'Dif. Ano'
      DisplayWidth = 10
      FieldName = 'PERCANO'
      DisplayFormat = '##0.0000'
    end
    object qryConsRentFndAcoesRENTINI: TFloatField
      DisplayLabel = 'Rent. Fundo Início'
      DisplayWidth = 13
      FieldName = 'RENTINI'
      DisplayFormat = '###,###0.0000'
    end
    object qryConsRentFndAcoesVARMOEINIAPL: TFloatField
      DisplayLabel = 'Rent. Moeda Início'
      DisplayWidth = 14
      FieldName = 'VARMOEINIAPL'
      DisplayFormat = '###,###0.0000'
    end
    object qryConsRentFndAcoesPERCINIAPL: TFloatField
      DisplayLabel = 'Dif. Início'
      DisplayWidth = 10
      FieldName = 'PERCINIAPL'
      DisplayFormat = '###,###0.0000'
    end
    object qryConsRentFndAcoesCORCATEGFUNDO: TFloatField
      FieldName = 'CORCATEGFUNDO'
      Visible = False
    end
    object qryConsRentFndAcoesMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryConsRentFndAcoesMOEDESC: TStringField
      FieldName = 'MOEDESC'
      Visible = False
      FixedChar = True
    end
    object qryConsRentFndAcoesNIVEL: TFloatField
      FieldName = 'NIVEL'
      Visible = False
    end
    object qryConsRentFndAcoesSALDOTOT: TFloatField
      FieldName = 'SALDOTOT'
      Visible = False
    end
    object qryConsRentFndAcoesIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryConsRentFndAcoesIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
  end
  object rptConsRentFndAcoes: TppReport
    AutoStop = False
    DataPipeline = BDEConsRentFndAcoes
    OnStartPage = rptConsRentFundosStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Rentabilidade dos Fundos'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptConsRentFndAcoesBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 263
    Top = 1
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BDEConsRentFndAcoes'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 32808
      mmPrintPosition = 0
      object shpRentFNDAcoesCab: TppShape
        UserName = 'shpConsRentFndCab'
        Brush.Color = clSilver
        mmHeight = 8202
        mmLeft = 0
        mmTop = 24606
        mmWidth = 284163
        BandType = 0
      end
      object lblConsRFAFundo: TppLabel
        UserName = 'lblConsRFAFundo'
        Caption = 'Fundo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 58473
        mmTop = 29633
        mmWidth = 7408
        BandType = 0
      end
      object lblConsRFASaldo: TppLabel
        UserName = 'lblConsRFASaldo'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 140759
        mmTop = 29633
        mmWidth = 6615
        BandType = 0
      end
      object lblConsRFAGestor: TppLabel
        UserName = 'lblConsRFAGestor'
        Caption = 'Gestor'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 794
        mmTop = 29633
        mmWidth = 7938
        BandType = 0
      end
      object lblConsRFARentFundoDia: TppLabel
        UserName = 'lblConsRFARentFundoDia'
        Caption = 'Fundo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 167217
        mmTop = 29633
        mmWidth = 7408
        BandType = 0
      end
      object lblConsRFADifDia: TppLabel
        UserName = 'Label1'
        Caption = 'Diferencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 175419
        mmTop = 29633
        mmWidth = 12435
        BandType = 0
      end
      object lblConsRFARentDia: TppLabel
        UserName = 'lblConsRFARentDia'
        AutoSize = False
        Caption = 'Rent. Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 162190
        mmTop = 26194
        mmWidth = 24342
        BandType = 0
      end
      object lblConsRFARentFundoMes: TppLabel
        UserName = 'lblConsRFARentFundoMes'
        Caption = 'Fundo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 194998
        mmTop = 29633
        mmWidth = 7408
        BandType = 0
      end
      object lblConsRFADifMes: TppLabel
        UserName = 'lblConsRFADifMes'
        Caption = 'Diferencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 203730
        mmTop = 29633
        mmWidth = 12435
        BandType = 0
      end
      object lblConsRFARentMes: TppLabel
        UserName = 'lblConsRFARentMes'
        AutoSize = False
        Caption = 'Rent. Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 189442
        mmTop = 26194
        mmWidth = 25929
        BandType = 0
      end
      object lblConsRFARentFundoAno: TppLabel
        UserName = 'lblConsRFARentFundoAno'
        Caption = 'Fundo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 222250
        mmTop = 29633
        mmWidth = 7408
        BandType = 0
      end
      object lblConsRFADifAno: TppLabel
        UserName = 'lblConsRFADifAno'
        Caption = 'Diferencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 231246
        mmTop = 29633
        mmWidth = 12435
        BandType = 0
      end
      object lblConsRFARentAno: TppLabel
        UserName = 'lblConsRFARentAno'
        AutoSize = False
        Caption = 'Rent. Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 217223
        mmTop = 25929
        mmWidth = 25929
        BandType = 0
      end
      object lblConsRFAPlanoPatr: TppLabel
        UserName = 'lblConsRFAPlanoPatr'
        Caption = 'lblConsRFAPlanoPatr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 251090
        mmTop = 20373
        mmWidth = 33073
        BandType = 0
      end
      object lblConsRFARankingTit2: TppLabel
        UserName = 'lblConsRFARankingTit2'
        Caption = 'Ranking por Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 5821
        mmLeft = 273315
        mmTop = 26194
        mmWidth = 9790
        BandType = 0
      end
      object lblConsRFAPerCateg: TppLabel
        UserName = 'lblConsRFAPerCateg'
        Caption = '% Categoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 148961
        mmTop = 29633
        mmWidth = 14023
        BandType = 0
      end
      object LblPlanoRentAcoes: TppLabel
        UserName = 'LblPlanoRentAcoes'
        Caption = 'LblPlanoRentAcoes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 250561
        mmTop = 8731
        mmWidth = 33602
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Rentabilidade de Fundos de Ações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 59002
        BandType = 0
      end
      object ppLabel52: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa5'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'LCarteira5'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 272257
        mmTop = 14023
        mmWidth = 11906
        BandType = 0
      end
      object lblConsRFADtRef: TppLabel
        UserName = 'LPeriodo5'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage5: TppDBImage
        UserName = 'DbLogo5'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'lblConsRFARentAno1'
        AutoSize = False
        Caption = 'Rent. Início'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 246857
        mmTop = 25929
        mmWidth = 25929
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'lblConsRFARentFundoAno1'
        Caption = 'Fundo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 250825
        mmTop = 29633
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'lblConsRFADifAno1'
        Caption = 'Diferencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 260351
        mmTop = 29633
        mmWidth = 12435
        BandType = 0
      end
    end
    object bndConsRFADetail: TppDetailBand
      BeforePrint = bndConsRFADetailBeforePrint
      mmBottomOffset = 0
      mmHeight = 2646
      mmPrintPosition = 0
      object shpConsRentFNDAcoesDet: TppShape
        OnPrint = ppSConsRentFndCabPrint
        UserName = 'ppSConsRentFndDet'
        ParentHeight = True
        Pen.Style = psClear
        ShiftWithParent = True
        mmHeight = 2646
        mmLeft = 0
        mmTop = 0
        mmWidth = 283634
        BandType = 4
      end
      object dbeConsRFAFundo: TppDBText
        UserName = 'DBConsRentFndFundo'
        DataField = 'FUNDO'
        DataPipeline = BDEConsRentFndAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BDEConsRentFndAcoes'
        mmHeight = 2646
        mmLeft = 58473
        mmTop = 0
        mmWidth = 65617
        BandType = 4
      end
      object dbeConsRFASaldo: TppDBText
        UserName = 'DBConsRentFndSaldoEm'
        DataField = 'SALDOEM'
        DataPipeline = BDEConsRentFndAcoes
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEConsRentFndAcoes'
        mmHeight = 2646
        mmLeft = 124884
        mmTop = 0
        mmWidth = 23019
        BandType = 4
      end
      object dbeConsRFARentAno: TppDBText
        UserName = 'dbeConsRFARentAno'
        DataField = 'RENTANO'
        DataPipeline = BDEConsRentFndAcoes
        DisplayFormat = '##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEConsRentFndAcoes'
        mmHeight = 2646
        mmLeft = 218017
        mmTop = 0
        mmWidth = 12171
        BandType = 4
      end
      object dbeConsRFARentMes: TppDBText
        UserName = 'DBConsRentFndRentMes'
        DataField = 'RENTMES'
        DataPipeline = BDEConsRentFndAcoes
        DisplayFormat = '##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEConsRentFndAcoes'
        mmHeight = 2646
        mmLeft = 189971
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object dbeConsRFAGestor: TppDBText
        UserName = 'DBConsRentFndBanco'
        DataField = 'BANCO'
        DataPipeline = BDEConsRentFndAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'BDEConsRentFndAcoes'
        mmHeight = 2646
        mmLeft = 794
        mmTop = 0
        mmWidth = 57150
        BandType = 4
      end
      object dbeConsRFARentDia: TppDBText
        UserName = 'dbeConsRFARentDia'
        DataField = 'RENTDIA'
        DataPipeline = BDEConsRentFndAcoes
        DisplayFormat = '##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEConsRentFndAcoes'
        mmHeight = 2646
        mmLeft = 163248
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object dbeConsRFADifDia: TppDBText
        UserName = 'dbeConsRFADifDia'
        DataField = 'PERCDIA'
        DataPipeline = BDEConsRentFndAcoes
        DisplayFormat = '##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEConsRentFndAcoes'
        mmHeight = 2646
        mmLeft = 176213
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object dbeConsRFADifMes: TppDBText
        UserName = 'dbeConsRFADifMes'
        DataField = 'PERCMES'
        DataPipeline = BDEConsRentFndAcoes
        DisplayFormat = '##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEConsRentFndAcoes'
        mmHeight = 2646
        mmLeft = 203730
        mmTop = 0
        mmWidth = 12435
        BandType = 4
      end
      object dbeConsRFADifAno: TppDBText
        UserName = 'dbeConsRFADifAno'
        DataField = 'PERCANO'
        DataPipeline = BDEConsRentFndAcoes
        DisplayFormat = '##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEConsRentFndAcoes'
        mmHeight = 2646
        mmLeft = 230717
        mmTop = 0
        mmWidth = 12965
        BandType = 4
      end
      object lblConsRFARanking: TppLabel
        OnPrint = lblConsRFARankingPrint
        UserName = 'lblConsRFARanking'
        AutoSize = False
        Caption = '0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 274638
        mmTop = 0
        mmWidth = 8467
        BandType = 4
      end
      object dbeConsRFARPerCateg: TppDBText
        UserName = 'dbeConsRFARPerCateg'
        DataField = 'PERSALDOCAT'
        DataPipeline = BDEConsRentFndAcoes
        DisplayFormat = '##,##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEConsRentFndAcoes'
        mmHeight = 2646
        mmLeft = 148696
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'dbeConsRFARentAno1'
        DataField = 'RENTINI'
        DataPipeline = BDEConsRentFndAcoes
        DisplayFormat = '###,####0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEConsRentFndAcoes'
        mmHeight = 2646
        mmLeft = 243947
        mmTop = 0
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'dbeConsRFADifAno1'
        DataField = 'PERCINIAPL'
        DataPipeline = BDEConsRentFndAcoes
        DisplayFormat = '##0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDEConsRentFndAcoes'
        mmHeight = 2646
        mmLeft = 259292
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppLabel35: TppLabel
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
        mmTop = 1588
        mmWidth = 280988
        BandType = 8
      end
      object ppSystemVariable9: TppSystemVariable
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
        mmLeft = 0
        mmTop = 1588
        mmWidth = 283898
        BandType = 8
      end
      object ppLine8: TppLine
        UserName = 'LineConsRentFnd2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppSystemVariable10: TppSystemVariable
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
        mmLeft = 256911
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object shpConsRFATotal: TppShape
        UserName = 'Shape2'
        Brush.Color = 14935011
        mmHeight = 3704
        mmLeft = 98425
        mmTop = 1323
        mmWidth = 49477
        BandType = 7
      end
      object lblConsRFATotalTit: TppLabel
        UserName = 'lblConsRentFndTotGerTit'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 98954
        mmTop = 1852
        mmWidth = 13494
        BandType = 7
      end
      object lblConsRFATotal: TppLabel
        UserName = 'lblConsRentFndTotGer'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 141288
        mmTop = 1852
        mmWidth = 5821
        BandType = 7
      end
    end
    object ppGroup6: TppGroup
      BreakName = 'CLASS'
      DataPipeline = BDEConsRentFndAcoes
      OutlineSettings.CreateNode = True
      UserName = 'Group6'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDEConsRentFndAcoes'
      object ppGroupHeaderBand6: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object shpConsRentFNDAcoesGrpClass: TppShape
          UserName = 'shpConsRentFNDAcoesGrpClass'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 3704
          mmLeft = 0
          mmTop = 265
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
        end
        object lblConsRFACategoria: TppLabel
          UserName = 'Label7'
          Caption = 'Categoria :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 794
          mmTop = 265
          mmWidth = 12785
          BandType = 3
          GroupNo = 0
        end
        object dbeConsRFACategoria: TppDBText
          UserName = 'DBConsRentFndCategoria'
          DataField = 'CLASS'
          DataPipeline = BDEConsRentFndAcoes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'BDEConsRentFndAcoes'
          mmHeight = 2646
          mmLeft = 14288
          mmTop = 529
          mmWidth = 43921
          BandType = 3
          GroupNo = 0
        end
        object dbeConsRFARMoedaDia: TppDBText
          UserName = 'dbeConsRFARMoedaDia'
          DataField = 'VARMOEDIA'
          DataPipeline = BDEConsRentFndAcoes
          DisplayFormat = '##0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEConsRentFndAcoes'
          mmHeight = 2646
          mmLeft = 162984
          mmTop = 529
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object dbeConsRFARMoedaAno: TppDBText
          UserName = 'dbeConsRFARMoedaAno'
          DataField = 'VARMOEANO'
          DataPipeline = BDEConsRentFndAcoes
          DisplayFormat = '##0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEConsRentFndAcoes'
          mmHeight = 2646
          mmLeft = 218546
          mmTop = 529
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object dbeConsRFARMoedaMes: TppDBText
          UserName = 'dbeConsRFARMoedaMes'
          DataField = 'VARMOEMES'
          DataPipeline = BDEConsRentFndAcoes
          DisplayFormat = '##0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEConsRentFndAcoes'
          mmHeight = 2646
          mmLeft = 190500
          mmTop = 529
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object dbeConsRFAMoeda: TppDBText
          UserName = 'dbeConsRFAMoeda'
          DataField = 'MOEDESC'
          DataPipeline = BDEConsRentFndAcoes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'BDEConsRentFndAcoes'
          mmHeight = 2646
          mmLeft = 68792
          mmTop = 529
          mmWidth = 79904
          BandType = 3
          GroupNo = 0
        end
        object lblConsRFAMoeda: TppLabel
          UserName = 'lblConsRFAMoeda'
          Caption = 'Moeda :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2921
          mmLeft = 59002
          mmTop = 529
          mmWidth = 9271
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'dbeConsRFARMoedaAno1'
          DataField = 'VARMOEINIAPL'
          DataPipeline = BDEConsRentFndAcoes
          DisplayFormat = '###,####0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEConsRentFndAcoes'
          mmHeight = 2646
          mmLeft = 243947
          mmTop = 794
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
      end
      object grpConsRFARRodapeCLASS: TppGroupFooterBand
        BeforePrint = grpConsRFARRodapeCLASSBeforePrint
        mmBottomOffset = 0
        mmHeight = 8731
        mmPrintPosition = 0
        object dbcConsRFATotalCat: TppDBCalc
          UserName = 'dbcConsRFATotalCat'
          DataField = 'SALDOEM'
          DataPipeline = BDEConsRentFndAcoes
          DisplayFormat = '###,###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEConsRentFndAcoes'
          mmHeight = 2646
          mmLeft = 121709
          mmTop = 2381
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
        object lblConsRFATotalGeral: TppLabel
          UserName = 'Label2'
          Caption = 'Total da Categoria:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 98954
          mmTop = 2381
          mmWidth = 21960
          BandType = 5
          GroupNo = 0
        end
        object dbcConsRFARentDia: TppDBCalc
          UserName = 'dbcConsRFARentDia'
          DataField = 'RENTDIA'
          DataPipeline = BDEConsRentFndAcoes
          DisplayFormat = '##0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcAverage
          DataPipelineName = 'BDEConsRentFndAcoes'
          mmHeight = 2646
          mmLeft = 163513
          mmTop = 2381
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
        end
        object dbcConsRFARentMes: TppDBCalc
          UserName = 'dbcConsRFARentMes'
          DataField = 'RENTMES'
          DataPipeline = BDEConsRentFndAcoes
          DisplayFormat = '##0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcAverage
          DataPipelineName = 'BDEConsRentFndAcoes'
          mmHeight = 2646
          mmLeft = 189707
          mmTop = 2381
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
        end
        object dbcConsRFARentAno: TppDBCalc
          UserName = 'dbcConsRFARentAno'
          DataField = 'RENTANO'
          DataPipeline = BDEConsRentFndAcoes
          DisplayFormat = '##0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcAverage
          DataPipelineName = 'BDEConsRentFndAcoes'
          mmHeight = 2646
          mmLeft = 218546
          mmTop = 2381
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
        object dbcConsRFAPerCateg: TppDBCalc
          UserName = 'dbcConsRFAPerCateg'
          DataField = 'PERSALDOCAT'
          DataPipeline = BDEConsRentFndAcoes
          DisplayFormat = '##,##0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDEConsRentFndAcoes'
          mmHeight = 2646
          mmLeft = 150284
          mmTop = 2381
          mmWidth = 11642
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'dbcConsRFARentAno1'
          DataField = 'RENTINI'
          DataPipeline = BDEConsRentFndAcoes
          DisplayFormat = '###,####0.0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup6
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcAverage
          DataPipelineName = 'BDEConsRentFndAcoes'
          mmHeight = 2646
          mmLeft = 243946
          mmTop = 2381
          mmWidth = 14288
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line3'
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 98954
          mmTop = 794
          mmWidth = 185209
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object rptVdAcoesCpFundos: TppReport
    AutoStop = False
    DataPipeline = ppBDEVdAcoesCpFundos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptVdAcoesCpFundosBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 38
    Top = 240
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEVdAcoesCpFundos'
    object ppHeaderBand7: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 52917
      mmPrintPosition = 0
      object ppShape6: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 0
        mmTop = 47096
        mmWidth = 284428
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'ppLine42'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 46831
        mmWidth = 284300
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'ppLine43'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 52388
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label15'
        Caption = 'Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 47890
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label16'
        Caption = 'Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24342
        mmTop = 47890
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label17'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 89429
        mmTop = 47890
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label18'
        Caption = 'Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 127000
        mmTop = 47890
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'Label19'
        Caption = 'Valor Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 149225
        mmTop = 47890
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label22'
        Caption = 'Fundo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 31750
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'Gestor :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 166159
        mmTop = 31750
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Cota    :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 2910
        mmTop = 36777
        mmWidth = 12965
        BandType = 0
      end
      object rptVdAcoesCpFundoslblFundo: TppLabel
        UserName = 'rptVdAcoesCpFundoslblFundo'
        Caption = 'Fundo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 31750
        mmWidth = 10583
        BandType = 0
      end
      object rptVdAcoesCpFundoslblGestor: TppLabel
        UserName = 'rptVdAcoesCpFundoslblGestor'
        Caption = 'Gestor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 189442
        mmTop = 31750
        mmWidth = 11377
        BandType = 0
      end
      object rptVdAcoesCpFundoslblCota: TppLabel
        UserName = 'rptVdAcoesCpFundoslblCota'
        Caption = 'Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 17198
        mmTop = 36777
        mmWidth = 7144
        BandType = 0
      end
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Data Cota :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 57679
        mmTop = 36777
        mmWidth = 18521
        BandType = 0
      end
      object rptVdAcoesCpFundoslblDtaCota: TppLabel
        UserName = 'Label401'
        Caption = 'Data Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 78052
        mmTop = 36777
        mmWidth = 15346
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'Liquidação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 173567
        mmTop = 47890
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel44: TppLabel
        UserName = 'Label402'
        Caption = 'Valor Aplicado :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 102923
        mmTop = 36777
        mmWidth = 26988
        BandType = 0
      end
      object rptVdAcoesCpFundoslblVlrAplicado: TppLabel
        UserName = 'rptVdAcoesCpFundoslblVlrAplicado'
        Caption = 'Valor Aplicado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 131234
        mmTop = 36777
        mmWidth = 22225
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label403'
        Caption = 'Quantidade :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 166159
        mmTop = 36777
        mmWidth = 21960
        BandType = 0
      end
      object rptVdAcoesCpFundoslblQuantidade: TppLabel
        UserName = 'rptVdAcoesCpFundoslblQuantidade'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 189442
        mmTop = 36777
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel42: TppLabel
        UserName = 'Label42'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 194998
        mmTop = 47890
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel43: TppLabel
        UserName = 'Label43'
        Caption = 'Custodiante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 260615
        mmTop = 47890
        mmWidth = 17727
        BandType = 0
      end
      object ppLine17: TppLine
        UserName = 'Line17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 42333
        mmWidth = 284300
        BandType = 0
      end
      object ppLine18: TppLine
        UserName = 'Line18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 30427
        mmWidth = 284300
        BandType = 0
      end
      object LblPlanoVdAc: TppLabel
        UserName = 'LblPlanoVdAc'
        Caption = 'LblPlanoVdAc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 252148
        mmTop = 8731
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label1'
        Caption = 'Venda de Ações para Compra de  Fundos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 67998
        BandType = 0
      end
      object ppLabel77: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel78: TppLabel
        UserName = 'LCarteira2'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 264055
        mmTop = 14023
        mmWidth = 12435
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DbLogo2'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 29633
        mmWidth = 284300
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'LPeriodo2'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 11377
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape5: TppShape
        OnPrint = shpAmortCotasFndPrint
        UserName = 'RpConsCartRendVarShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        ReprintOnOverFlow = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppBDEVdAcoesCpFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEVdAcoesCpFundos'
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = ppBDEVdAcoesCpFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEVdAcoesCpFundos'
        mmHeight = 3175
        mmLeft = 24342
        mmTop = 528
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText4'
        DataField = 'QTDEOPERACAO'
        DataPipeline = ppBDEVdAcoesCpFundos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEVdAcoesCpFundos'
        mmHeight = 3175
        mmLeft = 75405
        mmTop = 528
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText5'
        DataField = 'PRECOUNITOPERACAO'
        DataPipeline = ppBDEVdAcoesCpFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEVdAcoesCpFundos'
        mmHeight = 3175
        mmLeft = 108215
        mmTop = 528
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText6'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDEVdAcoesCpFundos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEVdAcoesCpFundos'
        mmHeight = 3175
        mmLeft = 141023
        mmTop = 794
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppBDEVdAcoesCpFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEVdAcoesCpFundos'
        mmHeight = 3175
        mmLeft = 173567
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'SGLCUSTODIANTE'
        DataPipeline = ppBDEVdAcoesCpFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEVdAcoesCpFundos'
        mmHeight = 3175
        mmLeft = 260615
        mmTop = 528
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'DESCCARTINVEST'
        DataPipeline = ppBDEVdAcoesCpFundos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEVdAcoesCpFundos'
        mmHeight = 3175
        mmLeft = 194998
        mmTop = 528
        mmWidth = 63765
        BandType = 4
      end
    end
    object ppFooterBand7: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine12: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel25: TppLabel
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
        mmTop = 2646
        mmWidth = 283898
        BandType = 8
      end
      object ppSystemVariable11: TppSystemVariable
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
        mmLeft = 257705
        mmTop = 2381
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable12: TppSystemVariable
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
        mmLeft = 0
        mmTop = 2381
        mmWidth = 282311
        BandType = 8
      end
    end
    object ppSummaryBand7: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
      object ppLine13: TppLine
        UserName = 'Line9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 7
      end
      object ppLine14: TppLine
        UserName = 'Line11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel26: TppLabel
        UserName = 'Label20'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 2646
        mmWidth = 7144
        BandType = 7
      end
      object rptVdAcoesCpFundoslblSumVlrOperado: TppLabel
        UserName = 'rptVdAcoesCpFundoslblVlrAplicado2'
        Caption = 'SumVlrOperado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 150284
        mmTop = 2910
        mmWidth = 21167
        BandType = 7
      end
      object ppLine19: TppLine
        UserName = 'Line19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 7144
        mmWidth = 284300
        BandType = 7
      end
    end
  end
  object ppBDEVdAcoesCpFundos: TppBDEPipeline
    UserName = 'BDEVdAcoesCpFundos'
    Left = 36
    Top = 288
  end
  object ppBDEVdFundosCpAcoes: TppBDEPipeline
    UserName = 'BDEVdFundosCpAcoes'
    Left = 149
    Top = 289
    object ppBDEVdFundosCpAcoesppField1: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEVdFundosCpAcoesppField2: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 30
      DisplayWidth = 20
      Position = 1
    end
    object ppBDEVdFundosCpAcoesppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 2
    end
    object ppBDEVdFundosCpAcoesppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRECOUNITOPERACAO'
      FieldName = 'PRECOUNITOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 3
    end
    object ppBDEVdFundosCpAcoesppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDEOPERACAO'
      FieldName = 'QTDEOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 27
      Position = 4
    end
    object ppBDEVdFundosCpAcoesppField6: TppField
      FieldAlias = 'DATAVENCOPER'
      FieldName = 'DATAVENCOPER'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 14
      Position = 5
    end
    object ppBDEVdFundosCpAcoesppField7: TppField
      FieldAlias = 'DESCCARTINVEST'
      FieldName = 'DESCCARTINVEST'
      FieldLength = 60
      DisplayWidth = 35
      Position = 6
    end
    object ppBDEVdFundosCpAcoesppField8: TppField
      FieldAlias = 'SGLCUSTODIANTE'
      FieldName = 'SGLCUSTODIANTE'
      FieldLength = 10
      DisplayWidth = 13
      Position = 7
    end
    object ppBDEVdFundosCpAcoesppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERACAOINVEST'
      FieldName = 'IDOPERACAOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppBDEVdFundosCpAcoesppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppBDEVdFundosCpAcoesppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppBDEVdFundosCpAcoesppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCUSTODIANTE'
      FieldName = 'IDCUSTODIANTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppBDEVdFundosCpAcoesppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
  end
  object rptVdFundosCpAcoes: TppReport
    AutoStop = False
    DataPipeline = ppBDEVdFundosCpAcoes
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptVdFundosCpAcoesBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 149
    Top = 241
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEVdFundosCpAcoes'
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 48683
      mmPrintPosition = 0
      object ppShape7: TppShape
        UserName = 'RpConsCartRendVarShape1'
        Brush.Color = clSilver
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 0
        mmTop = 43127
        mmWidth = 284428
        BandType = 0
      end
      object ppLine20: TppLine
        UserName = 'ppLine42'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 42863
        mmWidth = 284300
        BandType = 0
      end
      object ppLine21: TppLine
        UserName = 'ppLine43'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 47890
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel39: TppLabel
        UserName = 'Label15'
        Caption = 'Data Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 43921
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel41: TppLabel
        UserName = 'Label16'
        Caption = 'Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 22754
        mmTop = 43921
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label17'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 89165
        mmTop = 43921
        mmWidth = 16669
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label18'
        Caption = 'Cotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 127794
        mmTop = 43921
        mmWidth = 10848
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label19'
        Caption = 'Valor Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 151077
        mmTop = 43921
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label22'
        Caption = 'Fundo :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 31221
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label34'
        Caption = 'Gestor :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 166159
        mmTop = 31221
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label36'
        Caption = 'Cota :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 36248
        mmWidth = 10054
        BandType = 0
      end
      object rptVdFundosCpAcoeslblFundo: TppLabel
        UserName = 'rptVdFundosCpAcoeslblFundo'
        Caption = 'Fundo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 16404
        mmTop = 31221
        mmWidth = 11113
        BandType = 0
      end
      object rptVdFundosCpAcoeslblGestor: TppLabel
        UserName = 'rptVdAcoesCpFundoslblGestor'
        Caption = 'Gestor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 189442
        mmTop = 31221
        mmWidth = 11377
        BandType = 0
      end
      object rptVdFundosCpAcoeslblCota: TppLabel
        UserName = 'rptVdAcoesCpFundoslblCota'
        Caption = 'Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 16404
        mmTop = 36248
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label40'
        Caption = 'Data Cota :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 49477
        mmTop = 36248
        mmWidth = 18785
        BandType = 0
      end
      object rptVdFundosCpAcoeslblDataCota: TppLabel
        UserName = 'Label401'
        Caption = 'Data Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 69850
        mmTop = 36248
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label33'
        Caption = 'Liquidação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 177007
        mmTop = 43921
        mmWidth = 14552
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label402'
        Caption = 'Valor Resgatado :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 102923
        mmTop = 36248
        mmWidth = 30163
        BandType = 0
      end
      object rptVdFundosCpAcoeslblVlrResgate: TppLabel
        UserName = 'rptVdAcoesCpFundoslblVlrAplicado'
        Caption = 'Valor Resgatado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 135202
        mmTop = 36248
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label403'
        Caption = 'Quantidade :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 166159
        mmTop = 36248
        mmWidth = 21960
        BandType = 0
      end
      object rptVdFundosCpAcoeslblQuantidade: TppLabel
        UserName = 'rptVdAcoesCpFundoslblQuantidade'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 189442
        mmTop = 36248
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel62: TppLabel
        UserName = 'Label42'
        Caption = 'Carteira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 194998
        mmTop = 43921
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label43'
        Caption = 'Custodiante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 260615
        mmTop = 43921
        mmWidth = 15875
        BandType = 0
      end
      object ppLine22: TppLine
        UserName = 'Line17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 41540
        mmWidth = 284300
        BandType = 0
      end
      object ppLine23: TppLine
        UserName = 'Line18'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 29898
        mmWidth = 284300
        BandType = 0
      end
      object LblPlanoCpAc: TppLabel
        UserName = 'LblPlanoCpAc'
        Caption = 'LblPlanoCpAc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 252148
        mmTop = 8731
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Resgate de  Fundos para Compra de Ações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 73290
        BandType = 0
      end
      object ppLabel24: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa3'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel83: TppLabel
        UserName = 'LCarteira3'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 264319
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel84: TppLabel
        UserName = 'LPeriodo3'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage3: TppDBImage
        UserName = 'DbLogo3'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppShape8: TppShape
        OnPrint = shpAmortCotasFndPrint
        UserName = 'RpConsCartRendVarShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        ReprintOnOverFlow = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 528
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppBDEVdFundosCpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEVdFundosCpAcoes'
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = ppBDEVdFundosCpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEVdFundosCpAcoes'
        mmHeight = 3175
        mmLeft = 22754
        mmTop = 528
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText4'
        DataField = 'QTDEOPERACAO'
        DataPipeline = ppBDEVdFundosCpAcoes
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEVdFundosCpAcoes'
        mmHeight = 3175
        mmLeft = 75405
        mmTop = 528
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText5'
        DataField = 'PRECOUNITOPERACAO'
        DataPipeline = ppBDEVdFundosCpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEVdFundosCpAcoes'
        mmHeight = 3175
        mmLeft = 108215
        mmTop = 528
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText6'
        DataField = 'VLROPERACAO'
        DataPipeline = ppBDEVdFundosCpAcoes
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEVdFundosCpAcoes'
        mmHeight = 3175
        mmLeft = 141023
        mmTop = 528
        mmWidth = 30427
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText8'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppBDEVdFundosCpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEVdFundosCpAcoes'
        mmHeight = 3175
        mmLeft = 173567
        mmTop = 528
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText14'
        DataField = 'SGLCUSTODIANTE'
        DataPipeline = ppBDEVdFundosCpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEVdFundosCpAcoes'
        mmHeight = 3175
        mmLeft = 260615
        mmTop = 528
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText15'
        DataField = 'DESCCARTINVEST'
        DataPipeline = ppBDEVdFundosCpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEVdFundosCpAcoes'
        mmHeight = 3175
        mmLeft = 194998
        mmTop = 528
        mmWidth = 63765
        BandType = 4
      end
    end
    object ppFooterBand8: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
      object ppLine24: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel64: TppLabel
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
        mmTop = 2646
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable15: TppSystemVariable
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable16: TppSystemVariable
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
        mmLeft = 1058
        mmTop = 2646
        mmWidth = 197380
        BandType = 8
      end
    end
    object ppSummaryBand8: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine25: TppLine
        UserName = 'Line9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 7
      end
      object ppLine26: TppLine
        UserName = 'Line11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284300
        BandType = 7
      end
      object ppLabel65: TppLabel
        UserName = 'Label20'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 4498
        mmTop = 2646
        mmWidth = 6615
        BandType = 7
      end
      object rptVdFundosCpAcoeslblSumVlr: TppLabel
        UserName = 'rptVdAcoesCpFundoslblVlrAplicado2'
        Caption = 'SumVlrOperado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 149490
        mmTop = 2646
        mmWidth = 21167
        BandType = 7
      end
      object ppLine27: TppLine
        UserName = 'Line19'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 7144
        mmWidth = 284300
        BandType = 7
      end
    end
  end
  object rptSaldoFundo: TppReport
    AutoStop = False
    DataPipeline = BDESaldoFundo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Saldo dos Fundos'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rptSaldoFundoBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 32
    Top = 341
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'BDESaldoFundo'
    object ppHeaderBand9: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppShape9: TppShape
        UserName = 'shpConsRentFndCab'
        Brush.Color = clSilver
        mmHeight = 3704
        mmLeft = 0
        mmTop = 23813
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel54: TppLabel
        UserName = 'lblConsRFAFundo'
        Caption = 'Data do Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 32544
        mmTop = 24342
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel56: TppLabel
        UserName = 'lblConsRFASaldo'
        Caption = 'Valor Bruto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 116946
        mmTop = 24342
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel66: TppLabel
        UserName = 'lblConsRFAGestor'
        Caption = 'Aplicação'
        Color = 14935011
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 17463
        mmTop = 24342
        mmWidth = 11642
        BandType = 0
      end
      object ppLabel67: TppLabel
        UserName = 'lblConsRFARentFundoDia'
        Caption = 'IOF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 146050
        mmTop = 24342
        mmWidth = 3969
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'Label1'
        Caption = 'IR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 166159
        mmTop = 24342
        mmWidth = 2381
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'lblConsRFADifMes'
        Caption = 'Valor Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 179123
        mmTop = 24077
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel76: TppLabel
        UserName = 'lblConsRFAPlanoPatr'
        Caption = 'Plano / Patrocinadora  :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 197300
        mmTop = 18785
        mmWidth = 29633
        BandType = 0
      end
      object ppLabel79: TppLabel
        UserName = 'lblConsRFAPerCateg'
        Caption = 'Valor da Cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2646
        mmLeft = 89429
        mmTop = 24342
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel80: TppLabel
        UserName = 'Label4'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 66940
        mmTop = 24342
        mmWidth = 13494
        BandType = 0
      end
      object LblPlanoSaldo: TppLabel
        UserName = 'LblPlanoSaldo'
        Caption = 'LblPlanoSaldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 170127
        mmTop = 8731
        mmWidth = 24871
        BandType = 0
      end
      object ppLabel37: TppLabel
        UserName = 'Label37'
        Caption = 'Saldo dos Fundos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 30956
        BandType = 0
      end
      object ppLabel38: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa4'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'LCarteira4'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object lblSaldosFNDDtRef: TppLabel
        UserName = 'LPeriodo4'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage4: TppDBImage
        UserName = 'DbLogo4'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand10: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 2646
      mmPrintPosition = 0
      object shpSaldoFNDDet: TppShape
        OnPrint = shpSaldoFNDDetPrint
        UserName = 'ppSConsRentFndDet'
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        ShiftWithParent = True
        mmHeight = 2646
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBConsRentFndSaldoEm'
        DataField = 'SALDOVLRFUNDO'
        DataPipeline = BDESaldoFundo
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDESaldoFundo'
        mmHeight = 2646
        mmLeft = 107950
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText26: TppDBText
        UserName = 'DBConsRentFndRentMes'
        DataField = 'VLRIRPROV'
        DataPipeline = BDESaldoFundo
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDESaldoFundo'
        mmHeight = 2646
        mmLeft = 153723
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBConsRentFndBanco'
        DataField = 'DATAAPLICACAO'
        DataPipeline = BDESaldoFundo
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDESaldoFundo'
        mmHeight = 2646
        mmLeft = 14817
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
      object ppDBCotaAtual: TppDBText
        UserName = 'ppDBCotaAtual'
        DataField = 'VLRCOTAATUAL'
        DataPipeline = BDESaldoFundo
        DisplayFormat = '###,###,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDESaldoFundo'
        mmHeight = 2646
        mmLeft = 81492
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'dbeConsRFADifDia'
        DataField = 'VLRIOFPROV'
        DataPipeline = BDESaldoFundo
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDESaldoFundo'
        mmHeight = 2646
        mmLeft = 133350
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'dbeConsRFADifMes'
        DataField = 'SALDOLIQUIDO'
        DataPipeline = BDESaldoFundo
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDESaldoFundo'
        mmHeight = 2646
        mmLeft = 173567
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppDBSaldoCotas: TppDBText
        UserName = 'ppDBSaldoCotas'
        DataField = 'SALDOQTDCOTAS'
        DataPipeline = BDESaldoFundo
        DisplayFormat = '###,###,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDESaldoFundo'
        mmHeight = 2646
        mmLeft = 50271
        mmTop = 0
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText33: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAMOVFUNDO'
        DataPipeline = BDESaldoFundo
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'BDESaldoFundo'
        mmHeight = 2646
        mmLeft = 31750
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppSystemVariable17: TppSystemVariable
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
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197115
        BandType = 8
      end
      object ppLabel82: TppLabel
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
        mmTop = 1588
        mmWidth = 196586
        BandType = 8
      end
      object ppLine28: TppLine
        UserName = 'LineConsRentFnd2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable18: TppSystemVariable
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
        mmLeft = 170657
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'DESCFUNDOINVEST'
      DataPipeline = BDESaldoFundo
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'BDESaldoFundo'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand3BeforePrint
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object shpCabFundo: TppShape
          UserName = 'ppSConsRentFndDet1'
          Brush.Color = clSilver
          Pen.Style = psClear
          ShiftWithParent = True
          mmHeight = 3175
          mmLeft = 0
          mmTop = 1323
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppDBText34: TppDBText
          UserName = 'DBConsRentFndFundo'
          DataField = 'DESCFUNDOINVEST'
          DataPipeline = BDESaldoFundo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'BDESaldoFundo'
          mmHeight = 2910
          mmLeft = 14817
          mmTop = 1323
          mmWidth = 109802
          BandType = 3
          GroupNo = 0
        end
        object ppLabel85: TppLabel
          UserName = 'Label2'
          Caption = 'Fundo: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2646
          mmLeft = 3704
          mmTop = 1323
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppShape10: TppShape
          UserName = 'Shape10'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 2910
          mmLeft = 46038
          mmTop = 1323
          mmWidth = 151077
          BandType = 5
          GroupNo = 0
        end
        object ppDBTotSaldoCotas: TppDBCalc
          UserName = 'DBTotSaldoCotas'
          DataField = 'SALDOQTDCOTAS'
          DataPipeline = BDESaldoFundo
          DisplayFormat = '###,###,##0.000000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDESaldoFundo'
          mmHeight = 2646
          mmLeft = 46038
          mmTop = 1323
          mmWidth = 33602
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'SALDOVLRFUNDO'
          DataPipeline = BDESaldoFundo
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDESaldoFundo'
          mmHeight = 2646
          mmLeft = 106627
          mmTop = 1323
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'VLRIOFPROV'
          DataPipeline = BDESaldoFundo
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDESaldoFundo'
          mmHeight = 2646
          mmLeft = 132027
          mmTop = 1323
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'VLRIRPROV'
          DataPipeline = BDESaldoFundo
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDESaldoFundo'
          mmHeight = 2646
          mmLeft = 152400
          mmTop = 1323
          mmWidth = 16669
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'SALDOLIQUIDO'
          DataPipeline = BDESaldoFundo
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'BDESaldoFundo'
          mmHeight = 2646
          mmLeft = 170392
          mmTop = 1323
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object BDESaldoFundo: TppBDEPipeline
    UserName = 'BDESaldoFundo'
    Left = 32
    Top = 388
    object BDESaldoFundoppField1: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object BDESaldoFundoppField2: TppField
      FieldAlias = 'DATAAPLICACAO'
      FieldName = 'DATAAPLICACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 1
    end
    object BDESaldoFundoppField3: TppField
      FieldAlias = 'DATAMOVFUNDO'
      FieldName = 'DATAMOVFUNDO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 10
      Position = 2
    end
    object BDESaldoFundoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTAS'
      FieldName = 'SALDOQTDCOTAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 3
    end
    object BDESaldoFundoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTAATUAL'
      FieldName = 'VLRCOTAATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 15
      Position = 4
    end
    object BDESaldoFundoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRFUNDO'
      FieldName = 'SALDOVLRFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 5
    end
    object BDESaldoFundoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOFPROV'
      FieldName = 'VLRIOFPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 13
      Position = 6
    end
    object BDESaldoFundoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIRPROV'
      FieldName = 'VLRIRPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 14
      Position = 7
    end
    object BDESaldoFundoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOLIQUIDO'
      FieldName = 'SALDOLIQUIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 8
    end
    object BDESaldoFundoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOTAAPLICACAO'
      FieldName = 'VLRCOTAAPLICACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 18
      Position = 9
    end
    object BDESaldoFundoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAPLICADO'
      FieldName = 'VLRAPLICADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 17
      Position = 10
    end
    object BDESaldoFundoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDHISTFUNDO'
      FieldName = 'IDHISTFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object BDESaldoFundoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object BDESaldoFundoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object BDESaldoFundoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object BDESaldoFundoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object BDESaldoFundoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object BDESaldoFundoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object BDESaldoFundoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object BDESaldoFundoppField20: TppField
      FieldAlias = 'HISTMOVFUNDO'
      FieldName = 'HISTMOVFUNDO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 19
    end
    object BDESaldoFundoppField21: TppField
      FieldAlias = 'NATURMOVFUNDO'
      FieldName = 'NATURMOVFUNDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 20
    end
    object BDESaldoFundoppField22: TppField
      FieldAlias = 'TIPMOVFUNDO'
      FieldName = 'TIPMOVFUNDO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 21
    end
    object BDESaldoFundoppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRVARIACAO'
      FieldName = 'VLRVARIACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object BDESaldoFundoppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'COTASMOVFUNDO'
      FieldName = 'COTASMOVFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object BDESaldoFundoppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMOVFUNDO'
      FieldName = 'VLRMOVFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object BDESaldoFundoppField26: TppField
      FieldAlias = 'FLGCALCSALDO'
      FieldName = 'FLGCALCSALDO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 25
    end
  end
  object rptPosFundo: TppReport
    AutoStop = False
    DataPipeline = pplPosFundo
    OnStartPage = rptPosFundoStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Composição dos Fundos de Ação'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 312
    Top = 198
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplPosFundo'
    object ppHeaderBand10: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 31485
      mmPrintPosition = 0
      object shpPosFundosCab: TppShape
        UserName = 'shpPosFundosCab'
        Brush.Color = clSilver
        mmHeight = 4233
        mmLeft = 0
        mmTop = 26988
        mmWidth = 196321
        BandType = 0
      end
      object lblPosFundosCabFundo: TppLabel
        UserName = 'lblPosFundosCabFundo'
        Caption = 'Fundo de Investimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 27517
        mmWidth = 30956
        BandType = 0
      end
      object lblPosFundosCabQtd: TppLabel
        UserName = 'lblPosFundosCabQtd'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 179917
        mmTop = 27517
        mmWidth = 15081
        BandType = 0
      end
      object lblPosFundosTitFundo: TppLabel
        UserName = 'lblPosFundosTitFundo'
        AutoSize = False
        Caption = 'Todos os Fundos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 133350
        mmTop = 22225
        mmWidth = 61648
        BandType = 0
      end
      object LblPlanoPos: TppLabel
        UserName = 'LblPlanoPos'
        Caption = 'LblPlanoPos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 173302
        mmTop = 8731
        mmWidth = 21696
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Posição dos Fundos de Ação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8731
        mmWidth = 49477
        BandType = 0
      end
      object ppLabel92: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa9'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 1588
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel93: TppLabel
        UserName = 'LCarteira9'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 182827
        mmTop = 14023
        mmWidth = 12171
        BandType = 0
      end
      object lblPosFundosTitDtRef: TppLabel
        UserName = 'LPeriodo8'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 14023
        mmWidth = 10848
        BandType = 0
      end
      object ppDBImage9: TppDBImage
        UserName = 'DbLogo9'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand11: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object shpPosFundosDet: TppShape
        OnPrint = ppsSaldoFundosDetPrint
        UserName = 'shpPosFundosDet'
        Pen.Style = psClear
        mmHeight = 3175
        mmLeft = 0
        mmTop = 0
        mmWidth = 195792
        BandType = 4
      end
      object srptPosFundo: TppSubReport
        OnPrint = srptPosFundoPrint
        UserName = 'srptPosFundo'
        DrillDownComponent = DBPosFundosFundo
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentPrinterSetup = False
        TraverseAllData = False
        DataPipelineName = 'pplPosFundoDet'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 5027
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object srptPosFundoDet: TppChildReport
          AutoStop = False
          DataPipeline = pplPosFundoDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Composição dos Fundos de Ação'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Left = 296
          Top = 192
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplPosFundoDet'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object shpPosFundosDetCab: TppShape
              UserName = 'shpPosFundosDetCab'
              Brush.Color = clSilver
              mmHeight = 4233
              mmLeft = 47361
              mmTop = 1323
              mmWidth = 148696
              BandType = 1
            end
            object lblPosFundosDetCabAplic: TppLabel
              UserName = 'lblPosFundosDetCabAplic'
              Caption = 'Aplicação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3175
              mmLeft = 48154
              mmTop = 1852
              mmWidth = 12435
              BandType = 1
            end
            object lblPosFundosDetCabQtd: TppLabel
              UserName = 'lblPosFundosDetCabQtd'
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 180446
              mmTop = 1852
              mmWidth = 14552
              BandType = 1
            end
            object lblPosFundosDetCabPos: TppLabel
              UserName = 'lblPosFundosDetCabPos'
              Caption = 'Última Posição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3175
              mmLeft = 118269
              mmTop = 1852
              mmWidth = 19050
              BandType = 1
            end
            object linPosFundosDetCab: TppLine
              UserName = 'linPosFundosDetCab'
              Weight = 0.75
              mmHeight = 3704
              mmLeft = 47361
              mmTop = 5292
              mmWidth = 148696
              BandType = 1
            end
          end
          object ppDetailBand12: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object shpPosFundosDetDet: TppShape
              OnPrint = ppsSaldoFundosDetPrint
              UserName = 'shpPosFundosDetDet'
              Pen.Style = psClear
              mmHeight = 3704
              mmLeft = 47361
              mmTop = 0
              mmWidth = 148696
              BandType = 4
            end
            object DBPosFundosDetAplicacao: TppDBText
              UserName = 'DBPosFundosDetAplicacao'
              DataField = 'DESCINVESTIMENTO'
              DataPipeline = pplPosFundoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplPosFundoDet'
              mmHeight = 3175
              mmLeft = 47625
              mmTop = 265
              mmWidth = 53975
              BandType = 4
            end
            object DBPosFundosDetQtd: TppDBText
              UserName = 'DBPosFundosDetQtd'
              DataField = 'QTDATUAL'
              DataPipeline = pplPosFundoDet
              DisplayFormat = '#,###,###,###,##0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPosFundoDet'
              mmHeight = 3175
              mmLeft = 156104
              mmTop = 265
              mmWidth = 38894
              BandType = 4
            end
            object DBPosFundosDetPos: TppDBText
              UserName = 'DBPosFundosDetPos'
              DataField = 'DATAREFERENCIA'
              DataPipeline = pplPosFundoDet
              DisplayFormat = 'dd/mm/yyyy'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplPosFundoDet'
              mmHeight = 3175
              mmLeft = 118004
              mmTop = 265
              mmWidth = 19844
              BandType = 4
            end
          end
          object ppSummaryBand9: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object linPosFundosDetRdp: TppLine
              UserName = 'linPosFundosDetRdp'
              Weight = 0.75
              mmHeight = 1852
              mmLeft = 47361
              mmTop = 265
              mmWidth = 148167
              BandType = 7
            end
          end
        end
      end
      object DBPosFundosFundo: TppDBText
        UserName = 'DBPosFundosFundo'
        DataField = 'DESCFUNDOINVEST'
        DataPipeline = pplPosFundo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplPosFundo'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 0
        mmWidth = 85990
        BandType = 4
      end
      object DBPosFundosQTD: TppDBText
        UserName = 'DBPosFundosQTD'
        DataField = 'QTDTOTAL'
        DataPipeline = pplPosFundo
        DisplayFormat = '#,###,###,###,##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPosFundo'
        mmHeight = 3175
        mmLeft = 156634
        mmTop = 0
        mmWidth = 38365
        BandType = 4
      end
    end
    object ppFooterBand10: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel95: TppLabel
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
        mmTop = 3175
        mmWidth = 196057
        BandType = 8
      end
      object ppSystemVariable19: TppSystemVariable
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 196057
        BandType = 8
      end
      object ppLine32: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppSystemVariable20: TppSystemVariable
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
        mmLeft = 170127
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object pplPosFundo: TppBDEPipeline
    DataSource = dsPosFundo
    UserName = 'pplPosFundo'
    Left = 238
    Top = 245
    object pplPosFundoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplPosFundoppField2: TppField
      FieldAlias = 'DESCFUNDOINVEST'
      FieldName = 'DESCFUNDOINVEST'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplPosFundoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDTOTAL'
      FieldName = 'QTDTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
  end
  object pplPosFundoDet: TppBDEPipeline
    DataSource = dsPosFundoDet
    UserName = 'pplPosFundoDet'
    Left = 313
    Top = 245
  end
  object dsPosFundo: TDataSource
    AutoEdit = False
    DataSet = qryPosFundo
    Left = 237
    Top = 290
  end
  object dsPosFundoDet: TDataSource
    AutoEdit = False
    DataSet = qryPosFundoDet
    Left = 313
    Top = 290
  end
  object qryPosFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT POS.IDFUNDOINVEST, FND.DESCFUNDOINVEST, SUM(POS.QTDATUAL)' +
        ' AS QTDTOTAL'
      'FROM   POSICAOFUNDO POS, INVESTIMENTO INV, FUNDOINVEST FND,'
      '       ( SELECT IDINVESTIMENTO, MAX(DATAREFERENCIA) AS DATAREF'
      '         FROM POSICAOFUNDO'
      
        '         WHERE (((:DATAREFERENCIA IS NOT NULL) AND (DATAREFERENC' +
        'IA <= :DATAREFERENCIA)) OR'
      '                 (:DATAREFERENCIA IS NULL))    AND'
      
        '               (((:IDFUNDOINVEST IS NOT NULL)  AND (IDFUNDOINVES' +
        'T = :IDFUNDOINVEST))    OR'
      '                 (:IDFUNDOINVEST IS NULL))'
      '         GROUP BY IDINVESTIMENTO) PDT'
      'WHERE  (POS.IDINVESTIMENTO = INV.IDINVESTIMENTO) AND'
      '       (POS.IDFUNDOINVEST = FND.IDFUNDOINVEST)   AND'
      '       (PDT.IDINVESTIMENTO = POS.IDINVESTIMENTO) AND'
      '       (POS.DATAREFERENCIA = PDT.DATAREF)        AND'
      
        '       (((:IDFUNDOINVEST IS NOT NULL) AND (POS.IDFUNDOINVEST = :' +
        'IDFUNDOINVEST)) OR'
      '         (:IDFUNDOINVEST IS NULL))               AND'
      '       (POS.QTDATUAL > 0)'
      'GROUP BY POS.IDFUNDOINVEST, FND.DESCFUNDOINVEST'
      'ORDER BY FND.DESCFUNDOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 237
    Top = 334
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAREFERENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAREFERENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAREFERENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end>
    object qryPosFundoIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object qryPosFundoDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryPosFundoQTDTOTAL: TFloatField
      FieldName = 'QTDTOTAL'
    end
  end
  object qryPosFundoDet: TwwQuery
    DatabaseName = 'BaseDados'
    Filtered = True
    SQL.Strings = (
      
        'SELECT POS.IDFUNDOINVEST, POS.IDINVESTIMENTO, POS.DATAREFERENCIA' +
        ', POS.QTDATUAL,'
      '       INV.DESCINVESTIMENTO'
      'FROM   POSICAOFUNDO POS, INVESTIMENTO INV,'
      '       ( SELECT IDINVESTIMENTO, MAX(DATAREFERENCIA) AS DATAREF'
      '         FROM POSICAOFUNDO'
      
        '         WHERE (((:DATAREFERENCIA IS NOT NULL)  AND (DATAREFEREN' +
        'CIA <= :DATAREFERENCIA)) OR'
      '                 (:DATAREFERENCIA IS NULL))'
      '         GROUP BY IDINVESTIMENTO) PDT'
      'WHERE  (POS.IDINVESTIMENTO = INV.IDINVESTIMENTO) AND'
      '       (PDT.IDINVESTIMENTO = POS.IDINVESTIMENTO) AND'
      '       (POS.DATAREFERENCIA = PDT.DATAREF)        AND'
      '       (POS.QTDATUAL > 0)'
      
        'ORDER BY POS.IDFUNDOINVEST, INV.DESCINVESTIMENTO, POS.DATAREFERE' +
        'NCIA'
      ' ')
    ValidateWithMask = True
    Left = 314
    Top = 334
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DATAREFERENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAREFERENCIA'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATAREFERENCIA'
        ParamType = ptResult
      end>
    object qryPosFundoDetIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object qryPosFundoDetIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryPosFundoDetDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryPosFundoDetDATAREFERENCIA: TDateTimeField
      FieldName = 'DATAREFERENCIA'
    end
    object qryPosFundoDetQTDATUAL: TFloatField
      FieldName = 'QTDATUAL'
    end
  end
  object ppRConsAmortizacaoCotas: TppReport
    AutoStop = False
    DataPipeline = ppBDEPConsAmortizacaoCotas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 564
    Top = 56
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'Label11'
        Caption = 'Amortização de Cotas de Fundos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25400
        mmTop = 8202
        mmWidth = 56092
        BandType = 0
      end
      object ppLabel12: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 25400
        mmTop = 265
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DATAMOVFUNDO'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 13494
        mmWidth = 18785
        BandType = 0
      end
      object LblPlanoAmort: TppLabel
        UserName = 'LblPlanoAmort'
        Caption = 'LblPlanoAmort'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 170657
        mmTop = 8202
        mmWidth = 25665
        BandType = 0
      end
      object ppDBImage6: TppDBImage
        UserName = 'DBImage6'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object shpAmortCotasFnd: TppShape
        OnPrint = shpAmortCotasFndPrint
        UserName = 'RpConsCartRendVarShape2'
        Brush.Color = 14935011
        Pen.Style = psClear
        ReprintOnOverFlow = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 265
        mmWidth = 197910
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAAPLICACAO'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 4498
        mmTop = 529
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRAPLICADO'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 31750
        mmTop = 529
        mmWidth = 39952
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRCUSTOATUAL'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 75406
        mmTop = 529
        mmWidth = 38365
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'SALDOQTDCOTAS'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        DisplayFormat = '###,###,###,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 118004
        mmTop = 529
        mmWidth = 39423
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'SALDOVLRFUNDO'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 157957
        mmTop = 529
        mmWidth = 37571
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13494
      mmPrintPosition = 0
      object ppLine10: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel14: TppLabel
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
        mmTop = 2646
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable14: TppSystemVariable
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable13: TppSystemVariable
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
        mmLeft = 1058
        mmTop = 2646
        mmWidth = 197380
        BandType = 8
      end
    end
    object ppSummaryBand6: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VLRAPLICADO'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 39688
        mmTop = 2381
        mmWidth = 32015
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VLRCUSTOATUAL'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 81756
        mmTop = 2381
        mmWidth = 32015
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'SALDOQTDCOTAS'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        DisplayFormat = '###,###,###,##0.000000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 125413
        mmTop = 2381
        mmWidth = 32015
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'SALDOVLRFUNDO'
        DataPipeline = ppBDEPConsAmortizacaoCotas
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
        mmHeight = 3175
        mmLeft = 164307
        mmTop = 2381
        mmWidth = 32015
        BandType = 7
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 7
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 2646
        mmWidth = 8731
        BandType = 7
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'DESCFUNDOINVEST'
      DataPipeline = ppBDEPConsAmortizacaoCotas
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppBDEPConsAmortizacaoCotas'
      object ppGroupHeaderBand7: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 19579
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'RpConsCartRendVarShape1'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 5556
          mmLeft = 0
          mmTop = 13758
          mmWidth = 197909
          BandType = 3
          GroupNo = 0
        end
        object ppLine50: TppLine
          UserName = 'ppLine42'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 19050
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLine51: TppLine
          UserName = 'ppLine43'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 0
          mmTop = 13494
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Data de Aplicação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 4498
          mmTop = 14817
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label16'
          Caption = 'Valor do Custo Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 44450
          mmTop = 14817
          mmWidth = 27252
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Valor do Custo Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 82550
          mmTop = 14817
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Quantidade de Cotas Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 122238
          mmTop = 14817
          mmWidth = 35190
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          Caption = 'Saldo Atual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 180446
          mmTop = 14817
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label1'
          Caption = 'Valor Amortizado R$'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 128588
          mmTop = 4763
          mmWidth = 34925
          BandType = 3
          GroupNo = 0
        end
        object ppLValorAmortizado: TppLabel
          UserName = 'LValorAmortizado'
          Caption = 'LValorAmortizado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 164042
          mmTop = 4763
          mmWidth = 30692
          BandType = 3
          GroupNo = 0
        end
        object ppLine29: TppLine
          UserName = 'Line28'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 18521
          mmLeft = 0
          mmTop = 529
          mmWidth = 2646
          BandType = 3
          GroupNo = 0
        end
        object ppLine30: TppLine
          UserName = 'Line29'
          Position = lpRight
          Weight = 0.75
          mmHeight = 18785
          mmLeft = 195527
          mmTop = 529
          mmWidth = 2117
          BandType = 3
          GroupNo = 0
        end
        object ppLine31: TppLine
          UserName = 'Line30'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 0
          mmTop = 529
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppShape11: TppShape
          UserName = 'Shape11'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 4763
          mmLeft = 265
          mmTop = 794
          mmWidth = 125413
          BandType = 3
          GroupNo = 0
        end
        object ppLabel61: TppLabel
          UserName = 'Label52'
          Caption = 'Fundo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 4498
          mmTop = 1323
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppLine34: TppLine
          UserName = 'Line31'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 265
          mmTop = 5292
          mmWidth = 125413
          BandType = 3
          GroupNo = 0
        end
        object ppLine33: TppLine
          UserName = 'Line32'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 12700
          mmLeft = 125413
          mmTop = 794
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object pplFundo: TppLabel
          UserName = 'Label2'
          Caption = 'Label2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 4498
          mmTop = 7938
          mmWidth = 118798
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppBDEPConsAmortizacaoCotas: TppBDEPipeline
    DataSource = FrmCadAmortizacaoCotas.DsDetalhe
    UserName = 'BDEPConsAmortizacaoCotas'
    Left = 565
    Top = 120
    object ppBDEPConsAmortizacaoCotasppField1: TppField
      FieldAlias = 'DATAAPLICACAO'
      FieldName = 'DATAAPLICACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 0
      Position = 0
    end
    object ppBDEPConsAmortizacaoCotasppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppBDEPConsAmortizacaoCotasppField3: TppField
      FieldAlias = 'DATAMOVFUNDO'
      FieldName = 'DATAMOVFUNDO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 11
      Position = 2
    end
    object ppBDEPConsAmortizacaoCotasppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRAPLICADO'
      FieldName = 'VLRAPLICADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 3
    end
    object ppBDEPConsAmortizacaoCotasppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCUSTOATUAL'
      FieldName = 'VLRCUSTOATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
    object ppBDEPConsAmortizacaoCotasppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRENDIMENTO'
      FieldName = 'VLRRENDIMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 5
    end
    object ppBDEPConsAmortizacaoCotasppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOVLRFUNDO'
      FieldName = 'SALDOVLRFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 20
      Position = 6
    end
    object ppBDEPConsAmortizacaoCotasppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDHISTFUNDO'
      FieldName = 'IDHISTFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppBDEPConsAmortizacaoCotasppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppBDEPConsAmortizacaoCotasppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppBDEPConsAmortizacaoCotasppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERACAOFUNDO'
      FieldName = 'IDOPERACAOFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppBDEPConsAmortizacaoCotasppField12: TppField
      FieldAlias = 'DATAULTPGTOIR'
      FieldName = 'DATAULTPGTOIR'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object ppBDEPConsAmortizacaoCotasppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMOVFUNDO'
      FieldName = 'VLRMOVFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppBDEPConsAmortizacaoCotasppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIRPROV'
      FieldName = 'VLRIRPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppBDEPConsAmortizacaoCotasppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIOFPROV'
      FieldName = 'VLRIOFPROV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppBDEPConsAmortizacaoCotasppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'COTASMOVFUNDO'
      FieldName = 'COTASMOVFUNDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppBDEPConsAmortizacaoCotasppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTAS'
      FieldName = 'SALDOQTDCOTAS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppBDEPConsAmortizacaoCotasppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'COTAAPLICACAO'
      FieldName = 'COTAAPLICACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppBDEPConsAmortizacaoCotasppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppBDEPConsAmortizacaoCotasppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppBDEPConsAmortizacaoCotasppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppBDEPConsAmortizacaoCotasppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppBDEPConsAmortizacaoCotasppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOQTDCOTASBLQ'
      FieldName = 'SALDOQTDCOTASBLQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
  end
  object pplEmpresa: TppBDEPipeline
    DataSource = dsEmpresa
    UserName = 'pplEmpresa'
    Left = 489
    Top = 204
    object pplEmpresappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplEmpresappField2: TppField
      FieldAlias = 'NOMEEMPRESA'
      FieldName = 'NOMEEMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplEmpresappField3: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplEmpresappField4: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 174
      DisplayWidth = 174
      Position = 3
    end
    object pplEmpresappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDENDERECO'
      FieldName = 'IDENDERECO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplEmpresappField6: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 5
    end
    object pplEmpresappField7: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object dsEmpresa: TwwDataSource
    AutoEdit = False
    DataSet = qryEmpresa
    Left = 537
    Top = 204
  end
  object qryEmpresa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT EP.IDPESSOA, EP.NOMEEMPRESA, PE.RAZAOSOCIAL, '
      
        '       RTRIM(EN.LOGRADOURO)||'#39' - '#39'||RTRIM(EN.NUMERO)||'#39' '#39'||RTRIM' +
        '(EN.COMPLEMENTO)||'#39' - '#39'||'
      
        '          RTRIM(EN.BAIRRO)||'#39' - '#39'||RTRIM(CI.NOME)||'#39' - '#39'||RTRIM(' +
        'ES.CODESTADO) AS LOGRADOURO,'
      '       EN.IDENDERECO, EN.CEP, IM.IMAGEM'
      
        'FROM PESSOA PE, ENDPESS EN, CIDADES CI, ESTADO ES, IMAGENS IM, E' +
        'MPRESAPROP EP '
      'WHERE (EP.IDPESSOA = PE.IDPESSOA) AND'
      '      (PE.IDIMAGEM = IM.IDIMAGEM(+)) AND'
      '      (EN.IDENDERECO(+) = PE.IDENDCOMERCIAL) AND'
      '      (CI.IDCIDADES(+) = EN.IDCIDADES) AND'
      '      (ES.IDESTADO(+) = CI.IDESTADO)'
      '')
    ValidateWithMask = True
    Left = 597
    Top = 204
    object qryEmpresaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryEmpresaNOMEEMPRESA: TStringField
      FieldName = 'NOMEEMPRESA'
      Size = 60
    end
    object qryEmpresaRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object qryEmpresaLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 174
    end
    object qryEmpresaIDENDERECO: TFloatField
      FieldName = 'IDENDERECO'
    end
    object qryEmpresaCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qryEmpresaIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
  end
  object UpdSaldoTot: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTFUNDO'
      'set'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DESCFUNDOINVEST = :DESCFUNDOINVEST,'
      '  SALDOQTDCOTAS = :SALDOQTDCOTAS,'
      '  SALDOVLRFUNDO = :SALDOVLRFUNDO,'
      '  VLRIOFPROV = :VLRIOFPROV,'
      '  VLRIRPROV = :VLRIRPROV,'
      '  SALDOLIQUIDO = :SALDOLIQUIDO,'
      '  VLRVARIACAO = :VLRVARIACAO,'
      '  PLANPRVCONTABPATRO = :PLANPRVCONTABPATRO'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST')
    InsertSQL.Strings = (
      'insert into HISTFUNDO'
      
        '  (IDFUNDOINVEST, DESCFUNDOINVEST, SALDOQTDCOTAS, SALDOVLRFUNDO,' +
        ' VLRIOFPROV, '
      '   VLRIRPROV, SALDOLIQUIDO, VLRVARIACAO, PLANPRVCONTABPATRO)'
      'values'
      
        '  (:IDFUNDOINVEST, :DESCFUNDOINVEST, :SALDOQTDCOTAS, :SALDOVLRFU' +
        'NDO, :VLRIOFPROV, '
      '   :VLRIRPROV, :SALDOLIQUIDO, :VLRVARIACAO, :PLANPRVCONTABPATRO)')
    DeleteSQL.Strings = (
      'delete from HISTFUNDO'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST')
    Left = 238
    Top = 200
  end
end
