inherited rptDARM: TrptDARM
  Left = 303
  Top = 173
  Width = 420
  Height = 284
  Caption = 'rptDARM'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Paramêtros para emissão do DARM'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Data Inicial'
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
        Caption = 'Data Final'
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
        Caption = 'Competência'
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
        Caption = 'Código de Pagamento'
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
        Caption = 'Alterador para Juros'
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
        Caption = 'Alterador para Multa'
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
        Caption = 'Visualizar DARM'
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
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpDARM
    ConnectionType = cntBDE
  end
  object dsDARM: TwwDataSource
    DataSet = cdsDARM
    Left = 13
    Top = 64
  end
  object ppDARM: TppBDEPipeline
    DataSource = dsDARM
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'DARM'
    Left = 76
    Top = 64
  end
  object rpDARM: TppReport
    AutoStop = False
    DataPipeline = ppDARM
    OnPrintingComplete = rpDARMPrintingComplete
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 7000
    PrinterSetup.mmMarginLeft = 7000
    PrinterSetup.mmMarginRight = 7000
    PrinterSetup.mmMarginTop = 7000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    Left = 135
    Top = 62
    Version = '5.5'
    mmColumnWidth = 196000
    object rpGPSDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 210873
      mmPrintPosition = 0
      object ppShape33: TppShape
        UserName = 'Shape33'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 86784
        mmTop = 179652
        mmWidth = 85990
        BandType = 4
      end
      object ppShape28: TppShape
        UserName = 'Shape28'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 86784
        mmTop = 153459
        mmWidth = 85990
        BandType = 4
      end
      object ppShape8: TppShape
        UserName = 'Shape19'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 134673
        mmTop = 26194
        mmWidth = 38365
        BandType = 4
      end
      object ppShape15: TppShape
        UserName = 'Shape23'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 115888
        mmTop = 61119
        mmWidth = 57150
        BandType = 4
      end
      object ppShape13: TppShape
        UserName = 'Shape21'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 115888
        mmTop = 52388
        mmWidth = 57150
        BandType = 4
      end
      object ppShape4: TppShape
        UserName = 'Shape15'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 129911
        mmTop = 8731
        mmWidth = 43127
        BandType = 4
      end
      object ppShape1: TppShape
        UserName = 'Shape4'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 143669
        mmTop = 0
        mmWidth = 29369
        BandType = 4
      end
      object ppShape16: TppShape
        UserName = 'Shape1'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 87048
        mmTop = 69850
        mmWidth = 85990
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape13'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 87048
        mmTop = 0
        mmWidth = 56886
        BandType = 4
      end
      object ppShape11: TppShape
        UserName = 'Shape201'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 87048
        mmTop = 43656
        mmWidth = 85990
        BandType = 4
      end
      object ppShape30: TppShape
        UserName = 'Shape30'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 115623
        mmTop = 162190
        mmWidth = 57150
        BandType = 4
      end
      object ppShape32: TppShape
        UserName = 'Shape32'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 115623
        mmTop = 170921
        mmWidth = 57150
        BandType = 4
      end
      object ppShape25: TppShape
        UserName = 'Shape25'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 134409
        mmTop = 135996
        mmWidth = 38365
        BandType = 4
      end
      object ppShape20: TppShape
        UserName = 'Shape203'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 143404
        mmTop = 109802
        mmWidth = 29369
        BandType = 4
      end
      object rpGPSShape6: TppShape
        UserName = 'Shape2'
        mmHeight = 78846
        mmLeft = 0
        mmTop = 0
        mmWidth = 265
        BandType = 4
      end
      object rpGPSLine1: TppLine
        UserName = 'Line6'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 265
        mmTop = 17463
        mmWidth = 172509
        BandType = 4
      end
      object rpGPSLabel3: TppLabel
        UserName = 'Label1'
        Caption = 'DOCUMENTO DE ARRECADAÇÃO DE RECEITAS MUNICIPAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 12435
        mmTop = 14552
        mmWidth = 62177
        BandType = 4
      end
      object rpGPSLabel1: TppLabel
        UserName = 'Label2'
        Caption = 'PREFEITURA DA CIDADE DO RIO DE JANEIRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 12435
        mmTop = 2646
        mmWidth = 55033
        BandType = 4
      end
      object rpGPSLabel2: TppLabel
        UserName = 'Label3'
        Caption = 'SECRETARIA MUNICIPAL DE FAZENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 12435
        mmTop = 10848
        mmWidth = 39423
        BandType = 4
      end
      object rpGPSLabel4: TppLabel
        UserName = 'Label4'
        Caption = '11. INFORMAÇÕES COMPLEMENTARES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 794
        mmTop = 26988
        mmWidth = 40481
        BandType = 4
      end
      object rpGPSLabel12: TppLabel
        UserName = 'Label13'
        Caption = '01. RECEITA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 144727
        mmTop = 794
        mmWidth = 10583
        BandType = 4
      end
      object rpGPSLabel13: TppLabel
        UserName = 'Label14'
        Caption = '02. INSCRIÇÃO DO CONTRIBUINTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 130969
        mmTop = 9525
        mmWidth = 29898
        BandType = 4
      end
      object rpGPSLabel15: TppLabel
        UserName = 'Label16'
        Caption = '06. VALOR DO TRIBUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 87577
        mmTop = 44186
        mmWidth = 20373
        BandType = 4
      end
      object rpGPSLabel18: TppLabel
        UserName = 'Label19'
        Caption = '08. VALOR DA MULTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 116152
        mmTop = 61913
        mmWidth = 18521
        BandType = 4
      end
      object rpGPSLabel19: TppLabel
        UserName = 'Label20'
        Caption = '07. VALOR DA MORA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 116417
        mmTop = 53181
        mmWidth = 17727
        BandType = 4
      end
      object rpGPSLabel20: TppLabel
        UserName = 'Label21'
        Caption = '09. VALOR TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 87577
        mmTop = 70644
        mmWidth = 15346
        BandType = 4
      end
      object rpGPSDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'EMPRESAFORNECEDOR'
        DataPipeline = ppDARM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 21960
        mmWidth = 84931
        BandType = 4
      end
      object rpGPSImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D617036420000424D364200000000000036000000280000005800
          0000400000000100180000000000004200000000000000000000000000000000
          0000A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06BC8646BC8646BC8646BC8646BC8646
          BC8646BC8646BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06BC8646D2AD82D2AD82E5D7C1F3EBE0FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EBE0E9E2CF
          DFC8AADFC8AABC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06D2AD82E5D7C1F7F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFE9E2CFE5D7C1E5D7C1E5D7C1E5D7C1E5D7C1F7F6F1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F1E5D7C1BC8646BC8646
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06BC8646DFC8AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E2CFB2C78FB2C78F
          85A84F4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F800185A84F85A84FB2C78FB2C78FE5D7C1F7F6F1FFFFFFFFFFFFFF
          FFFFFFFFFFF7F6F1E9E2CFDFC8AABC8646A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06BC8646E9E2CFFFFFFFFFFFFFFFFFFFF7F6F1B2C78F85A84F4F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          0185A84FB2C78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F1E9E2CFD2AD82BC
          8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFE5D7C185A84F4F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          B2C78FE5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06BC8646F7F6F1FFFFFFFFFFFFE5D7C185A84F4F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          8001B2C78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFDAF2FDDAF2FDFFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06D2AD82F7F6F1FFFFFFF7F6F185A84F4F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F8001B2C78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8646BC8646BC8646BC
          8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCE8FD2FB8FD7CD2FDBCE8FDFFFFFF
          FFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFFFFFFE9E2
          CF4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F8001E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2F
          B8FD2FB8FD7CD2FDBCE8FDFFFFFFFFFFFFFFFFFFDFC8AABC8646A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06BC8646FFFFFF
          FFFFFFB2C78F4F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F800185A84FF7F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDDAF2FDFFFFFFFFFFFFF7
          F6F1D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06F7F6F1FFFFFFE5D7C14F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F800185A84FF7F6F1F3EBE0D2AD82D2AD82BC
          8646FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06D2AD82FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD7CD2FDDAF2FDFFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06E5D7C1FFFFFFF3EBE04F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F800185A84FF7F6F1FFFFFFBC86
          46A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A5
          5C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFFFFFFFFD2AD82A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06BC8646FFFFFFFFFFFF85A84F4F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F8001F3EBE0
          FFFFFFFFFFFFBC8646BC8646BC8646DFC8AAE5D7C1E5D7C1DFC8AAD2AD82E9E2
          CFE5D7C1E5D7C1D2AD82DFC8AAF3EBE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C
          D2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDDAF2FD
          FFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFE5D7C14F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          8001E9E2CFE5D7C1D2AD82E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06
          A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06A55C06BC86
          46E9E2CFFFFFFFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFFF7F6F1BC8646A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFF
          FFFF85A84F4F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F8001B2C78FA55C06A55C06A55C06F3EBE0FFFFFFFFFFFFFFFFFFFF
          FFFFA55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFD2AD82
          A55C06A55C06A55C06D2AD82FFFFFFFFFFFFBCE8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDF7F6F1FFFFFFFFFFFFD2
          AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06BC8646FFFFFFF7F6F14F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F800185A84FDFC8AAA55C06A55C06A55C06FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFA55C06BC8646BC8646BC8646E9E2CFFFFFFFFFFFFFFF
          FFFFFFFFFFE5D7C1A55C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFBCE8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FDBCE8FDFFFFFFFFFFFFD2AD82A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06D2AD82FFFFFFDFC8AA4F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F800185A84FF7F6F1BC8646BC8646D2AD82
          DFC8AAE9E2CFDFC8AAD2AD82D2AD82F3EBE0FFFFFFFFFFFFFFFFFFFFFFFFE9E2
          CFBC8646D2AD82D2AD82D2AD82F3EBE0FFFFFFE9E2CFE5D7C1E9E2CFFFFFFFFF
          FFFFFFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFFFFFFFDFC8AAA55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFB2C78F4F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F8001F7F6F1FFFFFFBC
          8646BC8646A55C06D2AD82A55C06A55C06A55C06A55C06E9E2CFFFFFFFFFFFFF
          FFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFF
          FFFFFFFFD2AD82A55C06BC8646BC8646FFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFF
          DFC8AAA55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFB2
          C78F4F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001E9E2
          CFFFFFFFFFFFFFA55C06A55C06A55C06D2AD82A55C06A55C06A55C06A55C06FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06E5D7C1
          FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06A55C06A55C06F7F6F1FFFFFFBCE8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD7CD2FDFFFFFFFFFFFFDFC8AAA55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06DFC8AAFFFFFF85A84F4F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F8001E9E2CFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06D2AD82A55C06A55C
          06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A5
          5C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFDFC8AAA55C06A55C06A55C06
          E5D7C1FFFFFFFFFFFFBCE8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFFD2AD82A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06DFC8AAFFFFFFB2C78F4F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F800185A84FE9E2CFFFFFFFFFFFFFFFFFFFDFC8AABC8646BC8646BC8646
          E5D7C1D2AD82D2AD82E5D7C1D2AD82F7F6F1E5D7C1E5D7C1E5D7C1E5D7C1F3EB
          E0E5D7C1E5D7C1E5D7C1E5D7C1F7F6F1FFFFFFFFFFFFFFFFFFFFFFFFE9E2CFBC
          8646BC8646A55C06DFC8AAFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFF
          FFD2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFB2C78F4F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F8001B2C78FF7F6F1FFFFFFF3EBE0E5D7C1D2AD82F3EBE0FF
          FFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06D2AD82A55C06A55C06
          A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8646A55C06A55C
          06A55C06E5D7C1BC8646BC8646D2AD82E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFDA
          F2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FDBCE8FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFB2
          C78F4F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F800185A84FF3EBE0FFFFFFFFFFFFFFFFFFBC8646A55C
          06A55C06FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06D2
          AD82A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BC8646A55C06A55C06A55C06E5D7C1A55C06A55C06A55C06D2AD82FFFFFFFFFF
          FFFFFFFFBC8646D2AD82FFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FDDAF2FDFFFFFFF7F6F1A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06D2AD82FFFFFFE5D7C14F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F8001B2C78FE9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFBC8646A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C
          06A55C06A55C06D2AD82A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBC8646A55C06A55C06A55C06DFC8AAA55C06A55C06A55C06
          D2AD82FFFFFFFFFFFFFFFFFFBC8646A55C06FFFFFFFFFFFF2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDF7F6F1FFFFFFDF
          C8AAA55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06BC8646FFFFFFFFFFFF4F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F8001FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFF
          DFC8AAA55C06A55C06A55C06BC8646D2AD82A55C06A55C06A55C06A55C06E5D7
          C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8646A55C06A55C06A55C06D2AD82A5
          5C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFBC8646A55C06E9E2CFFFFFFF
          FFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD7CD2FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06F7F6F1FFFFFF85A84F4F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F8001FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2AD82D2AD82E9E2CFFFFFFFFF
          FFFFF3EBE0E9E2CFE9E2CFD2AD82E5D7C1E5D7C1E9E2CFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE5D7C1E5D7C1E5D7C1E5D7C1F3EBE0DFC8AAD2AD82D2AD
          82D2AD82E9E2CFE5D7C1E5D7C1E5D7C1DFC8AAFFFFFFFFFFFFFFFFFFD2AD82BC
          8646E5D7C1FFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFF3EBE0A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFF
          FFFFDFC8AA4F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F8001E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFE9E2CFBC8646BC8646FFFFFFFFFF
          FFFFFFFFBC8646A55C06A55C06BC8646D2AD82A55C06A55C06A55C06BC8646FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06D2AD82
          BC8646A55C06A55C06A55C06D2AD82FFFFFFFFFFFFFFFFFFFFFFFFBC8646A55C
          06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDFFFFFFFFFFFFD2AD82
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06BC8646FFFFFFFFFFFF4F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F8001B2C78FFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06
          BC8646FFFFFFFFFFFFFFFFFFBC8646A55C06A55C06BC8646D2AD82A55C06A55C
          06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A5
          5C06A55C06D2AD82BC8646A55C06A55C06A55C06D2AD82FFFFFFFFFFFFFFFFFF
          FFFFFFBC8646A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBC
          E8FDFFFFFFF3EBE0A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06F3EBE0FFFFFFB2C78F4F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F8001F7F6F1FFFFFFFFFFFFFF
          FFFFE5D7C1A55C06BC8646FFFFFFFFFFFFFFFFFFBC8646A55C06A55C06BC8646
          D2AD82A55C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFA55C06A55C06A55C06A55C06D2AD82BC8646A55C06A55C06A55C06D2AD82FF
          FFFFFFFFFFFFFFFFFFFFFFBC8646A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFFFFFF
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001B2C7
          8FFFFFFFFFFFFFFFFFFFF3EBE0BC8646D2AD82FFFFFFFFFFFFFFFFFFBC8646A5
          5C06A55C06BC8646D2AD82A55C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06D2AD82BC8646A55C06A55C
          06A55C06D2AD82FFFFFFFFFFFFFFFFFFFFFFFFBC8646A55C06A55C06E5D7C1FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFDFC8AAA55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06F3EBE0FFFFFFDFC8AA4F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F8001E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2AD82DFC8
          AAE9E2CFFFFFFFFFFFFFFFFFFFFFFFFFF3EBE0E5D7C1E5D7C1E5D7C1F7F6F1F3
          EBE0E5D7C1E5D7C1E5D7C1F7F6F1FFFFFFE5D7C1E5D7C1E5D7C1E5D7C1F3EBE0
          E5D7C1D2AD82D2AD82D2AD82E5D7C1E5D7C1E5D7C1E5D7C1E9E2CFFFFFFFFFFF
          FFFFFFFFD2AD82BC8646E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFF
          F7F6F1A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06BC8646FFFFFFFFFFFF85A84F4F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F8001F7F6F1FFFFFFFFFFFFFFFFFF
          FFFFFFA55C06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06A55C
          06A55C06BC8646D2AD82A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06DFC8AAA55C06A55C06A55C06
          BC8646FFFFFFFFFFFFFFFFFFBC8646A55C06E9E2CFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFF7F6F14F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F800185A84FF7
          F6F1FFFFFFFFFFFFFFFFFFBC8646A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFF
          E5D7C1A55C06A55C06A55C06A55C06E5D7C1A55C06A55C06A55C06A55C06E5D7
          C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06E5D7C1A5
          5C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFA55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFDAF2FDBCE8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFD2AD82A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          F7F6F1FFFFFFE9E2CF4F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F800185A84FF7F6F1FFFFFFFFFFFFD2AD82A55C06BC8646FFFFFFFF
          FFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06E5D7C1A55C06A55C06
          A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C
          06A55C06E5D7C1A55C06A55C06A55C06D2AD82FFFFFFFFFFFFFFFFFFBC8646D2
          AD82FFFFFFDAF2FD7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFD2AD82A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06BC8646FFFFFFFFFFFFB2C78F4F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F800185A84FE9E2CFFFFFFFFFFFFFFFFF
          FFF3EBE0FFFFFFFFFFFFFFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A55C06E5
          D7C1A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          A55C06A55C06A55C06A55C06DFC8AABC8646BC8646D2AD82E5D7C1FFFFFFE9E2
          CFF3EBE0FFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FD
          FFFFFFD2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFFFFFF85A84F4F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          E9E2CFFFFFFFFFFFFFFFFFFFE5D7C1A55C06BC8646BC8646DFC8AAD2AD82D2AD
          82D2AD82E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFF7F6F1F7F6F1E5D7C1E5D7C1E5
          D7C1E5D7C1F7F6F1E5D7C1E5D7C1D2AD82D2AD82F3EBE0FFFFFFFFFFFFFFFFFF
          F3EBE0A55C06A55C06D2AD82DAF2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD7CD2FDFFFFFFDFC8AAA55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD
          82FFFFFFFFFFFF85A84F4F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F8001B2C78FFFFFFFFFFFFFE9E2CFA55C06A55C06A55C06
          DFC8AAA55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6
          F1A55C06A55C06A55C06A55C06E5D7C1A55C06A55C06A55C06A55C06FFFFFFFF
          FFFFFFFFFFFFFFFFE5D7C1A55C06A55C06E5D7C12FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFDFC8AAA55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06DFC8AAFFFFFFFFFFFF85A84F4F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F8001B2C78FFFFFFFFFFFFFA5
          5C06A55C06A55C06D2AD82A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06E5D7C1A55C06A55C06A55C
          06A55C06FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06BC86462FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFDFC8AAA55C
          06A55C06A55C06A55C06D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFFFFFFF85A84F
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          01B2C78FFFFFFFBC8646BC8646A55C06D2AD82BC8646A55C06A55C06A55C06F3
          EBE0FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06D2AD82
          A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFF3EBE0F7F6F12FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FD
          FFFFFFD2AD82A55C06A55C06A55C06A55C06F7F6F1BC8646A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06DF
          C8AAFFFFFFFFFFFFB2C78F4F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F800185A84FFFFFFFFFFFFFFFFFFFFFFFFFE9E2CFE5D7
          C1E5D7C1D2AD82F3EBE0FFFFFFFFFFFFFFFFFFFFFFFFF3EBE0D2AD82D2AD82D2
          AD82D2AD82E5D7C1D2AD82D2AD82D2AD82DFC8AADFC8AABC8646BC8646D2AD82
          FFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FDBCE8FDFFFFFFD2AD82A55C06A55C06A55C06A55C06FFFFFFE5D7C1
          BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06D2AD82FFFFFFFFFFFFE5D7C14F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F8001B2C78FFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06E9E2
          CFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06D2AD82A55C06A5
          5C06A55C06DFC8AA7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FDF7F6F1FFFFFFBC8646A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFD2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFFFFFFF7F6
          F185A84F4F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          8001DFC8AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06
          A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06A55C06A55C
          06D2AD82A55C06A55C06A55C067CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFFA55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFD2AD82A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          BC8646F7F6F1FFFFFFFFFFFFB2C78F4F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F8001F7F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFA55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFD2AD82
          A55C06A55C06BC8646DFC8AAD2AD82E5D7C1DAF2FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFF
          DFC8AAA55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFF3EBE0BC86
          46A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFE9E2CF85A84F4F8001
          4F80014F80014F80014F80014F80014F80014F800185A84FFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE9E2CFE5D7C1E5D7C1E5D7C1F3EBE0E5D7C1E5D7C1DF
          C8AADFC8AAF3EBE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7C
          D2FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFF
          FFFFFFFFFFB2C78F4F80014F80014F80014F80014F80014F80014F80014F8001
          E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7
          C1A55C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FDDAF2FDFFFFFFE5D7C1A55C06A55C06A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06BC8646E9E2CFFFFFFFFFFFFFF3EBE085A84F4F80014F80014F80014F
          80014F80014F800185A84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE5D7C1A55C06A55C06A55C06D2AD82FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFF7F6F1BC8646A55C06A55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8AABC
          8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06D2AD82F7F6F1FFFFFFFFFFFFE5D7
          C185A84F4F80014F80014F80014F80014F8001FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF3EBE0A55C06A55C06A55C06DFC8AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFFFFFFFBC8646A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFDFC8AABC8646A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06BC8646
          DFC8AAFFFFFFFFFFFFFFFFFFE5D7C185A84F4F80014F80014F8001E5D7C1FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1D2AD82D2AD82E5D7C1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDDAF2FDFFFFFFFFFFFFBC
          8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8AABC8646A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06BC8646E5D7C1FFFFFFFFFFFFFFFFFFE5D7C185A84F
          4F8001B2C78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCE8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDF7F6F1FFFF
          FFF7F6F1D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8AA
          BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06BC8646E5D7C1FF
          FFFFFFFFFFFFFFFFE9E2CFE5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCE8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDBCE8FD
          FFFFFFFFFFFFF7F6F1BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06BC8646E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD7CD2FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDBC
          E8FDFFFFFFFFFFFFFFFFFFDFC8AAA55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06BC8646DFC8AAF3EBE0F7F6
          F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCE8FD7CD2FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDBCE8
          FDF7F6F1FFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EB
          E0D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06BC8646BC8646DFC8AAF3EBE0FFFFFFFFFFFFFFFFFFFFFFFFF7F6
          F1BCE8FD7CD2FD7CD2FD7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FD7CD2FDBCE8FDDAF2FD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8AABC8646A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFD2AD82BC8646A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82
          E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6
          F1BCE8FDDAF2FDDAF2FDBCE8FDBCE8FDDAF2FDFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7F6F1DFC8AABC8646A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06BC8646D2AD82D2AD82E5D7C1E9E2CFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF3EBE0E5D7C1D2AD82D2AD82BC8646A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7F6F1D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06BC8646BC8646BC8646BC8646BC8646BC8646
          BC8646BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8
          AABC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF7F6F1D2AD82BC8646A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EBE0D2AD82BC8646
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF7F6F1DFC8AABC8646A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06}
        mmHeight = 9790
        mmLeft = 1058
        mmTop = 1852
        mmWidth = 9525
        BandType = 4
      end
      object rpGPSLblMes1: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = '06/2004'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 147902
        mmTop = 30427
        mmWidth = 23813
        BandType = 4
      end
      object rpGPSDBText6: TppDBText
        UserName = 'DBText5'
        DataField = 'CGCFORNECEDOR'
        DataPipeline = ppDARM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 135202
        mmTop = 12965
        mmWidth = 36513
        BandType = 4
      end
      object rpGPSLblTerceiros1: TppLabel
        UserName = 'rpGPSLblTerceiros1'
        AutoSize = False
        Caption = '*******'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 130175
        mmTop = 65088
        mmWidth = 41540
        BandType = 4
      end
      object rpGPSLblCodPag1: TppLabel
        UserName = 'Label31'
        AutoSize = False
        Caption = '101-5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 158750
        mmTop = 3969
        mmWidth = 12965
        BandType = 4
      end
      object rpGPSLabel16: TppLabel
        UserName = 'Label17'
        Caption = '10. NOME/RAZÃO SOCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 1058
        mmTop = 18256
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'VALOR'
        DataPipeline = ppDARM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 130175
        mmTop = 47625
        mmWidth = 41540
        BandType = 4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'VALORTOTAL'
        DataPipeline = ppDARM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 130175
        mmTop = 74348
        mmWidth = 41540
        BandType = 4
      end
      object ppDBText56: TppDBText
        UserName = 'DBText56'
        BlankWhenZero = True
        DataField = 'VALORJUROS'
        DataPipeline = ppDARM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 130175
        mmTop = 57150
        mmWidth = 41540
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label27'
        Caption = 'DARM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 76465
        mmTop = 3969
        mmWidth = 6085
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label28'
        Caption = 'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 76729
        mmTop = 7144
        mmWidth = 3704
        BandType = 4
      end
      object ppShape3: TppShape
        UserName = 'Shape14'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 87048
        mmTop = 8731
        mmWidth = 43127
        BandType = 4
      end
      object ppShape5: TppShape
        UserName = 'Shape16'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 87048
        mmTop = 17463
        mmWidth = 47890
        BandType = 4
      end
      object ppShape6: TppShape
        UserName = 'Shape17'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 134673
        mmTop = 17463
        mmWidth = 38365
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label29'
        Caption = '03. DATA DE VENCIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 135467
        mmTop = 18256
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText8'
        DataField = 'DATAVENCTO'
        DataPipeline = ppDARM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 138642
        mmTop = 21696
        mmWidth = 33073
        BandType = 4
      end
      object ppShape7: TppShape
        UserName = 'Shape18'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 87048
        mmTop = 26194
        mmWidth = 47890
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label30'
        Caption = '04. COMPETÊNCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 135467
        mmTop = 26988
        mmWidth = 15875
        BandType = 4
      end
      object ppShape9: TppShape
        UserName = 'Shape20'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 87048
        mmTop = 34925
        mmWidth = 43127
        BandType = 4
      end
      object ppShape10: TppShape
        UserName = 'Shape101'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 129911
        mmTop = 34925
        mmWidth = 43127
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label301'
        Caption = '05. GUIA (PARA USO DA REPARTIÇÃO)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 131234
        mmTop = 35719
        mmWidth = 33338
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label49'
        AutoSize = False
        Caption = '*******'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 133615
        mmTop = 39158
        mmWidth = 38100
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 265
        mmTop = 26194
        mmWidth = 172509
        BandType = 4
      end
      object ppShape12: TppShape
        UserName = 'Shape202'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 87048
        mmTop = 52388
        mmWidth = 29000
        BandType = 4
      end
      object ppShape14: TppShape
        UserName = 'Shape22'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 87048
        mmTop = 61119
        mmWidth = 29000
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = '12. AUTENTICAÇÃO MECÂNICA (PARA USO DO BANCO)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 87842
        mmTop = 79640
        mmWidth = 47625
        BandType = 4
      end
      object ppShape17: TppShape
        UserName = 'Shape3'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 129646
        mmTop = 118534
        mmWidth = 43127
        BandType = 4
      end
      object ppShape18: TppShape
        UserName = 'Shape5'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 86784
        mmTop = 109802
        mmWidth = 56886
        BandType = 4
      end
      object ppShape19: TppShape
        UserName = 'Shape6'
        mmHeight = 78846
        mmLeft = 0
        mmTop = 109802
        mmWidth = 265
        BandType = 4
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 127265
        mmWidth = 172509
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'DOCUMENTO DE ARRECADAÇÃO DE RECEITAS MUNICIPAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2646
        mmLeft = 12171
        mmTop = 124354
        mmWidth = 62177
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'PREFEITURA DA CIDADE DO RIO DE JANEIRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 12171
        mmTop = 112448
        mmWidth = 55033
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'SECRETARIA MUNICIPAL DE FAZENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 12171
        mmTop = 120650
        mmWidth = 39423
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = '11. INFORMAÇÕES COMPLEMENTARES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 1058
        mmTop = 136790
        mmWidth = 40481
        BandType = 4
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = '01. RECEITA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 144463
        mmTop = 110596
        mmWidth = 10583
        BandType = 4
      end
      object ppLabel13: TppLabel
        UserName = 'Label5'
        Caption = '02. INSCRIÇÃO DO CONTRIBUINTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 130704
        mmTop = 119327
        mmWidth = 29898
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label6'
        Caption = '06. VALOR DO TRIBUTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 87313
        mmTop = 153988
        mmWidth = 20373
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = '08. VALOR DA MULTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 115888
        mmTop = 171715
        mmWidth = 18521
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label201'
        Caption = '07. VALOR DA MORA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 116152
        mmTop = 162984
        mmWidth = 17727
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label18'
        Caption = '09. VALOR TOTAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 87313
        mmTop = 180446
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'EMPRESAFORNECEDOR'
        DataPipeline = ppDARM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 131763
        mmWidth = 84931
        BandType = 4
      end
      object ppImage1: TppImage
        UserName = 'Image2'
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          07544269746D617036420000424D364200000000000036000000280000005800
          0000400000000100180000000000004200000000000000000000000000000000
          0000A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06BC8646BC8646BC8646BC8646BC8646
          BC8646BC8646BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06BC8646D2AD82D2AD82E5D7C1F3EBE0FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EBE0E9E2CF
          DFC8AADFC8AABC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06D2AD82E5D7C1F7F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFE9E2CFE5D7C1E5D7C1E5D7C1E5D7C1E5D7C1F7F6F1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F1E5D7C1BC8646BC8646
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06BC8646DFC8AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E2CFB2C78FB2C78F
          85A84F4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F800185A84F85A84FB2C78FB2C78FE5D7C1F7F6F1FFFFFFFFFFFFFF
          FFFFFFFFFFF7F6F1E9E2CFDFC8AABC8646A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06BC8646E9E2CFFFFFFFFFFFFFFFFFFFF7F6F1B2C78F85A84F4F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          0185A84FB2C78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6F1E9E2CFD2AD82BC
          8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFE5D7C185A84F4F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          B2C78FE5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06BC8646F7F6F1FFFFFFFFFFFFE5D7C185A84F4F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          8001B2C78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFDAF2FDDAF2FDFFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06D2AD82F7F6F1FFFFFFF7F6F185A84F4F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F8001B2C78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8646BC8646BC8646BC
          8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCE8FD2FB8FD7CD2FDBCE8FDFFFFFF
          FFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFFFFFFE9E2
          CF4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F8001E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2F
          B8FD2FB8FD7CD2FDBCE8FDFFFFFFFFFFFFFFFFFFDFC8AABC8646A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06BC8646FFFFFF
          FFFFFFB2C78F4F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F800185A84FF7F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDDAF2FDFFFFFFFFFFFFF7
          F6F1D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06F7F6F1FFFFFFE5D7C14F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F800185A84FF7F6F1F3EBE0D2AD82D2AD82BC
          8646FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06D2AD82FFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD7CD2FDDAF2FDFFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06E5D7C1FFFFFFF3EBE04F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F800185A84FF7F6F1FFFFFFBC86
          46A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A5
          5C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFFFFFFFFD2AD82A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06BC8646FFFFFFFFFFFF85A84F4F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F8001F3EBE0
          FFFFFFFFFFFFBC8646BC8646BC8646DFC8AAE5D7C1E5D7C1DFC8AAD2AD82E9E2
          CFE5D7C1E5D7C1D2AD82DFC8AAF3EBE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C
          D2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDDAF2FD
          FFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFE5D7C14F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          8001E9E2CFE5D7C1D2AD82E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06
          A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06A55C06BC86
          46E9E2CFFFFFFFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFFF7F6F1BC8646A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFF
          FFFF85A84F4F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F8001B2C78FA55C06A55C06A55C06F3EBE0FFFFFFFFFFFFFFFFFFFF
          FFFFA55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFD2AD82
          A55C06A55C06A55C06D2AD82FFFFFFFFFFFFBCE8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDF7F6F1FFFFFFFFFFFFD2
          AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06BC8646FFFFFFF7F6F14F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F800185A84FDFC8AAA55C06A55C06A55C06FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFA55C06BC8646BC8646BC8646E9E2CFFFFFFFFFFFFFFF
          FFFFFFFFFFE5D7C1A55C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFBCE8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FDBCE8FDFFFFFFFFFFFFD2AD82A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06D2AD82FFFFFFDFC8AA4F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F800185A84FF7F6F1BC8646BC8646D2AD82
          DFC8AAE9E2CFDFC8AAD2AD82D2AD82F3EBE0FFFFFFFFFFFFFFFFFFFFFFFFE9E2
          CFBC8646D2AD82D2AD82D2AD82F3EBE0FFFFFFE9E2CFE5D7C1E9E2CFFFFFFFFF
          FFFFFFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFFFFFFFDFC8AAA55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFB2C78F4F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F8001F7F6F1FFFFFFBC
          8646BC8646A55C06D2AD82A55C06A55C06A55C06A55C06E9E2CFFFFFFFFFFFFF
          FFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFF
          FFFFFFFFD2AD82A55C06BC8646BC8646FFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFF
          DFC8AAA55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFB2
          C78F4F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001E9E2
          CFFFFFFFFFFFFFA55C06A55C06A55C06D2AD82A55C06A55C06A55C06A55C06FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06E5D7C1
          FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06A55C06A55C06F7F6F1FFFFFFBCE8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD7CD2FDFFFFFFFFFFFFDFC8AAA55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06DFC8AAFFFFFF85A84F4F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F8001E9E2CFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06D2AD82A55C06A55C
          06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A5
          5C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFDFC8AAA55C06A55C06A55C06
          E5D7C1FFFFFFFFFFFFBCE8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFFD2AD82A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06DFC8AAFFFFFFB2C78F4F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          80014F800185A84FE9E2CFFFFFFFFFFFFFFFFFFFDFC8AABC8646BC8646BC8646
          E5D7C1D2AD82D2AD82E5D7C1D2AD82F7F6F1E5D7C1E5D7C1E5D7C1E5D7C1F3EB
          E0E5D7C1E5D7C1E5D7C1E5D7C1F7F6F1FFFFFFFFFFFFFFFFFFFFFFFFE9E2CFBC
          8646BC8646A55C06DFC8AAFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFF
          FFD2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFB2C78F4F80014F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F80014F8001B2C78FF7F6F1FFFFFFF3EBE0E5D7C1D2AD82F3EBE0FF
          FFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06D2AD82A55C06A55C06
          A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8646A55C06A55C
          06A55C06E5D7C1BC8646BC8646D2AD82E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFDA
          F2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FDBCE8FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFB2
          C78F4F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F800185A84FF3EBE0FFFFFFFFFFFFFFFFFFBC8646A55C
          06A55C06FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06D2
          AD82A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          BC8646A55C06A55C06A55C06E5D7C1A55C06A55C06A55C06D2AD82FFFFFFFFFF
          FFFFFFFFBC8646D2AD82FFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FDDAF2FDFFFFFFF7F6F1A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06D2AD82FFFFFFE5D7C14F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F8001B2C78FE9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFBC8646A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C
          06A55C06A55C06D2AD82A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFBC8646A55C06A55C06A55C06DFC8AAA55C06A55C06A55C06
          D2AD82FFFFFFFFFFFFFFFFFFBC8646A55C06FFFFFFFFFFFF2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDF7F6F1FFFFFFDF
          C8AAA55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06BC8646FFFFFFFFFFFF4F80014F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F8001FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFF
          DFC8AAA55C06A55C06A55C06BC8646D2AD82A55C06A55C06A55C06A55C06E5D7
          C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBC8646A55C06A55C06A55C06D2AD82A5
          5C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFBC8646A55C06E9E2CFFFFFFF
          FFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD7CD2FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06F7F6F1FFFFFF85A84F4F8001
          4F80014F80014F80014F80014F80014F80014F80014F80014F8001FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2AD82D2AD82E9E2CFFFFFFFFF
          FFFFF3EBE0E9E2CFE9E2CFD2AD82E5D7C1E5D7C1E9E2CFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFE5D7C1E5D7C1E5D7C1E5D7C1F3EBE0DFC8AAD2AD82D2AD
          82D2AD82E9E2CFE5D7C1E5D7C1E5D7C1DFC8AAFFFFFFFFFFFFFFFFFFD2AD82BC
          8646E5D7C1FFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFF3EBE0A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFF
          FFFFDFC8AA4F80014F80014F80014F80014F80014F80014F80014F80014F8001
          4F8001E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFE9E2CFBC8646BC8646FFFFFFFFFF
          FFFFFFFFBC8646A55C06A55C06BC8646D2AD82A55C06A55C06A55C06BC8646FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06D2AD82
          BC8646A55C06A55C06A55C06D2AD82FFFFFFFFFFFFFFFFFFFFFFFFBC8646A55C
          06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDFFFFFFFFFFFFD2AD82
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06BC8646FFFFFFFFFFFF4F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F8001B2C78FFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06
          BC8646FFFFFFFFFFFFFFFFFFBC8646A55C06A55C06BC8646D2AD82A55C06A55C
          06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A5
          5C06A55C06D2AD82BC8646A55C06A55C06A55C06D2AD82FFFFFFFFFFFFFFFFFF
          FFFFFFBC8646A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBC
          E8FDFFFFFFF3EBE0A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06F3EBE0FFFFFFB2C78F4F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F8001F7F6F1FFFFFFFFFFFFFF
          FFFFE5D7C1A55C06BC8646FFFFFFFFFFFFFFFFFFBC8646A55C06A55C06BC8646
          D2AD82A55C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFA55C06A55C06A55C06A55C06D2AD82BC8646A55C06A55C06A55C06D2AD82FF
          FFFFFFFFFFFFFFFFFFFFFFBC8646A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFFFFFF
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001B2C7
          8FFFFFFFFFFFFFFFFFFFF3EBE0BC8646D2AD82FFFFFFFFFFFFFFFFFFBC8646A5
          5C06A55C06BC8646D2AD82A55C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06D2AD82BC8646A55C06A55C
          06A55C06D2AD82FFFFFFFFFFFFFFFFFFFFFFFFBC8646A55C06A55C06E5D7C1FF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFDFC8AAA55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06F3EBE0FFFFFFDFC8AA4F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F8001E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD2AD82DFC8
          AAE9E2CFFFFFFFFFFFFFFFFFFFFFFFFFF3EBE0E5D7C1E5D7C1E5D7C1F7F6F1F3
          EBE0E5D7C1E5D7C1E5D7C1F7F6F1FFFFFFE5D7C1E5D7C1E5D7C1E5D7C1F3EBE0
          E5D7C1D2AD82D2AD82D2AD82E5D7C1E5D7C1E5D7C1E5D7C1E9E2CFFFFFFFFFFF
          FFFFFFFFD2AD82BC8646E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFF
          F7F6F1A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06BC8646FFFFFFFFFFFF85A84F4F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F8001F7F6F1FFFFFFFFFFFFFFFFFF
          FFFFFFA55C06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06A55C
          06A55C06BC8646D2AD82A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06DFC8AAA55C06A55C06A55C06
          BC8646FFFFFFFFFFFFFFFFFFBC8646A55C06E9E2CFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFF7F6F14F80
          014F80014F80014F80014F80014F80014F80014F80014F80014F800185A84FF7
          F6F1FFFFFFFFFFFFFFFFFFBC8646A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFF
          E5D7C1A55C06A55C06A55C06A55C06E5D7C1A55C06A55C06A55C06A55C06E5D7
          C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06E5D7C1A5
          5C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFA55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFDAF2FDBCE8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFD2AD82A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          F7F6F1FFFFFFE9E2CF4F80014F80014F80014F80014F80014F80014F80014F80
          014F80014F800185A84FF7F6F1FFFFFFFFFFFFD2AD82A55C06BC8646FFFFFFFF
          FFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06E5D7C1A55C06A55C06
          A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C
          06A55C06E5D7C1A55C06A55C06A55C06D2AD82FFFFFFFFFFFFFFFFFFBC8646D2
          AD82FFFFFFDAF2FD7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFD2AD82A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06BC8646FFFFFFFFFFFFB2C78F4F80014F80014F80014F8001
          4F80014F80014F80014F80014F80014F800185A84FE9E2CFFFFFFFFFFFFFFFFF
          FFF3EBE0FFFFFFFFFFFFFFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A55C06E5
          D7C1A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          A55C06A55C06A55C06A55C06DFC8AABC8646BC8646D2AD82E5D7C1FFFFFFE9E2
          CFF3EBE0FFFFFFFFFFFF7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FD
          FFFFFFD2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFFFFFF85A84F4F
          80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F8001
          E9E2CFFFFFFFFFFFFFFFFFFFE5D7C1A55C06BC8646BC8646DFC8AAD2AD82D2AD
          82D2AD82E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFF7F6F1F7F6F1E5D7C1E5D7C1E5
          D7C1E5D7C1F7F6F1E5D7C1E5D7C1D2AD82D2AD82F3EBE0FFFFFFFFFFFFFFFFFF
          F3EBE0A55C06A55C06D2AD82DAF2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD7CD2FDFFFFFFDFC8AAA55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD
          82FFFFFFFFFFFF85A84F4F80014F80014F80014F80014F80014F80014F80014F
          80014F80014F80014F8001B2C78FFFFFFFFFFFFFE9E2CFA55C06A55C06A55C06
          DFC8AAA55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6
          F1A55C06A55C06A55C06A55C06E5D7C1A55C06A55C06A55C06A55C06FFFFFFFF
          FFFFFFFFFFFFFFFFE5D7C1A55C06A55C06E5D7C12FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFDFC8AAA55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06DFC8AAFFFFFFFFFFFF85A84F4F80014F80014F80014F80
          014F80014F80014F80014F80014F80014F80014F8001B2C78FFFFFFFFFFFFFA5
          5C06A55C06A55C06D2AD82A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06E5D7C1A55C06A55C06A55C
          06A55C06FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06BC86462FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFDFC8AAA55C
          06A55C06A55C06A55C06D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06DFC8AAFFFFFFFFFFFF85A84F
          4F80014F80014F80014F80014F80014F80014F80014F80014F80014F80014F80
          01B2C78FFFFFFFBC8646BC8646A55C06D2AD82BC8646A55C06A55C06A55C06F3
          EBE0FFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06A55C06D2AD82
          A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFF3EBE0F7F6F12FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FD
          FFFFFFD2AD82A55C06A55C06A55C06A55C06F7F6F1BC8646A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06DF
          C8AAFFFFFFFFFFFFB2C78F4F80014F80014F80014F80014F80014F80014F8001
          4F80014F80014F80014F800185A84FFFFFFFFFFFFFFFFFFFFFFFFFE9E2CFE5D7
          C1E5D7C1D2AD82F3EBE0FFFFFFFFFFFFFFFFFFFFFFFFF3EBE0D2AD82D2AD82D2
          AD82D2AD82E5D7C1D2AD82D2AD82D2AD82DFC8AADFC8AABC8646BC8646D2AD82
          FFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FDBCE8FDFFFFFFD2AD82A55C06A55C06A55C06A55C06FFFFFFE5D7C1
          BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06D2AD82FFFFFFFFFFFFE5D7C14F80014F80014F80014F
          80014F80014F80014F80014F80014F80014F80014F8001B2C78FFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06A55C06A55C06E9E2
          CFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1A55C06A55C06A55C06D2AD82A55C06A5
          5C06A55C06DFC8AA7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FDF7F6F1FFFFFFBC8646A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFD2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFFFFFFF7F6
          F185A84F4F80014F80014F80014F80014F80014F80014F80014F80014F80014F
          8001DFC8AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA55C06A55C06
          A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFD2AD82A55C06A55C06A55C
          06D2AD82A55C06A55C06A55C067CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDFFFFFFFFFFFFA55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFD2AD82A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          BC8646F7F6F1FFFFFFFFFFFFB2C78F4F80014F80014F80014F80014F80014F80
          014F80014F80014F80014F8001F7F6F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFA55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFD2AD82
          A55C06A55C06BC8646DFC8AAD2AD82E5D7C1DAF2FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFF
          DFC8AAA55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFF3EBE0BC86
          46A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06E5D7C1FFFFFFFFFFFFE9E2CF85A84F4F8001
          4F80014F80014F80014F80014F80014F80014F800185A84FFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFE9E2CFE5D7C1E5D7C1E5D7C1F3EBE0E5D7C1E5D7C1DF
          C8AADFC8AAF3EBE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7C
          D2FDFFFFFFFFFFFFBC8646A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82FFFFFFFF
          FFFFFFFFFFB2C78F4F80014F80014F80014F80014F80014F80014F80014F8001
          E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7
          C1A55C06A55C06A55C06BC8646FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FDDAF2FDFFFFFFE5D7C1A55C06A55C06A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06BC8646E9E2CFFFFFFFFFFFFFF3EBE085A84F4F80014F80014F80014F
          80014F80014F800185A84FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFE5D7C1A55C06A55C06A55C06D2AD82FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFF7F6F1BC8646A55C06A55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8AABC
          8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06D2AD82F7F6F1FFFFFFFFFFFFE5D7
          C185A84F4F80014F80014F80014F80014F8001FFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF3EBE0A55C06A55C06A55C06DFC8AAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFF2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDBCE8FDFFFFFFFFFFFFBC8646A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFDFC8AABC8646A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06BC8646
          DFC8AAFFFFFFFFFFFFFFFFFFE5D7C185A84F4F80014F80014F8001E5D7C1FFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1D2AD82D2AD82E5D7C1FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFDAF2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FDDAF2FDFFFFFFFFFFFFBC
          8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8AABC8646A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06BC8646E5D7C1FFFFFFFFFFFFFFFFFFE5D7C185A84F
          4F8001B2C78FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCE8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDF7F6F1FFFF
          FFF7F6F1D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8AA
          BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06BC8646E5D7C1FF
          FFFFFFFFFFFFFFFFE9E2CFE5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCE8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDBCE8FD
          FFFFFFFFFFFFF7F6F1BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06BC8646E5D7C1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDAF2FD7CD2FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8
          FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDBC
          E8FDFFFFFFFFFFFFFFFFFFDFC8AAA55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E2CFBC8646A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06BC8646DFC8AAF3EBE0F7F6
          F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBCE8FD7CD2FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD
          2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FDBCE8
          FDF7F6F1FFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EB
          E0D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06BC8646BC8646DFC8AAF3EBE0FFFFFFFFFFFFFFFFFFFFFFFFF7F6
          F1BCE8FD7CD2FD7CD2FD7CD2FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2F
          B8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD2FB8FD7CD2FD7CD2FDBCE8FDDAF2FD
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8AABC8646A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFD2AD82BC8646A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06D2AD82
          E9E2CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F6
          F1BCE8FDDAF2FDDAF2FDBCE8FDBCE8FDDAF2FDFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7F6F1DFC8AABC8646A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06BC8646D2AD82D2AD82E5D7C1E9E2CFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFF3EBE0E5D7C1D2AD82D2AD82BC8646A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFF7F6F1D2AD82A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06BC8646BC8646BC8646BC8646BC8646BC8646
          BC8646BC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE5D7C1BC8646A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC8
          AABC8646A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFF7F6F1D2AD82BC8646A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3EBE0D2AD82BC8646
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06FFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFF7F6F1DFC8AABC8646A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06
          A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C
          06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A55C06A5
          5C06}
        mmHeight = 9790
        mmLeft = 794
        mmTop = 111654
        mmWidth = 9525
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = '06/2004'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 147638
        mmTop = 140229
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CGCFORNECEDOR'
        DataPipeline = ppDARM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 134938
        mmTop = 122767
        mmWidth = 36513
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = '*******'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 129911
        mmTop = 174890
        mmWidth = 41540
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = '101-5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 158486
        mmTop = 113771
        mmWidth = 12965
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label25'
        Caption = '10. NOME/RAZÃO SOCIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 794
        mmTop = 128059
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VALOR'
        DataPipeline = ppDARM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 129911
        mmTop = 157427
        mmWidth = 41540
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText6'
        DataField = 'VALORTOTAL'
        DataPipeline = ppDARM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 129911
        mmTop = 183886
        mmWidth = 41540
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText7'
        BlankWhenZero = True
        DataField = 'VALORJUROS'
        DataPipeline = ppDARM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 129911
        mmTop = 166688
        mmWidth = 41540
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label26'
        Caption = 'DARM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 76200
        mmTop = 113771
        mmWidth = 6085
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label32'
        Caption = 'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = []
        Transparent = True
        mmHeight = 2381
        mmLeft = 76465
        mmTop = 116946
        mmWidth = 3704
        BandType = 4
      end
      object ppShape21: TppShape
        UserName = 'Shape7'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 86784
        mmTop = 118534
        mmWidth = 43127
        BandType = 4
      end
      object ppShape22: TppShape
        UserName = 'Shape8'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 86784
        mmTop = 127265
        mmWidth = 47890
        BandType = 4
      end
      object ppShape23: TppShape
        UserName = 'Shape9'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 134409
        mmTop = 127265
        mmWidth = 38365
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label33'
        Caption = '03. DATA DE VENCIMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 135202
        mmTop = 128059
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText9'
        DataField = 'DATAVENCTO'
        DataPipeline = ppDARM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 138377
        mmTop = 131498
        mmWidth = 33073
        BandType = 4
      end
      object ppShape24: TppShape
        UserName = 'Shape24'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 86784
        mmTop = 135996
        mmWidth = 47890
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label302'
        Caption = '04. COMPETÊNCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 135202
        mmTop = 136790
        mmWidth = 15875
        BandType = 4
      end
      object ppShape26: TppShape
        UserName = 'Shape204'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 86784
        mmTop = 144727
        mmWidth = 43127
        BandType = 4
      end
      object ppShape27: TppShape
        UserName = 'Shape27'
        Brush.Style = bsClear
        mmHeight = 8996
        mmLeft = 129646
        mmTop = 144727
        mmWidth = 43127
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label34'
        Caption = '05. GUIA (PARA USO DA REPARTIÇÃO)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 130175
        mmTop = 145521
        mmWidth = 33338
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label35'
        AutoSize = False
        Caption = '*******'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 133350
        mmTop = 148961
        mmWidth = 38100
        BandType = 4
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 135996
        mmWidth = 172509
        BandType = 4
      end
      object ppShape29: TppShape
        UserName = 'Shape29'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 86784
        mmTop = 162190
        mmWidth = 29104
        BandType = 4
      end
      object ppShape31: TppShape
        UserName = 'Shape31'
        Brush.Color = 14145495
        mmHeight = 8996
        mmLeft = 86784
        mmTop = 170921
        mmWidth = 29104
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label36'
        Caption = '12. AUTENTICAÇÃO MECÂNICA (PARA USO DO BANCO)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 5
        Font.Style = []
        Transparent = True
        mmHeight = 2117
        mmLeft = 87577
        mmTop = 189442
        mmWidth = 47625
        BandType = 4
      end
      object ppShape34: TppShape
        UserName = 'Shape34'
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 87313
        BandType = 4
      end
      object ppShape35: TppShape
        UserName = 'Shape35'
        mmHeight = 265
        mmLeft = 265
        mmTop = 109802
        mmWidth = 87048
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label37'
        Caption = 
          '................................................................' +
          '................................................................' +
          '................................................................' +
          '...............................................................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 6
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2646
        mmLeft = 5027
        mmTop = 102394
        mmWidth = 151077
        BandType = 4
      end
    end
    object rpGPSSmryBnd: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 1000
      mmPrintPosition = 0
    end
    object rpGPSGrp: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppDARM
      NewPage = True
      UserName = 'rpGPSGrp'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpGPSGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpGPSGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object cdsDARM: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 224
    Top = 64
  end
  object cmSqlDARM: TCMSqlParams
    SQL.Strings = (
      
        'SELECT  PJ.IDPESSOA AS IDEMPRESA, PJ.RAZAOSOCIAL AS EMPRESA, ES.' +
        'CODESTADO, D.DATAVENCTO, '
      
        '        PJ.NUMDOCUMENTO AS CGC, RTRIM(E.LOGRADOURO) ||'#39', '#39'|| E.N' +
        'UMERO ||'#39#39'|| DECODE(E.COMPLEMENTO,NULL,'#39' - '#39' ||'
      
        '        RTRIM(E.COMPLEMENTO)) AS RUA, E.IDCIDADES, RTRIM(E.BAIRR' +
        'O) AS BAIRRO, RTRIM(C.NOME) AS CIDADE, D.CODGERADORINSS,'
      
        '        RTRIM(SUBSTR(E.CEP,1,5)) ||'#39#39'-'#39#39'|| RTRIM(SUBSTR(E.CEP,6,' +
        '3)) AS CEP, L.VALOR, L.DATALANCTO, D.CODDOCUMENTO, D.NODOCUMENTO' +
        ', 0 AS VALORJUROS, 0 AS VALORMULTA, 0 AS VALORTOTAL,'
      
        '        PJF.RAZAOSOCIAL AS EMPRESAFORNECEDOR, ESF.CODESTADO CODE' +
        'STADOFORNECEDOR, PJF.NUMDOCUMENTO AS CGCFORNECEDOR, D.DATAPROGRA' +
        'MADA, L.DATALANCTO, '
      
        '        RTRIM(EF.LOGRADOURO) ||'#39', '#39'|| EF.NUMERO ||'#39#39'|| DECODE(EF' +
        '.COMPLEMENTO,'#39' '#39','#39' - '#39' ||'#39#39'||'
      
        '        RTRIM(EF.COMPLEMENTO)) AS RUAFORNECEDOR, EF.IDCIDADES ID' +
        'CIDADESFORNECEDOR, RTRIM(EF.BAIRRO) AS BAIRROFORNECEDOR, DD.CODD' +
        'OCUMENTO AS DOCGERADOR, DD.NODOCUMENTO AS NUMERODOCUMETO,'
      
        '        RTRIM(CF.NOME) AS CIDADEFORNECEDOR, RTRIM(SUBSTR(EF.CEP,' +
        '1,5)) ||'#39'-'#39'|| RTRIM(SUBSTR(EF.CEP,6,3)) AS CEPFORNECEDOR'
      
        '   FROM DOCUMENTO D, DOCUMENTO DD, LANCTODOCUM L, PESSOA PJ, END' +
        'PESS E, CIDADES C, ESTADO ES,'
      
        '        (SELECT DISTINCT CODDOCINSS FROM LANCTODOCUM WHERE CODDO' +
        'CINSS IS NOT NULL) I,'
      '        PESSOA PJF, ENDPESS EF, CIDADES CF, ESTADO ESF'
      '  WHERE (PJ.IDPESSOA = E.IDPESSOA)'
      '    AND (PJ.IDENDCOMERCIAL= E.IDENDERECO) '
      '    AND (E.IDCIDADES = C.IDCIDADES(+)) '
      '    AND (C.IDESTADO = ES.IDESTADO(+)) '
      '    AND (PJ.IDPESSOA = 1) '
      '    AND (D.IDPESSOA = 1) '
      '    AND (D.CODGERADORINSS = DD.CODDOCUMENTO) '
      '    AND (DD.RECPAG = '#39'P'#39') '
      '    AND (DD.IDFORCLI = PJF.IDPESSOA) '
      '    AND (PJF.IDPESSOA = EF.IDPESSOA(+)) '
      '    AND (PJF.IDENDCOMERCIAL= EF.IDENDERECO(+)) '
      '    AND (EF.IDCIDADES = CF.IDCIDADES(+)) '
      '    AND (CF.IDESTADO = ESF.IDESTADO(+)) '
      
        '    AND (D.DATAPROGRAMADA >= TO_DATE('#39'30/07/2004'#39','#39'DD/MM/YYYY'#39'))' +
        ' '
      
        '    AND (D.DATAPROGRAMADA <= TO_DATE('#39'30/07/2004'#39','#39'DD/MM/YYYY'#39'))' +
        ' '
      '    AND (D.CODDOCUMENTO = L.CODDOCUMENTO) '
      '    AND (D.OPERACAO = L.OPERACAO) '
      '    AND (I.CODDOCINSS  = D.CODDOCUMENTO) '
      
        '    AND NOT EXISTS (SELECT IM.CODDOCINSS FROM DOCINSS IM WHERE (' +
        'IM.CODDOCINSS = D.CODDOCUMENTO) AND (IM.FLGIMPRESSO = '#39'S'#39'))'
      '    ORDER BY D.DATAPROGRAMADA ')
    ClientDataSet = cdsDARM
    Left = 224
    Top = 8
  end
  object sqlProcura: TCMSqlParams
    ClientDataSet = cdsProcura
    Left = 296
    Top = 32
  end
  object cdsProcura: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 88
  end
end
