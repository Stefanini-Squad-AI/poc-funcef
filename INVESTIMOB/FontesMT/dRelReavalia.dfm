inherited dtmRelReavalia: TdtmRelReavalia
  Left = 347
  Top = 214
  Width = 360
  Height = 216
  Caption = 'dtmRelReavalia'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'idMestre'
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
        Caption = 'sCodTipImovel'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'sCodTipImovel'
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
        Caption = 'bSeparador'
        Controle = tcEdit
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
        Caption = 'bCorLinha'
        Controle = tcEdit
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
        Caption = 'iCorLinha'
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
        Caption = 'iAno'
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
        Name = 'iAno'
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
        Caption = 'dReavalia'
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
        Name = 'dReavalia'
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
    Left = 222
    Top = 16
  end
  inherited DevRptCM: TExtraOptions
    Left = 41
    Top = 16
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = ppReavalia
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
    Left = 133
    Top = 16
  end
  inherited cds: TClientDataSet
    Active = False
    Left = 41
    Top = 72
    object cdsIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object cdsIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object cdsNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Size = 60
    end
    object cdsCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object cdsDESCTIPOIMOVEL: TStringField
      FieldName = 'DESCTIPOIMOVEL'
      Size = 60
    end
    object cdsIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object cdsTIPO_BEM: TStringField
      FieldName = 'TIPO_BEM'
      Size = 15
    end
    object cdsVIDAUTIL: TFloatField
      FieldName = 'VIDAUTIL'
    end
    object cdsDATA_ULT_REAVAL: TDateTimeField
      FieldName = 'DATA_ULT_REAVAL'
    end
    object cdsVLR_ULT_REAVAL: TFloatField
      FieldName = 'VLR_ULT_REAVAL'
    end
    object cdsVLR_ULT_ANTERIOR: TFloatField
      FieldName = 'VLR_ULT_ANTERIOR'
    end
    object cdsVLR_VAR_SALDO: TFloatField
      FieldName = 'VLR_VAR_SALDO'
    end
    object cdsDATA_PEN_REAVAL: TDateTimeField
      FieldName = 'DATA_PEN_REAVAL'
    end
    object cdsVLR_PEN_REAVAL: TFloatField
      FieldName = 'VLR_PEN_REAVAL'
    end
    object cdsVLR_VAR_REAV: TFloatField
      FieldName = 'VLR_VAR_REAV'
    end
  end
  inherited CMsp: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT '
      '       I.IDIMOVEL,'
      '       I.IMOCODIGO,'
      '       IM.IMONOME || '#39' - '#39' || I.IMONOME AS DSC_IMOVEL'
      '  FROM IMOVEL I, IMOVEL IM, IMOVELXBEM IXB, BEM B'
      ' WHERE I.IDIMOVELMESTRE =IM.IDIMOVEL'
      '   AND I.IDIMOVEL = IXB.IDIMOVEL'
      '   AND IXB.IDBEM = B.IDBEM'
      '   AND B.BAIXATOTAL = '#39'N'#39
      '   AND I.IDIMOVEL NOT IN ( SELECT DISTINCT IDIMOVEL'
      '                             FROM REAVALIAXREAVALIA'
      
        '                            WHERE TO_CHAR(DATAREAVALIACAO, '#39'YYYY' +
        #39') = 2005 )'
      'ORDER BY DSC_IMOVEL'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ClientDataSet = CDSNaoReavalia
    Left = 292
    Top = 16
  end
  inherited ds: TDataSource
    Left = 136
    Top = 72
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 226
    Top = 72
    object pplppField1: TppField
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplppField2: TppField
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplppField3: TppField
      FieldAlias = 'NOME_MESTRE'
      FieldName = 'NOME_MESTRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplppField4: TppField
      FieldAlias = 'NOME_IMOVEL'
      FieldName = 'NOME_IMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplppField5: TppField
      FieldAlias = 'CODTIPIMOVEL'
      FieldName = 'CODTIPIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplppField6: TppField
      FieldAlias = 'DESCTIPOIMOVEL'
      FieldName = 'DESCTIPOIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplppField7: TppField
      FieldAlias = 'IMOCODIGO'
      FieldName = 'IMOCODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplppField8: TppField
      FieldAlias = 'TIPO_BEM'
      FieldName = 'TIPO_BEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplppField9: TppField
      FieldAlias = 'VIDAUTIL'
      FieldName = 'VIDAUTIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplppField10: TppField
      FieldAlias = 'DATA_ULT_REAVAL'
      FieldName = 'DATA_ULT_REAVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplppField11: TppField
      FieldAlias = 'VLR_ULT_REAVAL'
      FieldName = 'VLR_ULT_REAVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplppField12: TppField
      FieldAlias = 'VLR_ULT_ANTERIOR'
      FieldName = 'VLR_ULT_ANTERIOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplppField13: TppField
      FieldAlias = 'VLR_VAR_SALDO'
      FieldName = 'VLR_VAR_SALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplppField14: TppField
      FieldAlias = 'DATA_PEN_REAVAL'
      FieldName = 'DATA_PEN_REAVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplppField15: TppField
      FieldAlias = 'VLR_PEN_REAVAL'
      FieldName = 'VLR_PEN_REAVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplppField16: TppField
      FieldAlias = 'VLR_VAR_REAV'
      FieldName = 'VLR_VAR_REAV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object ppReavalia: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    Left = 293
    Top = 72
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'Line7'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 242359
        mmTop = 17992
        mmWidth = 41010
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'Line5'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 113242
        mmTop = 17992
        mmWidth = 41010
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
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
        mmTop = 1852
        mmWidth = 284428
        BandType = 0
      end
      object lblTitulo: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Reavaliações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 284163
        BandType = 0
      end
      object ppOrcamentoLine1: TppLine
        UserName = 'OrcamentoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 15610
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Imóvel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 2646
        mmTop = 19844
        mmWidth = 12171
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 69586
        mmTop = 19844
        mmWidth = 14023
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 24077
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 92340
        mmTop = 19844
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 114829
        mmTop = 19844
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 143404
        mmTop = 19844
        mmWidth = 8996
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = ' Penúltima Reavaliação '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        mmHeight = 3704
        mmLeft = 118269
        mmTop = 16140
        mmWidth = 33338
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line6'
        Weight = 0.75
        mmHeight = 529
        mmLeft = 156104
        mmTop = 17992
        mmWidth = 77523
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Vida Útil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 198173
        mmTop = 19844
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Valor Laudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 215107
        mmTop = 19844
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = '  Última Reavaliação  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 3704
        mmLeft = 180975
        mmTop = 16140
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 162190
        mmTop = 19844
        mmWidth = 9260
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Saldo Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 174361
        mmTop = 19844
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label102'
        AutoSize = False
        Caption = 'Reav. Ant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 239978
        mmTop = 19844
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        AutoSize = False
        Caption = 'Saldo Ant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 264848
        mmTop = 19844
        mmWidth = 18521
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = ' Variação '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 3704
        mmLeft = 256117
        mmTop = 16140
        mmWidth = 12965
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object pplSeparador: TppLine
        OnPrint = pplSeparadorPrint
        UserName = 'lSeparador'
        ParentHeight = True
        ParentWidth = True
        Position = lpBottom
        StretchWithParent = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'sCor'
        Brush.Color = clLime
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        StretchWithParent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppNomeImovel: TppDBText
        UserName = 'NomeImovel'
        DataField = 'NOME_IMOVEL'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 10054
        mmTop = 265
        mmWidth = 58208
        BandType = 4
      end
      object ppVlrPenReaval: TppDBText
        UserName = 'VlrPenReaval'
        DataField = 'VLR_PEN_REAVAL'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 130704
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppImoCodigo: TppDBText
        UserName = 'ImoCodigo'
        DataField = 'IMOCODIGO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 69586
        mmTop = 265
        mmWidth = 21431
        BandType = 4
      end
      object ppTipoBem: TppDBText
        UserName = 'TipoBem'
        DataField = 'TIPO_BEM'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 92340
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object ppDataPenReaval: TppDBText
        UserName = 'DataPenReaval'
        DataField = 'DATA_PEN_REAVAL'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 114829
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppVidaUtil: TppDBText
        UserName = 'VidaUtil'
        DataField = 'VIDAUTIL'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 198967
        mmTop = 265
        mmWidth = 11642
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'VLR_ULT_REAVAL'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 211932
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDataUltReaval: TppDBText
        UserName = 'DataPenReaval1'
        DataField = 'DATA_ULT_REAVAL'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 156104
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'VLR_ULT_ANTERIOR'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 173832
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLR_VAR_REAV'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 239448
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'VLR_VAR_SALDO'
        DataPipeline = ppl
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 261673
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppOrcamentoSystemVariable7: TppSystemVariable
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
        mmLeft = 0
        mmTop = 2910
        mmWidth = 283634
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
        mmTop = 2910
        mmWidth = 283634
        BandType = 8
      end
      object ppOrcamentoSystemVariable8: TppSystemVariable
        UserName = 'OrcamentoSystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 257176
        mmTop = 2910
        mmWidth = 26194
        BandType = 8
      end
      object ppOrcamentoLine5: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 16669
      mmPrintPosition = 0
      object ppRegion2: TppRegion
        UserName = 'Region2'
        mmHeight = 8996
        mmLeft = 77523
        mmTop = 794
        mmWidth = 168540
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppLabel21: TppLabel
          UserName = 'Label21'
          AutoSize = False
          Caption = 'Total da Carteira'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 80698
          mmTop = 3969
          mmWidth = 29369
          BandType = 7
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'DBCalc7'
          BlankWhenZero = True
          DataField = 'VLR_PEN_REAVAL'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 119856
          mmTop = 4233
          mmWidth = 32544
          BandType = 7
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          BlankWhenZero = True
          DataField = 'VLR_ULT_ANTERIOR'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 164836
          mmTop = 4233
          mmWidth = 30692
          BandType = 7
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc101'
          BlankWhenZero = True
          DataField = 'VLR_ULT_REAVAL'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 202936
          mmTop = 4233
          mmWidth = 30692
          BandType = 7
        end
      end
      object ppSubNaoReavalia: TppSubReport
        UserName = 'SubNaoReavalia'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 11642
        mmWidth = 284300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppBDNaoReavalia
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4 210 x 297 mm'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Left = 152
          Top = 56
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 23548
            mmPrintPosition = 0
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'Código'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 14288
              mmTop = 16933
              mmWidth = 12171
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label23'
              Caption = 'Nome'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 34925
              mmTop = 16933
              mmWidth = 9790
              BandType = 1
            end
            object ppLine2: TppLine
              UserName = 'Line1'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 15610
              mmWidth = 284300
              BandType = 1
            end
            object ppLabelTitulo: TppLabel
              UserName = 'ppLabelTitulo'
              AutoSize = False
              Caption = 'Imóveis não reavaliados em:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 14
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 5821
              mmLeft = 0
              mmTop = 8202
              mmWidth = 94721
              BandType = 1
            end
            object ppLine6: TppLine
              UserName = 'Line2'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 21960
              mmWidth = 284300
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppShape1: TppShape
              OnPrint = ppsCorPrint
              UserName = 'sCor1'
              Brush.Color = clLime
              ParentHeight = True
              ParentWidth = True
              Pen.Style = psClear
              StretchWithParent = True
              mmHeight = 3969
              mmLeft = 0
              mmTop = 0
              mmWidth = 284300
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'IMOCODIGO'
              DataPipeline = ppBDNaoReavalia
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3969
              mmLeft = 14288
              mmTop = 0
              mmWidth = 17727
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'DSC_IMOVEL'
              DataPipeline = ppBDNaoReavalia
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              ParentDataPipeline = False
              Transparent = True
              mmHeight = 3969
              mmLeft = 34925
              mmTop = 0
              mmWidth = 86519
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 8202
            mmPrintPosition = 0
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'Quantidade de Imóveis : '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 14023
              mmTop = 2381
              mmWidth = 41804
              BandType = 7
            end
            object ppDBCalc11: TppDBCalc
              UserName = 'DBCalc11'
              DataPipeline = ppBDNaoReavalia
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              DBCalcType = dcCount
              mmHeight = 4233
              mmLeft = 57679
              mmTop = 2381
              mmWidth = 17198
              BandType = 7
            end
            object ppLine7: TppLine
              UserName = 'Line3'
              ParentWidth = True
              Weight = 0.75
              mmHeight = 1588
              mmLeft = 0
              mmTop = 1058
              mmWidth = 284300
              BandType = 7
            end
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CODTIPIMOVEL'
      DataPipeline = ppl
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCTIPOIMOVEL'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 21431
          mmTop = 1058
          mmWidth = 77523
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label19'
          AutoSize = False
          Caption = 'Segmento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1058
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
      end
      object gfbMestre: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppRegion1: TppRegion
          UserName = 'Region1'
          mmHeight = 8996
          mmLeft = 77523
          mmTop = 0
          mmWidth = 168540
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel4: TppLabel
            UserName = 'Label4'
            AutoSize = False
            Caption = 'Total do Segmento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold, fsItalic]
            Transparent = True
            mmHeight = 3175
            mmLeft = 80434
            mmTop = 2910
            mmWidth = 29369
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc2: TppDBCalc
            UserName = 'DBCalc2'
            BlankWhenZero = True
            DataField = 'VLR_PEN_REAVAL'
            DataPipeline = ppl
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 119856
            mmTop = 2910
            mmWidth = 32544
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc9: TppDBCalc
            UserName = 'DBCalc9'
            BlankWhenZero = True
            DataField = 'VLR_ULT_ANTERIOR'
            DataPipeline = ppl
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 164836
            mmTop = 2910
            mmWidth = 30692
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc10: TppDBCalc
            UserName = 'DBCalc10'
            BlankWhenZero = True
            DataField = 'VLR_ULT_REAVAL'
            DataPipeline = ppl
            DisplayFormat = '#,0.00;-#,0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3175
            mmLeft = 202936
            mmTop = 2910
            mmWidth = 30692
            BandType = 5
            GroupNo = 0
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDIMOVELMESTRE'
      DataPipeline = ppl
      KeepTogether = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'NOME_MESTRE'
          DataPipeline = ppl
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 6085
          mmTop = 0
          mmWidth = 77523
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLabel18: TppLabel
          UserName = 'Label17'
          Caption = 'Total do Imóvel Mestre'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 79640
          mmTop = 529
          mmWidth = 33867
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          BlankWhenZero = True
          DataField = 'VLR_PEN_REAVAL'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 119856
          mmTop = 529
          mmWidth = 32544
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          BlankWhenZero = True
          DataField = 'VLR_ULT_ANTERIOR'
          DataPipeline = ppl
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
          mmLeft = 164836
          mmTop = 529
          mmWidth = 30692
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          BlankWhenZero = True
          DataField = 'VLR_ULT_REAVAL'
          DataPipeline = ppl
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
          mmLeft = 202936
          mmTop = 529
          mmWidth = 30692
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'IDIMOVEL'
      DataPipeline = ppl
      KeepTogether = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLabel17: TppLabel
          UserName = 'Label2'
          Caption = 'Total do Imóvel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3175
          mmLeft = 79640
          mmTop = 265
          mmWidth = 20108
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          BlankWhenZero = True
          DataField = 'VLR_PEN_REAVAL'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 119856
          mmTop = 529
          mmWidth = 32544
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          BlankWhenZero = True
          DataField = 'VLR_ULT_ANTERIOR'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 164836
          mmTop = 265
          mmWidth = 30692
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          BlankWhenZero = True
          DataField = 'VLR_ULT_REAVAL'
          DataPipeline = ppl
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 202936
          mmTop = 265
          mmWidth = 30692
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object TraCodeModule
      ProgramStream = {
        01060D54726156617250726F6772616D094368696C645479706502110B50726F
        6772616D4E616D6506095661726961626C65730B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365064070726F6365647572652056
        61726961626C65733B0D0A7661720D0A20202073496D6F76656C203A20537472
        696E673B0D0A626567696E0D0A0D0A656E643B0D0A0000}
    end
  end
  object CDSNaoReavalia: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 42
    Top = 128
    Data = {
      497A00009619E0BD01000000180000000300F4020000030000008D0008494449
      4D4F56454C080004000000000009494D4F434F4449474F010049000000010005
      5749445448020002000F000A4453435F494D4F56454C01004900000001000557
      49445448020002007B0002000D44454641554C545F4F52444552020082000100
      00000300044C43494404000100090800000000000000000008A040073130312E
      312E321E45642E2042617263656C6C6F73202D2074657374652076696E696369
      7573000400000000000072401D45642E2042726173696C696E74657270617274
      202D2053616C61203731000400000000001072401D45642E2042726173696C69
      6E74657270617274202D2053616C61203732000400000000002072401D45642E
      2042726173696C696E74657270617274202D2053616C61203733000400000000
      003072401D45642E2042726173696C696E74657270617274202D2053616C6120
      3734000400000000007072401D45642E2042726173696C696E74657270617274
      202D2053616C61203834000400000000008072401D45642E2042726173696C69
      6E74657270617274202D2053616C6120393100040000000000A072401D45642E
      2042726173696C696E74657270617274202D2053616C61203933000000000000
      00B07240073130312E312E321D45642E2042726173696C696E74657270617274
      202D2053616C6120393400040000000000A8A0402E45642E2042726173696C69
      6E74657270617274202D205445535445204E4F564F2052454D454D4252414D45
      4E544F00040000000000D6A0402A45642E2042726173696C696E746572706172
      74202D2074657374652072656D656D6272612038312F383300040000000000D4
      A0402A45642E2042726173696C696E74657270617274202D2074657374652072
      656D656D6272612038322F393200040000000000F493401D45642E2042726173
      696C696E74657270617274202D2056616761203031000400000000000494401D
      45642E2042726173696C696E74657270617274202D2056616761203032000400
      000000000894401D45642E2042726173696C696E74657270617274202D205661
      6761203033000400000000001094401D45642E2042726173696C696E74657270
      617274202D2056616761203034000400000000001494401D45642E2042726173
      696C696E74657270617274202D2056616761203035000400000000002094401D
      45642E2042726173696C696E74657270617274202D2056616761203036000400
      000000003C94401D45642E2042726173696C696E74657270617274202D205661
      6761203037000400000000004894401D45642E2042726173696C696E74657270
      617274202D2056616761203038000400000000007094401D45642E2042726173
      696C696E74657270617274202D2056616761203039000400000000007494401D
      45642E2042726173696C696E74657270617274202D2056616761203130000400
      000000007894401D45642E2042726173696C696E74657270617274202D205661
      6761203131000400000000009494401D45642E2042726173696C696E74657270
      617274202D2056616761203132000400000000009894401D45642E2042726173
      696C696E74657270617274202D205661676120313300040000000000A494401D
      45642E2042726173696C696E74657270617274202D2056616761203134000400
      00000000AC94401D45642E2042726173696C696E74657270617274202D205661
      676120313500040000000000B894401D45642E2042726173696C696E74657270
      617274202D205661676120313600040000000000C494401D45642E2042726173
      696C696E74657270617274202D205661676120313700040000000000E094401D
      45642E2042726173696C696E74657270617274202D2056616761203138000400
      00000000E494401D45642E2042726173696C696E74657270617274202D205661
      676120313900040000000000F494401D45642E2042726173696C696E74657270
      617274202D2056616761203230000400000000000095401D45642E2042726173
      696C696E74657270617274202D2056616761203231000400000000000495401D
      45642E2042726173696C696E74657270617274202D2056616761203232000400
      000000000C95401D45642E2042726173696C696E74657270617274202D205661
      6761203233000400000000002095401D45642E2042726173696C696E74657270
      617274202D2056616761203235000400000000002C95401D45642E2042726173
      696C696E74657270617274202D2056616761203236000400000000003895401D
      45642E2042726173696C696E74657270617274202D2056616761203237000400
      000000003C95401D45642E2042726173696C696E74657270617274202D205661
      6761203238000400000000005095401D45642E2042726173696C696E74657270
      617274202D2056616761203239000400000000005895401D45642E2042726173
      696C696E74657270617274202D2056616761203330000400000000007095401D
      45642E2042726173696C696E74657270617274202D2056616761203331000400
      000000008095401D45642E2042726173696C696E74657270617274202D205661
      6761203332000400000000008C95401D45642E2042726173696C696E74657270
      617274202D205661676120333300040000000000A095401D45642E2042726173
      696C696E74657270617274202D205661676120333400040000000000A495401D
      45642E2042726173696C696E74657270617274202D2056616761203335000400
      00000000B095401D45642E2042726173696C696E74657270617274202D205661
      676120333600040000000000B895401D45642E2042726173696C696E74657270
      617274202D205661676120333700040000000000C495401D45642E2042726173
      696C696E74657270617274202D205661676120333800040000000000C895401D
      45642E2042726173696C696E74657270617274202D2056616761203339000400
      00000000D495401D45642E2042726173696C696E74657270617274202D205661
      676120343000040000000000E095401D45642E2042726173696C696E74657270
      617274202D205661676120343100040000000000F095401D45642E2042726173
      696C696E74657270617274202D205661676120343200040000000000FC95401D
      45642E2042726173696C696E74657270617274202D2056616761203433000400
      000000000896401D45642E2042726173696C696E74657270617274202D205661
      6761203434000400000000001496401D45642E2042726173696C696E74657270
      617274202D2056616761203435000400000000002096401D45642E2042726173
      696C696E74657270617274202D2056616761203436000400000000002496401D
      45642E2042726173696C696E74657270617274202D2056616761203437000400
      000000003096401D45642E2042726173696C696E74657270617274202D205661
      6761203438000400000000003C96401D45642E2042726173696C696E74657270
      617274202D2056616761203439000400000000004896401D45642E2042726173
      696C696E74657270617274202D2056616761203530000400000000006096401D
      45642E2042726173696C696E74657270617274202D2056616761203531000400
      000000003073402345642E2043656E657370202D20312020706176696D656E74
      6F202D20426C6F636F2044000400000000004073402245642E2043656E657370
      202D203520706176696D656E746F202D20626C6F636F20450000000000000000
      7340053230322E312145642E2043656E657370202D203520706176696D656E74
      6F2D20626C6F636F204400040000000000BEA0401E45642E2043656E65737020
      2D2052454D454D4252414D454E544F20362F3700040000000000D07440254564
      2E2043656E657370202D207661676120303232202D20522D38202D203232332E
      31353100040000000000E074402545642E2043656E657370202D207661676120
      303233202D20522D38202D203232332E31353200040000000000207540254564
      2E2043656E657370202D207661676120303234202D20522D38202D203232332E
      313533000400000000004075402545642E2043656E657370202D207661676120
      303235202D20522D38202D203232332E31353400040000000000507540254564
      2E2043656E657370202D207661676120303236202D20522D38202D203232332E
      313535000400000000006075402545642E2043656E657370202D207661676120
      303237202D20522D38202D203232332E31353600040000000000107440254564
      2E2043656E657370202D207661676120303535202D20522D32202D203232332E
      313432000400000000002074402545642E2043656E657370202D207661676120
      303536202D20522D32202D203232332E31343300040000000000607340254564
      2E2043656E657370202D207661676120303537202D20522D31202D203232332E
      313334000400000000003074402545642E2043656E657370202D207661676120
      303537202D20522D32202D203232332E31343400040000000000807340254564
      2E2043656E657370202D207661676120303538202D20522D31202D203232332E
      313335000400000000004074402545642E2043656E657370202D207661676120
      303538202D20522D32202D203232332E31343500040000000000907340254564
      2E2043656E657370202D207661676120303539202D20522D31202D203232332E
      313336000400000000005074402545642E2043656E657370202D207661676120
      303539202D20522D32202D203232332E31343600040000000000A07340254564
      2E2043656E657370202D207661676120303630202D20522D31202D203232332E
      313337000400000000006074402545642E2043656E657370202D207661676120
      303630202D20522D32202D203232332E31343700040000000000B07340254564
      2E2043656E657370202D2076616761203036312D2020522D31202D203232332E
      313338000400000000007074402545642E2043656E657370202D207661676120
      303631202D20522D32202D203232332E31343800040000000000D07340254564
      2E2043656E657370202D207661676120303632202D20522D31202D203232332E
      31333900040000000000A074402545642E2043656E657370202D207661676120
      303632202D20522D32202D203232332E31343900040000000000F07340254564
      2E2043656E657370202D207661676120303633202D20522D31202D203232332E
      31343000040000000000C074402545642E2043656E657370202D207661676120
      303633202D20522D32202D203232332E31353000040000000000007440254564
      2E2043656E657370202D207661676120303634202D20522D31202D203232332E
      31343100040000000000A076402545642E2043656E657370202D207661676120
      303634202D20522D32202D203232332E31373000040000000000B07640254564
      2E2043656E657370202D207661676120303635202D20522D32202D203232332E
      31373100040000000000C076402545642E2043656E657370202D207661676120
      303636202D20522D32202D203232332E31373200040000000000807540254564
      2E2043656E657370202D207661676120303636202D20522D38202D203232332E
      31353700040000000000D076402545642E2043656E657370202D207661676120
      303637202D20522D32202D203232332E31373300040000000000907540254564
      2E2043656E657370202D207661676120303637202D20522D38202D203232332E
      31353800040000000000E076402545642E2043656E657370202D207661676120
      303638202D20522D32202D203232332E31373400040000000000A07540254564
      2E2043656E657370202D207661676120303638202D20522D38202D203232332E
      31353900040000000000F076402545642E2043656E657370202D207661676120
      303639202D20522D32202D203232332E31373500040000000000B07540254564
      2E2043656E657370202D207661676120303639202D20522D38202D203232332E
      313630000400000000000077402545642E2043656E657370202D207661676120
      303730202D20522D32202D203232332E31373600040000000000C07540254564
      2E2043656E657370202D207661676120303730202D20522D38202D203232332E
      313631000400000000001077402545642E2043656E657370202D207661676120
      303731202D20522D32202D203232332E31373700040000000000407740254564
      2E2043656E657370202D207661676120303731202D20522D38202D203232332E
      313830000400000000002077402545642E2043656E657370202D207661676120
      303732202D20522D32202D203232332E31373800040000000000507740254564
      2E2043656E657370202D207661676120303732202D20522D38202D203232332E
      313831000400000000003077402545642E2043656E657370202D207661676120
      303733202D20522D32202D203232332E31373900040000000000607740254564
      2E2043656E657370202D207661676120303733202D20522D38202D203232332E
      31383200040000000000E077402545642E2043656E657370202D207661676120
      303734202D20522D32202D203232332E31393000040000000000707740254564
      2E2043656E657370202D207661676120303734202D20522D38202D203232332E
      31383300040000000000F077402545642E2043656E657370202D207661676120
      303735202D20522D32202D203232332E31393100040000000000807740254564
      2E2043656E657370202D207661676120303735202D20522D38202D203232332E
      313834000400000000000078402545642E2043656E657370202D207661676120
      303736202D20522D32202D203232332E31393200040000000000907740254564
      2E2043656E657370202D207661676120303736202D20522D38202D203232332E
      313835000400000000001078402545642E2043656E657370202D207661676120
      303737202D20522D32202D203232332E31393300040000000000A07740254564
      2E2043656E657370202D207661676120303737202D20522D38202D203232332E
      313836000400000000002078402545642E2043656E657370202D207661676120
      303738202D20522D32202D203232332E31393400040000000000B07740254564
      2E2043656E657370202D207661676120303738202D20522D38202D203232332E
      313837000400000000003078402545642E2043656E657370202D207661676120
      303739202D20522D32202D203232332E31393500040000000000C07740254564
      2E2043656E657370202D207661676120303739202D20522D38202D203232332E
      313838000400000000004078402545642E2043656E657370202D207661676120
      303830202D20522D32202D203232332E31393600040000000000507840254564
      2E2043656E657370202D207661676120303831202D20522D32202D203232332E
      313937000400000000006078402545642E2043656E657370202D207661676120
      303832202D20522D32202D203232332E31393800040000000000807840254564
      2E2043656E657370202D207661676120303833202D20522D32202D203232332E
      313939000400000000009078402545642E2043656E657370202D207661676120
      303834202D20522D32202D203232332E32303000040000000000A07840254564
      2E2043656E657370202D207661676120303835202D20522D32202D203232332E
      32303100040000000000B078402545642E2043656E657370202D207661676120
      303836202D20522D32202D203232332E32303200040000000000407D40254564
      2E2043656E657370202D207661676120313030202D20522D39202D203138382E
      30333600040000000000507D402545642E2043656E657370202D207661676120
      313031202D20522D39202D203138382E30333700040000000000607D40254564
      2E2043656E657370202D207661676120313032202D20522D39202D203138382E
      30333800040000000000707D402645642E2043656E657370202D207661676120
      313033202D20522D2039202D203138382E30333900040000000000D077402545
      642E2043656E657370202D207661676120313136202D20522D38202D20323233
      2E313839000400000000001079402545642E2043656E657370202D2076616761
      20313137202D20522D38202D203232332E323038000400000000002079402545
      642E2043656E657370202D207661676120313138202D20522D38202D20323233
      2E323039000400000000003079402545642E2043656E657370202D2076616761
      20313139202D20522D38202D203232332E323130000400000000004079402545
      642E2043656E657370202D207661676120313230202D20522D38202D20323233
      2E323131000400000000005079402545642E2043656E657370202D2076616761
      20313231202D20522D38202D203232332E323132000400000000006079402545
      642E2043656E657370202D207661676120313232202D20522D38202D20323233
      2E323133000400000000007079402545642E2043656E657370202D2076616761
      20313233202D20522D38202D203232332E323134000400000000008079402545
      642E2043656E657370202D207661676120313234202D20522D38202D20323233
      2E323135000400000000009079402545642E2043656E657370202D2076616761
      20313235202D20522D38202D203232332E32313600040000000000A079402545
      642E2043656E657370202D207661676120313236202D20522D38202D20323233
      2E323137000400000000004083402645642E2043656E657370202D2076616761
      20313439202D20426C2E4A202D203233362E3539330004000000000048834026
      45642E2043656E657370202D207661676120313530202D20426C2E4A202D2032
      33362E353934000400000000005083402645642E2043656E657370202D207661
      676120313531202D20426C2E4A202D203233362E353935000400000000005883
      402645642E2043656E657370202D207661676120313532202D20426C2E4A202D
      203233362E353936000400000000006083402645642E2043656E657370202D20
      7661676120313533202D20426C2E4A202D203233362E35393700040000000000
      6883402645642E2043656E657370202D207661676120313534202D20426C2E4A
      202D203233362E353938000400000000007083402645642E2043656E65737020
      2D207661676120313535202D20426C2E4A202D203233362E3539390004000000
      0000807D402645642E2043656E657370202D207661676120313731202D20426C
      2E4A202D203233362E33353700040000000000A07D402645642E2043656E6573
      70202D207661676120313732202D20426C2E4A202D203233362E333538000400
      000000007883402645642E2043656E657370202D207661676120313732202D20
      426C2E4A202D203233362E36313600040000000000B07D402645642E2043656E
      657370202D207661676120313733202D20426C2E4A202D203233362E33353900
      0400000000008083402645642E2043656E657370202D20766167612031373320
      2D20426C2E4A202D203233362E36313700040000000000C07D402645642E2043
      656E657370202D207661676120313734202D20426C2E4A202D203233362E3336
      30000400000000008883402645642E2043656E657370202D2076616761203137
      34202D20426C2E4A202D203233362E36313800040000000000D07D402645642E
      2043656E657370202D207661676120313735202D20426C2E4A202D203233362E
      333631000400000000009083402645642E2043656E657370202D207661676120
      313735202D20426C2E4A202D203233362E36313900040000000000D075402545
      642E2043656E657370202D207661676120313737202D20522D31202D20323233
      2E31363200040000000000E075402545642E2043656E657370202D2076616761
      20313738202D20522D31202D203232332E313633000400000000000076402545
      642E2043656E657370202D207661676120313739202D20522D31202D20323233
      2E313634000400000000002076402545642E2043656E657370202D2076616761
      20313830202D20522D31202D203232332E313635000400000000003076402545
      642E2043656E657370202D207661676120313831202D20522D31202D20323233
      2E313636000400000000006076402545642E2043656E657370202D2076616761
      20313832202D20522D31202D203232332E313637000400000000008076402545
      642E2043656E657370202D207661676120313833202D20522D31202D20323233
      2E313638000400000000009076402545642E2043656E657370202D2076616761
      20313834202D20522D31202D203232332E31363900040000000000E07D402645
      642E2043656E657370202D207661676120313936202D20426C2E4A202D203233
      362E33363900040000000000F07D402645642E2043656E657370202D20766167
      6120313937202D20426C2E4A202D203233362E33373000040000000000007E40
      2645642E2043656E657370202D207661676120313938202D20426C2E4A202D20
      3233362E33373100040000000000107E402645642E2043656E657370202D2076
      61676120313939202D20426C2E4A202D203233362E3337320004000000000020
      7E402645642E2043656E657370202D207661676120323030202D20426C2E4A20
      2D203233362E33373300040000000000307E402645642E2043656E657370202D
      207661676120323031202D20426C2E4A202D203233362E333734000400000000
      00407E402645642E2043656E657370202D207661676120323135202D20426C2E
      4A202D203233362E33373500040000000000507E402645642E2043656E657370
      202D207661676120323136202D20426C2E4A202D203233362E33373600040000
      000000807E402745642E2043656E657370202D207661676120323137202D2042
      6C2E204A202D203233362E33373700040000000000B07E402645642E2043656E
      657370202D207661676120323138202D20426C2E4A202D203233362E33373800
      040000000000C07E402645642E2043656E657370202D20766167612032313920
      2D20426C2E4A202D203233362E33373900040000000000D07E402645642E2043
      656E657370202D207661676120323230202D20426C2E4A202D203233362E3338
      3000040000000000E07E402645642E2043656E657370202D2076616761203232
      31202D20426C2E4A202D203233362E33383100040000000000F07E402645642E
      2043656E657370202D207661676120323232202D20426C2E4A202D203233362E
      33383200040000000000007F402645642E2043656E657370202D207661676120
      323233202D20426C2E4A202D203233362E33383300040000000000407F402645
      642E2043656E657370202D207661676120323234202D20426C2E4A202D203233
      362E33383400040000000000507F402645642E2043656E657370202D20766167
      6120323235202D20426C2E4A202D203233362E33383500040000000000B07F40
      2645642E2043656E657370202D207661676120323236202D20426C2E4A202D20
      3233362E33383600040000000000C07F402645642E2043656E657370202D2076
      61676120323237202D20426C2E4A202D203233362E33383700040000000000C0
      78402545642E2043656E657370202D207661676120323331202D20522D32202D
      203232332E32303300040000000000D078402545642E2043656E657370202D20
      7661676120323332202D20522D32202D203232332E32303400040000000000E0
      78402545642E2043656E657370202D207661676120323333202D20522D32202D
      203232332E32303500040000000000F078402545642E2043656E657370202D20
      7661676120323334202D20522D32202D203232332E3230360004000000000000
      79402545642E2043656E657370202D207661676120323335202D20522D32202D
      203232332E32303700040000000000D07F402645642E2043656E657370202D20
      7661676120323431202D20426C2E4A202D203233362E33383800040000000000
      E07F402645642E2043656E657370202D207661676120323432202D20426C2E4A
      202D203233362E33383900040000000000F07F402645642E2043656E65737020
      2D207661676120323433202D20426C2E4A202D203233362E3339300004000000
      00000080402645642E2043656E657370202D207661676120323434202D20426C
      2E4A202D203233362E333931000400000000000880402645642E2043656E6573
      70202D207661676120323435202D20426C2E4A202D203233362E333932000400
      000000001080402645642E2043656E657370202D207661676120323436202D20
      426C2E4A202D203233362E333933000400000000001880402645642E2043656E
      657370202D207661676120323437202D20426C2E4A202D203233362E33393400
      0400000000002880402645642E2043656E657370202D20766167612032343820
      2D20426C2E4A202D203233362E333935000400000000003080402645642E2043
      656E657370202D207661676120323439202D20426C2E4A202D203233362E3339
      36000400000000003880402645642E2043656E657370202D2076616761203235
      30202D20426C2E4A202D203233362E333937000400000000004080402645642E
      2043656E657370202D207661676120323531202D20426C2E4A202D203233362E
      333938000400000000004880402645642E2043656E657370202D207661676120
      323532202D20426C2E4A202D203233362E333939000400000000005080402645
      642E2043656E657370202D207661676120323533202D20426C2E4A202D203233
      362E343030000400000000005880402645642E2043656E657370202D20766167
      6120323637202D20426C2E4A202D203233362E34303100040000000000608040
      2745642E2043656E657370202D207661676120323638202D20426C2E4A202D20
      3233362E20343032000400000000006880402645642E2043656E657370202D20
      7661676120323639202D20426C2E4A202D203233362E34303300040000000000
      7080402645642E2043656E657370202D207661676120323730202D20426C2E4A
      202D203233362E343034000400000000007880402645642E2043656E65737020
      2D207661676120323731202D20426C2E4A202D203233362E3430350004000000
      00008080402645642E2043656E657370202D207661676120323732202D20426C
      2E4A202D203233362E343036000400000000008880402645642E2043656E6573
      70202D207661676120323733202D20426C2E4A202D203233362E343037000400
      000000009080402645642E2043656E657370202D207661676120323734202D20
      426C2E4A202D203233362E343038000400000000009880402645642E2043656E
      657370202D207661676120323735202D20426C2E4A202D203233362E34303900
      040000000000A080402645642E2043656E657370202D20766167612032373620
      2D20426C2E4A202D203233362E34313000040000000000A880402645642E2043
      656E657370202D207661676120323737202D20426C2E4A202D203233362E3431
      3100040000000000B080402645642E2043656E657370202D2076616761203237
      38202D20426C2E4A202D203233362E34313200040000000000B880402645642E
      2043656E657370202D207661676120323739202D20426C2E4A202D203233362E
      34313300040000000000507B402445642E2043656E657370202D207661676120
      3238202D20522D38202D203139332E37343300040000000000C079402545642E
      2043656E657370202D207661676120323835202D20522D31202D203139332E37
      313800040000000000907B402545642E2043656E657370202D20766167612032
      3835202D20522D34202D203138372E36313200040000000000D079402545642E
      2043656E657370202D207661676120323836202D20522D31202D203139332E37
      313900040000000000A07B402545642E2043656E657370202D20766167612032
      3836202D20522D34202D203138372E36313300040000000000E079402545642E
      2043656E657370202D207661676120323837202D20522D31202D203139332E37
      323000040000000000107B402545642E2043656E657370202D20766167612032
      3837202D20522D32202D203139332E37333900040000000000B07B402545642E
      2043656E657370202D207661676120323837202D20522D34202D203138372E36
      313400040000000000F079402545642E2043656E657370202D20766167612032
      3838202D20522D31202D203139332E37323100040000000000207B402545642E
      2043656E657370202D207661676120323838202D20522D32202D203139332E37
      343000040000000000C07B402545642E2043656E657370202D20766167612032
      3838202D20522D34202D203138372E36313500040000000000007A402545642E
      2043656E657370202D207661676120323839202D20522D31202D203139332E37
      323200040000000000307B402545642E2043656E657370202D20766167612032
      3839202D20522D32202D203139332E37343100040000000000D07B402545642E
      2043656E657370202D207661676120323839202D20522D34202D203138372E36
      313600040000000000607B402445642E2043656E657370202D20766167612032
      39202D20522D38202D203139332E37343400040000000000107A402545642E20
      43656E657370202D207661676120323930202D20522D31202D203139332E3732
      3300040000000000407B402545642E2043656E657370202D2076616761203239
      30202D20522D32202D203139332E37343200040000000000E07B402545642E20
      43656E657370202D207661676120323930202D20522D34202D203138372E3631
      3700040000000000207A402545642E2043656E657370202D2076616761203239
      31202D20522D31202D203139332E37323400040000000000F07B402545642E20
      43656E657370202D207661676120323931202D20522D34202D203138372E3631
      3800040000000000307A402545642E2043656E657370202D2076616761203239
      32202D20522D31202D203139332E37323500040000000000007C402545642E20
      43656E657370202D207661676120323932202D20522D34202D203138372E3631
      3900040000000000C080402745642E2043656E657370202D2076616761203239
      33202D20426C2E204A202D203233362E34313400040000000000407A40254564
      2E2043656E657370202D207661676120323933202D20522D31202D203139332E
      37323600040000000000107C402545642E2043656E657370202D207661676120
      323933202D20522D34202D203138372E36323000040000000000C88040264564
      2E2043656E657370202D207661676120323934202D20426C2E4A202D20323336
      2E34313500040000000000507A402545642E2043656E657370202D2076616761
      20323934202D20522D31202D203139332E37323700040000000000207C402545
      642E2043656E657370202D207661676120323934202D20522D34202D20313837
      2E36323100040000000000D080402645642E2043656E657370202D2076616761
      20323935202D20426C2E4A202D203233362E34313600040000000000607A4025
      45642E2043656E657370202D207661676120323935202D20522D31202D203139
      332E37323800040000000000307C402545642E2043656E657370202D20766167
      6120323935202D20522D34202D203138372E36323200040000000000D8804026
      45642E2043656E657370202D207661676120323936202D20426C2E4A202D2032
      33362E34313700040000000000707A402545642E2043656E657370202D207661
      676120323936202D20522D31202D203139332E37323900040000000000407C40
      2545642E2043656E657370202D207661676120323936202D20522D34202D2031
      38372E36323300040000000000E080402645642E2043656E657370202D207661
      676120323937202D20426C2E4A202D203233362E34313800040000000000807A
      402545642E2043656E657370202D207661676120323937202D20522D31202D20
      3139332E37333000040000000000507C402545642E2043656E657370202D2076
      61676120323937202D20522D34202D203138372E36323400040000000000E880
      402645642E2043656E657370202D207661676120323938202D20426C2E4A202D
      203233362E34313900040000000000907A402545642E2043656E657370202D20
      7661676120323938202D20522D31202D203139332E3733310004000000000060
      7C402545642E2043656E657370202D207661676120323938202D20522D34202D
      203138372E36323500040000000000F080402645642E2043656E657370202D20
      7661676120323939202D20426C2E4A202D203233362E34323000040000000000
      A07A402545642E2043656E657370202D207661676120323939202D20522D3120
      2D203139332E37333200040000000000707C402545642E2043656E657370202D
      207661676120323939202D20522D34202D203138372E36323600040000000000
      707B402445642E2043656E657370202D2076616761203330202D20522D38202D
      203139332E37343500040000000000F880402645642E2043656E657370202D20
      7661676120333030202D20426C2E4A202D203233362E34323100040000000000
      B07A402545642E2043656E657370202D207661676120333030202D20522D3120
      2D203139332E37333300040000000000807C402545642E2043656E657370202D
      207661676120333030202D20522D34202D203138372E36323700040000000000
      0081402645642E2043656E657370202D207661676120333031202D20424C2E4A
      202D203233362E34323200040000000000C07A402545642E2043656E65737020
      2D207661676120333031202D20522D31202D203139332E373334000400000000
      00907C402545642E2043656E657370202D207661676120333031202D20522D34
      202D203138372E363238000400000000000881402645642E2043656E65737020
      2D207661676120333032202D20426C2E4A202D203233362E3432330004000000
      0000D07A402545642E2043656E657370202D207661676120333032202D20522D
      31202D203139332E37333500040000000000A07C402545642E2043656E657370
      202D207661676120333032202D20522D34202D203138372E3632390004000000
      00001081402645642E2043656E657370202D207661676120333033202D20426C
      2E4A202D203233362E34323400040000000000E07A402545642E2043656E6573
      70202D207661676120333033202D20522D31202D203139332E37333600040000
      000000B07C402545642E2043656E657370202D207661676120333033202D2052
      2D34202D203138372E363330000400000000001881402645642E2043656E6573
      70202D207661676120333034202D20426C2E4A202D203233362E343235000400
      00000000F07A402545642E2043656E657370202D207661676120333034202D20
      522D31202D203139332E37333700040000000000C07C402545642E2043656E65
      7370202D207661676120333034202D20522D34202D203138372E363331000400
      000000002081402645642E2043656E657370202D207661676120333035202D20
      426C2E4A202D203233362E34323600040000000000007B402545642E2043656E
      657370202D207661676120333035202D20522D31202D203139332E3733380004
      0000000000D07C402545642E2043656E657370202D207661676120333035202D
      20522D34202D203138372E363332000400000000002881402445642E2043656E
      657370202D207661676120333139202D20426C2E4A203233362E343237000400
      000000003081402645642E2043656E657370202D207661676120333230202D20
      426C2E4A202D203233362E343238000400000000003881402445642E2043656E
      657370202D207661676120333231202D20426C2E4A203233362E343239000400
      000000004081402445642E2043656E657370202D207661676120333232202D20
      426C2E4A203233362E343330000400000000004881402645642E2043656E6573
      70202D207661676120333233202D20426C2E4A202D203233362E343331000400
      000000005081402745642E2043656E657370202D207661676120333234202D20
      426C2E4A202D20203233362E343332000400000000005881402645642E204365
      6E657370202D207661676120333235202D20426C2E4A202D203233362E343333
      000400000000006081402645642E2043656E657370202D207661676120333236
      202D20426C2E4A202D203233362E343334000400000000007081402645642E20
      43656E657370202D207661676120333237202D20426C2E4A202D203233362E34
      3335000400000000007881402645642E2043656E657370202D20766167612033
      3238202D20426C2E4A202D203233362E34333600040000000000808140264564
      2E2043656E657370202D207661676120333239202D20426C2E4A202D20323336
      2E343337000400000000008881402645642E2043656E657370202D2076616761
      20333330202D20426C2E4A202D203233362E3433380004000000000090814026
      45642E2043656E657370202D207661676120333331202D20426C2E4A202D2032
      33362E343339000400000000009881402645642E2043656E657370202D207661
      676120333435202D20426C2E4A202D203233362E34343000040000000000A081
      402645642E2043656E657370202D207661676120333436202D20426C2E4A202D
      203233362E34343100040000000000A881402645642E2043656E657370202D20
      7661676120333437202D20426C2E4A202D203233362E34343200040000000000
      B081402645642E2043656E657370202D207661676120333438202D20426C2E4A
      202D203233362E34343300040000000000B881402645642E2043656E65737020
      2D207661676120333439202D20426C2E4A202D203233362E3434340004000000
      0000C081402645642E2043656E657370202D207661676120333530202D20426C
      2E4A202D203233362E34343500040000000000C881402645642E2043656E6573
      70202D207661676120333531202D20426C2E4A202D203233362E343436000400
      00000000D081402645642E2043656E657370202D207661676120333532202D20
      426C2E4A202D203233362E34343700040000000000D881402645642E2043656E
      657370202D207661676120343635202D20426C2E4A202D203233362E35333300
      040000000000E081402645642E2043656E657370202D20766167612034363620
      2D20426C2E4A202D203233362E35333400040000000000E881402645642E2043
      656E657370202D207661676120343637202D20426C2E4A202D203233362E3533
      3500040000000000F081402645642E2043656E657370202D2076616761203436
      38202D20426C2E4A202D203233362E35333600040000000000F881402645642E
      2043656E657370202D207661676120343639202D20426C2E4A202D203233362E
      353337000400000000000082402645642E2043656E657370202D207661676120
      343730202D20426C2E4A202D203233362E353338000400000000000882402745
      642E2043656E657370202D207661676120343731202D20426C2E4A202D203233
      362E35333920000400000000001082402645642E2043656E657370202D207661
      676120343732202D20426C2E4A202D203233362E353430000400000000001882
      402645642E2043656E657370202D207661676120343733202D20426C2E4A202D
      203233362E353431000400000000002082402645642E2043656E657370202D20
      7661676120343734202D20426C2E4A202D203233362E35343200040000000000
      2882402645642E2043656E657370202D207661676120343735202D20426C2E4A
      202D203233362E353433000400000000003082402645642E2043656E65737020
      2D207661676120343736202D20426C2E4A202D203233362E3534340004000000
      00003882402645642E2043656E657370202D207661676120343737202D20426C
      2E4A202D203233362E353435000400000000004082402645642E2043656E6573
      70202D207661676120343738202D20426C2E4A202D203233362E353436000400
      000000004882402645642E2043656E657370202D207661676120343739202D20
      426C2E4A202D203233362E353437000400000000005082402645642E2043656E
      657370202D207661676120343830202D20426C2E4A202D203233362E35343800
      0400000000006082402645642E2043656E657370202D20766167612034383120
      2D20426C2E4A202D203233362E353439000400000000006882402645642E2043
      656E657370202D207661676120343832202D20426C2E4A202D203233362E3535
      30000400000000007082402645642E2043656E657370202D2076616761203438
      33202D20426C2E4A202D203233362E353531000400000000007882402645642E
      2043656E657370202D207661676120343834202D20426C2E4A202D203233362E
      353532000400000000008082402645642E2043656E657370202D207661676120
      343835202D20426C2E4A202D203233362E353533000400000000008882402645
      642E2043656E657370202D207661676120343836202D20426C2E4A202D203233
      362E353534000400000000009082402645642E2043656E657370202D20766167
      6120343837202D20426C2E4A202D203233362E35353500040000000000988240
      2645642E2043656E657370202D207661676120343838202D20426C2E4A202D20
      3233362E35353600040000000000A082402645642E2043656E657370202D2076
      61676120343839202D20426C2E4A202D203233362E35353700040000000000A8
      82402645642E2043656E657370202D207661676120343930202D20426C2E4A20
      2D203233362E35353800040000000000B082402645642E2043656E657370202D
      207661676120343931202D20426C2E4A202D203233362E353539000400000000
      00C082402645642E2043656E657370202D207661676120343932202D20426C2E
      4A202D203233362E35363000040000000000C882402645642E2043656E657370
      202D207661676120343933202D20426C2E4A202D203233362E35363100040000
      000000D082402645642E2043656E657370202D207661676120343934202D2042
      6C2E4A202D203233362E35363200040000000000E882402645642E2043656E65
      7370202D207661676120343935202D20426C2E4A202D203233362E3536330004
      0000000000F082402645642E2043656E657370202D207661676120343936202D
      20426C2E4A202D203233362E35363400040000000000F882402645642E204365
      6E657370202D207661676120343937202D20426C2E4A202D203233362E353635
      000400000000000883402645642E2043656E657370202D207661676120343938
      202D20426C2E4A202D203233362E353636000400000000001083402645642E20
      43656E657370202D207661676120343939202D20426C2E4A202D203233362E35
      3637000400000000001883402645642E2043656E657370202D20766167612035
      3030202D20426C2E4A202D203233362E35363800040000000000208340264564
      2E2043656E657370202D207661676120353031202D20426C2E4A202D20323336
      2E353639000400000000002883402645642E2043656E657370202D2076616761
      20353032202D20426C2E4A202D203233362E3537300004000000000030834026
      45642E2043656E657370202D207661676120353033202D20426C2E4A202D2032
      33362E353731000400000000003883402445642E2043656E657370202D207661
      676120353034202D20426C2E4A203233363B35373200040000000000E07C4024
      45642E2043656E657370202D2076616761203937202D20522D39202D20313838
      2E30333300040000000000107D402445642E2043656E657370202D2076616761
      203938202D20522D39202D203138382E30333400040000000000307D40244564
      2E2043656E657370202D2076616761203939202D20522D39202D203138382E30
      333500040000000000AEA0403345642E2043656E74726F20456D707265732E20
      5661726967202D205445535445204E4F564F2052454D454D4252414D454E544F
      000400000000006089402F45642E2043656E74726F20456D707265732E205661
      726967202D20556E6964616465203230322F20426C6F636F2042000400000000
      006889403045642E2043656E74726F20456D707265732E205661726967202D20
      556E696461646520333032202F20626C6F636F2042000400000000007889402F
      45642E2043656E74726F20456D707265732E205661726967202D20556E696461
      6465203430322020426C6F636F2042000400000000008889402E45642E204365
      6E74726F20456D707265732E205661726967202D20556E696461646520353032
      20426C6F636F2042000400000000001098402245642E2043656E74726F20456D
      707265732E205661726967202D20566167612030310004000000000018984022
      45642E2043656E74726F20456D707265732E205661726967202D205661676120
      3032000400000000002098402245642E2043656E74726F20456D707265732E20
      5661726967202D2056616761203033000400000000002898402245642E204365
      6E74726F20456D707265732E205661726967202D205661676120303400040000
      0000003098402245642E2043656E74726F20456D707265732E20566172696720
      2D2056616761203035000400000000003498402245642E2043656E74726F2045
      6D707265732E205661726967202D2056616761203036000400000000003C9840
      2245642E2043656E74726F20456D707265732E205661726967202D2056616761
      203037000400000000004498402245642E2043656E74726F20456D707265732E
      205661726967202D2056616761203038000400000000004C98402245642E2043
      656E74726F20456D707265732E205661726967202D2056616761203039000400
      000000005498402245642E2043656E74726F20456D707265732E205661726967
      202D2056616761203130000400000000005C98402245642E2043656E74726F20
      456D707265732E205661726967202D2056616761203131000400000000006098
      402245642E2043656E74726F20456D707265732E205661726967202D20566167
      61203132000400000000006898402245642E2043656E74726F20456D70726573
      2E205661726967202D2056616761203133000400000000007098402245642E20
      43656E74726F20456D707265732E205661726967202D20566167612031340004
      00000000007898402245642E2043656E74726F20456D707265732E2056617269
      67202D2056616761203135000400000000007C98402245642E2043656E74726F
      20456D707265732E205661726967202D20566167612031360004000000000080
      98402245642E2043656E74726F20456D707265732E205661726967202D205661
      6761203137000400000000008498402245642E2043656E74726F20456D707265
      732E205661726967202D2056616761203138000400000000008898402245642E
      2043656E74726F20456D707265732E205661726967202D205661676120313900
      0400000000008C98402245642E2043656E74726F20456D707265732E20566172
      6967202D2056616761203230000400000000009498402245642E2043656E7472
      6F20456D707265732E205661726967202D205661676120323100040000000000
      9C98402245642E2043656E74726F20456D707265732E205661726967202D2056
      61676120323200040000000000A498402245642E2043656E74726F20456D7072
      65732E205661726967202D205661676120323300040000000000AC9840224564
      2E2043656E74726F20456D707265732E205661726967202D2056616761203234
      00040000000000B498402245642E2043656E74726F20456D707265732E205661
      726967202D205661676120323500040000000000D098402245642E2043656E74
      726F20456D707265732E205661726967202D2056616761203236000400000000
      00C098402245642E2043656E74726F20456D707265732E205661726967202D20
      5661676120323700040000000000D498402245642E2043656E74726F20456D70
      7265732E205661726967202D205661676120323800040000000000DC98402245
      642E2043656E74726F20456D707265732E205661726967202D20566167612032
      3900040000000000E498402245642E2043656E74726F20456D707265732E2056
      61726967202D205661676120333000040000000000EC98402245642E2043656E
      74726F20456D707265732E205661726967202D20566167612033310004000000
      00000099402245642E2043656E74726F20456D707265732E205661726967202D
      2056616761203332000400000000000899402245642E2043656E74726F20456D
      707265732E205661726967202D20566167612033330004000000000010994022
      45642E2043656E74726F20456D707265732E205661726967202D205661676120
      3334000400000000001899402245642E2043656E74726F20456D707265732E20
      5661726967202D2056616761203335000400000000002099402245642E204365
      6E74726F20456D707265732E205661726967202D205661676120333600040000
      0000002C99402245642E2043656E74726F20456D707265732E20566172696720
      2D2056616761203337000400000000003499402245642E2043656E74726F2045
      6D707265732E205661726967202D205661676120333800040000000000389940
      2245642E2043656E74726F20456D707265732E205661726967202D2056616761
      203339000400000000004099402245642E2043656E74726F20456D707265732E
      205661726967202D2056616761203430000400000000004899402245642E2043
      656E74726F20456D707265732E205661726967202D2056616761203431000400
      000000005099402245642E2043656E74726F20456D707265732E205661726967
      202D2056616761203432000400000000005899402245642E2043656E74726F20
      456D707265732E205661726967202D2056616761203433000400000000006099
      402245642E2043656E74726F20456D707265732E205661726967202D20566167
      61203434000400000000006899402245642E2043656E74726F20456D70726573
      2E205661726967202D2056616761203435000400000000006C99402245642E20
      43656E74726F20456D707265732E205661726967202D20566167612034360004
      00000000007499402245642E2043656E74726F20456D707265732E2056617269
      67202D2056616761203437000400000000007C99402245642E2043656E74726F
      20456D707265732E205661726967202D20566167612034380004000000000080
      99402245642E2043656E74726F20456D707265732E205661726967202D205661
      6761203439000400000000008899402245642E2043656E74726F20456D707265
      732E205661726967202D2056616761203530000400000000009499402245642E
      2043656E74726F20456D707265732E205661726967202D205661676120353100
      0400000000009C99402245642E2043656E74726F20456D707265732E20566172
      6967202D205661676120353200040000000000A099402245642E2043656E7472
      6F20456D707265732E205661726967202D205661676120353300040000000000
      A899402245642E2043656E74726F20456D707265732E205661726967202D2056
      61676120353400040000000000AC99402245642E2043656E74726F20456D7072
      65732E205661726967202D205661676120353500040000000000B49940224564
      2E2043656E74726F20456D707265732E205661726967202D2056616761203536
      000400000000008049401745642E20436964616465204C757A202D204C6F6A61
      203300000000000000A88440073131312E342E351A45642E2049617361204949
      202D20313820706176696D656E746F000400000000003071401745642E204A75
      7275626174756261202D2047616C70616F000400000000007071402345642E20
      4A757275626174756261202D20506176696D656E746F205375706572696F7200
      0400000000009071401945642E204A757275626174756261202D205365727669
      636F73000400000000004071401745642E204A757275626174756261202D2054
      657272656F00040000000000F883401945642E204D616469736F6E202D203220
      706176696D656E746F000400000000000084401945642E204D616469736F6E20
      2D203320706176696D656E746F000400000000001884401945642E204D616469
      736F6E202D203520706176696D656E746F00040000000000E083401945642E20
      4D616469736F6E202D20436F6E6A756E746F20313100040000000000E883401A
      45642E204D616469736F6E202D20436F6E6A756E746F20313241000400000000
      00F083401A45642E204D616469736F6E202D20436F6E6A756E746F2031324200
      0400000000000884401945642E204D616469736F6E202D20436F6E6A756E746F
      203431000400000000002084401945642E204D616469736F6E202D20436F6E6A
      756E746F203432000400000000002884401945642E204D616469736F6E202D20
      436F6E6A756E746F203631000400000000001084401945642E204D616469736F
      6E202D20436F6E6A756E746F20363200040000000000C883401E45642E204D61
      6469736F6E202D20506176696D656E746F2054657272656F0004000000000050
      94401645642E204D616469736F6E202D20566167612030303100040000000000
      8894401645642E204D616469736F6E202D205661676120303032000400000000
      009094401645642E204D616469736F6E202D2056616761203030330004000000
      0000A894401645642E204D616469736F6E202D20566167612030303400040000
      000000C894401645642E204D616469736F6E202D205661676120303035000400
      00000000D094401645642E204D616469736F6E202D2056616761203030360004
      0000000000D894401645642E204D616469736F6E202D20566167612030303700
      040000000000EC94401645642E204D616469736F6E202D205661676120303038
      00040000000000F894401645642E204D616469736F6E202D2056616761203030
      39000400000000001095401645642E204D616469736F6E202D20566167612030
      3130000400000000001C95401645642E204D616469736F6E202D205661676120
      303131000400000000002895401645642E204D616469736F6E202D2056616761
      20303132000400000000003095401645642E204D616469736F6E202D20566167
      6120303133000400000000003495401645642E204D616469736F6E202D205661
      676120303134000400000000004095401645642E204D616469736F6E202D2056
      61676120303135000400000000006095401645642E204D616469736F6E202D20
      5661676120303136000400000000006895401645642E204D616469736F6E202D
      205661676120303137000400000000007495401645642E204D616469736F6E20
      2D205661676120303138000400000000007C95401645642E204D616469736F6E
      202D205661676120303139000400000000008895401645642E204D616469736F
      6E202D205661676120303230000400000000009095401645642E204D61646973
      6F6E202D205661676120303231000400000000009C95401645642E204D616469
      736F6E202D20566167612030323200040000000000A895401645642E204D6164
      69736F6E202D20566167612030323300040000000000B495401645642E204D61
      6469736F6E202D20566167612030323400040000000000C095401645642E204D
      616469736F6E202D20566167612030323500040000000000D095401645642E20
      4D616469736F6E202D20566167612030323600040000000000D895401645642E
      204D616469736F6E202D20566167612030323700040000000000EC9540164564
      2E204D616469736F6E202D20566167612030323800040000000000F895401645
      642E204D616469736F6E202D2056616761203032390004000000000004964016
      45642E204D616469736F6E202D205661676120303330000400000000000C9640
      1645642E204D616469736F6E202D205661676120303331000400000000001896
      401645642E204D616469736F6E202D205661676120303332000400000000002C
      96401645642E204D616469736F6E202D20566167612030333300040000000000
      3896401645642E204D616469736F6E202D205661676120303334000400000000
      004496401645642E204D616469736F6E202D2056616761203033350004000000
      00005096401645642E204D616469736F6E202D20566167612030333600040000
      0000005C96401645642E204D616469736F6E202D205661676120303337000400
      000000006496401645642E204D616469736F6E202D2056616761203033380004
      00000000006896401645642E204D616469736F6E202D20566167612030333900
      0400000000007096401645642E204D616469736F6E202D205661676120303430
      000400000000007496401645642E204D616469736F6E202D2056616761203034
      31000400000000007896401645642E204D616469736F6E202D20566167612030
      3432000400000000007C96401645642E204D616469736F6E202D205661676120
      303433000400000000008096401645642E204D616469736F6E202D2056616761
      20303434000400000000008496401645642E204D616469736F6E202D20566167
      6120303435000400000000008C96401645642E204D616469736F6E202D205661
      676120303436000400000000009496401645642E204D616469736F6E202D2056
      61676120303437000400000000009C96401645642E204D616469736F6E202D20
      566167612030343800040000000000A096401645642E204D616469736F6E202D
      20566167612030343900040000000000A896401645642E204D616469736F6E20
      2D20566167612030353000040000000000B096401645642E204D616469736F6E
      202D20566167612030353100040000000000BC96401645642E204D616469736F
      6E202D20566167612030353200040000000000C096401645642E204D61646973
      6F6E202D20566167612030353300040000000000C896401645642E204D616469
      736F6E202D20566167612030353400040000000000CC96401645642E204D6164
      69736F6E202D20566167612030353500040000000000D496401645642E204D61
      6469736F6E202D20566167612030353600040000000000DC96401645642E204D
      616469736F6E202D20566167612030353700040000000000E896401645642E20
      4D616469736F6E202D20566167612030353800040000000000F096401645642E
      204D616469736F6E202D20566167612030353900040000000000FC9640164564
      2E204D616469736F6E202D205661676120303630000400000000000897401645
      642E204D616469736F6E202D2056616761203036310004000000000014974016
      45642E204D616469736F6E202D205661676120303632000400000000001C9740
      1645642E204D616469736F6E202D205661676120303633000400000000002897
      401645642E204D616469736F6E202D2056616761203036340004000000000034
      97401645642E204D616469736F6E202D20566167612030363500040000000000
      4097401645642E204D616469736F6E202D205661676120303636000400000000
      005097401645642E204D616469736F6E202D2056616761203036370004000000
      00005C97401645642E204D616469736F6E202D20566167612030363800040000
      0000006897401645642E204D616469736F6E202D205661676120303639000400
      000000007497401645642E204D616469736F6E202D2056616761203037300004
      00000000007C97401645642E204D616469736F6E202D20566167612030373100
      0400000000008097401645642E204D616469736F6E202D205661676120303732
      000400000000008897401645642E204D616469736F6E202D2056616761203037
      33000400000000009097401645642E204D616469736F6E202D20566167612030
      3734000400000000009497401645642E204D616469736F6E202D205661676120
      303735000400000000009C97401645642E204D616469736F6E202D2056616761
      2030373600040000000000A097401645642E204D616469736F6E202D20566167
      612030373700040000000000A897401645642E204D616469736F6E202D205661
      67612030373800040000000000B097401645642E204D616469736F6E202D2056
      6167612030373900040000000000BC97401645642E204D616469736F6E202D20
      566167612030383000040000000000C497401645642E204D616469736F6E202D
      20566167612030383100040000000000CC97401645642E204D616469736F6E20
      2D20566167612030383200040000000000D497401645642E204D616469736F6E
      202D20566167612030383300040000000000DC97401645642E204D616469736F
      6E202D20566167612030383400040000000000E497401645642E204D61646973
      6F6E202D20566167612030383500040000000000EC97401645642E204D616469
      736F6E202D20566167612030383600040000000000F897401645642E204D6164
      69736F6E202D20566167612030383700040000000000FC97401645642E204D61
      6469736F6E202D205661676120303838000400000000000498401645642E204D
      616469736F6E202D205661676120303839000400000000000C98401645642E20
      4D616469736F6E202D205661676120303930000400000000001498401645642E
      204D616469736F6E202D205661676120303931000400000000001C9840164564
      2E204D616469736F6E202D205661676120303932000400000000002498401645
      642E204D616469736F6E202D205661676120303933000400000000002C984016
      45642E204D616469736F6E202D20566167612030393400040000000000389840
      1645642E204D616469736F6E202D205661676120303935000400000000004098
      401645642E204D616469736F6E202D2056616761203039360004000000000048
      98401645642E204D616469736F6E202D20566167612030393700040000000000
      5098401645642E204D616469736F6E202D205661676120303938000400000000
      005898401645642E204D616469736F6E202D2056616761203039390004000000
      00006498401645642E204D616469736F6E202D20566167612031303000040000
      0000006C98401645642E204D616469736F6E202D205661676120313031000400
      000000009098401645642E204D616469736F6E202D2056616761203130320004
      00000000009898401645642E204D616469736F6E202D20566167612031303300
      040000000000A098401645642E204D616469736F6E202D205661676120313034
      00040000000000A898401645642E204D616469736F6E202D2056616761203130
      3500040000000000B098401645642E204D616469736F6E202D20566167612031
      303600040000000000B898401645642E204D616469736F6E202D205661676120
      31303700040000000000BC98401645642E204D616469736F6E202D2056616761
      2031303800040000000000C898401645642E204D616469736F6E202D20566167
      612031303900040000000000CC98401645642E204D616469736F6E202D205661
      67612031313000040000000000D898401645642E204D616469736F6E202D2056
      6167612031313100040000000000E098401645642E204D616469736F6E202D20
      566167612031313200040000000000E898401645642E204D616469736F6E202D
      20566167612031313300040000000000F098401645642E204D616469736F6E20
      2D20566167612031313400040000000000F898401645642E204D616469736F6E
      202D20566167612031313500040000000000FC98401645642E204D616469736F
      6E202D205661676120313136000400000000000499401645642E204D61646973
      6F6E202D205661676120313137000400000000000C99401645642E204D616469
      736F6E202D205661676120313138000400000000001499401645642E204D6164
      69736F6E202D205661676120313139000400000000001C99401645642E204D61
      6469736F6E202D205661676120313230000400000000002499401645642E204D
      616469736F6E202D205661676120313231000400000000003C99401645642E20
      4D616469736F6E202D205661676120313232000400000000002899401645642E
      204D616469736F6E202D20566167612031323300040000000000449940164564
      2E204D616469736F6E202D205661676120313234000400000000004C99401645
      642E204D616469736F6E202D2056616761203132350004000000000054994016
      45642E204D616469736F6E202D205661676120313236000400000000005C9940
      1645642E204D616469736F6E202D205661676120313237000400000000006499
      401645642E204D616469736F6E202D2056616761203132380004000000000070
      99401645642E204D616469736F6E202D20566167612031323900040000000000
      7899401645642E204D616469736F6E202D205661676120313330000400000000
      008499401645642E204D616469736F6E202D2056616761203133310004000000
      00008C99401645642E204D616469736F6E202D20566167612031333200040000
      0000009099401645642E204D616469736F6E202D205661676120313333000400
      000000009899401645642E204D616469736F6E202D2056616761203133340004
      0000000000A499401645642E204D616469736F6E202D20566167612031333500
      040000000000B099401645642E204D616469736F6E202D205661676120313336
      00040000000000B899401645642E204D616469736F6E202D2056616761203133
      3700040000000000C099401645642E204D616469736F6E202D20566167612031
      333800040000000000C499401645642E204D616469736F6E202D205661676120
      31333900040000000000C899401645642E204D616469736F6E202D2056616761
      2031343000040000000000CC99401645642E204D616469736F6E202D20566167
      612031343100040000000000D099401645642E204D616469736F6E202D205661
      67612031343200040000000000DC99401645642E204D616469736F6E202D2056
      6167612031343300040000000000D499401645642E204D616469736F6E202D20
      566167612031343400040000000000E499401645642E204D616469736F6E202D
      20566167612031343500040000000000EC99401645642E204D616469736F6E20
      2D20566167612031343600040000000000F499401645642E204D616469736F6E
      202D20566167612031343700040000000000FC99401645642E204D616469736F
      6E202D20566167612031343800040000000000049A401645642E204D61646973
      6F6E202D205661676120313439000400000000000C9A401645642E204D616469
      736F6E202D20566167612031353000040000000000149A401645642E204D6164
      69736F6E202D20566167612031353100040000000000209A401645642E204D61
      6469736F6E202D20566167612031353200040000000000289A401645642E204D
      616469736F6E202D20566167612031353300040000000000309A401645642E20
      4D616469736F6E202D20566167612031353400040000000000389A401645642E
      204D616469736F6E202D20566167612031353500040000000000449A40164564
      2E204D616469736F6E202D205661676120313536000400000000004C9A401645
      642E204D616469736F6E202D20566167612031353700040000000000549A4016
      45642E204D616469736F6E202D205661676120313538000400000000005C9A40
      1645642E204D616469736F6E202D20566167612031353900040000000000649A
      401645642E204D616469736F6E202D2056616761203136300004000000000070
      9A401645642E204D616469736F6E202D20566167612031363100040000000000
      789A401645642E204D616469736F6E202D205661676120313632000400000000
      00809A401645642E204D616469736F6E202D2056616761203136330004000000
      00008C9A401645642E204D616469736F6E202D20566167612031363400040000
      000000949A401645642E204D616469736F6E202D205661676120313635000400
      00000000A09A401645642E204D616469736F6E202D2056616761203136360004
      0000000000A49A401645642E204D616469736F6E202D20566167612031363700
      040000000000AC9A401645642E204D616469736F6E202D205661676120313638
      00040000000000B49A401645642E204D616469736F6E202D2056616761203136
      3900040000000000BC9A401645642E204D616469736F6E202D20566167612031
      373000040000000000E89B401645642E204D616469736F6E202D205661676120
      31373100040000000000EC9B401645642E204D616469736F6E202D2056616761
      2031373200040000000000F09B401645642E204D616469736F6E202D20566167
      612031373300040000000000F49B401645642E204D616469736F6E202D205661
      67612031373400040000000000F89B401645642E204D616469736F6E202D2056
      6167612031373500040000000000FC9B401645642E204D616469736F6E202D20
      566167612031373600040000000000009C401645642E204D616469736F6E202D
      20566167612031373700040000000000049C401645642E204D616469736F6E20
      2D20566167612031373800040000000000089C401645642E204D616469736F6E
      202D205661676120313739000400000000000C9C401645642E204D616469736F
      6E202D20566167612031383000040000000000109C401645642E204D61646973
      6F6E202D20566167612031383100040000000000149C401645642E204D616469
      736F6E202D20566167612031383200040000000000189C401645642E204D6164
      69736F6E202D205661676120313833000400000000001C9C401645642E204D61
      6469736F6E202D20566167612031383400040000000000209C401645642E204D
      616469736F6E202D20566167612031383500040000000000249C401645642E20
      4D616469736F6E202D20566167612031383600040000000000289C401645642E
      204D616469736F6E202D205661676120313837000400000000002C9C40164564
      2E204D616469736F6E202D20566167612031383800040000000000309C401645
      642E204D616469736F6E202D20566167612031383900040000000000349C4016
      45642E204D616469736F6E202D20566167612031393000040000000000389C40
      1645642E204D616469736F6E202D205661676120313931000400000000003C9C
      401645642E204D616469736F6E202D2056616761203139320004000000000040
      9C401645642E204D616469736F6E202D20566167612031393300040000000000
      489C401645642E204D616469736F6E202D205661676120313934000400000000
      004C9C401645642E204D616469736F6E202D2056616761203139350004000000
      0000549C401645642E204D616469736F6E202D20566167612031393600040000
      000000589C401645642E204D616469736F6E202D205661676120313937000400
      000000005C9C401645642E204D616469736F6E202D2056616761203139380004
      00000000006887401545642E2053656465202D204C6F6A61203137332D410004
      00000000005887401445642E2053656465202D204C6F6A612036302D41000400
      000000005088401445642E2053656465202D2053616C61203130303100040000
      0000005888401445642E2053656465202D2053616C6120313030320004000000
      00006088401445642E2053656465202D2053616C612031303033000400000000
      007087401345642E2053656465202D2053616C61203130310004000000000078
      87401345642E2053656465202D2053616C612031303200040000000000708840
      1445642E2053656465202D2053616C6120313130310004000000000078884014
      45642E2053656465202D2053616C612031313032000400000000008088401445
      642E2053656465202D2053616C61203131303300040000000000888840144564
      2E2053656465202D2053616C612031323031000400000000009088401445642E
      2053656465202D2053616C612031323032000400000000009888401445642E20
      53656465202D2053616C61203132303300040000000000A088401445642E2053
      656465202D2053616C61203133303100040000000000A888401445642E205365
      6465202D2053616C61203133303200040000000000B088401445642E20536564
      65202D2053616C612031333033000400000000008087401345642E2053656465
      202D2053616C6120323031000400000000008887401345642E2053656465202D
      2053616C6120323032000400000000009087401345642E2053656465202D2053
      616C6120323033000400000000009887401345642E2053656465202D2053616C
      612033303100040000000000A087401345642E2053656465202D2053616C6120
      33303200040000000000A887401445642E2053656465202D2053616C61203330
      332000040000000000B087401345642E2053656465202D2053616C6120343031
      00040000000000B887401345642E2053656465202D2053616C61203430320004
      0000000000C087401345642E2053656465202D2053616C612034303300040000
      000000C887401445642E2053656465202D2053616C6120353031200004000000
      0000D087401445642E2053656465202D2053616C612035303220000400000000
      00D887401345642E2053656465202D2053616C612035303300040000000000E0
      87401345642E2053656465202D2053616C612036303100040000000000E88740
      1345642E2053656465202D2053616C612036303200040000000000F087401345
      642E2053656465202D2053616C612036303300040000000000F887401345642E
      2053656465202D2053616C6120373031000400000000000088401345642E2053
      656465202D2053616C6120373032000400000000000888401345642E20536564
      65202D2053616C6120373033000400000000001088401345642E205365646520
      2D2053616C6120383031000400000000001888401345642E2053656465202D20
      53616C6120383032000400000000002088401345642E2053656465202D205361
      6C6120383033000400000000002888401345642E2053656465202D2053616C61
      20393031000400000000003088401345642E2053656465202D2053616C612039
      3032000400000000004888401345642E2053656465202D2053616C6120393033
      000400000000001886402045642E2053656E61646F7220506F6D706575202D20
      3220506176696D656E746F000400000000002086402045642E2053656E61646F
      7220506F6D706575202D203320506176696D656E746F00040000000000288640
      2045642E2053656E61646F7220506F6D706575202D203420506176696D656E74
      6F000400000000003086402045642E2053656E61646F7220506F6D706575202D
      203520506176696D656E746F00000000000000388640073232322E362E352045
      642E2053656E61646F7220506F6D706575202D203620506176696D656E746F00
      0400000000004086402045642E2053656E61646F7220506F6D706575202D2037
      20506176696D656E746F000400000000001086401F45642E2053656E61646F72
      20506F6D706575202D20536F6272652D4C6F6A61000400000000000886401B45
      642E2053656E61646F7220506F6D706575202D2054657272656F000400000000
      00DC9F401345642E205465737465202D205445535445203100000000000000EE
      A040073130322E352E381A45642E205465737465202D20544553544520434F4E
      544142494C00040000000000A886401C45642E20566974616C204272617A696C
      202D2053616C61203132303100040000000000B086401C45642E20566974616C
      204272617A696C202D2053616C61203132303200040000000000B886401C4564
      2E20566974616C204272617A696C202D2053616C612031323033000400000000
      00C086401C45642E20566974616C204272617A696C202D2053616C6120313330
      3100040000000000C886401C45642E20566974616C204272617A696C202D2053
      616C61203133303200040000000000D086401C45642E20566974616C20427261
      7A696C202D2053616C61203133303300040000000000D886401C45642E205669
      74616C204272617A696C202D2053616C61203134303100040000000000E08640
      1C45642E20566974616C204272617A696C202D2053616C612031343032000400
      00000000E886401D45642E20566974616C204272617A696C202D2053616C6120
      313430332000040000000000F086401C45642E20566974616C204272617A696C
      202D2053616C61203135303100040000000000F886401D45642E20566974616C
      204272617A696C202D2053616C61203135303220000400000000000087401C45
      642E20566974616C204272617A696C202D2053616C6120313530330004000000
      00000887401C45642E20566974616C204272617A696C202D2053616C61203136
      3031000400000000001087401C45642E20566974616C204272617A696C202D20
      53616C612031363032000400000000001887401C45642E20566974616C204272
      617A696C202D2053616C612031373031000400000000002087401C45642E2056
      6974616C204272617A696C202D2053616C612031373032000400000000002887
      401C45642E20566974616C204272617A696C202D2053616C6120313830310004
      00000000003087401C45642E20566974616C204272617A696C202D2053616C61
      2031383032000400000000004C94401B45642E20566974616C204272617A696C
      202D20766167612030303100040000000000DC94401B45642E20566974616C20
      4272617A696C202D20766167612030303200040000000000E894401B45642E20
      566974616C204272617A696C202D20766167612030303300040000000000F094
      401B45642E20566974616C204272617A696C202D207661676120303034000400
      00000000FC94401B45642E20566974616C204272617A696C202D207661676120
      303035000400000000000895401B45642E20566974616C204272617A696C202D
      207661676120303036000400000000001495401B45642E20566974616C204272
      617A696C202D207661676120303037000400000000004495401B45642E205669
      74616C204272617A696C202D207661676120303038000400000000004C95401B
      45642E20566974616C204272617A696C202D2076616761203030390004000000
      00005495401B45642E20566974616C204272617A696C202D2076616761203031
      30000400000000005C95401B45642E20566974616C204272617A696C202D2076
      61676120303131000400000000006C95401B45642E20566974616C204272617A
      696C202D207661676120303132000400000000007895401B45642E2056697461
      6C204272617A696C202D207661676120303133000400000000008495401B4564
      2E20566974616C204272617A696C202D20766167612030313400040000000000
      9495401B45642E20566974616C204272617A696C202D20766167612030313500
      0400000000009895401B45642E20566974616C204272617A696C202D20766167
      612030313600040000000000AC95401B45642E20566974616C204272617A696C
      202D20766167612030313700040000000000BC95401B45642E20566974616C20
      4272617A696C202D20766167612030313800040000000000CC95401B45642E20
      566974616C204272617A696C202D20766167612030313900040000000000DC95
      401B45642E20566974616C204272617A696C202D207661676120303230000400
      00000000E895401B45642E20566974616C204272617A696C202D207661676120
      30323100040000000000F495401B45642E20566974616C204272617A696C202D
      207661676120303232000400000000000096401B45642E20566974616C204272
      617A696C202D207661676120303233000400000000001096401B45642E205669
      74616C204272617A696C202D207661676120303234000400000000001C96401B
      45642E20566974616C204272617A696C202D2076616761203032350004000000
      00002896401B45642E20566974616C204272617A696C202D2076616761203032
      36000400000000003496401B45642E20566974616C204272617A696C202D2076
      61676120303237000400000000004096401B45642E20566974616C204272617A
      696C202D207661676120303238000400000000004C96401B45642E2056697461
      6C204272617A696C202D207661676120303239000400000000005496401B4564
      2E20566974616C204272617A696C202D20766167612030333000040000000000
      5896401B45642E20566974616C204272617A696C202D20766167612030333100
      0400000000008896401B45642E20566974616C204272617A696C202D20766167
      612030333200040000000000A496401B45642E20566974616C204272617A696C
      202D20766167612030333300040000000000AC96401B45642E20566974616C20
      4272617A696C202D20766167612030333400040000000000B496401B45642E20
      566974616C204272617A696C202D20766167612030333500040000000000B896
      401B45642E20566974616C204272617A696C202D207661676120303336000400
      00000000E496401B45642E20566974616C204272617A696C202D207661676120
      30333700040000000000F496401B45642E20566974616C204272617A696C202D
      207661676120303338000400000000000097401B45642E20566974616C204272
      617A696C202D207661676120303339000400000000001097401B45642E205669
      74616C204272617A696C202D207661676120303430000400000000002097401B
      45642E20566974616C204272617A696C202D2076616761203034310004000000
      00003C97401B45642E20566974616C204272617A696C202D2076616761203034
      32000400000000004897401B45642E20566974616C204272617A696C202D2076
      61676120303433000400000000005497401B45642E20566974616C204272617A
      696C202D207661676120303434000400000000006097401B45642E2056697461
      6C204272617A696C202D207661676120303435000400000000006C97401B4564
      2E20566974616C204272617A696C202D20766167612030343600040000000000
      7897401B45642E20566974616C204272617A696C202D20766167612030343700
      0400000000008497401B45642E20566974616C204272617A696C202D20766167
      6120303438000400000000008C97401B45642E20566974616C204272617A696C
      202D207661676120303439000400000000009897401B45642E20566974616C20
      4272617A696C202D20766167612030353000040000000000A497401B45642E20
      566974616C204272617A696C202D20766167612030353100040000000000AC97
      401B45642E20566974616C204272617A696C202D207661676120303532000400
      00000000B897401B45642E20566974616C204272617A696C202D207661676120
      30353300040000000000C097401B45642E20566974616C204272617A696C202D
      20766167612030353400040000000000C897401B45642E20566974616C204272
      617A696C202D20766167612030353500040000000000D097401B45642E205669
      74616C204272617A696C202D20766167612030353600040000000000D897401B
      45642E20566974616C204272617A696C202D2076616761203035370004000000
      0000E097401B45642E20566974616C204272617A696C202D2076616761203035
      3800040000000000E897401B45642E20566974616C204272617A696C202D2076
      6167612030353900040000000000F497401B45642E20566974616C204272617A
      696C202D207661676120303631000400000000000098401B45642E2056697461
      6C204272617A696C202D207661676120303632000400000000008092401F5368
      6F7070696E67204261727261202D2053686F7070696E67204261727261000400
      00000000AC92402853686F7070696E672042656C656D202D2053686F7070696E
      67204967756174656D692042656C656D000400000000004093401B53686F7070
      696E6720497461696D202D204C6F6A6120497461696D00040000000000989240
      2A53686F7070696E67204D616365696F202D2053686F7070696E672049677561
      74656D69204D616365696F00040000000000A492401F53686F7070696E67204D
      696E6173202D204D696E61732053686F7070696E67000400000000002C934027
      53686F7070696E67204E6F72746553686F7070696E67202D204E6F7274652053
      686F7070696E67000400000000009092402353686F7070696E67205461756261
      7465202D2053686F7070696E67205461756261746500000000000000AC934008
      3130312E312E31321854657272656E6F73202D2054657272656E6F2042617572
      75000400000000005893402254657272656E6F73202D2054657272656E6F2048
      656E7269717565205363686569640004000000000048934034576F726C642054
      726164652043656E7465722064652053616F205061756C6F202D20576F726C64
      2054726164652043656E746572}
    object CDSNaoReavaliaIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object CDSNaoReavaliaIMOCODIGO: TStringField
      FieldName = 'IMOCODIGO'
      Size = 15
    end
    object CDSNaoReavaliaDSC_IMOVEL: TStringField
      FieldName = 'DSC_IMOVEL'
      Size = 123
    end
  end
  object DSNaoReavalia: TDataSource
    DataSet = CDSNaoReavalia
    Left = 134
    Top = 128
  end
  object ppBDNaoReavalia: TppBDEPipeline
    DataSource = DSNaoReavalia
    UserName = 'ppBDNaoReavalia'
    Left = 227
    Top = 128
    object ppBDNaoReavaliappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object ppBDNaoReavaliappField2: TppField
      FieldAlias = 'IMOCODIGO'
      FieldName = 'IMOCODIGO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object ppBDNaoReavaliappField3: TppField
      FieldAlias = 'DSC_IMOVEL'
      FieldName = 'DSC_IMOVEL'
      FieldLength = 123
      DisplayWidth = 123
      Position = 2
    end
  end
end
