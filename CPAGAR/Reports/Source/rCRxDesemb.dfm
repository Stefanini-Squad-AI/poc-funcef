inherited RptCRxDesemb: TRptCRxDesemb
  Left = 431
  Top = 250
  Height = 153
  Caption = 'RptCRxDesemb'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Baixas x Centro de Responsabilidade x Tipo de Desembolso'
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
        Caption = 'Agrupa por Fornecedor'
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
        Caption = 'Lista Documento'
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 170
    FormWidth = 380
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptCRxDesemb
    LabelEmpresa = ppLabel2
    LabelSistema = ppLabel3
  end
  object PpCRxDesemb: TppBDEPipeline
    DataSource = DsCRxDesemb
    UserName = 'PpCRxDesemb'
    Left = 137
    Top = 58
    object PpCRxDesembppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object PpCRxDesembppField2: TppField
      FieldAlias = 'CODTIPRECDES'
      FieldName = 'CODTIPRECDES'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object PpCRxDesembppField3: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 35
      DisplayWidth = 35
      Position = 2
    end
    object PpCRxDesembppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object PpCRxDesembppField5: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object PpCRxDesembppField6: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 5
    end
    object PpCRxDesembppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORPAGO'
      FieldName = 'VALORPAGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object PpCRxDesembppField8: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object PpCRxDesembppField9: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object PpCRxDesembppField10: TppField
      FieldAlias = 'NUMCHQBORDERO'
      FieldName = 'NUMCHQBORDERO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 9
    end
    object PpCRxDesembppField11: TppField
      FieldAlias = 'DATACFLOAT'
      FieldName = 'DATACFLOAT'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
    object PpCRxDesembppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object PpCRxDesembppField13: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 10
      DisplayWidth = 10
      Position = 12
    end
    object PpCRxDesembppField14: TppField
      FieldAlias = 'NOMECR'
      FieldName = 'NOMECR'
      FieldLength = 30
      DisplayWidth = 30
      Position = 13
    end
    object PpCRxDesembppField15: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object PpCRxDesembppField16: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 15
    end
    object PpCRxDesembppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
  end
  object DsCRxDesemb: TwwDataSource
    DataSet = CdsCRxDesemb
    Left = 89
    Top = 42
  end
  object RptCRxDesemb: TppReport
    AutoStop = False
    DataPipeline = PpCRxDesemb
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
    PrinterSetup.mmPaperWidth = 209815
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
    Left = 190
    Top = 42
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpCRxDesemb'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24606
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Centro de Responsabilidade X Tipo de Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 46567
        mmTop = 7938
        mmWidth = 103981
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19579
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'ppLabel2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84402
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object LblDescCentRespon: TppLabel
        UserName = 'LblDescCentRespon'
        Caption = 'Cent. Respon.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 20373
        mmWidth = 20373
        BandType = 0
      end
      object LblDescRecebDesemb: TppLabel
        UserName = 'LblDescRecebDesemb'
        Caption = 'Tipo Desemb.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 30956
        mmTop = 20373
        mmWidth = 20108
        BandType = 0
      end
      object LblDescForn: TppLabel
        UserName = 'LblDescForn'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 61648
        mmTop = 20373
        mmWidth = 15346
        BandType = 0
      end
      object RptCRxDesembLine26: TppLine
        UserName = 'RptCRxDesembLine26'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4763
        mmLeft = 0
        mmTop = 19579
        mmWidth = 2910
        BandType = 0
      end
      object RptCRxDesembLine35: TppLine
        UserName = 'RptCRxDesembLine35'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 5027
        mmLeft = 197115
        mmTop = 19579
        mmWidth = 2910
        BandType = 0
      end
      object LblTitRptCrxDesemb: TppLabel
        UserName = 'LblTitRptCrxDesemb'
        Caption = 'Documentos Pagos Entre 01/06/1999 e 01/07/1999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 59531
        mmTop = 13494
        mmWidth = 83608
        BandType = 0
      end
      object RgDadosDoc: TppRegion
        UserName = 'RgDadosDoc'
        Brush.Style = bsClear
        Caption = 'RgDadosDoc'
        Pen.Style = psClear
        Transparent = True
        mmHeight = 4498
        mmLeft = 78846
        mmTop = 19844
        mmWidth = 118534
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object RptCRxDesembLabel7: TppLabel
          UserName = 'RptCRxDesembLabel7'
          Caption = 'Cplto.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 106892
          mmTop = 20373
          mmWidth = 7938
          BandType = 0
        end
        object RptCRxDesembLabel8: TppLabel
          UserName = 'RptCRxDesembLabel8'
          Caption = 'Data Prog'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 115888
          mmTop = 20373
          mmWidth = 13758
          BandType = 0
        end
        object RptCRxDesembLabel1: TppLabel
          UserName = 'RptCRxDesembLabel1'
          Caption = 'Data Venc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 133351
          mmTop = 20373
          mmWidth = 14288
          BandType = 0
        end
        object RptCRxDesembLabel2: TppLabel
          UserName = 'RptCRxDesembLabel2'
          Caption = 'Data Pgto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 150813
          mmTop = 20373
          mmWidth = 13494
          BandType = 0
        end
        object RptCRxDesembLabel13: TppLabel
          UserName = 'RptCRxDesembLabel13'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 189442
          mmTop = 20373
          mmWidth = 7673
          BandType = 0
        end
        object RptCRxDesembLabel6: TppLabel
          UserName = 'RptCRxDesembLabel6'
          Caption = 'Nº Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 80698
          mmTop = 20373
          mmWidth = 18785
          BandType = 0
        end
      end
    end
    object DetalheCrxDesemb: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptCRxDesembDBText6: TppDBText
        UserName = 'RptCRxDesembDBText6'
        AutoSize = True
        DataField = 'DATALANCTO'
        DataPipeline = PpCRxDesemb
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCRxDesemb'
        mmHeight = 3175
        mmLeft = 150813
        mmTop = 0
        mmWidth = 19050
        BandType = 4
      end
      object RptCRxDesembDBText7: TppDBText
        UserName = 'RptCRxDesembDBText7'
        AutoSize = True
        DataField = 'DATAPROGRAMADA'
        DataPipeline = PpCRxDesemb
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCRxDesemb'
        mmHeight = 3175
        mmLeft = 115888
        mmTop = 0
        mmWidth = 28046
        BandType = 4
      end
      object RptCRxDesembDBText8: TppDBText
        UserName = 'RptCRxDesembDBText8'
        AutoSize = True
        DataField = 'DATAVENCTO'
        DataPipeline = PpCRxDesemb
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCRxDesemb'
        mmHeight = 3175
        mmLeft = 133350
        mmTop = 0
        mmWidth = 19315
        BandType = 4
      end
      object RptCRxDesembDBText9: TppDBText
        UserName = 'RptCRxDesembDBText9'
        DataField = 'NODOCUMENTO'
        DataPipeline = PpCRxDesemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCRxDesemb'
        mmHeight = 3704
        mmLeft = 79375
        mmTop = 0
        mmWidth = 26988
        BandType = 4
      end
      object RptCRxDesembDBText10: TppDBText
        UserName = 'RptCRxDesembDBText10'
        DataField = 'COMPLDOCUMENTO'
        DataPipeline = PpCRxDesemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpCRxDesemb'
        mmHeight = 3704
        mmLeft = 106627
        mmTop = 0
        mmWidth = 8467
        BandType = 4
      end
      object RptCRxDesembDBText11: TppDBText
        UserName = 'RptCRxDesembDBText11'
        AutoSize = True
        DataField = 'VALORPAGO'
        DataPipeline = PpCRxDesemb
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpCRxDesemb'
        mmHeight = 3175
        mmLeft = 179123
        mmTop = 0
        mmWidth = 17727
        BandType = 4
      end
      object LblForn: TppDBText
        UserName = 'LblForn'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = PpCRxDesemb
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'PpCRxDesemb'
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 0
        mmWidth = 77523
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 16140
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'ppLabel3'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 1058
        mmWidth = 23019
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
        mmLeft = 87842
        mmTop = 1058
        mmWidth = 21167
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
        mmLeft = 170657
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptCRxDesembSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object RptCRxDesembDBCalc4: TppDBCalc
        UserName = 'RptCRxDesembDBCalc4'
        AutoSize = True
        DataField = 'VALORPAGO'
        DataPipeline = PpCRxDesemb
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpCRxDesemb'
        mmHeight = 3440
        mmLeft = 168275
        mmTop = 265
        mmWidth = 28575
        BandType = 7
      end
      object RptCRxDesembLabel12: TppLabel
        UserName = 'RptCRxDesembLabel12'
        Caption = 'Total de Pagamentos no Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 265
        mmWidth = 48154
        BandType = 7
      end
      object RptCRxDesembLine6: TppLine
        UserName = 'RptCRxDesembLine6'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 3969
        mmWidth = 197115
        BandType = 7
      end
      object RptCRxDesembLine5: TppLine
        UserName = 'RptCRxDesembLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197115
        BandType = 7
      end
      object RptCRxDesembLine2: TppLine
        UserName = 'RptCRxDesembLine2'
        ParentHeight = True
        Position = lpLeft
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 2910
        BandType = 7
      end
      object RptCRxDesembLine3: TppLine
        UserName = 'RptCRxDesembLine3'
        ParentHeight = True
        Position = lpRight
        Weight = 0.75
        mmHeight = 4233
        mmLeft = 194469
        mmTop = 0
        mmWidth = 2910
        BandType = 7
      end
    end
    object RptCRxDesembGroup1: TppGroup
      BreakName = 'CODCENTRORESPON'
      DataPipeline = PpCRxDesemb
      OutlineSettings.CreateNode = True
      UserName = 'RptCRxDesembGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpCRxDesemb'
      object GHeaderCentRespon: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object RptCRxDesembDBText2: TppDBText
          UserName = 'RptCRxDesembDBText2'
          AutoSize = True
          DataField = 'NOMECR'
          DataPipeline = PpCRxDesemb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpCRxDesemb'
          mmHeight = 3704
          mmLeft = 265
          mmTop = 265
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object RptCRxDesembDBText1: TppDBText
          UserName = 'RptCRxDesembDBText1'
          AutoSize = True
          DataField = 'CODCENTRORESPON'
          DataPipeline = PpCRxDesemb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpCRxDesemb'
          mmHeight = 3704
          mmLeft = 60854
          mmTop = 265
          mmWidth = 33602
          BandType = 3
          GroupNo = 0
        end
        object RptCRxDesembLine1: TppLine
          UserName = 'RptCRxDesembLine1'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 197115
          BandType = 3
          GroupNo = 0
        end
      end
      object GFooterCentRespon: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object RptCRxDesembDBCalc3: TppDBCalc
          UserName = 'RptCRxDesembDBCalc3'
          AutoSize = True
          DataField = 'VALORPAGO'
          DataPipeline = PpCRxDesemb
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptCRxDesembGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpCRxDesemb'
          mmHeight = 3440
          mmLeft = 168275
          mmTop = 265
          mmWidth = 28575
          BandType = 5
          GroupNo = 0
        end
        object LblTotCentResp: TppLabel
          UserName = 'LblTotCentResp'
          Caption = 'Sub Total Centro de Responsabilidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 265
          mmWidth = 56356
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object RptCRxDesembGroup2: TppGroup
      BreakName = 'CODTIPRECDES'
      DataPipeline = PpCRxDesemb
      OutlineSettings.CreateNode = True
      UserName = 'RptCRxDesembGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpCRxDesemb'
      object GHeaderTipoDesemb: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object RptCRxDesembDBText4: TppDBText
          UserName = 'RptCRxDesembDBText4'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = PpCRxDesemb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpCRxDesemb'
          mmHeight = 3440
          mmLeft = 30956
          mmTop = 0
          mmWidth = 16669
          BandType = 3
          GroupNo = 1
        end
        object RptCRxDesembDBText3: TppDBText
          UserName = 'RptCRxDesembDBText3'
          AutoSize = True
          DataField = 'CODTIPRECDES'
          DataPipeline = PpCRxDesemb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpCRxDesemb'
          mmHeight = 3440
          mmLeft = 101865
          mmTop = 0
          mmWidth = 22490
          BandType = 3
          GroupNo = 1
        end
      end
      object GFooterTipoDesemb: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object RptCRxDesembDBCalc2: TppDBCalc
          UserName = 'RptCRxDesembDBCalc2'
          AutoSize = True
          DataField = 'VALORPAGO'
          DataPipeline = PpCRxDesemb
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptCRxDesembGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpCRxDesemb'
          mmHeight = 3440
          mmLeft = 168275
          mmTop = 265
          mmWidth = 28575
          BandType = 5
          GroupNo = 1
        end
        object LblTotDesemb: TppLabel
          UserName = 'LblTotDesemb'
          Caption = 'Sub Total Tipo Desembolso:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 30956
          mmTop = 265
          mmWidth = 40746
          BandType = 5
          GroupNo = 1
        end
        object LblDesemb: TppDBText
          UserName = 'LblDesemb'
          AutoSize = True
          DataField = 'DESCTIPORECDES'
          DataPipeline = PpCRxDesemb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          Visible = False
          DataPipelineName = 'PpCRxDesemb'
          mmHeight = 3175
          mmLeft = 30956
          mmTop = 265
          mmWidth = 26194
          BandType = 5
          GroupNo = 1
        end
        object LblCodDesemb: TppDBText
          UserName = 'LblCodDesemb'
          AutoSize = True
          DataField = 'CODTIPRECDES'
          DataPipeline = PpCRxDesemb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpCRxDesemb'
          mmHeight = 3704
          mmLeft = 101865
          mmTop = 265
          mmWidth = 25135
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object RptCRxDesembGroup3: TppGroup
      BreakName = 'IDFORCLI'
      DataPipeline = PpCRxDesemb
      OutlineSettings.CreateNode = True
      UserName = 'RptCRxDesembGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpCRxDesemb'
      object GHeaderRazaoSoc: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object RptCRxDesembDBText5: TppDBText
          UserName = 'RptCRxDesembDBText5'
          AutoSize = True
          DataField = 'RAZAOSOCIAL'
          DataPipeline = PpCRxDesemb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpCRxDesemb'
          mmHeight = 3175
          mmLeft = 61648
          mmTop = 0
          mmWidth = 20108
          BandType = 3
          GroupNo = 2
        end
      end
      object GFooterRazaoSoc: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 4233
        mmPrintPosition = 0
        object RptCRxDesembDBCalc1: TppDBCalc
          UserName = 'RptCRxDesembDBCalc1'
          AutoSize = True
          DataField = 'VALORPAGO'
          DataPipeline = PpCRxDesemb
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptCRxDesembGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpCRxDesemb'
          mmHeight = 3440
          mmLeft = 168275
          mmTop = 529
          mmWidth = 28575
          BandType = 5
          GroupNo = 2
        end
        object LblTotForn: TppLabel
          UserName = 'LblTotForn'
          Caption = 'Sub Total Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 61648
          mmTop = 529
          mmWidth = 32279
          BandType = 5
          GroupNo = 2
        end
        object LblGroupForn: TppDBText
          UserName = 'LblGroupForn'
          AutoSize = True
          DataField = 'RAZAOSOCIAL'
          DataPipeline = PpCRxDesemb
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpCRxDesemb'
          mmHeight = 3175
          mmLeft = 61913
          mmTop = 529
          mmWidth = 20108
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object SqlCRxDesemb: TCMSqlParams
    SQL.Strings = (
      
        'SELECT /*+ RULE */ U.CODDOCUMENTO, U.CODTIPRECDES, T.DESCRICAO, ' +
        'U.NODOCUMENTO, U.DATALANCTO,'
      
        '       U.COMPLDOCUMENTO, U.VALORPAGO, P.RAZAOSOCIAL, U.RECPAG, U' +
        '.NUMCHQBORDERO,'
      
        '       U.DATACFLOAT, U.IDPESSOA, CR.CODEXTERNO AS CODCENTRORESPO' +
        'N, CR.NOME AS NOMECR, CR.NOME,'
      
        '       U.DATAPROGRAMADA,U.DATAVENCTO, U.IDFORCLI, T.DESCRICAO DE' +
        'SCTIPORECDES'
      'FROM'
      
        '(SELECT D.DATAPROGRAMADA,D.DATAVENCTO,D.CODDOCUMENTO, R.CODTIPRE' +
        'CDES, D.NODOCUMENTO, L.DATALANCTO, R.CODCENTRORESPON,'
      '       D.COMPLDOCUMENTO, RP.NUMCHQBORDERO, RP.DATACFLOAT,'
      '       SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(D.OPERACAO,'#39'10'#39','
      
        '                           DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC,'
      
        '                           DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC),'
      '                           DECODE(D.OPERACAO,'#39'10'#39','
      
        '                           DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC,'
      
        '                           DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC))) AS VALORPAGO,'
      '       R.IDPESSOA, R.RECPAG, D.IDFORCLI'
      
        ' FROM (SELECT D.NUMFATURA, R.CODTIPRECDES, R.RECPAG, R.IDPESSOA,' +
        ' R.CODCENTRORESPON,'
      '            (SUM(R.VALOR)/T.VALORTOTAL) AS PERC'
      '       FROM RATEIODOCUM R, DOCUMENTO D,'
      '            (SELECT D.NUMFATURA,'
      
        '                    SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(D.OPERACAO,'#39'1' +
        '5'#39','
      
        '                              DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALO' +
        'R*-1),'
      
        '                              DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALO' +
        'R*-1)),'
      '                              DECODE(D.OPERACAO,'#39'15'#39','
      
        '                              DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALO' +
        'R*-1),'
      
        '                              DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALO' +
        'R*-1)))) AS VALORTOTAL'
      '             FROM DOCUMENTO D, LANCTODOCUM L'
      '             WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '               AND (D.OPERACAO = L.OPERACAO)'
      '               AND (D.IDPESSOA = :IDPESSOA)'
      '               AND (D.RECPAG = :RECPAG)'
      '               AND (L.ESTORNO IS NULL)'
      '               AND (D.NUMFATURA IS NOT NULL)'
      '               AND (D.OPERACAO = '#39'1 '#39') GROUP BY D.NUMFATURA) T'
      '       WHERE (T.NUMFATURA = D.NUMFATURA)'
      '         AND (T.VALORTOTAL <> 0)'
      '         AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      
        '       GROUP BY D.NUMFATURA, R.CODTIPRECDES, R.RECPAG, R.IDPESSO' +
        'A, T.VALORTOTAL,R.CODCENTRORESPON) R,'
      '     DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO RP'
      'WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (L.OPERACAO IN ('#39'5 '#39','#39'10'#39','#39'15'#39'))'
      '  AND (L.ESTORNO IS NULL)'
      '  AND (D.NUMFATURA = R.NUMFATURA)'
      '  AND (RP.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (RP.NUMLANCTO = L.NUMLANCTO)'
      '  AND (D.IDPESSOA = :IDPESSOA)'
      '  AND (D.RECPAG = :RECPAG)'
      '  AND (L.DATALANCTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '  AND (L.DATALANCTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        'GROUP BY D.DATAPROGRAMADA,D.DATAVENCTO,D.CODDOCUMENTO, R.CODTIPR' +
        'ECDES, D.NODOCUMENTO, L.DATALANCTO, R.CODCENTRORESPON,'
      '         D.COMPLDOCUMENTO, RP.NUMCHQBORDERO, RP.DATACFLOAT,'
      '         R.IDPESSOA, R.RECPAG, D.IDFORCLI, D.RECPAG'
      'UNION ALL'
      
        'SELECT D.DATAPROGRAMADA,D.DATAVENCTO,D.CODDOCUMENTO, R.CODTIPREC' +
        'DES, D.NODOCUMENTO, L.DATALANCTO, R.CODCENTRORESPON,'
      '       D.COMPLDOCUMENTO, RP.NUMCHQBORDERO, RP.DATACFLOAT,'
      '       SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(D.OPERACAO,'#39'10'#39','
      
        '                           DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC,'
      
        '                           DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC),'
      '                           DECODE(D.OPERACAO,'#39'10'#39','
      
        '                           DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC,'
      
        '                           DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALOR*-' +
        '1)*R.PERC))) AS VALORPAGO,'
      '       R.IDPESSOA, R.RECPAG, D.IDFORCLI'
      
        'FROM (SELECT R.CODDOCUMENTO, R.CODTIPRECDES, R.RECPAG, R.IDPESSO' +
        'A, R.CODCENTRORESPON,'
      '              (SUM(R.VALOR)/T.VALORTOTAL) AS PERC'
      '      FROM RATEIODOCUM R,'
      '           (SELECT D.CODDOCUMENTO,'
      
        '                   SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(D.OPERACAO,'#39'15' +
        #39','
      
        '                              DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALO' +
        'R*-1),'
      
        '                              DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALO' +
        'R*-1)),'
      '                              DECODE(D.OPERACAO,'#39'15'#39','
      
        '                              DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VALO' +
        'R*-1),'
      
        '                              DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALO' +
        'R*-1)))) AS VALORTOTAL'
      '            FROM DOCUMENTO D, LANCTODOCUM L'
      '            WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '              AND (D.OPERACAO = L.OPERACAO)'
      '              AND (D.IDPESSOA = :IDPESSOA)'
      '              AND (D.RECPAG = :RECPAG)'
      '              AND (L.ESTORNO IS NULL)'
      '              AND (L.VALOR <> 0)'
      
        '              AND (D.OPERACAO IN ('#39'2 '#39','#39'10'#39','#39'15'#39')) GROUP BY D.CO' +
        'DDOCUMENTO) T'
      '      WHERE (T.CODDOCUMENTO = R.CODDOCUMENTO)'
      '        AND (T.VALORTOTAL <> 0)'
      
        '      GROUP BY R.CODDOCUMENTO, R.CODTIPRECDES, R.RECPAG, R.IDPES' +
        'SOA, T.VALORTOTAL,R.CODCENTRORESPON) R,'
      '      DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO RP'
      'WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (L.OPERACAO IN ('#39'5 '#39','#39'10'#39','#39'15'#39'))'
      '  AND (L.ESTORNO IS NULL)'
      '  AND (D.CODDOCUMENTO = R.CODDOCUMENTO)'
      '  AND (RP.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (RP.NUMLANCTO = L.NUMLANCTO)'
      '  AND (D.IDPESSOA = :IDPESSOA)'
      '  AND (D.RECPAG = :RECPAG)'
      '  AND (L.DATALANCTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '  AND (L.DATALANCTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      
        'GROUP BY D.DATAPROGRAMADA,D.DATAVENCTO,D.CODDOCUMENTO, R.CODTIPR' +
        'ECDES, D.NODOCUMENTO, L.DATALANCTO, R.CODCENTRORESPON,'
      '         D.COMPLDOCUMENTO, RP.NUMCHQBORDERO, RP.DATACFLOAT,'
      '         R.IDPESSOA, R.RECPAG, D.IDFORCLI, D.RECPAG'
      ') U, TIPORECEBDESEMB T, PESSOA P, CENTRESPON CR'
      'WHERE'
      '      (P.IDPESSOA = U.IDFORCLI)'
      '  AND (T.CODTIPRECDES = U.CODTIPRECDES)'
      '  AND (T.RECPAG = U.RECPAG)'
      '  AND (T.IDPESSOA = U.IDPESSOA)'
      '  AND (CR.CODCENTRORESPON = U.CODCENTRORESPON)'
      '  AND (CR.IDPESSOA = U.IDPESSOA)'
      'ORDER BY CR.NOME, U.CODCENTRORESPON,'
      '         T.DESCRICAO, U.CODTIPRECDES,'
      '         P.RAZAOSOCIAL, U.IDPESSOA,'
      '         U.NODOCUMENTO, U.COMPLDOCUMENTO, U.DATALANCTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ClientDataSet = CdsCRxDesemb
    Left = 48
    Top = 64
  end
  object CdsCRxDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 40
  end
end
