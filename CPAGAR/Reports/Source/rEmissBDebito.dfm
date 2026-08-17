inherited RptEmissBDebito: TRptEmissBDebito
  Left = 415
  Top = 209
  Width = 513
  Height = 313
  Caption = 'RptEmissBDebito'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Emissão de Borderô - Débito em Conta'
    Params = <
      item
        Caption = 'NumLote'
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
        Caption = 'Data'
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
      end
      item
        Caption = 'PortForma'
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 265
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptBDebito
    LabelEmpresa = ppLabel14
    LabelSistema = ppLabel15
  end
  object PpBDebito: TppBDEPipeline
    DataSource = DsBDebito
    CloseDataSource = True
    UserName = 'PpBDebito'
    Left = 229
    Top = 101
    object PpBDebitoppField1: TppField
      FieldAlias = 'NOCONTACORR'
      FieldName = 'NOCONTACORR'
      FieldLength = 15
      DisplayWidth = 15
      Position = 0
    end
    object PpBDebitoppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'AP'
      FieldName = 'AP'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object PpBDebitoppField3: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 15
      DisplayWidth = 15
      Position = 2
    end
    object PpBDebitoppField4: TppField
      FieldAlias = 'AGPORTC'
      FieldName = 'AGPORTC'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object PpBDebitoppField5: TppField
      FieldAlias = 'BANCPORTC'
      FieldName = 'BANCPORTC'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object PpBDebitoppField6: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object PpBDebitoppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMLOTE'
      FieldName = 'NUMLOTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object PpBDebitoppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object PpBDebitoppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object PpBDebitoppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VAL_ORIGIN'
      FieldName = 'VAL_ORIGIN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object PpBDebitoppField11: TppField
      FieldAlias = 'DEBCRE'
      FieldName = 'DEBCRE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 10
    end
    object PpBDebitoppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDEBCRE'
      FieldName = 'VALDEBCRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object PpBDebitoppField13: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 12
    end
    object PpBDebitoppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object PpBDebitoppField15: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 14
    end
    object PpBDebitoppField16: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 30
      DisplayWidth = 30
      Position = 15
    end
    object PpBDebitoppField17: TppField
      FieldAlias = 'NUMBANCOFORN'
      FieldName = 'NUMBANCOFORN'
      FieldLength = 10
      DisplayWidth = 10
      Position = 16
    end
    object PpBDebitoppField18: TppField
      FieldAlias = 'DESCBANCOFORN'
      FieldName = 'DESCBANCOFORN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 17
    end
    object PpBDebitoppField19: TppField
      FieldAlias = 'NUMAGFORN'
      FieldName = 'NUMAGFORN'
      FieldLength = 15
      DisplayWidth = 15
      Position = 18
    end
    object PpBDebitoppField20: TppField
      FieldAlias = 'CONTACORRENTEFORN'
      FieldName = 'CONTACORRENTEFORN'
      FieldLength = 15
      DisplayWidth = 15
      Position = 19
    end
    object PpBDebitoppField21: TppField
      FieldAlias = 'NOMEFORN'
      FieldName = 'NOMEFORN'
      FieldLength = 60
      DisplayWidth = 60
      Position = 20
    end
    object PpBDebitoppField22: TppField
      FieldAlias = 'CPFCNPJ'
      FieldName = 'CPFCNPJ'
      FieldLength = 16
      DisplayWidth = 16
      Position = 21
    end
    object PpBDebitoppField23: TppField
      FieldAlias = 'FLAGEMISSAO'
      FieldName = 'FLAGEMISSAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 22
    end
    object PpBDebitoppField24: TppField
      FieldAlias = 'TIPODOCTO'
      FieldName = 'TIPODOCTO'
      FieldLength = 35
      DisplayWidth = 35
      Position = 23
    end
    object PpBDebitoppField25: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 24
    end
  end
  object DsBDebito: TwwDataSource
    DataSet = CdsBDebito
    Left = 177
    Top = 93
  end
  object RptBDebito: TppReport
    Tag = 1
    AutoStop = False
    DataPipeline = PpBDebito
    OnPrintingComplete = RptBDebitoPrintingComplete
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 13000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
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
    Left = 287
    Top = 103
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpBDebito'
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 48948
      mmPrintPosition = 0
      object LblTitBord2: TppLabel
        UserName = 'LblTitBord2'
        Caption = 'Relatório de Borderô Para Débito em Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 48154
        mmTop = 5027
        mmWidth = 87313
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'ppLine11'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 11377
        mmWidth = 185000
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 79640
        mmTop = 0
        mmWidth = 24077
        BandType = 0
      end
      object RptBordPagtoLabel1: TppLabel
        UserName = 'RptBordPagtoLabel1'
        Caption = 'Borderô Nº:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 13229
        mmWidth = 16933
        BandType = 0
      end
      object RptBordPagtoLabel2: TppLabel
        UserName = 'RptBordPagtoLabel2'
        Caption = 'Ao Banco:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 18785
        mmWidth = 15081
        BandType = 0
      end
      object RptBordPagtoLabel3: TppLabel
        UserName = 'RptBordPagtoLabel3'
        Caption = 'Agência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 88371
        mmTop = 18785
        mmWidth = 12965
        BandType = 0
      end
      object RptBordPagtoLabel4: TppLabel
        UserName = 'RptBordPagtoLabel4'
        Caption = 'Conta Corrente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 134673
        mmTop = 18785
        mmWidth = 23548
        BandType = 0
      end
      object RptBordPagtoDBText1: TppDBText
        UserName = 'RptBordPagtoDBText1'
        DataField = 'NUMLOTE'
        DataPipeline = PpBDebito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 3969
        mmLeft = 17198
        mmTop = 13229
        mmWidth = 15875
        BandType = 0
      end
      object RptBordPagtoDBText2: TppDBText
        UserName = 'RptBordPagtoDBText2'
        DataField = 'BANCPORTC'
        DataPipeline = PpBDebito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 3969
        mmLeft = 17198
        mmTop = 23548
        mmWidth = 70908
        BandType = 0
      end
      object RptBordPagtoDBText3: TppDBText
        UserName = 'RptBordPagtoDBText3'
        AutoSize = True
        DataField = 'NUMAGENCIA'
        DataPipeline = PpBDebito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 3683
        mmLeft = 103452
        mmTop = 18785
        mmWidth = 21421
        BandType = 0
      end
      object RptBordPagtoDBText4: TppDBText
        UserName = 'RptBordPagtoDBText4'
        AutoSize = True
        DataField = 'NOCONTACORR'
        DataPipeline = PpBDebito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 3683
        mmLeft = 159544
        mmTop = 18785
        mmWidth = 25146
        BandType = 0
      end
      object RptBordPagtoDBText5: TppDBText
        UserName = 'RptBordPagtoDBText5'
        AutoSize = True
        DataField = 'NUMBANCO'
        DataPipeline = PpBDebito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 3683
        mmLeft = 17198
        mmTop = 18785
        mmWidth = 18246
        BandType = 0
      end
      object RptBordPagtoDBText6: TppDBText
        UserName = 'RptBordPagtoDBText6'
        DataField = 'AGPORTC'
        DataPipeline = PpBDebito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 3969
        mmLeft = 103717
        mmTop = 23548
        mmWidth = 79640
        BandType = 0
      end
      object RptBordPagtoLine1: TppLine
        UserName = 'RptBordPagtoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 34925
        mmWidth = 185000
        BandType = 0
      end
      object RptBordPagtoLine2: TppLine
        UserName = 'RptBordPagtoLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 45773
        mmWidth = 185000
        BandType = 0
      end
      object RptBordPagtoLabel5: TppLabel
        UserName = 'RptBordPagtoLabel5'
        Caption = 
          'Autorizo o Débito na conta acima para pagamento dos documentos a' +
          'baixo listados se encontram em anexo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 29369
        mmWidth = 161396
        BandType = 0
      end
      object RptBordPagtoLabel6: TppLabel
        UserName = 'RptBordPagtoLabel6'
        Caption = 'Número do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 0
        mmTop = 37042
        mmWidth = 17992
        BandType = 0
      end
      object RptBordPagtoLabel7: TppLabel
        UserName = 'RptBordPagtoLabel7'
        Caption = 'Fornecedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 41010
        mmWidth = 17992
        BandType = 0
      end
      object RptBordPagtoLabel8: TppLabel
        UserName = 'RptBordPagtoLabel8'
        Caption = 'Valor Original do Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 73290
        mmTop = 37042
        mmWidth = 26458
        BandType = 0
      end
      object RptBordPagtoLabel9: TppLabel
        UserName = 'RptBordPagtoLabel9'
        Caption = 'Acréscimos Decréscimos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 118534
        mmTop = 37042
        mmWidth = 20108
        BandType = 0
      end
      object RptBordPagtoLabel10: TppLabel
        UserName = 'RptBordPagtoLabel10'
        Caption = 'Valor a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 144992
        mmTop = 41010
        mmWidth = 20373
        BandType = 0
      end
      object RptBordPagtoLabel11: TppLabel
        UserName = 'RptBordPagtoLabel11'
        Caption = 'Data de Vencimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 166952
        mmTop = 37042
        mmWidth = 17992
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'AP.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 101600
        mmTop = 41275
        mmWidth = 5249
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptBordPagtoDBText7: TppDBText
        UserName = 'RptBordPagtoDBText7'
        DataField = 'NODOCUMENTO'
        DataPipeline = PpBDebito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object RptBordPagtoDBText8: TppDBText
        UserName = 'RptBordPagtoDBText8'
        DataField = 'NOMEFORN'
        DataPipeline = PpBDebito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 3704
        mmLeft = 17992
        mmTop = 0
        mmWidth = 55827
        BandType = 4
      end
      object RptBordPagtoDBText9: TppDBText
        UserName = 'RptBordPagtoDBText9'
        AutoSize = True
        DataField = 'VAL_ORIGIN'
        DataPipeline = PpBDebito
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 3175
        mmLeft = 83069
        mmTop = 0
        mmWidth = 16679
        BandType = 4
      end
      object RptBordPagtoDBText10: TppDBText
        UserName = 'RptBordPagtoDBText10'
        AutoSize = True
        DataField = 'VALDEBCRE'
        DataPipeline = PpBDebito
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 3175
        mmLeft = 121455
        mmTop = 0
        mmWidth = 17187
        BandType = 4
      end
      object RptBordPagtoDBText11: TppDBText
        UserName = 'RptBordPagtoDBText11'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpBDebito
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 3175
        mmLeft = 154782
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
      object RptBordPagtoDBText12: TppDBText
        UserName = 'RptBordPagtoDBText12'
        DataField = 'DATAVENCTO'
        DataPipeline = PpBDebito
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 3704
        mmLeft = 166952
        mmTop = 0
        mmWidth = 17992
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'AP'
        DataPipeline = PpBDebito
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 3175
        mmLeft = 101600
        mmTop = 0
        mmWidth = 14817
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 24871
      mmPrintPosition = 0
      object RptBordPagtoShape4: TppShape
        UserName = 'RptBordPagtoShape4'
        mmHeight = 11377
        mmLeft = 93927
        mmTop = 1852
        mmWidth = 43392
        BandType = 8
      end
      object ppLabel15: TppLabel
        UserName = 'ppLabel15'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 16933
        mmWidth = 38629
        BandType = 8
      end
      object ppLine12: TppLine
        UserName = 'ppLine12'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 185000
        BandType = 8
      end
      object RptBordPagtoShape1: TppShape
        UserName = 'RptBordPagtoShape1'
        mmHeight = 11377
        mmLeft = 141288
        mmTop = 1852
        mmWidth = 43392
        BandType = 8
      end
      object RptBordPagtoShape2: TppShape
        UserName = 'RptBordPagtoShape2'
        mmHeight = 11377
        mmLeft = 47096
        mmTop = 1852
        mmWidth = 43392
        BandType = 8
      end
      object RptBordPagtoShape3: TppShape
        UserName = 'RptBordPagtoShape3'
        mmHeight = 11377
        mmLeft = 265
        mmTop = 1852
        mmWidth = 43392
        BandType = 8
      end
      object Lblc2: TppLabel
        UserName = 'Lblc2'
        AutoSize = False
        Caption = 'Lblc2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 47890
        mmTop = 2646
        mmWidth = 41804
        BandType = 8
      end
      object Lblc3: TppLabel
        UserName = 'Lblc3'
        AutoSize = False
        Caption = 'Lblc3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 94721
        mmTop = 2646
        mmWidth = 42069
        BandType = 8
      end
      object LblC1: TppLabel
        UserName = 'LblC1'
        AutoSize = False
        Caption = 'LblC1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 2646
        mmWidth = 42069
        BandType = 8
      end
      object Lblc4: TppLabel
        UserName = 'Lblc4'
        AutoSize = False
        Caption = 'Lblc4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 142082
        mmTop = 2646
        mmWidth = 42069
        BandType = 8
      end
      object RptBordPagtoLine4: TppLine
        UserName = 'RptBordPagtoLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 14288
        mmWidth = 185000
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 158750
        mmTop = 16669
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 72761
        mmTop = 16669
        mmWidth = 39158
        BandType = 8
      end
    end
    object RptBordPagtoSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object RptBordPagtoLine3: TppLine
        UserName = 'RptBordPagtoLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 1058
        mmWidth = 185000
        BandType = 7
      end
      object RptBordPagtoDBCalc1: TppDBCalc
        UserName = 'RptBordPagtoDBCalc1'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpBDebito
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpBDebito'
        mmHeight = 4191
        mmLeft = 142124
        mmTop = 3969
        mmWidth = 22183
        BandType = 7
      end
      object RptBordPagtoLabel12: TppLabel
        UserName = 'RptBordPagtoLabel12'
        Caption = 'Total a Pagar:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 79375
        mmTop = 3969
        mmWidth = 23813
        BandType = 7
      end
    end
  end
  object SqlTeste: TCMSqlParams
    ClientDataSet = CdsTeste
    Left = 116
    Top = 205
  end
  object CdsTeste: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 42
    Top = 208
  end
  object SqlBDebito: TCMSqlParams
    SQL.Strings = (
      ' SELECT DISTINCT'
      '      PORTC.NOCONTACORR,'
      '      DOC.NUMAPGR AS AP,'
      '      AG.NUMAGENCIA,'
      '      PA.NOME AS AGPORTC,'
      '      PB.RAZAOSOCIAL AS BANCPORTC,'
      '      BAN.NUMBANCO,'
      '      LOTE.NUMLOTE,'
      '      LOTEX.VALOR,'
      '      LOTEX.CODDOCUMENTO,'
      '      LANC.VALOR AS VAL_ORIGIN,'
      '      LANC.DEBCRE,'
      '      (ABS(LANC.VALOR) - ABS(LOTEX.VALOR)) as VALDEBCRE,'
      '      DOC.DATAVENCTO,DOC.NODOCUMENTO,'
      '      DOC.COMPLDOCUMENTO,FORM.DESCRICAO,'
      ''
      '      CCFORNECEDOR.NUMBANCOFORN,'
      '      CCFORNECEDOR.DESCBANCOFORN,'
      '      CCFORNECEDOR.NUMAGFORN,'
      '      CCFORNECEDOR.CONTACORRENTEFORN,'
      ''
      ''
      '      PESSFOR.RAZAOSOCIAL AS NOMEFORN,'
      
        '      decode(PESSFOR.tipo,'#39'F'#39',substr(PESSFOR.numdocumento,1,3)||' +
        #39'.'#39'||substr(PESSFOR.numdocumento,4,3)||'#39'.'#39'||substr(PESSFOR.numdo' +
        'cumento,7,3)||'#39'-'#39'||substr(PESSFOR.numdocumento,10,2),'
      
        '                              substr(PESSFOR.numdocumento,1,2)||' +
        #39'-'#39'||substr(PESSFOR.numdocumento,3,8)||'#39'-'#39'||substr(PESSFOR.numdo' +
        'cumento,11,4)) as cpfcnpj ,'
      '      LOTE.FLAGEMISSAO  ,'
      '      TP.DESCRICAO AS TIPODOCTO,'
      '      PESSFOR.RAZAOSOCIAL'
      ' FROM'
      '       DOCUMENTO DOC,'
      '       LANCTODOCUM LANC,'
      '       LOTEXDOCUM LOTEX,'
      '       LOTEPAGTO LOTE,'
      '       PORTADORFORMA PORTF,'
      '       PORTADORCONTA PORTC,'
      '       FORMARECPAG FORM,'
      '       PESSOA PESSFOR,'
      '       EMPRESAFORN EF,'
      '       AGENCIABANCARIA AG,'
      '       BANCO BAN,'
      '       PESSOA PA,'
      '       PESSOA PB  ,'
      '       (SELECT '
      '           CONTAFORN.IDCBANCARIA,'
      '           CONTAFORN.CONTACORRENTE AS CONTACORRENTEFORN,'
      '           BANFORN.NUMBANCO AS NUMBANCOFORN,'
      '           DESCBANC.NOME AS DESCBANCOFORN,'
      '           AGFORN.NUMAGENCIA AS NUMAGFORN'
      '        FROM'
      '           AGENCIABANCARIA AGFORN,'
      '           CONTABANCARIA CONTAFORN,'
      '           BANCO BANFORN,'
      '           PESSOA DESCBANC'
      '        WHERE'
      '           (CONTAFORN.IDAGENCIA = AGFORN.IDPESSOA(+)) AND'
      '           (AGFORN.IDBANCO      = BANFORN.IDPESSOA) AND'
      '           (AGFORN.IDPESSOA     = DESCBANC.IDPESSOA)'
      '       ) CCFORNECEDOR,'
      ''
      ''
      '       TIPODOCRECPAG TP'
      ''
      ''
      ' WHERE (LOTE.NUMLOTE       = :NUMLOTE)                AND'
      '       (DOC.OPERACAO       = LANC.OPERACAO )            AND'
      '       (DOC.CODDOCUMENTO   = LANC.CODDOCUMENTO )    AND'
      '       (DOC.CODDOCUMENTO   = LOTEX.CODDOCUMENTO)    AND'
      '       (LOTEX.NUMLOTE      = LOTE.NUMLOTE)        AND'
      '       (PORTF.CODPORTFORMA = LOTE.CODPORTFORMA)   AND'
      '       (PORTC.CODPORTADOR  = PORTF.CODPORTADOR)   AND'
      '       (FORM.CODFORMA      = PORTF.CODFORMA)      AND'
      '       (EF.IDFORCLI        = PESSFOR.IDPESSOA)    AND'
      ''
      '       (DOC.IDCBANCARIA    = CCFORNECEDOR.IDCBANCARIA(+)) AND'
      ''
      '       (EF.IDFORCLI        = DOC.IDFORCLI)        AND'
      '       (PORTC.IDAGENCIA    = AG.IDPESSOA)         AND'
      '       (AG.IDBANCO         = BAN.IDPESSOA)        AND'
      '       (AG.IDPESSOA        = PA.IDPESSOA)         AND'
      '       (BAN.IDPESSOA       = PB.IDPESSOA)         AND'
      '       (DOC.CODTIPDOC      = TP.CODTIPDOC(+))'
      ' ORDER BY'
      '      PESSFOR.RAZAOSOCIAL,'
      '      DOC.DATAVENCTO,'
      '      DOC.NODOCUMENTO,'
      '      DOC.COMPLDOCUMENTO'
      ''
      ''
      ' '
      ' ')
    ClientDataSet = CdsBDebito
    Left = 96
    Top = 88
  end
  object CdsBDebito: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 88
    Data = {
      6F0300009619E0BD0100000018000000190000000000030000006F030B4E4F43
      4F4E5441434F525201004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002000F0002415008000400000000000A
      4E554D4147454E43494101004900000002000753554254595045020049000A00
      46697865644368617200055749445448020002000F00074147504F5254430100
      490000000100055749445448020002003C000942414E43504F52544301004900
      00000100055749445448020002003C00084E554D42414E434F01004900000001
      00055749445448020002000A00074E554D4C4F54450800040000000000055641
      4C4F5208000400000000000C434F44444F43554D454E544F0800040000000000
      0A56414C5F4F524947494E080004000000000006444542435245010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      0200020001000956414C44454243524508000400000000000A4441544156454E
      43544F08000800000000000B4E4F444F43554D454E544F08000400000000000E
      434F4D504C444F43554D454E544F010049000000020007535542545950450200
      49000A0046697865644368617200055749445448020002000300094445534352
      4943414F0100490000000100055749445448020002001E000C4E554D42414E43
      4F464F524E0100490000000100055749445448020002000A000D444553434241
      4E434F464F524E0100490000000100055749445448020002003C00094E554D41
      47464F524E01004900000002000753554254595045020049000A004669786564
      4368617200055749445448020002000F0011434F4E5441434F5252454E544546
      4F524E0100490000000100055749445448020002000F00084E4F4D45464F524E
      0100490000000100055749445448020002003C0007435046434E504A01004900
      000001000557494454480200020010000B464C4147454D495353414F01004900
      000002000753554254595045020049000A004669786564436861720005574944
      5448020002000100095449504F444F43544F0100490000000100055749445448
      0200020023000B52415A414F534F4349414C0100490000000100055749445448
      020002003C0002000D44454641554C545F4F5244455202008200040000001900
      0D000E000F00044C4349440400010009080000}
  end
end
