inherited dtmRelFolhaRecVencimento: TdtmRelFolhaRecVencimento
  Left = 471
  Top = 183
  Width = 324
  Height = 151
  Caption = 'dtmRelFolhaRecVencimento'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'IdImovelMestre'
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
        Name = 'IdImovelMestre'
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
        Caption = 'dAnoComp'
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
        Name = 'dAnoComp'
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
        Caption = 'dMesComp'
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
        Name = 'dMesComp'
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
        Caption = 'dVencInicial'
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
        Name = 'dVencFinal'
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
        Caption = 'dVencFinal'
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
        Name = 'dVencFinal'
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
        Caption = 'IdModulo'
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
        Name = 'IdModulo'
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
        Name = 'bSeparador'
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
        Name = 'bCorLinha'
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
        Name = 'iCorLinha'
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
        Caption = 'sNomeImovel'
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
        Name = 'sNomeImovel'
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
    Report = rptFolhaRecVencimento
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  object rptFolhaRecVencimento: TppReport
    AutoStop = False
    DataPipeline = ppl
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    DeviceType = 'Screen'
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 232
    Top = 8
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppl'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23283
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
        mmWidth = 284428
        BandType = 0
      end
      object ppLabel148: TppLabel
        UserName = 'ppLabel148'
        AutoSize = False
        Caption = 'Folha de Receitas por Vencimento'
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
        mmWidth = 284428
        BandType = 0
      end
      object ppLogoTipo: TppImage
        UserName = 'ppLogoTipo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15610
        mmLeft = 265
        mmTop = 0
        mmWidth = 15611
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 16404
        mmWidth = 284300
        BandType = 0
      end
      object lblImovelMestre: TppLabel
        UserName = 'lblImovelMestre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3429
        mmLeft = 794
        mmTop = 17992
        mmWidth = 70104
        BandType = 0
      end
      object lblPeriodoVenc: TppLabel
        UserName = 'lblPeriodoVenc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3429
        mmLeft = 107161
        mmTop = 17992
        mmWidth = 70104
        BandType = 0
      end
      object lblCompetencia: TppLabel
        UserName = 'lblCompetencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3429
        mmLeft = 204270
        mmTop = 17992
        mmWidth = 70104
        BandType = 0
      end
    end
    object ppDBandaDetalhe: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object ppsCor: TppShape
        OnPrint = ppsCorPrint
        UserName = 'ShapeResumoFolha1'
        Brush.Color = 13040076
        ParentHeight = True
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 5556
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAVENCIMENTO'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 794
        mmTop = 794
        mmWidth = 19579
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText101'
        BlankWhenZero = True
        DataField = 'VLR_ALUGUEL'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 32544
        mmTop = 794
        mmWidth = 23284
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        BlankWhenZero = True
        DataField = 'VLR_IPTU'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 57679
        mmTop = 794
        mmWidth = 23284
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        BlankWhenZero = True
        DataField = 'VLR_SEGURO'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 82815
        mmTop = 794
        mmWidth = 23284
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        BlankWhenZero = True
        DataField = 'VLR_OUTRO'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 107950
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'VLR_TOTAL'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 133086
        mmTop = 794
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'QTDE'
        DataPipeline = ppl
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 22225
        mmTop = 794
        mmWidth = 7144
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        BlankWhenZero = True
        DataField = 'VLR_PAGO'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 183357
        mmTop = 794
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'PER_PAGO'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 213519
        mmTop = 794
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        BlankWhenZero = True
        DataField = 'VLR_ABERTO'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 232834
        mmTop = 794
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'PER_REC'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 158221
        mmTop = 794
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        BlankWhenZero = True
        DataField = 'PER_ABERTO'
        DataPipeline = ppl
        DisplayFormat = '###,##0.00%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppl'
        mmHeight = 3704
        mmLeft = 257969
        mmTop = 794
        mmWidth = 17463
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6085
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
        mmTop = 1323
        mmWidth = 65617
        BandType = 8
      end
      object ppLine41: TppLine
        UserName = 'ppLine41'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
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
        mmLeft = 120386
        mmTop = 1323
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
        mmLeft = 243682
        mmTop = 1323
        mmWidth = 35454
        BandType = 8
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 265
        mmLeft = 0
        mmTop = 5819
        mmWidth = 284300
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = ppl
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppl'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5291
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Aluguel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 32544
          mmTop = 794
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 794
          mmTop = 794
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'IPTU'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 57679
          mmTop = 794
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Seguro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 82815
          mmTop = 794
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Outras Receitas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 107950
          mmTop = 794
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 133086
          mmTop = 794
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          AutoSize = False
          Caption = 'Qtde'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 22225
          mmTop = 794
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
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
          mmLeft = 183357
          mmTop = 794
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label11'
          AutoSize = False
          Caption = '% Pago'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 213519
          mmTop = 794
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'Valor Aberto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 232834
          mmTop = 794
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'Percentual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 158221
          mmTop = 794
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = '% Aberto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 257969
          mmTop = 794
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12171
        mmPrintPosition = 0
        object ppRegion1: TppRegion
          UserName = 'Region1'
          mmHeight = 6085
          mmLeft = 7144
          mmTop = 1588
          mmWidth = 272521
          BandType = 5
          GroupNo = 1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel11: TppLabel
            UserName = 'Label9'
            Caption = 'Total: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3440
            mmLeft = 11642
            mmTop = 2910
            mmWidth = 8467
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc2: TppDBCalc
            UserName = 'DBCalc2'
            BlankWhenZero = True
            DataField = 'VLR_ALUGUEL'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 32544
            mmTop = 2910
            mmWidth = 23284
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc1: TppDBCalc
            UserName = 'DBCalc1'
            BlankWhenZero = True
            DataField = 'VLR_IPTU'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 57680
            mmTop = 2910
            mmWidth = 23284
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc3: TppDBCalc
            UserName = 'DBCalc3'
            BlankWhenZero = True
            DataField = 'VLR_OUTRO'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 107951
            mmTop = 2910
            mmWidth = 23548
            BandType = 5
            GroupNo = 1
          end
          object ppDBCalc4: TppDBCalc
            UserName = 'DBCalc4'
            BlankWhenZero = True
            DataField = 'VLR_SEGURO'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 82815
            mmTop = 2910
            mmWidth = 23284
            BandType = 5
            GroupNo = 1
          end
          object ppVlrTotal: TppDBCalc
            UserName = 'VlrTotal'
            BlankWhenZero = True
            DataField = 'VLR_TOTAL'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 133086
            mmTop = 2910
            mmWidth = 23283
            BandType = 5
            GroupNo = 1
          end
          object ppVlrPago: TppDBCalc
            UserName = 'VlrPago'
            BlankWhenZero = True
            DataField = 'VLR_PAGO'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 183357
            mmTop = 2910
            mmWidth = 23283
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc8: TppDBCalc
            UserName = 'DBCalc8'
            BlankWhenZero = True
            DataField = 'VLR_ABERTO'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 232834
            mmTop = 2910
            mmWidth = 23283
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc9: TppDBCalc
            UserName = 'DBCalc9'
            BlankWhenZero = True
            DataField = 'PER_REC'
            DataPipeline = ppl
            DisplayFormat = '###,##0.00%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 158222
            mmTop = 2910
            mmWidth = 23283
            BandType = 5
            GroupNo = 0
          end
          object ppvPerPago: TppVariable
            UserName = 'vPerPago'
            CalcOrder = 0
            DataType = dtCurrency
            DisplayFormat = ',0.00%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3440
            mmLeft = 213520
            mmTop = 2910
            mmWidth = 17463
            BandType = 5
            GroupNo = 0
          end
          object ppvPerAberto: TppVariable
            UserName = 'vPerAberto'
            CalcOrder = 1
            DataType = dtCurrency
            DisplayFormat = ',0.00%'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3440
            mmLeft = 257970
            mmTop = 2910
            mmWidth = 17463
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc5: TppDBCalc
            UserName = 'DBCalc5'
            BlankWhenZero = True
            DataField = 'QTDE'
            DataPipeline = ppl
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ParentDataPipeline = False
            ResetGroup = ppGroup2
            TextAlignment = taCentered
            Transparent = True
            DataPipelineName = 'ppl'
            mmHeight = 3440
            mmLeft = 22226
            mmTop = 2910
            mmWidth = 7145
            BandType = 5
            GroupNo = 0
          end
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D65061B
        47726F7570466F6F74657242616E64324265666F72655072696E740B50726F67
        72616D54797065070B747450726F63656475726506536F7572636506AA70726F
        6365647572652047726F7570466F6F74657242616E64324265666F7265507269
        6E743B0D0A626567696E0D0A202020765065725061676F2E4173446F75626C65
        203A3D2028566C725061676F2E56616C7565202A2031303029202F20566C7254
        6F74616C2E56616C75653B0D0A2020207650657241626572746F2E4173446F75
        626C65203A3D20313030202D20765065725061676F2E4173446F75626C653B0D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65061047726F7570466F6F74
        657242616E6432094576656E744E616D65060B4265666F72655072696E740745
        76656E74494402180000}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppl: TppBDEPipeline
    DataSource = ds
    UserName = 'ppl'
    Left = 104
    Top = 57
    object pplppField1: TppField
      FieldAlias = 'DATAVENCIMENTO'
      FieldName = 'DATAVENCIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplppField2: TppField
      FieldAlias = 'QTDE'
      FieldName = 'QTDE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplppField3: TppField
      FieldAlias = 'VLR_ALUGUEL'
      FieldName = 'VLR_ALUGUEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplppField4: TppField
      FieldAlias = 'VLR_IPTU'
      FieldName = 'VLR_IPTU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplppField5: TppField
      FieldAlias = 'VLR_SEGURO'
      FieldName = 'VLR_SEGURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplppField6: TppField
      FieldAlias = 'VLR_OUTRO'
      FieldName = 'VLR_OUTRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplppField7: TppField
      FieldAlias = 'VLR_TOTAL'
      FieldName = 'VLR_TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplppField8: TppField
      FieldAlias = 'PER_REC'
      FieldName = 'PER_REC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplppField9: TppField
      FieldAlias = 'VLR_PAGO'
      FieldName = 'VLR_PAGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplppField10: TppField
      FieldAlias = 'PER_PAGO'
      FieldName = 'PER_PAGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplppField11: TppField
      FieldAlias = 'VLR_ABERTO'
      FieldName = 'VLR_ABERTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplppField12: TppField
      FieldAlias = 'PER_ABERTO'
      FieldName = 'PER_ABERTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplppField13: TppField
      FieldAlias = 'GRUPO'
      FieldName = 'GRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 57
    object cdsDATAVENCIMENTO: TDateTimeField
      FieldName = 'DATAVENCIMENTO'
    end
    object cdsQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object cdsVLR_ALUGUEL: TFloatField
      FieldName = 'VLR_ALUGUEL'
    end
    object cdsVLR_IPTU: TFloatField
      FieldName = 'VLR_IPTU'
    end
    object cdsVLR_SEGURO: TFloatField
      FieldName = 'VLR_SEGURO'
    end
    object cdsVLR_OUTRO: TFloatField
      FieldName = 'VLR_OUTRO'
    end
    object cdsVLR_TOTAL: TFloatField
      FieldName = 'VLR_TOTAL'
    end
    object cdsPER_REC: TFloatField
      FieldName = 'PER_REC'
    end
    object cdsVLR_PAGO: TFloatField
      FieldName = 'VLR_PAGO'
    end
    object cdsPER_PAGO: TFloatField
      FieldName = 'PER_PAGO'
    end
    object cdsVLR_ABERTO: TFloatField
      FieldName = 'VLR_ABERTO'
    end
    object cdsPER_ABERTO: TFloatField
      FieldName = 'PER_ABERTO'
    end
    object cdsGRUPO: TFloatField
      FieldName = 'GRUPO'
    end
  end
  object ds: TwwDataSource
    DataSet = cds
    Left = 32
    Top = 68
  end
  object CMSql: TCMSqlParams
    SQL.Strings = (
      'SELECT CONT.DATAVENCIMENTO, CONT.QTDE, 1 AS GRUPO,'
      '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0)) AS VLR_ALUGUEL, '
      '       SUM(NVL(IPTU.VLR_IPTU,0))       AS VLR_IPTU, '
      '       SUM(NVL(SEGURO.VLR_SEGURO,0))   AS VLR_SEGURO, '
      '       SUM(NVL(OUTRO.VLR_OUTRO,0))     AS VLR_OUTRO, '
      '       '
      '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0))+'
      '       SUM(NVL(IPTU.VLR_IPTU,0))+'
      '       SUM(NVL(SEGURO.VLR_SEGURO,0))+'
      '       SUM(NVL(OUTRO.VLR_OUTRO,0)) AS VLR_TOTAL, '
      '       '
      '       ROUND((SUM(NVL(ALUGUEL.VLR_ALUGUEL,0))+'
      '              SUM(NVL(IPTU.VLR_IPTU,0))+'
      '              SUM(NVL(SEGURO.VLR_SEGURO,0))+'
      
        '              SUM(NVL(OUTRO.VLR_OUTRO,0)) * 100) / MIN(TOT.VLR_T' +
        'OTAL) * 100,2) AS PER_REC,'
      '              '
      '       NVL(PAG.VLR_PAGO,0) AS VLR_PAGO,'
      '       '
      
        '       NVL( ROUND((PAG.VLR_PAGO * 100) / SUM(ALUGUEL.VLR_ALUGUEL' +
        ')+'
      '                                         SUM(IPTU.VLR_IPTU)+'
      '                                         SUM(SEGURO.VLR_SEGURO)+'
      
        '                                         SUM(OUTRO.VLR_OUTRO),2)' +
        ' ,0) AS PER_PAGO,'
      '                                           '
      '       SUM(NVL(ALUGUEL.VLR_ALUGUEL,0))+'
      '       SUM(NVL(IPTU.VLR_IPTU,0))+'
      '       SUM(NVL(SEGURO.VLR_SEGURO,0))+'
      
        '       SUM(NVL(OUTRO.VLR_OUTRO,0)) - NVL(PAG.VLR_PAGO,0) AS VLR_' +
        'ABERTO,'
      '       '
      
        '       NVL( 100 - ROUND((PAG.VLR_PAGO * 100) / SUM(ALUGUEL.VLR_A' +
        'LUGUEL)+'
      
        '                                               SUM(IPTU.VLR_IPTU' +
        ')+'
      
        '                                               SUM(SEGURO.VLR_SE' +
        'GURO)+'
      
        '                                               SUM(OUTRO.VLR_OUT' +
        'RO),2) ,0) AS PER_ABERTO'
      '                                                 '
      
        'FROM ( SELECT DOC.DATAVENCIMENTO, DOC.MESCOMPETENCIA, DOC.ANOCOM' +
        'PETENCIA, COUNT(DOC.IDDOCUMENTO) AS QTDE'
      
        '       FROM ( SELECT LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.AN' +
        'OCOMPETENCIA, LI.IDDOCUMENTO'
      
        '              FROM LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVE' +
        'L I'
      
        '              WHERE ( LI.RECPAG           = '#39'R'#39' )               ' +
        '                                      '
      '                AND ( LI.IDIMOVEL         = I.IDIMOVEL )'
      
        '                AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )' +
        '                                      '
      '                AND ( C.FLGTIPOCONTRATO   IN('#39'L'#39','#39'D'#39') ) '
      
        '                AND ( LI.DATAVENCIMENTO BETWEEN TO_DATE( '#39'01/01/' +
        '2007'#39' ) AND TO_DATE( '#39'09/07/2007'#39' ) )'
      
        '              GROUP BY LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.' +
        'ANOCOMPETENCIA, LI.IDDOCUMENTO, I.IDIMOVELMESTRE ) DOC /* FIM DO' +
        'C */'
      
        '       GROUP BY DOC.DATAVENCIMENTO, DOC.MESCOMPETENCIA, DOC.ANOC' +
        'OMPETENCIA ) CONT, /* FIM CONT */'
      '       '
      '     ( SELECT SUM(NVL(DOC.VLR_TOTAL,0)) AS VLR_TOTAL'
      
        '       FROM ( SELECT LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.AN' +
        'OCOMPETENCIA, LI.IDDOCUMENTO,'
      
        '                    (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_' +
        'DESC),0)) AS VLR_TOTAL '
      
        '              FROM LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVE' +
        'L I,'
      
        '                 ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS ' +
        'TOT_DESC'
      '                   FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '
      '                   WHERE A.CODALTERADOR = T.CODALTERADOR '
      '                     AND T.ACRESDECRES  = '#39'C'#39' '
      '                   GROUP BY IDDOCUMENTO ) DE                   '
      '              WHERE ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) )'
      '                AND ( LI.RECPAG           = '#39'R'#39' ) '
      '                AND ( LI.IDIMOVEL         = I.IDIMOVEL )'
      
        '                AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )' +
        ' '
      '                AND ( C.FLGTIPOCONTRATO   IN('#39'L'#39','#39'D'#39') ) '
      
        '                AND ( LI.DATAVENCIMENTO BETWEEN TO_DATE( '#39'01/01/' +
        '2007'#39' ) AND TO_DATE( '#39'09/07/2007'#39' ) )'
      
        '              GROUP BY LI.DATAVENCIMENTO, LI.MESCOMPETENCIA, LI.' +
        'ANOCOMPETENCIA, LI.IDDOCUMENTO ) DOC /* FIM DOC/TOT */'
      '     ) TOT, /* FIM TOT */'
      '     '
      
        '     ( SELECT DOC.DATAVENCIMENTO, SUM(NVL(L.VALOR,0)) AS VLR_PAG' +
        'O'
      
        '       FROM LANCTODOCUM L,                                      ' +
        '              '
      
        '          ( SELECT LI.DATAVENCIMENTO, LI.CODDOCUMENTO           ' +
        '            '
      
        '            FROM LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, IMOVEL ' +
        'I'
      '            WHERE ( LI.RECPAG           = '#39'R'#39' ) '
      '              AND ( LI.IDIMOVEL         = I.IDIMOVEL )'
      '              AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '
      '              AND ( C.FLGTIPOCONTRATO   IN('#39'L'#39','#39'D'#39') ) '
      
        '              AND ( LI.DATAVENCIMENTO BETWEEN TO_DATE( '#39'01/01/20' +
        '07'#39' ) AND TO_DATE( '#39'09/07/2007'#39' ) )'
      
        '            GROUP BY LI.DATAVENCIMENTO, LI.CODDOCUMENTO ) DOC /*' +
        ' FIM DOC/PAG */'
      '       WHERE DOC.CODDOCUMENTO = L.CODDOCUMENTO'
      '         AND TRIM(L.OPERACAO) = '#39'5'#39
      '         AND L.ESTORNO IS NULL         '
      '       GROUP BY DOC.DATAVENCIMENTO ) PAG, /* FIM PAG */'
      '       '
      '     ( SELECT LI.DATAVENCIMENTO, LI.IDDOCUMENTO, '
      
        '             (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0' +
        ')) AS VLR_ALUGUEL '
      
        '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C,' +
        ' IMOVEL I,'
      
        '          ( SELECT A.IDDOCUMENTO, SUM(NVL(A.VLRALTERADOR,0)) AS ' +
        'TOT_DESC'
      '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '
      '            WHERE A.CODALTERADOR = T.CODALTERADOR '
      '              AND T.ACRESDECRES  = '#39'C'#39' '
      '            GROUP BY IDDOCUMENTO ) DE '
      '       WHERE ( LI.RECPAG           = '#39'R'#39' ) '
      '         AND ( LI.IDIMOVEL         = I.IDIMOVEL )'
      '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '
      '         AND ( C.FLGTIPOCONTRATO   IN('#39'L'#39','#39'D'#39') ) '
      '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '
      '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '
      
        '         AND ( LI.DATAVENCIMENTO BETWEEN TO_DATE( '#39'01/01/2007'#39' )' +
        ' AND TO_DATE( '#39'09/07/2007'#39' ) )'
      
        '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIP' +
        'OCUSTORECIMO '
      
        '                                         FROM PROCESSOIMOB P, IT' +
        'EMXPROCESSOIMOB I '
      
        '                                         WHERE P.IDPROCESSOIMOB ' +
        '= I.IDPROCESSOIMOB '
      
        '                                           AND P.IDREPORTS      ' +
        '= 20341'
      
        '                                           AND P.TIPOINTERNO    ' +
        '= 1 /* Aluguel */ '
      
        '                                           AND P.IDMODULO       ' +
        '= 64 ) ) '
      '       GROUP BY LI.DATAVENCIMENTO, LI.IDDOCUMENTO ) ALUGUEL, '
      '       '
      '     ( SELECT LI.DATAVENCIMENTO, LI.IDDOCUMENTO, '
      
        '             (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0' +
        ')) AS VLR_IPTU '
      
        '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C,' +
        ' IMOVEL I,'
      
        '          ( SELECT A.IDDOCUMENTO, SUM(NVL(A.VLRALTERADOR,0)) AS ' +
        'TOT_DESC '
      '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '
      '            WHERE A.CODALTERADOR = T.CODALTERADOR '
      '              AND T.ACRESDECRES  = '#39'C'#39' '
      '            GROUP BY IDDOCUMENTO ) DE '
      '       WHERE ( LI.RECPAG           = '#39'R'#39' ) '
      '         AND ( LI.IDIMOVEL         = I.IDIMOVEL )'
      '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '
      '         AND ( C.FLGTIPOCONTRATO   IN('#39'L'#39','#39'D'#39') ) '
      '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '
      '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '
      
        '         AND ( LI.DATAVENCIMENTO BETWEEN TO_DATE( '#39'01/01/2007'#39' )' +
        ' AND TO_DATE( '#39'09/07/2007'#39' ) )'
      
        '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIP' +
        'OCUSTORECIMO '
      
        '                                         FROM PROCESSOIMOB P, IT' +
        'EMXPROCESSOIMOB I '
      
        '                                         WHERE P.IDPROCESSOIMOB ' +
        '= I.IDPROCESSOIMOB '
      
        '                                           AND P.IDREPORTS   = 2' +
        '0341 '
      
        '                                           AND P.TIPOINTERNO = 2' +
        ' /* IPTU */ '
      
        '                                           AND P.IDMODULO    = 6' +
        '4 ) ) '
      '       GROUP BY LI.DATAVENCIMENTO,  LI.IDDOCUMENTO ) IPTU, '
      '       '
      '     ( SELECT LI.DATAVENCIMENTO, LI.IDDOCUMENTO, '
      
        '            (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0)' +
        ') AS VLR_SEGURO '
      
        '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C,' +
        ' IMOVEL I,'
      
        '          ( SELECT A.IDDOCUMENTO, SUM(NVL(A.VLRALTERADOR,0)) AS ' +
        'TOT_DESC '
      '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '
      '            WHERE A.CODALTERADOR = T.CODALTERADOR '
      '              AND T.ACRESDECRES  = '#39'C'#39' '
      '            GROUP BY IDDOCUMENTO ) DE '
      '       WHERE ( LI.RECPAG           = '#39'R'#39' ) '
      '         AND ( LI.IDIMOVEL         = I.IDIMOVEL )'
      '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '
      '         AND ( C.FLGTIPOCONTRATO   IN('#39'L'#39','#39'D'#39') ) '
      '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '
      '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '
      
        '         AND ( LI.DATAVENCIMENTO BETWEEN TO_DATE( '#39'01/01/2007'#39' )' +
        ' AND TO_DATE( '#39'09/07/2007'#39' ) )'
      
        '         AND ( LI.IDTIPOCUSTORECIMO IN ( SELECT DISTINCT I.IDTIP' +
        'OCUSTORECIMO '
      
        '                                         FROM PROCESSOIMOB P, IT' +
        'EMXPROCESSOIMOB I '
      
        '                                         WHERE P.IDPROCESSOIMOB ' +
        '= I.IDPROCESSOIMOB '
      
        '                                           AND P.IDREPORTS   = 2' +
        '0341 '
      
        '                                           AND P.TIPOINTERNO = 3' +
        ' /* Seguro */ '
      
        '                                           AND P.IDMODULO    = 6' +
        '4 ) ) '
      '       GROUP BY LI.DATAVENCIMENTO, LI.IDDOCUMENTO ) SEGURO, '
      '       '
      '     ( SELECT LI.DATAVENCIMENTO, LI.IDDOCUMENTO, '
      
        '             (NVL(SUM(LI.VLRLANCRECEB),0)-NVL(MIN(DE.TOT_DESC),0' +
        ')) AS VLR_OUTRO '
      
        '       FROM DOCUMENTO D, LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C,' +
        ' IMOVEL I,'
      
        '          ( SELECT A.IDDOCUMENTO, SUM(NVL(A.VLRALTERADOR,0)) AS ' +
        'TOT_DESC '
      '            FROM ALTERALANCIMOVEL A, TIPOALTERADOR T '
      '            WHERE A.CODALTERADOR = T.CODALTERADOR '
      '              AND T.ACRESDECRES  = '#39'C'#39' '
      '            GROUP BY IDDOCUMENTO ) DE '
      '       WHERE ( LI.RECPAG = '#39'R'#39' ) '
      '         AND ( LI.IDIMOVEL         = I.IDIMOVEL )'
      '         AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL ) '
      '         AND ( C.FLGTIPOCONTRATO   IN('#39'L'#39','#39'D'#39') ) '
      '         AND ( LI.CODDOCUMENTO     = D.CODDOCUMENTO(+) ) '
      '         AND ( LI.IDDOCUMENTO      = DE.IDDOCUMENTO(+) ) '
      
        '         AND ( LI.DATAVENCIMENTO BETWEEN TO_DATE( '#39'01/01/2007'#39' )' +
        ' AND TO_DATE( '#39'09/07/2007'#39' ) )'
      
        '         AND ( LI.IDTIPOCUSTORECIMO NOT IN ( SELECT DISTINCT I.I' +
        'DTIPOCUSTORECIMO '
      
        '                                             FROM PROCESSOIMOB P' +
        ', ITEMXPROCESSOIMOB I '
      
        '                                             WHERE P.IDPROCESSOI' +
        'MOB = I.IDPROCESSOIMOB '
      
        '                                               AND P.IDREPORTS  ' +
        ' = 20341 '
      
        '                                               AND P.TIPOINTERNO' +
        ' IN(1,2,3) /* Outras */ '
      
        '                                               AND P.IDMODULO   ' +
        ' = 64 ) ) '
      '       GROUP BY LI.DATAVENCIMENTO, LI.IDDOCUMENTO ) OUTRO '
      'WHERE 1=1                                                  '
      
        '  AND ( CONT.DATAVENCIMENTO BETWEEN TO_DATE( '#39'01/01/2007'#39' ) AND ' +
        'TO_DATE( '#39'09/07/2007'#39' ) )'
      '  AND CONT.DATAVENCIMENTO   = ALUGUEL.DATAVENCIMENTO(+) '
      '  AND CONT.DATAVENCIMENTO   = IPTU.DATAVENCIMENTO(+) '
      '  AND CONT.DATAVENCIMENTO   = SEGURO.DATAVENCIMENTO(+) '
      '  AND CONT.DATAVENCIMENTO   = OUTRO.DATAVENCIMENTO(+) '
      '  AND CONT.DATAVENCIMENTO   = PAG.DATAVENCIMENTO(+)'
      'GROUP BY CONT.DATAVENCIMENTO, CONT.QTDE, PAG.VLR_PAGO'
      'ORDER BY DATAVENCIMENTO '
      ' ')
    Left = 38
    Top = 79
  end
end
