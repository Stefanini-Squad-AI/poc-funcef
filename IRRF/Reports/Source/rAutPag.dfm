inherited RptAutPag: TRptAutPag
  Left = 452
  Top = 199
  Width = 334
  Height = 424
  Caption = 'RptAutPag'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Aprovação de Documentos - Modelo 2'
    Params = <
      item
        Caption = 'Doc'
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
        Caption = 'Centro Responsabilidade'
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
        Caption = 'Data Inclusao'
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
        Caption = 'Status do Documento'
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
      end>
    Left = 108
  end
  inherited DevRptCM: TExtraOptions
    Left = 160
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = Rptautpagdoc
    LabelEmpresa = ppLabel51
    LabelSistema = ppLabel54
    Left = 48
  end
  object Dsautpagdoc: TwwDataSource
    DataSet = CdsDemGestAutPag
    Left = 162
    Top = 56
  end
  object Ppautpagdoc: TppBDEPipeline
    DataSource = Dsautpagdoc
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'Ppautpagdoc'
    Left = 212
    Top = 56
    object PpautpagdocppField1: TppField
      FieldAlias = 'NUMFATURA'
      FieldName = 'NUMFATURA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField2: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField3: TppField
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField4: TppField
      FieldAlias = 'REFERENCIA'
      FieldName = 'REFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField5: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField6: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField7: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField8: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField9: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField10: TppField
      FieldAlias = 'VALOROUTRAMOEDA'
      FieldName = 'VALOROUTRAMOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField11: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField12: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField13: TppField
      FieldAlias = 'VALORRATEIO'
      FieldName = 'VALORRATEIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField14: TppField
      FieldAlias = 'DESCTDR'
      FieldName = 'DESCTDR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField15: TppField
      FieldAlias = 'NOMEAP'
      FieldName = 'NOMEAP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField16: TppField
      FieldAlias = 'NOMECR'
      FieldName = 'NOMECR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField17: TppField
      FieldAlias = 'NOMECC'
      FieldName = 'NOMECC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField18: TppField
      FieldAlias = 'OBS'
      FieldName = 'OBS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField19: TppField
      FieldAlias = 'NUMBANCO'
      FieldName = 'NUMBANCO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField20: TppField
      FieldAlias = 'NUMAGENCIA'
      FieldName = 'NUMAGENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField21: TppField
      FieldAlias = 'CONTACORRENTE'
      FieldName = 'CONTACORRENTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField22: TppField
      FieldAlias = 'FLGDOCBANCARIO'
      FieldName = 'FLGDOCBANCARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField23: TppField
      FieldAlias = 'VLACRE'
      FieldName = 'VLACRE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField24: TppField
      FieldAlias = 'VLDEC'
      FieldName = 'VLDEC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField25: TppField
      FieldAlias = 'VLIMP'
      FieldName = 'VLIMP'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField26: TppField
      FieldAlias = 'VLLIQ'
      FieldName = 'VLLIQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField27: TppField
      FieldAlias = 'TRGUSERINCLUSAO'
      FieldName = 'TRGUSERINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField28: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField29: TppField
      FieldAlias = 'TRGDTINCLUSAO'
      FieldName = 'TRGDTINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField30: TppField
      FieldAlias = 'TOTVALORBRUTO'
      FieldName = 'TOTVALORBRUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField31: TppField
      FieldAlias = 'TOTVALORDEDUCOES'
      FieldName = 'TOTVALORDEDUCOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField32: TppField
      FieldAlias = 'TOTVALORACRESCIMO'
      FieldName = 'TOTVALORACRESCIMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField33: TppField
      FieldAlias = 'TOTVALORIMPOSTO'
      FieldName = 'TOTVALORIMPOSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField34: TppField
      FieldAlias = 'TOTVALORAPAGAR'
      FieldName = 'TOTVALORAPAGAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField35: TppField
      FieldAlias = 'SUMVALORBRUTO'
      FieldName = 'SUMVALORBRUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField36: TppField
      FieldAlias = 'SUMVALORDEDUCOES'
      FieldName = 'SUMVALORDEDUCOES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField37: TppField
      FieldAlias = 'SUMVALORACRESCIMO'
      FieldName = 'SUMVALORACRESCIMO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField38: TppField
      FieldAlias = 'SUMVALORIMPOSTO'
      FieldName = 'SUMVALORIMPOSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField39: TppField
      FieldAlias = 'SUMVALORAPAGAR'
      FieldName = 'SUMVALORAPAGAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField40: TppField
      FieldAlias = 'NUMIMOVEL'
      FieldName = 'NUMIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField41: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField42: TppField
      FieldAlias = 'DESCPLANO'
      FieldName = 'DESCPLANO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField43: TppField
      FieldAlias = 'DESCPROGRAMA'
      FieldName = 'DESCPROGRAMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField44: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField45: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField46: TppField
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 45
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField47: TppField
      FieldAlias = 'VALOLANCTOLIQ'
      FieldName = 'VALOLANCTOLIQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 46
      Searchable = False
      Sortable = False
    end
    object PpautpagdocppField48: TppField
      FieldAlias = 'SUMVALOLANCTOLIQ'
      FieldName = 'SUMVALOLANCTOLIQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 47
      Searchable = False
      Sortable = False
    end
  end
  object Rptautpagdoc: TppReport
    AutoStop = False
    DataPipeline = Ppautpagdoc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RptSlip'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 15000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
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
    Left = 270
    Top = 104
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'Ppautpagdoc'
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object ppLabel51: TppLabel
        UserName = 'ppLabel51'
        Caption = 'CM Soluções Informática'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 65617
        mmTop = 1058
        mmWidth = 58473
        BandType = 0
      end
      object ppLabel53: TppLabel
        UserName = 'ppLabel53'
        Caption = 'AUTORIZAÇÃO DE PAGAMENTO - AP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 57150
        mmTop = 7938
        mmWidth = 75406
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText28: TppDBText
        UserName = 'ppDBText28'
        DataField = 'NOMEAP'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'ppDBText61'
        DataField = 'NOMECC'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 25665
        mmTop = 0
        mmWidth = 22754
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'ppDBText62'
        DataField = 'DESCTDR'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 48683
        mmTop = 0
        mmWidth = 46831
        BandType = 4
      end
      object ppDBText76: TppDBText
        UserName = 'ppDBText76'
        DataField = 'VALORRATEIO'
        DataPipeline = Ppautpagdoc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 163513
        mmTop = 0
        mmWidth = 26723
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'ppDBText77'
        DataField = 'DESCPLANO'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 95779
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object ppDBText78: TppDBText
        UserName = 'ppDBText78'
        DataField = 'NOMEPATRO'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 116417
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText79: TppDBText
        UserName = 'ppDBText79'
        DataField = 'DESCPROGRAMA'
        DataPipeline = Ppautpagdoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Ppautpagdoc'
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 0
        mmWidth = 23548
        BandType = 4
      end
    end
    object ppFooterBand11: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object ppLabel54: TppLabel
        UserName = 'ppLabel54'
        Caption = 'Contas a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 3704
        mmWidth = 20108
        BandType = 8
      end
      object ppCalc21: TppSystemVariable
        UserName = 'Calc21'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 3969
        mmWidth = 18785
        BandType = 8
      end
      object ppCalc22: TppSystemVariable
        UserName = 'Calc22'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 164042
        mmTop = 3969
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'CODDOCUMENTO'
      DataPipeline = Ppautpagdoc
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group8'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'Ppautpagdoc'
      object ppGroupHeaderBand8: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 42069
        mmPrintPosition = 0
        object ppLine27: TppLine
          UserName = 'ppLine27'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 10583
          mmWidth = 190236
          BandType = 3
          GroupNo = 0
        end
        object ppLine30: TppLine
          UserName = 'ppLine30'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 74083
          mmTop = 1588
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLine31: TppLine
          UserName = 'ppLine31'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 125942
          mmTop = 1588
          mmWidth = 265
          BandType = 3
          GroupNo = 0
        end
        object ppLine32: TppLine
          UserName = 'ppLine32'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 189971
          mmTop = 0
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine33: TppLine
          UserName = 'ppLine33'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 151342
          mmTop = 1588
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLabel55: TppLabel
          UserName = 'ppLabel55'
          Caption = 'Nº da AP  / Centro Responsabilidade'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1058
          mmTop = 2117
          mmWidth = 55827
          BandType = 3
          GroupNo = 0
        end
        object ppLabel56: TppLabel
          UserName = 'ppLabel56'
          Caption = 'Processo Nº'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 74877
          mmTop = 2117
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel72: TppLabel
          UserName = 'ppLabel72'
          Caption = 'Vencimento'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 126736
          mmTop = 2117
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object ppLabel80: TppLabel
          UserName = 'ppLabel80'
          AutoSize = False
          Caption = 'Documento             Compl.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 152136
          mmTop = 2117
          mmWidth = 37042
          BandType = 3
          GroupNo = 0
        end
        object ppDBText80: TppDBText
          UserName = 'ppDBText80'
          DataField = 'NUMAPGR'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 6350
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText81: TppDBText
          UserName = 'ppDBText81'
          DataField = 'NOMECR'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 23813
          mmTop = 6350
          mmWidth = 49742
          BandType = 3
          GroupNo = 0
        end
        object ppDBText82: TppDBText
          UserName = 'ppDBText82'
          DataField = 'REFERENCIA'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 74877
          mmTop = 6350
          mmWidth = 50271
          BandType = 3
          GroupNo = 0
        end
        object ppDBText88: TppDBText
          UserName = 'ppDBText88'
          DataField = 'DATAPROGRAMADA'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 126471
          mmTop = 6350
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppDBText89: TppDBText
          UserName = 'ppDBText89'
          DataField = 'COMPLDOCUMENTO'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 179652
          mmTop = 6350
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object ppDBText90: TppDBText
          UserName = 'ppDBText90'
          DataField = 'NODOCUMENTO'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#0'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 152136
          mmTop = 6350
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppLine34: TppLine
          UserName = 'ppLine34'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 8996
          mmLeft = 265
          mmTop = 1588
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLabel81: TppLabel
          UserName = 'ppLabel81'
          Caption = 'Beneficiário'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 11642
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppLabel82: TppLabel
          UserName = 'ppLabel82'
          Caption = 'Nome/Razão Social'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 15875
          mmWidth = 27781
          BandType = 3
          GroupNo = 0
        end
        object ppLine35: TppLine
          UserName = 'ppLine35'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 11906
          mmLeft = 265
          mmTop = 11906
          mmWidth = 794
          BandType = 3
          GroupNo = 0
        end
        object ppLine36: TppLine
          UserName = 'ppLine36'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 11906
          mmLeft = 151342
          mmTop = 11906
          mmWidth = 1058
          BandType = 3
          GroupNo = 0
        end
        object ppLine37: TppLine
          UserName = 'ppLine37'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 23813
          mmWidth = 190236
          BandType = 3
          GroupNo = 0
        end
        object ppDBText91: TppDBText
          UserName = 'ppDBText91'
          DataField = 'RAZAOSOCIAL'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 1323
          mmTop = 19579
          mmWidth = 148696
          BandType = 3
          GroupNo = 0
        end
        object ppDBText92: TppDBText
          UserName = 'ppDBText92'
          DataField = 'NUMDOCUMENTO'
          DataPipeline = Ppautpagdoc
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          OnFormat = ppDBText92Format
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 152665
          mmTop = 19579
          mmWidth = 36777
          BandType = 3
          GroupNo = 0
        end
        object ppLine38: TppLine
          UserName = 'ppLine38'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 11906
          mmLeft = 189971
          mmTop = 10319
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLabel83: TppLabel
          UserName = 'ppLabel83'
          Caption = 'CPF/CGC'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 152665
          mmTop = 15875
          mmWidth = 14552
          BandType = 3
          GroupNo = 0
        end
        object ppLabel86: TppLabel
          UserName = 'ppLabel86'
          Caption = 'Valor Bruto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 17198
          mmTop = 26458
          mmWidth = 17463
          BandType = 3
          GroupNo = 0
        end
        object ppLabel105: TppLabel
          UserName = 'ppLabel105'
          Caption = 'Deduções'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 60590
          mmTop = 26458
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object ppLabel106: TppLabel
          UserName = 'ppLabel106'
          Caption = 'Acréscimo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 99484
          mmTop = 26458
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel107: TppLabel
          UserName = 'ppLabel107'
          Caption = 'Imposto de Renda'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 128323
          mmTop = 26458
          mmWidth = 24871
          BandType = 3
          GroupNo = 0
        end
        object ppLabel110: TppLabel
          UserName = 'ppLabel110'
          AutoSize = False
          Caption = 'Valor Líquido a Pagar'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 157427
          mmTop = 26458
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object ppLine39: TppLine
          UserName = 'ppLine39'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 265
          mmTop = 35454
          mmWidth = 190236
          BandType = 3
          GroupNo = 0
        end
        object ppLine40: TppLine
          UserName = 'ppLine40'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 265
          mmTop = 25400
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine41: TppLine
          UserName = 'ppLine41'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 189971
          mmTop = 23813
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine42: TppLine
          UserName = 'ppLine42'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 153723
          mmTop = 25400
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine43: TppLine
          UserName = 'ppLine43'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 115623
          mmTop = 25400
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine44: TppLine
          UserName = 'ppLine44'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 75142
          mmTop = 25400
          mmWidth = 529
          BandType = 3
          GroupNo = 0
        end
        object ppLine45: TppLine
          UserName = 'ppLine45'
          Position = lpLeft
          Weight = 0.75
          mmHeight = 9525
          mmLeft = 35190
          mmTop = 25400
          mmWidth = 1323
          BandType = 3
          GroupNo = 0
        end
        object ppLabel111: TppLabel
          UserName = 'ppLabel111'
          Caption = 'Atividade / Projeto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 265
          mmTop = 38365
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppLabel112: TppLabel
          UserName = 'ppLabel112'
          Caption = 'Centro de Custo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 25929
          mmTop = 38365
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppLabel113: TppLabel
          UserName = 'ppLabel113'
          Caption = 'Tipo de Desembolso'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 48948
          mmTop = 38365
          mmWidth = 26988
          BandType = 3
          GroupNo = 0
        end
        object ppLabel114: TppLabel
          UserName = 'ppLabel114'
          Caption = 'Valor'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 182563
          mmTop = 38365
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object ppDBText93: TppDBText
          UserName = 'ppDBText93'
          DataField = 'VLLIQ'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 154517
          mmTop = 30956
          mmWidth = 34660
          BandType = 3
          GroupNo = 0
        end
        object ppDBText97: TppDBText
          UserName = 'ppDBText97'
          DataField = 'VLIMP'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 116152
          mmTop = 30956
          mmWidth = 37042
          BandType = 3
          GroupNo = 0
        end
        object ppDBText98: TppDBText
          UserName = 'ppDBText98'
          DataField = 'VLACRE'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 76200
          mmTop = 30956
          mmWidth = 38894
          BandType = 3
          GroupNo = 0
        end
        object ppDBText99: TppDBText
          UserName = 'ppDBText99'
          DataField = 'VLDEC'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 36513
          mmTop = 30956
          mmWidth = 37835
          BandType = 3
          GroupNo = 0
        end
        object ppDBText100: TppDBText
          UserName = 'ppDBText100'
          DataField = 'VALOR'
          DataPipeline = Ppautpagdoc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          ParentDataPipeline = False
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'Ppautpagdoc'
          mmHeight = 3969
          mmLeft = 1058
          mmTop = 30956
          mmWidth = 33602
          BandType = 3
          GroupNo = 0
        end
        object ppLabel115: TppLabel
          UserName = 'ppLabel115'
          Caption = 'Plano'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 96044
          mmTop = 38365
          mmWidth = 7938
          BandType = 3
          GroupNo = 0
        end
        object ppLabel116: TppLabel
          UserName = 'ppLabel116'
          Caption = 'Patrocinadora'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 116681
          mmTop = 38365
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object ppLabel117: TppLabel
          UserName = 'ppLabel117'
          Caption = 'Programa'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Times New Roman'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 140494
          mmTop = 38365
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 171186
        mmPrintPosition = 0
        object ppRegion1: TppRegion
          UserName = 'ppRegion1'
          Brush.Style = bsClear
          Caption = 'ppRegion1'
          Pen.Color = clWhite
          ShiftRelativeTo = ppRegion5
          Stretch = True
          Transparent = True
          mmHeight = 130440
          mmLeft = 0
          mmTop = 37571
          mmWidth = 189971
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel118: TppLabel
            UserName = 'ppLabel118'
            Caption = 'Á Tesouraria.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 794
            mmTop = 70115
            mmWidth = 22490
            BandType = 5
            GroupNo = 0
          end
          object ppLabel119: TppLabel
            UserName = 'ppLabel119'
            Caption = 'Autorizo o pagamento.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 794
            mmTop = 76730
            mmWidth = 38365
            BandType = 5
            GroupNo = 0
          end
          object ppLine46: TppLine
            UserName = 'ppLine46'
            Weight = 0.75
            mmHeight = 1323
            mmLeft = 529
            mmTop = 113506
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLabel120: TppLabel
            UserName = 'ppLabel120'
            Caption = 'Data'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 529
            mmTop = 114300
            mmWidth = 7673
            BandType = 5
            GroupNo = 0
          end
          object ppLabel121: TppLabel
            UserName = 'ppLabel121'
            Caption = 'Assinatura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4233
            mmLeft = 8996
            mmTop = 114300
            mmWidth = 77788
            BandType = 5
            GroupNo = 0
          end
          object ppLabel123: TppLabel
            UserName = 'ppLabel123'
            Caption = 'Recebido em : _______/_______/_______'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 102923
            mmTop = 84931
            mmWidth = 66411
            BandType = 5
            GroupNo = 0
          end
          object ppLabel124: TppLabel
            UserName = 'ppLabel124'
            Caption = 'Ass. / Carimbo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4233
            mmLeft = 102923
            mmTop = 114300
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLine47: TppLine
            UserName = 'ppLine47'
            Weight = 0.75
            mmHeight = 1323
            mmLeft = 102923
            mmTop = 113506
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLine48: TppLine
            UserName = 'ppLine48'
            ParentWidth = True
            Weight = 0.75
            mmHeight = 1588
            mmLeft = 0
            mmTop = 68263
            mmWidth = 189971
            BandType = 5
            GroupNo = 0
          end
          object ppLine49: TppLine
            UserName = 'ppLine49'
            Weight = 0.75
            mmHeight = 1323
            mmLeft = 794
            mmTop = 147373
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLabel125: TppLabel
            UserName = 'ppLabel125'
            Caption = 'Ass. / Carimbo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4233
            mmLeft = 794
            mmTop = 149490
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLabel127: TppLabel
            UserName = 'ppLabel127'
            Caption = 'Feito Por:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 794
            mmTop = 142875
            mmWidth = 16404
            BandType = 5
            GroupNo = 0
          end
          object ppLabel128: TppLabel
            UserName = 'ppLabel128'
            Caption = 'Conferido Por:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 102923
            mmTop = 142875
            mmWidth = 24342
            BandType = 5
            GroupNo = 0
          end
          object ppLine50: TppLine
            UserName = 'ppLine50'
            Weight = 0.75
            mmHeight = 1323
            mmLeft = 102923
            mmTop = 147373
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppLabel129: TppLabel
            UserName = 'ppLabel129'
            Caption = 'Ass. / Carimbo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = [fsBold]
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 4233
            mmLeft = 102923
            mmTop = 149490
            mmWidth = 86254
            BandType = 5
            GroupNo = 0
          end
          object ppDBText101: TppDBText
            UserName = 'ppDBText101'
            AutoSize = True
            DataField = 'NOMEUSUARIO'
            DataPipeline = Ppautpagdoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 10
            Font.Style = []
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 4233
            mmLeft = 17463
            mmTop = 142875
            mmWidth = 26458
            BandType = 5
            GroupNo = 0
          end
        end
        object ppRegion2: TppRegion
          UserName = 'ppRegion2'
          Brush.Style = bsClear
          Caption = 'ppRegion2'
          Pen.Style = psClear
          Stretch = True
          Transparent = True
          mmHeight = 16140
          mmLeft = 0
          mmTop = 0
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel130: TppLabel
            UserName = 'ppLabel130'
            Caption = 'Observação:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3969
            mmLeft = 794
            mmTop = 11113
            mmWidth = 17727
            BandType = 5
            GroupNo = 0
          end
          object ppDBMemo1: TppDBMemo
            UserName = 'ppDBMemo1'
            CharWrap = True
            DataField = 'OBS'
            DataPipeline = Ppautpagdoc
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 9
            Font.Style = []
            Stretch = True
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 21696
            mmTop = 11113
            mmWidth = 166423
            BandType = 5
            GroupNo = 0
            mmBottomOffset = 0
            mmOverFlowOffset = 0
            mmStopPosition = 0
            mmLeading = 0
          end
        end
        object ppRegion4: TppRegion
          UserName = 'ppRegion4'
          Caption = 'ppRegion4'
          Pen.Color = clWhite
          ShiftRelativeTo = ppRegion2
          Stretch = True
          mmHeight = 15610
          mmLeft = 0
          mmTop = 16140
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel131: TppLabel
            UserName = 'ppLabel131'
            Caption = 'Forma de Pagamento:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3969
            mmLeft = 794
            mmTop = 26723
            mmWidth = 30956
            BandType = 5
            GroupNo = 0
          end
          object ppDBText102: TppDBText
            UserName = 'ppDBText102'
            DataField = 'DESCRICAO'
            DataPipeline = Ppautpagdoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 39688
            mmTop = 26723
            mmWidth = 148432
            BandType = 5
            GroupNo = 0
          end
        end
        object ppRegion5: TppRegion
          UserName = 'ppRegion5'
          Brush.Style = bsClear
          Caption = 'ppRegion5'
          Pen.Style = psClear
          ShiftRelativeTo = ppRegion4
          Stretch = True
          Transparent = True
          mmHeight = 6350
          mmLeft = 0
          mmTop = 31221
          mmWidth = 190000
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppDBText104: TppDBText
            UserName = 'ppDBText104'
            DataField = 'NUMBANCO'
            DataPipeline = Ppautpagdoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 13758
            mmTop = 32544
            mmWidth = 49742
            BandType = 5
            GroupNo = 0
          end
          object ppLabel132: TppLabel
            UserName = 'ppLabel132'
            Caption = 'Banco:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 4233
            mmLeft = 794
            mmTop = 32544
            mmWidth = 10583
            BandType = 5
            GroupNo = 0
          end
          object ppLabel133: TppLabel
            UserName = 'ppLabel133'
            Caption = 'Agência:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3969
            mmLeft = 66146
            mmTop = 32544
            mmWidth = 12965
            BandType = 5
            GroupNo = 0
          end
          object ppDBText105: TppDBText
            UserName = 'ppDBText105'
            DataField = 'NUMAGENCIA'
            DataPipeline = Ppautpagdoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 82815
            mmTop = 32544
            mmWidth = 37571
            BandType = 5
            GroupNo = 0
          end
          object ppLabel136: TppLabel
            UserName = 'ppLabel136'
            Caption = 'Conta:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Times New Roman'
            Font.Size = 10
            Font.Style = [fsBold]
            Transparent = True
            mmHeight = 3969
            mmLeft = 128323
            mmTop = 32544
            mmWidth = 9525
            BandType = 5
            GroupNo = 0
          end
          object ppDBText106: TppDBText
            UserName = 'ppDBText106'
            DataField = 'CONTACORRENTE'
            DataPipeline = Ppautpagdoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 9
            Font.Style = []
            Transparent = True
            DataPipelineName = 'Ppautpagdoc'
            mmHeight = 3969
            mmLeft = 143140
            mmTop = 32544
            mmWidth = 45244
            BandType = 5
            GroupNo = 0
          end
        end
        object ppCalc29: TppSystemVariable
          UserName = 'Calc29'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 109009
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object CdsDemGestAutPag: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspGestAutPag'
    Left = 48
    Top = 56
    object CdsDemGestAutPagNUMFATURA: TFloatField
      FieldName = 'NUMFATURA'
    end
    object CdsDemGestAutPagCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object CdsDemGestAutPagNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
    end
    object CdsDemGestAutPagREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object CdsDemGestAutPagNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object CdsDemGestAutPagCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object CdsDemGestAutPagDATAVENCTO: TDateTimeField
      FieldName = 'DATAVENCTO'
    end
    object CdsDemGestAutPagNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object CdsDemGestAutPagVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CdsDemGestAutPagVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
    end
    object CdsDemGestAutPagRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object CdsDemGestAutPagDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object CdsDemGestAutPagVALORRATEIO: TFloatField
      FieldName = 'VALORRATEIO'
    end
    object CdsDemGestAutPagDESCTDR: TStringField
      FieldName = 'DESCTDR'
      Size = 35
    end
    object CdsDemGestAutPagNOMEAP: TStringField
      FieldName = 'NOMEAP'
      Size = 25
    end
    object CdsDemGestAutPagNOMECR: TStringField
      FieldName = 'NOMECR'
      FixedChar = True
      Size = 30
    end
    object CdsDemGestAutPagNOMECC: TStringField
      FieldName = 'NOMECC'
      Size = 30
    end
    object CdsDemGestAutPagOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object CdsDemGestAutPagNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      FixedChar = True
      Size = 10
    end
    object CdsDemGestAutPagNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object CdsDemGestAutPagCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      FixedChar = True
      Size = 15
    end
    object CdsDemGestAutPagFLGDOCBANCARIO: TStringField
      FieldName = 'FLGDOCBANCARIO'
      FixedChar = True
      Size = 1
    end
    object CdsDemGestAutPagVLACRE: TFloatField
      FieldName = 'VLACRE'
    end
    object CdsDemGestAutPagVLDEC: TFloatField
      FieldName = 'VLDEC'
    end
    object CdsDemGestAutPagVLIMP: TFloatField
      FieldName = 'VLIMP'
    end
    object CdsDemGestAutPagVLLIQ: TFloatField
      FieldName = 'VLLIQ'
    end
    object CdsDemGestAutPagTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object CdsDemGestAutPagNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
      Size = 60
    end
    object CdsDemGestAutPagTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object CdsDemGestAutPagTOTVALORBRUTO: TFloatField
      FieldName = 'TOTVALORBRUTO'
    end
    object CdsDemGestAutPagTOTVALORDEDUCOES: TFloatField
      FieldName = 'TOTVALORDEDUCOES'
    end
    object CdsDemGestAutPagTOTVALORACRESCIMO: TFloatField
      FieldName = 'TOTVALORACRESCIMO'
    end
    object CdsDemGestAutPagTOTVALORIMPOSTO: TFloatField
      FieldName = 'TOTVALORIMPOSTO'
    end
    object CdsDemGestAutPagTOTVALORAPAGAR: TFloatField
      FieldName = 'TOTVALORAPAGAR'
    end
    object CdsDemGestAutPagSUMVALORBRUTO: TFloatField
      FieldName = 'SUMVALORBRUTO'
    end
    object CdsDemGestAutPagSUMVALORDEDUCOES: TFloatField
      FieldName = 'SUMVALORDEDUCOES'
    end
    object CdsDemGestAutPagSUMVALORACRESCIMO: TFloatField
      FieldName = 'SUMVALORACRESCIMO'
    end
    object CdsDemGestAutPagSUMVALORIMPOSTO: TFloatField
      FieldName = 'SUMVALORIMPOSTO'
    end
    object CdsDemGestAutPagSUMVALORAPAGAR: TFloatField
      FieldName = 'SUMVALORAPAGAR'
    end
    object CdsDemGestAutPagNUMIMOVEL: TStringField
      FieldName = 'NUMIMOVEL'
      Size = 60
    end
    object CdsDemGestAutPagNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object CdsDemGestAutPagDESCPLANO: TStringField
      FieldName = 'DESCPLANO'
      Size = 50
    end
    object CdsDemGestAutPagDESCPROGRAMA: TStringField
      FieldName = 'DESCPROGRAMA'
      Size = 60
    end
    object CdsDemGestAutPagDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
    end
    object CdsDemGestAutPagDATAPROGRAMADA: TDateTimeField
      FieldName = 'DATAPROGRAMADA'
    end
    object CdsDemGestAutPagIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object CdsDemGestAutPagVALOLANCTOLIQ: TFloatField
      FieldName = 'VALOLANCTOLIQ'
    end
    object CdsDemGestAutPagSUMVALOLANCTOLIQ: TFloatField
      FieldName = 'SUMVALOLANCTOLIQ'
    end
  end
  object SqlAutPagDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  NUMFATURA,'
      '  CODDOCUMENTO,'
      '  NUMAPGR,'
      '  REFERENCIA,'
      '  NODOCUMENTO,'
      '  COMPLDOCUMENTO,'
      '  DATAVENCTO,'
      '  DATAEMISSAO,'
      '  DATAPROGRAMADA,'
      '  NUMDOCUMENTO,'
      '  VALOR,'
      '  VALOROUTRAMOEDA,'
      '  RAZAOSOCIAL,'
      '  DESCRICAO,'
      '  VALORRATEIO,'
      '  DESCTDR,'
      '  NOMEAP,'
      '  NOMECR,'
      '  NOMECC,'
      '  OBS,'
      '  FLGDOCBANCARIO,'
      '  VLACRE,'
      '  VLDEC,'
      '  VLIMP,'
      '  VLLIQ,'
      '  TRGUSERINCLUSAO,'
      
        '  TO_DATE(TO_CHAR(TRGDTINCLUSAO, '#39'DD/MM/YYYY'#39'), '#39'DD/MM/YYYY'#39') AS' +
        ' TRGDTINCLUSAO,'
      '  (0) AS TOTVALORBRUTO,'
      '  (0) AS TOTVALORDEDUCOES,'
      '  (0) AS TOTVALORACRESCIMO,'
      '  (0) AS TOTVALORIMPOSTO,'
      '  (0) AS TOTVALORAPAGAR,'
      '  (0) AS SUMVALORBRUTO,'
      '  (0) AS SUMVALORDEDUCOES,'
      '  (0) AS SUMVALORACRESCIMO,'
      '  (0) AS SUMVALORIMPOSTO,'
      '  (0) AS SUMVALORAPAGAR,'
      '  NUMIMOVEL,'
      '  NOMEPATRO,'
      '  DESCPLANO,'
      '  DESCPROGRAMA,'
      '  IDFORCLI,'
      '  (0) AS VALOLANCTOLIQ,'
      '  (0) AS SUMVALOLANCTOLIQ'
      'FROM'
      '  ('
      '    SELECT'
      '      D.NUMFATURA,'
      '      D.CODDOCUMENTO,'
      '      D.NUMAPGR,'
      '      D.REFERENCIA,'
      '      D.NODOCUMENTO,'
      '      D.COMPLDOCUMENTO,'
      '      D.DATAVENCTO,'
      '      D.DATAEMISSAO,'
      '      D.DATAPROGRAMADA,'
      '      P.NUMDOCUMENTO,'
      '      L.VALOR,'
      '      L.VALOROUTRAMOEDA,'
      '      P.RAZAOSOCIAL,'
      '      F.DESCRICAO,'
      '      RD.VALOR AS VALORRATEIO,'
      '      TDR.DESCRICAO AS DESCTDR,'
      '      AP.NOME AS NOMEAP,'
      '      CR.NOME AS NOMECR,'
      '      CC.NOME AS NOMECC,'
      '      D.OBS,'
      '      F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '      (0) AS VLACRE,'
      '      (0) AS VLDEC,'
      '      (0) AS VLIMP,'
      '      (0) AS VLLIQ,'
      '      D.TRGUSERINCLUSAO,'
      '      D.TRGDTINCLUSAO,'
      '      RD.NUMIMOVEL,'
      '      PATRO.NOME AS NOMEPATRO,'
      '      PLANO.NOME AS DESCPLANO,'
      '      PROGRAMA.DESCPROGRAMA,'
      '      D.IDFORCLI'
      '    FROM'
      '      PESSOA P,'
      '      PESSOA PATRO,'
      '      DOCUMENTO D,'
      '      LANCTODOCUM L,'
      '      FORMARECPAG F,'
      '      CENTCUST CC,'
      '      RATEIODOCUM RD,'
      '      UNIDNEGOCIO AP,'
      '      CENTRESPON CR,'
      '      TIPORECEBDESEMB TDR,'
      '      PLANPREVCONTABIL PLANO,'
      '      PROGRAMA'
      '    WHERE'
      '      D.CODTIPDOC IN'
      '      ('
      '        SELECT'
      '          CODTIPDOC'
      '        FROM'
      '          TIPODOCRECPAG A'
      '        WHERE'
      '          A.RECPAG = :RECPAG AND'
      '          NOT EXISTS'
      '          ('
      '            SELECT'
      '              *'
      '            FROM'
      '              USUARIOXTPDOCTO B'
      '            WHERE'
      '              RECPAG = :RECPAG AND'
      '              B.IDUSUARIO = :IDUSUARIO'
      '          )'
      '        UNION'
      '          SELECT'
      '            CODTIPDOC'
      '          FROM'
      '            TIPODOCRECPAG A'
      '          WHERE'
      '            A.RECPAG = :RECPAG AND'
      '            EXISTS'
      '            ('
      '              SELECT'
      '                *'
      '              FROM'
      '                USUARIOXTPDOCTO B'
      '              WHERE'
      '                RECPAG = :RECPAG AND'
      '                A.CODTIPDOC = B.CODTIPDOC AND'
      '                B.IDUSUARIO = :IDUSUARIO'
      '            )'
      '      ) AND'
      '      (L.ESTORNO IS NULL) AND'
      '      (D.RECPAG = :RECPAG) AND'
      '      (D.IDPESSOA = :IDPESSOA) AND'
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '      (D.OPERACAO = L.OPERACAO) AND'
      '      (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      '      (P.IDPESSOA = D.IDFORCLI) AND'
      '      (D.CODFORMA = F.CODFORMA(+)) AND'
      '      (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND'
      '      (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND'
      '      (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND'
      '      (TDR.RECPAG(+) = RD.RECPAG) AND'
      '      (TDR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND'
      '      (AP.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND'
      '      (CR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '      (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND'
      '      (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND'
      '      (PATRO.IDPESSOA(+) = RD.IDPATRO)'
      '    UNION'
      '      SELECT'
      '        Q1.NUMFATURA,'
      '        Q1.CODDOCUMENTO,'
      '        Q1.NUMAPGR,'
      '        Q1.REFERENCIA,'
      '        Q1.NODOCUMENTO,'
      '        Q1.COMPLDOCUMENTO,'
      '        Q1.DATAVENCTO,'
      '        Q1.DATAEMISSAO,'
      '        Q1.DATAPROGRAMADA,'
      '        Q1.NUMDOCUMENTO,'
      '        Q1.VALOR,'
      '        Q1.VALOROUTRAMOEDA,'
      '        Q1.RAZAOSOCIAL,'
      '        Q1.DESCRICAO,'
      '        SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALORRATEIO,'
      '        Q2.DESCTDR,'
      '        Q2.NOMEAP,'
      '        Q2.NOMECR,'
      '        Q2.NOMECC,'
      '        Q1.OBS,'
      '        Q1.FLGDOCBANCARIO ,'
      '        (0) AS VLACRE,'
      '        (0) AS VLDEC,'
      '        (0) AS VLIMP,'
      '        (0) AS VLLIQ,'
      '        Q1.TRGUSERINCLUSAO,'
      '        Q1.TRGDTINCLUSAO,'
      '        Q2.NUMIMOVEL,'
      '        Q2.NOMEPATRO,'
      '        Q2.DESCPLANO,'
      '        Q2.DESCPROGRAMA,'
      '        Q1.IDFORCLI'
      '      FROM'
      '        ('
      '          SELECT'
      '            DOC.NUMFATURA,'
      '            DOC.CODDOCUMENTO,'
      '            DOC.NUMAPGR,'
      '            DOC.REFERENCIA,'
      '            DOC.NODOCUMENTO,'
      '            DOC.COMPLDOCUMENTO,'
      '            DOC.DATAVENCTO,'
      '            DOC.DATAEMISSAO,'
      '            DOC.DATAPROGRAMADA,'
      '            P.NUMDOCUMENTO,'
      '            LAN.VALOR,'
      '            LAN.VALOROUTRAMOEDA,'
      '            P.RAZAOSOCIAL,'
      '            F.DESCRICAO,'
      '            DOC.OBS,'
      '            F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '            (0) AS VLACRE,'
      '            (0) AS VLDEC,'
      '            (0) AS VLIMP,'
      '            (0) AS VLLIQ,'
      '            DOC.TRGUSERINCLUSAO,'
      '            DOC.TRGDTINCLUSAO,'
      '            DOC.IDFORCLI'
      '          FROM'
      '            PESSOA P,'
      '            DOCUMENTO DOC,'
      '            LANCTODOCUM LAN,'
      '            FORMARECPAG F'
      '          WHERE'
      '            DOC.CODTIPDOC IN'
      '            ('
      '              SELECT'
      '                CODTIPDOC'
      '              FROM'
      '                TIPODOCRECPAG A'
      '              WHERE'
      '                A.RECPAG = :RECPAG AND'
      '                NOT EXISTS'
      '                ('
      '                  SELECT'
      '                    *'
      '                  FROM'
      '                    USUARIOXTPDOCTO B'
      '                  WHERE'
      '                    RECPAG = :RECPAG AND'
      '                    B.IDUSUARIO = :IDUSUARIO'
      '                )'
      '              UNION'
      '                SELECT'
      '                  CODTIPDOC'
      '                FROM'
      '                  TIPODOCRECPAG A'
      '                WHERE'
      '                  A.RECPAG = :RECPAG AND'
      '                EXISTS'
      '                ('
      '                  SELECT'
      '                    *'
      '                  FROM'
      '                    USUARIOXTPDOCTO B'
      '                  WHERE'
      '                    RECPAG = :RECPAG AND'
      '                    A.CODTIPDOC = B.CODTIPDOC AND'
      '                    B.IDUSUARIO = :IDUSUARIO'
      '                )'
      '            ) AND'
      '            (LAN.ESTORNO IS NULL) AND'
      '            (DOC.RECPAG = :RECPAG) AND'
      '            (DOC.IDPESSOA = :IDPESSOA) AND'
      '            (P.IDPESSOA = DOC.IDFORCLI) AND'
      '            (DOC.CODFORMA = F.CODFORMA(+)) AND'
      '            (RTRIM(LAN.OPERACAO) IN ('#39'3'#39','#39'13'#39')) AND'
      '            (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)'
      '        ) Q1,'
      '        ('
      '          SELECT'
      '            D.NUMFATURA,'
      '            RD.VALOR,'
      '            TDR.DESCRICAO AS DESCTDR,'
      '            AP.NOME AS NOMEAP,'
      '            CR.NOME AS NOMECR,'
      '            CC.NOME AS NOMECC,'
      '            RD.NUMIMOVEL,'
      '            PATRO.NOME AS NOMEPATRO,'
      '            PLANO.NOME AS DESCPLANO,'
      '            PROGRAMA.DESCPROGRAMA'
      '          FROM'
      '            PESSOA PATRO,'
      '            DOCUMENTO D,'
      '            RATEIODOCUM RD,'
      '            CENTCUST CC,'
      '            UNIDNEGOCIO AP,'
      '            CENTRESPON CR,'
      '            TIPORECEBDESEMB TDR,'
      '            PLANPREVCONTABIL PLANO,'
      '            PROGRAMA'
      '          WHERE'
      '            (D.RECPAG = :RECPAG) AND'
      '            (D.IDPESSOA = :IDPESSOA) AND'
      '            (D.NUMFATURA IS NOT NULL) AND'
      '            (CC.CODCENTROCUSTO(+) = RD.CODCENTROCUSTO) AND'
      '            (CC.IDEMPRESA(+) = RD.IDEMPRESA) AND'
      '            (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      '            (TDR.CODTIPRECDES(+) = RD.CODTIPRECDES) AND'
      '            (TDR.RECPAG(+) = RD.RECPAG) AND'
      '            (TDR.IDPESSOA(+) = RD.IDPESSOA) AND'
      '            (AP.UNIDNEGOC(+) = RD.UNIDNEGOC) AND'
      '            (AP.IDPESSOA(+) = RD.IDPESSOA) AND'
      '            (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND'
      '            (PLANO.IDPLANOPREV(+) = RD.IDPLANOPREV) AND'
      '            (PROGRAMA.IDPROGRAMA(+) = RD.IDPROGRAMA) AND'
      '            (PATRO.IDPESSOA(+) = RD.IDPATRO) AND'
      '            (CR.IDPESSOA(+) = RD.IDPESSOA)'
      '        ) Q2,'
      '        ('
      '          SELECT'
      '            D.NUMFATURA,'
      '            SUM(L.VALOR) AS VALOR'
      '          FROM'
      '            LANCTODOCUM L,'
      '            DOCUMENTO D'
      '          WHERE'
      '            (L.ESTORNO IS NULL) AND'
      '            (D.RECPAG= :RECPAG) AND'
      '            (D.IDPESSOA = :IDPESSOA) AND'
      '            (RTRIM(L.OPERACAO) IN ('#39'1'#39','#39'11'#39')) AND'
      '            (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '            (D.OPERACAO = L.OPERACAO) AND'
      '            (D.NUMFATURA IS NOT NULL)'
      '          GROUP BY'
      '            D.NUMFATURA'
      '        ) Q3'
      '      WHERE'
      '        (Q1.NUMFATURA = Q2.NUMFATURA) AND'
      '        (Q3.NUMFATURA = Q2.NUMFATURA)'
      '      GROUP BY'
      '        Q1.NUMFATURA,'
      '        Q1.CODDOCUMENTO,'
      '        Q1.NUMAPGR,'
      '        Q1.REFERENCIA,'
      '        Q1.NODOCUMENTO,'
      '        Q1.COMPLDOCUMENTO,'
      '        Q1.DATAVENCTO,'
      '        Q1.DATAEMISSAO,'
      '        Q1.DATAPROGRAMADA,'
      '        Q1.NUMDOCUMENTO,'
      '        Q1.VALOR,'
      '        Q1.VALOROUTRAMOEDA,'
      '        Q1.RAZAOSOCIAL,'
      '        Q1.DESCRICAO,'
      '        Q2.DESCTDR,'
      '        Q2.NOMEAP,'
      '        Q2.NOMECR,'
      '        Q2.NOMECC,'
      '        Q1.OBS,'
      '        Q1.FLGDOCBANCARIO,'
      '        Q1.TRGUSERINCLUSAO,'
      '        Q1.TRGDTINCLUSAO,'
      '        Q2.NUMIMOVEL,'
      '        Q2.NOMEPATRO,'
      '        Q2.DESCPLANO,'
      '        Q2.DESCPROGRAMA,'
      '        Q1.IDFORCLI'
      '  )'
      ''
      ''
      ' ')
    ClientDataSet = CdsAutPagDoc
    Left = 108
    Top = 104
  end
  object CdsAutPagDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 104
  end
  object SqlDemGestAutPag: TCMSqlParams
    SQL.Strings = (
      ' SELECT'
      '   D.NUMFATURA,'
      '   D.CODDOCUMENTO,'
      '   D.NUMAPGR,'
      '   D.REFERENCIA,'
      '   D.NODOCUMENTO,'
      '   D.COMPLDOCUMENTO,'
      '   D.DATAVENCTO,'
      '   D.DATAEMISSAO,'
      '   D.DATAPROGRAMADA,'
      '   P.NUMDOCUMENTO,'
      '   L.VALOR,'
      '   L.VALOROUTRAMOEDA,'
      '   P.RAZAOSOCIAL,'
      '   F.DESCRICAO,'
      '   RD.VALOR AS VALORRATEIO,'
      '   TDR.DESCRICAO AS DESCTDR,'
      '   AP.NOME AS NOMEAP,'
      '   CR.NOME AS NOMECR,'
      '   CC.NOME AS NOMECC,'
      '   D.OBS,'
      '   F.FLGDADOSBANCARIOS AS FLGDOCBANCARIO,'
      '   (0) AS VLACRE,'
      '   (0) AS VLDEC,'
      '   (0) AS VLIMP,'
      '   (0) AS VLLIQ,'
      '   D.TRGUSERINCLUSAO,'
      
        '   TO_DATE(TO_CHAR(D.TRGDTINCLUSAO, '#39'DD/MM/YYYY'#39'), '#39'DD/MM/YYYY'#39')' +
        ' AS TRGDTINCLUSAO,'
      '   RD.NUMIMOVEL,                                           '
      '   PATRO.NOME AS NOMEPATRO,                                '
      '   PLANO.NOME AS DESCPLANO,'
      '   PROGRAMA.DESCPROGRAMA,'
      '   D.IDFORCLI,'
      '  (0) AS TOTVALORBRUTO,'
      '  (0) AS TOTVALORDEDUCOES,'
      '  (0) AS TOTVALORACRESCIMO,'
      '  (0) AS TOTVALORIMPOSTO,'
      '  (0) AS TOTVALORAPAGAR,'
      '  (0) AS SUMVALORBRUTO,'
      '  (0) AS SUMVALORDEDUCOES,'
      '  (0) AS SUMVALORACRESCIMO,'
      '  (0) AS SUMVALORIMPOSTO,'
      '  (0) AS SUMVALORAPAGAR,'
      '  (0) AS VALOLANCTOLIQ,'
      '  (0) AS SUMVALOLANCTOLIQ,'
      '  ('#39'          '#39') AS NUMBANCO,'
      '  ('#39'               '#39') AS NUMAGENCIA,'
      '  ('#39'               '#39') AS CONTACORRENTE,'
      
        '  ('#39'                                                            ' +
        #39') AS NOMEUSUARIO'
      ' FROM'
      '   PESSOA P,'
      '   PESSOA PATRO,'
      '   DOCUMENTO D,'
      '   LANCTODOCUM L,'
      '   FORMARECPAG F,'
      '   CENTCUST CC,'
      '   RATEIODOCUM RD,'
      '   UNIDNEGOCIO AP,'
      '   CENTRESPON CR,'
      '   TIPORECEBDESEMB TDR,'
      '   PLANPREVCONTABIL PLANO,'
      '   PROGRAMA'
      ' WHERE'
      '   1=2')
    ClientDataSet = CdsDemGestAutPag
    Left = 108
    Top = 56
  end
  object SqlNomeUsuario: TCMSqlParams
    SQL.Strings = (
      'SELECT NOMEUSUARIO '
      'FROM USUARIOSISTEMA '
      'WHERE IDUSUARIO = :IDUSUARIO')
    ClientDataSet = CdsNomeUsuario
    Left = 108
    Top = 152
  end
  object CdsNomeUsuario: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 152
  end
  object CdsBuscaContaDocForn: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 344
  end
  object SqlBuscaContaDocForn: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   DECODE(C.TIPOCONTA,'#39'1'#39','#39'Conta Corrente'#39','
      '   DECODE(C.TIPOCONTA,'#39'2'#39','#39'Cartão Salário'#39','
      
        '   DECODE(C.TIPOCONTA,'#39'3'#39','#39'Conta Poupança'#39','#39#39'))) AS DESCTIPOCONT' +
        'A,'
      
        '   C.CONTACORRENTE, B.NUMBANCO, A.NUMAGENCIA, C.TIPOCONTA, C.IDC' +
        'BANCARIA,'
      
        '   DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOMEAGE' +
        'NCIA,'
      
        '   DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOMEBAN' +
        'CO,'
      '   B.MASCARACC,'
      '   B.MASCARAAGENCIA'
      'FROM'
      
        '   PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABA' +
        'NCARIA A, BANCO B'
      'WHERE'
      '   (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '   (C.IDPESSOA = D.IDFORCLI)  AND'
      '   (C.FLGCONTAPREF = 1)       AND'
      '   (C.IDAGENCIA = A.IDPESSOA) AND'
      '   (A.IDBANCO   = B.IDPESSOA) AND'
      '   (A.IDPESSOA = PA.IDPESSOA) AND'
      '   (B.IDPESSOA = PB.IDPESSOA)'
      ' ')
    ClientDataSet = CdsBuscaContaDocForn
    Left = 108
    Top = 344
  end
  object CdsBuscaContaDoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 296
  end
  object SqlBuscaContaDoc: TCMSqlParams
    SQL.Strings = (
      'SELECT DECODE(C.TIPOCONTA,'#39'1'#39','#39'Conta Corrente'#39','
      '       DECODE(C.TIPOCONTA,'#39'2'#39','#39'Cartão Salário'#39','
      
        '       DECODE(C.TIPOCONTA,'#39'3'#39','#39'Conta Poupança'#39','#39#39'))) AS DESCTIPO' +
        'CONTA,'
      '       C.CONTACORRENTE,'
      '       B.NUMBANCO,'
      '       A.NUMAGENCIA,'
      '       C.TIPOCONTA,'
      '       C.IDCBANCARIA,'
      
        '       DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOM' +
        'EAGENCIA,'
      
        '       DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOM' +
        'EBANCO,'
      '       B.MASCARACC,'
      '       B.MASCARAAGENCIA'
      'FROM'
      
        '   PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABA' +
        'NCARIA A, BANCO B'
      'WHERE'
      '   (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '   (C.IDAGENCIA = A.IDPESSOA)  AND'
      '   (A.IDBANCO   = B.IDPESSOA) AND'
      '   (A.IDPESSOA = PA.IDPESSOA) AND'
      '   (B.IDPESSOA = PB.IDPESSOA) AND'
      '   (D.IDCBANCARIA = C.IDCBANCARIA) '
      ' ')
    ClientDataSet = CdsBuscaContaDoc
    Left = 108
    Top = 296
  end
  object CdsAlteraParcOrigem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 248
  end
  object SqlAlteraParcOrigem: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  (Q2.VALACRE * (Q3.VALORPARCELAS))/(Q1.VALORIGINAL + Q2.VALACRE' +
        ' - Q2.VALDECR - Q2.VALIMP) AS VALACRE,'
      
        '  (Q2.VALDECR * (Q3.VALORPARCELAS))/(Q1.VALORIGINAL + Q2.VALACRE' +
        ' - Q2.VALDECR - Q2.VALIMP) AS VALDECR,'
      
        '  (Q2.VALIMP * (Q3.VALORPARCELAS))/(Q1.VALORIGINAL + Q2.VALACRE ' +
        '- Q2.VALDECR - Q2.VALIMP) AS VALIMP,'
      '  Q3.CODDOCUMENTO  '
      'FROM'
      '   (SELECT'
      '     D.CODDOCUMENTO,'
      '     L.VALOR AS VALORPARCELAS'
      '    FROM'
      '     DOCUMENTO D, LANCTODOCUM L'
      '    WHERE'
      '     (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '     (D.OPERACAO = L.OPERACAO) AND'
      '     (D.CODDOCUMENTO= L.CODDOCUMENTO) AND'
      '     (RTRIM(D.OPERACAO) IN ('#39'3'#39','#39'13'#39')) AND'
      '     (L.ESTORNO IS NULL)) Q3,'
      '   (SELECT'
      '     SUM(L.VALOR) AS VALORIGINAL'
      '    FROM'
      '     DOCUMENTO D, LANCTODOCUM L'
      '    WHERE'
      '     (D.NUMFATURA=:NUMFATURA) AND'
      '     (D.OPERACAO = L.OPERACAO) AND'
      '     (D.CODDOCUMENTO= L.CODDOCUMENTO) AND'
      '     (RTRIM(D.OPERACAO) NOT IN ('#39'3'#39','#39'13'#39')) AND'
      '     (L.ESTORNO IS NULL)) Q1,'
      '   (SELECT'
      '      SUM(VALACRE) AS VALACRE ,'
      '      SUM(VALDECR) AS VALDECR ,'
      '      SUM(VALIMP)  AS VALIMP'
      '    FROM'
      '      (SELECT'
      '         DECODE(L.DEBCRE,'#39'C'#39',SUM(L.VALOR)) AS VALACRE,'
      '         DECODE(L.DEBCRE,'#39'D'#39',SUM(L.VALOR)) AS VALDECR,'
      '         0 AS VALIMP'
      '       FROM'
      '         DOCUMENTO D, LANCTODOCUM L'
      '       WHERE'
      '         (D.NUMFATURA=:NUMFATURA) AND'
      '         (RTRIM(D.OPERACAO) NOT IN ('#39'3'#39','#39'13'#39')) AND'
      '         (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '         (RTRIM(L.OPERACAO)='#39'4'#39') AND'
      '         (CODALTERADOR NOT IN'
      '           (SELECT'
      '              CODALTERADOR'
      '            FROM'
      '              ALTXIMPOSTO'
      '            WHERE'
      '              CODIMPOSTO = 1))'
      '       GROUP BY'
      '         L.DEBCRE'
      '      UNION ALL'
      '      SELECT'
      '        0 AS VALACRE,'
      '        0 AS VALDECR,'
      '        SUM(L.VALOR) AS VALIMP'
      '      FROM'
      '        DOCUMENTO D, LANCTODOCUM L, ALTXIMPOSTO AL'
      '      WHERE'
      '        (D.NUMFATURA=:NUMFATURA) AND'
      '        (L.CODDOCUMENTO=D.CODDOCUMENTO) AND'
      '        (RTRIM(D.OPERACAO) NOT IN ('#39'3'#39','#39'13'#39')) AND'
      '        (RTRIM(L.OPERACAO)='#39'4'#39') AND'
      '        (L.CODALTERADOR = AL.CODALTERADOR) AND'
      '        (AL.CODIMPOSTO = 1))) Q2'
      '')
    ClientDataSet = CdsAlteraParcOrigem
    Left = 108
    Top = 248
  end
  object CdsAutPagDocAlt: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 200
  end
  object SqlAutPagDocAlt: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '   SUM(VALACRE) AS VALACRE, SUM(VALDECR) AS VALDECR, SUM(VALIMP)' +
        ' AS VALIMP'
      'FROM'
      '  (SELECT'
      '      DECODE(L.DEBCRE,'#39'C'#39',SUM(L.VALOR)) AS VALACRE,'
      '      DECODE(L.DEBCRE,'#39'D'#39',SUM(L.VALOR)) AS VALDECR,'
      '      (0) AS VALIMP'
      '   FROM'
      '      LANCTODOCUM L'
      '   WHERE'
      
        '      (L.CODDOCUMENTO=:CODDOCUMENTO) AND (RTRIM(L.OPERACAO)='#39'4'#39')' +
        ' AND'
      '      (CODALTERADOR NOT IN'
      '         (SELECT'
      '             CODALTERADOR'
      '          FROM'
      '             ALTXIMPOSTO'
      '          WHERE'
      '             CODIMPOSTO = 1))'
      '   GROUP BY DEBCRE'
      '   UNION'
      '   SELECT'
      
        '      (0) AS VALACRE, (0) AS VALDECR, SUM(L.VALOR) AS VALIMP FRO' +
        'M LANCTODOCUM L'
      '   WHERE'
      
        '      (L.CODDOCUMENTO=:CODDOCUMENTO) AND (RTRIM(L.OPERACAO)='#39'4'#39')' +
        ' AND'
      
        '      (CODALTERADOR IN (SELECT CODALTERADOR FROM ALTXIMPOSTO WHE' +
        'RE CODIMPOSTO = 1)))'
      ' ')
    ClientDataSet = CdsAutPagDocAlt
    Left = 108
    Top = 200
  end
end
