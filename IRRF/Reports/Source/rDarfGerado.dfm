inherited frmrptDarfGerado: TfrmrptDarfGerado
  Left = 295
  Top = 225
  Width = 384
  Height = 212
  Caption = 'frmrptDarfGerado'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Parâmetro do Relatório de DARF Gerados'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data Inicial de Emissão'
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
        Caption = 'Data Final de Emissão'
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
        Caption = 'Natureza de Rendimento'
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
    Formheight = 200
    FormWidth = 450
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpDarfGerado
    LabelEmpresa = ppLabel8
    ConnectionType = cntBDE
  end
  object dsDarfGerado: TwwDataSource
    DataSet = cdsDarfGerado
    Left = 113
    Top = 93
  end
  object pplDarfGerado: TppBDEPipeline
    DataSource = dsDarfGerado
    UserName = 'lDarfGerado'
    Left = 189
    Top = 93
    object pplDarfGeradoppField1: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object pplDarfGeradoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDDARF'
      FieldName = 'IDDARF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplDarfGeradoppField3: TppField
      FieldAlias = 'CODNATUREZA'
      FieldName = 'CODNATUREZA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 2
    end
    object pplDarfGeradoppField4: TppField
      FieldAlias = 'NATUREZADARF'
      FieldName = 'NATUREZADARF'
      FieldLength = 4
      DisplayWidth = 4
      Position = 3
    end
    object pplDarfGeradoppField5: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 4
    end
    object pplDarfGeradoppField6: TppField
      FieldAlias = 'REFERENCIA'
      FieldName = 'REFERENCIA'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object pplDarfGeradoppField7: TppField
      FieldAlias = 'PROCESSO'
      FieldName = 'PROCESSO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 6
    end
    object pplDarfGeradoppField8: TppField
      FieldAlias = 'DATAINIAPURACAO'
      FieldName = 'DATAINIAPURACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplDarfGeradoppField9: TppField
      FieldAlias = 'DATAFINALAPURACAO'
      FieldName = 'DATAFINALAPURACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object pplDarfGeradoppField10: TppField
      FieldAlias = 'DATAVENCDARF'
      FieldName = 'DATAVENCDARF'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object pplDarfGeradoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDARF'
      FieldName = 'VLRDARF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplDarfGeradoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRMULTA'
      FieldName = 'VLRMULTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplDarfGeradoppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRJUROS'
      FieldName = 'VLRJUROS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplDarfGeradoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRTOTAL'
      FieldName = 'VLRTOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplDarfGeradoppField15: TppField
      FieldAlias = 'OBSDARF'
      FieldName = 'OBSDARF'
      FieldLength = 60
      DisplayWidth = 60
      Position = 14
    end
    object pplDarfGeradoppField16: TppField
      FieldAlias = 'FLGIMPRESSO'
      FieldName = 'FLGIMPRESSO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object pplDarfGeradoppField17: TppField
      FieldAlias = 'DATAEMISDARF'
      FieldName = 'DATAEMISDARF'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 16
    end
    object pplDarfGeradoppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPROGRAMA'
      FieldName = 'IDPROGRAMA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplDarfGeradoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplDarfGeradoppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object pplDarfGeradoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRIRRF'
      FieldName = 'VLRIRRF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplDarfGeradoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRINSS'
      FieldName = 'VLRINSS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplDarfGeradoppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRBASE'
      FieldName = 'VLRBASE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplDarfGeradoppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCIRRF'
      FieldName = 'PERCIRRF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object pplDarfGeradoppField25: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 24
    end
    object pplDarfGeradoppField26: TppField
      FieldAlias = 'DATAPAG'
      FieldName = 'DATAPAG'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 25
    end
    object pplDarfGeradoppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMAPDOC'
      FieldName = 'NUMAPDOC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object pplDarfGeradoppField28: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DisplayWidth = 10
      Position = 27
    end
  end
  object rpDarfGerado: TppReport
    AutoStop = False
    DataPipeline = pplDarfGerado
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 283
    Top = 93
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplDarfGerado'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Darf'#39's Gerados no Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 73290
        mmTop = 8731
        mmWidth = 53446
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'ppLabel8'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rpDarfGeradoLabel2: TppLabel
        UserName = 'rpDarfGeradoLabel2'
        Caption = 'rpDarfGeradoLabel2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 4233
        mmTop = 10583
        mmWidth = 26723
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpDarfEmiteDBText11: TppDBText
        UserName = 'rpDarfEmiteDBText11'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = pplDarfGerado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDarfGerado'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 265
        mmWidth = 71173
        BandType = 4
      end
      object rpDarfEmiteDBText12: TppDBText
        UserName = 'rpDarfEmiteDBText12'
        DataField = 'CODNATUREZA'
        DataPipeline = pplDarfGerado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDarfGerado'
        mmHeight = 3704
        mmLeft = 75936
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
      object rpDarfEmiteDBText13: TppDBText
        UserName = 'rpDarfEmiteDBText13'
        DataField = 'VLRBASE'
        DataPipeline = pplDarfGerado
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDarfGerado'
        mmHeight = 3704
        mmLeft = 114300
        mmTop = 265
        mmWidth = 19315
        BandType = 4
      end
      object rpDarfEmiteDBText14: TppDBText
        UserName = 'rpDarfEmiteDBText14'
        DataField = 'VLRIRRF'
        DataPipeline = pplDarfGerado
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDarfGerado'
        mmHeight = 3704
        mmLeft = 135467
        mmTop = 265
        mmWidth = 19315
        BandType = 4
      end
      object rpDarfEmiteDBText16: TppDBText
        UserName = 'rpDarfEmiteDBText16'
        DataField = 'NUMAPDOC'
        DataPipeline = pplDarfGerado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDarfGerado'
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 265
        mmWidth = 19315
        BandType = 4
      end
      object rpDarfEmiteDBText5: TppDBText
        UserName = 'rpDarfEmiteDBText5'
        DataField = 'PLACONTA'
        DataPipeline = pplDarfGerado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDarfGerado'
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 265
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATALANC'
        DataPipeline = pplDarfGerado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDarfGerado'
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 265
        mmWidth = 15081
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197380
        BandType = 8
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel11'
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
        mmTop = 3175
        mmWidth = 197380
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
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpDarfEmiteGroup1: TppGroup
      BreakName = 'IDDARF'
      DataPipeline = pplDarfGerado
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpDarfEmiteGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDarfGerado'
      object rpDarfEmiteGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 19050
        mmPrintPosition = 0
        object rpDarfEmiteDBText1: TppDBText
          UserName = 'rpDarfEmiteDBText1'
          DataField = 'DATAEMISDARF'
          DataPipeline = pplDarfGerado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDarfGerado'
          mmHeight = 3704
          mmLeft = 794
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel6: TppLabel
          UserName = 'rpDarfEmiteLabel6'
          Caption = 'Emissão'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 6350
          mmTop = 1058
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel7: TppLabel
          UserName = 'rpDarfEmiteLabel7'
          Caption = 'Período Apuração'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3387
          mmLeft = 28310
          mmTop = 1058
          mmWidth = 24299
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteDBText2: TppDBText
          UserName = 'rpDarfEmiteDBText2'
          DataField = 'DATAINIAPURACAO'
          DataPipeline = pplDarfGerado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplDarfGerado'
          mmHeight = 3704
          mmLeft = 21960
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteDBText3: TppDBText
          UserName = 'rpDarfEmiteDBText3'
          DataField = 'DATAFINALAPURACAO'
          DataPipeline = pplDarfGerado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplDarfGerado'
          mmHeight = 3704
          mmLeft = 39688
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel8: TppLabel
          UserName = 'rpDarfEmiteLabel8'
          Caption = 'Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 62971
          mmTop = 1058
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteDBText4: TppDBText
          UserName = 'rpDarfEmiteDBText4'
          DataField = 'DATAVENCDARF'
          DataPipeline = pplDarfGerado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDarfGerado'
          mmHeight = 3704
          mmLeft = 61913
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel10: TppLabel
          UserName = 'rpDarfEmiteLabel10'
          Caption = 'Código DARF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 86519
          mmTop = 1058
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteDBText6: TppDBText
          UserName = 'rpDarfEmiteDBText6'
          DataField = 'NATUREZADARF'
          DataPipeline = pplDarfGerado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDarfGerado'
          mmHeight = 3704
          mmLeft = 87313
          mmTop = 5556
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel11: TppLabel
          UserName = 'rpDarfEmiteLabel11'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 125413
          mmTop = 1058
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel12: TppLabel
          UserName = 'rpDarfEmiteLabel12'
          Caption = 'Juros'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 146315
          mmTop = 1058
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel13: TppLabel
          UserName = 'rpDarfEmiteLabel13'
          Caption = 'Multa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 168011
          mmTop = 1058
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel14: TppLabel
          UserName = 'rpDarfEmiteLabel14'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 190500
          mmTop = 1058
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteDBText7: TppDBText
          UserName = 'rpDarfEmiteDBText7'
          DataField = 'VLRDARF'
          DataPipeline = pplDarfGerado
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDarfGerado'
          mmHeight = 3704
          mmLeft = 111919
          mmTop = 5556
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteDBText8: TppDBText
          UserName = 'rpDarfEmiteDBText8'
          DataField = 'VLRJUROS'
          DataPipeline = pplDarfGerado
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDarfGerado'
          mmHeight = 3704
          mmLeft = 133350
          mmTop = 5556
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteDBText9: TppDBText
          UserName = 'rpDarfEmiteDBText9'
          DataField = 'VLRMULTA'
          DataPipeline = pplDarfGerado
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDarfGerado'
          mmHeight = 3704
          mmLeft = 154782
          mmTop = 5556
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteDBText10: TppDBText
          UserName = 'rpDarfEmiteDBText10'
          DataField = 'VLRTOTAL'
          DataPipeline = pplDarfGerado
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDarfGerado'
          mmHeight = 3704
          mmLeft = 176477
          mmTop = 5556
          mmWidth = 20638
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLine1: TppLine
          UserName = 'rpDarfEmiteLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 10054
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLine2: TppLine
          UserName = 'rpDarfEmiteLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel1: TppLabel
          UserName = 'rpDarfEmiteLabel1'
          Caption = 'Beneficiário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 794
          mmTop = 14023
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel2: TppLabel
          UserName = 'rpDarfEmiteLabel2'
          Caption = 'Natureza'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 77258
          mmTop = 14023
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel15: TppLabel
          UserName = 'rpDarfEmiteLabel15'
          Caption = 'Num. Doc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 98425
          mmTop = 14023
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel3: TppLabel
          UserName = 'rpDarfEmiteLabel3'
          Caption = 'Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3387
          mmLeft = 126883
          mmTop = 14023
          mmWidth = 6731
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel5: TppLabel
          UserName = 'rpDarfEmiteLabel5'
          Caption = 'Imposto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 143669
          mmTop = 14023
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel4: TppLabel
          UserName = 'rpDarfEmiteLabel4'
          Caption = 'Conta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 176213
          mmTop = 14023
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'ppLine3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 17992
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3387
          mmLeft = 157163
          mmTop = 14023
          mmWidth = 16679
          BandType = 3
          GroupNo = 0
        end
      end
      object rpDarfEmiteGroupFooterBand1: TppGroupFooterBand
        BeforePrint = rpDarfEmiteGroupFooterBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object rpDarfGeradoDBCalc1: TppDBCalc
          UserName = 'rpDarfGeradoDBCalc1'
          DataField = 'VLRBASE'
          DataPipeline = pplDarfGerado
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpDarfEmiteGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDarfGerado'
          mmHeight = 3704
          mmLeft = 112184
          mmTop = 1852
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object rpDarfGeradoDBCalc2: TppDBCalc
          UserName = 'rpDarfGeradoDBCalc2'
          DataField = 'VLRIRRF'
          DataPipeline = pplDarfGerado
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpDarfEmiteGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDarfGerado'
          mmHeight = 3704
          mmLeft = 133350
          mmTop = 1852
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object rpDarfGeradoLabel1: TppLabel
          UserName = 'rpDarfGeradoLabel1'
          Caption = 'Totais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 90223
          mmTop = 1852
          mmWidth = 9260
          BandType = 5
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 794
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object sqlDarfGerado: TCMSqlParams
    SQL.Strings = (
      
        'SELECT P.RAZAOSOCIAL, D.IDDARF, L.CODNATUREZA, D.CODNATUREZA AS ' +
        'NATUREZADARF,'
      
        '       D.NUMDOCUMENTO, D.REFERENCIA, D.PROCESSO, D.DATAINIAPURAC' +
        'AO, D.DATAFINALAPURACAO,'
      
        '       D.DATAVENCDARF, D.VLRIRRF AS VLRDARF, D.VLRMULTA, D.VLRJU' +
        'ROS, D.VLRTOTAL, D.OBSDARF,'
      
        '       D.FLGIMPRESSO, D.DATAEMISDARF, D.IDPROGRAMA, D.IDPLANOPRE' +
        'V, D.IDPATRO, L.VLRIRRF, L.VLRINSS,'
      
        '       L.VLRBASE, L.PERCIRRF, DT.NUMAPGR, DP.DATAPAG, DL.NUMAPGR' +
        ' AS NUMAPDOC'
      '  FROM DARF D, LANCIRRF L, PESSOA P, DOCUMENTO DT, DOCUMENTO DL,'
      '     (SELECT L.CODDOCUMENTO, MAX(L.DATALANCTO) AS DATAPAG'
      '        FROM LANCIRRF D, LANCTODOCUM L'
      '       WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '         AND (L.OPERACAO = '#39'5 '#39')'
      '       GROUP BY L.CODDOCUMENTO) DP'
      ' WHERE (1 = 2)')
    ClientDataSet = cdsDarfGerado
    Left = 296
    Top = 8
  end
  object cdsDarfGerado: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 8
    Data = {
      D80200009619E0BD01000000180000001B000000000003000000D8020B52415A
      414F534F4349414C0100490000000100055749445448020002003C0006494444
      41524608000400000000000B434F444E41545552455A41010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      0004000C4E41545552455A414441524601004900000002000753554254595045
      020049000A00466978656443686172000557494454480200020004000C4E554D
      444F43554D454E544F01004900000002000753554254595045020049000A0046
      6978656443686172000557494454480200020012000A5245464552454E434941
      01004900000001000557494454480200020014000850524F434553534F010049
      00000001000557494454480200020014000F44415441494E4941505552414341
      4F0800080000000000114441544146494E414C415055524143414F0800080000
      0000000C4441544156454E4344415246080008000000000007564C5244415246
      080004000000000008564C524D554C5441080004000000000008564C524A5552
      4F53080004000000000008564C52544F54414C0800040000000000074F425344
      4152460100490000000100055749445448020002003C000B464C47494D505245
      53534F01004900000002000753554254595045020049000A0046697865644368
      6172000557494454480200020001000C44415441454D49534441524608000800
      000000000A494450524F4752414D4108000400000000000B4944504C414E4F50
      5245560800040000000000074944504154524F080004000000000007564C5249
      525246080004000000000007564C52494E5353080004000000000007564C5242
      41534508000400000000000850455243495252460800040000000000074E554D
      41504752080004000000000007444154415041470800080000000000084E554D
      4150444F4308000400000000000100044C4349440400010009080000}
  end
end
