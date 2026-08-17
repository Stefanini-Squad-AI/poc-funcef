inherited RptDiario: TRptDiario
  Left = 286
  Top = 258
  Width = 332
  Height = 245
  Caption = 'RptDiario'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Diário Auxiliar'
    Params = <
      item
        Caption = 'Data de Lançamento dos Documentos Inicial'
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
        Caption = 'Data de Lançamento dos Documentos Final'
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
        Caption = 'Tipo Documento'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODTIPDOC'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'DESCRICAO'
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
    FormWidth = 750
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptDiario
    LabelEmpresa = ppLabel68
    LabelSistema = ppLabel70
  end
  object PpDiario: TppBDEPipeline
    DataSource = DsDiario
    CloseDataSource = True
    UserName = 'PpDiario'
    Left = 131
    Top = 52
    object PpDiarioppField1: TppField
      FieldAlias = 'NOMEFORN'
      FieldName = 'NOMEFORN'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object PpDiarioppField2: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object PpDiarioppField3: TppField
      FieldAlias = 'OPERACAO'
      FieldName = 'OPERACAO'
      FieldLength = 2
      DisplayWidth = 2
      Position = 2
    end
    object PpDiarioppField4: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object PpDiarioppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object PpDiarioppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEBITO'
      FieldName = 'VALDEBITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object PpDiarioppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCREDITO'
      FieldName = 'VALCREDITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object DsDiario: TwwDataSource
    DataSet = CdsDiario
    Left = 94
    Top = 52
  end
  object RptDiario: TppReport
    AutoStop = False
    DataPipeline = PpDiario
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 13000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 171
    Top = 52
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand18: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19844
      mmPrintPosition = 0
      object ppLabel68: TppLabel
        UserName = 'ppLabel68'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 77788
        mmTop = 0
        mmWidth = 28046
        BandType = 0
      end
      object LblTituloDiario: TppLabel
        UserName = 'LblTituloDiario'
        Caption = 'lblTitulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 83873
        mmTop = 7673
        mmWidth = 16140
        BandType = 0
      end
      object lblPeriodoDiario: TppLabel
        UserName = 'lblPeriodoDiario'
        Caption = '01/01/1998 à 31/12/1998'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 147638
        mmTop = 15081
        mmWidth = 36248
        BandType = 0
      end
      object rpGustavoLabel1: TppLabel
        UserName = 'rpGustavoLabel1'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 134938
        mmTop = 15081
        mmWidth = 12435
        BandType = 0
      end
    end
    object ppDetailBand19: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        DataField = 'NODOCUMENTO'
        DataPipeline = PpDiario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 116152
        mmTop = 265
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'ppDBText4'
        DataField = 'OPERACAO'
        DataPipeline = PpDiario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 59002
        mmTop = 265
        mmWidth = 13758
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'ppDBText5'
        AutoSize = True
        DataField = 'VALCREDITO'
        DataPipeline = PpDiario
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 166159
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppReport1DBText7: TppDBText
        UserName = 'ppReport1DBText7'
        AutoSize = True
        DataField = 'VALDEBITO'
        DataPipeline = PpDiario
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 143934
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'ppDBText6'
        DataField = 'NOMEFORN'
        DataPipeline = PpDiario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 265
        mmWidth = 55827
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'ppDBText7'
        DataField = 'HISTORICO'
        DataPipeline = PpDiario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 73819
        mmTop = 265
        mmWidth = 41804
        BandType = 4
      end
    end
    object ppFooterBand18: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine32: TppLine
        UserName = 'ppLine32'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 185000
        BandType = 8
      end
      object ppLabel70: TppLabel
        UserName = 'ppLabel70'
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
        mmTop = 3175
        mmWidth = 106627
        BandType = 8
      end
      object ppCalc31: TppSystemVariable
        UserName = 'Calc31'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 39423
        mmTop = 3175
        mmWidth = 104775
        BandType = 8
      end
      object ppCalc32: TppSystemVariable
        UserName = 'Calc32'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 173302
        mmTop = 3175
        mmWidth = 10848
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppReport1DBCalc3: TppDBCalc
        UserName = 'ppReport1DBCalc3'
        AutoSize = True
        DataField = 'VALDEBITO'
        DataPipeline = PpDiario
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 133350
        mmTop = 1323
        mmWidth = 26458
        BandType = 7
      end
      object ppReport1DBCalc4: TppDBCalc
        UserName = 'ppReport1DBCalc4'
        AutoSize = True
        DataField = 'VALCREDITO'
        DataPipeline = PpDiario
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 155575
        mmTop = 1323
        mmWidth = 28575
        BandType = 7
      end
      object ppLabel71: TppLabel
        UserName = 'ppLabel71'
        Caption = 'Total de Débito e Crédito do Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 77788
        mmTop = 1323
        mmWidth = 53446
        BandType = 7
      end
      object RpDiarioLine1: TppLine
        UserName = 'RpDiarioLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 185000
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATALANCTO'
      DataPipeline = PpDiario
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11906
        mmPrintPosition = 0
        object ppReport1DBText4: TppDBText
          UserName = 'ppReport1DBText4'
          AutoSize = True
          DataField = 'DATALANCTO'
          DataPipeline = PpDiario
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 2381
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppLabel72: TppLabel
          UserName = 'ppLabel72'
          Caption = 'Operação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 59002
          mmTop = 8202
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel74: TppLabel
          UserName = 'ppLabel74'
          Caption = 'Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 150548
          mmTop = 8202
          mmWidth = 9260
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Label5: TppLabel
          UserName = 'ppReport1Label5'
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 173302
          mmTop = 8202
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Label6: TppLabel
          UserName = 'ppReport1Label6'
          Caption = 'Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 8202
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLine33: TppLine
          UserName = 'ppLine33'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 1058
          mmWidth = 185000
          BandType = 3
          GroupNo = 0
        end
        object ppLabel75: TppLabel
          UserName = 'ppLabel75'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 73819
          mmTop = 8202
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppReport1Label10: TppLabel
          UserName = 'ppReport1Label10'
          Caption = 'Núm Doc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 116152
          mmTop = 8202
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppReport1DBCalc1: TppDBCalc
          UserName = 'ppReport1DBCalc1'
          AutoSize = True
          DataField = 'VALDEBITO'
          DataPipeline = PpDiario
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 133350
          mmTop = 1058
          mmWidth = 26458
          BandType = 5
          GroupNo = 0
        end
        object ppReport1DBCalc2: TppDBCalc
          UserName = 'ppReport1DBCalc2'
          AutoSize = True
          DataField = 'VALCREDITO'
          DataPipeline = PpDiario
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 155575
          mmTop = 1058
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object ppLabel76: TppLabel
          UserName = 'ppLabel76'
          Caption = 'Total de Débito e Crédito do Dia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 77788
          mmTop = 1058
          mmWidth = 46302
          BandType = 5
          GroupNo = 0
        end
        object RpDiarioLine2: TppLine
          UserName = 'RpDiarioLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 185000
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object SqlDiario: TCMSqlParams
    SQL.Strings = (
      
        'SELECT DECODE(P.RAZAOSOCIAL,NULL,P.NOME,P.RAZAOSOCIAL) AS NOMEFO' +
        'RN, '
      'L.DATALANCTO, L.OPERACAO, '
      'DECODE(L.HISTORICOCOMPL,NULL, '
      'DECODE(RTRIM(L.OPERACAO),'#39'4'#39',A.DESCRICAO, '
      
        'DECODE(RTRIM(L.OPERACAO),'#39'5'#39','#39'Baixa de Documento'#39','#39'Lançamento de' +
        ' documento'#39')), '
      'L.HISTORICOCOMPL) AS HISTORICO, '
      'D.NODOCUMENTO, '
      
        'DECODE(L.OPERACAO,'#39'10'#39',L.VALOR,DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,NULL)' +
        ') AS VALDEBITO,'
      
        'DECODE(L.OPERACAO,'#39'10'#39',L.VALOR,DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,NULL)' +
        ') AS VALCREDITO'
      'FROM PESSOA P, DOCUMENTO D, LANCTODOCUM L, TIPOALTERADOR A'
      'WHERE 1=2')
    ClientDataSet = CdsDiario
    Left = 56
    Top = 56
  end
  object CdsDiario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 56
  end
end
