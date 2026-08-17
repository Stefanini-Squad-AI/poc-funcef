inherited dtmRelExtrato: TdtmRelExtrato
  Left = 260
  Top = 222
  Width = 346
  Height = 159
  Caption = 'dtmRelExtrato'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Extrato de Lançamentos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'idContratoImovel'
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
        Caption = 'idCliente'
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
        Caption = 'flgTipo'
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
        Caption = 'dtCorrige'
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
        Caption = 'dtInicio'
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
        Caption = 'dtTermino'
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
        Caption = 'idTipoReceita'
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
        Caption = 'idSitCont'
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
      end>
    Formheight = 300
    FormWidth = 500
    Left = 148
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rptExtrato
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  object dsExtrato: TwwDataSource
    DataSet = cdsExtrato
    Left = 88
    Top = 72
  end
  object pplExtrato: TppBDEPipeline
    DataSource = dsExtrato
    UserName = 'lExtrato'
    Left = 152
    Top = 72
    object pplExtratoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplExtratoppField2: TppField
      FieldAlias = 'CONTRATO_EXTENSO'
      FieldName = 'CONTRATO_EXTENSO'
      FieldLength = 83
      DisplayWidth = 83
      Position = 1
    end
    object pplExtratoppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplExtratoppField4: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplExtratoppField5: TppField
      FieldAlias = 'DESCCUSTORECIMO'
      FieldName = 'DESCCUSTORECIMO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplExtratoppField6: TppField
      FieldAlias = 'DATA_BAIXA'
      FieldName = 'DATA_BAIXA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object pplExtratoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBER'
      FieldName = 'TOT_RECEBER'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplExtratoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_RECEBIDO'
      FieldName = 'TOT_RECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplExtratoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_ALTERADOR'
      FieldName = 'TOT_ALTERADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplExtratoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONVLRMULTA'
      FieldName = 'CONVLRMULTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplExtratoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONPERCENTMULTA'
      FieldName = 'CONPERCENTMULTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplExtratoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONMOEDAMULTA'
      FieldName = 'CONMOEDAMULTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplExtratoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONVLRMORA'
      FieldName = 'CONVLRMORA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplExtratoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONPERCENTMORA'
      FieldName = 'CONPERCENTMORA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplExtratoppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'CONMOEDAMORA'
      FieldName = 'CONMOEDAMORA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplExtratoppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGMORAPROPORC'
      FieldName = 'FLGMORAPROPORC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplExtratoppField17: TppField
      FieldAlias = 'CONPERMORA'
      FieldName = 'CONPERMORA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object pplExtratoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGNAOCONCILIADO'
      FieldName = 'FLGNAOCONCILIADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplExtratoppField19: TppField
      FieldAlias = 'DSC_SITCONT'
      FieldName = 'DSC_SITCONT'
      FieldLength = 60
      DisplayWidth = 60
      Position = 18
    end
    object pplExtratoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGNAOCONCILIADO_1'
      FieldName = 'FLGNAOCONCILIADO_1'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplExtratoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'INDCORRECAO'
      FieldName = 'INDCORRECAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplExtratoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOT_DEVIDO'
      FieldName = 'TOT_DEVIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplExtratoppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplExtratoppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIF_CORRIG'
      FieldName = 'DIF_CORRIG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplExtratoppField25: TppField
      FieldAlias = 'DSC_ABONO'
      FieldName = 'DSC_ABONO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 24
    end
  end
  object rptExtrato: TppReport
    AutoStop = False
    DataPipeline = pplExtrato
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
    DeviceType = 'Screen'
    ModalPreview = False
    Left = 216
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel148: TppLabel
        UserName = 'ppLabel148'
        AutoSize = False
        Caption = 'Extrato Contratual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLogoExtratoContratual: TppImage
        UserName = 'ppLogoExtratoContratual'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15610
        mmLeft = 265
        mmTop = 0
        mmWidth = 15611
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'TOT_RECEBER'
        DataPipeline = pplExtrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 74348
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        BlankWhenZero = True
        DataField = 'TOT_RECEBIDO'
        DataPipeline = pplExtrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 134409
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATA_BAIXA'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 94721
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DESCCUSTORECIMO'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 32544
        mmTop = 0
        mmWidth = 41804
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        DataField = 'DIFERENCA'
        DataPipeline = pplExtrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 152136
        mmTop = 0
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'TOT_DEVIDO'
        DataPipeline = pplExtrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 112184
        mmTop = 0
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        BlankWhenZero = True
        DataField = 'DIF_CORRIG'
        DataPipeline = pplExtrato
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 179917
        mmTop = 0
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'DSC_ABONO'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 172773
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'CODDOCUMENTO'
        DataPipeline = pplExtrato
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 15875
        mmTop = 0
        mmWidth = 11113
        BandType = 4
      end
      object myDBCheckBox1: TmyDBCheckBox
        UserName = 'DBCheckBox1'
        BooleanFalse = '1'
        BooleanTrue = '0'
        DataPipeline = pplExtrato
        DataField = 'FLGNAOCONCILIADO'
        Transparent = True
        mmHeight = 3704
        mmLeft = 28046
        mmTop = 265
        mmWidth = 3440
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object lblSistema: TppLabel
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
        mmWidth = 65617
        BandType = 8
      end
      object ppLine41: TppLine
        UserName = 'ppLine41'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppCalc27: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc28: TppSystemVariable
        UserName = 'Calc28'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 162190
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CONTRATO_EXTENSO'
      DataPipeline = pplExtrato
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 18785
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          mmHeight = 5556
          mmLeft = 0
          mmTop = 11377
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Contrato:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 794
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Locatário:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 5556
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'NOME'
          DataPipeline = pplExtrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 17198
          mmTop = 5556
          mmWidth = 100806
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'CONTRATO_EXTENSO'
          DataPipeline = pplExtrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 17198
          mmTop = 794
          mmWidth = 100542
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Vencto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 794
          mmTop = 12435
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label9'
          AutoSize = False
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 32544
          mmTop = 12435
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Pagamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 93398
          mmTop = 12435
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label11'
          AutoSize = False
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 81227
          mmTop = 12435
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label101'
          AutoSize = False
          Caption = 'Valor Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 133615
          mmTop = 12435
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Divergência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 152136
          mmTop = 12435
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Valor Devido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 112184
          mmTop = 12435
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Saldo Corrigido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 172509
          mmTop = 12435
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Docum.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 15875
          mmTop = 12435
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'Situação Contratual:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 122767
          mmTop = 5556
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'DSC_SITCONT'
          DataPipeline = pplExtrato
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 153723
          mmTop = 5556
          mmWidth = 43127
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 0
          mmTop = 2381
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label2'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 21696
          mmTop = 3440
          mmWidth = 6879
          BandType = 5
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1852
          mmLeft = 0
          mmTop = 7408
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'DIFERENCA'
          DataPipeline = pplExtrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 153459
          mmTop = 3440
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'DIF_CORRIG'
          DataPipeline = pplExtrato
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 179388
          mmTop = 3440
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object cdsExtrato: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 73
    Data = {
      D03700009619E0BD010000001800000019003500000003000000C6020C434F44
      444F43554D454E544F080004000000000010434F4E545241544F5F455854454E
      534F0100490000000100055749445448020002005300044E4F4D450100490000
      000100055749445448020002003C000E4441544156454E43494D454E544F0800
      0800000000000F44455343435553544F524543494D4F01004900000001000557
      49445448020002003C000A444154415F424149584108000800000000000B544F
      545F5245434542455208000400000000000C544F545F524543454249444F0800
      0400000000000D544F545F414C54455241444F5208000400000000000B434F4E
      564C524D554C544108000400000000000F434F4E50455243454E544D554C5441
      08000400000000000D434F4E4D4F4544414D554C544108000400000000000A43
      4F4E564C524D4F524108000400000000000E434F4E50455243454E544D4F5241
      08000400000000000C434F4E4D4F4544414D4F524108000400000000000E464C
      474D4F524150524F504F524308000400000000000A434F4E5045524D4F524101
      004900000002000753554254595045020049000A004669786564436861720005
      574944544802000200010010464C474E414F434F4E43494C4941444F08000400
      000000000B4453435F534954434F4E5401004900000001000557494454480200
      02003C0012464C474E414F434F4E43494C4941444F5F3108000400000000000B
      494E44434F52524543414F08000400000000000A544F545F44455649444F0800
      040000000000094449464552454E434108000400000000000A4449465F434F52
      5249470800040000000000094453435F41424F4E4F0100490000000200075355
      4254595045020049000A0046697865644368617200055749445448020002000A
      0002000D44454641554C545F4F52444552020082000200000002000400044C43
      49440400010009080000000000401000000000000000804CC240303030332F52
      454645522F3030202D20474446202D20476F7665726E6F20646F204469737472
      69746F204665646572616C1E474446202D20476F7665726E6F20446973747269
      746F204665646572616C000092E145B1CC4207416C756775656C0000BAC764B1
      CC42000000000064D940000000000064D9400000000000000000000000000000
      000000000000000024400000000000000000000000000000F03F000000000000
      F03F014D000000000000F03F0D41E7E36F20436F6272616EE761000000000000
      F03F0000000000004440000000000064D9400000000000000000000000000000
      000001000000004010000000000000008006C840303030332F52454645522F30
      30202D20474446202D20476F7665726E6F20646F20446973747269746F204665
      646572616C1E474446202D20476F7665726E6F20446973747269746F20466564
      6572616C000088F3E2B1CC4207416C756775656C00002620FAB1CC4200000000
      0064D940000000000064D9400000000000000000000000000000000000000000
      000024400000000000000000000000000000F03F000000000000F03F014D0000
      00000000F03F0D41E7E36F20436F6272616EE761000000000000F03F00000000
      00004440000000000064D9400000000000000000000000000000000001000000
      0040100000000000000080B4C940303030332F52454645522F3030202D204744
      46202D20476F7665726E6F20646F20446973747269746F204665646572616C1E
      474446202D20476F7665726E6F20446973747269746F204665646572616C0000
      1AC632B2CC4207416C756775656C0000703F54B2CC42000000000064D9400000
      00000064D9400000000000000000000000000000000000000000000024400000
      000000000000000000000000F03F000000000000F03F014D000000000000F03F
      0D41E7E36F20436F6272616EE761000000000000F03F00000000000044400000
      00000064D9400000000000000000000000000000000001000000004010000000
      000000008021CC40303030332F52454645522F3030202D20474446202D20476F
      7665726E6F20646F20446973747269746F204665646572616C1E474446202D20
      476F7665726E6F20446973747269746F204665646572616C00007E0580B2CC42
      07416C756775656C000008BF87B2CC42000000000064D940000000000064D940
      0000000000000000000000000000000000000000000024400000000000000000
      000000000000F03F000000000000F03F014D000000000000F03F0D41E7E36F20
      436F6272616EE761000000000000F03F0000000000004440000000000064D940
      00000000000000000000000000000000010000000040100000000000000080D0
      CE40303030332F52454645522F3030202D20474446202D20476F7665726E6F20
      646F20446973747269746F204665646572616C1E474446202D20476F7665726E
      6F20446973747269746F204665646572616C000010D8CFB2CC4207416C756775
      656C000010D8CFB2CC42000000000064D940000000000064D940000000000000
      0000000000000000000000000000000024400000000000000000000000000000
      F03F000000000000F03F014D000000000000F03F0D41E7E36F20436F6272616E
      E761000000000000F03F0000000000004440000000000064D940000000000000
      000000000000000000000100000000401000000000000000806ED04030303033
      2F52454645522F3030202D20474446202D20476F7665726E6F20646F20446973
      747269746F204665646572616C1E474446202D20476F7665726E6F2044697374
      7269746F204665646572616C000074171DB3CC4207416C756775656C0000E61C
      96B3CC42000000000064D940000000000064D940000000000000000000000000
      0000000000000000000024400000000000000000000000000000F03F00000000
      0000F03F014D000000000000F03F0D41E7E36F20436F6272616EE76100000000
      0000F03F0000000000004440000000000064D940000000000000000000000000
      00000000010000000040100000000000000080B9D140303030332F5245464552
      2F3030202D20474446202D20476F7665726E6F20646F20446973747269746F20
      4665646572616C1E474446202D20476F7665726E6F20446973747269746F2046
      65646572616C000006EA6CB3CC4207416C756775656C0000E61C96B3CC420000
      00000064D940000000000064D940000000000000000000000000000000000000
      0000000024400000000000000000000000000000F03F000000000000F03F014D
      000000000000F03F0D41E7E36F20436F6272616EE761000000000000F03F0000
      000000004440000000000064D940000000000000000000000000000000000100
      00000040100000000000000040A1D340303030332F52454645522F3030202D20
      474446202D20476F7665726E6F20646F20446973747269746F20466564657261
      6C1E474446202D20476F7665726E6F20446973747269746F204665646572616C
      0000E61C96B3CC42125265656D626F6C736F2064652049505455200000E61C96
      B3CC4290C2F5285C49994090C2F5285C49994000000000000000000000000000
      00000000000000000024400000000000000000000000000000F03F0000000000
      00F03F014D000000000000F03F0D41E7E36F20436F6272616EE7610000000000
      00F03F000000000000444090C2F5285C49994000000000000000000000000000
      000000010000000040100000000000000080A1D340303030332F52454645522F
      3030202D20474446202D20476F7665726E6F20646F20446973747269746F2046
      65646572616C1E474446202D20476F7665726E6F20446973747269746F204665
      646572616C0000E61C96B3CC42125265656D626F6C736F206465204950545520
      0000E61C96B3CC42AE47E17A14729940AE47E17A147299400000000000000000
      000000000000000000000000000024400000000000000000000000000000F03F
      000000000000F03F014D000000000000F03F0D41E7E36F20436F6272616EE761
      000000000000F03F0000000000004440AE47E17A147299400000000000000000
      0000000000000000010000000040100000000000000080E5D240303030332F52
      454645522F3030202D20474446202D20476F7665726E6F20646F204469737472
      69746F204665646572616C1E474446202D20476F7665726E6F20446973747269
      746F204665646572616C000098BCBCB3CC4207416C756775656C0000B2DCAFB3
      CC42000000000064D940000000000064D9400000000000000000000000000000
      000000000000000024400000000000000000000000000000F03F000000000000
      F03F014D000000000000F03F0D41E7E36F20436F6272616EE761000000000000
      F03F0000000000004440000000000064D9400000000000000000000000000000
      00000100000000401000000000000000C0E8DC40303030332F52454645522F30
      30202D20474446202D20476F7665726E6F20646F20446973747269746F204665
      646572616C1E474446202D20476F7665726E6F20446973747269746F20466564
      6572616C00000856D1B3CC42125265656D626F6C736F20646520495054552000
      00AC2FCCB3CC42B81E85EB3105C440B81E85EB3105C440000000000000000000
      0000000000000000000000000024400000000000000000000000000000F03F00
      0000000000F03F014D000000000000F03F0D41E7E36F20436F6272616EE76100
      0000000000F03F0000000000004440B81E85EB3105C440000000000000000000
      00000000000000010000000040100000000000000000E9DC40303030332F5245
      4645522F3030202D20474446202D20476F7665726E6F20646F20446973747269
      746F204665646572616C1E474446202D20476F7665726E6F2044697374726974
      6F204665646572616C000036E9D3B3CC42125265656D626F6C736F2064652049
      505455200000AC2FCCB3CC42AE47E17A34E5C340AE47E17A34E5C34000000000
      0000000000000000000000000000000000002440000000000000000000000000
      0000F03F000000000000F03F014D000000000000F03F0D41E7E36F20436F6272
      616EE761000000000000F03F0000000000004440AE47E17A34E5C34000000000
      000000000000000000000000010000000040100000000000000040E0DC403030
      30332F52454645522F3030202D20474446202D20476F7665726E6F20646F2044
      6973747269746F204665646572616C1E474446202D20476F7665726E6F204469
      73747269746F204665646572616C0000A0D504B4CC4207416C756775656C0000
      3E021CB4CC429A99999919BFDB409A99999919BFDB4000000000000000000000
      00000000000000000000000024400000000000000000000000000000F03F0000
      00000000F03F014D000000000000F03F0D41E7E36F20436F6272616EE7610000
      00000000F03F00000000000044409A99999919BFDB4000000000000000000000
      0000000000000100000000401000000000000000002FDF40303030332F524546
      45522F3030202D20474446202D20476F7665726E6F20646F2044697374726974
      6F204665646572616C1E474446202D20476F7665726E6F20446973747269746F
      204665646572616C0000FCFB09B4CC42175265656D626F6C736F20646520436F
      6E646F6D696E696F0000827492B4CC42E17A14AE4749AF40E17A14AE4749AF40
      0000000000000000000000000000000000000000000024400000000000000000
      000000000000F03F000000000000F03F014D000000000000F03F0D41E7E36F20
      436F6272616EE761000000000000F03F0000000000004440E17A14AE4749AF40
      000000000000000000000000000000000100000000401000000000000000402F
      DF40303030332F52454645522F3030202D20474446202D20476F7665726E6F20
      646F20446973747269746F204665646572616C1E474446202D20476F7665726E
      6F20446973747269746F204665646572616C0000FCFB09B4CC42175265656D62
      6F6C736F20646520436F6E646F6D696E696F0000827492B4CC4215AE47E1FA7D
      AF4015AE47E1FA7DAF4000000000000000000000000000000000000000000000
      24400000000000000000000000000000F03F000000000000F03F014D00000000
      0000F03F0D41E7E36F20436F6272616EE761000000000000F03F000000000000
      444015AE47E1FA7DAF4000000000000000000000000000000000010000000040
      100000000000000000F1E140303030332F52454645522F3030202D2047444620
      2D20476F7665726E6F20646F20446973747269746F204665646572616C1E4744
      46202D20476F7665726E6F20446973747269746F204665646572616C0000E2DB
      16B4CC42175265656D626F6C736F20646520436F6E646F6D696E696F00003E02
      1CB4CC42B81E85EB917AC740B81E85EB917AC740000000000000000000000000
      0000000000000000000024400000000000000000000000000000F03F00000000
      0000F03F014D000000000000F03F0D41E7E36F20436F6272616EE76100000000
      0000F03F0000000000004440B81E85EB917AC740000000000000000000000000
      0000000001000000004010000000000000006021E040303030332F5245464552
      2F3030202D20474446202D20476F7665726E6F20646F20446973747269746F20
      4665646572616C1E474446202D20476F7665726E6F20446973747269746F2046
      65646572616C000032A854B4CC4207416C756775656C0000EAF45EB4CC429A99
      999919BFDB409A99999919BFDB40000000000000000000000000000000000000
      0000000024400000000000000000000000000000F03F000000000000F03F014D
      00000000000000000D41E7E36F20436F6272616EE76100000000000000000000
      0000000044409A99999919BFDB40000000000000000000000000000000000100
      0000004010000000000000006056E240303030332F52454645522F3030202D20
      474446202D20476F7665726E6F20646F20446973747269746F20466564657261
      6C1E474446202D20476F7665726E6F20446973747269746F204665646572616C
      00008ECE59B4CC42175265656D626F6C736F20646520436F6E646F6D696E696F
      0000F851D4B5CC42E17A14AE4749AF40E17A14AE4749AF400000000000000000
      000000000000000000000000000024400000000000000000000000000000F03F
      000000000000F03F014D000000000000F03F0D41E7E36F20436F6272616EE761
      000000000000F03F0000000000004440E17A14AE4749AF400000000000000000
      000000000000000001000000004010000000000000008056E240303030332F52
      454645522F3030202D20474446202D20476F7665726E6F20646F204469737472
      69746F204665646572616C1E474446202D20476F7665726E6F20446973747269
      746F204665646572616C00008ECE59B4CC42175265656D626F6C736F20646520
      436F6E646F6D696E696F0000F851D4B5CC4215AE47E1FA7DAF4015AE47E1FA7D
      AF40000000000000000000000000000000000000000000002440000000000000
      0000000000000000F03F000000000000F03F014D000000000000F03F0D41E7E3
      6F20436F6272616EE761000000000000F03F000000000000444015AE47E1FA7D
      AF40000000000000000000000000000000000100000000401000000000000000
      8082E240303030332F52454645522F3030202D20474446202D20476F7665726E
      6F20646F20446973747269746F204665646572616C1E474446202D20476F7665
      726E6F20446973747269746F204665646572616C000096E7A1B4CC4207416C75
      6775656C0000827492B4CC429A99999919BFDB409A99999919BFDB4000000000
      0000000000000000000000000000000000002440000000000000000000000000
      0000F03F000000000000F03F014D00000000000000000D41E7E36F20436F6272
      616EE761000000000000000000000000000044409A99999919BFDB4000000000
      0000000000000000000000000100000000401000000000000000C096E5403030
      30332F52454645522F3030202D20474446202D20476F7665726E6F20646F2044
      6973747269746F204665646572616C1E474446202D20476F7665726E6F204469
      73747269746F204665646572616C0000F20DA7B4CC42175265656D626F6C736F
      20646520436F6E646F6D696E696F000092A622B5CC42E17A14AE4749AF40E17A
      14AE4749AF400000000000000000000000000000000000000000000024400000
      000000000000000000000000F03F000000000000F03F014D000000000000F03F
      0D41E7E36F20436F6272616EE761000000000000F03F0000000000004440E17A
      14AE4749AF400000000000000000000000000000000001000000004010000000
      00000000E096E540303030332F52454645522F3030202D20474446202D20476F
      7665726E6F20646F20446973747269746F204665646572616C1E474446202D20
      476F7665726E6F20446973747269746F204665646572616C0000F20DA7B4CC42
      175265656D626F6C736F20646520436F6E646F6D696E696F000092A622B5CC42
      15AE47E1FA7DAF4015AE47E1FA7DAF4000000000000000000000000000000000
      00000000000024400000000000000000000000000000F03F000000000000F03F
      014D000000000000F03F0D41E7E36F20436F6272616EE761000000000000F03F
      000000000000444015AE47E1FA7DAF4000000000000000000000000000000000
      0100000000401000000000000000E0EEE640303030332F52454645522F303020
      2D20474446202D20476F7665726E6F20646F20446973747269746F2046656465
      72616C1E474446202D20476F7665726E6F20446973747269746F204665646572
      616C000028BAF1B4CC4207416C756775656C000050A010B5CC429A99999919BF
      DB409A99999919BFDB4000000000000000000000000000000000000000000000
      24400000000000000000000000000000F03F000000000000F03F014D00000000
      0000F03F0D41E7E36F20436F6272616EE761000000000000F03F000000000000
      44409A99999919BFDB4000000000000000000000000000000000010000000040
      1000000000000000C02AE840303030332F52454645522F3030202D2047444620
      2D20476F7665726E6F20646F20446973747269746F204665646572616C1E4744
      46202D20476F7665726E6F20446973747269746F204665646572616C000084E0
      F6B4CC42175265656D626F6C736F20646520436F6E646F6D696E696F0000AE32
      7AB5CC42E17A14AE4749AF40E17A14AE4749AF40000000000000000000000000
      0000000000000000000024400000000000000000000000000000F03F00000000
      0000F03F014D000000000000F03F0D41E7E36F20436F6272616EE76100000000
      0000F03F0000000000004440E17A14AE4749AF40000000000000000000000000
      000000000100000000401000000000000000E02AE840303030332F5245464552
      2F3030202D20474446202D20476F7665726E6F20646F20446973747269746F20
      4665646572616C1E474446202D20476F7665726E6F20446973747269746F2046
      65646572616C000084E0F6B4CC42175265656D626F6C736F20646520436F6E64
      6F6D696E696F0000AE327AB5CC4215AE47E1FA7DAF4015AE47E1FA7DAF400000
      0000000000000000000000000000000000000000244000000000000000000000
      00000000F03F000000000000F03F014D000000000000F03F0D41E7E36F20436F
      6272616EE761000000000000F03F000000000000444015AE47E1FA7DAF400000
      00000000000000000000000000000100000000401000000000000000E073E840
      303030332F52454645522F3030202D20474446202D20476F7665726E6F20646F
      20446973747269746F204665646572616C1E474446202D20476F7665726E6F20
      446973747269746F204665646572616C00008CF93EB5CC4207416C756775656C
      000072D94BB5CC429A99999919BFDB409A99999919BFDB400000000000000000
      000000000000000000000000000024400000000000000000000000000000F03F
      000000000000F03F014D00000000000000000D41E7E36F20436F6272616EE761
      000000000000000000000000000044409A99999919BFDB400000000000000000
      00000000000000000100000000401000000000000000E00CE940303030332F52
      454645522F3030202D20474446202D20476F7665726E6F20646F204469737472
      69746F204665646572616C1E474446202D20476F7665726E6F20446973747269
      746F204665646572616C0000E81F44B5CC42175265656D626F6C736F20646520
      436F6E646F6D696E696F000034AB02B6CC42E17A14AE4749AF40E17A14AE4749
      AF40000000000000000000000000000000000000000000002440000000000000
      0000000000000000F03F000000000000F03F014D000000000000F03F0D41E7E3
      6F20436F6272616EE761000000000000F03F0000000000004440E17A14AE4749
      AF40000000000000000000000000000000000100000000401000000000000000
      000DE940303030332F52454645522F3030202D20474446202D20476F7665726E
      6F20646F20446973747269746F204665646572616C1E474446202D20476F7665
      726E6F20446973747269746F204665646572616C0000E81F44B5CC4217526565
      6D626F6C736F20646520436F6E646F6D696E696F000034AB02B6CC4215AE47E1
      FA7DAF4015AE47E1FA7DAF400000000000000000000000000000000000000000
      000024400000000000000000000000000000F03F000000000000F03F014D0000
      00000000F03F0D41E7E36F20436F6272616EE761000000000000F03F00000000
      0000444015AE47E1FA7DAF400000000000000000000000000000000001000000
      00401000000000000000403CE940303030332F52454645522F3030202D204744
      46202D20476F7665726E6F20646F20446973747269746F204665646572616C1E
      474446202D20476F7665726E6F20446973747269746F204665646572616C0000
      1ECC8EB5CC4207416C756775656C0000BCF8A5B5CC429A99999919BFDB409A99
      999919BFDB400000000000000000000000000000000000000000000024400000
      000000000000000000000000F03F000000000000F03F014D000000000000F03F
      0D41E7E36F20436F6272616EE761000000000000F03F00000000000044409A99
      999919BFDB400000000000000000000000000000000001000000004010000000
      00000000205BEA40303030332F52454645522F3030202D20474446202D20476F
      7665726E6F20646F20446973747269746F204665646572616C1E474446202D20
      476F7665726E6F20446973747269746F204665646572616C00007AF293B5CC42
      175265656D626F6C736F20646520436F6E646F6D696E696F000076B114B6CC42
      E17A14AE4749AF40E17A14AE4749AF4000000000000000000000000000000000
      00000000000024400000000000000000000000000000F03F000000000000F03F
      014D000000000000F03F0D41E7E36F20436F6272616EE761000000000000F03F
      0000000000004440E17A14AE4749AF4000000000000000000000000000000000
      0100000000401000000000000000405BEA40303030332F52454645522F303020
      2D20474446202D20476F7665726E6F20646F20446973747269746F2046656465
      72616C1E474446202D20476F7665726E6F20446973747269746F204665646572
      616C00007AF293B5CC42175265656D626F6C736F20646520436F6E646F6D696E
      696F000076B114B6CC4215AE47E1FA7DAF4015AE47E1FA7DAF40000000000000
      0000000000000000000000000000000024400000000000000000000000000000
      F03F000000000000F03F014D000000000000F03F0D41E7E36F20436F6272616E
      E761000000000000F03F000000000000444015AE47E1FA7DAF40000000000000
      000000000000000000000100000000401000000000000000A08CEA4030303033
      2F52454645522F3030202D20474446202D20476F7665726E6F20646F20446973
      747269746F204665646572616C1E474446202D20476F7665726E6F2044697374
      7269746F204665646572616C0000B09EDEB5CC4207416C756775656C000076B1
      14B6CC429A99999919BFDB409A99999919BFDB40000000000000000000000000
      0000000000000000000024400000000000000000000000000000F03F00000000
      0000F03F014D000000000000F03F0D41E7E36F20436F6272616EE76100000000
      0000F03F00000000000044409A99999919BFDB40000000000000000000000000
      000000000100000004401000000000000000009CF040303030332F5245464552
      2F3030202D20474446202D20476F7665726E6F20646F20446973747269746F20
      4665646572616C1E474446202D20476F7665726E6F20446973747269746F2046
      65646572616C00002EFE1EB6CC42135265656D626F6C736F7320646976657273
      6F73000000000000744000000000000000000000000000000000000000000000
      000000000000000024400000000000000000000000000000F03F000000000000
      F03F014D000000000000F03F0D41E7E36F20436F6272616EE761000000000000
      F03F000000000000444000000000000000000000000000000000000000000000
      00000100000004401000000000000000109CF040303030332F52454645522F30
      30202D20474446202D20476F7665726E6F20646F20446973747269746F204665
      646572616C1E474446202D20476F7665726E6F20446973747269746F20466564
      6572616C00002EFE1EB6CC42135265656D626F6C736F73206469766572736F73
      0000000000007440000000000000000000000000000000000000000000000000
      00000000000024400000000000000000000000000000F03F000000000000F03F
      014D000000000000F03F0D41E7E36F20436F6272616EE761000000000000F03F
      0000000000004440000000000000000000000000000000000000000000000000
      01000000004010000000000000002040EC40303030332F52454645522F303020
      2D20474446202D20476F7665726E6F20646F20446973747269746F2046656465
      72616C1E474446202D20476F7665726E6F20446973747269746F204665646572
      616C000014DE2BB6CC4207416C756775656C000076B114B6CC429A99999919BF
      DB409A99999919BFDB4000000000000000000000000000000000000000000000
      24400000000000000000000000000000F03F000000000000F03F014D00000000
      000000000D41E7E36F20436F6272616EE7610000000000000000000000000000
      44409A99999919BFDB4000000000000000000000000000000000010000000040
      100000000000000010AFF040303030332F52454645522F3030202D2047444620
      2D20476F7665726E6F20646F20446973747269746F204665646572616C1E4744
      46202D20476F7665726E6F20446973747269746F204665646572616C00007004
      31B6CC42175265656D626F6C736F20646520436F6E646F6D696E696F000044DD
      92B6CC42E17A14AE4749AF40E17A14AE4749AF40000000000000000000000000
      0000000000000000000024400000000000000000000000000000F03F00000000
      0000F03F014D000000000000F03F0D41E7E36F20436F6272616EE76100000000
      0000F03F0000000000004440E17A14AE4749AF40000000000000000000000000
      00000000010000000040100000000000000020AFF040303030332F5245464552
      2F3030202D20474446202D20476F7665726E6F20646F20446973747269746F20
      4665646572616C1E474446202D20476F7665726E6F20446973747269746F2046
      65646572616C0000700431B6CC42175265656D626F6C736F20646520436F6E64
      6F6D696E696F000044DD92B6CC4215AE47E1FA7DAF4015AE47E1FA7DAF400000
      0000000000000000000000000000000000000000244000000000000000000000
      00000000F03F000000000000F03F014D000000000000F03F0D41E7E36F20436F
      6272616EE761000000000000F03F000000000000444015AE47E1FA7DAF400000
      0000000000000000000000000000010000000040100000000000000070AFF140
      303030332F52454645522F3030202D20474446202D20476F7665726E6F20646F
      20446973747269746F204665646572616C1E474446202D20476F7665726E6F20
      446973747269746F204665646572616C0000A6B07BB6CC4207416C756775656C
      000044DD92B6CC429A99999919BFDB409A99999919BFDB400000000000000000
      000000000000000000000000000024400000000000000000000000000000F03F
      000000000000F03F014D000000000000F03F0D41E7E36F20436F6272616EE761
      000000000000F03F00000000000044409A99999919BFDB400000000000000000
      000000000000000001000000044010000000000000009048F540303030332F52
      454645522F3030202D20474446202D20476F7665726E6F20646F204469737472
      69746F204665646572616C1E474446202D20476F7665726E6F20446973747269
      746F204665646572616C00000AF0C8B6CC4207416C756775656C9A99999919BF
      DB40000000000000000000000000000000000000000000000000000000000000
      24400000000000000000000000000000F03F000000000000F03F014D00000000
      0000F03F0D41E7E36F20436F6272616EE761000000000000F03F000000000000
      4440000000000000000000000000000000000000000000000000010000000440
      100000000000000050A6F540303030332F52454645522F3030202D2047444620
      2D20476F7665726E6F20646F20446973747269746F204665646572616C1E4744
      46202D20476F7665726E6F20446973747269746F204665646572616C00009CC2
      18B7CC4207416C756775656C9A99999919BFDB40000000000000000000000000
      0000000000000000000000000000000000002440000000000000000000000000
      0000F03F000000000000F03F014D000000000000F03F0D41E7E36F20436F6272
      616EE761000000000000F03F0000000000004440000000000000000000000000
      000000000000000000000000010000000040100000000000000090B8F6403030
      30332F52454645522F3030202D20474446202D20476F7665726E6F20646F2044
      6973747269746F204665646572616C1E474446202D20476F7665726E6F204469
      73747269746F204665646572616C0000F8E81DB7CC42175265656D626F6C736F
      20646520436F6E646F6D696E696F0000E84DD7B7CC423E0AD7A3F081C9403E0A
      D7A3F081C9400000000000000000000000000000000000000000000024400000
      000000000000000000000000F03F000000000000F03F014D000000000000F03F
      0D41E7E36F20436F6272616EE761000000000000F03F00000000000044403E0A
      D7A3F081C9400000000000000000000000000000000001000000044010000000
      00000000101FF640303030332F52454645522F3030202D20474446202D20476F
      7665726E6F20646F20446973747269746F204665646572616C1E474446202D20
      476F7665726E6F20446973747269746F204665646572616C0000EC8E56B7CC42
      07416C756775656C1F85EB510EB5014100000000D8ABFA400000000000000000
      000000000000000000000000000024400000000000000000000000000000F03F
      000000000000F03F014D000000000000F03F0D41E7E36F20436F6272616EE761
      000000000000F03F000000000000444000000000000000000000000000000000
      000000000000000001000000004010000000000000005001F640303030332F52
      454645522F3030202D20474446202D20476F7665726E6F20646F204469737472
      69746F204665646572616C1E474446202D20476F7665726E6F20446973747269
      746F204665646572616C00002E9568B7CC4207416C756775656C0000081BAEB7
      CC429A99999919BFDB409A99999919BFDB400000000000000000000000000000
      000000000000000024400000000000000000000000000000F03F000000000000
      F03F014D000000000000F03F0D41E7E36F20436F6272616EE761000000000000
      F03F00000000000044409A99999919BFDB400000000000000000000000000000
      00000100000000401000000000000000B0B8F640303030332F52454645522F30
      30202D20474446202D20476F7665726E6F20646F20446973747269746F204665
      646572616C1E474446202D20476F7665726E6F20446973747269746F20466564
      6572616C00008ABB6DB7CC42175265656D626F6C736F20646520436F6E646F6D
      696E696F0000E84DD7B7CC423E0AD7A3F081C9403E0AD7A3F081C94000000000
      0000000000000000000000000000000000002440000000000000000000000000
      0000F03F000000000000F03F014D000000000000F03F0D41E7E36F20436F6272
      616EE761000000000000F03F00000000000044403E0AD7A3F081C94000000000
      00000000000000000000000001000000004010000000000000008024F6403030
      30332F52454645522F3030202D20474446202D20476F7665726E6F20646F2044
      6973747269746F204665646572616C1E474446202D20476F7665726E6F204469
      73747269746F204665646572616C0000709B7AB7CC42125265656D626F6C736F
      20646520495054552000007207DFB7CC42E17A14AE4704AC40E17A14AE4704AC
      4000000000000000000000000000000000000000000000244000000000000000
      00000000000000F03F000000000000F03F014D000000000000F03F0D41E7E36F
      20436F6272616EE761000000000000F03F0000000000004440E17A14AE4704AC
      40000000000000000000000000000000000100000004401000000000000000C0
      B8F640303030332F52454645522F3030202D20474446202D20476F7665726E6F
      20646F20446973747269746F204665646572616C1E474446202D20476F766572
      6E6F20446973747269746F204665646572616C000092D4B5B7CC42175265656D
      626F6C736F20646520436F6E646F6D696E696F3E0AD7A3F081C9400000000000
      0000000000000000000000000000000000000000000000000024400000000000
      000000000000000000F03F000000000000F03F014D000000000000F03F0D41E7
      E36F20436F6272616EE761000000000000F03F00000000000044400000000000
      0000000000000000000000000000000000000001000000044010000000000000
      0080B8F640303030332F52454645522F3030202D20474446202D20476F766572
      6E6F20646F20446973747269746F204665646572616C1E474446202D20476F76
      65726E6F20446973747269746F204665646572616C0000D4DAC7B7CC42125265
      656D626F6C736F20646520495054552048E17A146EF5B4400000000000000000
      0000000000000000000000000000000000000000000024400000000000000000
      000000000000F03F000000000000F03F014D000000000000F03F0D41E7E36F20
      436F6272616EE761000000000000F03F00000000000044400000000000000000
      0000000000000000000000000000000001000000004010000000000000008089
      F640303030332F52454645522F3030202D20474446202D20476F7665726E6F20
      646F20446973747269746F204665646572616C1E474446202D20476F7665726E
      6F20446973747269746F204665646572616C0000C88000B8CC4207416C756775
      656C0000BC2639B8CC429A999999998BDE409A999999998BDE40000000000000
      0000000000000000000000000000000024400000000000000000000000000000
      F03F000000000000F03F014D000000000000F03F0D41E7E36F20436F6272616E
      E761000000000000F03F00000000000044409A999999998BDE40000000000000
      000000000000000000000100000000401000000000000000D0B8F64030303033
      2F52454645522F3030202D20474446202D20476F7665726E6F20646F20446973
      747269746F204665646572616C1E474446202D20476F7665726E6F2044697374
      7269746F204665646572616C000024A705B8CC42175265656D626F6C736F2064
      6520436F6E646F6D696E696F0000BC2639B8CC423E0AD7A3F081C9403E0AD7A3
      F081C94000000000000000000000000000000000000000000000244000000000
      00000000000000000000F03F000000000000F03F014D000000000000F03F0D41
      E7E36F20436F6272616EE761000000000000F03F00000000000044403E0AD7A3
      F081C94000000000000000000000000000000000010000000440100000000000
      0000A0AEF640303030332F52454645522F3030202D20474446202D20476F7665
      726E6F20646F20446973747269746F204665646572616C1E474446202D20476F
      7665726E6F20446973747269746F204665646572616C0000381A15B8CC421252
      65656D626F6C736F2064652049505455201F85EB51B81A9C4000000000000000
      0000000000000000000000000000000000000000000000244000000000000000
      00000000000000F03F000000000000F03F014D000000000000F03F0D41E7E36F
      20436F6272616EE761000000000000F03F000000000000444000000000000000
      0000000000000000000000000000000000010000000440100000000000000090
      AEF640303030332F52454645522F3030202D20474446202D20476F7665726E6F
      20646F20446973747269746F204665646572616C1E474446202D20476F766572
      6E6F20446973747269746F204665646572616C000066AD17B8CC42125265656D
      626F6C736F206465204950545520A4703D0AD7ED9B4000000000000000000000
      0000000000000000000000000000000000000000244000000000000000000000
      00000000F03F000000000000F03F014D000000000000F03F0D41E7E36F20436F
      6272616EE761000000000000F03F000000000000444000000000000000000000
      0000000000000000000000000000010000000440100000000000000090E2F640
      303030332F52454645522F3030202D20474446202D20476F7665726E6F20646F
      20446973747269746F204665646572616C1E474446202D20476F7665726E6F20
      446973747269746F204665646572616C00002CC04DB8CC4207416C756775656C
      9A999999998BDE40000000000000000000000000000000000000000000000000
      00000000000024400000000000000000000000000000F03F000000000000F03F
      014D000000000000F03F0D41E7E36F20436F6272616EE761000000000000F03F
      0000000000004440000000000000000000000000000000000000000000000000
      0100000004401000000000000000D02BF740303030332F52454645522F303020
      2D20474446202D20476F7665726E6F20646F20446973747269746F2046656465
      72616C1E474446202D20476F7665726E6F20446973747269746F204665646572
      616C0000BE929DB8CC4207416C756775656C9A999999998BDE40000000000000
      0000000000000000000000000000000000000000000000002440000000000000
      0000000000000000F03F000000000000F03F014D000000000000F03F0D41E7E3
      6F20436F6272616EE761000000000000F03F0000000000004440000000000000
      0000000000000000000000000000000000000100}
  end
  object CMsp: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '       VW.CODDOCUMENTO,   VW.CONTRATO_EXTENSO, P.NOME,'
      '       VW.DATAVENCIMENTO, VW.DESCCUSTORECIMO,  VW.DATA_BAIXA,'
      '       VW.TOT_RECEBER,    VW.TOT_RECEBIDO,     VW.TOT_ALTERADOR,'
      '       VW.CONVLRMULTA,    VW.CONPERCENTMULTA,  VW.CONMOEDAMULTA,'
      '       VW.CONVLRMORA,     VW.CONPERCENTMORA,   VW.CONMOEDAMORA,'
      
        '       VW.FLGMORAPROPORC, VW.CONPERMORA,       NVL(VW.FLGNAOCONC' +
        'ILIADO,0) AS FLGNAOCONCILIADO,'
      '       SC.DESCRICAO AS DSC_SITCONT,'
      '       NVL(VW.FLGNAOCONCILIADO,0) AS FLGNAOCONCILIADO,'
      
        '       DECODE(VW.IDINDCORRECAO, NULL, VW.CONINDICEREAJUSTE, VW.I' +
        'DINDCORRECAO) AS INDCORRECAO,'
      '       DECODE(VW.DATA_BAIXA,NULL,0,'
      
        '             (VW.TOT_RECEBER+NVL(VW.VLRJUROS,0)+NVL(VW.VLRMULTA,' +
        '0)+NVL(VW.VLRCORRECAOMON,0))) AS TOT_DEVIDO,'
      '       DECODE(VW.DATA_BAIXA,NULL,0,'
      
        '             (NVL(VW.TOT_RECEBIDO,0)-(NVL(VW.TOT_RECEBER,0)+NVL(' +
        'VW.VLRJUROS,0)+NVL(VW.VLRMULTA,0)+NVL(VW.VLRCORRECAOMON,0))) ) A' +
        'S DIFERENCA,'
      '      (0) AS DIF_CORRIG, '#39'          '#39' AS DSC_ABONO'
      ''
      'FROM'
      '       VWLANCAMENTO VW,'
      '       LOCATARIO L,'
      '       PESSOA P,'
      '       SITCONTIMOB SC'
      ''
      'WHERE  ( VW.RECPAG = '#39'R'#39' )'
      '/*  AND  ( VW.FLGNAOCONCILIADO IS NOT NULL )'
      '  AND  ( ( VW.STATUS_DOC = '#39'2'#39' AND VW.FLGNAOCONCILIADO = 1 ) OR'
      
        '         ( VW.DATAVENCIMENTO < SYSDATE AND VW.DATA_BAIXA IS NULL' +
        ' ) )  */'
      '  AND  ( VW.CODDOCUMENTO IS NOT NULL )'
      '  AND  ( VW.IDLOCATARIO = L.IDLOCATARIO(+) )'
      '  AND  ( L.IDLOCATARIO = P.IDPESSOA )'
      '  AND  ( VW.IDSITCONTIMOB = SC.IDSITCONTIMOB(+) )'
      '  AND  ( VW.IDMODULO = :PIDMODULO )'
      
        '  AND  ( (:PIDCONTRATOIMOVEL IS NULL) OR (VW.IDCONTRATOIMOVEL = ' +
        ':PIDCONTRATOIMOVEL) )'
      
        '  AND  ( (:PIDLOCATARIO IS NULL) OR (VW.IDLOCATARIO = :PIDLOCATA' +
        'RIO) )'
      '  AND  ( (:PCONNUMERO IS NULL) OR (VW.CONNUMERO = :PCONNUMERO) )'
      
        '  AND  ( (:PDTINI IS NULL) OR (VW.DATAVENCIMENTO >= TO_DATE(:PDT' +
        'INI)) )'
      
        '  AND  ( (:PDTFIM IS NULL) OR (VW.DATAVENCIMENTO <= TO_DATE(:PDT' +
        'FIM)) )'
      ''
      'ORDER BY VW.CONTRATO_EXTENSO, VW.DATAVENCIMENTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 280
    Top = 72
  end
end
