inherited RptContabilDiaria: TRptContabilDiaria
  Left = 306
  Top = 374
  Width = 376
  Height = 201
  Caption = 'RptContabilDiaria'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Contabilização Diária'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data Inicial'
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
      end
      item
        Caption = 'Data Final'
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
      end
      item
        Caption = 'Conta'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   CODPORTADOR,'
          '   DESCRICAO'
          'FROM'
          '   PORTADORCONTA'
          'WHERE'
          '   (IDPESSOA = 1)'
          'ORDER BY DESCRICAO')
        LookupSettings.Chave = 'CODPORTADOR'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Conta bancária'
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
        Required = False
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
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 150
    Left = 216
  end
  inherited DevRptCM: TExtraOptions
    Left = 40
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpContabilidade
    LabelEmpresa = pplblEmpresa
    LabelSistema = pplblSistema
    Left = 128
  end
  object cdsPrevisao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 128
    Top = 120
  end
  object spPrevisao: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   SUM(U.VALORRMHOJE) AS VALORRMHOJE,'
      '   SUM(U.VALORPMHOJE) AS VALORPMHOJE,'
      '   SUM(U.VALORPHOJE) AS VALORPHOJE,'
      '   SUM(U.VALORRHOJE) AS VALORRHOJE,'
      '   SUM(U.VALORPNHOJE) AS VALORPNHOJE,'
      '   SUM(U.VALORRNHOJE) AS VALORRNHOJE'
      'FROM'
      '-- 1'
      '   (SELECT'
      
        '       SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,-L.VALOR)) AS VALORRMHOJE' +
        ','
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA > TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'R'#39') AND'
      '       (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 2'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      
        '       SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,-L.VALOR)) AS VALORPMHOJE' +
        ','
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA > TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'P'#39') AND'
      '       (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 3'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,-L.VALOR)) AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA = TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'P'#39') AND (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 4'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,-L.VALOR)) AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA = TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'R'#39') AND (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 5'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      
        '       SUM(DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,-L.VALOR)) AS VALORPNHOJE' +
        ','
      '       0 AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA < TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'P'#39') AND (L.IDPESSOA = :IDPessoa)'
      '   UNION ALL'
      '-- 6'
      '    SELECT'
      '       0 AS VALORRMHOJE,'
      '       0 AS VALORPMHOJE,'
      '       0 AS VALORPHOJE,'
      '       0 AS VALORRHOJE,'
      '       0 AS VALORPNHOJE,'
      '       SUM(DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,-L.VALOR)) AS VALORRNHOJE'
      '    FROM'
      '       LANCTODOCUM L,'
      '       DOCUMENTO D'
      '    WHERE'
      '       (D.STATUS <> 2 OR D.STATUS IS NULL) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.DATAPROGRAMADA < TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))  AND'
      '       (D.RECPAG = '#39'R'#39') AND (L.IDPESSOA = :IDPessoa)) U'
      ' ')
    ClientDataSet = cdsPrevisao
    Left = 40
    Top = 120
  end
  object pplPrevisao: TppBDEPipeline
    DataSource = dsPrevisao
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lPrevisao'
    Left = 304
    Top = 120
    object pplPrevisaoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRMHOJE'
      FieldName = 'VALORRMHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object pplPrevisaoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPMHOJE'
      FieldName = 'VALORPMHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplPrevisaoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPHOJE'
      FieldName = 'VALORPHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplPrevisaoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRHOJE'
      FieldName = 'VALORRHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplPrevisaoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPNHOJE'
      FieldName = 'VALORPNHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplPrevisaoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRNHOJE'
      FieldName = 'VALORRNHOJE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
  end
  object dsPrevisao: TwwDataSource
    DataSet = cdsPrevisao
    Left = 216
    Top = 120
  end
  object rpContabilidade: TppReport
    AutoStop = False
    DataPipeline = pplContabilidade
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
    Left = 304
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplContabilidade'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppLabel28: TppLabel
        UserName = 'ppLabel28'
        Caption = 'Contabilizações Diárias '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 119592
        mmTop = 6879
        mmWidth = 48683
        BandType = 0
      end
      object pplblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        Caption = 'CM Soluções'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127529
        mmTop = 529
        mmWidth = 30692
        BandType = 0
      end
      object pplblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = '27/08/1998 a 27/08/1999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 224896
        mmTop = 12435
        mmWidth = 30427
        BandType = 0
      end
      object ppLabel31: TppLabel
        UserName = 'ppLabel31'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 210873
        mmTop = 12171
        mmWidth = 12965
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText15: TppDBText
        UserName = 'ppDBText15'
        AutoSize = True
        DataField = 'LACVALOR'
        DataPipeline = pplContabilidade
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3440
        mmLeft = 258234
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'ppDBText16'
        AutoSize = True
        DataField = 'PLNPLANIL'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'ppDBText17'
        DataField = 'CONTAD'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3704
        mmLeft = 32808
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'ppDBText18'
        DataField = 'HISTORICO'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3704
        mmLeft = 163777
        mmTop = 0
        mmWidth = 89429
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'ppDBText19'
        DataField = 'NOMECONTAD'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3704
        mmLeft = 58208
        mmTop = 0
        mmWidth = 38629
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'ppDBText20'
        DataField = 'CONTAC'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3704
        mmLeft = 98161
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'ppDBText21'
        DataField = 'NOMECONTAC'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3704
        mmLeft = 124090
        mmTop = 0
        mmWidth = 38629
        BandType = 4
      end
      object rpContabilidadeDBText1: TppDBText
        UserName = 'rpContabilidadeDBText1'
        AutoSize = True
        DataField = 'DATACONT'
        DataPipeline = pplContabilidade
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplContabilidade'
        mmHeight = 3440
        mmLeft = 1058
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 14817
      mmPrintPosition = 0
      object pplblSistema: TppLabel
        UserName = 'lblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 275167
        BandType = 8
      end
      object ppLine9: TppLine
        UserName = 'ppLine9'
        Weight = 0.75
        mmHeight = 2381
        mmLeft = 0
        mmTop = 1323
        mmWidth = 277019
        BandType = 8
      end
      object ppCalc10: TppSystemVariable
        UserName = 'ppCalc101'
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
        mmTop = 3175
        mmWidth = 276226
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 249503
        mmTop = 3175
        mmWidth = 25929
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 21696
        mmLeft = 0
        mmTop = 0
        mmWidth = 275696
        BandType = 7
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Recebimentos em Atraso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 2910
        mmTop = 2646
        mmWidth = 34396
        BandType = 7
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'VALORRNHOJE'
        DataPipeline = pplPrevisao
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPrevisao'
        mmHeight = 3440
        mmLeft = 44979
        mmTop = 2646
        mmWidth = 20638
        BandType = 7
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Pagamentos em Atraso:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 5292
        mmTop = 7938
        mmWidth = 32015
        BandType = 7
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'VALORPNHOJE'
        DataPipeline = pplPrevisao
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPrevisao'
        mmHeight = 3440
        mmLeft = 44979
        mmTop = 7938
        mmWidth = 20638
        BandType = 7
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Recebimentos para Hoje:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 103452
        mmTop = 2646
        mmWidth = 33867
        BandType = 7
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'VALORRHOJE'
        DataPipeline = pplPrevisao
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPrevisao'
        mmHeight = 3440
        mmLeft = 143404
        mmTop = 2646
        mmWidth = 18521
        BandType = 7
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Pagamentos para Hoje:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 105834
        mmTop = 7938
        mmWidth = 31485
        BandType = 7
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'VALORPHOJE'
        DataPipeline = pplPrevisao
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPrevisao'
        mmHeight = 3440
        mmLeft = 143404
        mmTop = 7938
        mmWidth = 18521
        BandType = 7
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Recebimentos Futuros:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 189971
        mmTop = 2646
        mmWidth = 30692
        BandType = 7
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'VALORRMHOJE'
        DataPipeline = pplPrevisao
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPrevisao'
        mmHeight = 3440
        mmLeft = 226484
        mmTop = 2646
        mmWidth = 20902
        BandType = 7
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'VALORPMHOJE'
        DataPipeline = pplPrevisao
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplPrevisao'
        mmHeight = 3440
        mmLeft = 226484
        mmTop = 7938
        mmWidth = 20902
        BandType = 7
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Pagamentos Futuros:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 189442
        mmTop = 7938
        mmWidth = 31221
        BandType = 7
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Saldo Anterior:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 16933
        mmTop = 16669
        mmWidth = 20373
        BandType = 7
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Saldo Atual:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 120915
        mmTop = 16669
        mmWidth = 16404
        BandType = 7
      end
      object lblSaldoAnterior: TppLabel
        UserName = 'lblSaldoAnterior'
        Caption = 'Saldo Anterior:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 45244
        mmTop = 16669
        mmWidth = 20373
        BandType = 7
      end
      object lblSaldoAtual: TppLabel
        UserName = 'lblSaldoAtual'
        Caption = 'Saldo Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 146315
        mmTop = 16669
        mmWidth = 15610
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'ENTRADASAIDA'
      DataPipeline = pplContabilidade
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContabilidade'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppShape4: TppShape
          UserName = 'ppShape4'
          mmHeight = 5821
          mmLeft = 0
          mmTop = 0
          mmWidth = 275696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText26: TppDBText
          UserName = 'ppDBText26'
          AutoSize = True
          DataField = 'ENTRADASAIDA'
          DataPipeline = pplContabilidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplContabilidade'
          mmHeight = 3440
          mmLeft = 3175
          mmTop = 1323
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppLabel37: TppLabel
          UserName = 'ppLabel37'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 163777
          mmTop = 8731
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel38: TppLabel
          UserName = 'ppLabel38'
          Caption = 'Descrição Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 124090
          mmTop = 8731
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLabel39: TppLabel
          UserName = 'ppLabel39'
          Caption = 'Planilha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 17727
          mmTop = 8731
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppLabel40: TppLabel
          UserName = 'ppLabel40'
          Caption = 'Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 32808
          mmTop = 8731
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppLabel41: TppLabel
          UserName = 'ppLabel41'
          Caption = 'Descrição Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 58208
          mmTop = 8731
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppLabel42: TppLabel
          UserName = 'ppLabel42'
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 98161
          mmTop = 8731
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppLabel43: TppLabel
          UserName = 'ppLabel43'
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 5292
          mmTop = 8731
          mmWidth = 6085
          BandType = 3
          GroupNo = 0
        end
        object ppLabel44: TppLabel
          UserName = 'ppLabel44'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 263261
          mmTop = 8731
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLabel45: TppLabel
          UserName = 'ppLabel45'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 236538
          mmTop = 1058
          mmWidth = 7938
          BandType = 5
          GroupNo = 2
        end
        object rpContabilidadeDBCalc1: TppDBCalc
          UserName = 'rpContabilidadeDBCalc1'
          AutoSize = True
          DataField = 'LACVALOR'
          DataPipeline = pplContabilidade
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplContabilidade'
          mmHeight = 3387
          mmLeft = 246624
          mmTop = 1058
          mmWidth = 26162
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpContabilidadeGroup1: TppGroup
      BreakName = 'DATALANC'
      DataPipeline = pplContabilidade
      OutlineSettings.CreateNode = True
      UserName = 'rpContabilidadeGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplContabilidade'
      object rpContabilidadeGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9525
        mmPrintPosition = 0
        object ppDBText22: TppDBText
          UserName = 'ppDBText22'
          AutoSize = True
          DataField = 'DATALANC'
          DataPipeline = pplContabilidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplContabilidade'
          mmHeight = 3440
          mmLeft = 37571
          mmTop = 2910
          mmWidth = 14288
          BandType = 3
          GroupNo = 1
        end
        object rpContabilidadeLabel1: TppLabel
          UserName = 'rpContabilidadeLabel1'
          Caption = 'Data do Financeiro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3440
          mmLeft = 10054
          mmTop = 2910
          mmWidth = 26458
          BandType = 3
          GroupNo = 1
        end
        object rpContabilidadeLine1: TppLine
          UserName = 'rpContabilidadeLine1'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 0
          mmTop = 8467
          mmWidth = 275696
          BandType = 3
          GroupNo = 1
        end
        object rpContabilidadeLine2: TppLine
          UserName = 'rpContabilidadeLine2'
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 794
          mmTop = 1323
          mmWidth = 275696
          BandType = 3
          GroupNo = 1
        end
      end
      object rpContabilidadeGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object pplContabilidade: TppBDEPipeline
    DataSource = dsContabilidade
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lContabilidade'
    Left = 224
    Top = 72
    object pplContabilidadeppField1: TppField
      FieldAlias = 'CONTAD'
      FieldName = 'CONTAD'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplContabilidadeppField2: TppField
      FieldAlias = 'CONTAC'
      FieldName = 'CONTAC'
      FieldLength = 18
      DisplayWidth = 18
      Position = 1
    end
    object pplContabilidadeppField3: TppField
      FieldAlias = 'NOMECONTAD'
      FieldName = 'NOMECONTAD'
      FieldLength = 18
      DisplayWidth = 18
      Position = 2
    end
    object pplContabilidadeppField4: TppField
      FieldAlias = 'NOMECONTAC'
      FieldName = 'NOMECONTAC'
      FieldLength = 18
      DisplayWidth = 18
      Position = 3
    end
    object pplContabilidadeppField5: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 81
      DisplayWidth = 81
      Position = 4
    end
    object pplContabilidadeppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'LACVALOR'
      FieldName = 'LACVALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplContabilidadeppField7: TppField
      FieldAlias = 'ENTRADASAIDA'
      FieldName = 'ENTRADASAIDA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 6
    end
    object pplContabilidadeppField8: TppField
      FieldAlias = 'DATALANC'
      FieldName = 'DATALANC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplContabilidadeppField9: TppField
      FieldAlias = 'DATACONT'
      FieldName = 'DATACONT'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object pplContabilidadeppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'PLNPLANIL'
      FieldName = 'PLNPLANIL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
  end
  object dsContabilidade: TwwDataSource
    DataSet = cdsContabilDiaria
    Left = 128
    Top = 64
  end
  object cdsContabilDiaria: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 40
    Top = 64
  end
end
