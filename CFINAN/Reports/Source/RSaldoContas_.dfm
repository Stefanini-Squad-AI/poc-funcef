inherited RptSaldoContas: TRptSaldoContas
  Left = 387
  Top = 231
  Width = 435
  Height = 367
  Caption = 'RptSaldoContas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Saldo das Contas'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Saldo de Contas em'
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
        Caption = 'Status'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos'
          'Só Conciliados'
          'Todos - na casa')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 80
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
        MostraComboCompara = True
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
      end
      item
        Caption = 'Saldo por plano'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
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
        MostraComboCompara = True
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
      end
      item
        Caption = 'Conta'
        Controle = tcLookupCombo
        TipodeDado = tdReal
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  CODPORTADOR,DESCRICAO'
          'FROM PORTADORCONTA'
          'ORDER BY DESCRICAO')
        LookupSettings.Chave = 'CODPORTADOR'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Conta'
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
        ComboBoxSettings.Style = csOwnerDrawFixed
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
    Formheight = 250
    FormWidth = 450
    Left = 216
  end
  inherited DevRptCM: TExtraOptions
    Left = 88
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpSaldo
    LabelEmpresa = pplblEmpresa
    LabelSistema = pplblSistema
    Left = 152
  end
  object cdsSaldo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 88
    Top = 64
  end
  object rpSaldo: TppReport
    AutoStop = False
    DataPipeline = pplSaldo
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 14000
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
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
    Left = 280
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSaldo'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object pplblDataSaldo: TppLabel
        UserName = 'lblDataSaldo'
        AutoSize = False
        Caption = 'lblDataSaldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 8731
        mmWidth = 197115
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20638
        mmWidth = 197300
        BandType = 0
      end
      object pplblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rpSaldoLabel1: TppLabel
        UserName = 'rpSaldoLabel1'
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 22225
        mmWidth = 8467
        BandType = 0
      end
      object rpSaldoLabel2: TppLabel
        UserName = 'rpSaldoLabel2'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 122767
        mmTop = 22225
        mmWidth = 7938
        BandType = 0
      end
      object rpSaldoLine1: TppLine
        UserName = 'rpSaldoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26988
        mmWidth = 197300
        BandType = 0
      end
      object rpSaldoLabel3: TppLabel
        UserName = 'rpSaldoLabel3'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 7144
        mmTop = 22225
        mmWidth = 10319
        BandType = 0
      end
      object rpSaldoLabel6: TppLabel
        UserName = 'rpSaldoLabel6'
        Caption = 'Status:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 157957
        mmTop = 14817
        mmWidth = 11377
        BandType = 0
      end
      object pplblStatus: TppLabel
        UserName = 'lblStatus'
        Caption = 'lblStatus'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 170921
        mmTop = 15081
        mmWidth = 13758
        BandType = 0
      end
      object rpSaldoLabel5: TppLabel
        UserName = 'rpSaldoLabel5'
        Caption = 'Receb.- Pagto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 143140
        mmTop = 22225
        mmWidth = 19579
        BandType = 0
      end
      object rpSaldoLabel7: TppLabel
        UserName = 'rpSaldoLabel7'
        Caption = 'Saldo a Aplicar/Resg.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 166423
        mmTop = 22225
        mmWidth = 28310
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppReport1DBText1: TppDBText
        UserName = 'ppReport1DBText1'
        DataField = 'DESCRICAO'
        DataPipeline = pplSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3704
        mmLeft = 20108
        mmTop = 265
        mmWidth = 77788
        BandType = 4
      end
      object rpSaldoDBText1: TppDBText
        UserName = 'rpSaldoDBText1'
        DataField = 'CODPORTADOR'
        DataPipeline = pplSaldo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3704
        mmLeft = 1588
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object rpSaldoDBText2: TppDBText
        UserName = 'rpSaldoDBText2'
        AutoSize = True
        DataField = 'RECEBTOPAGTO'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 140229
        mmTop = 265
        mmWidth = 23548
        BandType = 4
      end
      object rpSaldoDBText3: TppDBText
        UserName = 'rpSaldoDBText3'
        AutoSize = True
        DataField = 'SALDOATU'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 181240
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object rpSaldoDBText4: TppDBText
        UserName = 'rpSaldoDBText4'
        AutoSize = True
        DataField = 'SALDOANTERIOR'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3175
        mmLeft = 106363
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 197300
        BandType = 8
      end
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
        mmLeft = 265
        mmTop = 1852
        mmWidth = 196321
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
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
        mmTop = 1852
        mmWidth = 196321
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
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
        mmTop = 1852
        mmWidth = 25665
        BandType = 8
      end
    end
    object rpSaldoSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object rpSaldoLabel4: TppLabel
        UserName = 'rpSaldoLabel4'
        Caption = 'Saldo Geral das Contas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 52652
        mmTop = 1588
        mmWidth = 40481
        BandType = 7
      end
      object rpSaldoDBCalc1: TppDBCalc
        UserName = 'rpSaldoDBCalc1'
        AutoSize = True
        DataField = 'SALDOANTERIOR'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3387
        mmLeft = 96140
        mmTop = 2117
        mmWidth = 35094
        BandType = 7
      end
      object rpSaldoDBCalc2: TppDBCalc
        UserName = 'rpSaldoDBCalc2'
        AutoSize = True
        DataField = 'RECEBTOPAGTO'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3387
        mmLeft = 129890
        mmTop = 2117
        mmWidth = 34417
        BandType = 7
      end
      object rpSaldoDBCalc3: TppDBCalc
        UserName = 'rpSaldoDBCalc3'
        AutoSize = True
        DataField = 'SALDOATU'
        DataPipeline = pplSaldo
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldo'
        mmHeight = 3387
        mmLeft = 170995
        mmTop = 2117
        mmWidth = 26120
        BandType = 7
      end
    end
  end
  object pplSaldo: TppBDEPipeline
    DataSource = dsSaldo
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lSaldo'
    Left = 216
    Top = 64
  end
  object dsSaldo: TwwDataSource
    DataSet = cdsSaldo
    Left = 152
    Top = 64
  end
  object CdsSaldoPlano: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 144
    Top = 168
    Data = {
      DA0000009619E0BD010000001800000007000000000003000000DA0009444553
      43524943414F01004900000001000557494454480200020032000B434F44504F
      525441444F5208000400000000000B4944504C414E4F50524556080004000000
      0000044E4F4D4501004900000001000557494454480200020032000D53414C44
      4F414E544552494F5208000400000000000C5245434542544F504147544F0800
      0400000000000853414C444F415455080004000000000002000D44454641554C
      545F4F5244455202008200010000000100044C4349440400010009080000}
    object CdsSaldoPlanoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object CdsSaldoPlanoCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
    end
    object CdsSaldoPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object CdsSaldoPlanoNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object CdsSaldoPlanoSALDOANTERIOR: TFloatField
      FieldName = 'SALDOANTERIOR'
    end
    object CdsSaldoPlanoRECEBTOPAGTO: TFloatField
      FieldName = 'RECEBTOPAGTO'
    end
    object CdsSaldoPlanoSALDOATU: TFloatField
      FieldName = 'SALDOATU'
    end
  end
  object SqlSaldoPlano: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   UN.DESCRICAO,'
      '   UN.CODPORTADOR,'
      '   UN.IDPLANOPREV,'
      '   UN.NOME,'
      '   SUM(UN.SALDOANTERIOR) AS SALDOANTERIOR,'
      '   SUM(UN.RECTOPAGTO) AS RECEBTOPAGTO,'
      '   SUM(UN.SALDOATU) AS SALDOATU'
      'FROM'
      '   ((SELECT'
      '        C.DESCRICAO,'
      '        C.CODPORTADOR,'
      '        R.IDPLANOPREV,'
      '        P.NOME,'
      
        '        SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDOANT' +
        'ERIOR,'
      '        0 AS RECTOPAGTO,'
      '        SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDOATU'
      '     FROM'
      '        PORTADORCONTA C,'
      '        MOVIMFINANC M,'
      '        RATEIOFINANC R,'
      '        PLANPREVCONTABIL P'
      '     WHERE'
      '       (M.DATALANCFINAN <= TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39')) AND'
      '       (M.STATUSCONCILIA IN ('#39'P'#39','#39'X'#39','#39'I'#39','#39'N'#39','#39'C'#39','#39'J'#39')) AND'
      '       (M.IDPESSOA = :IDEmpresa) AND'
      '     '
      '       ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL)) AND'
      '       (M.CODLANCFINANC = R.CODLANCFINANC) AND'
      '       (C.CODPORTADOR = M.CODPORTADOR) AND'
      '       (R.IDPLANOPREV = P.IDPLANOPREV)'
      '     GROUP BY'
      '        C.DESCRICAO,'
      '        C.CODPORTADOR,'
      '        R.IDPLANOPREV,'
      '        P.NOME)'
      ''
      'UNION'
      ''
      '   (SELECT'
      
        '       DECODE(C.DESCRICAO,NULL,'#39'Sem conta selecionada'#39',C.DESCRIC' +
        'AO) AS DESCRICAO,'
      '       C.CODPORTADOR,'
      '       R.IDPLANOPREV,'
      '       PL.NOME,'
      '       0 AS SALDOANTERIOR,'
      '       SUM(S.SALDO) AS RECBTOPAGTO,'
      '       SUM(S.SALDO) AS SALDOATU'
      '    FROM'
      '       (SELECT'
      '           L.CODDOCUMENTO,'
      '           R.IDPLANOPREV,'
      '           SUM(DECODE(DEBCRE,'#39'D'#39',R.VALOR,-R.VALOR)) AS SALDO'
      '        FROM'
      '           LANCTODOCUM L ,'
      '           RATEIODOCUM R'
      '        WHERE'
      '           L.CODDOCUMENTO = R.CODDOCUMENTO'
      '        GROUP BY'
      '           L.CODDOCUMENTO,'
      '           R.IDPLANOPREV) S,'
      ''
      '        DOCUMENTO D,'
      '        LANCTODOCUM L,'
      '        PORTADORFORMA P,'
      '        PORTADORCONTA C,'
      '        RATEIODOCUM R,'
      '        PLANPREVCONTABIL PL,'
      '        PARAMFINANC PF'
      '    WHERE'
      '       ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND'
      
        '       ((D.OPERACAO = '#39'1 '#39') OR (D.OPERACAO = '#39'2 '#39') OR (D.OPERACA' +
        'O = '#39'3 '#39') OR (D.OPERACAO = '#39'14'#39')) AND'
      '       (D.IDPESSOA = :IDEmpresa) AND'
      
        '       (((PF.FLGCONFIRMARECPAG = '#39'S'#39') AND (D.FLGCONFIRMARECPAG =' +
        ' '#39'S'#39')) OR'
      
        '       (((PF.FLGCONFIRMARECPAG = '#39'N'#39') OR (PF.FLGCONFIRMARECPAG I' +
        'S NULL)) AND'
      
        '       ((D.DATAPROGRAMADA = TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39'))))) A' +
        'ND'
      '       (D.CODDOCUMENTO = S.CODDOCUMENTO) AND'
      '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '       (D.OPERACAO = L.OPERACAO) AND'
      '       (D.CODDOCUMENTO = R.CODDOCUMENTO) AND'
      '       (R.IDPLANOPREV = PL.IDPLANOPREV) AND'
      '       (L.ESTORNO IS NULL) AND'
      '       (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND'
      '       (P.CODPORTADOR = C.CODPORTADOR(+)) AND'
      '       (D.IDPESSOA = PF.IDPESSOA) AND'
      '       ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL)) '
      '    GROUP BY'
      '       C.DESCRICAO,'
      '       C.CODPORTADOR,'
      '       R.IDPLANOPREV,'
      '       PL.NOME)) UN'
      'GROUP BY'
      '   UN.DESCRICAO,'
      '   UN.CODPORTADOR,'
      '   UN.IDPLANOPREV,'
      '   UN.NOME'
      'ORDER BY'
      '   UN.DESCRICAO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsSaldoPlano
    Left = 56
    Top = 168
  end
  object dsSaldoPlano: TwwDataSource
    DataSet = CdsSaldoPlano
    Left = 216
    Top = 168
  end
  object pplSaldoPlano: TppDBPipeline
    DataSource = dsSaldoPlano
    CloseDataSource = True
    UserName = 'lSaldoPlano'
    Left = 152
    Top = 240
    object pplSaldoPlanoppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplSaldoPlanoppField2: TppField
      FieldAlias = 'CODPORTADOR'
      FieldName = 'CODPORTADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplSaldoPlanoppField3: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplSaldoPlanoppField4: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplSaldoPlanoppField5: TppField
      FieldAlias = 'SALDOANTERIOR'
      FieldName = 'SALDOANTERIOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplSaldoPlanoppField6: TppField
      FieldAlias = 'RECEBTOPAGTO'
      FieldName = 'RECEBTOPAGTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplSaldoPlanoppField7: TppField
      FieldAlias = 'SALDOATU'
      FieldName = 'SALDOATU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object rptSaldoPlano: TppReport
    AutoStop = False
    DataPipeline = pplSaldoPlano
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 56
    Top = 240
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplSaldoPlano'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object ppDbLogo: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppLDadosEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppLDadosEmpresa'
        mmHeight = 15346
        mmLeft = 1323
        mmTop = 2646
        mmWidth = 17992
        BandType = 1
      end
      object ppLbEmpresa: TppLabel
        OnPrint = ppLbEmpresaPrint
        UserName = 'LblEmpresa1'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 25135
        mmTop = 3175
        mmWidth = 143669
        BandType = 1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Saldo de contas por plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 25135
        mmTop = 9525
        mmWidth = 43921
        BandType = 1
      end
      object ppLbDescPerfil: TppLabel
        UserName = 'LbDescPerfil'
        Caption = 'LbDescPerfil'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25135
        mmTop = 15081
        mmWidth = 19579
        BandType = 1
      end
      object ppLbPeriodo: TppLabel
        UserName = 'LbPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 25665
        mmTop = 22754
        mmWidth = 11113
        BandType = 1
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 28046
        mmWidth = 197300
        BandType = 1
      end
    end
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 2117
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 23019
        mmTop = 2117
        mmWidth = 9260
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppShpCorZebra: TppShape
        OnPrint = ppShpCorZebraPrint
        UserName = 'ShpCorZebra'
        Brush.Color = 13041606
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 23019
        mmTop = 265
        mmWidth = 173567
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NOME'
        DataPipeline = pplSaldoPlano
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSaldoPlano'
        mmHeight = 3175
        mmLeft = 23019
        mmTop = 265
        mmWidth = 75671
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'SALDOANTERIOR'
        DataPipeline = pplSaldoPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoPlano'
        mmHeight = 3175
        mmLeft = 100013
        mmTop = 265
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'RECEBTOPAGTO'
        DataPipeline = pplSaldoPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoPlano'
        mmHeight = 3175
        mmLeft = 136525
        mmTop = 265
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        AutoSize = True
        DataField = 'SALDOATU'
        DataPipeline = pplSaldoPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoPlano'
        mmHeight = 3175
        mmLeft = 180446
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 2117
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 8
      end
      object ppLbNomeSistema: TppLabel
        OnPrint = ppLbNomeSistemaPrint
        UserName = 'LbNomeSistema'
        Caption = 'NomeSistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 794
        mmTop = 2381
        mmWidth = 18785
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 89694
        mmTop = 2381
        mmWidth = 18256
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 170657
        mmTop = 2381
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Saldo geral das contas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 23019
        mmTop = 11377
        mmWidth = 39423
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        AutoSize = True
        DataField = 'RECEBTOPAGTO'
        DataPipeline = pplSaldoPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoPlano'
        mmHeight = 4233
        mmLeft = 117211
        mmTop = 11906
        mmWidth = 42863
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        AutoSize = True
        DataField = 'SALDOANTERIOR'
        DataPipeline = pplSaldoPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoPlano'
        mmHeight = 4233
        mmLeft = 79640
        mmTop = 11906
        mmWidth = 43656
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        AutoSize = True
        DataField = 'SALDOATU'
        DataPipeline = pplSaldoPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSaldoPlano'
        mmHeight = 4233
        mmLeft = 163248
        mmTop = 11906
        mmWidth = 32544
        BandType = 7
      end
      object ppLine7: TppLine
        UserName = 'Line5'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 3969
        mmLeft = 0
        mmTop = 7938
        mmWidth = 197300
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCRICAO'
      DataPipeline = pplSaldoPlano
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSaldoPlano'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'CODPORTADOR'
          DataPipeline = pplSaldoPlano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'pplSaldoPlano'
          mmHeight = 3969
          mmLeft = 1588
          mmTop = 794
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Saldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 116152
          mmTop = 7408
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Plano'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 23019
          mmTop = 7144
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Receb./Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 135732
          mmTop = 7408
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppLine5: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 23019
          mmTop = 11377
          mmWidth = 173832
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Saldo à Pagar/Receb.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 168011
          mmTop = 7408
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = pplSaldoPlano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplSaldoPlano'
          mmHeight = 3969
          mmLeft = 23019
          mmTop = 794
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppLine6: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 23019
          mmTop = 794
          mmWidth = 173302
          BandType = 5
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Total da conta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 23019
          mmTop = 2646
          mmWidth = 18785
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'SALDOANTERIOR'
          DataPipeline = pplSaldoPlano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoPlano'
          mmHeight = 3175
          mmLeft = 88900
          mmTop = 1852
          mmWidth = 34396
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = 'RECEBTOPAGTO'
          DataPipeline = pplSaldoPlano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoPlano'
          mmHeight = 3175
          mmLeft = 126207
          mmTop = 1852
          mmWidth = 33867
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          DataField = 'SALDOATU'
          DataPipeline = pplSaldoPlano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSaldoPlano'
          mmHeight = 3175
          mmLeft = 170392
          mmTop = 1852
          mmWidth = 25400
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object CdsDadosEmpresa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 336
    Top = 208
  end
  object SqlDadosEmpresa: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  I.IMAGEM'
      'FROM'
      '  PESSOA P, IMAGENS I'
      'WHERE'
      '  (P.IDPESSOA = :IDPESSOA) AND'
      '  (I.IDIMAGEM = P.IDIMAGEM)'
      ''
      ' ')
    ClientDataSet = CdsDadosEmpresa
    Left = 336
    Top = 256
  end
  object dsDadosEmpresa: TwwDataSource
    DataSet = CdsDadosEmpresa
    Left = 336
    Top = 160
  end
  object ppLDadosEmpresa: TppDBPipeline
    DataSource = dsDadosEmpresa
    UserName = 'LDadosEmpresa'
    Left = 280
    Top = 256
  end
  object spSaldo: TCMSqlParams
    SQL.Strings = (
      
        'SELECT UN.DESCRICAO, UN.CODPORTADOR, SUM(UN.SALDOANTERIOR) AS SA' +
        'LDOANTERIOR,'
      
        '       SUM(UN.RECTOPAGTO) AS RECEBTOPAGTO, SUM(UN.SALDOATU) AS S' +
        'ALDOATU'
      'FROM'
      '   ((SELECT C.DESCRICAO, C.CODPORTADOR,'
      
        '            SUM(DECODE(M.ENTRADASAIDA,'#39'S'#39',-M.VALORLANCFINAN,M.VA' +
        'LORLANCFINAN)) AS SALDOANTERIOR,'
      '            0 AS RECTOPAGTO,'
      
        '            SUM(DECODE(M.ENTRADASAIDA,'#39'S'#39',-M.VALORLANCFINAN,M.VA' +
        'LORLANCFINAN)) AS SALDOATU'
      '     FROM PORTADORCONTA C, MOVIMFINANC M'
      
        '     WHERE (M.DATALANCFINAN <= TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39')) A' +
        'ND'
      '           (M.STATUSCONCILIA IN ('#39'N'#39')) AND'
      '           (M.IDPESSOA = :IDEmpresa) AND'
      '       '
      '           ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL))'
      ''
      '     GROUP BY C.DESCRICAO, C.CODPORTADOR)'
      '     UNION'
      
        '    (SELECT DECODE(C.DESCRICAO,NULL,'#39'Sem conta selecionada'#39',C.DE' +
        'SCRICAO) AS DESCRICAO, C.CODPORTADOR,'
      '            0 AS SALDOANTERIOR,'
      '            SUM(S.SALDO) AS RECBTOPAGTO,'
      '            SUM(S.SALDO) AS SALDOATU'
      '     FROM'
      
        '          (SELECT CODDOCUMENTO, SUM(DECODE(DEBCRE,'#39'D'#39',VALOR,-VAL' +
        'OR)) AS SALDO'
      '           FROM LANCTODOCUM'
      '           GROUP BY CODDOCUMENTO) S,'
      '           DOCUMENTO D,'
      '           LANCTODOCUM L,'
      '           PORTADORFORMA P,'
      '           PORTADORCONTA C,'
      '           PARAMFINANC PF'
      '     WHERE ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND'
      
        '           ((D.OPERACAO = '#39'1 '#39') OR (D.OPERACAO = '#39'2 '#39') OR (D.OPE' +
        'RACAO = '#39'3 '#39') OR (D.OPERACAO = '#39'14'#39')) AND'
      '           (D.IDPESSOA = :IDEmpresa) AND'
      
        '           (((PF.FLGCONFIRMARECPAG = '#39'S'#39') AND (D.FLGCONFIRMARECP' +
        'AG = '#39'S'#39')) OR'
      
        '           (((PF.FLGCONFIRMARECPAG = '#39'N'#39') OR (PF.FLGCONFIRMARECP' +
        'AG IS NULL)) AND'
      
        '           ((D.DATAPROGRAMADA = TO_DATE(:DataRef,'#39'DD/MM/YYYY'#39')))' +
        ')) AND'
      '           (D.CODDOCUMENTO = S.CODDOCUMENTO) AND'
      '           (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '           (D.OPERACAO = L.OPERACAO) AND'
      '           (L.ESTORNO IS NULL) AND'
      '           (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND'
      '           (P.CODPORTADOR = C.CODPORTADOR(+)) AND'
      '           (D.IDPESSOA = PF.IDPESSOA) AND'
      '           ((C.FLGSTATUS = '#39'A'#39') OR (C.FLGSTATUS IS NULL))'
      '     GROUP BY C.DESCRICAO, C.CODPORTADOR)) UN'
      'GROUP BY  UN.DESCRICAO, UN.CODPORTADOR'
      'ORDER BY  UN.DESCRICAO'
      ''
      ' '
      ' ')
    ClientDataSet = cdsSaldo
    Left = 24
    Top = 64
  end
end
