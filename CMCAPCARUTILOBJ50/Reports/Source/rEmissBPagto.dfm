inherited RptEmissBPagto: TRptEmissBPagto
  Left = 600
  Top = 71
  Height = 310
  Caption = 'RptEmissBPagto'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
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
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptBPagto
    LabelEmpresa = ppLabel11
    LabelSistema = ppLabel12
  end
  object PpBPagto: TppBDEPipeline
    DataSource = DsBPagto
    CloseDataSource = True
    UserName = 'PpBPagto'
    Left = 189
    Top = 80
    object PpBPagtoppField1: TppField
      FieldAlias = 'NUMLOTE'
      FieldName = 'NUMLOTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField3: TppField
      FieldAlias = 'VAL_ORIGIN'
      FieldName = 'VAL_ORIGIN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField4: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField5: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField6: TppField
      FieldAlias = 'DEBCRE'
      FieldName = 'DEBCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField7: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField8: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField9: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField10: TppField
      FieldAlias = 'VALORAD'
      FieldName = 'VALORAD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField11: TppField
      FieldAlias = 'FLAGEMISSAO'
      FieldName = 'FLAGEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField12: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField13: TppField
      FieldAlias = 'NOMEAGENCIA'
      FieldName = 'NOMEAGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField14: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField15: TppField
      FieldAlias = 'NOMEBANCO'
      FieldName = 'NOMEBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField16: TppField
      FieldAlias = 'CONTAFORNE'
      FieldName = 'CONTAFORNE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField17: TppField
      FieldAlias = 'NUMBANCOEMPRESA'
      FieldName = 'NUMBANCOEMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField18: TppField
      FieldAlias = 'NOMEBANCOEMPRESA'
      FieldName = 'NOMEBANCOEMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField19: TppField
      FieldAlias = 'NUMAGENCIAEMPRESA'
      FieldName = 'NUMAGENCIAEMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField20: TppField
      FieldAlias = 'NOMEAENCIAEMPRESA'
      FieldName = 'NOMEAENCIAEMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField21: TppField
      FieldAlias = 'CONTAEMPRESA'
      FieldName = 'CONTAEMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField22: TppField
      FieldAlias = 'TIPODOCTO'
      FieldName = 'TIPODOCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField23: TppField
      FieldAlias = 'NOCONTACORR'
      FieldName = 'NOCONTACORR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField24: TppField
      FieldAlias = 'CPFCNPJ'
      FieldName = 'CPFCNPJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object PpBPagtoppField25: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
  end
  object DsBPagto: TwwDataSource
    DataSet = CdsBPagto
    Left = 137
    Top = 80
  end
  object RptBPagto: TppReport
    AutoStop = False
    DataPipeline = PpBPagto
    OnPrintingComplete = RptBPagtoPrintingComplete
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
    Left = 245
    Top = 80
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpBPagto'
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 51594
      mmPrintPosition = 0
      object LblTitBord1: TppLabel
        UserName = 'LblTitBord1'
        Caption = 'Relatório de Borderô Para Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 97631
        mmTop = 6615
        mmWidth = 76465
        BandType = 0
      end
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 13229
        mmWidth = 272000
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel11'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 121709
        mmTop = 0
        mmWidth = 28310
        BandType = 0
      end
      object RptBordDebitoLabel1: TppLabel
        UserName = 'RptBordDebitoLabel1'
        Caption = 'Borderô Nº:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 14023
        mmWidth = 19315
        BandType = 0
      end
      object RptBordDebitoLabel2: TppLabel
        UserName = 'RptBordDebitoLabel2'
        Caption = 'Agência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 23019
        mmWidth = 14817
        BandType = 0
      end
      object RptBordDebitoLabel3: TppLabel
        UserName = 'RptBordDebitoLabel3'
        Caption = 'Banco:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 18521
        mmWidth = 11642
        BandType = 0
      end
      object RptBordDebitoLabel4: TppLabel
        UserName = 'RptBordDebitoLabel4'
        Caption = 'Conta Corrente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 27517
        mmWidth = 26458
        BandType = 0
      end
      object RptBordDebitoLabel5: TppLabel
        UserName = 'RptBordDebitoLabel5'
        Caption = 
          'Autorizo o crédito nas contas abaixo relacionadas para pagamento' +
          ' dos documentos abaixo listados.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 265
        mmTop = 35190
        mmWidth = 168805
        BandType = 0
      end
      object RptBordDebitoLine1: TppLine
        UserName = 'RptBordDebitoLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 40217
        mmWidth = 272000
        BandType = 0
      end
      object RptBordDebitoLabel6: TppLabel
        UserName = 'RptBordDebitoLabel6'
        Caption = 'Nome do Fornecedor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 17992
        mmTop = 45773
        mmWidth = 32015
        BandType = 0
      end
      object RptBordDebitoLabel7: TppLabel
        UserName = 'RptBordDebitoLabel7'
        AutoSize = False
        Caption = 'Valor Original do Documento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 89959
        mmTop = 41804
        mmWidth = 27781
        BandType = 0
      end
      object RptBordDebitoLabel8: TppLabel
        UserName = 'RptBordDebitoLabel8'
        AutoSize = False
        Caption = 'Acréscimo Decréscimo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 139965
        mmTop = 41804
        mmWidth = 19844
        BandType = 0
      end
      object RptBordDebitoLabel9: TppLabel
        UserName = 'RptBordDebitoLabel9'
        AutoSize = False
        Caption = 'Valor a Pagar:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 119063
        mmTop = 46038
        mmWidth = 19844
        BandType = 0
      end
      object RptBordDebitoLabel10: TppLabel
        UserName = 'RptBordDebitoLabel10'
        AutoSize = False
        Caption = 'Data de Vencimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 7938
        mmLeft = 160867
        mmTop = 41804
        mmWidth = 19315
        BandType = 0
      end
      object RptBordDebitoLabel11: TppLabel
        UserName = 'RptBordDebitoLabel11'
        Caption = 'Ao Banco:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 181505
        mmTop = 45773
        mmWidth = 15081
        BandType = 0
      end
      object RptBordDebitoLabel12: TppLabel
        UserName = 'RptBordDebitoLabel12'
        Caption = 'Agência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 218811
        mmTop = 45773
        mmWidth = 12965
        BandType = 0
      end
      object RptBordDebitoLabel13: TppLabel
        UserName = 'RptBordDebitoLabel13'
        Caption = 'Conta Corrente:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 248709
        mmTop = 45773
        mmWidth = 23548
        BandType = 0
      end
      object RptBordDebitoLine2: TppLine
        UserName = 'RptBordDebitoLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 50536
        mmWidth = 272000
        BandType = 0
      end
      object RptBordDebitoDBText3: TppDBText
        UserName = 'RptBordDebitoDBText3'
        AutoSize = True
        DataField = 'NOMEBANCOEMPRESA'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 3704
        mmLeft = 65617
        mmTop = 18521
        mmWidth = 36513
        BandType = 0
      end
      object RptBordDebitoDBText2: TppDBText
        UserName = 'RptBordDebitoDBText2'
        AutoSize = True
        DataField = 'NUMLOTE'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 3704
        mmLeft = 29104
        mmTop = 14023
        mmWidth = 15610
        BandType = 0
      end
      object RptBordDebitoLabel15: TppLabel
        UserName = 'RptBordDebitoLabel15'
        Caption = 'Doc:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 45773
        mmWidth = 6615
        BandType = 0
      end
      object RptBordDebitoDBText15: TppDBText
        UserName = 'RptBordDebitoDBText15'
        AutoSize = True
        DataField = 'NOMEAENCIAEMPRESA'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 3704
        mmLeft = 65617
        mmTop = 23019
        mmWidth = 36777
        BandType = 0
      end
      object RptBordDebitoDBText16: TppDBText
        UserName = 'RptBordDebitoDBText16'
        AutoSize = True
        DataField = 'NUMBANCOEMPRESA'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 3704
        mmLeft = 29104
        mmTop = 18521
        mmWidth = 34131
        BandType = 0
      end
      object RptBordDebitoDBText17: TppDBText
        UserName = 'RptBordDebitoDBText17'
        AutoSize = True
        DataField = 'NUMAGENCIAEMPRESA'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 3704
        mmLeft = 29104
        mmTop = 23019
        mmWidth = 37042
        BandType = 0
      end
      object RptBPagtoDBText1: TppDBText
        UserName = 'RptBPagtoDBText1'
        AutoSize = True
        DataField = 'NOCONTACORR'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 3704
        mmLeft = 29104
        mmTop = 28046
        mmWidth = 25135
        BandType = 0
      end
      object RptBPagtoLabel1: TppLabel
        UserName = 'RptBPagtoLabel1'
        Caption = 'CPF/CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 69850
        mmTop = 45773
        mmWidth = 14817
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object RptBordDebitoDBText1: TppDBText
        UserName = 'RptBordDebitoDBText1'
        DataField = 'NOME'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 5556
        mmLeft = 17992
        mmTop = 0
        mmWidth = 51594
        BandType = 4
      end
      object RptBordDebitoDBText4: TppDBText
        UserName = 'RptBordDebitoDBText4'
        AutoSize = True
        DataField = 'VAL_ORIGIN'
        DataPipeline = PpBPagto
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 2910
        mmLeft = 103188
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object RptBordDebitoDBText6: TppDBText
        UserName = 'RptBordDebitoDBText6'
        AutoSize = True
        DataField = 'VALORAD'
        DataPipeline = PpBPagto
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 2910
        mmLeft = 148167
        mmTop = 0
        mmWidth = 11642
        BandType = 4
      end
      object RptBordDebitoDBText7: TppDBText
        UserName = 'RptBordDebitoDBText7'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpBPagto
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 2910
        mmLeft = 130704
        mmTop = 0
        mmWidth = 8202
        BandType = 4
      end
      object RptBordDebitoDBText9: TppDBText
        UserName = 'RptBordDebitoDBText9'
        DataField = 'NOMEBANCO'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 4498
        mmLeft = 181505
        mmTop = 3175
        mmWidth = 36777
        BandType = 4
      end
      object RptBordDebitoDBText10: TppDBText
        UserName = 'RptBordDebitoDBText10'
        DataField = 'NUMBANCO'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 2910
        mmLeft = 181505
        mmTop = 0
        mmWidth = 34396
        BandType = 4
      end
      object RptBordDebitoDBText11: TppDBText
        UserName = 'RptBordDebitoDBText11'
        DataField = 'NUMAGENCIA'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 2910
        mmLeft = 218811
        mmTop = 0
        mmWidth = 28575
        BandType = 4
      end
      object RptBordDebitoDBText12: TppDBText
        UserName = 'RptBordDebitoDBText12'
        DataField = 'NOMEAGENCIA'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        WordWrap = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 4498
        mmLeft = 218811
        mmTop = 3175
        mmWidth = 53446
        BandType = 4
      end
      object RptBordDebitoDBText13: TppDBText
        UserName = 'RptBordDebitoDBText13'
        DataField = 'CONTAFORNE'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 2910
        mmLeft = 247650
        mmTop = 0
        mmWidth = 24606
        BandType = 4
      end
      object RptBordDebitoDBText14: TppDBText
        UserName = 'RptBordDebitoDBText14'
        DataField = 'NODOCUMENTO'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 2910
        mmLeft = 0
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object RptBPagtoDBText2: TppDBText
        UserName = 'RptBPagtoDBText2'
        AutoSize = True
        DataField = 'CPFCNPJ'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 2910
        mmLeft = 69850
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
      object RptBordDebitoDBText8: TppDBText
        UserName = 'RptBordDebitoDBText8'
        DataField = 'DATAVENCTO'
        DataPipeline = PpBPagto
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 2910
        mmLeft = 160867
        mmTop = 0
        mmWidth = 18785
        BandType = 4
      end
    end
    object ppFooterBand5: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object RptBordDebitoShape4: TppShape
        UserName = 'RptBordDebitoShape4'
        mmHeight = 11377
        mmLeft = 206905
        mmTop = 1058
        mmWidth = 59531
        BandType = 8
      end
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 272000
        BandType = 8
      end
      object ppLabel12: TppLabel
        UserName = 'ppLabel12'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 15346
        mmWidth = 23548
        BandType = 8
      end
      object RptBordDebitoLine4: TppLine
        UserName = 'RptBordDebitoLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 13494
        mmWidth = 272000
        BandType = 8
      end
      object RptBordDebitoShape1: TppShape
        UserName = 'RptBordDebitoShape1'
        mmHeight = 11377
        mmLeft = 139436
        mmTop = 1058
        mmWidth = 59531
        BandType = 8
      end
      object RptBordDebitoShape2: TppShape
        UserName = 'RptBordDebitoShape2'
        mmHeight = 11377
        mmLeft = 71967
        mmTop = 1058
        mmWidth = 59531
        BandType = 8
      end
      object RptBordDebitoShape3: TppShape
        UserName = 'RptBordDebitoShape3'
        mmHeight = 11377
        mmLeft = 4498
        mmTop = 1058
        mmWidth = 59531
        BandType = 8
      end
      object Lbl2: TppLabel
        UserName = 'Lbl2'
        AutoSize = False
        Caption = 'Lbl2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 73025
        mmTop = 1588
        mmWidth = 57944
        BandType = 8
      end
      object Lbl3: TppLabel
        UserName = 'Lbl3'
        AutoSize = False
        Caption = 'Lbl3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 139965
        mmTop = 1588
        mmWidth = 58473
        BandType = 8
      end
      object Lbl1: TppLabel
        UserName = 'Lbl1'
        AutoSize = False
        Caption = 'Lbl1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 5292
        mmTop = 1588
        mmWidth = 57944
        BandType = 8
      end
      object Lbl4: TppLabel
        UserName = 'Lbl4'
        AutoSize = False
        Caption = 'Lbl4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 207698
        mmTop = 1588
        mmWidth = 58208
        BandType = 8
      end
      object ppCalc9: TppSystemVariable
        UserName = 'Calc9'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 126471
        mmTop = 15346
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc10: TppSystemVariable
        UserName = 'ppCalc101'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 246063
        mmTop = 15346
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptBordDebitoSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object RptBordDebitoDBCalc1: TppDBCalc
        UserName = 'RptBordDebitoDBCalc1'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpBPagto
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpBPagto'
        mmHeight = 4233
        mmLeft = 136525
        mmTop = 3175
        mmWidth = 25665
        BandType = 7
      end
      object RptBordDebitoLabel14: TppLabel
        UserName = 'RptBordDebitoLabel14'
        Caption = 'Total a Pagar:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 76465
        mmTop = 3175
        mmWidth = 23548
        BandType = 7
      end
      object RptBordDebitoLine3: TppLine
        UserName = 'RptBordDebitoLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 272000
        BandType = 7
      end
    end
  end
  object CdsBPagto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 144
  end
  object SqlBPagto: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     LP.NUMLOTE,'
      '     PA.RAZAOSOCIAL AS NOME,'
      
        '     decode(PA.tipo, '#39'F'#39', substr(PA.numdocumento,1, 3)||'#39'.'#39'||sub' +
        'str(PA.numdocumento,4,3)||'#39'.'#39'||substr(PA.numdocumento,7,3)||'#39'-'#39'|' +
        '|substr'
      
        '       (PA.numdocumento,10,2), substr(PA.numdocumento, 1, 2)||'#39'.' +
        #39'||substr(PA.numdocumento,3,3)||'#39'.'#39'||substr'
      
        '       (PA.numdocumento,6,3)||'#39'/'#39'||substr(PA.numdocumento,9,4)||' +
        #39'-'#39'||substr(PA.numdocumento,13,2)'
      '     ) as cpfcnpj,'
      '     LD.VALOR AS  VAL_ORIGIN,'
      '     LX.VALOR,'
      '     D.DATAVENCTO,'
      '     LD.DEBCRE,'
      '     F.DESCRICAO,'
      '     D.NODOCUMENTO,'
      '     D.COMPLDOCUMENTO,'
      '     (ABS(LD.VALOR) - ABS(LX.VALOR)) AS VALORAD,'
      '     LP.FLAGEMISSAO,'
      '     BANCOEMPRESA.NUMBANCO AS NUMBANCOEMPRESA,'
      '     PC.RAZAOSOCIAL NOMEBANCOEMPRESA,'
      '     AGENCIAEMPRESA.NUMAGENCIA AS NUMAGENCIAEMPRESA,'
      '     PESSOAAGENCIA.NOME AS NOMEAENCIAEMPRESA,'
      '     PCONTA.NOCONTACORR AS CONTAEMPRESA     ,'
      '     PCONTA.NOCONTACORR ,'
      '     TP.DESCRICAO AS TIPODOCTO,'
      '     D.CODDOCUMENTO, PA.RAZAOSOCIAL,'
      '     '#39'       '#39' AS NUMBANCO ,'
      '     '#39'                               '#39' AS NOMEBANCO,'
      '     '#39'        '#39' AS NUMAGENCIA,'
      '     '#39'                               '#39' AS NOMEAGENCIA,'
      '     '#39'                '#39' AS CONTAFORNE'
      'FROM'
      '     LOTEPAGTO LP,'
      '     DOCUMENTO D,'
      '     LANCTODOCUM LD,'
      '     LOTEXDOCUM LX,'
      '     PORTADORFORMA PF,'
      '     PORTADORCONTA PCONTA,'
      '     FORMARECPAG F,'
      '     PESSOA PA,'
      '     PESSOA PC,'
      '     AGENCIABANCARIA AGENCIAEMPRESA,'
      '     BANCO BANCOEMPRESA,'
      '     PESSOA PESSOAAGENCIA,'
      '     TIPODOCRECPAG TP'
      'WHERE'
      '      (LP.NUMLOTE = :NUMLOTE) AND'
      '      (LD.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      '      (LD.OPERACAO = D.OPERACAO) AND'
      '      (LX.NUMLOTE = LP.NUMLOTE) AND'
      '      (D.CODDOCUMENTO = LX.CODDOCUMENTO) AND'
      '      (PF.CODPORTFORMA = LP.CODPORTFORMA) AND'
      '      (PCONTA.CODPORTADOR = PF.CODPORTADOR) AND'
      '      (F.CODFORMA = PF.CODFORMA) AND'
      '      (PA.IDPESSOA = D.IDFORCLI) AND'
      '      (PCONTA.IDAGENCIA       = AGENCIAEMPRESA.IDPESSOA) AND'
      '      (PESSOAAGENCIA.IDPESSOA = AGENCIAEMPRESA.IDPESSOA) AND'
      '      (AGENCIAEMPRESA.IDBANCO = BANCOEMPRESA.IDPESSOA) AND'
      '      (PC.IDPESSOA = BANCOEMPRESA.IDPESSOA) AND'
      '      (D.CODTIPDOC=TP.CODTIPDOC(+))'
      'ORDER BY'
      '       PA.RAZAOSOCIAL,'
      '       D.DATAVENCTO,'
      '       D.NODOCUMENTO,'
      '       D.COMPLDOCUMENTO'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = CdsBPagto
    Left = 128
    Top = 144
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
end
