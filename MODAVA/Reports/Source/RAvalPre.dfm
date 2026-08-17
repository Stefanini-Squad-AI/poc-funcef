inherited rptAvalPre: TrptAvalPre
  Left = 254
  Top = 215
  Width = 285
  Height = 271
  Caption = 'RptAvalPre'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'IdPessoa'
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
        Name = 'IdPessoa'
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
        Caption = 'TipoAval'
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
        Name = 'TipoAval'
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
        Caption = 'NumSeq'
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
        Name = 'NumSeq'
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
        Caption = 'SeqRelat'
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
        Name = 'SeqRelat'
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
        Caption = 'ComObserv'
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
        Name = 'ComObserv'
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
    Report = rpAvalPre
    ConnectionType = cntBDE
  end
  object rpAvalPre: TppReport
    AutoStop = False
    DataPipeline = ppAvalPre
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
    DeviceType = 'Screen'
    Left = 224
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 41275
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppAvalPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 86519
        mmTop = 1852
        mmWidth = 24342
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'DESCRTIPOAVAL'
        DataPipeline = ppAvalPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 80698
        mmTop = 8731
        mmWidth = 35983
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Cargo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 22754
        mmWidth = 10583
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Avaliador:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102659
        mmTop = 17463
        mmWidth = 15610
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 17463
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Avaliação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102659
        mmTop = 22754
        mmWidth = 16140
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'C.Custo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 1588
        mmTop = 28046
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Data:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 102923
        mmTop = 28046
        mmWidth = 8467
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'EMPREGADO'
        DataPipeline = ppAvalPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 12965
        mmTop = 17463
        mmWidth = 86784
        BandType = 0
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CARGO'
        DataPipeline = ppAvalPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 12965
        mmTop = 22754
        mmWidth = 86784
        BandType = 0
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CENTROCUSTO'
        DataPipeline = ppAvalPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 16404
        mmTop = 28046
        mmWidth = 83079
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'AVALIADOR'
        DataPipeline = ppAvalPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 120121
        mmTop = 17463
        mmWidth = 73290
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'AVALIACAO'
        DataPipeline = ppAvalPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 120121
        mmTop = 22754
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        AutoSize = True
        DataField = 'DATAREAL'
        DataPipeline = ppAvalPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 120121
        mmTop = 28046
        mmWidth = 18521
        BandType = 0
      end
      object rpFormAvalBrancoLbl1: TppLabel
        UserName = 'rpBenefPorPessoaLbl1'
        AutoSize = False
        Caption = 'Folha:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160338
        mmTop = 7938
        mmWidth = 9790
        BandType = 0
      end
      object rpFormAvalBrancoLbl2: TppLabel
        UserName = 'rpBenefPorPessoaLbl2'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 155311
        mmTop = 12171
        mmWidth = 14817
        BandType = 0
      end
      object rpFormAvalBrancoCalc1: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 7938
        mmWidth = 7938
        BandType = 0
      end
      object rpFormAvalBrancoCalc2: TppSystemVariable
        UserName = 'rpBenefPorPessoaCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 170921
        mmTop = 12171
        mmWidth = 22225
        BandType = 0
      end
      object rpLblFator: TppLabel
        UserName = 'rpLblFator'
        Caption = 'Fator de Avaliação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 9260
        mmTop = 36248
        mmWidth = 31485
        BandType = 0
      end
      object rpLblGrau: TppLabel
        UserName = 'rpLblGrau'
        Caption = 'Grau Obtido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 131498
        mmTop = 36248
        mmWidth = 20638
        BandType = 0
      end
      object rpLblPeso: TppLabel
        UserName = 'rpLblPeso'
        Caption = 'Peso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 159544
        mmTop = 36248
        mmWidth = 8467
        BandType = 0
      end
      object rpLblNota: TppLabel
        UserName = 'rpLblNota'
        Caption = 'Nota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsUnderline]
        Transparent = True
        mmHeight = 4233
        mmLeft = 177271
        mmTop = 36248
        mmWidth = 7938
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DESCRFATORAVAL'
        DataPipeline = ppAvalPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 9260
        mmTop = 794
        mmWidth = 123031
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'GRAU'
        DataPipeline = ppAvalPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 135732
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PESO'
        DataPipeline = ppAvalPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 151607
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NOTA'
        DataPipeline = ppAvalPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 168805
        mmTop = 794
        mmWidth = 17198
        BandType = 4
      end
      object rpAvalPreRegiaoObserv: TppRegion
        UserName = 'rpAvalPreRegiaoObserv'
        Pen.Style = psClear
        Stretch = True
        Visible = False
        mmHeight = 6085
        mmLeft = 15875
        mmTop = 5027
        mmWidth = 116417
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpAvalPreObservAval: TppMemo
          UserName = 'rpAvalPreObservAval'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Stretch = True
          Transparent = True
          mmHeight = 4498
          mmLeft = 17198
          mmTop = 5821
          mmWidth = 113771
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
      end
    end
    object ppSummaryBand1: TppSummaryBand
      BeforePrint = ppSummaryBand1BeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 54504
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppAvalPre
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
          Left = 136
          Top = 120
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand1: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 13758
            mmPrintPosition = 0
            object ppLabel11: TppLabel
              UserName = 'Label11'
              Caption = 'Pontos Fortes:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4763
              mmTop = 2117
              mmWidth = 25135
              BandType = 1
            end
            object ppDBMemo1: TppDBMemo
              UserName = 'DBMemo1'
              CharWrap = False
              DataField = 'FORTES'
              DataPipeline = ppAvalPre
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 5292
              mmLeft = 4763
              mmTop = 7673
              mmWidth = 186533
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 4763
              mmTop = 1323
              mmWidth = 186533
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        ShiftRelativeTo = ppSubReport1
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 9260
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppAvalPre
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
          Left = 176
          Top = 160
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand2: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 13758
            mmPrintPosition = 0
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Pontos Fracos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4763
              mmTop = 2381
              mmWidth = 25929
              BandType = 1
            end
            object ppDBMemo3: TppDBMemo
              UserName = 'DBMemo3'
              CharWrap = False
              DataField = 'FRACOS'
              DataPipeline = ppAvalPre
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 5292
              mmLeft = 4763
              mmTop = 7408
              mmWidth = 186532
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 4763
              mmTop = 1588
              mmWidth = 186532
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport3: TppSubReport
        UserName = 'SubReport3'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        ShiftRelativeTo = ppSubReport2
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 15610
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport3: TppChildReport
          AutoStop = False
          DataPipeline = ppAvalPre
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
          Left = 216
          Top = 200
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand3: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 13494
            mmPrintPosition = 0
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Principais Limitações:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4763
              mmTop = 2381
              mmWidth = 37571
              BandType = 1
            end
            object ppDBMemo5: TppDBMemo
              UserName = 'DBMemo5'
              CharWrap = False
              DataField = 'LIMITACOES'
              DataPipeline = ppAvalPre
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 5292
              mmLeft = 4763
              mmTop = 7938
              mmWidth = 186532
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppLine4: TppLine
              UserName = 'Line4'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 4763
              mmTop = 1588
              mmWidth = 186532
              BandType = 1
            end
          end
          object ppDetailBand4: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport4: TppSubReport
        UserName = 'SubReport4'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        ShiftRelativeTo = ppSubReport3
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 21960
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport4: TppChildReport
          AutoStop = False
          DataPipeline = ppAvalPre
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
          Left = 256
          Top = 240
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand4: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 13758
            mmPrintPosition = 0
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Metas Para o Próximo Período:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4763
              mmTop = 2381
              mmWidth = 52388
              BandType = 1
            end
            object ppDBMemo2: TppDBMemo
              UserName = 'DBMemo2'
              CharWrap = False
              DataField = 'METAS'
              DataPipeline = ppAvalPre
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 5292
              mmLeft = 4763
              mmTop = 7673
              mmWidth = 186532
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppLine5: TppLine
              UserName = 'Line5'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 4763
              mmTop = 1588
              mmWidth = 186532
              BandType = 1
            end
          end
          object ppDetailBand5: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport5: TppSubReport
        UserName = 'SubReport5'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        ShiftRelativeTo = ppSubReport4
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 28310
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport5: TppChildReport
          AutoStop = False
          DataPipeline = ppAvalPre
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
          Left = 296
          Top = 280
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand5: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 12700
            mmPrintPosition = 0
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Medidas Recomendadas:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4763
              mmTop = 2117
              mmWidth = 42598
              BandType = 1
            end
            object ppDBMemo4: TppDBMemo
              UserName = 'DBMemo4'
              CharWrap = False
              DataField = 'MEDIDAS'
              DataPipeline = ppAvalPre
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 5292
              mmLeft = 4763
              mmTop = 7144
              mmWidth = 186532
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppLine6: TppLine
              UserName = 'Line6'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 4763
              mmTop = 1323
              mmWidth = 186532
              BandType = 1
            end
          end
          object ppDetailBand6: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport6: TppSubReport
        UserName = 'SubReport6'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        ShiftRelativeTo = ppSubReport5
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 34925
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport6: TppChildReport
          AutoStop = False
          DataPipeline = ppAvalPre
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
          Left = 336
          Top = 320
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand6: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 13758
            mmPrintPosition = 0
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'Comentários do Avaliador:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4763
              mmTop = 2117
              mmWidth = 45244
              BandType = 1
            end
            object ppDBMemo8: TppDBMemo
              UserName = 'DBMemo8'
              CharWrap = False
              DataField = 'OBSERVAVAL'
              DataPipeline = ppAvalPre
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 5292
              mmLeft = 4763
              mmTop = 7673
              mmWidth = 186532
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 4763
              mmTop = 1323
              mmWidth = 186532
              BandType = 1
            end
          end
          object ppDetailBand7: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport7: TppSubReport
        UserName = 'SubReport7'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        ShiftRelativeTo = ppSubReport6
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 41804
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport7: TppChildReport
          AutoStop = False
          DataPipeline = ppAvalPre
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
          Left = 376
          Top = 360
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand7: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 13758
            mmPrintPosition = 0
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Comentários do Avaliado:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4763
              mmTop = 2381
              mmWidth = 43921
              BandType = 1
            end
            object rpAvalPreComent: TppMemo
              UserName = 'rpAvalPreComent'
              Caption = 'COMENT'
              CharWrap = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 5292
              mmLeft = 4498
              mmTop = 7408
              mmWidth = 186532
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppLine8: TppLine
              UserName = 'Line8'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 4763
              mmTop = 1588
              mmWidth = 186532
              BandType = 1
            end
          end
          object ppDetailBand8: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
      object ppSubReport8: TppSubReport
        UserName = 'SubReport8'
        ExpandAll = False
        KeepTogether = True
        NewPrintJob = False
        ShiftRelativeTo = ppSubReport7
        TraverseAllData = False
        mmHeight = 5027
        mmLeft = 0
        mmTop = 48419
        mmWidth = 197300
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport8: TppChildReport
          AutoStop = False
          DataPipeline = ppAvalPre
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
          Left = 416
          Top = 400
          Version = '5.5'
          mmColumnWidth = 0
          object ppTitleBand8: TppTitleBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 14288
            mmPrintPosition = 0
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'Resumo da Avaliação:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 4763
              mmTop = 2381
              mmWidth = 37571
              BandType = 1
            end
            object ppDBMemo6: TppDBMemo
              UserName = 'DBMemo6'
              CharWrap = False
              DataField = 'RESUMO'
              DataPipeline = ppAvalPre
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 5292
              mmLeft = 4763
              mmTop = 7938
              mmWidth = 186532
              BandType = 1
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object ppLine9: TppLine
              UserName = 'Line9'
              Weight = 0.75
              mmHeight = 529
              mmLeft = 4763
              mmTop = 1588
              mmWidth = 186532
              BandType = 1
            end
          end
          object ppDetailBand9: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCRICAO'
      DataPipeline = ppAvalPre
      KeepTogether = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 14817
        mmPrintPosition = 0
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = ppAvalPre
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 1588
          mmWidth = 20902
          BandType = 3
          GroupNo = 0
        end
        object rpAvalPreRegiaoObservGrupo: TppRegion
          UserName = 'rpFormAvalBrancoRegiaoObserv1'
          Pen.Style = psClear
          Stretch = True
          mmHeight = 7408
          mmLeft = 8467
          mmTop = 6350
          mmWidth = 111125
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object rpFormAvalPreDBObservGrupo: TppDBMemo
            UserName = 'rpFormAvalBrancoDBObserv1'
            CharWrap = False
            DataField = 'OBSGRUPOFATOR'
            DataPipeline = ppAvalPre
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Stretch = True
            Transparent = True
            mmHeight = 5027
            mmLeft = 9525
            mmTop = 7144
            mmWidth = 109000
            BandType = 3
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmLeading = 0
          end
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object ppAvalPre: TppBDEPipeline
    DataSource = dsAvalPre
    UserName = 'ppAvalPre'
    Left = 223
    Top = 61
    object ppAvalPreppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField2: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField4: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField5: TppField
      FieldAlias = 'AVALIADOR'
      FieldName = 'AVALIADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField6: TppField
      FieldAlias = 'CENTROCUSTO'
      FieldName = 'CENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField7: TppField
      FieldAlias = 'DESCRTIPOAVAL'
      FieldName = 'DESCRTIPOAVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField8: TppField
      FieldAlias = 'DESCRFATORAVAL'
      FieldName = 'DESCRFATORAVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField9: TppField
      FieldAlias = 'OBSFATORAVAL'
      FieldName = 'OBSFATORAVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField10: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField11: TppField
      FieldAlias = 'DATAPLAN'
      FieldName = 'DATAPLAN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField12: TppField
      FieldAlias = 'DATAREAL'
      FieldName = 'DATAREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField13: TppField
      FieldAlias = 'GRAU'
      FieldName = 'GRAU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField14: TppField
      FieldAlias = 'PESO'
      FieldName = 'PESO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField15: TppField
      FieldAlias = 'NOTA'
      FieldName = 'NOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField16: TppField
      FieldAlias = 'AVALIACAO'
      FieldName = 'AVALIACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField17: TppField
      FieldAlias = 'FORTES'
      FieldName = 'FORTES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField18: TppField
      FieldAlias = 'FRACOS'
      FieldName = 'FRACOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField19: TppField
      FieldAlias = 'LIMITACOES'
      FieldName = 'LIMITACOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField20: TppField
      FieldAlias = 'METAS'
      FieldName = 'METAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField21: TppField
      FieldAlias = 'MEDIDAS'
      FieldName = 'MEDIDAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField22: TppField
      FieldAlias = 'RESUMO'
      FieldName = 'RESUMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField23: TppField
      FieldAlias = 'COMENT'
      FieldName = 'COMENT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppAvalPreppField24: TppField
      FieldAlias = 'OBSERVAVAL'
      FieldName = 'OBSERVAVAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
  end
  object dsAvalPre: TwwDataSource
    AutoEdit = False
    DataSet = CdsAvalPre
    Left = 223
    Top = 107
  end
  object CdsAvalPre: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 223
    Top = 152
  end
  object sqlAvalPre: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      '  '#39'1234567890'#39' AS MATRICULA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS AVALIADOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CENTROCUSTO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRTIPOAVAL,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRFATORAVAL,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS OBSFATORAVAL,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRICAO,'
      '  '#39'1234567890'#39' AS DATAPLAN,'
      '  '#39'1234567890'#39' AS DATAREAL,'
      '  1234567890 AS GRAU,'
      '  1234567890 AS PESO,'
      '  1234567890 AS NOTA,'
      '  1234567890 AS AVALIACAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS FORTES,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS FRACOS,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS LIMITACOES,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS METAS,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS MEDIDAS,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS RESUMO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS COMENT,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS OBSERVAVAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = CdsAvalPre
    Left = 223
    Top = 196
  end
end
