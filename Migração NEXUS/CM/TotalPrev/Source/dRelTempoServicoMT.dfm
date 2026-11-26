inherited dtmRelTempoServicoMT: TdtmRelTempoServicoMT
  Left = 92
  Top = 163
  Width = 650
  Height = 357
  Caption = 'dtmRelTempoServicoMT'
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'IDPESSOA'
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
        Caption = 'SDATAREF'
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
        Caption = 'SNOME'
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
        Caption = 'SDATATEMPO'
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
        Caption = 'BCONTATEMPO'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = ppRTempoServico
  end
  object ppTempoServico: TppBDEPipeline
    DataSource = dsTempoServico
    UserName = 'lExemplo1'
    Left = 37
    Top = 169
    object ppTempoServicoppField1: TppField
      FieldAlias = 'MATRICULAATUAL'
      FieldName = 'MATRICULAATUAL'
      FieldLength = 13
      DisplayWidth = 13
      Position = 0
    end
    object ppTempoServicoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGTEMPOMANUT'
      FieldName = 'FLGTEMPOMANUT'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppTempoServicoppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppTempoServicoppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppTempoServicoppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'SEQHISTFUNC'
      FieldName = 'SEQHISTFUNC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppTempoServicoppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDDOCUMENTO'
      FieldName = 'IDDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppTempoServicoppField7: TppField
      FieldAlias = 'CODTPINSALUBRI'
      FieldName = 'CODTPINSALUBRI'
      FieldLength = 10
      DisplayWidth = 10
      Position = 6
    end
    object ppTempoServicoppField8: TppField
      FieldAlias = 'FLGCONTATSTRANSF'
      FieldName = 'FLGCONTATSTRANSF'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppTempoServicoppField9: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object ppTempoServicoppField10: TppField
      FieldAlias = 'DATAFINAL'
      FieldName = 'DATAFINAL'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object ppTempoServicoppField11: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 10
    end
    object ppTempoServicoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORCARGO'
      FieldName = 'VALORCARGO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppTempoServicoppField13: TppField
      FieldAlias = 'FUNCAO'
      FieldName = 'FUNCAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 12
    end
    object ppTempoServicoppField14: TppField
      FieldAlias = 'VINCEMPREG'
      FieldName = 'VINCEMPREG'
      FieldLength = 2
      DisplayWidth = 2
      Position = 13
    end
    object ppTempoServicoppField15: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 14
    end
    object ppTempoServicoppField16: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 15
    end
    object ppTempoServicoppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'TEMPOCALC'
      FieldName = 'TEMPOCALC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppTempoServicoppField18: TppField
      FieldAlias = 'FLGCONCOMITANTETRANSF'
      FieldName = 'FLGCONCOMITANTETRANSF'
      FieldLength = 3
      DisplayWidth = 3
      Position = 17
    end
    object ppTempoServicoppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGCONCOMITANTE'
      FieldName = 'FLGCONCOMITANTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppTempoServicoppField20: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 18
      DisplayWidth = 18
      Position = 19
    end
    object ppTempoServicoppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'FATOR'
      FieldName = 'FATOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppTempoServicoppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'TEMPOSERVANTERIOR'
      FieldName = 'TEMPOSERVANTERIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppTempoServicoppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'TEMPOSITESPECIAL'
      FieldName = 'TEMPOSITESPECIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object ppTempoServicoppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'TEMPONAOCREDITADO'
      FieldName = 'TEMPONAOCREDITADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
    object ppTempoServicoppField25: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 24
    end
    object ppTempoServicoppField26: TppField
      Alignment = taRightJustify
      FieldAlias = 'FLGCONTATS'
      FieldName = 'FLGCONTATS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 25
    end
    object ppTempoServicoppField27: TppField
      Alignment = taRightJustify
      FieldAlias = 'TEMPOSERVCALC'
      FieldName = 'TEMPOSERVCALC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 26
    end
    object ppTempoServicoppField28: TppField
      Alignment = taRightJustify
      FieldAlias = 'TEMPOSEMCONVERSAO'
      FieldName = 'TEMPOSEMCONVERSAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 27
    end
    object ppTempoServicoppField29: TppField
      Alignment = taRightJustify
      FieldAlias = 'TEMPOSERVCALCSIMULA'
      FieldName = 'TEMPOSERVCALCSIMULA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 28
    end
    object ppTempoServicoppField30: TppField
      Alignment = taRightJustify
      FieldAlias = 'TEMPOSEMCONVSIMULA'
      FieldName = 'TEMPOSEMCONVSIMULA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 29
    end
    object ppTempoServicoppField31: TppField
      FieldAlias = 'DATAREF'
      FieldName = 'DATAREF'
      FieldLength = 10
      DisplayWidth = 10
      Position = 30
    end
    object ppTempoServicoppField32: TppField
      FieldAlias = 'DATAREFSIMULA'
      FieldName = 'DATAREFSIMULA'
      FieldLength = 10
      DisplayWidth = 10
      Position = 31
    end
    object ppTempoServicoppField33: TppField
      FieldAlias = 'TEMPOSEMCONVERSAOEXT'
      FieldName = 'TEMPOSEMCONVERSAOEXT'
      FieldLength = 35
      DisplayWidth = 35
      Position = 32
    end
    object ppTempoServicoppField34: TppField
      FieldAlias = 'TEMPOSEMCONVERSAOEXTSIMULA'
      FieldName = 'TEMPOSEMCONVERSAOEXTSIMULA'
      FieldLength = 35
      DisplayWidth = 35
      Position = 33
    end
    object ppTempoServicoppField35: TppField
      FieldAlias = 'TEMPOINDIVEXT'
      FieldName = 'TEMPOINDIVEXT'
      FieldLength = 35
      DisplayWidth = 35
      Position = 34
    end
    object ppTempoServicoppField36: TppField
      FieldAlias = 'TEMPOTOTALEXT'
      FieldName = 'TEMPOTOTALEXT'
      FieldLength = 35
      DisplayWidth = 35
      Position = 35
    end
    object ppTempoServicoppField37: TppField
      FieldAlias = 'TEMPOTOTALEXTSIMULA'
      FieldName = 'TEMPOTOTALEXTSIMULA'
      FieldLength = 35
      DisplayWidth = 35
      Position = 36
    end
  end
  object dsTempoServico: TwwDataSource
    DataSet = CDSTempoServico
    Left = 39
    Top = 121
  end
  object ppRTempoServico: TppReport
    AutoStop = False
    DataPipeline = ppTempoServico
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 69
    Top = 226
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppTempoServico'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28840
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Relatório de Tempos de Serviço'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 109802
        mmTop = 22754
        mmWidth = 64823
        BandType = 0
      end
      object rpResumoCobrDBImage1: TppDBImage
        UserName = 'rpResumoCobrDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 1323
        mmTop = 529
        mmWidth = 39688
        BandType = 0
      end
      object rpResumoCobrDBText1: TppDBText
        UserName = 'rpResumoCobrDBText1'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 41804
        mmTop = 794
        mmWidth = 133615
        BandType = 0
      end
      object rpResumoCobrDBText2: TppDBText
        UserName = 'rpResumoCobrDBText2'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 41804
        mmTop = 7144
        mmWidth = 25400
        BandType = 0
      end
      object rpResumoCobrDBText3: TppDBText
        UserName = 'rpResumoCobrDBText3'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 41804
        mmTop = 12435
        mmWidth = 69586
        BandType = 0
      end
      object rpResumoCobrDBText11: TppDBText
        UserName = 'rpResumoCobrDBText11'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 41804
        mmTop = 16933
        mmWidth = 20108
        BandType = 0
      end
      object rpResumoCobrLabel10: TppLabel
        UserName = 'rpResumoCobrLabel10'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 41804
        mmTop = 21431
        mmWidth = 5027
        BandType = 0
      end
      object rpResumoCobrDBText14: TppDBText
        UserName = 'rpResumoCobrDBText14'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 49213
        mmTop = 21431
        mmWidth = 17198
        BandType = 0
      end
      object rpResumoCobrDBText12: TppDBText
        UserName = 'rpResumoCobrDBText12'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 62442
        mmTop = 16933
        mmWidth = 48419
        BandType = 0
      end
      object rpResumoCobrDBText13: TppDBText
        UserName = 'rpResumoCobrDBText13'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 111390
        mmTop = 16933
        mmWidth = 17198
        BandType = 0
      end
      object rpResumoCobrDBText10: TppDBText
        UserName = 'rpResumoCobrDBText10'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 111654
        mmTop = 12435
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object ppLinha: TppShape
        UserName = 'Linha'
        Brush.Color = clSilver
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'EMPRESA'
        DataPipeline = ppTempoServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTempoServico'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 265
        mmWidth = 57150
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'DATAINICIO'
        DataPipeline = ppTempoServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTempoServico'
        mmHeight = 3704
        mmLeft = 60325
        mmTop = 265
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'DATAFINAL'
        DataPipeline = ppTempoServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTempoServico'
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 265
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'FLGCONTATSTRANSF'
        DataPipeline = ppTempoServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTempoServico'
        mmHeight = 3704
        mmLeft = 101336
        mmTop = 265
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'FLGCONCOMITANTETRANSF'
        DataPipeline = ppTempoServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTempoServico'
        mmHeight = 3704
        mmLeft = 113242
        mmTop = 265
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CARGO'
        DataPipeline = ppTempoServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTempoServico'
        mmHeight = 3704
        mmLeft = 121973
        mmTop = 265
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'FUNCAO'
        DataPipeline = ppTempoServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTempoServico'
        mmHeight = 3704
        mmLeft = 154517
        mmTop = 265
        mmWidth = 30163
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CODTPINSALUBRI'
        DataPipeline = ppTempoServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTempoServico'
        mmHeight = 3704
        mmLeft = 185473
        mmTop = 265
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'FATOR'
        DataPipeline = ppTempoServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppTempoServico'
        mmHeight = 3704
        mmLeft = 206111
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'TEMPOINDIVEXT'
        DataPipeline = ppTempoServico
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppTempoServico'
        mmHeight = 3704
        mmLeft = 226484
        mmTop = 265
        mmWidth = 54240
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppSystemVariable1: TppSystemVariable
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
        mmLeft = 265
        mmTop = 3175
        mmWidth = 278871
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'AdmPrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 278871
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 252942
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppTempoServico
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppTempoServico'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 49477
        mmPrintPosition = 0
        object ppShape3: TppShape
          UserName = 'Shape3'
          ParentWidth = True
          Shape = stRoundRect
          mmHeight = 10848
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          Shape = stRoundRect
          mmHeight = 12965
          mmLeft = 0
          mmTop = 27781
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label1'
          Caption = 'Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 1588
          mmTop = 44715
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label2'
          Caption = 'Data Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 60325
          mmTop = 44715
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Data Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 80169
          mmTop = 44715
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label4'
          Caption = 'Conta TS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 97367
          mmTop = 44715
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel11: TppLabel
          UserName = 'Label6'
          Caption = 'Cargo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 121973
          mmTop = 44715
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label9'
          Caption = 'Função'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 154517
          mmTop = 44715
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label10'
          Caption = 'Especial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 185473
          mmTop = 44715
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label12'
          Caption = 'Fator'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 215900
          mmTop = 44715
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'Conc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 112184
          mmTop = 44715
          mmWidth = 8467
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label20'
          Caption = 'Participante :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 794
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'NOME'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 24342
          mmTop = 794
          mmWidth = 101600
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'Label22'
          Caption = 'Matrícula : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 196586
          mmTop = 794
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppDBText15: TppDBText
          UserName = 'DBText15'
          DataField = 'MATRICULAATUAL'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 216165
          mmTop = 794
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label13'
          Caption = 'Tempo de Serviço'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 225955
          mmTop = 44715
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object ppLabel16: TppLabel
          UserName = 'Label14'
          Caption = 'Tempo Total com Conversão Simulado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 1852
          mmTop = 29898
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'TEMPOSERVCALCSIMULA'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 95779
          mmTop = 30427
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel17: TppLabel
          UserName = 'Label15'
          Caption = '('
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 110331
          mmTop = 30427
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppDBText14: TppDBText
          UserName = 'DBText14'
          DataField = 'TEMPOTOTALEXTSIMULA'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 112448
          mmTop = 30427
          mmWidth = 58208
          BandType = 3
          GroupNo = 0
        end
        object ppLabel18: TppLabel
          UserName = 'Label16'
          Caption = ')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 172244
          mmTop = 30427
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 48948
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'Label19'
          Caption = 'Tempo Total sem Conversão Simulado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 1852
          mmTop = 34925
          mmWidth = 62177
          BandType = 3
          GroupNo = 0
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          DataField = 'TEMPOSEMCONVSIMULA'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 95779
          mmTop = 35454
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = '('
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 110331
          mmTop = 35454
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'TEMPOSEMCONVERSAOEXTSIMULA'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 112448
          mmTop = 35454
          mmWidth = 58207
          BandType = 3
          GroupNo = 0
        end
        object ppLabel25: TppLabel
          UserName = 'Label25'
          Caption = ')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 172244
          mmTop = 35454
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLabel26: TppLabel
          UserName = 'Label26'
          Caption = 'Data Ref.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 196586
          mmTop = 5292
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = clSilver
          ParentWidth = True
          Shape = stRoundRect
          mmHeight = 12965
          mmLeft = 0
          mmTop = 13229
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label5'
          Caption = 'Tempo Total com Conversão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 1852
          mmTop = 15347
          mmWidth = 46567
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Tempo Total sem Conversão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 1852
          mmTop = 20373
          mmWidth = 46567
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'TEMPOSERVCALC'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 95515
          mmTop = 15346
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'TEMPOSEMCONVERSAO'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 95515
          mmTop = 20638
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label101'
          Caption = '('
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 110067
          mmTop = 20373
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'Label17'
          Caption = '('
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 110067
          mmTop = 15346
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'TEMPOSEMCONVERSAOEXT'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 112184
          mmTop = 20373
          mmWidth = 58207
          BandType = 3
          GroupNo = 0
        end
        object ppDBText20: TppDBText
          UserName = 'DBText20'
          DataField = 'TEMPOTOTALEXT'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 112184
          mmTop = 15346
          mmWidth = 58208
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label201'
          Caption = ')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 171980
          mmTop = 20373
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLabel27: TppLabel
          UserName = 'Label27'
          Caption = ')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 171980
          mmTop = 15346
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppDBText21: TppDBText
          UserName = 'DBText21'
          DataField = 'DATAREF'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 72231
          mmTop = 15347
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object ppDBText22: TppDBText
          UserName = 'DBText22'
          DataField = 'DATAREFSIMULA'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 72230
          mmTop = 30427
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object ppDBText23: TppDBText
          UserName = 'DBText23'
          DataField = 'DATAREF'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 72230
          mmTop = 20638
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object ppDBText24: TppDBText
          UserName = 'DBText24'
          DataField = 'DATAREFSIMULA'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 72230
          mmTop = 35454
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object ppDBText25: TppDBText
          UserName = 'DBText25'
          DataField = 'DATAREF'
          DataPipeline = ppTempoServico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppTempoServico'
          mmHeight = 3969
          mmLeft = 216165
          mmTop = 5292
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 134
    Top = 166
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = CDSFundacao
    Left = 134
    Top = 117
  end
  object CDSTempoServico: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 72
    Data = {
      ED0400009619E0BD010000001800000025000000000003000000ED040E4D4154
      524943554C41415455414C0100490000000100055749445448020002000D000D
      464C4754454D504F4D414E55540800040000000000084944504553534F410800
      040000000000094944504553534A555208000400000000000B53455148495354
      46554E4308000400000000000B4944444F43554D454E544F0800040000000000
      0E434F445450494E53414C554252490100490000000100055749445448020002
      000A0010464C47434F4E544154535452414E5346010049000000010005574944
      54480200020003000A44415441494E4943494F08000800000000000944415441
      46494E414C080008000000000005434152474F01004900000001000557494454
      480200020028000A56414C4F52434152474F08000400000000000646554E4341
      4F01004900000001000557494454480200020028000A56494E43454D50524547
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002000200094D4154524943554C4101004900000001000557
      49445448020002000D0007454D50524553410100490000000100055749445448
      020002003C000954454D504F43414C43080004000000000015464C47434F4E43
      4F4D4954414E54455452414E5346010049000000010005574944544802000200
      03000F464C47434F4E434F4D4954414E54450800040000000000034350460100
      4900000002000753554254595045020049000A00466978656443686172000557
      49445448020002001200054641544F5208000400000000001154454D504F5345
      5256414E544552494F5208000400000000001054454D504F5349544553504543
      49414C08000400000000001154454D504F4E414F43524544495441444F080004
      0000000000044E4F4D450100490000000100055749445448020002003C000A46
      4C47434F4E5441545308000400000000000D54454D504F5345525643414C4308
      000400000000001154454D504F53454D434F4E56455253414F08000400000000
      001354454D504F5345525643414C4353494D554C410800040000000000125445
      4D504F53454D434F4E5653494D554C4108000400000000000744415441524546
      01004900000002000753554254595045020049000A0046697865644368617200
      055749445448020002000A000D4441544152454653494D554C41010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      020002000A001454454D504F53454D434F4E56455253414F4558540100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      480200020023001A54454D504F53454D434F4E56455253414F45585453494D55
      4C4101004900000002000753554254595045020049000A004669786564436861
      72000557494454480200020023000D54454D504F494E44495645585401004900
      000002000753554254595045020049000A004669786564436861720005574944
      54480200020023000D54454D504F544F54414C45585401004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      23001354454D504F544F54414C45585453494D554C4101004900000002000753
      554254595045020049000A004669786564436861720005574944544802000200
      23000100044C4349440400010009080000}
  end
  object CDSFundacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 72
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT EL.MATRICULA AS MATRICULAATUAL, H.FLGTEMPOMANUT,'
      
        '       H.IDPESSOA,   H.IDPESSJUR,  H.SEQHISTFUNC, H.IDDOCUMENTO,' +
        ' H.CODTPINSALUBRI,'
      
        '       DECODE(H.FLGCONTATS,1,'#39'Sim'#39','#39'Não'#39') AS FLGCONTATSTRANSF, H' +
        '.DATAINICIO, H.DATAFINAL,'
      
        '       H.CARGO,       H.VALORCARGO,  H.FUNCAO,     H.VINCEMPREG,' +
        ' H.MATRICULA,   H.EMPRESA,'
      
        '       H.TEMPOCALC,  DECODE(H.FLGCONCOMITANTE,1,'#39'Sim'#39','#39'Não'#39') AS ' +
        'FLGCONCOMITANTETRANSF,'
      '       H.FLGCONCOMITANTE,'
      
        '       H.NUMDOCUMENTO AS CPF,  TI.FATOR,  EL.TEMPOSERVANTERIOR, ' +
        'EL.TEMPOSITESPECIAL,'
      
        '       EL.TEMPONAOCREDITADO, P.NOME, NVL(H.FLGCONTATS, 0) AS FLG' +
        'CONTATS,'
      '       EL.TEMPOSERVCALC, EL.TEMPOSIMPLES AS TEMPOSEMCONVERSAO,'
      
        '       0 AS TEMPOSERVCALCSIMULA, 0 AS TEMPOSEMCONVSIMULA, '#39'DD/MM' +
        '/YYYY'#39' AS DATAREF, '#39'DD/MM/YYYY'#39' AS DATAREFSIMULA,'
      
        '         '#39'100 ano(s), 11 mes(es) e 29 dia(s) '#39' AS TEMPOSEMCONVER' +
        'SAOEXT,'
      
        '         '#39'100 ano(s), 11 mes(es) e 29 dia(s) '#39' AS TEMPOSEMCONVER' +
        'SAOEXTSIMULA,'
      '         '#39'100 ano(s), 11 mes(es) e 29 dia(s) '#39' AS TEMPOINDIVEXT,'
      '         '#39'100 ano(s), 11 mes(es) e 29 dia(s) '#39' AS TEMPOTOTALEXT,'
      
        '         '#39'100 ano(s), 11 mes(es) e 29 dia(s) '#39' AS TEMPOTOTALEXTS' +
        'IMULA'
      '        FROM'
      '         PESSOA P,'
      
        '         ELEGPATRO EL,                                          ' +
        '                                '
      
        '         HISTFUNCPREV H,                                        ' +
        '                                '
      
        '        TPINSALUBRI TI                                          ' +
        '                               '
      '       WHERE 1 = 2 '
      ' '
      ' ')
    ClientDataSet = CDSTempoServico
    Left = 232
    Top = 72
  end
end
