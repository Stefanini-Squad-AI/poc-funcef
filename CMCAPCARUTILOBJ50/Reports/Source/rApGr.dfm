inherited RptApGr: TRptApGr
  Left = 505
  Top = 114
  Width = 406
  Height = 447
  Caption = 'RptApGr'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'numapgr'
        Controle = tcEdit
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
        Caption = 'CkbDocCancel'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
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
        Caption = 'chkLancProvContabil'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
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
    Left = 156
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptApGr
    LabelEmpresa = ppLabel122
    LabelSistema = ppLabel126
  end
  object PpApGr: TppBDEPipeline
    DataSource = DsApGr
    CloseDataSource = True
    UserName = 'PpApGr'
    Left = 233
    Top = 73
    object PpApGrppField1: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpApGrppField2: TppField
      FieldAlias = 'NOMEBANCO'
      FieldName = 'NOMEBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpApGrppField3: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpApGrppField4: TppField
      FieldAlias = 'NOCONTACORR'
      FieldName = 'NOCONTACORR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpApGrppField5: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpApGrppField6: TppField
      FieldAlias = 'TIPODOC'
      FieldName = 'TIPODOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpApGrppField7: TppField
      FieldAlias = 'FORCLI'
      FieldName = 'FORCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpApGrppField8: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpApGrppField9: TppField
      FieldAlias = 'NUMDOC'
      FieldName = 'NUMDOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpApGrppField10: TppField
      FieldAlias = 'CONTACONTABIL'
      FieldName = 'CONTACONTABIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpApGrppField11: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpApGrppField12: TppField
      FieldAlias = 'DEBCRE'
      FieldName = 'DEBCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpApGrppField13: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpApGrppField14: TppField
      FieldAlias = 'VALORDOC'
      FieldName = 'VALORDOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpApGrppField15: TppField
      FieldAlias = 'DATADOC'
      FieldName = 'DATADOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpApGrppField16: TppField
      FieldAlias = 'DESCNUMAPGR'
      FieldName = 'DESCNUMAPGR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PpApGrppField17: TppField
      FieldAlias = 'DESCESTORNO'
      FieldName = 'DESCESTORNO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PpApGrppField18: TppField
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PpApGrppField19: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PpApGrppField20: TppField
      FieldAlias = 'OBS'
      FieldName = 'OBS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object PpApGrppField21: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object PpApGrppField22: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
  end
  object DsApGr: TwwDataSource
    DataSet = CdsAp
    Left = 201
    Top = 73
  end
  object RptApGr: TppReport
    AutoStop = False
    DataPipeline = PpApGr
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RptSlip'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
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
    Left = 305
    Top = 65
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'PpApGr'
    object ppHeaderBand27: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppLabel122: TppLabel
        UserName = 'ppLabel122'
        Caption = 'CM Soluções Informática'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 65617
        mmTop = 1058
        mmWidth = 58473
        BandType = 0
      end
      object LblApGr: TppLabel
        UserName = 'LblApGr'
        Caption = 'Autorização de Pagamentos - AP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 55033
        mmTop = 7144
        mmWidth = 79904
        BandType = 0
      end
      object ppLine55: TppLine
        UserName = 'ppLine55'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 18256
        mmWidth = 190000
        BandType = 0
      end
      object RptApGrDBText8: TppDBText
        UserName = 'RptApGrDBText8'
        AutoSize = True
        DataField = 'DESCNUMAPGR'
        DataPipeline = PpApGr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PpApGr'
        mmHeight = 3969
        mmLeft = 81227
        mmTop = 13229
        mmWidth = 27781
        BandType = 0
      end
    end
    object ppDetailBand28: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText45: TppDBText
        UserName = 'ppDBText45'
        AutoSize = True
        DataField = 'CONTACONTABIL'
        DataPipeline = PpApGr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpApGr'
        mmHeight = 3175
        mmLeft = 6350
        mmTop = 0
        mmWidth = 24077
        BandType = 4
      end
      object ppDBText49: TppDBText
        UserName = 'ppDBText49'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpApGr
        DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpApGr'
        mmHeight = 3175
        mmLeft = 175419
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object ppDBText53: TppDBText
        UserName = 'ppDBText53'
        AutoSize = True
        DataField = 'DEBCRE'
        DataPipeline = PpApGr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpApGr'
        mmHeight = 3175
        mmLeft = 178065
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object RptApGrDBMemo1: TppDBMemo
        UserName = 'RptApGrDBMemo1'
        CharWrap = True
        DataField = 'HISTORICO'
        DataPipeline = PpApGr
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'PpApGr'
        mmHeight = 3704
        mmLeft = 40746
        mmTop = 0
        mmWidth = 98425
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand27: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 32015
      mmPrintPosition = 0
      object RptApGrShape3: TppShape
        UserName = 'RptApGrShape3'
        mmHeight = 13229
        mmLeft = 76994
        mmTop = 5556
        mmWidth = 36513
        BandType = 8
      end
      object ppLine56: TppLine
        UserName = 'ppLine56'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 190000
        BandType = 8
      end
      object ppLabel126: TppLabel
        UserName = 'ppLabel126'
        Caption = 'Contas a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 21431
        mmWidth = 20108
        BandType = 8
      end
      object RptApGrShape1: TppShape
        UserName = 'RptApGrShape1'
        mmHeight = 13229
        mmLeft = 1323
        mmTop = 5556
        mmWidth = 36513
        BandType = 8
      end
      object RptApGrShape2: TppShape
        UserName = 'RptApGrShape2'
        mmHeight = 13229
        mmLeft = 39158
        mmTop = 5556
        mmWidth = 36513
        BandType = 8
      end
      object RptApGrLabel1: TppLabel
        UserName = 'RptApGrLabel1'
        Caption = 'Vistos:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 1588
        mmWidth = 10319
        BandType = 8
      end
      object Lblag1: TppLabel
        UserName = 'Lblag1'
        AutoSize = False
        Caption = 'Lblag1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 6350
        mmWidth = 35454
        BandType = 8
      end
      object Lblag2: TppLabel
        UserName = 'Lblag2'
        AutoSize = False
        Caption = 'Lblag2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 39688
        mmTop = 6085
        mmWidth = 35454
        BandType = 8
      end
      object Lblag3: TppLabel
        UserName = 'Lblag3'
        AutoSize = False
        Caption = 'Lblag3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 77523
        mmTop = 6085
        mmWidth = 35454
        BandType = 8
      end
      object RptApGrShape4: TppShape
        UserName = 'RptApGrShape4'
        mmHeight = 13229
        mmLeft = 114565
        mmTop = 5556
        mmWidth = 36513
        BandType = 8
      end
      object Lblag4: TppLabel
        UserName = 'Lblag4'
        AutoSize = False
        Caption = 'Lblag4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 115094
        mmTop = 6085
        mmWidth = 35454
        BandType = 8
      end
      object RptApGrShape5: TppShape
        UserName = 'RptApGrShape5'
        mmHeight = 13229
        mmLeft = 152136
        mmTop = 5556
        mmWidth = 36513
        BandType = 8
      end
      object Lblag5: TppLabel
        UserName = 'Lblag5'
        AutoSize = False
        Caption = 'Lblag5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 152665
        mmTop = 6085
        mmWidth = 35454
        BandType = 8
      end
      object ppCalc48: TppSystemVariable
        UserName = 'Calc48'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 83079
        mmTop = 21431
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc49: TppSystemVariable
        UserName = 'Calc49'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 163777
        mmTop = 21431
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptApGrSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object RptApGrLine3: TppLine
        UserName = 'RptApGrLine3'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 190000
        BandType = 7
      end
      object RptApGrLabel7: TppLabel
        UserName = 'RptApGrLabel7'
        Caption = 'Valor total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 128059
        mmTop = 2381
        mmWidth = 15610
        BandType = 7
      end
      object RptApGrDBText11: TppDBText
        UserName = 'RptApGrDBText11'
        DataField = 'VALOR'
        DataPipeline = PpTotApGr
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpTotApGr'
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 2381
        mmWidth = 43656
        BandType = 7
      end
    end
    object ppGroup9: TppGroup
      BreakName = 'NUMBANCO'
      DataPipeline = PpApGr
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group9'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpApGr'
      object ppGroupHeaderBand9: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object ppLabel140: TppLabel
          UserName = 'ppLabel140'
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 529
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppDBText63: TppDBText
          UserName = 'ppDBText63'
          AutoSize = True
          DataField = 'NUMBANCO'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 10319
          mmTop = 529
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppDBText62: TppDBText
          UserName = 'ppDBText62'
          AutoSize = True
          DataField = 'NOMEBANCO'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 29104
          mmTop = 529
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object lblMostraProv: TppLabel
          UserName = 'lblMostraProv'
          Caption = 'Com Provisionamento Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 98161
          mmTop = 529
          mmWidth = 48419
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand9: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 1058
        mmPrintPosition = 0
        object ppLine60: TppLine
          UserName = 'ppLine60'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 265
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object RptApGroup1: TppGroup
      BreakName = 'NOCONTACORR'
      DataPipeline = PpApGr
      OutlineSettings.CreateNode = True
      UserName = 'RptApGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpApGr'
      object RptApGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object RptApGrLabel2: TppLabel
          UserName = 'RptApGrLabel2'
          Caption = 'Agência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 1058
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object RptApGrDBText1: TppDBText
          UserName = 'RptApGrDBText1'
          AutoSize = True
          DataField = 'NUMAGENCIA'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 12435
          mmTop = 1058
          mmWidth = 21431
          BandType = 3
          GroupNo = 1
        end
        object RptApGrDBText2: TppDBText
          UserName = 'RptApGrDBText2'
          AutoSize = True
          DataField = 'NOCONTACORR'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 68263
          mmTop = 1058
          mmWidth = 25135
          BandType = 3
          GroupNo = 1
        end
        object RptApGrLine1: TppLine
          UserName = 'RptApGrLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 0
          mmWidth = 190000
          BandType = 3
          GroupNo = 1
        end
        object RptApGrLabel3: TppLabel
          UserName = 'RptApGrLabel3'
          Caption = 'Conta Corrente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 44450
          mmTop = 1058
          mmWidth = 22754
          BandType = 3
          GroupNo = 1
        end
      end
      object RptApGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptApGrGroup1: TppGroup
      BreakName = 'NUMCHQBORDERO'
      DataPipeline = PpApGr
      OutlineSettings.CreateNode = True
      UserName = 'RptApGrGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpApGr'
      object RptApGrGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object RptApLine1: TppLine
          UserName = 'RptApLine1'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 190000
          BandType = 3
          GroupNo = 2
        end
        object LblNumChq: TppLabel
          UserName = 'LblNumChq'
          Caption = 'Chq\Bord:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1852
          mmWidth = 14288
          BandType = 3
          GroupNo = 2
        end
        object DbNumChq: TppDBText
          UserName = 'DbNumChq'
          DataField = 'NUMCHQBORDERO'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 15081
          mmTop = 1852
          mmWidth = 19844
          BandType = 3
          GroupNo = 2
        end
        object RptApGrLabel6: TppLabel
          UserName = 'RptApGrLabel6'
          Caption = 'Total do Chq\Borderô:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 57150
          mmTop = 1852
          mmWidth = 31750
          BandType = 3
          GroupNo = 2
        end
        object RptApGrDBText10: TppDBText
          OnPrint = RptApGrDBText10Print
          UserName = 'RptApGrDBText10'
          DataField = 'CALBORDERO'
          DataPipeline = bordero
          DisplayFormat = '#,##0.00;-#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'bordero'
          mmHeight = 3704
          mmLeft = 89959
          mmTop = 1852
          mmWidth = 43656
          BandType = 3
          GroupNo = 2
        end
      end
      object RptApGrGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object RptApGrGroup2: TppGroup
      BreakName = 'CODDOCUMENTO'
      DataPipeline = PpApGr
      OutlineSettings.CreateNode = True
      UserName = 'RptApGrGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpApGr'
      object RptApGrGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17463
        mmPrintPosition = 0
        object ppDBText54: TppDBText
          UserName = 'ppDBText54'
          DataField = 'FORCLI'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 70644
          mmTop = 5556
          mmWidth = 65088
          BandType = 3
          GroupNo = 3
        end
        object ppDBText55: TppDBText
          UserName = 'ppDBText55'
          DataField = 'NUMDOC'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 136790
          mmTop = 5556
          mmWidth = 28575
          BandType = 3
          GroupNo = 3
        end
        object ppDBText56: TppDBText
          UserName = 'ppDBText56'
          DataField = 'DATADOC'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 5556
          mmWidth = 15346
          BandType = 3
          GroupNo = 3
        end
        object ppLabel131: TppLabel
          UserName = 'ppLabel131'
          Caption = 'Conta Contábil:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 5821
          mmTop = 12700
          mmWidth = 21167
          BandType = 3
          GroupNo = 3
        end
        object ppLabel132: TppLabel
          UserName = 'ppLabel132'
          ShiftWithParent = True
          Caption = 'Histórico:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 40746
          mmTop = 12700
          mmWidth = 13229
          BandType = 3
          GroupNo = 3
        end
        object ppDBText60: TppDBText
          UserName = 'ppDBText60'
          DataField = 'TIPODOC'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 31221
          mmTop = 5556
          mmWidth = 38894
          BandType = 3
          GroupNo = 3
        end
        object ppLabel133: TppLabel
          UserName = 'ppLabel133'
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 70644
          mmTop = 1323
          mmWidth = 9260
          BandType = 3
          GroupNo = 3
        end
        object ppLabel134: TppLabel
          UserName = 'ppLabel134'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 136790
          mmTop = 1323
          mmWidth = 16669
          BandType = 3
          GroupNo = 3
        end
        object ppLabel135: TppLabel
          UserName = 'ppLabel135'
          AutoSize = False
          Caption = 'Lancto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 1323
          mmWidth = 15346
          BandType = 3
          GroupNo = 3
        end
        object ppLabel138: TppLabel
          UserName = 'ppLabel138'
          Caption = 'Tipo de Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 31221
          mmTop = 1323
          mmWidth = 28310
          BandType = 3
          GroupNo = 3
        end
        object ppLabel129: TppLabel
          UserName = 'ppLabel129'
          Caption = 'DC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 185473
          mmTop = 12435
          mmWidth = 3969
          BandType = 3
          GroupNo = 3
        end
        object ppLabel130: TppLabel
          UserName = 'ppLabel130'
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 175948
          mmTop = 12435
          mmWidth = 8467
          BandType = 3
          GroupNo = 3
        end
        object RptApGrLabel4: TppLabel
          UserName = 'RptApGrLabel4'
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 181505
          mmTop = 1852
          mmWidth = 8467
          BandType = 3
          GroupNo = 3
        end
        object RptApGrDBText3: TppDBText
          UserName = 'RptApGrDBText3'
          AutoSize = True
          DataField = 'VALORDOC'
          DataPipeline = PpApGr
          DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3175
          mmLeft = 174096
          mmTop = 5556
          mmWidth = 15875
          BandType = 3
          GroupNo = 3
        end
        object RptApGrDBText9: TppDBText
          UserName = 'RptApGrDBText9'
          DataField = 'DATALANCTO'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 15610
          mmTop = 5556
          mmWidth = 15346
          BandType = 3
          GroupNo = 3
        end
        object RptApGrLabel5: TppLabel
          UserName = 'RptApGrLabel5'
          AutoSize = False
          Caption = 'Baixa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 3704
          mmLeft = 15610
          mmTop = 1323
          mmWidth = 15346
          BandType = 3
          GroupNo = 3
        end
        object LblDbEstorno: TppDBText
          UserName = 'LblDbEstorno'
          AutoSize = True
          DataField = 'DESCESTORNO'
          DataPipeline = PpApGr
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsUnderline]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PpApGr'
          mmHeight = 3704
          mmLeft = 83079
          mmTop = 9525
          mmWidth = 24342
          BandType = 3
          GroupNo = 3
        end
        object RptApGrLine2: TppLine
          UserName = 'RptApGrLine2'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 190000
          BandType = 3
          GroupNo = 3
        end
      end
      object RptApGrGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 2117
        mmPrintPosition = 0
        object RptContab3: TppSubReport
          UserName = 'RptContab3'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'PpContab3'
          mmHeight = 794
          mmLeft = 0
          mmTop = 0
          mmWidth = 190000
          BandType = 5
          GroupNo = 3
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object RptApGrChildReport2: TppChildReport
            AutoStop = False
            DataPipeline = PpContab3
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RptSlip'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 15000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'PpContab3'
            object RptApGrDetailBand1: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object RptApGrDBText4: TppDBText
                UserName = 'RptApGrDBText4'
                AutoSize = True
                DataField = 'PLACONTA'
                DataPipeline = PpContab3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'PpContab3'
                mmHeight = 3175
                mmLeft = 6350
                mmTop = 1058
                mmWidth = 15346
                BandType = 4
              end
              object RptApGrDBText6: TppDBText
                UserName = 'RptApGrDBText6'
                AutoSize = True
                DataField = 'LACDEBCRE'
                DataPipeline = PpContab3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'PpContab3'
                mmHeight = 3175
                mmLeft = 172773
                mmTop = 1058
                mmWidth = 17198
                BandType = 4
              end
              object RptApGrDBText7: TppDBText
                UserName = 'RptApGrDBText7'
                AutoSize = True
                DataField = 'VALOR'
                DataPipeline = PpContab3
                DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'PpContab3'
                mmHeight = 3175
                mmLeft = 175948
                mmTop = 1058
                mmWidth = 8996
                BandType = 4
              end
              object RptApGrChildReport2DBMemo1: TppDBMemo
                UserName = 'RptApGrChildReport2DBMemo1'
                CharWrap = True
                DataField = 'HISTLANCAMENTOCONTABIL'
                DataPipeline = PpContab3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Stretch = True
                Transparent = True
                DataPipelineName = 'PpContab3'
                mmHeight = 3704
                mmLeft = 40746
                mmTop = 1058
                mmWidth = 98425
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
          end
        end
        object RptContabLanc: TppSubReport
          UserName = 'RptContabLanc'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'PpContabLanc'
          mmHeight = 794
          mmLeft = 0
          mmTop = 1323
          mmWidth = 190000
          BandType = 5
          GroupNo = 3
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object RptApGrChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = PpContabLanc
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'RptSlip'
            PrinterSetup.PaperName = 'A4'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 15000
            PrinterSetup.mmMarginLeft = 10000
            PrinterSetup.mmMarginRight = 10000
            PrinterSetup.mmMarginTop = 10000
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Units = utMillimeters
            Version = '7.04'
            mmColumnWidth = 0
            DataPipelineName = 'PpContabLanc'
            object RptApGrChildReport1DetailBand1: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 3704
              mmPrintPosition = 0
              object RptApGrChildReport1DBText1: TppDBText
                UserName = 'RptApGrChildReport1DBText1'
                AutoSize = True
                DataField = 'PLACONTA'
                DataPipeline = PpContabLanc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                DataPipelineName = 'PpContabLanc'
                mmHeight = 3175
                mmLeft = 6350
                mmTop = 0
                mmWidth = 15346
                BandType = 4
              end
              object RptApGrChildReport1DBText3: TppDBText
                UserName = 'RptApGrChildReport1DBText3'
                AutoSize = True
                DataField = 'LACDEBCRE'
                DataPipeline = PpContabLanc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'PpContabLanc'
                mmHeight = 3175
                mmLeft = 172773
                mmTop = 0
                mmWidth = 17198
                BandType = 4
              end
              object RptApGrChildReport1DBText4: TppDBText
                UserName = 'RptApGrChildReport1DBText4'
                AutoSize = True
                DataField = 'LACVALOR'
                DataPipeline = PpContabLanc
                DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'PpContabLanc'
                mmHeight = 3175
                mmLeft = 169863
                mmTop = 0
                mmWidth = 15081
                BandType = 4
              end
              object RptApGrChildReport1DBMemo1: TppDBMemo
                UserName = 'RptApGrChildReport1DBMemo1'
                CharWrap = True
                DataField = 'HISTLANCAMENTOCONTABIL'
                DataPipeline = PpContabLanc
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Stretch = True
                Transparent = True
                DataPipelineName = 'PpContabLanc'
                mmHeight = 3704
                mmLeft = 41275
                mmTop = 0
                mmWidth = 98425
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
          end
        end
      end
    end
  end
  object DsContabLanc: TwwDataSource
    DataSet = CdsContabLanc
    Left = 329
    Top = 250
  end
  object PpContabLanc: TppBDEPipeline
    DataSource = DsContabLanc
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'PpContabLanc'
    Left = 265
    Top = 251
    object PpContabLancppField1: TppField
      FieldAlias = 'OPERACAO'
      FieldName = 'OPERACAO'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object PpContabLancppField2: TppField
      FieldAlias = 'LACDEBCRE'
      FieldName = 'LACDEBCRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 1
    end
    object PpContabLancppField3: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 18
      DisplayWidth = 18
      Position = 2
    end
    object PpContabLancppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'LACVALOR'
      FieldName = 'LACVALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object PpContabLancppField5: TppField
      FieldAlias = 'HISTLANCAMENTOCONTABIL'
      FieldName = 'HISTLANCAMENTOCONTABIL'
      FieldLength = 200
      DisplayWidth = 200
      Position = 4
    end
  end
  object DsContab3: TwwDataSource
    DataSet = CdsContab3
    Left = 337
    Top = 331
  end
  object PpContab3: TppBDEPipeline
    DataSource = DsContab3
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'PpContab3'
    Left = 265
    Top = 332
    object PpContab3ppField1: TppField
      FieldAlias = 'LACDEBCRE'
      FieldName = 'LACDEBCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpContab3ppField2: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpContab3ppField3: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpContab3ppField4: TppField
      FieldAlias = 'HISTLANCAMENTOCONTABIL'
      FieldName = 'HISTLANCAMENTOCONTABIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object SqlAp: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' ('#39'Nº '#39' || RTRIM(TO_CHAR(NUMAPGR))) AS DESCNUMAPGR,'
      '  NUMBANCO,'
      '  NOMEBANCO,'
      '  NUMAGENCIA,'
      '  NOCONTACORR,'
      '  DATALANCTO,'
      '  TIPODOC,'
      '  FORCLI,'
      '  CODDOCUMENTO,'
      '  NUMDOC,'
      '  NUMCHQBORDERO,'
      '  CONTACONTABIL,'
      '  HISTORICO,'
      '  DEBCRE,'
      '  VALOR,'
      '  VALORDOC,'
      '  DATADOC,'
      '  DESCESTORNO,'
      '  NUMAPGR,'
      '  PLACONTACCX,'
      '  UNIDCCX,'
      '  PLANOPREVCCX,'
      '  VALORCCX,'
      '  PATROCCX'
      'FROM'
      '('
      'SELECT'
      '     D.NUMAPGR,'
      '     B.NUMBANCO,'
      '     PB.RAZAOSOCIAL AS NOMEBANCO,'
      '     AG.NUMAGENCIA,'
      '     PC.NOCONTACORR,'
      '     L.DATALANCTO,'
      '     TD.DESCRICAO AS TIPODOC,'
      '     PD.RAZAOSOCIAL AS FORCLI,'
      '     D.CODDOCUMENTO,'
      '     (D.NODOCUMENTO || D.COMPLDOCUMENTO) AS NUMDOC,'
      '     R.NUMCHQBORDERO,'
      '     PC.PLACONTA AS CONTACONTABIL,'
      
        '     DECODE(D.PLACONTA,NULL,E.CONTACFORN,D.PLACONTA) AS CONTACON' +
        'TABIL,'
      
        '     ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUMENT' +
        'O) AS HISTORICO,'
      '     DECODE(L.DEBCRE,'#39'D'#39','#39'C'#39','#39'D'#39') AS DEBCRE,'
      '     L.VALOR,'
      '     LANC.VALOR AS VALORDOC,'
      '     LANC.DATALANCTO AS DATADOC,'
      
        '     DECODE(L.ESTORNO,NULL,'#39#39','#39'PAGAMENTO CANCELADO\ESTORNADO'#39') A' +
        'S DESCESTORNO,'
      '     '#39#39' AS PLACONTACCX,'
      '     '#39#39' AS UNIDCCX,'
      '     '#39#39' AS PLANOPREVCCX,'
      '     0  AS VALORCCX,'
      '     '#39#39' AS PATROCCX'
      'FROM'
      ' DOCUMENTO D,'
      ' LANCTODOCUM L,'
      ' EMPRESAFORN E,'
      ' RECBTOPAGTO R,'
      ' PORTADORFORMA P,'
      ' PORTADORCONTA PC,'
      ' PLANILHA PL,'
      ' AGENCIABANCARIA AG,'
      ' BANCO B,'
      ' PESSOA PB,'
      ' TIPODOCRECPAG TD,'
      ' PESSOA PD,'
      ' (SELECT'
      '     VALOR,CODDOCUMENTO, DATALANCTO'
      '  FROM'
      
        '     LANCTODOCUM WHERE RTRIM(OPERACAO) IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39','#39'10'#39 +
        ')) LANC'
      'WHERE'
      
        '((RTRIM(D.OPERACAO) = '#39'10'#39') OR (RTRIM(D.OPERACAO) = '#39'15'#39') OR (D.' +
        'STATUS = '#39'2'#39') OR ((D.STATUS = '#39'0'#39') AND (L.ESTORNO > 0))) AND'
      '(D.RECPAG = :PRECPAG)                AND'
      '(D.IDPESSOA = :PIDEMPRESA)           AND'
      '(D.NUMAPGR = :PNUMAPGR)              AND'
      '(D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND'
      '(D.IDFORCLI = PD.IDPESSOA)           AND'
      '(D.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '(R.NUMLANCTO = L.NUMLANCTO)          AND'
      '(R.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '(R.CODPORTFORMA = P.CODPORTFORMA)    AND'
      '(PC.IDBANCO = B.IDPESSOA)      AND'
      '(B.IDPESSOA = PB.IDPESSOA)           AND'
      '(D.IDFORCLI = E.IDFORCLI)            AND'
      '(D.IDPESSOA = E.IDPESSOA)            AND'
      '(P.CODPORTADOR = PC.CODPORTADOR)     AND'
      '(PL.PLNCODIGO(+) = L.PLNCODIGO)      AND'
      '(AG.IDPESSOA = PC.IDAGENCIA)         AND'
      '(TD.CODTIPDOC = D.CODTIPDOC)         '
      'UNION ALL'
      'SELECT'
      '    D.NUMAPGR,'
      '    B.NUMBANCO,'
      '    PB.RAZAOSOCIAL AS NOMEBANCO,'
      '    AG.NUMAGENCIA,'
      '    PC.NOCONTACORR,'
      '    L.DATALANCTO,'
      '    TD.DESCRICAO AS TIPODOC,'
      '    PD.RAZAOSOCIAL AS FORCLI,'
      '    D.CODDOCUMENTO,'
      '    (D.NODOCUMENTO || D.COMPLDOCUMENTO) AS NUMDOC,'
      '    R.NUMCHQBORDERO,'
      
        '    DECODE(D.PLACONTA,NULL,E.CONTACFORN,D.PLACONTA) AS CONTACONT' +
        'ABIL,'
      
        '    ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUMENTO' +
        ') AS HISTORICO,'
      '    L.DEBCRE,'
      '    L.VALOR,'
      '    LANC.VALOR AS VALORDOC,'
      '    LANC.DATALANCTO AS DATADOC,'
      
        '    DECODE(L.ESTORNO,NULL,'#39#39','#39'PAGAMENTO CANCELADO\ESTORNADO'#39') AS' +
        ' DESCESTORNO,'
      '    CCB.PLACONTA   AS PLACONTACCX,'
      '    U.NOME AS UNIDCCX,'
      '    PCB.NOME AS PLANOPREVCCX,'
      '    CCB.VALOR AS VALORCCX,'
      '    PTX.NOME AS PATROCCX'
      'FROM'
      ' DOCUMENTO D,'
      ' LANCTODOCUM L,'
      ' EMPRESAFORN E,'
      ' RECBTOPAGTO R,'
      ' PORTADORFORMA P,'
      ' PORTADORCONTA PC,'
      ' PLANILHA PL,'
      ' AGENCIABANCARIA AG,'
      ' BANCO B,'
      ' PESSOA PB,'
      ' TIPODOCRECPAG TD,'
      ' PESSOA PD,'
      ' CCBAIXASXDOCUM CCB,'
      ' PLANPREVCONTABIL PCB,'
      ' UNIDNEGOCIO U,'
      ' PESSOA PTX, '
      ' (SELECT'
      '     VALOR,CODDOCUMENTO, DATALANCTO'
      '  FROM'
      
        '     LANCTODOCUM WHERE RTRIM(OPERACAO) IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39','#39'10'#39 +
        ')) LANC'
      'WHERE'
      
        '((RTRIM(D.OPERACAO) = '#39'10'#39') OR (RTRIM(D.OPERACAO) = '#39'15'#39') OR (D.' +
        'STATUS = '#39'2'#39') OR ((D.STATUS = '#39'0'#39') AND (L.ESTORNO > 0))) AND'
      '(D.RECPAG = :PRECPAG)                AND'
      '(D.IDPESSOA = :PIDEMPRESA)           AND'
      '(D.NUMAPGR = :PNUMAPGR)              AND'
      '(D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND'
      '(D.IDFORCLI = PD.IDPESSOA)           AND'
      '(D.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '(R.NUMLANCTO = L.NUMLANCTO)          AND'
      '(R.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      '(R.CODPORTFORMA = P.CODPORTFORMA)    AND'
      '(PC.IDBANCO = B.IDPESSOA)            AND'
      '(B.IDPESSOA = PB.IDPESSOA)           AND'
      '(D.IDFORCLI = E.IDFORCLI)            AND'
      '(D.IDPESSOA = E.IDPESSOA)            AND'
      '(P.CODPORTADOR = PC.CODPORTADOR)     AND'
      '(PL.PLNCODIGO(+) = L.PLNCODIGO)      AND'
      '(AG.IDPESSOA = PC.IDAGENCIA)         AND'
      '(TD.CODTIPDOC = D.CODTIPDOC)         AND'
      '(D.CODDOCUMENTO  = CCB.CODDOCUMENTO(+)) AND'
      '(CCB.IDPLANOPREV = PCB.IDPLANOPREV(+)) AND'
      '(CCB.UNIDNEGOC   = U.UNIDNEGOC(+)) AND'
      '(CCB.IDPATRO = PTX.IDPESSOA(+))'
      ')'
      'ORDER BY'
      'NUMBANCO,'
      'NOCONTACORR,'
      'NUMCHQBORDERO,'
      'CODDOCUMENTO,'
      'DATALANCTO,'
      'DEBCRE'
      ''
      ' '
      ' ')
    ClientDataSet = CdsAp
    Left = 80
    Top = 64
  end
  object CdsAp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 64
  end
  object PpTotApGr: TppBDEPipeline
    DataSource = DsTotApGr
    SkipWhenNoRecords = False
    UserName = 'PpTotApGr'
    Left = 273
    Top = 176
    object PpTotApGrppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object PpTotApGrppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
  end
  object DsTotApGr: TwwDataSource
    DataSet = CdsTotApGr
    Left = 334
    Top = 175
  end
  object SqlGr: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    ('#39'Nº '#39' || RTRIM(TO_CHAR(NUMAPGR))) AS DESCNUMAPGR,'
      '    NUMBANCO,'
      '    NOMEBANCO,'
      '    NUMAGENCIA,'
      '    NOCONTACORR,'
      '    DATALANCTO,'
      '    TIPODOC,'
      '    FORCLI,'
      '    CODDOCUMENTO,'
      '    NUMDOC,'
      '    NUMCHQBORDERO,'
      '    CONTACONTABIL,'
      '    HISTORICO,'
      '    DEBCRE,'
      '    VALOR,'
      '    VALORDOC,'
      '    DATADOC,'
      '    DESCESTORNO,'
      '    NUMAPGR'
      'FROM'
      '('
      ' SELECT'
      '        D.NUMAPGR,'
      '        B.NUMBANCO,'
      '        PB.RAZAOSOCIAL AS NOMEBANCO,'
      '        AG.NUMAGENCIA,'
      '        PC.NOCONTACORR,'
      '        L.DATALANCTO,'
      '        TD.DESCRICAO AS TIPODOC,'
      '        PD.RAZAOSOCIAL AS FORCLI,'
      '        D.CODDOCUMENTO,'
      '        (D.NODOCUMENTO || D.COMPLDOCUMENTO) AS NUMDOC,'
      '        R.NUMCHQBORDERO,'
      '        PC.PLACONTA AS CONTACONTABIL,'
      
        '        ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUM' +
        'ENTO) AS HISTORICO,'
      '       DECODE(L.DEBCRE,'#39'D'#39','#39'C'#39','#39'D'#39') AS DEBCRE,'
      '       L.VALOR,'
      '       L.VALOR AS VALORDOC,'
      '       LANC.DATALANCTO AS DATADOC,'
      
        '       DECODE(L.ESTORNO,NULL,'#39#39','#39'PAGAMENTO CANCELADO\ESTORNADO'#39')' +
        ' AS DESCESTORNO'
      'FROM'
      '    DOCUMENTO D,'
      '    LANCTODOCUM L,'
      '    /* amf 12.06.2006 22581 EMPRESAFORN E, */'
      '    RECBTOPAGTO R,'
      '    PORTADORFORMA P,'
      '    PORTADORCONTA PC,'
      '    PLANILHA PL,'
      '    AGENCIABANCARIA AG,'
      '    BANCO B,'
      '    PESSOA PB,'
      '    TIPODOCRECPAG TD,'
      '    PESSOA PD,'
      '  (SELECT'
      '        VALOR,CODDOCUMENTO, DATALANCTO'
      '     FROM'
      '        LANCTODOCUM'
      '     WHERE RTRIM(OPERACAO) IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'10'#39','#39'15'#39')'
      '    ) LANC'
      ' WHERE'
      ' (D.RECPAG = :PRECPAG)                AND'
      ' (D.IDPESSOA = :PIDEMPRESA)           AND'
      ' (D.NUMAPGR = :PNUMAPGR)              AND'
      ' (D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND'
      ' (D.IDFORCLI = PD.IDPESSOA)           AND'
      ' (D.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      ' (R.NUMLANCTO = L.NUMLANCTO)          AND'
      ' (R.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      ' (R.CODPORTFORMA = P.CODPORTFORMA)    AND'
      ' (PC.IDBANCO = B.IDPESSOA)'#9'          AND'
      ' (B.IDPESSOA = PB.IDPESSOA)           AND'
      ' /*(D.IDFORCLI = E.IDFORCLI)          AND'
      ' (D.IDPESSOA = E.IDPESSOA)            AND  */'
      ' (P.CODPORTADOR = PC.CODPORTADOR)     AND'
      ' (PL.PLNCODIGO(+) = L.PLNCODIGO)      AND'
      ' (AG.IDPESSOA = PC.IDAGENCIA)         AND'
      ' (TD.CODTIPDOC = D.CODTIPDOC)'
      ''
      'UNION'
      ''
      'SELECT'
      '       D.NUMAPGR,'
      '       B.NUMBANCO,'
      '       PB.RAZAOSOCIAL AS NOMEBANCO,'
      '       AG.NUMAGENCIA,'
      '       PC.NOCONTACORR,'
      '       L.DATALANCTO,'
      '       TD.DESCRICAO AS TIPODOC,'
      '       PD.RAZAOSOCIAL AS FORCLI,'
      '       D.CODDOCUMENTO,'
      '       (D.NODOCUMENTO || D.COMPLDOCUMENTO) AS NUMDOC,'
      '       R.NUMCHQBORDERO,'
      
        '       DECODE(D.PLACONTA,NULL,BD.PLACONTA ,D.PLACONTA) AS CONTAC' +
        'ONTABIL,'
      
        '       ('#39'BAIXA DOC Nº '#39' || D.NODOCUMENTO || '#39' '#39' || D.COMPLDOCUME' +
        'NTO) AS HISTORICO,'
      '       L.DEBCRE,'
      '       L.VALOR,'
      '       DECODE(D.PLACONTA,NULL,BD.VALOR ,L.VALOR) AS VALOR,'
      '       LANC.DATALANCTO AS DATADOC,'
      
        '       DECODE(L.ESTORNO,NULL,'#39#39','#39'PAGAMENTO CANCELADO\ESTORNADO'#39')' +
        ' AS DESCESTORNO'
      'FROM'
      '    DOCUMENTO D,'
      '    LANCTODOCUM L,'
      ' /*   EMPRESACLIENTE E, */'
      '    RECBTOPAGTO R,'
      '    PORTADORFORMA P,'
      '    PORTADORCONTA PC,'
      '    PLANILHA PL,'
      '    AGENCIABANCARIA AG,'
      '    BANCO B,'
      '    PESSOA PB,'
      '    TIPODOCRECPAG TD,'
      '    PESSOA PD,'
      '    CCBAIXASXDOCUM BD,'
      '    (SELECT'
      '         VALOR,CODDOCUMENTO, DATALANCTO'
      '     FROM'
      
        '        LANCTODOCUM WHERE RTRIM(OPERACAO) IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'15'#39','#39 +
        '10'#39')) LANC'
      ' WHERE'
      ' (D.RECPAG = :PRECPAG)                AND'
      ' (D.IDPESSOA = :PIDEMPRESA)           AND'
      ' (D.NUMAPGR = :PNUMAPGR)              AND'
      ' (D.CODDOCUMENTO = LANC.CODDOCUMENTO) AND'
      ' (D.IDFORCLI = PD.IDPESSOA)           AND'
      ' (D.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      ' (R.NUMLANCTO = L.NUMLANCTO)          AND'
      ' (R.CODDOCUMENTO = L.CODDOCUMENTO)    AND'
      ' (R.CODPORTFORMA = P.CODPORTFORMA)    AND'
      ' (PC.IDBANCO = B.IDPESSOA)'#9'          AND'
      ' (B.IDPESSOA = PB.IDPESSOA)           AND'
      '/* (D.IDFORCLI = E.IDFORCLI)          AND'
      ' (D.IDPESSOA = E.IDPESSOA)            AND */'
      ' (P.CODPORTADOR = PC.CODPORTADOR)     AND'
      ' (PL.PLNCODIGO(+) = L.PLNCODIGO)      AND'
      ' (AG.IDPESSOA = PC.IDAGENCIA)         AND'
      ' (TD.CODTIPDOC = D.CODTIPDOC)         AND'
      ' /* amf 22.05.2006 p 22321 */'
      ' (D.CODDOCUMENTO = BD.CODDOCUMENTO(+))'
      ')'
      'ORDER BY'
      '  NUMBANCO,'
      '  NOCONTACORR,'
      '  NUMCHQBORDERO,'
      '  CODDOCUMENTO,'
      '  DATALANCTO,'
      '  DEBCRE'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ClientDataSet = CdsGr
    Left = 72
    Top = 120
  end
  object CdsGr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 120
  end
  object SqlTeste: TCMSqlParams
    SQL.Strings = (
      '')
    ClientDataSet = CdsTeste
    Left = 147
    Top = 309
  end
  object CdsTeste: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 312
  end
  object CdsTotApGr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      ' D.NUMAPGR,'
      
        '  SUM( decode(l.operacao,'#39'10'#39',DECODE(D.RECPAG,'#39'R'#39',DECODE(DEBCRE,' +
        #39'D'#39',L.VALOR,L.VALOR*-1),DECODE(DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1)),'
      
        '                                           DECODE(D.RECPAG,'#39'R'#39',D' +
        'ECODE(DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1),DECODE(DEBCRE,'#39'D'#39',L.VALOR,L' +
        '.VALOR*-1)) ) ) AS VALOR'
      'FROM '
      '  DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO R'
      'WHERE '
      '  D.CODDOCUMENTO = L.CODDOCUMENTO AND '
      '  L.CODDOCUMENTO = R.CODDOCUMENTO AND'
      '  L.NUMLANCTO    = R.NUMLANCTO    AND'
      '  D.NUMAPGR      = :NUMAPGR             '
      'GROUP BY'
      'D.NUMAPGR'
      '')
    ValidateWithMask = True
    Left = 176
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMAPGR'
        ParamType = ptInput
      end>
    object CdsTotApGrNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object CdsTotApGrVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object CdsContabLanc: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsApGr
    SQL.Strings = (
      'SELECT'
      '  DOC.OPERACAO, LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR,'
      
        '  LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC' +
        '.LACHIST5 AS HISTLANCAMENTOCONTABIL'
      'FROM'
      '  DOCUMENTO DOC,'
      '  LANCTODOCUM LAN,'
      '  LANCAMENTO LC'
      'WHERE'
      '  (DOC.CODDOCUMENTO = :CODDOCUMENTO)    AND'
      '  (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO) AND'
      '  (LAN.PLNCODIGO    = LC.PLNCODIGO)     AND'
      '  (LAN.OPERACAO     <> '#39'5'#39')             AND'
      '  (LAN.OPERACAO     <> '#39'15'#39')             AND'
      '  (LAN.OPERACAO     <> '#39'3'#39')             AND'
      '  ((DOC.OPERACAO    <> '#39'1'#39')             AND'
      '  ((DOC.NUMFATURA IS NULL) OR (DOC.NUMFATURA = 0)))'
      'ORDER BY'
      '  LC.LACDEBCRE,'
      '  LC.PLACONTA'
      '')
    ValidateWithMask = True
    Left = 184
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODDOCUMENTO'
        ParamType = ptInput
      end>
    object CdsContabLancOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = 'BASEDADOS.DOCUMENTO.OPERACAO'
      FixedChar = True
      Size = 2
    end
    object CdsContabLancLACDEBCRE: TStringField
      FieldName = 'LACDEBCRE'
      Origin = 'BASEDADOS.LANCAMENTO.LACDEBCRE'
      FixedChar = True
      Size = 1
    end
    object CdsContabLancPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'BASEDADOS.LANCAMENTO.PLACONTA'
      FixedChar = True
      Size = 18
    end
    object CdsContabLancLACVALOR: TFloatField
      FieldName = 'LACVALOR'
      Origin = 'BASEDADOS.LANCAMENTO.LACVALOR'
    end
    object CdsContabLancHISTLANCAMENTOCONTABIL: TStringField
      FieldName = 'HISTLANCAMENTOCONTABIL'
      Origin = 'BASEDADOS.LANCAMENTO.LACHIST1'
      Size = 200
    end
  end
  object CdsContab3: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsApGr
    SQL.Strings = (
      'SELECT Q2.LACDEBCRE, Q2.PLACONTA,'
      
        '  -- tavares pend. 17291 ((Q1.VALOR * Q2.LACVALOR)/ Q2.VALOR) AS' +
        ' VALOR,'
      '  Q2.LACVALOR as valor,'
      '  Q1.HISTORICOCOMPL AS HISTLANCAMENTOCONTABIL'
      ' FROM'
      '(SELECT'
      
        '  LAN.VALOR, DOC.NUMFATURA, '#39'LANÇAMENTO DO DOCUMENTO '#39' || DOC.NO' +
        'DOCUMENTO || '#39'/'#39' || DOC.COMPLDOCUMENTO || P.RAZAOSOCIAL AS HISTO' +
        'RICOCOMPL'
      'FROM'
      '  DOCUMENTO DOC,'
      '  LANCTODOCUM LAN,'
      '  PESSOA P'
      'WHERE'
      '  (DOC.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '  (LAN.OPERACAO = '#39'3'#39') AND'
      '  (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)     AND'
      '  (DOC.IDFORCLI = P.IDPESSOA)) Q1,'
      '(SELECT'
      
        '  DOC.NUMFATURA, LC.LACDEBCRE, LC.PLACONTA,  LC.LACVALOR, LAN.VA' +
        'LOR,'
      
        '  LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC' +
        '.LACHIST5 AS HISTLANCAMENTOCONTABIL'
      'FROM'
      '  DOCUMENTO DOC,'
      '  LANCTODOCUM LAN,'
      '  LANCAMENTO LC'
      'WHERE'
      '  (LAN.OPERACAO = '#39'1'#39') AND'
      '  (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)     AND'
      '  (LAN.PLNCODIGO = LC.PLNCODIGO)) Q2'
      ''
      'WHERE Q1.NUMFATURA = Q2.NUMFATURA'
      'ORDER BY Q2.LACDEBCRE'
      ''
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 336
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object sqlCalBordero: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '      SUM(DECODE(L.OPERACAO,'#39'10'#39',DECODE(D.RECPAG,'#39'R'#39',DECODE(DEBC' +
        'RE,'#39'D'#39',L.VALOR,L.VALOR*-1),DECODE(DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-1)' +
        '),     '
      
        '               DECODE(D.RECPAG,'#39'R'#39',DECODE(DEBCRE,'#39'C'#39',L.VALOR,L.V' +
        'ALOR*-1),DECODE(DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1)) ) ) AS CALBORDER' +
        'O'
      'FROM'
      '  LANCTODOCUM L, RECBTOPAGTO R, DOCUMENTO D'
      'WHERE'
      ' ( D.CODDOCUMENTO  = L.CODDOCUMENTO ) AND'
      ' ( L.CODDOCUMENTO  = R.CODDOCUMENTO ) AND'
      ' ( L.NUMLANCTO     = R.NUMLANCTO    ) AND'
      ' ( D.NUMAPGR       = :NumApGr       ) AND'
      ' ( R.NUMCHQBORDERO = :NumChqB       ) AND'
      ' ( D.IDEMPRESA     = :idEmpresa     ) '
      ''
      ' '
      ' ')
    ClientDataSet = cdsCalBordero
    Left = 27
    Top = 333
  end
  object cdsCalBordero: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 376
  end
  object bordero: TppBDEPipeline
    DataSource = dsBordero
    CloseDataSource = True
    UserName = 'Bordero'
    Left = 25
    Top = 257
    MasterDataPipelineName = 'PpApGr'
    object borderoppField1: TppField
      FieldAlias = 'CALBORDERO'
      FieldName = 'CALBORDERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object dsBordero: TwwDataSource
    DataSet = cdsCalBordero
    Left = 25
    Top = 297
  end
end
