inherited DMRelBoletaEmpAcoes: TDMRelBoletaEmpAcoes
  Left = 326
  Top = 213
  Height = 138
  Caption = 'DMRelBoletaEmpAcoes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pplExemplo: TppBDEPipeline
    Top = 8
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
    Top = 8
  end
  inherited qryExemplo: TwwQuery
    Top = 8
  end
  inherited rpExemplo: TppReport
    Top = 8
    DataPipelineName = 'pplExemplo'
  end
  object ppBoletaEmpAcoes: TppBDEPipeline
    DataSource = frmCadOperEmpAcoes.ds
    UserName = 'ppBoletaEmpAcoes'
    Left = 181
    Top = 56
    object ppBoletaEmpAcoesppField1: TppField
      FieldAlias = 'IDOPEREMPACOES'
      FieldName = 'IDOPEREMPACOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField2: TppField
      FieldAlias = 'IDCUSTODIANTE'
      FieldName = 'IDCUSTODIANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField3: TppField
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField4: TppField
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField5: TppField
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField6: TppField
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField7: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField8: TppField
      FieldAlias = 'DATAVENCOPER'
      FieldName = 'DATAVENCOPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField9: TppField
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField10: TppField
      FieldAlias = 'QTDOPERACAO'
      FieldName = 'QTDOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField11: TppField
      FieldAlias = 'PUOPERACAO'
      FieldName = 'PUOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField12: TppField
      FieldAlias = 'TAXAOPERACAO'
      FieldName = 'TAXAOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField13: TppField
      FieldAlias = 'VLRIR'
      FieldName = 'VLRIR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField14: TppField
      FieldAlias = 'FLGREVERSAO'
      FieldName = 'FLGREVERSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField15: TppField
      FieldAlias = 'FLGPRECO'
      FieldName = 'FLGPRECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField16: TppField
      FieldAlias = 'IDOPEREMPACOESAP'
      FieldName = 'IDOPEREMPACOESAP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField17: TppField
      FieldAlias = 'VLRRESGATE'
      FieldName = 'VLRRESGATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField18: TppField
      FieldAlias = 'VLRJUROS'
      FieldName = 'VLRJUROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField19: TppField
      FieldAlias = 'VLRRESGATEATU'
      FieldName = 'VLRRESGATEATU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField20: TppField
      FieldAlias = 'VALOREMPRESTIMO'
      FieldName = 'VALOREMPRESTIMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField21: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField22: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField23: TppField
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField24: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppBoletaEmpAcoesppField25: TppField
      FieldAlias = 'TIPOCONFIRMADO'
      FieldName = 'TIPOCONFIRMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
  end
  object rptBoletaEmpAcoes: TppReport
    AutoStop = False
    DataPipeline = ppBoletaEmpAcoes
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Boleta de Operação de Empréstimo de Ações'
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
    Left = 74
    Top = 56
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppBoletaEmpAcoes'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 54240
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Boleta de Empréstimo de Ações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 18521
        mmTop = 8730
        mmWidth = 53721
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel2: TppLabel
        OnPrint = LblEmpresaPrint
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 18785
        mmTop = 1588
        mmWidth = 24299
        BandType = 0
      end
      object lblDataOperacao: TppLabel
        UserName = 'Label1'
        Caption = 'Data Operação :  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 22225
        mmWidth = 22490
        BandType = 0
      end
      object lblOperacao: TppLabel
        UserName = 'lblOperacao'
        Caption = 'Operação :  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 17727
        mmWidth = 15875
        BandType = 0
      end
      object lblDataVencto: TppLabel
        UserName = 'lblDataVencto'
        Caption = 'Data Vencimento :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 101071
        mmTop = 22225
        mmWidth = 24077
        BandType = 0
      end
      object lblDPreco: TppLabel
        UserName = 'lblDPreco'
        Caption = 'Dia do Preço :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 31221
        mmWidth = 18521
        BandType = 0
      end
      object lblPreco: TppLabel
        UserName = 'lblPreco'
        Caption = 'Preço :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 101072
        mmTop = 31222
        mmWidth = 9260
        BandType = 0
      end
      object lblInvestimento: TppLabel
        UserName = 'lblInvestimento'
        Caption = 'Investimento :  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 26723
        mmWidth = 20373
        BandType = 0
      end
      object lblCustodiante: TppLabel
        UserName = 'lblCustodiante'
        Caption = 'Custodiante :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 101072
        mmTop = 26723
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppBoletaEmpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 3175
        mmLeft = 46302
        mmTop = 22225
        mmWidth = 17198
        BandType = 0
      end
      object dbeDataVencto: TppDBText
        UserName = 'dbeDataVencto'
        DataField = 'DATAVENCOPER'
        DataPipeline = ppBoletaEmpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 3175
        mmLeft = 139172
        mmTop = 22225
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = ppBoletaEmpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 3175
        mmLeft = 46302
        mmTop = 26723
        mmWidth = 52388
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = ppBoletaEmpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 3175
        mmLeft = 46302
        mmTop = 17727
        mmWidth = 52388
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PUOPERACAO'
        DataPipeline = ppBoletaEmpAcoes
        DisplayFormat = '#,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 3175
        mmLeft = 139172
        mmTop = 31222
        mmWidth = 29898
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'SGLCUSTODIANTE'
        DataPipeline = ppBoletaEmpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 3175
        mmLeft = 139172
        mmTop = 26723
        mmWidth = 52388
        BandType = 0
      end
      object lblQuantidade: TppLabel
        UserName = 'Label2'
        Caption = 'Quantidade :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 35719
        mmWidth = 16933
        BandType = 0
      end
      object lblTaxa: TppLabel
        UserName = 'lblTaxa'
        Caption = 'Taxa :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 170392
        mmTop = 31221
        mmWidth = 7938
        BandType = 0
      end
      object lblVlrMaxResgate: TppLabel
        UserName = 'lblVlrMaxResgate'
        Caption = 'Valor Máximo de Resgate :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 40217
        mmWidth = 35190
        BandType = 0
      end
      object lblVlrJuros: TppLabel
        UserName = 'lblVlrJuros'
        Caption = 'Valor do Juros :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 44715
        mmWidth = 21167
        BandType = 0
      end
      object lblVlrEmprestimo: TppLabel
        UserName = 'lblVlrEmprestimo'
        Caption = 'Valor da Operacão :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 101072
        mmTop = 35720
        mmWidth = 26194
        BandType = 0
      end
      object lblVlrResgDia: TppLabel
        UserName = 'lblVlrResgDia'
        Caption = 'Valor de Resgate no Dia :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 101071
        mmTop = 40217
        mmWidth = 33338
        BandType = 0
      end
      object lblVlrIR: TppLabel
        UserName = 'lblVlrIR'
        Caption = 'I.R. :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 101071
        mmTop = 44715
        mmWidth = 6085
        BandType = 0
      end
      object lblFlgReversao: TppLabel
        UserName = 'lblFlgReversao'
        Caption = 'Permite Reversão antes do Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 49213
        mmWidth = 96573
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'lblDiaPreco1'
        DataField = 'TAXAOPERACAO'
        DataPipeline = ppBoletaEmpAcoes
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 3175
        mmLeft = 179388
        mmTop = 31221
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'lblDiaPreco2'
        DataField = 'VALOREMPRESTIMO'
        DataPipeline = ppBoletaEmpAcoes
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 3175
        mmLeft = 139172
        mmTop = 35720
        mmWidth = 29898
        BandType = 0
      end
      object dbeVlrMaxResgate: TppDBText
        UserName = 'lblDiaPreco3'
        DataField = 'VLRRESGATE'
        DataPipeline = ppBoletaEmpAcoes
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 3175
        mmLeft = 46302
        mmTop = 40216
        mmWidth = 29898
        BandType = 0
      end
      object dbeVlrIr: TppDBText
        UserName = 'lblDiaPreco4'
        DataField = 'VLRIR'
        DataPipeline = ppBoletaEmpAcoes
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 3175
        mmLeft = 139172
        mmTop = 44714
        mmWidth = 29898
        BandType = 0
      end
      object dbeVlrResgDia: TppDBText
        UserName = 'lblDiaPreco5'
        DataField = 'VLRRESGATEATU'
        DataPipeline = ppBoletaEmpAcoes
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 3175
        mmLeft = 139436
        mmTop = 40217
        mmWidth = 29898
        BandType = 0
      end
      object dbeQuantidade: TppDBText
        UserName = 'lblDiaPreco6'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppBoletaEmpAcoes
        DisplayFormat = '###,###,###,###,###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 3175
        mmLeft = 46302
        mmTop = 35719
        mmWidth = 29898
        BandType = 0
      end
      object dbeVlrJuros: TppDBText
        UserName = 'dbeVlrJuros'
        DataField = 'VLRJUROS'
        DataPipeline = ppBoletaEmpAcoes
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 3175
        mmLeft = 46302
        mmTop = 44714
        mmWidth = 29898
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 53446
        mmWidth = 197300
        BandType = 0
      end
      object lblDiaPreco: TppLabel
        UserName = 'lblDiaPreco'
        Caption = 'Ontem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 46302
        mmTop = 31221
        mmWidth = 8731
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2646
        mmTop = 794
        mmWidth = 13229
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText2'
        DataPipeline = ppBoletaEmpAcoes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBoletaEmpAcoes'
        mmHeight = 4233
        mmLeft = 152136
        mmTop = 8731
        mmWidth = 43921
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
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
end
