inherited RptValoresRecPag: TRptValoresRecPag
  Left = 342
  Top = 122
  Width = 412
  Height = 404
  Caption = 'RptValoresRecPag'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Parâmetros do Relatórios de Valores Recebidos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Cliente / Fornecedor'
        Controle = tcProcuraFC
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
        Caption = 'Conta/Caixa x Forma de Recebimento'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODPORTFORMA'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '50'
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
        Caption = 'Tipo de Documento'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODTIPDOC'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '35'
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
        Caption = 'Data do Recebimento Inicial'
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
        Caption = 'Data do Recebimento Final'
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
        Caption = 'Imprime relatório por Plano x Patrocinadora'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
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
        Caption = 'Patrocinadora'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          ' SELECT'
          '      PTR.IDPESSOA,'
          '      PES.NOME'
          '   FROM'
          '      PESSOA PES,'
          '      PATRO PTR'
          '   WHERE'
          '      PTR.IDPESSOA = PES.IDPESSOA'
          '   ORDER BY'
          '      2  ')
        LookupSettings.Chave = 'IDPESSOA'
        LookupSettings.Display = 'Nome'
        LookupSettings.Descricao = 'Nome'
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
        Caption = 'Inclui no relatório os valores pagos'
        Controle = tcCheckBox
        TipodeDado = tdBoolean
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = False
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
        Caption = 'Imprime Dados Complementares'
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
    Formheight = 350
    FormWidth = 570
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptValoresRecPag
    LabelEmpresa = ppLabel13
    LabelSistema = ppLabel38
  end
  object RptValoresRecPag: TppReport
    AutoStop = False
    DataPipeline = PpValoresRecPag
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
    Left = 250
    Top = 46
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpValoresRecPag'
    object ppHeaderBand10: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object LblTitRel: TppLabel
        UserName = 'LblTitRel'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 116946
        mmTop = 8731
        mmWidth = 37042
        BandType = 0
      end
      object ppLine35: TppLine
        UserName = 'ppLine35'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16404
        mmWidth = 272000
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'ppLabel13'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 121444
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand29: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object LblndicaEstorno: TppLabel
        UserName = 'LblndicaEstorno'
        Caption = 'Cancelado\Estornado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Visible = False
        mmHeight = 3440
        mmLeft = 96309
        mmTop = 265
        mmWidth = 28575
        BandType = 4
      end
      object RptValoresRecPagDBText1: TppDBText
        UserName = 'RptValoresRecPagDBText1'
        DataField = 'NOMEPESSOA'
        DataPipeline = PpValoresRecPag
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 3175
        mmLeft = 0
        mmTop = 265
        mmWidth = 34396
        BandType = 4
      end
      object RptValoresRecPagDBText5: TppDBText
        UserName = 'RptValoresRecPagDBText5'
        DataField = 'NUMCHQBORDERO'
        DataPipeline = PpValoresRecPag
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 3175
        mmLeft = 59531
        mmTop = 265
        mmWidth = 13494
        BandType = 4
      end
      object RptValoresRecPagDBText8: TppDBText
        UserName = 'RptValoresRecPagDBText8'
        DataField = 'DESCRICAO'
        DataPipeline = PpValoresRecPag
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 3175
        mmLeft = 73819
        mmTop = 265
        mmWidth = 20638
        BandType = 4
      end
      object RptValoresRecPagDBText3: TppDBText
        UserName = 'RptValoresRecPagDBText3'
        DataField = 'VALOR'
        DataPipeline = PpValoresRecPag
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 3175
        mmLeft = 129117
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object RptValoresRecPagDBText4: TppDBText
        UserName = 'RptValoresRecPagDBText4'
        DataField = 'VALOROUTRAMOEDA'
        DataPipeline = PpValoresRecPag
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 3175
        mmLeft = 150813
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object RptValoresRecPagDBText6: TppDBText
        UserName = 'RptValoresRecPagDBText6'
        DataField = 'DESCPORTFORMA'
        DataPipeline = PpValoresRecPag
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 265
        mmWidth = 39423
        BandType = 4
      end
      object RptValoresRecPagDBText7: TppDBText
        UserName = 'RptValoresRecPagDBText7'
        DataField = 'HISTORICO'
        DataPipeline = PpValoresRecPag
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 3175
        mmLeft = 168540
        mmTop = 4763
        mmWidth = 96573
        BandType = 4
      end
      object RptValoresRecPagDBText9: TppDBText
        UserName = 'RptValoresRecPagDBText9'
        DataField = 'CODDOCU'
        DataPipeline = PpValoresRecPag
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 3175
        mmLeft = 35719
        mmTop = 265
        mmWidth = 23283
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOSSONUMERO'
        DataPipeline = PpValoresRecPag
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 3175
        mmLeft = 247386
        mmTop = 265
        mmWidth = 24077
        BandType = 4
      end
      object RptValoresRecPagDBText11: TppDBText
        UserName = 'RptValoresRecPagDBText11'
        AutoSize = True
        DataField = 'VLRBRUTO'
        DataPipeline = PpValoresRecPag
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 2910
        mmLeft = 95250
        mmTop = 529
        mmWidth = 12700
        BandType = 4
      end
      object RptValoresRecPagDBText10: TppDBText
        UserName = 'RptValoresRecPagDBText10'
        AutoSize = True
        DataField = 'VALORALT'
        DataPipeline = PpValoresRecPag
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 2910
        mmLeft = 112977
        mmTop = 529
        mmWidth = 12435
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine36: TppLine
        UserName = 'ppLine36'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 272000
        BandType = 8
      end
      object ppLabel38: TppLabel
        UserName = 'ppLabel38'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 3175
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 245005
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptValoresRecPagSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object LblTotalRecPag: TppLabel
        UserName = 'LblTotalRecPag'
        Caption = 'Total de Recebimentos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 46831
        mmTop = 2117
        mmWidth = 26988
        BandType = 7
      end
      object ppDBCalc19: TppDBCalc
        UserName = 'DBCalc19'
        AutoSize = True
        DataField = 'VLRBRUTO'
        DataPipeline = PpValoresRecPag
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 3133
        mmLeft = 84508
        mmTop = 2117
        mmWidth = 23707
        BandType = 7
      end
      object ppDBCalc20: TppDBCalc
        UserName = 'DBCalc20'
        AutoSize = True
        DataField = 'VALORALT'
        DataPipeline = PpValoresRecPag
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 3133
        mmLeft = 102055
        mmTop = 2117
        mmWidth = 23622
        BandType = 7
      end
      object ppDBCalc21: TppDBCalc
        UserName = 'DBCalc21'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = PpValoresRecPag
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 3133
        mmLeft = 127518
        mmTop = 2117
        mmWidth = 18796
        BandType = 7
      end
      object ppDBCalc22: TppDBCalc
        UserName = 'DBCalc22'
        AutoSize = True
        DataField = 'VALOROUTRAMOEDA'
        DataPipeline = PpValoresRecPag
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpValoresRecPag'
        mmHeight = 3133
        mmLeft = 131361
        mmTop = 2117
        mmWidth = 36915
        BandType = 7
      end
    end
    object RptValoresRecPagGroup2: TppGroup
      BreakName = 'DATALANCTO'
      DataPipeline = PpValoresRecPag
      OutlineSettings.CreateNode = True
      UserName = 'RptValoresRecPagGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpValoresRecPag'
      object RptValoresRecPagGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 13494
        mmPrintPosition = 0
        object RptValoresRecPagLabel2: TppLabel
          UserName = 'RptValoresRecPagLabel2'
          Caption = 'Data de Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 1852
          mmWidth = 38100
          BandType = 3
          GroupNo = 0
        end
        object RptValoresRecPagDBText2: TppDBText
          UserName = 'RptValoresRecPagDBText2'
          AutoSize = True
          DataField = 'DATALANCTO'
          DataPipeline = PpValoresRecPag
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'PpValoresRecPag'
          mmHeight = 4498
          mmLeft = 41010
          mmTop = 1852
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object ppLabel40: TppLabel
          UserName = 'ppLabel40'
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 8996
          mmWidth = 11642
          BandType = 3
          GroupNo = 0
        end
        object RptValoresRecPagLabel3: TppLabel
          UserName = 'RptValoresRecPagLabel3'
          Caption = 'Numero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 59531
          mmTop = 8996
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object RptValoresRecPagLabel4: TppLabel
          UserName = 'RptValoresRecPagLabel4'
          Caption = 'Valor Liq.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 129382
          mmTop = 8996
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object RptValoresRecPagLabel5: TppLabel
          UserName = 'RptValoresRecPagLabel5'
          Caption = 'Outra Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 146579
          mmTop = 8996
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object LblFormaRecPag: TppLabel
          UserName = 'LblFormaRecPag'
          Caption = 'Contas/C x Forma Rec.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 168540
          mmTop = 8996
          mmWidth = 38365
          BandType = 3
          GroupNo = 0
        end
        object RptValoresRecPagLabel7: TppLabel
          UserName = 'RptValoresRecPagLabel7'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 208757
          mmTop = 8996
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
        object RptValoresRecPagLabel1: TppLabel
          UserName = 'RptValoresRecPagLabel1'
          Caption = 'Tipo Doc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 73819
          mmTop = 8996
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object RptValoresRecPagLabel6: TppLabel
          UserName = 'RptValoresRecPagLabel6'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 35719
          mmTop = 8996
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object RptValoresRecPagLabel9: TppLabel
          UserName = 'RptValoresRecPagLabel9'
          Caption = 'Alterador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 110067
          mmTop = 8996
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object RptValoresRecPagLabel10: TppLabel
          UserName = 'RptValoresRecPagLabel10'
          Caption = 'Sld. Bruto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 91017
          mmTop = 8996
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Nosso Número'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 247386
          mmTop = 8996
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
      end
      object RptValoresRecPagGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 9260
        mmPrintPosition = 0
        object RptValoresRecPagLabel8: TppLabel
          UserName = 'RptValoresRecPagLabel8'
          Caption = 'Sub Total:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 46831
          mmTop = 1058
          mmWidth = 12171
          BandType = 5
          GroupNo = 0
        end
        object RptValoresRecPagDBCalc2: TppDBCalc
          UserName = 'RptValoresRecPagDBCalc2'
          AutoSize = True
          DataField = 'VALOROUTRAMOEDA'
          DataPipeline = PpValoresRecPag
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptValoresRecPagGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpValoresRecPag'
          mmHeight = 3133
          mmLeft = 131361
          mmTop = 1058
          mmWidth = 36915
          BandType = 5
          GroupNo = 0
        end
        object RptValoresRecPagLine1: TppLine
          UserName = 'RptValoresRecPagLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 8202
          mmWidth = 272000
          BandType = 5
          GroupNo = 0
        end
        object RptValoresRecPagDBCalc5: TppDBCalc
          UserName = 'RptValoresRecPagDBCalc5'
          AutoSize = True
          DataField = 'VALORALT'
          DataPipeline = PpValoresRecPag
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptValoresRecPagGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpValoresRecPag'
          mmHeight = 3133
          mmLeft = 102055
          mmTop = 1058
          mmWidth = 23622
          BandType = 5
          GroupNo = 0
        end
        object RptValoresRecPagDBCalc6: TppDBCalc
          UserName = 'RptValoresRecPagDBCalc6'
          AutoSize = True
          DataField = 'VLRBRUTO'
          DataPipeline = PpValoresRecPag
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptValoresRecPagGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpValoresRecPag'
          mmHeight = 3133
          mmLeft = 84508
          mmTop = 1058
          mmWidth = 23707
          BandType = 5
          GroupNo = 0
        end
        object RptValoresRecPagDBCalc3: TppDBCalc
          UserName = 'RptValoresRecPagDBCalc3'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = PpValoresRecPag
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = RptValoresRecPagGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpValoresRecPag'
          mmHeight = 3133
          mmLeft = 127518
          mmTop = 1058
          mmWidth = 18796
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object PpValoresRecPag: TppBDEPipeline
    DataSource = DsValoresRecPag
    CloseDataSource = True
    UserName = 'PpValoresRecPag'
    Left = 162
    Top = 96
    object PpValoresRecPagppField1: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField2: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField3: TppField
      FieldAlias = 'NUMFATURA'
      FieldName = 'NUMFATURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField4: TppField
      FieldAlias = 'NUMLANCTO'
      FieldName = 'NUMLANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField5: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField6: TppField
      FieldAlias = 'OPERACAO'
      FieldName = 'OPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField7: TppField
      FieldAlias = 'VALOROUTRAMOEDA'
      FieldName = 'VALOROUTRAMOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField8: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField9: TppField
      FieldAlias = 'DEBCRE'
      FieldName = 'DEBCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField10: TppField
      FieldAlias = 'VLRLIQUIDO'
      FieldName = 'VLRLIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField11: TppField
      FieldAlias = 'VALORALT'
      FieldName = 'VALORALT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField12: TppField
      FieldAlias = 'VLRBRUTO'
      FieldName = 'VLRBRUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField13: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField14: TppField
      FieldAlias = 'NUMCHQBORDERO'
      FieldName = 'NUMCHQBORDERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField15: TppField
      FieldAlias = 'NOMEPESSOA'
      FieldName = 'NOMEPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField16: TppField
      FieldAlias = 'DESCPORTFORMA'
      FieldName = 'DESCPORTFORMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField17: TppField
      FieldAlias = 'NOSSONUMERO'
      FieldName = 'NOSSONUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField18: TppField
      FieldAlias = 'NOMEFANTASIA'
      FieldName = 'NOMEFANTASIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField19: TppField
      FieldAlias = 'CODDOCU'
      FieldName = 'CODDOCU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField20: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField21: TppField
      FieldAlias = 'ESTORNO'
      FieldName = 'ESTORNO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object PpValoresRecPagppField22: TppField
      FieldAlias = 'CODPORTFORMA'
      FieldName = 'CODPORTFORMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
  end
  object DsValoresRecPag: TwwDataSource
    DataSet = CdsValoresRecPag
    Left = 118
    Top = 56
  end
  object CdsValoresRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 56
  end
  object SqlValoresRecPag: TCMSqlParams
    ClientDataSet = CdsValoresRecPag
    Left = 80
    Top = 56
  end
  object CdsVlBruto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 104
  end
  object CdsHistorico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 152
  end
  object CdsVlalt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 216
  end
  object SqlVlBruto: TCMSqlParams
    SQL.Strings = (
      'select'
      '  sum(decode(l.debcre, '#39'C'#39','
      '             decode(d.recpag,   '#39'P'#39', l.valor,  l.valor*-1),'
      
        '             decode(d.recpag,   '#39'R'#39',   l.valor,  l.valor*-1))) a' +
        's valor'
      'from'
      '  lanctodocum l,'
      '  documento d'
      'where'
      '  (l.coddocumento=d.coddocumento) and'
      '  (l.datalancto <=  :datalancto) and'
      '  (rtrim(l.operacao) <> '#39'4'#39') and'
      '  ((l.numlancto <> :numlancto) or'
      '     (l.numlancto = :numlancto) and'
      '     (rtrim(l.operacao) = '#39'10'#39')) and'
      '  (d.coddocumento = :coddocumento)'
      ''
      ' ')
    ClientDataSet = CdsVlBruto
    Left = 96
    Top = 104
  end
  object SqlHistorico: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  L.HISTORICOCOMPL AS HISTLANC'
      'FROM'
      '  LANCTODOCUM L'
      'WHERE'
      '  (RTRIM(L.OPERACAO) IN ('#39'1'#39','#39'2'#39','#39'3'#39','#39'10'#39','#39'14'#39','#39'15'#39')) AND'
      '  l.coddocumento=:coddocumento'
      ' ')
    ClientDataSet = CdsHistorico
    Left = 96
    Top = 152
  end
  object SqlVlalt: TCMSqlParams
    SQL.Strings = (
      
        'SELECT SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'C'#39',L.VALOR,L.VAL' +
        'OR*-1),'
      
        '                               DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VAL' +
        'OR*-1))) AS VALALT'
      'FROM DOCUMENTO D, LANCTODOCUM L'
      'WHERE (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '  AND (L.OPERACAO = '#39'4 '#39')'
      '  AND (D.CODDOCUMENTO = :CODDOCUMENTO)'
      '  AND (L.DATALANCTO <= TO_DATE(:DATALANCTO,'#39'DD/MM/YYYY'#39'))'
      ' '
      ' ')
    ClientDataSet = CdsVlalt
    Left = 96
    Top = 216
  end
  object SqlTeste: TCMSqlParams
    ClientDataSet = CdsTeste
    Left = 108
    Top = 277
  end
  object CdsTeste: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 50
    Top = 272
  end
  object rptValoresRecPagPlano: TppReport
    AutoStop = False
    DataPipeline = ppValoresRecPagPlano
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
    Left = 314
    Top = 126
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppValoresRecPagPlano'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object ppLbTituloRel: TppLabel
        UserName = 'LblTitRel'
        Caption = 'Título do Relatório'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 116946
        mmTop = 8731
        mmWidth = 37306
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine35'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16404
        mmWidth = 272000
        BandType = 0
      end
      object ppLbEmpresa: TppLabel
        OnPrint = ppLbEmpresaPrint
        UserName = 'ppLabel13'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 121444
        mmTop = 1588
        mmWidth = 28310
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppShpCorLinha: TppShape
        OnPrint = ppShpCorLinhaPrint
        UserName = 'ShpCorLinha'
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 0
        mmWidth = 263261
        BandType = 4
      end
      object RptValoresRecPagNomePessoa: TppDBText
        UserName = 'RptValoresRecPagNomePessoa'
        DataField = 'NOMEPESSOA'
        DataPipeline = ppValoresRecPagPlano
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 3175
        mmLeft = 24871
        mmTop = 265
        mmWidth = 36777
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'RptValoresRecPagDBText5'
        DataField = 'NUMCHQBORDERO'
        DataPipeline = ppValoresRecPagPlano
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 265
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'RptValoresRecPagDBText8'
        DataField = 'DESCRICAO'
        DataPipeline = ppValoresRecPagPlano
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 3175
        mmLeft = 97631
        mmTop = 265
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'RptValoresRecPagDBText3'
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppValoresRecPagPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 3175
        mmLeft = 150019
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'RptValoresRecPagDBText4'
        DataField = 'VALOROUTRAMOEDA'
        DataPipeline = ppValoresRecPagPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 3175
        mmLeft = 168805
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'RptValoresRecPagDBText6'
        DataField = 'DESCPORTFORMA'
        DataPipeline = ppValoresRecPagPlano
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 3175
        mmLeft = 187855
        mmTop = 265
        mmWidth = 34396
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'RptValoresRecPagDBText7'
        DataField = 'HISTORICO'
        DataPipeline = ppValoresRecPagPlano
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 3175
        mmLeft = 195263
        mmTop = 2646
        mmWidth = 76200
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'RptValoresRecPagDBText9'
        DataField = 'CODDOCU'
        DataPipeline = ppValoresRecPagPlano
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 3175
        mmLeft = 62971
        mmTop = 265
        mmWidth = 18521
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'RptValoresRecPagDBText10'
        AutoSize = True
        DataField = 'VALORALT'
        DataPipeline = ppValoresRecPagPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 2910
        mmLeft = 135202
        mmTop = 265
        mmWidth = 12435
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'RptValoresRecPagDBText11'
        AutoSize = True
        DataField = 'VLRBRUTO'
        DataPipeline = ppValoresRecPagPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 2910
        mmLeft = 117740
        mmTop = 265
        mmWidth = 12700
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText1'
        DataField = 'NOSSONUMERO'
        DataPipeline = ppValoresRecPagPlano
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 3175
        mmLeft = 250296
        mmTop = 265
        mmWidth = 21696
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText2'
        DataField = 'MATRICULA'
        DataPipeline = ppValoresRecPagPlano
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Small Fonts'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 2910
        mmLeft = 7938
        mmTop = 265
        mmWidth = 13229
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine36'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 272000
        BandType = 8
      end
      object ppLbNomeSistema: TppLabel
        OnPrint = ppLbNomeSistemaPrint
        UserName = 'ppLabel38'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 3175
        mmWidth = 23813
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc23'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 132821
        mmTop = 3175
        mmWidth = 18785
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc24'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 245005
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppLabel4: TppLabel
        UserName = 'LblndicaEstorno'
        Caption = 'Cancelado\Estornado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Visible = False
        mmHeight = 3440
        mmLeft = 195263
        mmTop = 5821
        mmWidth = 29104
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppLabel6: TppLabel
        UserName = 'LblTotalRecPag'
        Caption = 'Total Geral:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 70379
        mmTop = 3440
        mmWidth = 13494
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc19'
        AutoSize = True
        DataField = 'VLRBRUTO'
        DataPipeline = ppValoresRecPagPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 2921
        mmLeft = 107538
        mmTop = 3440
        mmWidth = 22902
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc20'
        AutoSize = True
        DataField = 'VALORALT'
        DataPipeline = ppValoresRecPagPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 2921
        mmLeft = 125117
        mmTop = 3440
        mmWidth = 22521
        BandType = 7
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc21'
        AutoSize = True
        DataField = 'VLRLIQUIDO'
        DataPipeline = ppValoresRecPagPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 2921
        mmLeft = 142304
        mmTop = 3440
        mmWidth = 24384
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc22'
        AutoSize = True
        DataField = 'VALOROUTRAMOEDA'
        DataPipeline = ppValoresRecPagPlano
        DisplayFormat = '#,##0.00;(#,##0.00)'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppValoresRecPagPlano'
        mmHeight = 2921
        mmLeft = 150622
        mmTop = 3440
        mmWidth = 35645
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DATALANCTO'
      DataPipeline = ppValoresRecPagPlano
      OutlineSettings.CreateNode = True
      UserName = 'RptValoresRecPagGroup2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppValoresRecPagPlano'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel7: TppLabel
          UserName = 'RptValoresRecPagLabel2'
          Caption = 'Data de Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4763
          mmLeft = 0
          mmTop = 1852
          mmWidth = 38100
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'RptValoresRecPagDBText2'
          AutoSize = True
          DataField = 'DATALANCTO'
          DataPipeline = ppValoresRecPagPlano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = []
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'ppValoresRecPagPlano'
          mmHeight = 4498
          mmLeft = 41010
          mmTop = 1852
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = 12566463
          Pen.Style = psClear
          mmHeight = 3969
          mmLeft = 83873
          mmTop = 1588
          mmWidth = 187590
          BandType = 5
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'RptValoresRecPagLabel8'
          Caption = 'Total do dia:'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 85196
          mmTop = 1852
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'RptValoresRecPagDBCalc2'
          AutoSize = True
          DataField = 'VALOROUTRAMOEDA'
          DataPipeline = ppValoresRecPagPlano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValoresRecPagPlano'
          mmHeight = 3133
          mmLeft = 149352
          mmTop = 2117
          mmWidth = 36915
          BandType = 5
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'RptValoresRecPagLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 8202
          mmWidth = 272000
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'RptValoresRecPagDBCalc5'
          AutoSize = True
          DataField = 'VALORALT'
          DataPipeline = ppValoresRecPagPlano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValoresRecPagPlano'
          mmHeight = 3133
          mmLeft = 124016
          mmTop = 1852
          mmWidth = 23622
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc7: TppDBCalc
          UserName = 'RptValoresRecPagDBCalc6'
          AutoSize = True
          DataField = 'VLRBRUTO'
          DataPipeline = ppValoresRecPagPlano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValoresRecPagPlano'
          mmHeight = 3133
          mmLeft = 106733
          mmTop = 1852
          mmWidth = 23707
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'RptValoresRecPagDBCalc3'
          AutoSize = True
          DataField = 'VLRLIQUIDO'
          DataPipeline = ppValoresRecPagPlano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValoresRecPagPlano'
          mmHeight = 3133
          mmLeft = 141415
          mmTop = 1852
          mmWidth = 25273
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PLANO'
      DataPipeline = ppValoresRecPagPlano
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppValoresRecPagPlano'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 529
          mmWidth = 272000
          BandType = 3
          GroupNo = 1
        end
        object ppLine4: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 7408
          mmTop = 8467
          mmWidth = 264055
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'ppLabel40'
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 24871
          mmTop = 8731
          mmWidth = 9525
          BandType = 3
          GroupNo = 1
        end
        object ppLabel11: TppLabel
          UserName = 'RptValoresRecPagLabel6'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 62971
          mmTop = 8731
          mmWidth = 14288
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'RptValoresRecPagLabel3'
          Caption = 'Numero'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 83079
          mmTop = 8731
          mmWidth = 10583
          BandType = 3
          GroupNo = 1
        end
        object ppLabel14: TppLabel
          UserName = 'RptValoresRecPagLabel1'
          Caption = 'Tipo Doc'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 97631
          mmTop = 8731
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLabel15: TppLabel
          UserName = 'RptValoresRecPagLabel10'
          Caption = 'Sld. Bruto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 116946
          mmTop = 8731
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
        object ppLabel16: TppLabel
          UserName = 'RptValoresRecPagLabel9'
          Caption = 'Alterador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 134673
          mmTop = 8731
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLabel17: TppLabel
          UserName = 'RptValoresRecPagLabel4'
          Caption = 'Valor Liq.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 153723
          mmTop = 8731
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
        end
        object ppLabel18: TppLabel
          UserName = 'RptValoresRecPagLabel5'
          Caption = 'Outra Moeda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 168805
          mmTop = 8731
          mmWidth = 17463
          BandType = 3
          GroupNo = 1
        end
        object ppLabel19: TppLabel
          UserName = 'LblFormaRecPag'
          Caption = 'Contas/C x Forma Rec.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 187855
          mmTop = 8731
          mmWidth = 30956
          BandType = 3
          GroupNo = 1
        end
        object ppLabel20: TppLabel
          UserName = 'RptValoresRecPagLabel7'
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 223309
          mmTop = 8731
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLabel21: TppLabel
          UserName = 'Label1'
          Caption = 'Nosso Número'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 250296
          mmTop = 8731
          mmWidth = 20638
          BandType = 3
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label3'
          Caption = 'Plano:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 0
          mmTop = 794
          mmWidth = 8996
          BandType = 3
          GroupNo = 1
        end
        object ppDBText13: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'PLANO'
          DataPipeline = ppValoresRecPagPlano
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppValoresRecPagPlano'
          mmHeight = 3704
          mmLeft = 9790
          mmTop = 794
          mmWidth = 10848
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Matrícula'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 7938
          mmTop = 8731
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppLine5: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 83873
          mmTop = 1323
          mmWidth = 187590
          BandType = 5
          GroupNo = 1
        end
        object ppLabel22: TppLabel
          UserName = 'Label4'
          Caption = 'Sub Total'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 85196
          mmTop = 2117
          mmWidth = 12700
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'VLRBRUTO'
          DataPipeline = ppValoresRecPagPlano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValoresRecPagPlano'
          mmHeight = 3133
          mmLeft = 106733
          mmTop = 2117
          mmWidth = 23707
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = 'VALORALT'
          DataPipeline = ppValoresRecPagPlano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValoresRecPagPlano'
          mmHeight = 3133
          mmLeft = 124016
          mmTop = 2117
          mmWidth = 23622
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          DataField = 'VLRLIQUIDO'
          DataPipeline = ppValoresRecPagPlano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValoresRecPagPlano'
          mmHeight = 3133
          mmLeft = 141415
          mmTop = 2117
          mmWidth = 25273
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc4'
          AutoSize = True
          DataField = 'VALOROUTRAMOEDA'
          DataPipeline = ppValoresRecPagPlano
          DisplayFormat = '#,##0.00;(#,##0.00)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Small Fonts'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppValoresRecPagPlano'
          mmHeight = 3133
          mmLeft = 149352
          mmTop = 2117
          mmWidth = 36915
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object TppParameterList
    end
  end
  object CdsValoresRecPagPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 176
  end
  object SqlValoresRecPagPlano: TCMSqlParams
    ClientDataSet = CdsValoresRecPagPlano
    Left = 320
    Top = 216
  end
  object ppValoresRecPagPlano: TppBDEPipeline
    DataSource = dsValoresRecPagPlano
    UserName = 'ValoresRecPagPlano'
    Left = 320
    Top = 264
    object ppValoresRecPagPlanoppField1: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField2: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField4: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField5: TppField
      FieldAlias = 'NUMFATURA'
      FieldName = 'NUMFATURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField6: TppField
      FieldAlias = 'NUMLANCTO'
      FieldName = 'NUMLANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField7: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField8: TppField
      FieldAlias = 'OPERACAO'
      FieldName = 'OPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField9: TppField
      FieldAlias = 'VALOROUTRAMOEDA'
      FieldName = 'VALOROUTRAMOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField10: TppField
      FieldAlias = 'RECPAG'
      FieldName = 'RECPAG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField11: TppField
      FieldAlias = 'DEBCRE'
      FieldName = 'DEBCRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField12: TppField
      FieldAlias = 'VLRLIQUIDO'
      FieldName = 'VLRLIQUIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField13: TppField
      FieldAlias = 'VALORALT'
      FieldName = 'VALORALT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField14: TppField
      FieldAlias = 'VLRBRUTO'
      FieldName = 'VLRBRUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField15: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField16: TppField
      FieldAlias = 'NUMCHQBORDERO'
      FieldName = 'NUMCHQBORDERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField17: TppField
      FieldAlias = 'NOMEPESSOA'
      FieldName = 'NOMEPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField18: TppField
      FieldAlias = 'DESCPORTFORMA'
      FieldName = 'DESCPORTFORMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField19: TppField
      FieldAlias = 'NOSSONUMERO'
      FieldName = 'NOSSONUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField20: TppField
      FieldAlias = 'NOMEFANTASIA'
      FieldName = 'NOMEFANTASIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField21: TppField
      FieldAlias = 'CODDOCU'
      FieldName = 'CODDOCU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField22: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField23: TppField
      FieldAlias = 'ESTORNO'
      FieldName = 'ESTORNO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppValoresRecPagPlanoppField24: TppField
      FieldAlias = 'CODPORTFORMA'
      FieldName = 'CODPORTFORMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
  end
  object dsValoresRecPagPlano: TwwDataSource
    DataSet = CdsValoresRecPagPlano
    Left = 320
    Top = 320
  end
end
