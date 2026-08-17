inherited RelBoletaEmpAcoes: TRelBoletaEmpAcoes
  Left = 853
  Top = 240
  Width = 239
  Height = 247
  Caption = 'RelBoletaEmpAcoes'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Boleta'
        Controle = tcMontaSelect
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Boleta'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        MontaSelect = MontaSelect
        Width = 0
      end>
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 64
  end
  object spr: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   OP.IDOPEREMPACOES,'
      '   OP.IDCUSTODIANTE,'
      '   OP.IDCARTEIRAINVEST,'
      '   OP.IDINVESTIMENTO,'
      '   OP.IDTIPOINVEST,'
      '   OP.IDTIPOOPERACAO,'
      '   OP.DATAOPERACAO,'
      '   OP.DATAVENCOPER,'
      '   OP.VLROPERACAO,'
      '   OP.QTDOPERACAO,'
      '   OP.PUOPERACAO,'
      '   OP.TAXAOPERACAO,'
      '   OP.VLRIR,'
      '   OP.FLGREVERSAO,'
      '   OP.FLGPRECO,'
      '   OP.IDOPEREMPACOESAP,'
      '   OP.VLRRESGATE,'
      '   OP.VLRJUROS,'
      '   OP.TIPOCONFIRMADO,'
      '   0 AS VLRRESGATEATU,'
      '   VLRRESGATE-VLROPERACAO AS VALOREMPRESTIMO,'
      '   IV.DESCINVESTIMENTO,'
      '   CU.SGLCUSTODIANTE,'
      '   TP.DESCTIPOOPERACAO,'
      '   OP.PLNCODIGO,'
      '   OP.CODDOCUMENTO,'
      '   OP.IDPLANPREVCTBPATR'
      'FROM'
      '   OPEREMPACOES OP, INVESTIMENTO IV, TIPOOPERACAO TP,'
      '   CUSTODIANTE CU'
      'WHERE'
      '   IDOPEREMPACOES = 45'
      '   AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '   AND OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO'
      '   AND OP.IDCUSTODIANTE  = CU.IDCUSTODIANTE')
    ClientDataSet = cds
    Left = 16
    Top = 64
  end
  object ds: TDataSource
    AutoEdit = False
    DataSet = cds
    Left = 96
    Top = 64
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 141
    Top = 64
    object pplppField1: TppField
      FieldAlias = 'IDOPEREMPACOES'
      FieldName = 'IDOPEREMPACOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplppField2: TppField
      FieldAlias = 'IDCUSTODIANTE'
      FieldName = 'IDCUSTODIANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplppField3: TppField
      FieldAlias = 'IDCARTEIRAINVEST'
      FieldName = 'IDCARTEIRAINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplppField4: TppField
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplppField5: TppField
      FieldAlias = 'IDTIPOINVEST'
      FieldName = 'IDTIPOINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplppField6: TppField
      FieldAlias = 'IDTIPOOPERACAO'
      FieldName = 'IDTIPOOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplppField7: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplppField8: TppField
      FieldAlias = 'DATAVENCOPER'
      FieldName = 'DATAVENCOPER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplppField9: TppField
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplppField10: TppField
      FieldAlias = 'QTDOPERACAO'
      FieldName = 'QTDOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplppField11: TppField
      FieldAlias = 'PUOPERACAO'
      FieldName = 'PUOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplppField12: TppField
      FieldAlias = 'TAXAOPERACAO'
      FieldName = 'TAXAOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplppField13: TppField
      FieldAlias = 'VLRIR'
      FieldName = 'VLRIR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplppField14: TppField
      FieldAlias = 'FLGREVERSAO'
      FieldName = 'FLGREVERSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplppField15: TppField
      FieldAlias = 'FLGPRECO'
      FieldName = 'FLGPRECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplppField16: TppField
      FieldAlias = 'IDOPEREMPACOESAP'
      FieldName = 'IDOPEREMPACOESAP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplppField17: TppField
      FieldAlias = 'VLRRESGATE'
      FieldName = 'VLRRESGATE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplppField18: TppField
      FieldAlias = 'VLRJUROS'
      FieldName = 'VLRJUROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplppField19: TppField
      FieldAlias = 'TIPOCONFIRMADO'
      FieldName = 'TIPOCONFIRMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplppField20: TppField
      FieldAlias = 'VLRRESGATEATU'
      FieldName = 'VLRRESGATEATU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplppField21: TppField
      FieldAlias = 'VALOREMPRESTIMO'
      FieldName = 'VALOREMPRESTIMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplppField22: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplppField23: TppField
      FieldAlias = 'SGLCUSTODIANTE'
      FieldName = 'SGLCUSTODIANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplppField24: TppField
      FieldAlias = 'DESCTIPOOPERACAO'
      FieldName = 'DESCTIPOOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplppField25: TppField
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplppField26: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pplppField27: TppField
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
  end
  object rptBoletaEmpAcoes: TppReport
    AutoStop = False
    DataPipeline = ppl
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
    Left = 42
    Top = 120
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 61913
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Boleta de Empréstimo de Ações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 20373
        mmTop = 8731
        mmWidth = 64823
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 17198
        mmWidth = 197300
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 20373
        mmTop = 1588
        mmWidth = 28046
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
        mmLeft = 8202
        mmTop = 25400
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
        mmLeft = 8202
        mmTop = 20108
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
        mmLeft = 8202
        mmTop = 30692
        mmWidth = 27252
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
        mmLeft = 8202
        mmTop = 46567
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
        mmLeft = 113771
        mmTop = 34131
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
        mmLeft = 8202
        mmTop = 35983
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
        mmLeft = 8202
        mmTop = 41275
        mmWidth = 17727
        BandType = 0
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAOPERACAO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 38629
        mmTop = 25400
        mmWidth = 17198
        BandType = 0
      end
      object dbeDataVencto: TppDBText
        UserName = 'dbeDataVencto'
        DataField = 'DATAVENCOPER'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 38629
        mmTop = 30692
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 38629
        mmTop = 35983
        mmWidth = 73554
        BandType = 0
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DESCTIPOOPERACAO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 38629
        mmTop = 20108
        mmWidth = 73554
        BandType = 0
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PUOPERACAO'
        DataPipeline = ppl
        DisplayFormat = '#,##0.000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 34131
        mmWidth = 29898
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'SGLCUSTODIANTE'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 38629
        mmTop = 41275
        mmWidth = 73554
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
        mmLeft = 113506
        mmTop = 20638
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
        mmLeft = 113771
        mmTop = 38629
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
        mmLeft = 113506
        mmTop = 24871
        mmWidth = 38894
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
        mmLeft = 113506
        mmTop = 29633
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
        mmLeft = 113771
        mmTop = 42598
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
        mmLeft = 113771
        mmTop = 47096
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
        mmLeft = 113771
        mmTop = 51594
        mmWidth = 6085
        BandType = 0
      end
      object lblFlgReversao: TppLabel
        UserName = 'lblFlgReversao'
        Caption = 'Permite Reversão antes do Vencimento :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 8202
        mmTop = 51594
        mmWidth = 60061
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'lblDiaPreco1'
        DataField = 'TAXAOPERACAO'
        DataPipeline = ppl
        DisplayFormat = '###.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 38365
        mmWidth = 29898
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'lblDiaPreco2'
        DataField = 'VALOREMPRESTIMO'
        DataPipeline = ppl
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 42598
        mmWidth = 29898
        BandType = 0
      end
      object dbeVlrMaxResgate: TppDBText
        UserName = 'lblDiaPreco3'
        DataField = 'VLRRESGATE'
        DataPipeline = ppl
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 24871
        mmWidth = 29898
        BandType = 0
      end
      object dbeVlrIr: TppDBText
        UserName = 'lblDiaPreco4'
        DataField = 'VLRIR'
        DataPipeline = ppl
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 51594
        mmWidth = 29898
        BandType = 0
      end
      object dbeVlrResgDia: TppDBText
        UserName = 'lblDiaPreco5'
        DataField = 'VLRRESGATEATU'
        DataPipeline = ppl
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 47096
        mmWidth = 29898
        BandType = 0
      end
      object dbeQuantidade: TppDBText
        UserName = 'lblDiaPreco6'
        DataField = 'QTDOPERACAO'
        DataPipeline = ppl
        DisplayFormat = '###,###,###,###,###'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 20638
        mmWidth = 29898
        BandType = 0
      end
      object dbeVlrJuros: TppDBText
        UserName = 'dbeVlrJuros'
        DataField = 'VLRJUROS'
        DataPipeline = ppl
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 29633
        mmWidth = 29898
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 57679
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
        mmLeft = 38629
        mmTop = 46567
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
        mmTop = 2381
        mmWidth = 13229
        BandType = 0
      end
      object ppDBText6: TppDBText
        UserName = 'DBText2'
        DataField = 'FLGREVERSAO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3440
        mmLeft = 70908
        mmTop = 51594
        mmWidth = 11377
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
      object lblSistema: TppLabel
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
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'OPEREMPACOES.IDBOLETA'
      'OPEREMPACOES.DATAOPERACAO'
      'OPEREMPACOES.DATAVENCOPER'
      'VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'CUSTODIANTE.SGLCUSTODIANTE'
      'OPEREMPACOES.QTDOPERACAO'
      'OPEREMPACOES.TAXAOPERACAO'
      'OPEREMPACOES.VLROPERACAO')
    TipodeDado.Strings = (
      'C'
      'D'
      'D'
      'C'
      'C'
      'C'
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Boleta'
      'Data da Operação'
      'Data de Vencimento'
      'Plano / Patro'
      'Investimento'
      'Custodiante'
      'Quantidade'
      'Taxa'
      'Valor da Operação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPEREMPACOES'
      'VWPLANPREVCTBPATR'
      'INVESTIMENTO'
      'CUSTODIANTE')
    CamposChave.Strings = (
      'OPEREMPACOES.IDOPEREMPACOESAP')
    Filtro.Strings = (
      'OPEREMPACOES.IDOPEREMPACOES = OPEREMPACOES.IDOPEREMPACOESAP'
      
        'OPEREMPACOES.IDPLANPREVCTBPATR = VWPLANPREVCTBPATR.IDPLANPREVCTB' +
        'PATR'
      'OPEREMPACOES.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'OPEREMPACOES.IDCUSTODIANTE = CUSTODIANTE.IDCUSTODIANTE')
    Mascaras.Strings = (
      ''
      'dd/mm/yyyy'
      'dd/mm/yyyy'
      ''
      ''
      ''
      '#.###'
      '#,###.000%'
      '#,###.00')
    Larguras.Strings = (
      '10'
      '18'
      '18'
      '113'
      '60'
      '10'
      '10'
      '10'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 133
    Top = 119
  end
end
