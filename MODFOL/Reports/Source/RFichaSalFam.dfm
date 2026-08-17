inherited RptFichaSalFam: TRptFichaSalFam
  Left = 261
  Top = 196
  Width = 286
  Height = 258
  Caption = 'RptFichaSalFam'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'ListaIdEstab'
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
        Name = 'ListaIdEstab'
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
        Caption = 'SitFunc'
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
        Name = 'SitFunc'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpFichaSalFam
    ConnectionType = cntBDE
  end
  object rpFichaSalFam: TppReport
    AutoStop = False
    DataPipeline = ppFichaSalFam
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Ficha de Salário Família'
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
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 209
    Version = '5.5'
    mmColumnWidth = 197300
    object rpFichaSalFamHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object rpFichaSalFamLbl1: TppLabel
        UserName = 'rpFichaSalFamLbl1'
        AutoSize = False
        Caption = 'FICHA DE SALÁRIO FAMÍLIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 95779
        mmTop = 2910
        mmWidth = 92604
        BandType = 0
      end
      object rpFichaSalFamDBTxt1: TppDBText
        UserName = 'rpFichaSalFamDBTxt1'
        DataField = 'EMPRESA'
        DataPipeline = ppFichaSalFam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 11906
        mmWidth = 102394
        BandType = 0
      end
      object rpFichaSalFamDBTxt2: TppDBText
        UserName = 'rpFichaSalFamDBTxt2'
        DataField = 'CNPJ'
        DataPipeline = ppFichaSalFam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 160338
        mmTop = 11906
        mmWidth = 69850
        BandType = 0
      end
      object rpFichaSalFamDBTxt3: TppDBText
        UserName = 'rpFichaSalFamDBTxt3'
        DataField = 'ENDERECO'
        DataPipeline = ppFichaSalFam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 16404
        mmWidth = 184150
        BandType = 0
      end
    end
    object rpFichaSalFamDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 7408
      mmPrintPosition = 0
      object rpFichaSalFamShape12: TppShape
        UserName = 'rpFichaSalFamShape12'
        mmHeight = 7673
        mmLeft = 6615
        mmTop = 0
        mmWidth = 11906
        BandType = 4
      end
      object rpFichaSalFamShape13: TppShape
        UserName = 'rpFichaSalFamShape13'
        mmHeight = 7673
        mmLeft = 18256
        mmTop = 0
        mmWidth = 60061
        BandType = 4
      end
      object rpFichaSalFamShape14: TppShape
        UserName = 'rpFichaSalFamShape14'
        mmHeight = 7673
        mmLeft = 78052
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object rpFichaSalFamShape15: TppShape
        UserName = 'rpFichaSalFamShape15'
        mmHeight = 7673
        mmLeft = 95250
        mmTop = 0
        mmWidth = 38365
        BandType = 4
      end
      object rpFichaSalFamShape16: TppShape
        UserName = 'rpFichaSalFamShape16'
        mmHeight = 7673
        mmLeft = 133350
        mmTop = 0
        mmWidth = 38365
        BandType = 4
      end
      object rpFichaSalFamShape17: TppShape
        UserName = 'rpFichaSalFamShape17'
        mmHeight = 7673
        mmLeft = 171450
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object rpFichaSalFamShape18: TppShape
        UserName = 'rpFichaSalFamShape18'
        mmHeight = 7673
        mmLeft = 187061
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpFichaSalFamShape19: TppShape
        UserName = 'Shape101'
        mmHeight = 7673
        mmLeft = 199496
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpFichaSalFamShape20: TppShape
        UserName = 'rpFichaSalFamShape20'
        mmHeight = 7673
        mmLeft = 211932
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object rpFichaSalFamShape21: TppShape
        UserName = 'rpFichaSalFamShape21'
        mmHeight = 7673
        mmLeft = 235480
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object rpFichaSalFamShape22: TppShape
        UserName = 'rpFichaSalFamShape22'
        mmHeight = 7673
        mmLeft = 247915
        mmTop = 0
        mmWidth = 29369
        BandType = 4
      end
      object rpFichaSalFamDBCalc1: TppDBCalc
        UserName = 'rpFichaSalFamDBCalc1'
        DataPipeline = ppFichaSalFam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        ResetGroup = rpFichaSalFamGroupEMPREGADO
        TextAlignment = taCentered
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3440
        mmLeft = 7408
        mmTop = 2117
        mmWidth = 10319
        BandType = 4
      end
      object rpFichaSalFamDBTxt8: TppDBText
        UserName = 'rpFichaSalFamDBTxt8'
        DataField = 'DEPENDENTE'
        DataPipeline = ppFichaSalFam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3704
        mmLeft = 19050
        mmTop = 2117
        mmWidth = 58473
        BandType = 4
      end
      object rpFichaSalFamDBTxt9: TppDBText
        UserName = 'rpFichaSalFamDBTxt9'
        DataField = 'DATANASC'
        DataPipeline = ppFichaSalFam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 78846
        mmTop = 2117
        mmWidth = 15875
        BandType = 4
      end
      object rpFichaSalFamDBTxt10: TppDBText
        UserName = 'rpFichaSalFamDBTxt10'
        DataField = 'LOCAL_NASC'
        DataPipeline = ppFichaSalFam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 96044
        mmTop = 2117
        mmWidth = 36777
        BandType = 4
      end
      object rpFichaSalFamDBTxt11: TppDBText
        UserName = 'rpFichaSalFamDBTxt11'
        DataField = 'CARTORIO'
        DataPipeline = ppFichaSalFam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 134144
        mmTop = 2117
        mmWidth = 36777
        BandType = 4
      end
      object rpFichaSalFamDBTxt12: TppDBText
        UserName = 'rpFichaSalFamDBTxt12'
        DataField = 'NUM_REGISTRO'
        DataPipeline = ppFichaSalFam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 172244
        mmTop = 2117
        mmWidth = 14288
        BandType = 4
      end
      object rpFichaSalFamDBTxt13: TppDBText
        UserName = 'rpFichaSalFamDBTxt13'
        DataField = 'NUM_LIVRO'
        DataPipeline = ppFichaSalFam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 187855
        mmTop = 2117
        mmWidth = 11113
        BandType = 4
      end
      object rpFichaSalFamDBTxt14: TppDBText
        UserName = 'rpFichaSalFamDBTxt14'
        DataField = 'NUM_FOLHA'
        DataPipeline = ppFichaSalFam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 200290
        mmTop = 2117
        mmWidth = 11113
        BandType = 4
      end
      object rpFichaSalFamDBTxt15: TppDBText
        UserName = 'rpFichaSalFamDBTxt15'
        DataField = 'DATAENTREGA'
        DataPipeline = ppFichaSalFam
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 212725
        mmTop = 2117
        mmWidth = 22225
        BandType = 4
      end
    end
    object rpFichaSalFamFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
    end
    object rpFichaSalFamSmryBnd: TppSummaryBand
      AfterPrint = rpFichaSalFamSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 1588
      mmPrintPosition = 0
    end
    object rpFichaSalFamGroupEMPREGADO: TppGroup
      BreakName = 'EMPREGADO'
      DataPipeline = ppFichaSalFam
      NewPage = True
      UserName = 'rpFichaSalFamGroupEMPREGADO'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpFichaSalFamGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 43127
        mmPrintPosition = 0
        object rpFichaSalFamLabel4: TppLabel
          UserName = 'rpFichaSalFamLbl4'
          AutoSize = False
          Caption = 'Empregado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 9260
          mmTop = 7938
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object rpFichaSalFamDBTxt4: TppDBText
          UserName = 'rpFichaSalFamDBTxt4'
          DataField = 'EMPREGADO'
          DataPipeline = ppFichaSalFam
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 7938
          mmWidth = 97631
          BandType = 3
          GroupNo = 1
        end
        object rpFichaSalFamLbl5: TppLabel
          UserName = 'rpFichaSalFamLbl5'
          AutoSize = False
          Caption = 'CTPS:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 174361
          mmTop = 7938
          mmWidth = 14288
          BandType = 3
          GroupNo = 1
        end
        object rpFichaSalFamDBTxtCTPS: TppDBText
          UserName = 'rpFichaSalFamDBTxtCTPS'
          DataField = 'CTPS_NUM'
          DataPipeline = ppFichaSalFam
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 189442
          mmTop = 7938
          mmWidth = 32544
          BandType = 3
          GroupNo = 1
        end
        object rpFichaSalFamLbl7: TppLabel
          UserName = 'rpFichaSalFamLbl7'
          AutoSize = False
          Caption = 'Admissão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 9260
          mmTop = 14288
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
        end
        object rpFichaSalFamDBTxt6: TppDBText
          UserName = 'rpFichaSalFamDBTxt6'
          DataField = 'DATAADMISSAO'
          DataPipeline = ppFichaSalFam
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 14288
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object rpFichaSalFamLbl9: TppLabel
          UserName = 'rpFichaSalFamLbl9'
          AutoSize = False
          Caption = 'Filhos menores de 14 anos - (Dados extraídos das certidões)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 95779
          mmTop = 26723
          mmWidth = 92604
          BandType = 3
          GroupNo = 1
        end
        object rpFichaSalFamLbl6: TppLabel
          UserName = 'rpFichaSalFamLbl6'
          AutoSize = False
          Caption = 'UF:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 225161
          mmTop = 7938
          mmWidth = 5821
          BandType = 3
          GroupNo = 1
        end
        object rpFichaSalFamDBTxt5: TppDBText
          UserName = 'rpFichaSalFamDBTxt5'
          DataField = 'CTPS_UF'
          DataPipeline = ppFichaSalFam
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 231775
          mmTop = 7938
          mmWidth = 11642
          BandType = 3
          GroupNo = 1
        end
        object rpFichaSalFamShape1: TppShape
          UserName = 'rpFichaSalFamShape1'
          mmHeight = 8731
          mmLeft = 6615
          mmTop = 34660
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamMemo1: TppMemo
          UserName = 'rpFichaSalFamMemo1'
          Caption = 'rpFichaSalFamMemo1'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'Nº de'
            'Ordem')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 7408
          mmLeft = 7408
          mmTop = 35454
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpFichaSalFamShape2: TppShape
          UserName = 'rpFichaSalFamShape2'
          mmHeight = 8731
          mmLeft = 18256
          mmTop = 34660
          mmWidth = 60061
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamMemo2: TppMemo
          UserName = 'rpFichaSalFamMemo2'
          Caption = 'rpFichaSalFamMemo2'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'Nomes dos Filhos')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 7408
          mmLeft = 19050
          mmTop = 35454
          mmWidth = 58473
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpFichaSalFamShape3: TppShape
          UserName = 'rpFichaSalFamShape3'
          mmHeight = 8731
          mmLeft = 78052
          mmTop = 34660
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamMemo3: TppMemo
          UserName = 'rpFichaSalFamMemo3'
          Caption = 'rpFichaSalFamMemo3'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'Data de'
            'Nascimento')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 7408
          mmLeft = 78846
          mmTop = 35454
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpFichaSalFamShape4: TppShape
          UserName = 'rpFichaSalFamShape4'
          mmHeight = 8731
          mmLeft = 95250
          mmTop = 34660
          mmWidth = 38365
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamMemo4: TppMemo
          UserName = 'rpFichaSalFamMemo4'
          Caption = 'rpFichaSalFamMemo4'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'Local de'
            'Nascimento')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 7408
          mmLeft = 96044
          mmTop = 35454
          mmWidth = 36777
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpFichaSalFamShape5: TppShape
          UserName = 'rpFichaSalFamShape5'
          mmHeight = 8731
          mmLeft = 133350
          mmTop = 34660
          mmWidth = 38365
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamMemo5: TppMemo
          UserName = 'rpFichaSalFamMemo5'
          Caption = 'rpFichaSalFamMemo5'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'Cartório')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 7408
          mmLeft = 134144
          mmTop = 35454
          mmWidth = 36777
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpFichaSalFamLbl8: TppLabel
          UserName = 'rpFichaSalFamLbl8'
          AutoSize = False
          Caption = 'Demissão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 93663
          mmTop = 14288
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamDBTxt7: TppDBText
          UserName = 'rpFichaSalFamDBTxt7'
          DataField = 'DATADESLIGAMENTO'
          DataPipeline = ppFichaSalFam
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          Transparent = True
          mmHeight = 3704
          mmLeft = 112713
          mmTop = 14288
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamShape6: TppShape
          UserName = 'rpFichaSalFamShape6'
          mmHeight = 8731
          mmLeft = 171450
          mmTop = 34660
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamMemo6: TppMemo
          UserName = 'rpFichaSalFamMemo6'
          Caption = 'rpFichaSalFamMemo6'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'Nº do'
            'Registro')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 7408
          mmLeft = 172244
          mmTop = 35454
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpFichaSalFamShape7: TppShape
          UserName = 'rpFichaSalFamShape7'
          mmHeight = 8731
          mmLeft = 187061
          mmTop = 34660
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamMemo7: TppMemo
          UserName = 'rpFichaSalFamMemo7'
          Caption = 'rpFichaSalFamMemo7'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'Nº do'
            'Livro')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 7408
          mmLeft = 187855
          mmTop = 35454
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpFichaSalFamShape10: TppShape
          UserName = 'rpFichaSalFamShape10'
          mmHeight = 8731
          mmLeft = 235480
          mmTop = 34660
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamMemo10: TppMemo
          UserName = 'rpFichaSalFamMemo10'
          Caption = 'rpFichaSalFamMemo10'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'Baixa')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 7408
          mmLeft = 236273
          mmTop = 35454
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpFichaSalFamShape8: TppShape
          UserName = 'rpFichaSalFamShape8'
          mmHeight = 8731
          mmLeft = 199496
          mmTop = 34660
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamMemo8: TppMemo
          UserName = 'rpFichaSalFamMemo8'
          Caption = 'rpFichaSalFamMemo8'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'Nº da'
            'Folha')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 7408
          mmLeft = 200290
          mmTop = 35454
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpFichaSalFamShape9: TppShape
          UserName = 'rpFichaSalFamShape9'
          mmHeight = 8731
          mmLeft = 211932
          mmTop = 34660
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamMemo9: TppMemo
          UserName = 'rpFichaSalFamMemo9'
          Caption = 'rpFichaSalFamMemo9'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'Data da Entrega'
            'da Certidão')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 7408
          mmLeft = 212725
          mmTop = 35454
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpFichaSalFamShape11: TppShape
          UserName = 'rpFichaSalFamShape11'
          mmHeight = 8731
          mmLeft = 247915
          mmTop = 34660
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamMemo11: TppMemo
          UserName = 'rpFichaSalFamMemo11'
          Caption = 'rpFichaSalFamMemo11'
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'Visto do'
            'Fiscal do INSS')
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 7408
          mmLeft = 248709
          mmTop = 35454
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpFichaSalFamLine1: TppLine
          UserName = 'rpFichaSalFamLine1'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 6615
          mmTop = 5821
          mmWidth = 270669
          BandType = 3
          GroupNo = 0
        end
        object rpFichaSalFamLine2: TppLine
          UserName = 'rpFichaSalFamLine2'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 6615
          mmTop = 19579
          mmWidth = 270669
          BandType = 3
          GroupNo = 0
        end
      end
      object rpFichaSalFamGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 43656
        mmPrintPosition = 0
        object rpFichaSalFamLine3: TppLine
          UserName = 'rpFichaSalFamLine3'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 199761
          mmTop = 16404
          mmWidth = 77523
          BandType = 5
          GroupNo = 0
        end
        object rpFichaSalFamLbl10: TppLabel
          UserName = 'rpFichaSalFamLbl10'
          AutoSize = False
          Caption = 'Ass. do Empregado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3969
          mmLeft = 199761
          mmTop = 20902
          mmWidth = 77523
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppFichaSalFam: TppBDEPipeline
    DataSource = dsFichaSalFam
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'FichaSalFam'
    Left = 209
    Top = 45
    object ppFichaSalFamppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField2: TppField
      FieldAlias = 'CNPJ'
      FieldName = 'CNPJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField3: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField4: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField5: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField6: TppField
      FieldAlias = 'DATADESLIGAMENTO'
      FieldName = 'DATADESLIGAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField7: TppField
      FieldAlias = 'CTPS_NUM'
      FieldName = 'CTPS_NUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField8: TppField
      FieldAlias = 'CTPS_UF'
      FieldName = 'CTPS_UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField9: TppField
      FieldAlias = 'DEPENDENTE'
      FieldName = 'DEPENDENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField10: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField11: TppField
      FieldAlias = 'LOCAL_NASC'
      FieldName = 'LOCAL_NASC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField12: TppField
      FieldAlias = 'CARTORIO'
      FieldName = 'CARTORIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField13: TppField
      FieldAlias = 'NUM_REGISTRO'
      FieldName = 'NUM_REGISTRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField14: TppField
      FieldAlias = 'NUM_LIVRO'
      FieldName = 'NUM_LIVRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField15: TppField
      FieldAlias = 'NUM_FOLHA'
      FieldName = 'NUM_FOLHA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppFichaSalFamppField16: TppField
      FieldAlias = 'DATAENTREGA'
      FieldName = 'DATAENTREGA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object dsFichaSalFam: TwwDataSource
    AutoEdit = False
    DataSet = CdsFichaSalFam
    Left = 209
    Top = 90
  end
  object sqlFichaSalFam: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  RPAD('#39'1'#39', 60, '#39'1'#39') AS EMPRESA,'
      '  RPAD('#39'1'#39', 25, '#39'1'#39') AS CNPJ,'
      '  RPAD('#39'1'#39', 80, '#39'1'#39') AS ENDERECO,'
      '  RPAD('#39'1'#39', 60, '#39'1'#39') AS EMPREGADO,'
      '  '#39'1234567890'#39' AS DATAADMISSAO,'
      '  '#39'1234567890'#39' AS DATADESLIGAMENTO,'
      '  RPAD('#39'1'#39', 20, '#39'1'#39') AS CTPS_NUM,'
      '  '#39'12'#39' AS CTPS_UF,'
      '  RPAD('#39'1'#39', 60, '#39'1'#39') AS DEPENDENTE,'
      '  '#39'1234567890'#39' AS DATANASC,'
      '  '#39'1234567890'#39' AS LOCAL_NASC,'
      '  '#39'1234567890'#39' AS CARTORIO,'
      '  '#39'1234567890'#39' AS NUM_REGISTRO,'
      '  '#39'1234567890'#39' AS NUM_LIVRO,'
      '  '#39'1234567890'#39' AS NUM_FOLHA,'
      '  '#39'1234567890'#39' AS DATAENTREGA'
      'FROM'
      '  DUAL'
      'union all'
      'SELECT'
      '  RPAD('#39'1'#39', 60, '#39'1'#39') AS EMPRESA,'
      '  RPAD('#39'1'#39', 25, '#39'1'#39') AS CNPJ,'
      '  RPAD('#39'1'#39', 80, '#39'1'#39') AS ENDERECO,'
      '  RPAD('#39'1'#39', 60, '#39'1'#39') AS EMPREGADO,'
      '  '#39'1234567890'#39' AS DATAADMISSAO,'
      '  '#39'1234567890'#39' AS DATADESLIGAMENTO,'
      '  RPAD('#39'1'#39', 20, '#39'1'#39') AS CTPS_NUM,'
      '  '#39'12'#39' AS CTPS_UF,'
      '  RPAD('#39'1'#39', 60, '#39'1'#39') AS DEPENDENTE,'
      '  '#39'1234567890'#39' AS DATANASC,'
      '  '#39'1234567890'#39' AS LOCAL_NASC,'
      '  '#39'1234567890'#39' AS CARTORIO,'
      '  '#39'1234567890'#39' AS NUM_REGISTRO,'
      '  '#39'1234567890'#39' AS NUM_LIVRO,'
      '  '#39'1234567890'#39' AS NUM_FOLHA,'
      '  '#39'1234567890'#39' AS DATAENTREGA'
      'FROM'
      '  DUAL')
    ClientDataSet = CdsFichaSalFam
    Left = 209
    Top = 179
  end
  object CdsFichaSalFam: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 209
    Top = 135
  end
end
