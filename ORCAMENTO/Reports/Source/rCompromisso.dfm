inherited rptCompromisso: TrptCompromisso
  Left = 514
  Top = 232
  Width = 191
  Height = 155
  Caption = 'rptCompromisso'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'No. Reserva'
        Controle = tcEdit
        TipodeDado = tdInteger
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
        Caption = 'Valor'
        Controle = tcEdit
        TipodeDado = tdReal
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpCompromisso
    LabelEmpresa = ppLabel180
    LabelSistema = ppLabel193
  end
  object cdsCompromissoImp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 48
    Top = 52
  end
  object dsCompromisso: TwwDataSource
    DataSet = cdsCompromissoImp
    Left = 80
    Top = 52
  end
  object pplCompromisso: TppBDEPipeline
    DataSource = dsCompromisso
    UserName = 'lCompromisso'
    Left = 112
    Top = 52
    object pplCompromissoppField1: TppField
      FieldAlias = 'IDCONTAORCAMEN'
      FieldName = 'IDCONTAORCAMEN'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplCompromissoppField2: TppField
      FieldAlias = 'NOMECONTAORCAMEN'
      FieldName = 'NOMECONTAORCAMEN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplCompromissoppField3: TppField
      FieldAlias = 'OBSRESERVA'
      FieldName = 'OBSRESERVA'
      FieldLength = 255
      DisplayWidth = 255
      Position = 2
    end
    object pplCompromissoppField4: TppField
      FieldAlias = 'DATAREFERENCIA'
      FieldName = 'DATAREFERENCIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplCompromissoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMRESERVA'
      FieldName = 'NUMRESERVA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplCompromissoppField6: TppField
      FieldAlias = 'FLGRESERVA'
      FieldName = 'FLGRESERVA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object pplCompromissoppField7: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object pplCompromissoppField8: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 7
    end
    object pplCompromissoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRESERVA'
      FieldName = 'VLRRESERVA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplCompromissoppField10: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 13
      DisplayWidth = 13
      Position = 9
    end
  end
  object rpCompromisso: TppReport
    AutoStop = False
    DataPipeline = pplCompromisso
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
    Left = 144
    Top = 52
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCompromisso'
    object ppHeaderBand20: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppLabel179: TppLabel
        UserName = 'ppLabel179'
        Caption = 'Compromisso Orçamentário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 70908
        mmTop = 8731
        mmWidth = 56356
        BandType = 0
      end
      object ppLine45: TppLine
        UserName = 'ppLine45'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15346
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel180: TppLabel
        UserName = 'ppLabel180'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84138
        mmTop = 1588
        mmWidth = 27781
        BandType = 0
      end
    end
    object ppDetailBand19: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 211667
      mmPrintPosition = 0
      object rptCompromissoShape1: TppShape
        UserName = 'rptCompromissoShape1'
        mmHeight = 139436
        mmLeft = 3704
        mmTop = 39158
        mmWidth = 186267
        BandType = 4
      end
      object rptCompromissoLabel3: TppLabel
        UserName = 'rptCompromissoLabel3'
        Caption = 'Centro de Responsabilidade : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 12700
        mmWidth = 50271
        BandType = 4
      end
      object rptCompromissoDBText3: TppDBText
        UserName = 'rptCompromissoDBText3'
        DataField = 'CODCENTRORESPON'
        DataPipeline = pplCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCompromisso'
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 12700
        mmWidth = 22490
        BandType = 4
      end
      object rptCompromissoLabel4: TppLabel
        UserName = 'rptCompromissoLabel4'
        Caption = 'Conta Orçamentária : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 18256
        mmTop = 18521
        mmWidth = 36777
        BandType = 4
      end
      object rptCompromissoDBText5: TppDBText
        UserName = 'rptCompromissoDBText5'
        DataField = 'NOME'
        DataPipeline = pplCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCompromisso'
        mmHeight = 4233
        mmLeft = 80169
        mmTop = 12700
        mmWidth = 95515
        BandType = 4
      end
      object rptCompromissoDBText4: TppDBText
        UserName = 'rptCompromissoDBText4'
        DataField = 'IDCONTAORCAMEN'
        DataPipeline = pplCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCompromisso'
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 18521
        mmWidth = 22490
        BandType = 4
      end
      object rptCompromissoDBText6: TppDBText
        UserName = 'rptCompromissoDBText6'
        DataField = 'NOMECONTAORCAMEN'
        DataPipeline = pplCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCompromisso'
        mmHeight = 4233
        mmLeft = 80169
        mmTop = 18521
        mmWidth = 95515
        BandType = 4
      end
      object rptCompromissoLabel5: TppLabel
        UserName = 'rptCompromissoLabel5'
        Caption = 'Observações do Compromisso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 3704
        mmTop = 33867
        mmWidth = 51329
        BandType = 4
      end
      object rptCompromissoLabel6: TppLabel
        UserName = 'rptCompromissoLabel6'
        Caption = 'Status do Compromisso : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 24871
        mmWidth = 50800
        BandType = 4
      end
      object rptCompromissoDBText7: TppDBText
        UserName = 'rptCompromissoDBText7'
        DataField = 'STATUS'
        DataPipeline = pplCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCompromisso'
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 24871
        mmWidth = 95515
        BandType = 4
      end
      object rptCompromissoDBText1: TppDBText
        UserName = 'rptCompromissoDBText1'
        DataField = 'DATAREFERENCIA'
        DataPipeline = pplCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCompromisso'
        mmHeight = 5821
        mmLeft = 21431
        mmTop = 1852
        mmWidth = 32015
        BandType = 4
      end
      object rptCompromissoLabel1: TppLabel
        UserName = 'rptCompromissoLabel1'
        Caption = 'Data : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 4498
        mmTop = 1852
        mmWidth = 14817
        BandType = 4
      end
      object rptCompromissoLabel2: TppLabel
        UserName = 'rptCompromissoLabel2'
        Caption = 'Nº Compromisso : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 109802
        mmTop = 1852
        mmWidth = 42863
        BandType = 4
      end
      object rptCompromissoDBText2: TppDBText
        UserName = 'rptCompromissoDBText2'
        DataField = 'NUMRESERVA'
        DataPipeline = pplCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCompromisso'
        mmHeight = 5821
        mmLeft = 157427
        mmTop = 1852
        mmWidth = 32015
        BandType = 4
      end
      object rptCompromissoLabel7: TppLabel
        UserName = 'rptCompromissoLabel7'
        Caption = 'Valor : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 76465
        mmTop = 189707
        mmWidth = 14288
        BandType = 4
      end
      object rptCompromissoDBText8: TppDBText
        UserName = 'rptCompromissoDBText8'
        DataField = 'VLRRESERVA'
        DataPipeline = pplCompromisso
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCompromisso'
        mmHeight = 4763
        mmLeft = 92604
        mmTop = 190236
        mmWidth = 33073
        BandType = 4
      end
      object rptCompromissoLine1: TppLine
        UserName = 'rptCompromissoLine1'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 9790
        mmWidth = 197300
        BandType = 4
      end
      object rptCompromissoLine2: TppLine
        UserName = 'rptCompromissoLine2'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 3440
        mmTop = 204259
        mmWidth = 59267
        BandType = 4
      end
      object rptCompromissoLabel8: TppLabel
        UserName = 'rptCompromissoLabel8'
        Caption = 'Gestor 1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Book Antiqua'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4763
        mmLeft = 3440
        mmTop = 205052
        mmWidth = 12700
        BandType = 4
      end
      object rptCompromissoLabel9: TppLabel
        UserName = 'rptCompromissoLabel9'
        AutoSize = False
        Caption = 'Saldo Atual : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5292
        mmLeft = 126736
        mmTop = 189971
        mmWidth = 28046
        BandType = 4
      end
      object txtSaldoCompromisso: TppLabel
        UserName = 'txtSaldoCompromisso'
        AutoSize = False
        Caption = 'txtSaldoCompromisso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 155575
        mmTop = 190236
        mmWidth = 33073
        BandType = 4
      end
      object rptCompromissoDBMemo1: TppDBMemo
        UserName = 'rptCompromissoDBMemo1'
        CharWrap = True
        DataField = 'OBSRESERVA'
        DataPipeline = pplCompromisso
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCompromisso'
        mmHeight = 136261
        mmLeft = 4763
        mmTop = 40217
        mmWidth = 183357
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel245: TppLabel
        UserName = 'Label245'
        AutoSize = False
        Caption = 'Saldo Anterior: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 3704
        mmTop = 189971
        mmWidth = 31485
        BandType = 4
      end
      object txtSaldoAntCompromisso: TppLabel
        UserName = 'txtSaldoAntCompromisso'
        AutoSize = False
        Caption = 'txtSaldoAntCompromisso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 36248
        mmTop = 189971
        mmWidth = 33073
        BandType = 4
      end
      object ppLabel164: TppLabel
        UserName = 'Label164'
        Caption = 'Gestor 2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Book Antiqua'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4763
        mmLeft = 65088
        mmTop = 205052
        mmWidth = 12700
        BandType = 4
      end
      object ppLine75: TppLine
        UserName = 'Line75'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 127794
        mmTop = 204259
        mmWidth = 59267
        BandType = 4
      end
      object ppLine74: TppLine
        UserName = 'Line74'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 65088
        mmTop = 204259
        mmWidth = 59267
        BandType = 4
      end
      object ppLabel252: TppLabel
        UserName = 'Label252'
        Caption = 'Gestor 3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Book Antiqua'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4763
        mmLeft = 127794
        mmTop = 205052
        mmWidth = 12700
        BandType = 4
      end
      object ppLabel253: TppLabel
        UserName = 'Label253'
        AutoSize = False
        Caption = 'Valor Orçado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 126736
        mmTop = 179388
        mmWidth = 28046
        BandType = 4
      end
      object txtValorOrcado: TppLabel
        UserName = 'txtValorOrcado'
        AutoSize = False
        Caption = 'txtValorOrcado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 155575
        mmTop = 179652
        mmWidth = 33073
        BandType = 4
      end
    end
    object ppFooterBand20: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine47: TppLine
        UserName = 'ppLine47'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel193: TppLabel
        UserName = 'ppLabel193'
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
        mmTop = 1588
        mmWidth = 79375
        BandType = 8
      end
      object ppCalc40: TppSystemVariable
        UserName = 'ppCalc401'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 1588
        mmWidth = 36777
        BandType = 8
      end
      object ppCalc41: TppSystemVariable
        UserName = 'Calc41'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object sqlCompromissoImp: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   R.IDCONTAORCAMEN, C.NOMECONTAORCAMEN, R.OBSRESERVA,'
      '   R.DATAREFERENCIA, R.NUMRESERVA, R.FLGRESERVA,'
      '   R.IDPLANOORCAMEN,'
      '   CR.CODCENTRORESPON, CR.NOME, R.VLRRESERVA,'
      '   DECODE(R.FLGRESERVA,'#39'A'#39','#39'Aguardando...'#39','
      '   DECODE(R.FLGRESERVA,'#39'E'#39','#39'Efetivada'#39','
      '   DECODE(R.FLGRESERVA,'#39'C'#39','#39'Cancelada'#39','
      '   DECODE(R.FLGRESERVA,'#39'U'#39','#39'Em Uso'#39','#39' '#39')))) AS STATUS'
      'FROM'
      '   RESERVAORCAMEN R, CENTRESPON CR, CONTASORCAMEN C'
      'WHERE'
      '   (R.FLGRESCOMP = '#39'C'#39') AND'
      '   (R.IDCONTAORCAMEN) = (C.IDCONTAORCAMEN) AND'
      '   (R.IDPLANOORCAMEN) = (C.IDPLANOORCAMEN) AND'
      '   (C.CODCENTRORESPON) = (CR.CODCENTRORESPON(+)) AND'
      '   (C.IDPESSOA) = (CR.IDPESSOA(+))  AND'
      '   (R.NUMRESERVA =:NUMRESERVA) AND'
      '   (R.IDPESSOA =:IDPESSOA)'
      ' ')
    ClientDataSet = cdsCompromissoImp
    Left = 16
    Top = 52
  end
  object sqlValorOrcado: TCMSqlParams
    SQL.Strings = (
      'SELECT SUM(VLRORCADO) AS VLRORCADO'
      'FROM SALDOORCADO'
      'WHERE (IDCONTAORCAMEN = :IDCONTAORCAMEN)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND (IDPLANOORCAMEN = :IDPLANOORCAMEN)'
      '  AND (TO_CHAR(DATAREFERENCIA,'#39'YYYYMM'#39') = :ANOMESREF)'
      ' ')
    ClientDataSet = cdsValorOrcado
    Left = 16
    Top = 88
  end
  object cdsValorOrcado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 48
    Top = 88
  end
end
