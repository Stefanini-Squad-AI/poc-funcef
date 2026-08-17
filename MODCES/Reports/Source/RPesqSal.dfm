inherited RptPesqSal: TRptPesqSal
  Left = 251
  Top = 193
  Width = 270
  Height = 278
  Caption = 'RptPesqSal'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'TipoRelatorio'
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
        Name = 'TipoRelatorio'
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
        Caption = 'TipoExclusaoEmpresa'
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
        Name = 'TipoExclusaoEmpresa'
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
        Caption = 'IdPesquisa'
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
        Name = 'IdPesquisa'
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
        Caption = 'NomePesquisa'
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
        Name = 'NomePesquisa'
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
        Caption = 'DataPesquisa'
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
        Name = 'DataPesquisa'
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
        Caption = 'IdEmpresa'
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
        Name = 'IdEmpresa'
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
        Caption = 'IndNomeCodigo'
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
        Name = 'IndNomeCodigo'
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
        Caption = 'PercCorte'
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
        Name = 'PercCorte'
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
    Report = rpPesqSal
    ConnectionType = cntBDE
  end
  object rpPesqSal: TppReport
    AutoStop = False
    DataPipeline = ppPesqSal
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 206
    Top = 8
    Version = '5.5'
    mmColumnWidth = 197300
    object rpPesqSalHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object rpPesqSalLblTITULO: TppLabel
        UserName = 'rpPesqSalLblTITULO'
        Caption = 'Tabulação de Pesquisa por Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67469
        mmTop = 9790
        mmWidth = 57415
        BandType = 0
      end
      object rpPesqSalLbl1: TppLabel
        UserName = 'rpPesqSalLbl1'
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
        mmLeft = 151077
        mmTop = 6085
        mmWidth = 9790
        BandType = 0
      end
      object rpPesqSalLbl2: TppLabel
        UserName = 'rpPesqSalLbl2'
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
        mmLeft = 146050
        mmTop = 10319
        mmWidth = 14817
        BandType = 0
      end
      object rpPesqSalLine1: TppLine
        UserName = 'rpPesqSalLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 6615
        mmTop = 21960
        mmWidth = 183886
        BandType = 0
      end
      object rpPesqSalDBTxt1: TppDBText
        UserName = 'rpPesqSalDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppPesqSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 87577
        mmTop = 2381
        mmWidth = 17198
        BandType = 0
      end
      object rpPesqSalDBTxt2: TppDBText
        UserName = 'rpPesqSalDBTxt2'
        DataField = 'NOMEPESQSALAR'
        DataPipeline = ppPesqSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23548
        mmTop = 17463
        mmWidth = 87842
        BandType = 0
      end
      object rpPesqSalDBTxt3: TppDBText
        UserName = 'rpPesqSalDBTxt3'
        DataField = 'DATAREFPESQ'
        DataPipeline = ppPesqSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 17463
        mmWidth = 21960
        BandType = 0
      end
      object rpPesqSalCalc1: TppSystemVariable
        UserName = 'rpPesqSalCalc1'
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 6085
        mmWidth = 7938
        BandType = 0
      end
      object rpPesqSalCalc2: TppSystemVariable
        UserName = 'rpPesqSalCalc2'
        VarType = vtPrintDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 161661
        mmTop = 10319
        mmWidth = 22225
        BandType = 0
      end
      object rpPesqSalLblCorte: TppLabel
        UserName = 'rpPesqSalLblCorte'
        Caption = 'Corte'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 6615
        mmTop = 10583
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Pesquisa:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 6615
        mmTop = 17463
        mmWidth = 13494
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Data Ref.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 146050
        mmTop = 17463
        mmWidth = 14817
        BandType = 0
      end
    end
    object rpPesqSalDtlBnd: TppDetailBand
      BeforePrint = rpPesqSalDtlBndBeforePrint
      mmBottomOffset = 0
      mmHeight = 10054
      mmPrintPosition = 0
      object rpPesqSalDBTxt6: TppDBText
        UserName = 'rpPesqSalDBTxt6'
        DataField = 'FREQ'
        DataPipeline = ppPesqSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 57150
        mmTop = 794
        mmWidth = 8731
        BandType = 4
      end
      object rpPesqSalDBTxt5: TppDBText
        UserName = 'rpPesqSalDBTxt5'
        DataField = 'DESCRICAO'
        DataPipeline = ppPesqSal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 6615
        mmTop = 794
        mmWidth = 48948
        BandType = 4
      end
      object rpPesqSalLbl11: TppLabel
        UserName = 'rpPesqSalLbl11'
        AutoSize = False
        Caption = 'Nominal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 67204
        mmTop = 794
        mmWidth = 12435
        BandType = 4
      end
      object rpPesqSalLbl12: TppLabel
        UserName = 'rpPesqSalLbl12'
        AutoSize = False
        Caption = 'Real'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 67204
        mmTop = 5821
        mmWidth = 12435
        BandType = 4
      end
      object rpPesqSalLblMENOR1: TppLabel
        UserName = 'rpPesqSalLblMENOR1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 80698
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblPRIQUA1: TppLabel
        UserName = 'rpPesqSalLblPRIQUA1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 96573
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMODA1: TppLabel
        UserName = 'rpPesqSalLblMODA1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 112448
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMEDIA1: TppLabel
        UserName = 'rpPesqSalLblMEDIA1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 128323
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMEDIANA1: TppLabel
        UserName = 'rpPesqSalLblMEDIANA1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144198
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblTERQUA1: TppLabel
        UserName = 'rpPesqSalLblTERQUA1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMAIOR1: TppLabel
        UserName = 'rpPesqSalLblMAIOR1'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 175948
        mmTop = 529
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMENOR2: TppLabel
        UserName = 'rpPesqSalLblMENOR2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 80963
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblPRIQUA2: TppLabel
        UserName = 'rpPesqSalLblPRIQUA2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 96838
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMODA2: TppLabel
        UserName = 'rpPesqSalLblMODA2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 112713
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMEDIA2: TppLabel
        UserName = 'rpPesqSalLblMEDIA2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 128588
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMEDIANA2: TppLabel
        UserName = 'rpPesqSalLblMEDIANA2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 144463
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblTERQUA2: TppLabel
        UserName = 'rpPesqSalLblTERQUA2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160338
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
      object rpPesqSalLblMAIOR2: TppLabel
        UserName = 'rpPesqSalLblMAIOR2'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 5821
        mmWidth = 14552
        BandType = 4
      end
    end
    object rpPesqSalFootBnd: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
    end
    object rpPesqSalSmryBnd: TppSummaryBand
      AfterPrint = rpPesqSalSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
    end
    object rpPesqSalGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = ppPesqSal
      UserName = 'rpPesqSalGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpPesqSalGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rpPesqSalDBTxt4: TppDBText
          UserName = 'rpPesqSalDBTxt4'
          DataField = 'NOME'
          DataPipeline = ppPesqSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 6615
          mmTop = 529
          mmWidth = 46831
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl3: TppLabel
          UserName = 'rpPesqSalLbl3'
          AutoSize = False
          Caption = 'Frequência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 54240
          mmTop = 529
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl10: TppLabel
          UserName = 'rpPesqSalLbl10'
          AutoSize = False
          Caption = 'Maior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 175948
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl4: TppLabel
          UserName = 'rpPesqSalLbl4'
          AutoSize = False
          Caption = 'Menor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 80698
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl5: TppLabel
          UserName = 'rpPesqSalLbl5'
          AutoSize = False
          Caption = '1.Quartil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 96573
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl6: TppLabel
          UserName = 'rpPesqSalLbl6'
          AutoSize = False
          Caption = 'Moda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 112448
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl7: TppLabel
          UserName = 'rpPesqSalLbl7'
          AutoSize = False
          Caption = 'Média'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128323
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl8: TppLabel
          UserName = 'rpPesqSalLbl8'
          AutoSize = False
          Caption = 'Mediana'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144198
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLbl9: TppLabel
          UserName = 'rpPesqSalLbl9'
          AutoSize = False
          Caption = '3.Quartil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160073
          mmTop = 529
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object rpPesqSalLine2: TppLine
          UserName = 'rpPesqSalLine2'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 6615
          mmTop = 4498
          mmWidth = 183886
          BandType = 3
          GroupNo = 0
        end
      end
      object rpPesqSalGrpFootBnd: TppGroupFooterBand
        AfterPrint = rpPesqSalGrpFootBndAfterPrint
        BeforePrint = rpPesqSalGrpFootBndBeforePrint
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object rpPesqSalLbl13: TppLabel
          UserName = 'rpPesqSalLbl13'
          Caption = 'Apuração Referente ao Cargo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 6615
          mmTop = 1058
          mmWidth = 46831
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLine3: TppLine
          UserName = 'rpPesqSalLine3'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 6615
          mmTop = 0
          mmWidth = 183886
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLbl14: TppLabel
          UserName = 'rpPesqSalLbl14'
          AutoSize = False
          Caption = 'Nominal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 66940
          mmTop = 794
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLbl15: TppLabel
          UserName = 'rpPesqSalLbl15'
          AutoSize = False
          Caption = 'Real'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 67204
          mmTop = 5556
          mmWidth = 12435
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLine4: TppLine
          UserName = 'rpPesqSalLine4'
          Pen.Width = 2
          Weight = 1.5
          mmHeight = 1058
          mmLeft = 6615
          mmTop = 9525
          mmWidth = 183886
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMENOR1_TOT: TppLabel
          UserName = 'rpPesqSalLblMENOR1_TOT'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 80963
          mmTop = 794
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMENOR2_TOT: TppLabel
          UserName = 'rpPesqSalLblMENOR2_TOT'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 80963
          mmTop = 5556
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMEDIA1_TOT: TppLabel
          UserName = 'rpPesqSalLblMEDIA1_TOT'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128588
          mmTop = 794
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMEDIA2_TOT: TppLabel
          UserName = 'rpPesqSalLblMEDIA2_TOT'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 128588
          mmTop = 5556
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMAIOR1_TOT: TppLabel
          UserName = 'rpPesqSalLblMAIOR1_TOT'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 176213
          mmTop = 794
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMAIOR2_TOT: TppLabel
          UserName = 'rpPesqSalLblMAIOR2_TOT'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 176213
          mmTop = 5556
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalDBCalc1: TppDBCalc
          UserName = 'rpPesqSalDBCalc1'
          DataField = 'FREQ'
          DataPipeline = ppPesqSal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = rpPesqSalGroup1
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 57150
          mmTop = 794
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblFREQ_TOT: TppLabel
          UserName = 'rpPesqSalLblMENOR2_TOT3'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 57150
          mmTop = 2910
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblPRIMQ1_TOT: TppLabel
          UserName = 'rpPesqSalLblMENOR1_TOT1'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 96573
          mmTop = 794
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblPRIMQ2_TOT: TppLabel
          UserName = 'rpPesqSalLblMENOR2_TOT1'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 96573
          mmTop = 5556
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMODA1_TOT: TppLabel
          UserName = 'rpPesqSalLblMENOR1_TOT2'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 112713
          mmTop = 794
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMODA2_TOT: TppLabel
          UserName = 'rpPesqSalLblMENOR2_TOT2'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 112713
          mmTop = 5556
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMEDIANA1_TOT: TppLabel
          UserName = 'rpPesqSalLblMEDIA1_TOT1'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 794
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblMEDIANA2_TOT: TppLabel
          UserName = 'rpPesqSalLblMEDIA2_TOT1'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 144463
          mmTop = 5556
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblTERCQ1_TOT: TppLabel
          UserName = 'rpPesqSalLblMEDIA1_TOT2'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160338
          mmTop = 794
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
        object rpPesqSalLblTERCQ2_TOT: TppLabel
          UserName = 'rpPesqSalLblMEDIA2_TOT2'
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 160338
          mmTop = 5556
          mmWidth = 14552
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppPesqSal: TppBDEPipeline
    DataSource = dsPesqSal
    SkipWhenNoRecords = False
    UserName = 'PesqSal'
    Left = 206
    Top = 56
    object ppPesqSalppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 25
      DisplayWidth = 25
      Position = 0
    end
    object ppPesqSalppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDEMPRESAPARTIC'
      FieldName = 'IDEMPRESAPARTIC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppPesqSalppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object ppPesqSalppField4: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 64
      DisplayWidth = 64
      Position = 3
    end
    object ppPesqSalppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'FATOR'
      FieldName = 'FATOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppPesqSalppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppPesqSalppField7: TppField
      FieldAlias = 'NOMEPESQSALAR'
      FieldName = 'NOMEPESQSALAR'
      FieldLength = 24
      DisplayWidth = 24
      Position = 6
    end
    object ppPesqSalppField8: TppField
      FieldAlias = 'DATAREFPESQ'
      FieldName = 'DATAREFPESQ'
      FieldLength = 10
      DisplayWidth = 10
      Position = 7
    end
    object ppPesqSalppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'MENOR'
      FieldName = 'MENOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppPesqSalppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'MENOR_R'
      FieldName = 'MENOR_R'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object ppPesqSalppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'MAIOR'
      FieldName = 'MAIOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppPesqSalppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'MAIOR_R'
      FieldName = 'MAIOR_R'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object ppPesqSalppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'MEDIA'
      FieldName = 'MEDIA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object ppPesqSalppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'MEDIA_R'
      FieldName = 'MEDIA_R'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object ppPesqSalppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'MODA'
      FieldName = 'MODA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object ppPesqSalppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'MODA_R'
      FieldName = 'MODA_R'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object ppPesqSalppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'MEDIANA'
      FieldName = 'MEDIANA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object ppPesqSalppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'MEDIANA_R'
      FieldName = 'MEDIANA_R'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppPesqSalppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRIMQUA'
      FieldName = 'PRIMQUA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object ppPesqSalppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'PRIMQUA_R'
      FieldName = 'PRIMQUA_R'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object ppPesqSalppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'TERCQUA'
      FieldName = 'TERCQUA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object ppPesqSalppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'TERCQUA_R'
      FieldName = 'TERCQUA_R'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object ppPesqSalppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'FREQ'
      FieldName = 'FREQ'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
  end
  object dsPesqSal: TwwDataSource
    DataSet = CdsPesqSal
    Left = 206
    Top = 104
  end
  object sqlPesqSal: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  '#39'CIA THERMAS DO RIO QUENTE'#39' AS EMPRESA,'
      '  TEN.IDEMPRESAPARTIC,'
      '  C.TITULO AS NOME,'
      '  DECODE(0,'
      '    0,TO_CHAR(DECODE(TEN.IDEMPRESAPARTIC,'
      '        1,'#39'* - '#39','
      '        '#39#39
      '      )),'
      '    1,TO_CHAR(DECODE(TEN.IDEMPRESAPARTIC,'
      '        0,'#39'* - '#39','
      '        '#39#39
      '      )),'
      '    '#39#39') || PJ.NOME AS DESCRICAO,'
      '  AJU.FATOR, PJ.IDPESSOA,'
      '  '#39'Remuneração e Beneficios'#39' AS NOMEPESQSALAR,'
      '  '#39'05/11/2003'#39' AS DATAREFPESQ,'
      
        '  TEN.MENOR, TEN.MENOR_R, TEN.MAIOR, TEN.MAIOR_R, TEN.MEDIA, TEN' +
        '.MEDIA_R,'
      
        '  TEN.MODA, TEN.MODA_R, TEN.MEDIANA, TEN.MEDIANA_R, TEN.PRIMQUA,' +
        ' TEN.PRIMQUA_R,'
      '  TEN.TERCQUA, TEN.TERCQUA_R, TEN.FREQ'
      'FROM'
      '  PESSOA PJ, AJUSTPESQ AJU, CARGO C, TENDPESQSAL TEN'
      'WHERE'
      '  (TEN.IDPESQSALAR     = -1) AND'
      '  (TEN.IDCARGO         = C.IDCARGO) AND'
      '  (TEN.IDEMPRESAPARTIC = PJ.IDPESSOA) AND'
      '  (TEN.IDPESQSALAR     = AJU.IDPESQSALAR(+)) AND'
      '  (TEN.IDEMPRESAPARTIC = AJU.IDEMPRESAPARTIC(+))'
      'ORDER BY'
      '  NOME, DESCRICAO'
      '')
    ClientDataSet = CdsPesqSal
    Left = 206
    Top = 200
  end
  object CdsPesqSal: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 206
    Top = 152
    Data = {
      3E0200009619E0BD0100000018000000170000000000030000003E0207454D50
      5245534101004900000002000753554254595045020049000A00466978656443
      686172000557494454480200020019000F4944454D5052455341504152544943
      0800040000000000044E4F4D4501004900000001000557494454480200020028
      000944455343524943414F010049000000010005574944544802000200400005
      4641544F520800040000000000084944504553534F4108000400000000000D4E
      4F4D455045535153414C41520100490000000200075355425459504502004900
      0A00466978656443686172000557494454480200020018000B44415441524546
      5045535101004900000002000753554254595045020049000A00466978656443
      68617200055749445448020002000A00054D454E4F520800040000000000074D
      454E4F525F520800040000000000054D41494F520800040000000000074D4149
      4F525F520800040000000000054D454449410800040000000000074D45444941
      5F520800040000000000044D4F44410800040000000000064D4F44415F520800
      040000000000074D454449414E410800040000000000094D454449414E415F52
      0800040000000000075052494D5155410800040000000000095052494D515541
      5F52080004000000000007544552435155410800040000000000095445524351
      55415F5208000400000000000446524551080004000000000002000D44454641
      554C545F4F52444552020082000200000003000400044C434944040001000908
      0000}
  end
  object CdsTendencia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 111
    Top = 60
  end
end
