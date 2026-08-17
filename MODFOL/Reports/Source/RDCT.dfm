inherited RptDCT: TRptDCT
  Left = 270
  Top = 196
  Width = 266
  Height = 259
  Caption = 'RptDCT'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'CodFuncSel'
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
        Name = 'CodFuncSel'
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
        Caption = 'SelSemPIS'
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
        Name = 'SelSemPIS'
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
        Caption = 'TipoContrato'
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
        Name = 'TipoContrato'
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
        Caption = 'ImprimeCarimbo'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ImprimeCarimbo'
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
    Report = rpDCT
    ConnectionType = cntBDE
  end
  object rpDCT: TppReport
    AutoStop = False
    DataPipeline = ppDCT
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 209
    Version = '5.5'
    mmColumnWidth = 197300
    object rpDCTDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 138642
      mmPrintPosition = 0
      object rpDCTShape3: TppShape
        UserName = 'rpDCTShape3'
        Brush.Color = 13948116
        Pen.Color = clWhite
        mmHeight = 21696
        mmLeft = 146315
        mmTop = 93663
        mmWidth = 44979
        BandType = 4
      end
      object rpDCTShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = 13948116
        Pen.Color = clWhite
        mmHeight = 5556
        mmLeft = 9260
        mmTop = 74348
        mmWidth = 182034
        BandType = 4
      end
      object rpDCTLbl1: TppLabel
        UserName = 'rpDCTLbl1'
        AutoSize = False
        Caption = 'CAIXA ECONÔMICA FEDERAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 9260
        mmTop = 9525
        mmWidth = 41275
        BandType = 4
      end
      object rpDCTShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clBlack
        mmHeight = 5027
        mmLeft = 9260
        mmTop = 14288
        mmWidth = 40217
        BandType = 4
      end
      object rpDCTLbl2: TppLabel
        UserName = 'rpDCTLbl2'
        AutoSize = False
        Caption = 'DOCUMENTO DE CADASTRAMENTO DO TRABALHADOR - DCT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 8467
        mmLeft = 9260
        mmTop = 20638
        mmWidth = 51329
        BandType = 4
      end
      object rpDCTLine1: TppLine
        UserName = 'rpDCTLine1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 37306
        mmLeft = 74877
        mmTop = 7673
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine3: TppLine
        UserName = 'rpDCTLine3'
        Position = lpRight
        Weight = 0.75
        mmHeight = 37306
        mmLeft = 141552
        mmTop = 7673
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine2: TppLine
        UserName = 'rpDCTLine2'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 74877
        mmTop = 43656
        mmWidth = 67998
        BandType = 4
      end
      object rpDCTLine4: TppLine
        UserName = 'rpDCTLine4'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 37306
        mmLeft = 146315
        mmTop = 7673
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine5: TppLine
        UserName = 'rpDCTLine5'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 146315
        mmTop = 43656
        mmWidth = 44979
        BandType = 4
      end
      object rpDCTLine6: TppLine
        UserName = 'Line501'
        Position = lpRight
        Weight = 0.75
        mmHeight = 37306
        mmLeft = 189971
        mmTop = 7673
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLbl3: TppLabel
        UserName = 'rpDCTLbl3'
        AutoSize = False
        Caption = 'Para uso exclusivo da CEF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 150813
        mmTop = 3969
        mmWidth = 38629
        BandType = 4
      end
      object rpDCTLMemo1: TppMemo
        UserName = 'rpDCTLMemo1'
        Caption = 
          '01 Carimbo padronizado do CNPJ ou'#13#10'     matrícula no Cadastro Es' +
          'pecífico do INSS-CEI'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Lines.Strings = (
          '01 Carimbo padronizado do CNPJ ou'
          '     matrícula no Cadastro Específico do INSS-CEI')
        Transparent = True
        mmHeight = 7673
        mmLeft = 76200
        mmTop = 7673
        mmWidth = 63236
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpDCTLMemo2: TppMemo
        UserName = 'rpDCTLMemo2'
        Caption = 
          '01 - Carimbo padronizado do CNPJ ou'#13#10'       matrícula no Cadastr' +
          'o Específico do INSS-CEI'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Lines.Strings = (
          'Carimbo da Agência receptora'
          'Norma CSA/CIEF nº 047')
        Transparent = True
        mmHeight = 7673
        mmLeft = 150813
        mmTop = 7673
        mmWidth = 35454
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpDCTLbl4: TppLabel
        UserName = 'rpDCTLbl4'
        AutoSize = False
        Caption = '02 IDENTIFICAÇÃO DO EMPREGADOR / SINDICATO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 9260
        mmTop = 39952
        mmWidth = 61383
        BandType = 4
      end
      object rpDCTLine7: TppLine
        UserName = 'rpDCTLine7'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 9260
        mmTop = 46038
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine8: TppLine
        UserName = 'rpDCTLine8'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 9260
        mmTop = 52388
        mmWidth = 46567
        BandType = 4
      end
      object rpDCTLine9: TppLine
        UserName = 'Line502'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 54504
        mmTop = 46038
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine10: TppLine
        UserName = 'rpDCTLine10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 58738
        mmTop = 46038
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine11: TppLine
        UserName = 'rpDCTLine11'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 58738
        mmTop = 52388
        mmWidth = 132292
        BandType = 4
      end
      object rpDCTLine12: TppLine
        UserName = 'rpDCTLine12'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 189971
        mmTop = 46038
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine13: TppLine
        UserName = 'rpDCTLine13'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 9260
        mmTop = 54769
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine14: TppLine
        UserName = 'rpDCTLine14'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 9260
        mmTop = 61119
        mmWidth = 181769
        BandType = 4
      end
      object rpDCTLine15: TppLine
        UserName = 'Line601'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 189971
        mmTop = 54769
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine16: TppLine
        UserName = 'rpDCTLine16'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 104246
        mmTop = 63500
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine17: TppLine
        UserName = 'rpDCTLine17'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 104246
        mmTop = 69850
        mmWidth = 38629
        BandType = 4
      end
      object rpDCTLine18: TppLine
        UserName = 'rpDCTLine18'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 141552
        mmTop = 63500
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine19: TppLine
        UserName = 'rpDCTLine19'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 146315
        mmTop = 63500
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine20: TppLine
        UserName = 'rpDCTLine20'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 146315
        mmTop = 69850
        mmWidth = 44979
        BandType = 4
      end
      object rpDCTLine21: TppLine
        UserName = 'rpDCTLine21'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 189971
        mmTop = 63500
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine22: TppLine
        UserName = 'rpDCTLine22'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 9260
        mmTop = 72231
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine23: TppLine
        UserName = 'rpDCTLine23'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 9260
        mmTop = 78581
        mmWidth = 181769
        BandType = 4
      end
      object rpDCTLine24: TppLine
        UserName = 'rpDCTLine24'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 189971
        mmTop = 72231
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine25: TppLine
        UserName = 'rpDCTLine25'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 9260
        mmTop = 80963
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine26: TppLine
        UserName = 'rpDCTLine26'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 9260
        mmTop = 87313
        mmWidth = 34925
        BandType = 4
      end
      object rpDCTLine27: TppLine
        UserName = 'rpDCTLine27'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 42863
        mmTop = 80963
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine28: TppLine
        UserName = 'rpDCTLine28'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 47096
        mmTop = 80963
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine29: TppLine
        UserName = 'rpDCTLine29'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 47096
        mmTop = 87313
        mmWidth = 11377
        BandType = 4
      end
      object rpDCTLine30: TppLine
        UserName = 'rpDCTLine30'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 57150
        mmTop = 80963
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine31: TppLine
        UserName = 'rpDCTLine31'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 61383
        mmTop = 80963
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine32: TppLine
        UserName = 'rpDCTLine32'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 61383
        mmTop = 87313
        mmWidth = 129646
        BandType = 4
      end
      object rpDCTLine33: TppLine
        UserName = 'Line602'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 189971
        mmTop = 80963
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine34: TppLine
        UserName = 'rpDCTLine34'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 9260
        mmTop = 89694
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine35: TppLine
        UserName = 'Line801'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 9260
        mmTop = 96044
        mmWidth = 115623
        BandType = 4
      end
      object rpDCTLine37: TppLine
        UserName = 'rpDCTLine37'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 123825
        mmTop = 89694
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine36: TppLine
        UserName = 'rpDCTLine36'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 115623
        mmTop = 89694
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine38: TppLine
        UserName = 'rpDCTLine38'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 128059
        mmTop = 89694
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine39: TppLine
        UserName = 'rpDCTLine39'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 128059
        mmTop = 96044
        mmWidth = 14552
        BandType = 4
      end
      object rpDCTLine40: TppLine
        UserName = 'rpDCTLine40'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 141552
        mmTop = 89694
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine58: TppLine
        UserName = 'rpDCTLine58'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 25400
        mmLeft = 146315
        mmTop = 89694
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine59: TppLine
        UserName = 'rpDCTLine59'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 146315
        mmTop = 113771
        mmWidth = 44979
        BandType = 4
      end
      object rpDCTLine60: TppLine
        UserName = 'rpDCTLine60'
        Position = lpRight
        Weight = 0.75
        mmHeight = 25400
        mmLeft = 189971
        mmTop = 89694
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine41: TppLine
        UserName = 'rpDCTLine41'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 9260
        mmTop = 98425
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine42: TppLine
        UserName = 'rpDCTLine42'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 9260
        mmTop = 104775
        mmWidth = 64294
        BandType = 4
      end
      object rpDCTLine45: TppLine
        UserName = 'rpDCTLine45'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 72496
        mmTop = 98425
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine44: TppLine
        UserName = 'rpDCTLine44'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 64294
        mmTop = 98425
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine43: TppLine
        UserName = 'rpDCTLine43'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 47096
        mmTop = 98425
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine46: TppLine
        UserName = 'rpDCTLine46'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 76729
        mmTop = 98425
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine47: TppLine
        UserName = 'rpDCTLine47'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 76729
        mmTop = 104775
        mmWidth = 65881
        BandType = 4
      end
      object rpDCTLine49: TppLine
        UserName = 'rpDCTLine49'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 141552
        mmTop = 98425
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine48: TppLine
        UserName = 'rpDCTLine48'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 131763
        mmTop = 98425
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine50: TppLine
        UserName = 'Line1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 9260
        mmTop = 107156
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine51: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 9260
        mmTop = 113506
        mmWidth = 64294
        BandType = 4
      end
      object rpDCTLine53: TppLine
        UserName = 'rpDCTLine53'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 72496
        mmTop = 107156
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine52: TppLine
        UserName = 'rpDCTLine52'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 59267
        mmTop = 107156
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine54: TppLine
        UserName = 'rpDCTLine54'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 76729
        mmTop = 107156
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine55: TppLine
        UserName = 'rpDCTLine55'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 76729
        mmTop = 113506
        mmWidth = 65881
        BandType = 4
      end
      object rpDCTLine57: TppLine
        UserName = 'rpDCTLine57'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 141552
        mmTop = 107156
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine56: TppLine
        UserName = 'Line1001'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 131763
        mmTop = 107156
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine61: TppLine
        UserName = 'rpDCTLine61'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 9260
        mmTop = 115888
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine62: TppLine
        UserName = 'rpDCTLine62'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 9260
        mmTop = 122238
        mmWidth = 181769
        BandType = 4
      end
      object rpDCTLine63: TppLine
        UserName = 'rpDCTLine63'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 189971
        mmTop = 115888
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTShape4: TppShape
        UserName = 'Shape3'
        mmHeight = 4064
        mmLeft = 150548
        mmTop = 94986
        mmWidth = 3969
        BandType = 4
      end
      object rpDCTShape5: TppShape
        UserName = 'rpDCTShape5'
        mmHeight = 3969
        mmLeft = 150548
        mmTop = 100542
        mmWidth = 3969
        BandType = 4
      end
      object rpDCTLine64: TppLine
        UserName = 'rpDCTLine64'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 9260
        mmTop = 124619
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine65: TppLine
        UserName = 'Line1101'
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 9260
        mmTop = 130969
        mmWidth = 181769
        BandType = 4
      end
      object rpDCTLine70: TppLine
        UserName = 'rpDCTLine70'
        Position = lpRight
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 189971
        mmTop = 124619
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine66: TppLine
        UserName = 'rpDCTLine66'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 84402
        mmTop = 124619
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine67: TppLine
        UserName = 'rpDCTLine67'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 146315
        mmTop = 124619
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine68: TppLine
        UserName = 'rpDCTLine68'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 7673
        mmLeft = 156898
        mmTop = 124619
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLine69: TppLine
        UserName = 'rpDCTLine69'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 179917
        mmTop = 128323
        mmWidth = 1323
        BandType = 4
      end
      object rpDCTLbl5: TppLabel
        UserName = 'rpDCTLbl5'
        AutoSize = False
        Caption = 'CNPJ/CEI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 10848
        mmTop = 46038
        mmWidth = 12435
        BandType = 4
      end
      object rpDCTLbl6: TppLabel
        UserName = 'rpDCTLbl6'
        AutoSize = False
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 60325
        mmTop = 46038
        mmWidth = 7408
        BandType = 4
      end
      object rpDCTLbl7: TppLabel
        UserName = 'rpDCTLbl7'
        AutoSize = False
        Caption = 'Endereço'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 10848
        mmTop = 54769
        mmWidth = 11377
        BandType = 4
      end
      object rpDCTLbl8: TppLabel
        UserName = 'rpDCTLbl8'
        AutoSize = False
        Caption = 'Telefone'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 105834
        mmTop = 63500
        mmWidth = 10583
        BandType = 4
      end
      object rpDCTLbl9: TppLabel
        UserName = 'rpDCTLbl9'
        AutoSize = False
        Caption = 'Fax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 147902
        mmTop = 63500
        mmWidth = 5292
        BandType = 4
      end
      object rpDCTLbl10: TppLabel
        UserName = 'rpDCTLbl10'
        AutoSize = False
        Caption = '03 Nome do trabalhador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 10848
        mmTop = 70379
        mmWidth = 35719
        BandType = 4
      end
      object rpDCTLbl11: TppLabel
        UserName = 'rpDCTLbl11'
        AutoSize = False
        Caption = '04 Data de Nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 10848
        mmTop = 80963
        mmWidth = 27252
        BandType = 4
      end
      object rpDCTLbl12: TppLabel
        UserName = 'rpDCTLbl12'
        AutoSize = False
        Caption = '05 Sexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 48154
        mmTop = 80963
        mmWidth = 9525
        BandType = 4
      end
      object rpDCTLbl13: TppLabel
        UserName = 'rpDCTLbl13'
        AutoSize = False
        Caption = '06 Nome da mãe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 62971
        mmTop = 80963
        mmWidth = 20108
        BandType = 4
      end
      object rpDCTLbl14: TppLabel
        UserName = 'rpDCTLbl14'
        AutoSize = False
        Caption = '07 Município de nascimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 10848
        mmTop = 89694
        mmWidth = 31750
        BandType = 4
      end
      object rpDCTLbl15: TppLabel
        UserName = 'rpDCTLbl15'
        AutoSize = False
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 117211
        mmTop = 89694
        mmWidth = 3969
        BandType = 4
      end
      object rpDCTLbl16: TppLabel
        UserName = 'rpDCTLbl16'
        AutoSize = False
        Caption = '08 Cód Nac'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 128852
        mmTop = 89694
        mmWidth = 13229
        BandType = 4
      end
      object rpDCTLbl17: TppLabel
        UserName = 'rpDCTLbl17'
        AutoSize = False
        Caption = '09 Cart. Trabalho-Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 10848
        mmTop = 98425
        mmWidth = 29369
        BandType = 4
      end
      object rpDCTLbl18: TppLabel
        UserName = 'rpDCTLbl18'
        AutoSize = False
        Caption = 'Série'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 48419
        mmTop = 98425
        mmWidth = 6615
        BandType = 4
      end
      object rpDCTLbl19: TppLabel
        UserName = 'rpDCTLbl19'
        AutoSize = False
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 65617
        mmTop = 98425
        mmWidth = 3969
        BandType = 4
      end
      object rpDCTLbl20: TppLabel
        UserName = 'rpDCTLbl20'
        AutoSize = False
        Caption = '10 CPF-Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 78317
        mmTop = 98425
        mmWidth = 19050
        BandType = 4
      end
      object rpDCTLbl21: TppLabel
        UserName = 'rpDCTLbl21'
        AutoSize = False
        Caption = 'Contr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 133086
        mmTop = 98425
        mmWidth = 7144
        BandType = 4
      end
      object rpDCTLbl22: TppLabel
        UserName = 'rpDCTLbl22'
        AutoSize = False
        Caption = '11 Cart. Identidade-Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 10848
        mmTop = 107156
        mmWidth = 31485
        BandType = 4
      end
      object rpDCTLbl23: TppLabel
        UserName = 'rpDCTLbl23'
        AutoSize = False
        Caption = 'Emissor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 60854
        mmTop = 107156
        mmWidth = 9790
        BandType = 4
      end
      object rpDCTLbl24: TppLabel
        UserName = 'rpDCTLbl24'
        AutoSize = False
        Caption = '12 Título de Eleitor-Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 78317
        mmTop = 107156
        mmWidth = 31221
        BandType = 4
      end
      object rpDCTLbl25: TppLabel
        UserName = 'rpDCTLbl25'
        AutoSize = False
        Caption = 'DV'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 133350
        mmTop = 107156
        mmWidth = 4498
        BandType = 4
      end
      object rpDCTLbl30: TppLabel
        UserName = 'rpDCTLbl30'
        AutoSize = False
        Caption = '13 Endereço do trabalhador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 10848
        mmTop = 115888
        mmWidth = 31221
        BandType = 4
      end
      object rpDCTLbl31: TppLabel
        UserName = 'rpDCTLbl31'
        AutoSize = False
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 10848
        mmTop = 124619
        mmWidth = 7673
        BandType = 4
      end
      object rpDCTLbl32: TppLabel
        UserName = 'rpDCTLbl32'
        AutoSize = False
        Caption = 'Município'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 85990
        mmTop = 124619
        mmWidth = 11642
        BandType = 4
      end
      object rpDCTLbl33: TppLabel
        UserName = 'rpDCTLbl33'
        AutoSize = False
        Caption = 'UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 147902
        mmTop = 124619
        mmWidth = 4233
        BandType = 4
      end
      object rpDCTLbl34: TppLabel
        UserName = 'rpDCTLbl34'
        AutoSize = False
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 158486
        mmTop = 124619
        mmWidth = 6615
        BandType = 4
      end
      object rpDCTLbl27: TppLabel
        UserName = 'rpDCTLbl27'
        AutoSize = False
        Caption = 'Solicitação atendida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 157163
        mmTop = 95515
        mmWidth = 23283
        BandType = 4
      end
      object rpDCTLbl28: TppLabel
        UserName = 'rpDCTLbl28'
        AutoSize = False
        Caption = 'Preenchimento incorreto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 157163
        mmTop = 101071
        mmWidth = 27781
        BandType = 4
      end
      object rpDCTLbl29: TppLabel
        UserName = 'rpDCTLbl29'
        AutoSize = False
        Caption = 'Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 152665
        mmTop = 107421
        mmWidth = 11113
        BandType = 4
      end
      object rpDCTLbl26: TppLabel
        UserName = 'rpDCTLbl26'
        AutoSize = False
        Caption = 'Para uso exclusivo da CEF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 89429
        mmWidth = 38629
        BandType = 4
      end
      object rpDCTDBTxt1: TppDBText
        UserName = 'rpDCTDBTxt1'
        DataField = 'CNPJ'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 10848
        mmTop = 49477
        mmWidth = 43392
        BandType = 4
      end
      object rpDCTDBTxt2: TppDBText
        UserName = 'rpDCTDBTxt2'
        DataField = 'EMPRESA'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 60325
        mmTop = 49477
        mmWidth = 129382
        BandType = 4
      end
      object rpDCTDBTxt3: TppDBText
        UserName = 'rpDCTDBTxt3'
        DataField = 'END_EMPRESA'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 10848
        mmTop = 58208
        mmWidth = 178859
        BandType = 4
      end
      object rpDCTDBTxt4: TppDBText
        UserName = 'rpDCTDBTxt4'
        DataField = 'TELEFONE'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 105834
        mmTop = 66940
        mmWidth = 35454
        BandType = 4
      end
      object rpDCTDBTxt5: TppDBText
        UserName = 'rpDCTDBTxt5'
        DataField = 'FAX'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 147902
        mmTop = 66940
        mmWidth = 41804
        BandType = 4
      end
      object rpDCTDBTxt7: TppDBText
        UserName = 'rpDCTDBTxt7'
        DataField = 'DATANASC'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 10848
        mmTop = 84402
        mmWidth = 31750
        BandType = 4
      end
      object rpDCTDBTxt8: TppDBText
        UserName = 'rpDCTDBTxt8'
        DataField = 'SEXO'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 48154
        mmTop = 84402
        mmWidth = 9525
        BandType = 4
      end
      object rpDCTDBTxt9: TppDBText
        UserName = 'rpDCTDBTxt9'
        DataField = 'NOMEMAE'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 62971
        mmTop = 84402
        mmWidth = 126736
        BandType = 4
      end
      object rpDCTDBTxt10: TppDBText
        UserName = 'rpDCTDBTxt10'
        DataField = 'CIDADE_NASC'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 10848
        mmTop = 93134
        mmWidth = 103452
        BandType = 4
      end
      object rpDCTDBTxt11: TppDBText
        UserName = 'rpDCTDBTxt11'
        DataField = 'UF_NASC'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 117211
        mmTop = 93134
        mmWidth = 6350
        BandType = 4
      end
      object rpDCTDBTxt12: TppDBText
        UserName = 'rpDCTDBTxt12'
        DataField = 'COD_NACI'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 128852
        mmTop = 93134
        mmWidth = 12965
        BandType = 4
      end
      object rpDCTDBTxt13: TppDBText
        UserName = 'rpDCTDBTxt13'
        DataField = 'CTPS_NUM'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 10848
        mmTop = 101865
        mmWidth = 34925
        BandType = 4
      end
      object rpDCTDBTxt14: TppDBText
        UserName = 'rpDCTDBTxt14'
        DataField = 'CTPS_SERIE'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 48419
        mmTop = 101865
        mmWidth = 14552
        BandType = 4
      end
      object rpDCTDBTxt15: TppDBText
        UserName = 'rpDCTDBTxt15'
        DataField = 'CTPS_UF'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 65617
        mmTop = 101865
        mmWidth = 6350
        BandType = 4
      end
      object rpDCTDBTxt16: TppDBText
        UserName = 'rpDCTDBTxt16'
        DataField = 'CPF_NUM'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 78317
        mmTop = 101865
        mmWidth = 52123
        BandType = 4
      end
      object rpDCTDBTxt17: TppDBText
        UserName = 'rpDCTDBTxt17'
        DataField = 'CPF_CONTR'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 133086
        mmTop = 101865
        mmWidth = 8467
        BandType = 4
      end
      object rpDCTDBTxt18: TppDBText
        UserName = 'rpDCTDBTxt18'
        DataField = 'RG_NUM'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 10848
        mmTop = 110596
        mmWidth = 47096
        BandType = 4
      end
      object rpDCTDBTxt19: TppDBText
        UserName = 'rpDCTDBTxt19'
        DataField = 'RG_EMISSOR'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 60854
        mmTop = 110596
        mmWidth = 11642
        BandType = 4
      end
      object rpDCTDBTxt20: TppDBText
        UserName = 'rpDCTDBTxt20'
        DataField = 'TITULO_NUM'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 78317
        mmTop = 110596
        mmWidth = 52123
        BandType = 4
      end
      object rpDCTDBTxt21: TppDBText
        UserName = 'rpDCTDBTxt21'
        DataField = 'TITULO_DV'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 133350
        mmTop = 110596
        mmWidth = 7938
        BandType = 4
      end
      object rpDCTDBTxt22: TppDBText
        UserName = 'rpDCTDBTxt22'
        DataField = 'LOGRADOURO'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 10848
        mmTop = 119327
        mmWidth = 178859
        BandType = 4
      end
      object rpDCTDBTxt23: TppDBText
        UserName = 'rpDCTDBTxt23'
        DataField = 'BAIRRO'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 10848
        mmTop = 128059
        mmWidth = 72231
        BandType = 4
      end
      object rpDCTDBTxt24: TppDBText
        UserName = 'rpDCTDBTxt24'
        DataField = 'CIDADE'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 85990
        mmTop = 128059
        mmWidth = 58738
        BandType = 4
      end
      object rpDCTDBTxt25: TppDBText
        UserName = 'rpDCTDBTxt25'
        DataField = 'UF'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 147902
        mmTop = 128059
        mmWidth = 7408
        BandType = 4
      end
      object rpDCTDBTxt26: TppDBText
        UserName = 'rpDCTDBTxt26'
        DataField = 'CEP1'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 158486
        mmTop = 128059
        mmWidth = 19844
        BandType = 4
      end
      object rpDCTDBTxt27: TppDBText
        UserName = 'rpDCTDBTxt27'
        DataField = 'CEP2'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 181505
        mmTop = 128059
        mmWidth = 7938
        BandType = 4
      end
      object rpDCTDBTxt6: TppDBText
        UserName = 'rpDCTDBTxt6'
        DataField = 'EMPREGADO'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 10848
        mmTop = 75406
        mmWidth = 178859
        BandType = 4
      end
      object rpDCTDBTxt28: TppDBText
        UserName = 'rpDCTDBTxt28'
        DataField = 'VIA_DCT'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 156104
        mmTop = 132821
        mmWidth = 34925
        BandType = 4
      end
      object rpDCTDBTxtCarimboCNPJ: TppDBText
        UserName = 'rpDCTDBTxtCarimboCNPJ'
        DataField = 'CNPJ'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 84931
        mmTop = 17727
        mmWidth = 47361
        BandType = 4
      end
      object rpDCTDBTxtCarimboEmpresa: TppDBText
        UserName = 'rpDCTDBTxtCarimboEmpresa'
        DataField = 'EMPRESA'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7144
        mmLeft = 84931
        mmTop = 23283
        mmWidth = 47361
        BandType = 4
      end
      object rpDCTDBTxtCarimboEndereco: TppDBText
        UserName = 'rpDCTDBTxtCarimboEndereco1'
        DataField = 'END_EMPRESA'
        DataPipeline = ppDCT
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 11113
        mmLeft = 84931
        mmTop = 31485
        mmWidth = 47361
        BandType = 4
      end
    end
    object rpDCTSmryBnd: TppSummaryBand
      AfterPrint = rpDCTSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 1588
      mmPrintPosition = 0
    end
  end
  object ppDCT: TppBDEPipeline
    DataSource = dsDCT
    UserName = 'lExemplo2'
    Left = 209
    Top = 46
  end
  object dsDCT: TwwDataSource
    AutoEdit = False
    DataSet = CdsDCT
    Left = 209
    Top = 92
  end
  object sqlDCT: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      '  '#39'12345678901234567890'#39' AS CNPJ,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS END_EMPRESA,'
      '  '#39'1234567890'#39' AS TELEFONE,'
      '  '#39'1234567890'#39' AS FAX,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      '  '#39'1234567890'#39' AS DATANASC,'
      '  '#39'1'#39' AS SEXO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS NOMEMAE,'
      '  '#39'123456789012345678901234567890'#39' AS CIDADE_NASC,'
      '  '#39'1234567890'#39' AS UF_NASC,'
      '  '#39'1234567890'#39' AS COD_NACI,'
      '  '#39'12345678901234567890'#39' AS CTPS_NUM,'
      '  '#39'1234567890'#39' AS CTPS_SERIE,'
      '  '#39'1234567890'#39' AS CTPS_UF,'
      '  '#39'12345678901234567890'#39' AS CPF_NUM,'
      '  '#39'1234567890'#39' AS CPF_CONTR,'
      '  '#39'12345678901234567890'#39' AS RG_NUM,'
      '  '#39'1234567890'#39' AS RG_EMISSOR,'
      '  '#39'12345678901234567890'#39' AS TITULO_NUM,'
      '  '#39'1234567890'#39' AS TITULO_DV,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS LOGRADOURO,'
      '  '#39'123456789012345678901234567890'#39' AS BAIRRO,'
      '  '#39'123456789012345678901234567890'#39' AS CIDADE,'
      '  '#39'1234567890'#39' AS UF,'
      '  '#39'1234567890'#39' AS CEP1,'
      '  '#39'1234567890'#39' AS CEP2,'
      '  '#39'12345678901234567890'#39' AS VIA_DCT'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsDCT
    Left = 209
    Top = 181
  end
  object CdsDCT: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'Index1'
        Fields = 'EMPREGADO'
      end>
    IndexName = 'Index1'
    Params = <>
    StoreDefs = True
    AfterScroll = CdsDCTAfterScroll
    Left = 209
    Top = 137
  end
end
