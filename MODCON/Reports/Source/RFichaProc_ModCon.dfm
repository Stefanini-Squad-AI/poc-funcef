inherited RptFichaProc_ModCon: TRptFichaProc_ModCon
  Left = 72
  Top = 203
  Width = 644
  Height = 274
  Caption = 'RptFichaProc_ModCon'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'NumProcesso'
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
        Name = 'NumProcesso'
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
        Caption = 'NomeAdvogado'
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
        Name = 'NomeAdvogado'
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
        Caption = 'ImprimirOBSEtapa'
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
        Name = 'ImprimirOBSEtapa'
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
        Caption = 'ImprimirHonorario'
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
        Name = 'ImprimirHonorario'
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
        Caption = 'ImprimirRateio'
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
        Name = 'ImprimirRateio'
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
    Report = rpFichaProc
  end
  object rpFichaProc: TppReport
    AutoStop = False
    DataPipeline = ppFichaProc
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
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 582
    Top = 8
    Version = '5.5'
    mmColumnWidth = 0
    object rpFichaProcHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 82286
      mmPrintPosition = 0
      object lblFichaProcLbl_Titulo: TppLabel
        UserName = 'lblFichaProcLbl_Titulo'
        Caption = 'Ficha do Processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 78052
        mmTop = 14288
        mmWidth = 41010
        BandType = 0
      end
      object lblFichaProcLbl_NomeEmpresa: TppLabel
        UserName = 'lblFichaProcLbl_NomeEmpresa'
        Caption = 'Nome da Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 78052
        mmTop = 4233
        mmWidth = 41275
        BandType = 0
      end
      object rpFichaProcLbl1: TppLabel
        UserName = 'rpFichaProcLbl1'
        AutoSize = False
        Caption = 'Vara (JCJ):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 8731
        mmTop = 29369
        mmWidth = 18256
        BandType = 0
      end
      object rpFichaProcLbl2: TppLabel
        UserName = 'rpFichaProcLbl2'
        AutoSize = False
        Caption = 'Notificação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 8731
        mmTop = 35454
        mmWidth = 18256
        BandType = 0
      end
      object rpFichaProcLbl3: TppLabel
        UserName = 'rpFichaProcLbl3'
        AutoSize = False
        Caption = 'Escritório:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 8731
        mmTop = 41540
        mmWidth = 18256
        BandType = 0
      end
      object rpFichaProcLbl4: TppLabel
        UserName = 'rpFichaProcLbl4'
        AutoSize = False
        Caption = 'Situação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 84402
        mmTop = 29369
        mmWidth = 15081
        BandType = 0
      end
      object rpFichaProcLbl5: TppLabel
        UserName = 'rpFichaProcLbl5'
        AutoSize = False
        Caption = 'TRT:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 84402
        mmTop = 35454
        mmWidth = 15081
        BandType = 0
      end
      object rpFichaProcDBTxt1: TppDBText
        UserName = 'rpFichaProcDBTxt1'
        DataField = 'JCJ'
        DataPipeline = ppFichaProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 28575
        mmTop = 29369
        mmWidth = 34396
        BandType = 0
      end
      object rpFichaProcDBTxt2: TppDBText
        UserName = 'rpFichaProcDBTxt2'
        DataField = 'DATANOTIF'
        DataPipeline = ppFichaProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 28575
        mmTop = 35454
        mmWidth = 34396
        BandType = 0
      end
      object rpFichaProcLbl_Escritorio: TppLabel
        UserName = 'rpFichaProcLbl_Escritorio'
        AutoSize = False
        Caption = 'Escritorio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 28575
        mmTop = 41540
        mmWidth = 80963
        BandType = 0
      end
      object rpFichaProcDBTxt3: TppDBText
        UserName = 'rpFichaProcDBTxt3'
        DataField = 'SITUACAO'
        DataPipeline = ppFichaProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 101071
        mmTop = 29369
        mmWidth = 34396
        BandType = 0
      end
      object rpFichaProcDBTxt4: TppDBText
        UserName = 'rpFichaProcDBTxt4'
        DataField = 'TRT'
        DataPipeline = ppFichaProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 101071
        mmTop = 35454
        mmWidth = 87048
        BandType = 0
      end
      object rpFichaProcLine1: TppLine
        UserName = 'rpFichaProcLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 8731
        mmTop = 26723
        mmWidth = 180446
        BandType = 0
      end
      object rpFichaProcLbl6: TppLabel
        UserName = 'lblFichaProcLbl_NomeEmpresa1'
        AutoSize = False
        Caption = 'Reclamante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 83608
        mmTop = 49213
        mmWidth = 30163
        BandType = 0
      end
      object rpFichaProcLbl7: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 8731
        mmTop = 58473
        mmWidth = 19844
        BandType = 0
      end
      object rpFichaProcLbl8: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Nascimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 8731
        mmTop = 66675
        mmWidth = 19844
        BandType = 0
      end
      object rpFichaProcLbl9: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Sexo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 8731
        mmTop = 74877
        mmWidth = 19844
        BandType = 0
      end
      object rpFichaProcLbl10: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Estado Civil:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 83344
        mmTop = 66675
        mmWidth = 21431
        BandType = 0
      end
      object rpFichaProcDBTxt6: TppDBText
        UserName = 'rpFichaProcDBTxt6'
        DataField = 'DATANASC'
        DataPipeline = ppFichaProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30163
        mmTop = 66675
        mmWidth = 34396
        BandType = 0
      end
      object rpFichaProcDBTxt7: TppDBText
        UserName = 'rpFichaProcDBTxt7'
        DataField = 'SEXO'
        DataPipeline = ppFichaProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30163
        mmTop = 74877
        mmWidth = 34396
        BandType = 0
      end
      object rpFichaProcDBTxt5: TppDBText
        UserName = 'rpFichaProcDBTxt5'
        DataField = 'NOME'
        DataPipeline = ppFichaProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 30163
        mmTop = 58473
        mmWidth = 87048
        BandType = 0
      end
      object rpFichaProcDBTxt8: TppDBText
        UserName = 'rpFichaProcDBTxt8'
        DataField = 'ESTCIVIL'
        DataPipeline = ppFichaProc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 106363
        mmTop = 66675
        mmWidth = 34396
        BandType = 0
      end
      object rpFichaProcLine2: TppLine
        UserName = 'rpFichaProcLine2'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 8731
        mmTop = 47890
        mmWidth = 180446
        BandType = 0
      end
      object rpFichaProcDBImage1: TppDBImage
        UserName = 'rpFichaProcDBImage1'
        MaintainAspectRatio = False
        DataField = 'FOTO'
        DataPipeline = ppFichaProc
        GraphicType = 'Bitmap'
        mmHeight = 29898
        mmLeft = 145521
        mmTop = 50536
        mmWidth = 30427
        BandType = 0
      end
      object rpFichaProcLine3: TppLine
        UserName = 'rpFichaProcLine3'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 8731
        mmTop = 80963
        mmWidth = 180446
        BandType = 0
      end
    end
    object rpFichaProcDtlBnd: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 35190
      mmPrintPosition = 0
      object rpFichaProcSR1: TppSubReport
        UserName = 'rpFichaProcSR1'
        ExpandAll = False
        NewPrintJob = False
        TraverseAllData = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpFichaProcCR1: TppChildReport
          AutoStop = False
          DataPipeline = ppFichaProc1
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
          Units = utScreenPixels
          Version = '5.5'
          mmColumnWidth = 0
          object rpFichaProcSR1DtlBnd: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object rpFichaProcSR1DBTxt1: TppDBText
              UserName = 'rpFichaProcSR1DBTxt1'
              DataField = 'NOMEDOCUMENTO'
              DataPipeline = ppFichaProc1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 9260
              mmTop = 794
              mmWidth = 47625
              BandType = 4
            end
            object rpFichaProcSR1DBTxt2: TppDBText
              UserName = 'rpFichaProcSR1DBTxt2'
              DataField = 'NUMDOCUMENTO'
              DataPipeline = ppFichaProc1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 59267
              mmTop = 794
              mmWidth = 29104
              BandType = 4
            end
            object rpFichaProcSR1DBTxt3: TppDBText
              UserName = 'rpFichaProcSR1DBTxt3'
              DataField = 'ORGAO'
              DataPipeline = ppFichaProc1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 90223
              mmTop = 794
              mmWidth = 25665
              BandType = 4
            end
            object rpFichaProcSR1DBTxt4: TppDBText
              UserName = 'rpFichaProcSR1DBTxt4'
              DataField = 'UF'
              DataPipeline = ppFichaProc1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 118004
              mmTop = 794
              mmWidth = 9260
              BandType = 4
            end
            object rpFichaProcSR1DBTxt5: TppDBText
              UserName = 'rpFichaProcSR1DBTxt5'
              DataField = 'DATAEMISSAO'
              DataPipeline = ppFichaProc1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 129382
              mmTop = 794
              mmWidth = 25135
              BandType = 4
            end
          end
          object rpFichaProcGrp1: TppGroup
            BreakName = 'IDPESSOA'
            DataPipeline = ppFichaProc1
            UserName = 'rpFichaProcGrp1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object rpFichaProcSR1GrpHdrBnd: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object rpFichaProcSR1Lbl1: TppLabel
                UserName = 'rpFichaProcSR1Lbl1'
                AutoSize = False
                Caption = 'Tipo de Documento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 9260
                mmTop = 1323
                mmWidth = 47625
                BandType = 3
                GroupNo = 0
              end
              object rpFichaProcSR1Lbl2: TppLabel
                UserName = 'rpFichaProcSR1Lbl2'
                AutoSize = False
                Caption = 'Número'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 59267
                mmTop = 1323
                mmWidth = 29104
                BandType = 3
                GroupNo = 0
              end
              object rpFichaProcSR1Lbl3: TppLabel
                UserName = 'rpFichaProcSR1Lbl3'
                AutoSize = False
                Caption = 'Emissor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 90223
                mmTop = 1323
                mmWidth = 25665
                BandType = 3
                GroupNo = 0
              end
              object rpFichaProcSR1Lbl4: TppLabel
                UserName = 'rpFichaProcSR1Lbl4'
                AutoSize = False
                Caption = 'UF'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 118004
                mmTop = 1323
                mmWidth = 9260
                BandType = 3
                GroupNo = 0
              end
              object rpFichaProcSR1Lbl5: TppLabel
                UserName = 'rpFichaProcSR1Lbl5'
                AutoSize = False
                Caption = 'Emissão'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 129382
                mmTop = 1323
                mmWidth = 25135
                BandType = 3
                GroupNo = 0
              end
            end
            object rpFichaProcSR1GrpFootBnd: TppGroupFooterBand
              Visible = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
          end
        end
      end
      object rpFichaProcSR2: TppSubReport
        UserName = 'rpFichaProcSR2'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpFichaProcSR1
        TraverseAllData = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 5556
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpFichaProcCR2: TppChildReport
          AutoStop = False
          DataPipeline = ppFichaProc2
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
          Units = utScreenPixels
          Version = '5.5'
          mmColumnWidth = 0
          object rpFichaProcSR2DtlBnd: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object rpFichaProcSR2DBTxt1: TppDBText
              UserName = 'rpFichaProcSubReport1DBTxt1'
              DataField = 'DESCRICAO'
              DataPipeline = ppFichaProc2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 9260
              mmTop = 794
              mmWidth = 66411
              BandType = 4
            end
            object rpFichaProcSR2DBTxt2: TppDBText
              UserName = 'rpFichaProcSubReport1DBTxt2'
              DataField = 'VAL_RECLAMADO'
              DataPipeline = ppFichaProc2
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 77523
              mmTop = 794
              mmWidth = 29104
              BandType = 4
            end
            object rpFichaProcSR2DBTxt3: TppDBText
              UserName = 'rpFichaProcSubReport1DBTxt3'
              DataField = 'VAL_PROVAVEL_ORIG'
              DataPipeline = ppFichaProc2
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 108479
              mmTop = 794
              mmWidth = 25665
              BandType = 4
            end
            object rpFichaProcSR2DBTxt4: TppDBText
              UserName = 'rpFichaProcSubReport1DBTxt4'
              DataField = 'VAL_PROVAVEL'
              DataPipeline = ppFichaProc2
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 136261
              mmTop = 794
              mmWidth = 25135
              BandType = 4
            end
            object rpFichaProcSR2DBTxt_Val_Real: TppDBText
              UserName = 'rpFichaProcSR2DBTxt_Val_Real'
              DataField = 'VAL_REAL'
              DataPipeline = ppFichaProc2
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 163513
              mmTop = 794
              mmWidth = 25135
              BandType = 4
            end
          end
          object ppGroup1: TppGroup
            BreakName = 'NUMPROCTRAB'
            DataPipeline = ppFichaProc2
            KeepTogether = True
            UserName = 'Group1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object rpFichaProcSR2GrpHdrBnd0: TppGroupHeaderBand
              Visible = False
              mmBottomOffset = 0
              mmHeight = 0
              mmPrintPosition = 0
            end
            object rpFichaProcSR2GrpFootBnd0: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 17463
              mmPrintPosition = 0
              object rpFichaProcSR2Lbl6: TppLabel
                UserName = 'rpFichaProcSR2Lbl6'
                AutoSize = False
                Caption = 'Rateio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 2117
                mmWidth = 11113
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR2DBTxt5: TppDBText
                UserName = 'rpFichaProcSR2DBTxt5'
                DataField = 'NOME'
                DataPipeline = ppRateio
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 21167
                mmTop = 2117
                mmWidth = 54504
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR2Lbl7: TppLabel
                UserName = 'rpFichaProcSR2Lbl7'
                AutoSize = False
                Caption = 'Percentuais'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 3704
                mmLeft = 57150
                mmTop = 12435
                mmWidth = 18521
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR2DBTxt_RatIndRecl: TppDBText
                UserName = 'rpFichaProcSR2DBTxt_RatIndRecl'
                DataField = 'RAT_IND_RECL'
                DataPipeline = ppRateio
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 77523
                mmTop = 6879
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR2DBTxt_RatIndProv: TppDBText
                UserName = 'rpFichaProcSR2DBTxt_RatIndProv'
                DataField = 'RAT_IND_PROV'
                DataPipeline = ppRateio
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 136261
                mmTop = 6879
                mmWidth = 25135
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR2DBTxt_RatIndReal: TppDBText
                UserName = 'rpFichaProcSR2DBTxt_Val_Real1'
                DataField = 'RAT_IND_REAL'
                DataPipeline = ppRateio
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 163513
                mmTop = 6879
                mmWidth = 25135
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR2DBTxt_RatPercRecl: TppDBText
                UserName = 'rpFichaProcSR2DBTxt_RatPercRecl'
                DataField = 'RAT_PERC_RECL'
                DataPipeline = ppRateio
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 77523
                mmTop = 12435
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR2DBTxt_RatPercProv: TppDBText
                UserName = 'rpFichaProcSR2DBTxt_RatPercProv'
                DataField = 'RAT_PERC_PROV'
                DataPipeline = ppRateio
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 136261
                mmTop = 12435
                mmWidth = 25135
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR2DBTxt_RatPercReal: TppDBText
                UserName = 'rpFichaProcSR2DBTxt_RatPercReal'
                DataField = 'RAT_PERC_REAL'
                DataPipeline = ppRateio
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 163513
                mmTop = 12435
                mmWidth = 25135
                BandType = 5
                GroupNo = 0
              end
            end
          end
          object rpFichaProcGroup2: TppGroup
            BreakName = 'NUMPROCTRAB'
            DataPipeline = ppFichaProc2
            UserName = 'rpFichaProcGrp1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object rpFichaProcSR2GrpHdrBnd1: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 5821
              mmPrintPosition = 0
              object rpFichaProcSR2Lbl1: TppLabel
                UserName = 'rpFichaProcSubReport1Lbl1'
                AutoSize = False
                Caption = 'Objeto de Reclamação'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 9260
                mmTop = 1323
                mmWidth = 66411
                BandType = 3
                GroupNo = 0
              end
              object rpFichaProcSR2Lbl2: TppLabel
                UserName = 'rpFichaProcSubReport1Lbl2'
                AutoSize = False
                Caption = 'Valor Reclamado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 77523
                mmTop = 1323
                mmWidth = 29104
                BandType = 3
                GroupNo = 0
              end
              object rpFichaProcSR2Lbl3: TppLabel
                UserName = 'rpFichaProcSubReport1Lbl3'
                AutoSize = False
                Caption = 'Valor Prov. Orig.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 108479
                mmTop = 1323
                mmWidth = 25665
                BandType = 3
                GroupNo = 0
              end
              object rpFichaProcSR2Lbl4: TppLabel
                UserName = 'rpFichaProcSubReport1Lbl4'
                AutoSize = False
                Caption = 'Últ. Valor Prov.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 136261
                mmTop = 1323
                mmWidth = 25135
                BandType = 3
                GroupNo = 0
              end
              object rpFichaProcSR2Lbl_Val_Real: TppLabel
                UserName = 'rpFichaProcSR2Lbl_Val_Real'
                AutoSize = False
                Caption = 'Valor Real'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 163513
                mmTop = 1323
                mmWidth = 25135
                BandType = 3
                GroupNo = 0
              end
            end
            object rpFichaProcSR2GrpFootBnd1: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 6879
              mmPrintPosition = 0
              object rpFichaProcSR2DBCalc1: TppDBCalc
                UserName = 'rpFichaProcSR2DBCalc1'
                DataField = 'VAL_RECLAMADO'
                DataPipeline = ppFichaProc2
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpFichaProcGroup2
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 77523
                mmTop = 1852
                mmWidth = 29104
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR2DBCalc2: TppDBCalc
                UserName = 'rpFichaProcSR2DBCalc2'
                DataField = 'VAL_PROVAVEL_ORIG'
                DataPipeline = ppFichaProc2
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpFichaProcGroup2
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 108479
                mmTop = 1852
                mmWidth = 25665
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR2DBCalc3: TppDBCalc
                UserName = 'rpFichaProcSR2DBCalc3'
                DataField = 'VAL_PROVAVEL'
                DataPipeline = ppFichaProc2
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpFichaProcGroup2
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 136261
                mmTop = 1852
                mmWidth = 25135
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR2DBCalc_Val_Real: TppDBCalc
                UserName = 'rpFichaProcSR2DBCalc_Val_Real'
                DataField = 'VAL_REAL'
                DataPipeline = ppFichaProc2
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpFichaProcGroup2
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 163513
                mmTop = 1852
                mmWidth = 25135
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR2Lbl5: TppLabel
                UserName = 'rpFichaProcSR2Lbl5'
                AutoSize = False
                Caption = 'Totais:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 60325
                mmTop = 1852
                mmWidth = 15346
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR2Line1: TppLine
                UserName = 'rpFichaProcSR2Line1'
                Weight = 0.75
                mmHeight = 529
                mmLeft = 77523
                mmTop = 265
                mmWidth = 111125
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
      object rpFichaProcSR3: TppSubReport
        UserName = 'rpFichaProcSR3'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpFichaProcSR2
        TraverseAllData = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 10319
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpFichaProcCR3: TppChildReport
          AutoStop = False
          DataPipeline = ppFichaProc3
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
          Units = utScreenPixels
          Version = '5.5'
          mmColumnWidth = 0
          object rpFichaProcSR3TitBnd: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object rpFichaProcSR3Lbl2: TppLabel
              UserName = 'rpFichaProcSR3Lbl2'
              AutoSize = False
              Caption = 'Data Real ou Prevista'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsUnderline]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3969
              mmLeft = 157427
              mmTop = 1852
              mmWidth = 31221
              BandType = 1
            end
            object rpFichaProcSR3Lbl1: TppLabel
              UserName = 'rpFichaProcSubReport1Lbl1'
              AutoSize = False
              Caption = 'Etapa/Assunto/Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 3969
              mmLeft = 9260
              mmTop = 1852
              mmWidth = 66411
              BandType = 1
            end
          end
          object rpFichaProcSR3DtlBnd: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 24606
            mmPrintPosition = 0
            object rpFichaProcSR3DBTxt1: TppDBText
              UserName = 'rpFichaProcSubReport1DBTxt1'
              DataField = 'ETAPA'
              DataPipeline = ppFichaProc3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsItalic]
              Transparent = True
              mmHeight = 3440
              mmLeft = 9260
              mmTop = 794
              mmWidth = 145521
              BandType = 4
            end
            object rpFichaProcSR3DBTxt3: TppDBText
              UserName = 'rpFichaProcSR3DBTxt3'
              DataField = 'DATAREALOCOR'
              DataPipeline = ppFichaProc3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 157427
              mmTop = 794
              mmWidth = 31221
              BandType = 4
            end
            object rpFichaProcSR3DBMemo1: TppDBMemo
              UserName = 'rpFichaProcSR3DBMemo1'
              CharWrap = False
              DataField = 'OBSERVETAPA'
              DataPipeline = ppFichaProc3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Stretch = True
              Transparent = True
              mmHeight = 13229
              mmLeft = 9260
              mmTop = 10583
              mmWidth = 145521
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              mmLeading = 0
            end
            object rpFichaProcSR3DBTxt2: TppDBText
              UserName = 'rpFichaProcSR3DBTxt2'
              DataField = 'ASSUNTO'
              DataPipeline = ppFichaProc3
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 9260
              mmTop = 5292
              mmWidth = 145521
              BandType = 4
            end
          end
        end
      end
      object rpFichaProcSR4: TppSubReport
        UserName = 'rpFichaProcSR4'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpFichaProcSR3
        TraverseAllData = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 15081
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpFichaProcCR4: TppChildReport
          AutoStop = False
          DataPipeline = ppFichaProc4
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
          Units = utScreenPixels
          Version = '5.5'
          mmColumnWidth = 0
          object rpFichaProcSR4TitBnd: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12171
            mmPrintPosition = 0
            object rpFichaProcSR4Lbl1: TppLabel
              UserName = 'rpFichaProcSubReport1Lbl1'
              AutoSize = False
              Caption = 'Processo(s) Vinculado(s) a Este'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 3969
              mmLeft = 9260
              mmTop = 1852
              mmWidth = 54769
              BandType = 1
            end
            object rpFichaProcSR4Lbl2: TppLabel
              UserName = 'rpFichaProcSR4Lbl2'
              AutoSize = False
              Caption = 'Número do Processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 9260
              mmTop = 7673
              mmWidth = 32544
              BandType = 1
            end
            object rpFichaProcSR4Lbl3: TppLabel
              UserName = 'rpFichaProcSR4Lbl3'
              AutoSize = False
              Caption = 'Contra Parte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 43392
              mmTop = 7673
              mmWidth = 20638
              BandType = 1
            end
          end
          object rpFichaProcSR4DtlBnd: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object rpFichaProcSR4DBTxt1: TppDBText
              UserName = 'rpFichaProcSubReport1DBTxt1'
              DataField = 'PROCJCJNUM'
              DataPipeline = ppFichaProc4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 9260
              mmTop = 794
              mmWidth = 32544
              BandType = 4
            end
            object rpFichaProcSR4DBTxt2: TppDBText
              UserName = 'DBText14'
              DataField = 'NOME'
              DataPipeline = ppFichaProc4
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 43392
              mmTop = 794
              mmWidth = 122502
              BandType = 4
            end
          end
        end
      end
      object rpFichaProcSR5: TppSubReport
        UserName = 'rpFichaProcSR5'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpFichaProcSR4
        TraverseAllData = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 19844
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpFichaProcCR5: TppChildReport
          AutoStop = False
          DataPipeline = ppFichaProc5
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
          Units = utScreenPixels
          Version = '5.5'
          mmColumnWidth = 0
          object rpFichaProcSR5TitBnd: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12171
            mmPrintPosition = 0
            object rpFichaProcSR5Lbl1: TppLabel
              UserName = 'rpFichaProcSubReport1Lbl1'
              AutoSize = False
              Caption = 'Este Processo Está Vinculado a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 3969
              mmLeft = 9260
              mmTop = 1852
              mmWidth = 54769
              BandType = 1
            end
            object rpFichaProcSR5Lbl2: TppLabel
              UserName = 'Label19'
              AutoSize = False
              Caption = 'Número do Processo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 9260
              mmTop = 7673
              mmWidth = 32544
              BandType = 1
            end
            object rpFichaProcSR5Lbl3: TppLabel
              UserName = 'Label21'
              AutoSize = False
              Caption = 'Contra Parte'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 43392
              mmTop = 7673
              mmWidth = 20638
              BandType = 1
            end
          end
          object rpFichaProcSR5DtlBnd: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object rpFichaProcSR5DBTxt1: TppDBText
              UserName = 'rpFichaProcSubReport1DBTxt1'
              DataField = 'PROCJCJNUM'
              DataPipeline = ppFichaProc5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 9260
              mmTop = 794
              mmWidth = 32544
              BandType = 4
            end
            object rpFichaProcSR5DBTxt2: TppDBText
              UserName = 'DBText14'
              DataField = 'NOME'
              DataPipeline = ppFichaProc5
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 43392
              mmTop = 794
              mmWidth = 122502
              BandType = 4
            end
          end
        end
      end
      object rpFichaProcSR6: TppSubReport
        UserName = 'rpFichaProcSR6'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpFichaProcSR5
        TraverseAllData = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 24606
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpFichaProcCR6: TppChildReport
          AutoStop = False
          DataPipeline = ppFichaProc6
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
          Units = utScreenPixels
          Version = '5.5'
          mmColumnWidth = 0
          object rpFichaProcSR6TitBnd: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
            object rpFichaProcSR6Lbl1: TppLabel
              UserName = 'Label19'
              AutoSize = False
              Caption = 'Litisconsortes ou Testemunhas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold, fsUnderline]
              Transparent = True
              mmHeight = 3969
              mmLeft = 9260
              mmTop = 2646
              mmWidth = 49213
              BandType = 1
            end
          end
          object rpFichaProcSR6DtlBnd: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 5556
            mmPrintPosition = 0
            object rpFichaProcSR6DBTxt1: TppDBText
              UserName = 'rpFichaProcSubReport1DBTxt1'
              DataField = 'NOME'
              DataPipeline = ppFichaProc6
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 9260
              mmTop = 794
              mmWidth = 98425
              BandType = 4
            end
            object rpFichaProcSR6DBTxt2: TppDBText
              UserName = 'DBText14'
              DataField = 'CATEGORIA'
              DataPipeline = ppFichaProc6
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 109009
              mmTop = 794
              mmWidth = 53181
              BandType = 4
            end
          end
        end
      end
      object rpFichaProcSR7: TppSubReport
        UserName = 'rpFichaProcSR7'
        ExpandAll = False
        NewPrintJob = False
        ShiftRelativeTo = rpFichaProcSR6
        TraverseAllData = False
        mmHeight = 3704
        mmLeft = 0
        mmTop = 29369
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpFichaProcCR7: TppChildReport
          AutoStop = False
          DataPipeline = ppFichaProc7
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
          Units = utScreenPixels
          Version = '5.5'
          mmColumnWidth = 0
          object rpFichaProcSR7DtlBnd: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object rpFichaProcSR7DBTxt1: TppDBText
              UserName = 'rpFichaProcSR7DBTxt1'
              DataField = 'NOME'
              DataPipeline = ppFichaProc7
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              Transparent = True
              mmHeight = 3704
              mmLeft = 9260
              mmTop = 794
              mmWidth = 124884
              BandType = 4
            end
            object rpFichaProcSR7DBTxt2: TppDBText
              UserName = 'rpFichaProcSR7DBTxt2'
              DataField = 'DATAPAGTOHONOR'
              DataPipeline = ppFichaProc7
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 136261
              mmTop = 794
              mmWidth = 25135
              BandType = 4
            end
            object rpFichaProcSR7DBTxt3: TppDBText
              UserName = 'rpFichaProcSR7DBTxt3'
              DataField = 'VALORHONOR'
              DataPipeline = ppFichaProc7
              DisplayFormat = '###,###,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 163513
              mmTop = 794
              mmWidth = 25135
              BandType = 4
            end
          end
          object rpFichaProcGroup3: TppGroup
            BreakName = 'IDPESSOA'
            DataPipeline = ppFichaProc7
            UserName = 'rpFichaProcGrp1'
            mmNewColumnThreshold = 0
            mmNewPageThreshold = 0
            object rpFichaProcSR7GrpHdrBnd: TppGroupHeaderBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object rpFichaProcSR7Lbl1: TppLabel
                UserName = 'rpFichaProcSR7Lbl1'
                AutoSize = False
                Caption = 'Honorário Pago a'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 9260
                mmTop = 1323
                mmWidth = 124884
                BandType = 3
                GroupNo = 0
              end
              object rpFichaProcSR7Lbl2: TppLabel
                UserName = 'rpFichaProcSR7Lbl2'
                AutoSize = False
                Caption = 'Data Pagamento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 136261
                mmTop = 1323
                mmWidth = 25135
                BandType = 3
                GroupNo = 0
              end
              object rpFichaProcSR7Lbl3: TppLabel
                UserName = 'rpFichaProcSR7Lbl3'
                AutoSize = False
                Caption = 'Valor Pago'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 163513
                mmTop = 1323
                mmWidth = 25135
                BandType = 3
                GroupNo = 0
              end
            end
            object rpFichaProcSR7GrpFootBnd: TppGroupFooterBand
              mmBottomOffset = 0
              mmHeight = 6879
              mmPrintPosition = 0
              object rpFichaProcSR7DBCalc1: TppDBCalc
                UserName = 'rpFichaProcSR7DBCalc1'
                DataField = 'VALORHONOR'
                DataPipeline = ppFichaProc7
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ResetGroup = rpFichaProcGroup2
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 163513
                mmTop = 1852
                mmWidth = 25135
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR7Lbl4: TppLabel
                UserName = 'rpFichaProcSR7Lbl4'
                AutoSize = False
                Caption = 'Totais:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 146050
                mmTop = 1852
                mmWidth = 15346
                BandType = 5
                GroupNo = 0
              end
              object rpFichaProcSR7Line1: TppLine
                UserName = 'rpFichaProcSR7Line1'
                Weight = 0.75
                mmHeight = 2381
                mmLeft = 163513
                mmTop = 265
                mmWidth = 25135
                BandType = 5
                GroupNo = 0
              end
            end
          end
        end
      end
    end
    object rpFichaProcFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
    end
    object rpFichaProcSmryBnd: TppSummaryBand
      AfterPrint = rpFichaProcSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2910
      mmPrintPosition = 0
    end
    object rpFichaProcGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppFichaProc
      KeepTogether = True
      ReprintOnSubsequentPage = False
      UserName = 'rpFichaProcGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpFichaProcGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 38629
        mmPrintPosition = 0
        object rpFichaProcLbl11: TppLabel
          UserName = 'rpFichaProcLbl11'
          AutoSize = False
          Caption = 'Endereço:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 8996
          mmTop = 2381
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcLbl12: TppLabel
          UserName = 'rpFichaProcLbl12'
          AutoSize = False
          Caption = 'Telefone:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 8996
          mmTop = 10848
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcLbl13: TppLabel
          UserName = 'rpFichaProcLbl13'
          AutoSize = False
          Caption = 'Estabelecimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 8996
          mmTop = 17727
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcLbl14: TppLabel
          UserName = 'rpFichaProcLbl14'
          AutoSize = False
          Caption = 'Cargo Atual:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 8996
          mmTop = 22490
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcLbl17: TppLabel
          UserName = 'rpFichaProcLbl17'
          AutoSize = False
          Caption = 'Centro de Custo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 92869
          mmTop = 17727
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcLbl18: TppLabel
          UserName = 'rpFichaProcLbl18'
          AutoSize = False
          Caption = 'Salário Atual:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 92869
          mmTop = 22490
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt9: TppDBText
          UserName = 'rpFichaProcDBTxt9'
          DataField = 'LOGRADOURO'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 25665
          mmTop = 2381
          mmWidth = 75142
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt10: TppDBText
          UserName = 'rpFichaProcDBTxt10'
          DataField = 'BAIRRO'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 8996
          mmTop = 6615
          mmWidth = 61648
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt19: TppDBText
          UserName = 'rpFichaProcDBTxt19'
          DataField = 'CEP'
          DataPipeline = ppFichaProc
          DisplayFormat = '00000\-999;0;'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 81227
          mmTop = 6615
          mmWidth = 19579
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt20: TppDBText
          UserName = 'rpFichaProcDBTxt20'
          DataField = 'NUMERO'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 102923
          mmTop = 2381
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt21: TppDBText
          UserName = 'rpFichaProcDBTxt21'
          DataField = 'CIDADE'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 102923
          mmTop = 6615
          mmWidth = 38365
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt22: TppDBText
          UserName = 'rpFichaProcDBTxt22'
          DataField = 'COMPLEMENTO'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 117211
          mmTop = 2381
          mmWidth = 72231
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt15: TppDBText
          UserName = 'rpFichaProcDBTxt15'
          DataField = 'ESTAB'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 36777
          mmTop = 17727
          mmWidth = 54770
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt16: TppDBText
          UserName = 'rpFichaProcDBTxt16'
          DataField = 'CARGO'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 36777
          mmTop = 22490
          mmWidth = 54770
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt24: TppDBText
          UserName = 'rpFichaProcDBTxt24'
          DataField = 'C_CUSTO'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 120121
          mmTop = 17727
          mmWidth = 69056
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt25: TppDBText
          UserName = 'rpFichaProcDBTxt25'
          DataField = 'SALARIOATUAL'
          DataPipeline = ppFichaProc
          DisplayFormat = '###,###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 120121
          mmTop = 22490
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt26: TppDBText
          UserName = 'rpFichaProcDBTxt26'
          DataField = 'TIPOPAGAMENTO'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 134144
          mmTop = 22490
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt12: TppDBText
          UserName = 'rpFichaProcDBTxt12'
          DataField = 'DDI'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 25665
          mmTop = 10848
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt13: TppDBText
          UserName = 'rpFichaProcDBTxt13'
          DataField = 'DDD'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 34660
          mmTop = 10848
          mmWidth = 8996
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt14: TppDBText
          UserName = 'rpFichaProcDBTxt14'
          DataField = 'TELEFONE'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 47096
          mmTop = 10848
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt23: TppDBText
          UserName = 'rpFichaProcDBTxt23'
          DataField = 'CODESTADO'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 142611
          mmTop = 6615
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcLbl19: TppLabel
          UserName = 'rpFichaProcLbl19'
          AutoSize = False
          Caption = 'Grau de Instr.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 92869
          mmTop = 27252
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt27: TppDBText
          UserName = 'rpFichaProcDBTxt27'
          DataField = 'GRAUINSTR'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 120121
          mmTop = 27252
          mmWidth = 69056
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcLbl16: TppLabel
          UserName = 'rpFichaProcLbl16'
          AutoSize = False
          Caption = 'Admissão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 8996
          mmTop = 32015
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt18: TppDBText
          UserName = 'rpFichaProcDBTxt18'
          DataField = 'DATAADMISSAO'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 36777
          mmTop = 32015
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcLbl15: TppLabel
          UserName = 'rpFichaProcLbl15'
          AutoSize = False
          Caption = 'Profissão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 8996
          mmTop = 27252
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt17: TppDBText
          UserName = 'rpFichaProcDBTxt17'
          DataField = 'PROFISSAO'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 36777
          mmTop = 27252
          mmWidth = 54769
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcLine4: TppLine
          UserName = 'rpFichaProcLine4'
          Pen.Width = 2
          Position = lpBottom
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 8731
          mmTop = 37306
          mmWidth = 180446
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcLbl20: TppLabel
          UserName = 'rpFichaProcLbl103'
          AutoSize = False
          Caption = 'Demissão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 92869
          mmTop = 32015
          mmWidth = 25929
          BandType = 3
          GroupNo = 0
        end
        object rpFichaProcDBTxt28: TppDBText
          UserName = 'rpFichaProcDBTxt28'
          DataField = 'DATADEMISSAO'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 120121
          mmTop = 32015
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'SITUACAO_FUNC'
          DataPipeline = ppFichaProc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 151871
          mmTop = 22490
          mmWidth = 37306
          BandType = 3
          GroupNo = 0
        end
      end
      object rpFichaProcGrpFootBnd: TppGroupFooterBand
        Visible = False
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object sqlFichaProc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  PR.IDPESSOA, PJ.NOME AS ESTAB,'
      
        '  PT.*, DECODE(PT.FLGSITPROC,0,'#39'Aberto'#39','#39'Encerrado'#39') AS SITUACAO' +
        ','
      '  TRT.DESCRICAO AS TRT, PR.NOME AS NOME,'
      '  PF.DATANASC AS DATANASC,'
      '  DECODE(PF.ESTCIVIL,'
      '    '#39'S'#39','#39'Solteir'#39' || DECODE(PF.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      '    '#39'C'#39','#39'Casad'#39' || DECODE(PF.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      '    '#39'D'#39','#39'Separad'#39' || DECODE(PF.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      
        '    '#39'J'#39','#39'Separad'#39' || DECODE(PF.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39') || '#39' Judicialme' +
        'nte'#39','
      '    '#39'E'#39','#39'Desquitad'#39' || DECODE(PF.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      '    '#39'V'#39','#39'Viúv'#39' || DECODE(PF.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      '    '#39'O'#39','#39'Outro'#39') AS ESTCIVIL,'
      '  DECODE(PF.SEXO,'#39'F'#39','#39'Feminino'#39','#39'M'#39','#39'Masculino'#39','#39#39') AS SEXO,'
      '  IMG.IMAGEM AS FOTO,'
      '  E.LOGRADOURO, E.BAIRRO, E.CEP, E.NUMERO, CI.NOME AS CIDADE,'
      '  E.CODESTADO, E.COMPLEMENTO,'
      
        '  DECODE(RTRIM(TELEFONE.DDI),NULL,'#39#39','#39'('#39'||RTRIM(TELEFONE.DDI)||'#39 +
        ')'#39') AS DDI,'
      
        '  DECODE(RTRIM(TELEFONE.DDD),NULL,'#39#39','#39'('#39'||RTRIM(TELEFONE.DDD)||'#39 +
        ')'#39') AS DDD,'
      '  RTRIM(TELEFONE.NUMERO) AS TELEFONE,'
      '  C.TITULO AS CARGO, PFS.DESCRICAO AS PROFISSAO, F.DATAADMISSAO,'
      '  F.DATADESLIGAMENTO AS DATADEMISSAO,'
      '  RTRIM(SF.DESCRICAO) AS SITUACAO_FUNC,'
      '  CC.NOME AS C_CUSTO, NVL(F.SALARIOATUAL,0) AS SALARIOATUAL,'
      '  DECODE(F.TIPOPAGAMENTO, NULL,'#39#39','
      
        '    '#39'('#39' || DECODE(F.TIPOPAGAMENTO, '#39'H'#39','#39'Horista'#39', '#39'D'#39','#39'Diarista'#39 +
        ','
      '    '#39'M'#39', '#39'Mensalista'#39', '#39'T'#39','#39'Tarefa'#39') || '#39')'#39') AS TIPOPAGAMENTO,'
      '  GR.DESCRICAO AS GRAUINSTR'
      'FROM'
      '  PESSOA PJ, PESSOA PR, PESSOAFISICA PF, IMAGENS IMG, ENDPESS E,'
      
        '  PROCESSOTRAB PT, FUNCIONARIO F, TRT, CARGO C, CIDADES CI, PROF' +
        'ISS PFS,'
      '  CENTCUST CC, GRINSTR GR, SITFUNC SF,'
      
        '  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.DDI, TE.NUMER' +
        'O'
      '   FROM'
      '     TELENDPESS TE,'
      '     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO'
      '      FROM     TELENDPESS'
      '      GROUP BY IDENDERECO) END'
      '   WHERE'
      '     (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE'
      'WHERE'
      '  (PT.NUMPROCTRAB      = 57) AND'
      '  (PT.CODIGOTRT        = TRT.CODIGOTRT) AND'
      '  (PT.IDRECLAMANTE     = PF.IDPESSOA) AND'
      '  (PT.IDRECLAMANTE     = PR.IDPESSOA) AND'
      '  (PT.IDRECLAMANTE     = F.IDPESSOA) AND'
      '  (F.IDSITFUNC         = SF.IDSITFUNC) AND'
      '  (F.IDESTAB           = PJ.IDPESSOA) AND'
      '  (F.IDCARGO           = C.IDCARGO) AND'
      '  (F.IDEMPRESA         = CC.IDEMPRESA) AND'
      '  (F.CODCENTROCUSTO    = CC.CODCENTROCUSTO) AND'
      '  (PF.IDPROFISS        = PFS.IDPROFISS(+)) AND'
      '  (PF.IDGRINSTR        = GR.IDGRINSTR(+)) AND'
      '  (PR.IDIMAGEM         = IMG.IDIMAGEM(+)) AND'
      '  (PR.IDPESSOA         = E.IDPESSOA(+)) AND'
      '  (PR.IDENDRESIDENCIAL = E.IDENDERECO(+)) AND'
      '  (PR.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+)) AND'
      '  (E.IDCIDADES         = CI.IDCIDADES(+))')
    ClientDataSet = CdsFichaProc
    Left = 582
    Top = 198
  end
  object CdsFichaProc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsFichaProcAfterScroll
    Left = 582
    Top = 152
  end
  object dsFichaProc: TwwDataSource
    DataSet = CdsFichaProc
    Left = 582
    Top = 104
  end
  object ppFichaProc: TppBDEPipeline
    DataSource = dsFichaProc
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'FichaProc'
    Left = 582
    Top = 56
    object ppFichaProcppField1: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField2: TppField
      FieldAlias = 'ESTAB'
      FieldName = 'ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField3: TppField
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField4: TppField
      FieldAlias = 'IDRECLAMANTE'
      FieldName = 'IDRECLAMANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField5: TppField
      FieldAlias = 'IDTIPOPROC'
      FieldName = 'IDTIPOPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField6: TppField
      FieldAlias = 'IDADVOGRECTE'
      FieldName = 'IDADVOGRECTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField7: TppField
      FieldAlias = 'CODTIPOSENT'
      FieldName = 'CODTIPOSENT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField8: TppField
      FieldAlias = 'CODIGOTRT'
      FieldName = 'CODIGOTRT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField9: TppField
      FieldAlias = 'JCJ'
      FieldName = 'JCJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField10: TppField
      FieldAlias = 'QTDERECTES'
      FieldName = 'QTDERECTES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField11: TppField
      FieldAlias = 'DATANOTIF'
      FieldName = 'DATANOTIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField12: TppField
      FieldAlias = 'DATAPOST'
      FieldName = 'DATAPOST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField13: TppField
      FieldAlias = 'PROCTRTNUM'
      FieldName = 'PROCTRTNUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField14: TppField
      FieldAlias = 'PROCTSTNUM'
      FieldName = 'PROCTSTNUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField15: TppField
      FieldAlias = 'DATAPREVENCER'
      FieldName = 'DATAPREVENCER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField16: TppField
      FieldAlias = 'DATAEFETENC'
      FieldName = 'DATAEFETENC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField17: TppField
      FieldAlias = 'CUSTOPROC'
      FieldName = 'CUSTOPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField18: TppField
      FieldAlias = 'TIPOENCER'
      FieldName = 'TIPOENCER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField19: TppField
      FieldAlias = 'FLGSITPROC'
      FieldName = 'FLGSITPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField20: TppField
      FieldAlias = 'QTDEPARCACOR'
      FieldName = 'QTDEPARCACOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField21: TppField
      FieldAlias = 'IDADVOGRECDA'
      FieldName = 'IDADVOGRECDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField22: TppField
      FieldAlias = 'IDASSISTTECN'
      FieldName = 'IDASSISTTECN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField23: TppField
      FieldAlias = 'PROCJCJNUM'
      FieldName = 'PROCJCJNUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField24: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField25: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField26: TppField
      FieldAlias = 'INDMATERIA'
      FieldName = 'INDMATERIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField27: TppField
      FieldAlias = 'IDTIPOACAO'
      FieldName = 'IDTIPOACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField28: TppField
      FieldAlias = 'IDENTPASTA'
      FieldName = 'IDENTPASTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField29: TppField
      FieldAlias = 'DATAJUIZO'
      FieldName = 'DATAJUIZO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField30: TppField
      FieldAlias = 'IDVARAJUSTICA'
      FieldName = 'IDVARAJUSTICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField31: TppField
      FieldAlias = 'IDCIDADES'
      FieldName = 'IDCIDADES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField32: TppField
      FieldAlias = 'IDADVOGCASA'
      FieldName = 'IDADVOGCASA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField33: TppField
      FieldAlias = 'FLGPARTEATIVA'
      FieldName = 'FLGPARTEATIVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField34: TppField
      FieldAlias = 'IDLITISCONSORTE'
      FieldName = 'IDLITISCONSORTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField35: TppField
      FieldAlias = 'IDPROCVINCULADO'
      FieldName = 'IDPROCVINCULADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField36: TppField
      FieldAlias = 'FLGVINCULADO'
      FieldName = 'FLGVINCULADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField37: TppField
      FieldAlias = 'DESPESAPROC'
      FieldName = 'DESPESAPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField38: TppField
      FieldAlias = 'NUMVARAJUSTICA'
      FieldName = 'NUMVARAJUSTICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField39: TppField
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField40: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField41: TppField
      FieldAlias = 'CODSUBCONTA'
      FieldName = 'CODSUBCONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField42: TppField
      FieldAlias = 'IDEMPRESAPROP'
      FieldName = 'IDEMPRESAPROP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField43: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField44: TppField
      FieldAlias = 'UNIDNEGOC'
      FieldName = 'UNIDNEGOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField45: TppField
      FieldAlias = 'INDTAXACONV'
      FieldName = 'INDTAXACONV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField46: TppField
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField47: TppField
      FieldAlias = 'MOEDAPROCTRAB'
      FieldName = 'MOEDAPROCTRAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField48: TppField
      FieldAlias = 'IDMOTIVO'
      FieldName = 'IDMOTIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField49: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 48
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField50: TppField
      FieldAlias = 'TRT'
      FieldName = 'TRT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 49
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField51: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 50
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField52: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 51
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField53: TppField
      FieldAlias = 'ESTCIVIL'
      FieldName = 'ESTCIVIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 52
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField54: TppField
      FieldAlias = 'SEXO'
      FieldName = 'SEXO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 53
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField55: TppField
      FieldAlias = 'FOTO'
      FieldName = 'FOTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 54
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField56: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 55
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField57: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 56
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField58: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 57
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField59: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 58
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField60: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 59
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField61: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 60
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField62: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 61
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField63: TppField
      FieldAlias = 'DDI'
      FieldName = 'DDI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 62
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField64: TppField
      FieldAlias = 'DDD'
      FieldName = 'DDD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 63
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField65: TppField
      FieldAlias = 'TELEFONE'
      FieldName = 'TELEFONE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 64
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField66: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 65
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField67: TppField
      FieldAlias = 'PROFISSAO'
      FieldName = 'PROFISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 66
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField68: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 67
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField69: TppField
      FieldAlias = 'DATADEMISSAO'
      FieldName = 'DATADEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 68
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField70: TppField
      FieldAlias = 'SITUACAO_FUNC'
      FieldName = 'SITUACAO_FUNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 69
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField71: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 70
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField72: TppField
      FieldAlias = 'SALARIOATUAL'
      FieldName = 'SALARIOATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 71
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField73: TppField
      FieldAlias = 'TIPOPAGAMENTO'
      FieldName = 'TIPOPAGAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 72
      Searchable = False
      Sortable = False
    end
    object ppFichaProcppField74: TppField
      FieldAlias = 'GRAUINSTR'
      FieldName = 'GRAUINSTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 73
      Searchable = False
      Sortable = False
    end
  end
  object dsFichaProc1: TwwDataSource
    DataSet = CdsFichaProc1
    Left = 25
    Top = 104
  end
  object ppFichaProc1: TppBDEPipeline
    DataSource = dsFichaProc1
    OpenDataSource = False
    UserName = 'FichaProc1'
    Left = 25
    Top = 56
    object ppFichaProc1ppField1: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFichaProc1ppField2: TppField
      FieldAlias = 'NOMEDOCUMENTO'
      FieldName = 'NOMEDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFichaProc1ppField3: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFichaProc1ppField4: TppField
      FieldAlias = 'MASCARA'
      FieldName = 'MASCARA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFichaProc1ppField5: TppField
      FieldAlias = 'ORGAO'
      FieldName = 'ORGAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFichaProc1ppField6: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFichaProc1ppField7: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object dsFichaProc2: TwwDataSource
    DataSet = CdsFichaProc2
    Left = 105
    Top = 104
  end
  object ppFichaProc2: TppBDEPipeline
    DataSource = dsFichaProc2
    OpenDataSource = False
    UserName = 'FichaProc2'
    Left = 105
    Top = 56
    object ppFichaProc2ppField1: TppField
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField2: TppField
      FieldAlias = 'CODTIPOOBJETO'
      FieldName = 'CODTIPOOBJETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField3: TppField
      FieldAlias = 'VALORRECL'
      FieldName = 'VALORRECL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField4: TppField
      FieldAlias = 'PERCPROB'
      FieldName = 'PERCPROB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField5: TppField
      FieldAlias = 'PERCORIG'
      FieldName = 'PERCORIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField6: TppField
      FieldAlias = 'VALORSENTENCA'
      FieldName = 'VALORSENTENCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField7: TppField
      FieldAlias = 'INDVALOR'
      FieldName = 'INDVALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField8: TppField
      FieldAlias = 'DATAINICIO'
      FieldName = 'DATAINICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField9: TppField
      FieldAlias = 'DATAFINAL'
      FieldName = 'DATAFINAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField10: TppField
      FieldAlias = 'VALORPROVAVEL'
      FieldName = 'VALORPROVAVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField11: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField12: TppField
      FieldAlias = 'VAL_RECLAMADO'
      FieldName = 'VAL_RECLAMADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField13: TppField
      FieldAlias = 'VAL_REAL'
      FieldName = 'VAL_REAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField14: TppField
      FieldAlias = 'VAL_PROVAVEL_ORIG'
      FieldName = 'VAL_PROVAVEL_ORIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppFichaProc2ppField15: TppField
      FieldAlias = 'VAL_PROVAVEL'
      FieldName = 'VAL_PROVAVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
  end
  object CdsFichaProc1: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 25
    Top = 152
  end
  object CdsFichaProc2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 105
    Top = 152
  end
  object sqlFichaProc2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  OBJ.NUMPROCTRAB, OBJ.CODTIPOOBJETO, OBJ.VALORRECL, OBJ.PERCPRO' +
        'B, OBJ.PERCORIG,'
      
        '  OBJ.VALORSENTENCA, OBJ.INDVALOR, OBJ.DATAINICIO, OBJ.DATAFINAL' +
        ','
      
        '  ((OBJ.VALORRECL * OBJ.PERCPROB) / 100) AS VALORPROVAVEL, TOBJ.' +
        'DESCRICAO,'
      
        '  0 AS VAL_RECLAMADO, 0 AS VAL_REAL, 0 AS VAL_PROVAVEL_ORIG, 0 A' +
        'S VAL_PROVAVEL'
      'FROM'
      '  OBJPROCTRAB OBJ, TIPOOBJPROCTRAB TOBJ'
      'WHERE'
      '  (OBJ.NUMPROCTRAB   = :NumProcTrab) AND'
      '  (OBJ.CODTIPOOBJETO = TOBJ.CODTIPOOBJETO)'
      'ORDER BY'
      '  UPPER(DESCRICAO)'
      ' '
      ' ')
    ClientDataSet = CdsFichaProc2
    Left = 104
    Top = 198
  end
  object sqlFichaProc3: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  TR.DESCRICAO AS ETAPA, EP.DATAREALOCOR,'
      '  EP.ASSUNTO, EP.OBSERVETAPA'
      'FROM'
      '  ETAPAPROCTRAB EP, TIPORECTRAB TR'
      'WHERE'
      '  (EP.NUMPROCTRAB       = :NumProcTrab) AND'
      '  (EP.CODTIPORECURSO = TR.CODTIPORECURSO)'
      'ORDER BY'
      '  EP.DATAREALOCOR')
    ClientDataSet = CdsFichaProc3
    Left = 184
    Top = 198
  end
  object CdsFichaProc3: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 185
    Top = 152
  end
  object dsFichaProc3: TwwDataSource
    DataSet = CdsFichaProc3
    Left = 185
    Top = 104
  end
  object ppFichaProc3: TppBDEPipeline
    DataSource = dsFichaProc3
    OpenDataSource = False
    UserName = 'FichaProc3'
    Left = 185
    Top = 56
    object ppFichaProc3ppField1: TppField
      FieldAlias = 'ETAPA'
      FieldName = 'ETAPA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFichaProc3ppField2: TppField
      FieldAlias = 'DATAREALOCOR'
      FieldName = 'DATAREALOCOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFichaProc3ppField3: TppField
      FieldAlias = 'ASSUNTO'
      FieldName = 'ASSUNTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFichaProc3ppField4: TppField
      FieldAlias = 'OBSERVETAPA'
      FieldName = 'OBSERVETAPA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object CdsFichaProc4: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 265
    Top = 152
  end
  object dsFichaProc4: TwwDataSource
    DataSet = CdsFichaProc4
    Left = 265
    Top = 104
  end
  object ppFichaProc4: TppBDEPipeline
    DataSource = dsFichaProc4
    OpenDataSource = False
    UserName = 'FichaProc4'
    Left = 265
    Top = 56
    object ppFichaProc4ppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField2: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField3: TppField
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField4: TppField
      FieldAlias = 'IDRECLAMANTE'
      FieldName = 'IDRECLAMANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField5: TppField
      FieldAlias = 'IDTIPOPROC'
      FieldName = 'IDTIPOPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField6: TppField
      FieldAlias = 'IDADVOGRECTE'
      FieldName = 'IDADVOGRECTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField7: TppField
      FieldAlias = 'CODTIPOSENT'
      FieldName = 'CODTIPOSENT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField8: TppField
      FieldAlias = 'CODIGOTRT'
      FieldName = 'CODIGOTRT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField9: TppField
      FieldAlias = 'JCJ'
      FieldName = 'JCJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField10: TppField
      FieldAlias = 'QTDERECTES'
      FieldName = 'QTDERECTES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField11: TppField
      FieldAlias = 'DATANOTIF'
      FieldName = 'DATANOTIF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField12: TppField
      FieldAlias = 'DATAPOST'
      FieldName = 'DATAPOST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField13: TppField
      FieldAlias = 'PROCTRTNUM'
      FieldName = 'PROCTRTNUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField14: TppField
      FieldAlias = 'PROCTSTNUM'
      FieldName = 'PROCTSTNUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField15: TppField
      FieldAlias = 'DATAPREVENCER'
      FieldName = 'DATAPREVENCER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField16: TppField
      FieldAlias = 'DATAEFETENC'
      FieldName = 'DATAEFETENC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField17: TppField
      FieldAlias = 'CUSTOPROC'
      FieldName = 'CUSTOPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField18: TppField
      FieldAlias = 'TIPOENCER'
      FieldName = 'TIPOENCER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField19: TppField
      FieldAlias = 'FLGSITPROC'
      FieldName = 'FLGSITPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField20: TppField
      FieldAlias = 'QTDEPARCACOR'
      FieldName = 'QTDEPARCACOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField21: TppField
      FieldAlias = 'IDADVOGRECDA'
      FieldName = 'IDADVOGRECDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField22: TppField
      FieldAlias = 'IDASSISTTECN'
      FieldName = 'IDASSISTTECN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField23: TppField
      FieldAlias = 'PROCJCJNUM'
      FieldName = 'PROCJCJNUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField24: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField25: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField26: TppField
      FieldAlias = 'INDMATERIA'
      FieldName = 'INDMATERIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField27: TppField
      FieldAlias = 'IDTIPOACAO'
      FieldName = 'IDTIPOACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField28: TppField
      FieldAlias = 'IDENTPASTA'
      FieldName = 'IDENTPASTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField29: TppField
      FieldAlias = 'DATAJUIZO'
      FieldName = 'DATAJUIZO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField30: TppField
      FieldAlias = 'IDVARAJUSTICA'
      FieldName = 'IDVARAJUSTICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField31: TppField
      FieldAlias = 'IDCIDADES'
      FieldName = 'IDCIDADES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField32: TppField
      FieldAlias = 'IDADVOGCASA'
      FieldName = 'IDADVOGCASA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField33: TppField
      FieldAlias = 'FLGPARTEATIVA'
      FieldName = 'FLGPARTEATIVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField34: TppField
      FieldAlias = 'IDLITISCONSORTE'
      FieldName = 'IDLITISCONSORTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField35: TppField
      FieldAlias = 'IDPROCVINCULADO'
      FieldName = 'IDPROCVINCULADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField36: TppField
      FieldAlias = 'FLGVINCULADO'
      FieldName = 'FLGVINCULADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField37: TppField
      FieldAlias = 'DESPESAPROC'
      FieldName = 'DESPESAPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField38: TppField
      FieldAlias = 'NUMVARAJUSTICA'
      FieldName = 'NUMVARAJUSTICA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField39: TppField
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField40: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField41: TppField
      FieldAlias = 'CODSUBCONTA'
      FieldName = 'CODSUBCONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField42: TppField
      FieldAlias = 'IDEMPRESAPROP'
      FieldName = 'IDEMPRESAPROP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField43: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField44: TppField
      FieldAlias = 'UNIDNEGOC'
      FieldName = 'UNIDNEGOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField45: TppField
      FieldAlias = 'INDTAXACONV'
      FieldName = 'INDTAXACONV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField46: TppField
      FieldAlias = 'IDREGRA'
      FieldName = 'IDREGRA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField47: TppField
      FieldAlias = 'MOEDAPROCTRAB'
      FieldName = 'MOEDAPROCTRAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object ppFichaProc4ppField48: TppField
      FieldAlias = 'IDMOTIVO'
      FieldName = 'IDMOTIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
  end
  object CdsFichaProc5: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 345
    Top = 152
  end
  object dsFichaProc5: TwwDataSource
    DataSet = CdsFichaProc5
    Left = 345
    Top = 104
  end
  object ppFichaProc5: TppBDEPipeline
    DataSource = dsFichaProc5
    OpenDataSource = False
    UserName = 'FichaProc5'
    Left = 345
    Top = 56
    object ppFichaProc5ppField1: TppField
      FieldAlias = 'PROCJCJNUM'
      FieldName = 'PROCJCJNUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFichaProc5ppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object CdsFichaProc6: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 425
    Top = 152
  end
  object dsFichaProc6: TwwDataSource
    DataSet = CdsFichaProc6
    Left = 425
    Top = 104
  end
  object ppFichaProc6: TppBDEPipeline
    DataSource = dsFichaProc6
    OpenDataSource = False
    UserName = 'FichaProc6'
    Left = 425
    Top = 56
    object ppFichaProc6ppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFichaProc6ppField2: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFichaProc6ppField3: TppField
      FieldAlias = 'CATEGORIA'
      FieldName = 'CATEGORIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFichaProc6ppField4: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFichaProc6ppField5: TppField
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFichaProc6ppField6: TppField
      FieldAlias = 'IDMOTIVO'
      FieldName = 'IDMOTIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFichaProc6ppField7: TppField
      FieldAlias = 'INDTESTEMUNHA'
      FieldName = 'INDTESTEMUNHA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object CdsFichaProc7: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 505
    Top = 152
  end
  object dsFichaProc7: TwwDataSource
    DataSet = CdsFichaProc7
    Left = 505
    Top = 104
  end
  object ppFichaProc7: TppBDEPipeline
    DataSource = dsFichaProc7
    OpenDataSource = False
    UserName = 'FichaProc7'
    Left = 505
    Top = 56
    object ppFichaProc7ppField1: TppField
      FieldAlias = 'NUMPROCTRAB'
      FieldName = 'NUMPROCTRAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFichaProc7ppField2: TppField
      FieldAlias = 'DATAPAGTOHONOR'
      FieldName = 'DATAPAGTOHONOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFichaProc7ppField3: TppField
      FieldAlias = 'IDFORNSERV'
      FieldName = 'IDFORNSERV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFichaProc7ppField4: TppField
      FieldAlias = 'VALORHONOR'
      FieldName = 'VALORHONOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFichaProc7ppField5: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object CdsRateio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 417
    Top = 8
  end
  object dsRateio: TwwDataSource
    DataSet = CdsRateio
    Left = 361
    Top = 8
  end
  object ppRateio: TppBDEPipeline
    DataSource = dsRateio
    OpenDataSource = False
    UserName = 'ppRateio'
    Left = 305
    Top = 8
    object ppRateioppField1: TppField
      FieldAlias = 'IDFILIALPESSOA'
      FieldName = 'IDFILIALPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppRateioppField2: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppRateioppField3: TppField
      FieldAlias = 'DATABASE'
      FieldName = 'DATABASE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppRateioppField4: TppField
      FieldAlias = 'TIPORATEIO'
      FieldName = 'TIPORATEIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppRateioppField5: TppField
      FieldAlias = 'PERIODO'
      FieldName = 'PERIODO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppRateioppField6: TppField
      FieldAlias = 'PERCENT1'
      FieldName = 'PERCENT1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppRateioppField7: TppField
      FieldAlias = 'VALORBASE1'
      FieldName = 'VALORBASE1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppRateioppField8: TppField
      FieldAlias = 'PERCENT2'
      FieldName = 'PERCENT2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppRateioppField9: TppField
      FieldAlias = 'VALORBASE2'
      FieldName = 'VALORBASE2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppRateioppField10: TppField
      FieldAlias = 'PERCENT3'
      FieldName = 'PERCENT3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppRateioppField11: TppField
      FieldAlias = 'VALORBASE3'
      FieldName = 'VALORBASE3'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppRateioppField12: TppField
      FieldAlias = 'PERCENT4'
      FieldName = 'PERCENT4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppRateioppField13: TppField
      FieldAlias = 'VALORBASE4'
      FieldName = 'VALORBASE4'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppRateioppField14: TppField
      FieldAlias = 'PERCENT5'
      FieldName = 'PERCENT5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppRateioppField15: TppField
      FieldAlias = 'VALORBASE5'
      FieldName = 'VALORBASE5'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppRateioppField16: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppRateioppField17: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppRateioppField18: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppRateioppField19: TppField
      FieldAlias = 'RAT_IND_RECL'
      FieldName = 'RAT_IND_RECL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppRateioppField20: TppField
      FieldAlias = 'RAT_PERC_RECL'
      FieldName = 'RAT_PERC_RECL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppRateioppField21: TppField
      FieldAlias = 'RAT_IND_PROV'
      FieldName = 'RAT_IND_PROV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppRateioppField22: TppField
      FieldAlias = 'RAT_PERC_PROV'
      FieldName = 'RAT_PERC_PROV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppRateioppField23: TppField
      FieldAlias = 'RAT_IND_REAL'
      FieldName = 'RAT_IND_REAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppRateioppField24: TppField
      FieldAlias = 'RAT_PERC_REAL'
      FieldName = 'RAT_PERC_REAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
  end
end
