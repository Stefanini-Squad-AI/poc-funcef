inherited dtmRelGeral: TdtmRelGeral
  Left = 152
  Top = 186
  Width = 489
  Height = 269
  Caption = 'dtmRelGeral'
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
    Left = 276
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
    Left = 276
    Top = 101
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    CloseDataSource = True
    UserName = 'Fundacao'
    Left = 276
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
  object qryIndice: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 420
    Top = 56
  end
  object qryEmprestimo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      '')
    ValidateWithMask = True
    Left = 349
    Top = 101
  end
  object qryIR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      '')
    ValidateWithMask = True
    Left = 420
    Top = 147
  end
  object qryCredito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      '')
    ValidateWithMask = True
    Left = 349
    Top = 147
  end
  object qryDebito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      '')
    ValidateWithMask = True
    Left = 349
    Top = 56
  end
  object qryCorrecao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      '')
    ValidateWithMask = True
    Left = 420
    Top = 101
  end
  object qryArqPagEletr: TwwQuery
    CachedUpdates = True
    AfterOpen = qryArqPagEletrAfterOpen
    AfterClose = qryArqPagEletrAfterClose
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      
        'SELECT '#39'                                                  '#39' AS N' +
        'OMEARQ,'
      '       0 AS QUANTIDADE,'
      '       0 AS VALOR,'
      '       '#39'A'#39' AS QUEBRA'
      'FROM DUAL'
      'WHERE 1 = 2')
    UpdateObject = updArqPagEletr
    ValidateWithMask = True
    Left = 101
    Top = 147
  end
  object dsArqPagEletr: TwwDataSource
    DataSet = qryArqPagEletr
    Left = 101
    Top = 101
  end
  object ppArqPagEletr: TppReport
    AutoStop = False
    DataPipeline = plArqPagEletr
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório dos Arquivos de Pagamento Eletrônico'
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
    Left = 101
    Top = 12
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 51594
      mmPrintPosition = 0
      object ppReport4DBText1: TppDBText
        UserName = 'ppReport4DBText1'
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
      object ppReport4DBText2: TppDBText
        UserName = 'ppReport4DBText2'
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
      object ppReport4DBText3: TppDBText
        UserName = 'ppReport4DBText3'
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
        mmWidth = 25400
        BandType = 0
      end
      object ppReport4DBImage1: TppDBImage
        UserName = 'ppReport4DBImage1'
        MaintainAspectRatio = True
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
      object ppReport4DBText4: TppDBText
        UserName = 'ppReport4DBText4'
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
        mmWidth = 16140
        BandType = 0
      end
      object ppReport4DBText5: TppDBText
        UserName = 'ppReport4DBText5'
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
        mmWidth = 14552
        BandType = 0
      end
      object ppArqPagEletrLabel1: TppLabel
        UserName = 'ppArqPagEletrLabel1'
        Caption = 'Relatório dos Arquivos de Pagamento Eletrônico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 31221
        mmWidth = 197380
        BandType = 0
      end
      object ppArqPagEletrLabel2: TppLabel
        UserName = 'ppArqPagEletrLabel2'
        Caption = 'Nome do Arquivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 45508
        mmWidth = 29104
        BandType = 0
      end
      object ppArqPagEletrLabel3: TppLabel
        UserName = 'ppArqPagEletrLabel3'
        Caption = 'Qtd. Linhas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 127265
        mmTop = 45508
        mmWidth = 19050
        BandType = 0
      end
      object ppArqPagEletrLabel4: TppLabel
        UserName = 'ppArqPagEletrLabel4'
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
        mmTop = 45508
        mmWidth = 8996
        BandType = 0
      end
      object ppArqPagEletrLine3: TppLine
        UserName = 'ppArqPagEletrLine3'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 50006
        mmWidth = 197115
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppArqPagEletrDBText1: TppDBText
        UserName = 'ppArqPagEletrDBText1'
        DataField = 'NOMEARQ'
        DataPipeline = plArqPagEletr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 0
        mmWidth = 108215
        BandType = 4
      end
      object ppArqPagEletrDBText2: TppDBText
        UserName = 'ppArqPagEletrDBText2'
        DataField = 'QUANTIDADE'
        DataPipeline = plArqPagEletr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 126471
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppArqPagEletrDBText3: TppDBText
        UserName = 'ppArqPagEletrDBText3'
        DataField = 'VALOR'
        DataPipeline = plArqPagEletr
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 166688
        mmTop = 0
        mmWidth = 26194
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      AfterPrint = ppFooterBand1AfterPrint
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppArqPagEletrLine2: TppLine
        UserName = 'ppArqPagEletrLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 8
      end
      object ppArqPagEletrLabel6: TppLabel
        UserName = 'ppArqPagEletrLabel6'
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
        mmTop = 529
        mmWidth = 197909
        BandType = 8
      end
      object ppArqPagEletrCalc1: TppSystemVariable
        UserName = 'ArqPagEletrCalc1'
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
        mmTop = 529
        mmWidth = 197380
        BandType = 8
      end
      object ppArqPagEletrCalc2: TppSystemVariable
        UserName = 'ArqPagEletrCalc2'
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
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppArqPagEletrGroup1: TppGroup
      BreakName = 'QUEBRA'
      DataPipeline = plArqPagEletr
      UserName = 'ArqPagEletrGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppArqPagEletrGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppArqPagEletrGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppArqPagEletrDBCalc2: TppDBCalc
          UserName = 'ppArqPagEletrDBCalc2'
          DataField = 'QUANTIDADE'
          DataPipeline = plArqPagEletr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppArqPagEletrGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 126471
          mmTop = 1058
          mmWidth = 19844
          BandType = 5
          GroupNo = 0
        end
        object ppArqPagEletrLabel5: TppLabel
          UserName = 'ppArqPagEletrLabel5'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 112448
          mmTop = 1058
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
        end
        object ppArqPagEletrDBCalc1: TppDBCalc
          UserName = 'ppArqPagEletrDBCalc1'
          DataField = 'VALOR'
          DataPipeline = plArqPagEletr
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppArqPagEletrGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 166952
          mmTop = 1058
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
        object ppArqPagEletrLine1: TppLine
          UserName = 'ppArqPagEletrLine1'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 195263
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object plArqPagEletr: TppBDEPipeline
    DataSource = dsArqPagEletr
    UserName = 'plArqPagEletr'
    Left = 101
    Top = 56
    object plArqPagEletrppField1: TppField
      FieldAlias = 'NOMEARQ'
      FieldName = 'NOMEARQ'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object plArqPagEletrppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object plArqPagEletrppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object plArqPagEletrppField4: TppField
      FieldAlias = 'QUEBRA'
      FieldName = 'QUEBRA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
  end
  object updArqPagEletr: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMAPREV'
      'set'
      '  NOMEARQ = :NOMEARQ,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VALOR = :VALOR'
      'where'
      '  NOMEARQ = :OLD_NOMEARQ and'
      '  QUANTIDADE = :OLD_QUANTIDADE and'
      '  VALOR = :OLD_VALOR')
    InsertSQL.Strings = (
      'insert into PARAMAPREV'
      '  (NOMEARQ, QUANTIDADE, VALOR)'
      'values'
      '  (:NOMEARQ, :QUANTIDADE, :VALOR)')
    DeleteSQL.Strings = (
      'delete from PARAMAPREV'
      'where'
      '  NOMEARQ = :OLD_NOMEARQ and'
      '  QUANTIDADE = :OLD_QUANTIDADE and'
      '  VALOR = :OLD_VALOR')
    Left = 101
    Top = 195
  end
  object rptFontePagadora: TppReport
    AutoStop = False
    DataPipeline = ppFontePagadora
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relação de Rubricas por Fonte Pagadora'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 192
    Top = 12
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand3: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47096
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'Label11'
        Caption = 'Relação de Rubricas por Fonte Pagadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 59267
        mmTop = 30163
        mmWidth = 83344
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 38100
        mmWidth = 197300
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 44715
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label1'
        Caption = 'Fonte Pagadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 5556
        mmTop = 39688
        mmWidth = 26988
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label2'
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 55298
        mmTop = 39688
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Descrição da Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 91017
        mmTop = 39688
        mmWidth = 36248
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
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
      object ppDBText11: TppDBText
        UserName = 'DBText11'
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
      object ppDBText12: TppDBText
        UserName = 'DBText12'
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
        mmWidth = 25400
        BandType = 0
      end
      object ppDBImage2: TppDBImage
        UserName = 'DBImage2'
        MaintainAspectRatio = True
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
      object ppDBText13: TppDBText
        UserName = 'DBText13'
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
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
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
        mmWidth = 14552
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText7: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'DESCFONTE'
        DataPipeline = ppFontePagadora
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 5821
        mmTop = 1058
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'CODIGO'
        DataPipeline = ppFontePagadora
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 55563
        mmTop = 1058
        mmWidth = 7673
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'DESCRUB'
        DataPipeline = ppFontePagadora
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3969
        mmLeft = 91281
        mmTop = 1058
        mmWidth = 36513
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel8: TppLabel
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
        mmWidth = 197909
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryFontePagadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #9'FON.DESCRICAO AS DESCFONTE,'
      
        '  DECODE(PRF.FLGUSACODRUBEXT, 0, PRV.IDPROVENTO , PRV.CODPROVDES' +
        'C) AS CODIGO,'
      
        #9'DECODE(PRF.FLGUSACODRUBEXT, 0, PRV.DESCRICAO, PRV.DESCRPROVDESC' +
        ' ) AS DESCRUB'
      ''
      'FROM'
      #9'PROVDESC PRV,'
      #9'FONTEPAGADORA FON,'
      '  PARAMFOLHA PRF'
      ''
      'WHERE'
      
        '  ((:FONTEPAGADORA IS NOT NULL AND :FONTEPAGADORA = FON.IDFONTEP' +
        'AGADORA) OR (:FONTEPAGADORA IS NULL) ) AND'
      #9'(PRV.CODFONTEPAGADORA = FON.IDFONTEPAGADORA)'
      ''
      'ORDER BY'
      '  FON.DESCRICAO,'
      '  CODIGO'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 147
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FONTEPAGADORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FONTEPAGADORA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FONTEPAGADORA'
        ParamType = ptUnknown
      end>
  end
  object dsFontepagadora: TwwDataSource
    DataSet = qryFontePagadora
    Left = 192
    Top = 101
  end
  object ppFontePagadora: TppBDEPipeline
    DataSource = dsFontepagadora
    UserName = 'lExemplo1'
    Left = 192
    Top = 56
  end
end
