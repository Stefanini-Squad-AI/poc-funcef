inherited RptDocMarcRecPag: TRptDocMarcRecPag
  Left = 354
  Top = 252
  Width = 434
  Height = 139
  Caption = 'RptDocMarcRecPag'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Documentos Marcados para Receber/Pagar'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data de Referência'
        Controle = tcEdit
        TipodeDado = tdDate
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
        Width = 0
      end>
    Formheight = 150
    FormWidth = 350
    Left = 360
  end
  inherited DevRptCM: TExtraOptions
    Left = 152
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpDocMarcRecPag
    LabelEmpresa = ppLblEmpresa
    LabelSistema = ppLblSistema
    Left = 256
  end
  object cdsDocMarcRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 48
    Top = 64
  end
  object spDocMarcRecPag: TCMSqlParams
    SQL.Strings = (
      
        'SELECT DECODE(C.DESCRICAO,NULL,'#39'Sem conta selecionada'#39',C.DESCRIC' +
        'AO) AS DESCRICAO,'
      '       C.CODPORTADOR,'
      '       D.CODDOCUMENTO,'
      
        '       (D.DATAPROGRAMADA+DECODE(P.DMAIS,NULL,0,P.DMAIS)) AS DATA' +
        'CFLOAT,'
      '       D.DATAPROGRAMADA,'
      '       D.DATAVENCTO,'
      '       S.SALDO,'
      '       PE.RAZAOSOCIAL,'
      '       L.DATALANCTO,'
      '       D.NODOCUMENTO||'#39'/'#39'||D.COMPLDOCUMENTO AS NUMDOC,'
      '       D.NUMAPGR,'
      '       D.FLGCONFIRMARECPAG,'
      '       OB.OBS'
      'FROM'
      
        '     (SELECT CODDOCUMENTO, SUM(DECODE(DEBCRE,'#39'D'#39',VALOR,VALOR*-1)' +
        ') AS SALDO'
      '      FROM LANCTODOCUM'
      '      GROUP BY CODDOCUMENTO) S,'
      ''
      '      (SELECT'
      '          D.CODDOCUMENTO,'
      '          DECODE(D.OBS,NULL,L.HISTORICOCOMPL,D.OBS) AS OBS'
      '       FROM'
      '          DOCUMENTO D,'
      '          LANCTODOCUM L'
      '       WHERE'
      '          (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '          (D.OPERACAO = L.OPERACAO) AND'
      '          (L.ESTORNO IS NULL)) OB,'
      ''
      '      PESSOA PE,'
      '      DOCUMENTO D,'
      '      LANCTODOCUM L,'
      '      PORTADORFORMA P,'
      '      PORTADORCONTA C'
      'WHERE ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND'
      
        '      ((D.OPERACAO = '#39'1 '#39') OR (D.OPERACAO = '#39'2 '#39') OR (D.OPERACAO' +
        ' = '#39'3 '#39') OR (D.OPERACAO = '#39'14'#39')) AND'
      '      (D.FLGCONFIRMARECPAG = '#39'S'#39')  AND'
      '      (D.IDPESSOA = :IDPessoa) AND'
      '      (D.IDFORCLI = PE.IDPESSOA) AND'
      '      (D.DATAPROGRAMADA = TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39')) AND'
      '      (D.CODDOCUMENTO = S.CODDOCUMENTO) AND'
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '      (D.OPERACAO = L.OPERACAO) AND'
      '      (L.ESTORNO IS NULL) AND'
      '      (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND'
      '      (P.CODPORTADOR = C.CODPORTADOR(+)) AND'
      '      (D.CODDOCUMENTO = OB.CODDOCUMENTO)'
      'ORDER BY D.DATAPROGRAMADA'
      ' '
      ' ')
    ClientDataSet = cdsDocMarcRecPag
    Left = 48
    Top = 8
  end
  object rpDocMarcRecPag: TppReport
    AutoStop = False
    DataPipeline = pplDocMarcRecPag
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 152
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplDocMarcRecPag'
    object ppHeaderBand8: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 26723
      mmPrintPosition = 0
      object ppLabel16: TppLabel
        UserName = 'ppLabel16'
        Caption = 'Documentos Marcados para serem Pagos e Recebidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 86784
        mmTop = 10848
        mmWidth = 110861
        BandType = 0
      end
      object ppLblEmpresa: TppLabel
        UserName = 'ppLblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 3704
        mmWidth = 28046
        BandType = 0
      end
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 25135
        mmWidth = 284300
        BandType = 0
      end
      object ppLine13: TppLine
        UserName = 'ppLine13'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'ppLabel18'
        Caption = 'Data Programada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 20902
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'ppLabel20'
        Caption = 'Cliente / Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 30163
        mmTop = 20902
        mmWidth = 26723
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'ppLabel23'
        Caption = 'Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 105834
        mmTop = 20902
        mmWidth = 15081
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'ppLabel27'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 273051
        mmTop = 20902
        mmWidth = 6879
        BandType = 0
      end
      object rpDispFinancLabel1: TppLabel
        UserName = 'rpDispFinancLabel1'
        Caption = 'O.B.S.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 123561
        mmTop = 20902
        mmWidth = 8202
        BandType = 0
      end
      object rpDispFinancLabel2: TppLabel
        UserName = 'rpDispFinancLabel2'
        Caption = 'Conta Bancária/Caixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 199761
        mmTop = 20902
        mmWidth = 29898
        BandType = 0
      end
    end
    object ppDetailBand9: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        AutoSize = True
        DataField = 'DATAPROGRAMADA'
        DataPipeline = pplDocMarcRecPag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDocMarcRecPag'
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 0
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = pplDocMarcRecPag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDocMarcRecPag'
        mmHeight = 3704
        mmLeft = 30163
        mmTop = 0
        mmWidth = 70115
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'ppDBText9'
        AutoSize = True
        DataField = 'SALDO'
        DataPipeline = pplDocMarcRecPag
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDocMarcRecPag'
        mmHeight = 3175
        mmLeft = 271198
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'ppDBText10'
        DataField = 'NUMDOC'
        DataPipeline = pplDocMarcRecPag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDocMarcRecPag'
        mmHeight = 3704
        mmLeft = 101336
        mmTop = 0
        mmWidth = 21431
        BandType = 4
      end
      object rpDispFinancDBText2: TppDBText
        UserName = 'rpDispFinancDBText2'
        DataField = 'DESCRICAO'
        DataPipeline = pplDocMarcRecPag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDocMarcRecPag'
        mmHeight = 3704
        mmLeft = 199761
        mmTop = 0
        mmWidth = 54240
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'OBS'
        DataPipeline = pplDocMarcRecPag
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDocMarcRecPag'
        mmHeight = 3704
        mmLeft = 123561
        mmTop = 0
        mmWidth = 74877
        BandType = 4
      end
    end
    object ppFooterBand9: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object ppLblSistema: TppLabel
        UserName = 'ppLblSistema'
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
        mmTop = 5292
        mmWidth = 278078
        BandType = 8
      end
      object ppLine14: TppLine
        UserName = 'ppLine14'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3969
        mmWidth = 284300
        BandType = 8
      end
      object ppCalc14: TppSystemVariable
        UserName = 'Calc14'
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
        mmTop = 5292
        mmWidth = 277813
        BandType = 8
      end
      object ppCalc15: TppSystemVariable
        UserName = 'Calc15'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 250825
        mmTop = 5292
        mmWidth = 27252
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object rpDispFinancLabel3: TppLabel
        UserName = 'rpDispFinancLabel3'
        Caption = 'Saldo do Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 228071
        mmTop = 1323
        mmWidth = 25400
        BandType = 7
      end
      object rpDispFinancDBCalc1: TppDBCalc
        UserName = 'rpDispFinancDBCalc1'
        AutoSize = True
        DataField = 'SALDO'
        DataPipeline = pplDocMarcRecPag
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDocMarcRecPag'
        mmHeight = 3175
        mmLeft = 261409
        mmTop = 1323
        mmWidth = 19315
        BandType = 7
      end
    end
  end
  object dsDocMarcRecPag: TwwDataSource
    DataSet = cdsDocMarcRecPag
    Left = 360
    Top = 64
  end
  object pplDocMarcRecPag: TppBDEPipeline
    DataSource = dsDocMarcRecPag
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lDocMarcRecPag'
    Left = 256
    Top = 64
  end
end
