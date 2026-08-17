inherited RptAdiantamento: TRptAdiantamento
  Left = 244
  Top = 57
  Width = 351
  Height = 382
  Caption = 'RptAdiantamento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Parâmetros do Relatório de Adiantamentos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Cliente / Fornecedor'
        Controle = tcProcuraFC
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
        Caption = 'Tipo de Documento'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODTIPDOC'
        LookupSettings.Display = 'Descricao'
        LookupSettings.Descricao = 'Descricao'
        LookupSettings.Tamanho = '40'
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
        Name = 'Tipo de Documento'
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
        Caption = 'Data de Lançamento'
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
        Name = 'DtLanc'
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
    Formheight = 185
    FormWidth = 510
    Top = 16
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptAdianto
    LabelEmpresa = LblEmpresa
    LabelSistema = ppLabel110
  end
  object PpAdianto: TppBDEPipeline
    DataSource = DsAdianto
    CloseDataSource = True
    UserName = 'PpAdianto'
    Left = 209
    Top = 96
    object PpAdiantoppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object PpAdiantoppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object PpAdiantoppField3: TppField
      FieldAlias = 'NUMDOC'
      FieldName = 'NUMDOC'
      FieldLength = 44
      DisplayWidth = 44
      Position = 2
    end
    object PpAdiantoppField4: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object PpAdiantoppField5: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object PpAdiantoppField6: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 5
    end
    object PpAdiantoppField7: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 6
    end
    object PpAdiantoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object PpAdiantoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOROUTRAMOEDA'
      FieldName = 'VALOROUTRAMOEDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object PpAdiantoppField10: TppField
      FieldAlias = 'HISTORICOCOMPL'
      FieldName = 'HISTORICOCOMPL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object PpAdiantoppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALALT'
      FieldName = 'VALALT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object PpAdiantoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALLIQ'
      FieldName = 'VALLIQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
  end
  object DsAdianto: TwwDataSource
    DataSet = CdsAdianto
    Left = 129
    Top = 143
  end
  object RptAdianto: TppReport
    AutoStop = False
    DataPipeline = PpAdianto
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 13000
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
    Left = 217
    Top = 146
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpAdianto'
    object ppHeaderBand24: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 25665
      mmPrintPosition = 0
      object LblTiTAdianto: TppLabel
        UserName = 'LblTiTAdianto'
        Caption = 'Lançamento de Documentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 106892
        mmTop = 8731
        mmWidth = 57944
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 121973
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel97: TppLabel
        UserName = 'ppLabel97'
        Caption = 'Lançamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 21696
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel98: TppLabel
        UserName = 'ppLabel98'
        Caption = 'Doc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 21167
        mmTop = 21696
        mmWidth = 5821
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'ppLabel102'
        Caption = 'Emissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 59002
        mmTop = 21696
        mmWidth = 12965
        BandType = 0
      end
      object ppLabel103: TppLabel
        UserName = 'ppLabel103'
        Caption = 'Vecto.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 74877
        mmTop = 21696
        mmWidth = 9525
        BandType = 0
      end
      object ppLabel104: TppLabel
        UserName = 'ppLabel104'
        Caption = 'Prog.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 90752
        mmTop = 21696
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel105: TppLabel
        UserName = 'ppLabel105'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 117740
        mmTop = 21696
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel106: TppLabel
        UserName = 'ppLabel106'
        Caption = 'Outra Moeda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 131498
        mmTop = 21696
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel107: TppLabel
        UserName = 'ppLabel107'
        Caption = 'Pagamentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 158486
        mmTop = 21696
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel108: TppLabel
        UserName = 'ppLabel108'
        Caption = 'Valor Líquido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 188648
        mmTop = 21696
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel109: TppLabel
        UserName = 'ppLabel109'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 212990
        mmTop = 21696
        mmWidth = 13494
        BandType = 0
      end
    end
    object ppDetailBand25: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText33: TppDBText
        UserName = 'ppDBText33'
        DataField = 'NUMDOC'
        DataPipeline = PpAdianto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3704
        mmLeft = 21167
        mmTop = 529
        mmWidth = 36248
        BandType = 4
      end
      object ppDBText34: TppDBText
        UserName = 'ppDBText34'
        AutoSize = True
        DataField = 'DATAEMISSAO'
        DataPipeline = PpAdianto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3175
        mmLeft = 59002
        mmTop = 529
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'ppDBText35'
        AutoSize = True
        DataField = 'DATAVENCTO'
        DataPipeline = PpAdianto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3175
        mmLeft = 74877
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'ppDBText36'
        AutoSize = True
        DataField = 'DATAPROGRAMADA'
        DataPipeline = PpAdianto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3175
        mmLeft = 90752
        mmTop = 529
        mmWidth = 27781
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'ppDBText37'
        DataField = 'VALOR'
        DataPipeline = PpAdianto
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3704
        mmLeft = 103188
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText38: TppDBText
        UserName = 'ppDBText38'
        DataField = 'VALOROUTRAMOEDA'
        DataPipeline = PpAdianto
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3704
        mmLeft = 128323
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText39: TppDBText
        UserName = 'ppDBText39'
        DataField = 'HISTORICOCOMPL'
        DataPipeline = PpAdianto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3704
        mmLeft = 212990
        mmTop = 265
        mmWidth = 59002
        BandType = 4
      end
      object ppDBText40: TppDBText
        UserName = 'ppDBText40'
        DataField = 'VALALT'
        DataPipeline = PpAdianto
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3704
        mmLeft = 155046
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText41: TppDBText
        UserName = 'ppDBText41'
        DataField = 'VALLIQ'
        DataPipeline = PpAdianto
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3704
        mmLeft = 185738
        mmTop = 529
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText42: TppDBText
        UserName = 'ppDBText42'
        AutoSize = True
        DataField = 'DATALANCTO'
        DataPipeline = PpAdianto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3175
        mmLeft = 265
        mmTop = 529
        mmWidth = 19050
        BandType = 4
      end
    end
    object ppFooterBand24: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine45: TppLine
        UserName = 'ppLine45'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 272000
        BandType = 8
      end
      object ppLabel110: TppLabel
        UserName = 'ppLabel110'
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
        mmWidth = 25665
        BandType = 8
      end
      object ppCalc43: TppSystemVariable
        UserName = 'Calc43'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 124090
        mmTop = 3175
        mmWidth = 23548
        BandType = 8
      end
      object ppCalc44: TppSystemVariable
        UserName = 'Calc44'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 244475
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand6: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object ppDBCalc4: TppDBCalc
        UserName = 'ppDBCalc4'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpAdianto
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3175
        mmLeft = 105569
        mmTop = 2117
        mmWidth = 20108
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'ppDBCalc5'
        AutoSize = True
        DataField = 'VALOROUTRAMOEDA'
        DataPipeline = PpAdianto
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3175
        mmLeft = 110861
        mmTop = 2117
        mmWidth = 40217
        BandType = 7
      end
      object ppLabel111: TppLabel
        UserName = 'ppLabel111'
        Caption = 'Total Lançamentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 59002
        mmTop = 1852
        mmWidth = 28840
        BandType = 7
      end
      object ppLine47: TppLine
        UserName = 'ppLine47'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 272000
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'ppDBCalc6'
        AutoSize = True
        DataField = 'VALLIQ'
        DataPipeline = PpAdianto
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3175
        mmLeft = 187590
        mmTop = 2117
        mmWidth = 20638
        BandType = 7
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'ppDBCalc7'
        AutoSize = True
        DataField = 'VALALT'
        DataPipeline = PpAdianto
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpAdianto'
        mmHeight = 3175
        mmLeft = 156104
        mmTop = 2117
        mmWidth = 21431
        BandType = 7
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'IDPESSOA'
      DataPipeline = PpAdianto
      OutlineSettings.CreateNode = True
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpAdianto'
      object ppGroupHeaderBand5: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLabelCliFor: TppLabel
          UserName = 'LabelCliFor'
          Caption = 'Fornecedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 1588
          mmWidth = 21431
          BandType = 3
          GroupNo = 0
        end
        object ppLine48: TppLine
          UserName = 'ppLine48'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 272000
          BandType = 3
          GroupNo = 0
        end
        object ppDBText32: TppDBText
          UserName = 'ppDBText32'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = PpAdianto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpAdianto'
          mmHeight = 4763
          mmLeft = 29104
          mmTop = 1588
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object RptAdiantoLine1: TppLine
          UserName = 'RptAdiantoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6879
          mmWidth = 272000
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppDBCalc8: TppDBCalc
          UserName = 'ppDBCalc8'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = PpAdianto
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAdianto'
          mmHeight = 3175
          mmLeft = 105569
          mmTop = 1588
          mmWidth = 20108
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'ppDBCalc9'
          AutoSize = True
          DataField = 'VALOROUTRAMOEDA'
          DataPipeline = PpAdianto
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAdianto'
          mmHeight = 3175
          mmLeft = 110861
          mmTop = 1588
          mmWidth = 40217
          BandType = 5
          GroupNo = 0
        end
        object ppLabel113: TppLabel
          UserName = 'ppLabel113'
          Caption = 'Sub Total :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 59002
          mmTop = 1588
          mmWidth = 15610
          BandType = 5
          GroupNo = 0
        end
        object ppLine49: TppLine
          UserName = 'ppLine49'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 272000
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'ppDBCalc10'
          AutoSize = True
          DataField = 'VALALT'
          DataPipeline = PpAdianto
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAdianto'
          mmHeight = 3175
          mmLeft = 156104
          mmTop = 1588
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'ppDBCalc11'
          AutoSize = True
          DataField = 'VALLIQ'
          DataPipeline = PpAdianto
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpAdianto'
          mmHeight = 3175
          mmLeft = 187590
          mmTop = 1588
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object CdsAdianto: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 96
    Data = {
      240100009619E0BD01000000180000000C000000000003000000240108494450
      4553534F410800040000000000044E4F4D450100490000000100055749445448
      020002003C00064E554D444F430100490000000100055749445448020002002C
      000B44415441454D495353414F08000800000000000A4441544156454E43544F
      08000800000000000E4441544150524F4752414D41444108000800000000000A
      444154414C414E43544F08000800000000000556414C4F520800040000000000
      0F56414C4F524F555452414D4F45444108000400000000000E484953544F5249
      434F434F4D504C0100490000000100055749445448020002003C000656414C41
      4C5408000400000000000656414C4C495108000400000000000100044C434944
      0400010009080000}
  end
  object SqlAdianto: TCMSqlParams
    SQL.Strings = (
      'SELECT PFORCLI.IDPESSOA,'
      
        'PFORCLI.RAZAOSOCIAL AS NOME, DOC.NODOCUMENTO || '#39'-'#39' || COMPLDOCU' +
        'MENTO AS NUMDOC, '
      
        'DOC.DATAEMISSAO, DOC.DATAVENCTO, DOC.DATAPROGRAMADA, LANC.DATALA' +
        'NCTO,'
      
        'LANC.VALOR, LANC.VALOROUTRAMOEDA, LANC.HISTORICOCOMPL, SUMALT.VA' +
        'LALT,  (LANC.VALOR - SUMALT.VALALT) AS VALLIQ'
      'FROM'
      'PESSOA PFORCLI,'
      'DOCUMENTO DOC,'
      'LANCTODOCUM LANC,'
      
        '(SELECT SUM(VALOR) AS VALALT, CODDOCUMENTO FROM LANCTODOCUM WHER' +
        'E CODALTERADOR IS NOT NULL GROUP BY CODDOCUMENTO) SUMALT'
      'WHERE'
      '1=2')
    ClientDataSet = CdsAdianto
    Left = 88
    Top = 96
  end
end
