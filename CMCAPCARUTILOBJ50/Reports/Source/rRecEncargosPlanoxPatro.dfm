inherited RptRecEncargosPlanoxPatro: TRptRecEncargosPlanoxPatro
  Left = 373
  Top = 262
  Width = 293
  Height = 275
  Caption = 'RptRecEncargosPlanoxPatro'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Recolhimento de Encargos'
    Params = <
      item
        Caption = 'Lançamento dos Encargos Inicial'
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
        Caption = 'Lançamento dos Encargos Final'
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
        Caption = 'Tipo do Encargo'
        Controle = tcComboBox
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   TIPOAGRE.DESCCUSTAGREG,'
          '   TIPOAGRE.CODTIPOCUSTAGREG'
          'FROM'
          '   TIPOAGRE,'
          '   TIPOALTERADOR'
          'WHERE'
          '   ( TIPOAGRE.CODALTERADOR = TIPOALTERADOR.CODALTERADOR(+) ) AND'
          '   ( TIPOAGRE.CODTRATFISCD IN ('#39'8'#39','#39'9'#39','#39'A'#39') ) ')
        LookupSettings.Chave = 'CODTIPOCUSTAGREG'
        LookupSettings.Display = 'DESCCUSTAGREG'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '40'
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
        Caption = 'Data para Recolhimento'
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
        Caption = 'Plano Contábil'
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
        Caption = 'Patrocinadora'
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
      end>
    Formheight = 170
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptRecEnc
    LabelEmpresa = ppLabel9
    LabelSistema = ppLabel14
  end
  object PpRecEnc: TppBDEPipeline
    DataSource = DsRecEnc
    UserName = 'PpRecEnc'
    Left = 161
    Top = 51
    object PpRecEncppField1: TppField
      FieldAlias = 'PATROCINADORA'
      FieldName = 'PATROCINADORA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object PpRecEncppField2: TppField
      FieldAlias = 'PLANO'
      FieldName = 'PLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object PpRecEncppField3: TppField
      FieldAlias = 'CENTCUSTO'
      FieldName = 'CENTCUSTO'
      FieldLength = 43
      DisplayWidth = 43
      Position = 2
    end
    object PpRecEncppField4: TppField
      FieldAlias = 'CENTRORESP'
      FieldName = 'CENTRORESP'
      FieldLength = 43
      DisplayWidth = 43
      Position = 3
    end
    object PpRecEncppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMAPGR'
      FieldName = 'NUMAPGR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object PpRecEncppField6: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 35
      DisplayWidth = 35
      Position = 5
    end
    object PpRecEncppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODTIPOCUSTAGREG'
      FieldName = 'CODTIPOCUSTAGREG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object PpRecEncppField8: TppField
      FieldAlias = 'DESCCUSTAGREG'
      FieldName = 'DESCCUSTAGREG'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object PpRecEncppField9: TppField
      FieldAlias = 'DATARETENCAO'
      FieldName = 'DATARETENCAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 8
    end
    object PpRecEncppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRBASE'
      FieldName = 'VLRBASE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object PpRecEncppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRRETIDO'
      FieldName = 'VLRRETIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object PpRecEncppField12: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 11
    end
    object PpRecEncppField13: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 46
      DisplayWidth = 46
      Position = 12
    end
    object PpRecEncppField14: TppField
      FieldAlias = 'COMPLDOCUMENTO'
      FieldName = 'COMPLDOCUMENTO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 13
    end
    object PpRecEncppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDFORCLI'
      FieldName = 'IDFORCLI'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object PpRecEncppField16: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 15
    end
    object PpRecEncppField17: TppField
      FieldAlias = 'NUMDOCUMENTO'
      FieldName = 'NUMDOCUMENTO'
      FieldLength = 18
      DisplayWidth = 18
      Position = 16
    end
  end
  object DsRecEnc: TwwDataSource
    DataSet = CdsRecEnc
    Left = 113
    Top = 67
  end
  object RptRecEnc: TppReport
    AutoStop = False
    DataPipeline = PpRecEnc
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 224
    Top = 69
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpRecEnc'
    object ppHeaderBand3: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 31750
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'Recolhimento de Encargos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 114829
        mmTop = 8731
        mmWidth = 54769
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128323
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object RptRecEncLabel1: TppLabel
        UserName = 'RptRecEncLabel1'
        Caption = 'Encargo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 4233
        mmLeft = 0
        mmTop = 15875
        mmWidth = 15346
        BandType = 0
      end
      object RptRecEncLabel2: TppLabel
        UserName = 'RptRecEncLabel2'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 20373
        mmWidth = 14288
        BandType = 0
      end
      object RptRecEncLabel3: TppLabel
        UserName = 'RptRecEncLabel3'
        Caption = 'Data para recolhimento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 24871
        mmWidth = 40746
        BandType = 0
      end
      object LblEncargo: TppLabel
        UserName = 'LblEncargo'
        Caption = 'Encargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        Visible = False
        mmHeight = 3969
        mmLeft = 42069
        mmTop = 15875
        mmWidth = 12965
        BandType = 0
      end
      object LblPeriodo: TppLabel
        UserName = 'LblPeriodo'
        Caption = 'Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 42069
        mmTop = 20373
        mmWidth = 11642
        BandType = 0
      end
      object LblData: TppLabel
        UserName = 'LblData'
        Caption = 'Data Recolhimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 42069
        mmTop = 24871
        mmWidth = 29104
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object RptRecEncDBText1: TppDBText
        UserName = 'RptRecEncDBText1'
        DataField = 'IDFORCLI'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 2910
        mmLeft = 7144
        mmTop = 0
        mmWidth = 12700
        BandType = 4
      end
      object RptRecEncDBText2: TppDBText
        UserName = 'RptRecEncDBText2'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 2910
        mmLeft = 21167
        mmTop = 0
        mmWidth = 50536
        BandType = 4
      end
      object RptRecEncDBText3: TppDBText
        UserName = 'RptRecEncDBText3'
        DataField = 'NODOCUMENTO'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 2910
        mmLeft = 93663
        mmTop = 0
        mmWidth = 18521
        BandType = 4
      end
      object RptRecEncDBText5: TppDBText
        UserName = 'RptRecEncDBText5'
        DataField = 'DATAPROGRAMADA'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 2910
        mmLeft = 214048
        mmTop = 0
        mmWidth = 15610
        BandType = 4
      end
      object RptRecEncDBText6: TppDBText
        UserName = 'RptRecEncDBText6'
        DataField = 'VLRBASE'
        DataPipeline = PpRecEnc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 2910
        mmLeft = 246328
        mmTop = 0
        mmWidth = 18521
        BandType = 4
      end
      object RptRecEncDBText8: TppDBText
        UserName = 'RptRecEncDBText8'
        DataField = 'DATARETENCAO'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 2910
        mmLeft = 230717
        mmTop = 0
        mmWidth = 14552
        BandType = 4
      end
      object RptRecEncDBText7: TppDBText
        UserName = 'RptRecEncDBText7'
        DataField = 'VLRRETIDO'
        DataPipeline = PpRecEnc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 2910
        mmLeft = 266171
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 2910
        mmLeft = 72496
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'NUMAPGR'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 2910
        mmLeft = 113242
        mmTop = 0
        mmWidth = 13494
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CENTCUSTO'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 2879
        mmLeft = 127265
        mmTop = 0
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'CENTRORESP'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 2910
        mmLeft = 151607
        mmTop = 0
        mmWidth = 29104
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DESCRICAO'
        DataPipeline = PpRecEnc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 2910
        mmLeft = 182563
        mmTop = 0
        mmWidth = 28840
        BandType = 4
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine9: TppLine
        UserName = 'ppLine9'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
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
        mmTop = 1323
        mmWidth = 27252
        BandType = 8
      end
      object ppCalc5: TppSystemVariable
        UserName = 'Calc5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 130440
        mmTop = 1323
        mmWidth = 23548
        BandType = 8
      end
      object ppCalc6: TppSystemVariable
        UserName = 'Calc6'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258234
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptRecEncSummaryBand1: TppSummaryBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object RptRecEncLabel12: TppLabel
        UserName = 'RptRecEncLabel12'
        Caption = 'Total a Recolher'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 220134
        mmTop = 5027
        mmWidth = 27781
        BandType = 7
      end
      object RptRecEncDBCalc1: TppDBCalc
        UserName = 'RptRecEncDBCalc1'
        DataField = 'VLRRETIDO'
        DataPipeline = PpRecEnc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpRecEnc'
        mmHeight = 4233
        mmLeft = 251090
        mmTop = 5027
        mmWidth = 28310
        BandType = 7
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'CODTIPOCUSTAGREG'
      DataPipeline = PpRecEnc
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpRecEnc'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 5556
          mmLeft = 0
          mmTop = 2117
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DESCCUSTAGREG'
          DataPipeline = PpRecEnc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpRecEnc'
          mmHeight = 4233
          mmLeft = 18256
          mmTop = 2646
          mmWidth = 155311
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Encargo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1588
          mmTop = 2646
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'PATROCINADORA'
      DataPipeline = PpRecEnc
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpRecEnc'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5292
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = 14869218
          Pen.Style = psClear
          Shape = stRoundRect
          mmHeight = 5027
          mmLeft = 6085
          mmTop = 265
          mmWidth = 278342
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3810
          mmLeft = 7144
          mmTop = 794
          mmWidth = 22437
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'PATROCINADORA'
          DataPipeline = PpRecEnc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpRecEnc'
          mmHeight = 3704
          mmLeft = 31221
          mmTop = 794
          mmWidth = 155311
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'PLANO'
      DataPipeline = PpRecEnc
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpRecEnc'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 7408
          mmTop = 6615
          mmWidth = 277019
          BandType = 3
          GroupNo = 2
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Plano Previdenciário:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3969
          mmLeft = 7144
          mmTop = 265
          mmWidth = 32544
          BandType = 3
          GroupNo = 2
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'PLANO'
          DataPipeline = PpRecEnc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          DataPipelineName = 'PpRecEnc'
          mmHeight = 3969
          mmLeft = 40481
          mmTop = 265
          mmWidth = 146050
          BandType = 3
          GroupNo = 2
        end
        object RptRecEncLabel4: TppLabel
          UserName = 'RptRecEncLabel4'
          Caption = 'ID'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 7144
          mmTop = 7408
          mmWidth = 2381
          BandType = 3
          GroupNo = 2
        end
        object RptRecEncLabel5: TppLabel
          UserName = 'RptRecEncLabel5'
          Caption = 'Razão Social'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 20638
          mmTop = 7408
          mmWidth = 15081
          BandType = 3
          GroupNo = 2
        end
        object ppLabel49: TppLabel
          UserName = 'Label49'
          Caption = 'CNPJ/CPF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 71967
          mmTop = 7408
          mmWidth = 12171
          BandType = 3
          GroupNo = 2
        end
        object RptRecEncLabel6: TppLabel
          UserName = 'RptRecEncLabel6'
          Caption = 'Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 93134
          mmTop = 7408
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'N. Ap.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 112713
          mmTop = 7408
          mmWidth = 7144
          BandType = 3
          GroupNo = 2
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 5821
          mmLeft = 126736
          mmTop = 4498
          mmWidth = 14817
          BandType = 3
          GroupNo = 2
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Centro de Responsabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 5821
          mmLeft = 151077
          mmTop = 4498
          mmWidth = 20902
          BandType = 3
          GroupNo = 2
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Tipo de Receb. / Desemb.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          WordWrap = True
          mmHeight = 5821
          mmLeft = 182034
          mmTop = 4498
          mmWidth = 19579
          BandType = 3
          GroupNo = 2
        end
        object RptRecEncLabel7: TppLabel
          UserName = 'RptRecEncLabel7'
          Caption = 'Data Prog'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 213519
          mmTop = 7408
          mmWidth = 11642
          BandType = 3
          GroupNo = 2
        end
        object RptRecEncLabel11: TppLabel
          UserName = 'RptRecEncLabel11'
          Caption = 'Data Ret.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 230188
          mmTop = 7408
          mmWidth = 10583
          BandType = 3
          GroupNo = 2
        end
        object RptRecEncLabel8: TppLabel
          UserName = 'RptRecEncLabel8'
          Caption = 'Valor Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 251619
          mmTop = 7408
          mmWidth = 12700
          BandType = 3
          GroupNo = 2
        end
        object RptRecEncLabel9: TppLabel
          UserName = 'RptRecEncLabel9'
          Caption = 'Valor a Recolher'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          WordWrap = True
          mmHeight = 5821
          mmLeft = 269346
          mmTop = 4498
          mmWidth = 13494
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 7673
          mmTop = 265
          mmWidth = 277019
          BandType = 5
          GroupNo = 2
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Totais:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 234421
          mmTop = 1588
          mmWidth = 7938
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'VLRBASE'
          DataPipeline = PpRecEnc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpRecEnc'
          mmHeight = 2910
          mmLeft = 246592
          mmTop = 1588
          mmWidth = 18521
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VLRRETIDO'
          DataPipeline = PpRecEnc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpRecEnc'
          mmHeight = 2910
          mmLeft = 266436
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object SqlRecEnc: TCMSqlParams
    SQL.Strings = (
      'SELECT PT.NOME AS PATROCINADORA,'
      '       PP.NOME AS PLANO,'
      '       '
      '       -- RODOLPHO'
      
        '       DECODE(TRIM(CC.CODCENTROCUSTO),'#39#39','#39#39',TRIM(CC.CODEXTERNO) ' +
        ' || '#39' - '#39' || CC.NOME) AS CENTCUSTO,'
      
        '       DECODE(TRIM(CR.CODCENTRORESPON),'#39#39','#39#39',TRIM(CR.CODEXTERNO)' +
        ' || '#39' - '#39' || CR.NOME) AS CENTRORESP,'
      '       D.NUMAPGR,'
      '       TRD.DESCRICAO,'
      '       '
      '       IR.CODTIPOCUSTAGREG,'
      '       T.DESCCUSTAGREG,'
      '       IR.DATARETENCAO,'
      
        '       NVL(DECODE(L.ESTORNO, NULL, DECODE(IR.FLGESTORNADO, '#39'S'#39', ' +
        '0, ROUND(IR.VLRBASE, 2)), ROUND(IR.VLRBASE, 2),0), 0) AS VLRBASE' +
        ','
      
        '       NVL(DECODE(L.ESTORNO, NULL, DECODE(IR.FLGESTORNADO, '#39'S'#39', ' +
        '0, ROUND((IR.VLRRETIDO*SUM(R.VALOR))/IR.VLRBASE, 2)), ROUND((IR.' +
        'VLRRETIDO*SUM(R.VALOR))/IR.VLRBASE, 2), 0), 0) AS VLRRETIDO,'
      '       D.DATAPROGRAMADA,'
      ''
      '       -- RODOLPHO'
      
        '       DECODE(D.COMPLDOCUMENTO,'#39#39',TO_CHAR(D.NODOCUMENTO),TO_CHAR' +
        '(D.NODOCUMENTO) || '#39' - '#39' || D.COMPLDOCUMENTO) AS NODOCUMENTO,'
      ''
      '       D.IDFORCLI,'
      '       P.RAZAOSOCIAL,    P.NUMDOCUMENTO'
      ''
      'FROM'
      '   IMPOSTORETIDO IR, DOCUMENTO D, PESSOA P, TIPOAGRE T,'
      '   LANCTODOCUM L,    RATEIODOCUM R,    PESSOA PT,'
      '   PLANPREV PP,'
      '   '
      '   --Rodolpho'
      '   CENTCUST CC,'
      '   CENTRESPON CR,'
      '   TIPORECEBDESEMB TRD'
      '   '
      ''
      'WHERE'
      '    (IR.CODTIPOCUSTAGREG IN (26,23,13,1,16,19,22)) AND'
      '    (IR.CODTIPOCUSTAGREG = T.CODTIPOCUSTAGREG) AND'
      '    (D.IDPESSOA = 1) AND'
      
        '    (IR.DATARETENCAO BETWEEN TO_DATE('#39'01/11/2006'#39','#39'dd/mm/yyyy'#39') ' +
        'AND TO_DATE('#39'17/11/2006'#39','#39'dd/mm/yyyy'#39')) AND'
      '    (IR.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      '     D.CODTIPDOC IN (SELECT CODTIPDOC'
      '                     FROM TIPODOCRECPAG A'
      '                     WHERE A.RECPAG = '#39'P'#39' AND'
      '                           NOT EXISTS (SELECT 1'
      '                                       FROM USUARIOXTPDOCTO B'
      '                                       WHERE B.RECPAG='#39'P'#39
      '                                       AND B.IDUSUARIO= 58664)'
      '                     UNION'
      '                     SELECT CODTIPDOC'
      '                     FROM TIPODOCRECPAG A'
      '                     WHERE A.RECPAG =   '#39'P'#39'  AND'
      '                           EXISTS (SELECT 1'
      '                                   FROM USUARIOXTPDOCTO B'
      '                                   WHERE B.RECPAG='#39'P'#39
      '                                     AND A.CODTIPDOC=B.CODTIPDOC'
      
        '                                     AND B.IDUSUARIO= 58664)) AN' +
        'D'
      '     (D.IDFORCLI = P.IDPESSOA)  AND'
      '     L.CODDOCUMENTO(+) = IR.CODDOCUMENTO AND'
      '     L.NUMLANCTO(+) = IR.NUMLANCTO  AND'
      '     R.CODDOCUMENTO = D.CODDOCUMENTO  AND'
      '     R.IDPLANOPREV  = PP.IDPLANOPREV(+)  AND'
      '     R.IDPATRO      = PT.IDPESSOA(+) '
      '     --RODOLPHO'
      '     AND (R.CODCENTROCUSTO  = CC.CODCENTROCUSTO(+))'
      '     AND (R.CODCENTRORESPON = CR.CODCENTRORESPON(+))'
      '     AND (R.RECPAG = TRD.RECPAG(+)) '
      '     AND (R.CODTIPRECDES = TRD.CODTIPRECDES(+))'
      '     '
      ''
      'GROUP BY'
      '   PT.NOME,     PP.NOME,'
      '-- RODOLPHO'
      '   CC.CODCENTROCUSTO,CC.CODEXTERNO,CC.NOME,'
      '   CR.CODCENTRORESPON,CR.CODEXTERNO,CR.NOME,'
      '   D.NUMAPGR,'
      '   TRD.DESCRICAO,'
      ''
      ''
      '   R.CODDOCUMENTO,     IR.CODTIPOCUSTAGREG,'
      
        '   T.DESCCUSTAGREG,     IR.DATARETENCAO,     L.ESTORNO,     IR.F' +
        'LGESTORNADO,'
      
        '   IR.VLRRETIDO,     IR.VLRBASE,     D.DATAPROGRAMADA,     D.NOD' +
        'OCUMENTO,'
      '   D.COMPLDOCUMENTO,     D.IDFORCLI,     P.RAZAOSOCIAL,'
      '   P.NUMDOCUMENTO'
      ''
      'ORDER BY'
      
        '   IR.CODTIPOCUSTAGREG,   IR.DATARETENCAO,   P.RAZAOSOCIAL, D.ID' +
        'FORCLI')
    ClientDataSet = CdsRecEnc
    Left = 64
    Top = 64
  end
  object CdsRecEnc: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 16
    Top = 56
    Data = {
      AF1900009619E0BD010000001800000011001A000000030000003A020D504154
      524F43494E41444F52410100490000000100055749445448020002003C000550
      4C414E4F01004900000001000557494454480200020032000943454E54435553
      544F0100490000000100055749445448020002002B000A43454E54524F524553
      500100490000000100055749445448020002002B00074E554D41504752080004
      00000000000944455343524943414F0100490000000100055749445448020002
      00230010434F445449504F43555354414752454708000400000000000D444553
      434355535441475245470100490000000100055749445448020002003C000C44
      415441524554454E43414F080008000000000007564C52424153450800040000
      00000009564C5252455449444F08000400000000000E4441544150524F475241
      4D41444108000800000000000B4E4F444F43554D454E544F0100490000000100
      055749445448020002002E000E434F4D504C444F43554D454E544F0100490000
      0002000753554254595045020049000A00466978656443686172000557494454
      48020002000300084944464F52434C4908000400000000000B52415A414F534F
      4349414C0100490000000100055749445448020002003C000C4E554D444F4355
      4D454E544F01004900000002000753554254595045020049000A004669786564
      436861720005574944544802000200120002000D44454641554C545F4F524445
      5202008200040000000700090010000F00044C43494404000100160800000000
      000004000556414C49410242440C30313032202D204745464956253031303220
      2D20474546495620202020202020202020202020202020202020202020202020
      000000000000F03F17446573702E2056616C65202D205472616E73706F727465
      00000000000008402231373038202D204972726620732F20666F726E65636564
      6F726573202D20312C35250000DE0A31C9CC42000000000070B7400000000000
      8046400000DE0A31C9CC420531333630380000000000A890401C434D20534F4C
      55C7D5455320494E464F524DC154494341204C5444410E323931383536353930
      30303134310000000004000556414C49410242440C30313033202D204745434F
      562530313033202D204745434F56202020202020202020202020202020202020
      20202020202020000000000000F03F17446573702E2056616C65202D20547261
      6E73706F72746500000000000008402231373038202D204972726620732F2066
      6F726E656365646F726573202D20312C35250000DE0A31C9CC42000000000070
      B74000000000008046400000DE0A31C9CC420531333630380000000000A89040
      1C434D20534F4C55C7D5455320494E464F524DC154494341204C5444410E3239
      3138353635393030303134310000000004000556414C49410242440C30313032
      202D2047454649562530313032202D2047454649562020202020202020202020
      2020202020202020202020202020000000000000F03F17446573702E2056616C
      65202D205472616E73706F72746500000000000010401A35393532202D205069
      7320732F20666F726E656365646F7265730000DE0A31C9CC42000000000070B7
      4000000000008033400000DE0A31C9CC420531333630380000000000A890401C
      434D20534F4C55C7D5455320494E464F524DC154494341204C5444410E323931
      38353635393030303134310000000004000556414C49410242440C3031303220
      2D2047454649562530313032202D204745464956202020202020202020202020
      20202020202020202020202020000000000000004017446573702E2056616C65
      202D205472616E73706F72746500000000000010401A35393532202D20506973
      20732F20666F726E656365646F7265730000DE0A31C9CC420000000000409F40
      0000000000001A400000DE0A31C9CC420531333631310000000000A890401C43
      4D20534F4C55C7D5455320494E464F524DC154494341204C5444410E32393138
      353635393030303134310000000004000556414C49410242440C30313033202D
      204745434F562530313033202D204745434F5620202020202020202020202020
      202020202020202020202020000000000000F03F17446573702E2056616C6520
      2D205472616E73706F72746500000000000010401A35393532202D2050697320
      732F20666F726E656365646F7265730000DE0A31C9CC42000000000070B74000
      000000008033400000DE0A31C9CC420531333630380000000000A890401C434D
      20534F4C55C7D5455320494E464F524DC154494341204C5444410E3239313835
      3635393030303134310000000004000556414C49410242440C30313033202D20
      4745434F562530313033202D204745434F562020202020202020202020202020
      2020202020202020202020000000000000004017446573702E2056616C65202D
      205472616E73706F72746500000000000010401A35393532202D205069732073
      2F20666F726E656365646F7265730000DE0A31C9CC420000000000409F400000
      000000001A400000DE0A31C9CC420531333631310000000000A890401C434D20
      534F4C55C7D5455320494E464F524DC154494341204C5444410E323931383536
      353930303031343100000000040005434F4D554D104F70657261E7F565732043
      6F6D756E730C30323132202D2041534349412530323132202D20415343494120
      2020202020202020202020202020202020202020202020200000000000003A40
      13416469616E742E203133BA2053616CE172696F00000000000010401A353935
      32202D2050697320732F20666F726E656365646F72657300000C9E33C9CC4200
      00000000005E40713D0AD7A390434000000C9E33C9CC42053133363335000000
      0000A890401C434D20534F4C55C7D5455320494E464F524DC154494341204C54
      44410E323931383536353930303031343100000000040005434F4D554D104F70
      657261E7F5657320436F6D756E730C30323132202D2041534349412530323132
      202D204153434941202020202020202020202020202020202020202020202020
      200000000000003B4013416469616E742E203133BA2053616CE172696F000000
      00000010401A35393532202D2050697320732F20666F726E656365646F726573
      00000C9E33C9CC420000000000406040333333333333EB3F00000C9E33C9CC42
      0531333633370000000000A890401C434D20534F4C55C7D5455320494E464F52
      4DC154494341204C5444410E3239313835363539303030313431000000000400
      05434F4D554D104F70657261E7F5657320436F6D756E730C30323132202D2041
      534349412530323132202D204153434941202020202020202020202020202020
      202020202020202020200000000000003C4013416469616E742E203133BA2053
      616CE172696F00000000000010401A35393532202D2050697320732F20666F72
      6E656365646F72657300000C9E33C9CC4200000000005094406666666666E620
      4000000C9E33C9CC420531333634320000000000A890401C434D20534F4C55C7
      D5455320494E464F524DC154494341204C5444410E3239313835363539303030
      31343100000000000005434F4D554D104F70657261E7F5657320436F6D756E73
      0F30323036202D2047454154415F534C21202D20432E20526573706F6E736162
      696C69646164652050616472E36F202020200000000000889C4018446570F373
      69746F204A7564696369616C202D205052455600000000000010401A35393532
      202D2050697320732F20666F726E656365646F726573000096573BC9CC420000
      000000005E40EC51B81E85BB7E40000096573BC9CC420B3831323036202D2030
      31200230310000000000A890401C434D20534F4C55C7D5455320494E464F524D
      C154494341204C5444410E323931383536353930303031343100000000040005
      56414C49410242440C30313032202D2047454649562530313032202D20474546
      4956202020202020202020202020202020202020202020202020200000000000
      00F03F17446573702E2056616C65202D205472616E73706F7274650000000000
      0014401D35393532202D20436F66696E7320732F20666F726E656365646F7265
      730000DE0A31C9CC42000000000070B74000000000008056400000DE0A31C9CC
      420531333630380000000000A890401C434D20534F4C55C7D5455320494E464F
      524DC154494341204C5444410E32393138353635393030303134310000000004
      000556414C49410242440C30313032202D2047454649562530313032202D2047
      4546495620202020202020202020202020202020202020202020202020000000
      000000004017446573702E2056616C65202D205472616E73706F727465000000
      00000014401D35393532202D20436F66696E7320732F20666F726E656365646F
      7265730000DE0A31C9CC420000000000409F400000000000003E400000DE0A31
      C9CC420531333631310000000000A890401C434D20534F4C55C7D5455320494E
      464F524DC154494341204C5444410E3239313835363539303030313431000000
      0004000556414C49410242440C30313033202D204745434F562530313033202D
      204745434F562020202020202020202020202020202020202020202020202000
      0000000000F03F17446573702E2056616C65202D205472616E73706F72746500
      000000000014401D35393532202D20436F66696E7320732F20666F726E656365
      646F7265730000DE0A31C9CC42000000000070B74000000000008056400000DE
      0A31C9CC420531333630380000000000A890401C434D20534F4C55C7D5455320
      494E464F524DC154494341204C5444410E323931383536353930303031343100
      00000004000556414C49410242440C30313033202D204745434F562530313033
      202D204745434F56202020202020202020202020202020202020202020202020
      20000000000000004017446573702E2056616C65202D205472616E73706F7274
      6500000000000014401D35393532202D20436F66696E7320732F20666F726E65
      6365646F7265730000DE0A31C9CC420000000000409F400000000000003E4000
      00DE0A31C9CC420531333631310000000000A890401C434D20534F4C55C7D545
      5320494E464F524DC154494341204C5444410E32393138353635393030303134
      3100000000040005434F4D554D104F70657261E7F5657320436F6D756E730C30
      323132202D2041534349412530323132202D2041534349412020202020202020
      20202020202020202020202020202020200000000000003A4013416469616E74
      2E203133BA2053616CE172696F00000000000014401D35393532202D20436F66
      696E7320732F20666F726E656365646F72657300000C9E33C9CC420000000000
      005E40333333333393664000000C9E33C9CC420531333633350000000000A890
      401C434D20534F4C55C7D5455320494E464F524DC154494341204C5444410E32
      3931383536353930303031343100000000040005434F4D554D104F70657261E7
      F5657320436F6D756E730C30323132202D2041534349412530323132202D2041
      5343494120202020202020202020202020202020202020202020202020000000
      0000003B4013416469616E742E203133BA2053616CE172696F00000000000014
      401D35393532202D20436F66696E7320732F20666F726E656365646F72657300
      000C9E33C9CC4200000000004060403333333333330F4000000C9E33C9CC4205
      31333633370000000000A890401C434D20534F4C55C7D5455320494E464F524D
      C154494341204C5444410E323931383536353930303031343100000000040005
      434F4D554D104F70657261E7F5657320436F6D756E730C30323132202D204153
      4349412530323132202D20415343494120202020202020202020202020202020
      2020202020202020200000000000003C4013416469616E742E203133BA205361
      6CE172696F00000000000014401D35393532202D20436F66696E7320732F2066
      6F726E656365646F72657300000C9E33C9CC4200000000005094400000000000
      80434000000C9E33C9CC420531333634320000000000A890401C434D20534F4C
      55C7D5455320494E464F524DC154494341204C5444410E323931383536353930
      303031343100000000000005434F4D554D104F70657261E7F5657320436F6D75
      6E730F30323036202D2047454154415F534C21202D20432E20526573706F6E73
      6162696C69646164652050616472E36F202020200000000000889C4018446570
      F37369746F204A7564696369616C202D205052455600000000000014401D3539
      3532202D20436F66696E7320732F20666F726E656365646F726573000096573B
      C9CC420000000000005E40295C8FC2F5BAA140000096573BC9CC420B38313230
      36202D203031200230310000000000A890401C434D20534F4C55C7D545532049
      4E464F524DC154494341204C5444410E32393138353635393030303134310000
      000004000556414C49410242440C30313032202D204745464956253031303220
      2D20474546495620202020202020202020202020202020202020202020202020
      000000000000F03F17446573702E2056616C65202D205472616E73706F727465
      00000000000018401B35393532202D2043736C6C20732F20666F726E65636564
      6F7265730000DE0A31C9CC42000000000070B7400000000000003E400000DE0A
      31C9CC420531333630380000000000A890401C434D20534F4C55C7D545532049
      4E464F524DC154494341204C5444410E32393138353635393030303134310000
      000004000556414C49410242440C30313032202D204745464956253031303220
      2D20474546495620202020202020202020202020202020202020202020202020
      000000000000004017446573702E2056616C65202D205472616E73706F727465
      00000000000018401B35393532202D2043736C6C20732F20666F726E65636564
      6F7265730000DE0A31C9CC420000000000409F4000000000000024400000DE0A
      31C9CC420531333631310000000000A890401C434D20534F4C55C7D545532049
      4E464F524DC154494341204C5444410E32393138353635393030303134310000
      000004000556414C49410242440C30313033202D204745434F56253031303320
      2D204745434F5620202020202020202020202020202020202020202020202020
      000000000000F03F17446573702E2056616C65202D205472616E73706F727465
      00000000000018401B35393532202D2043736C6C20732F20666F726E65636564
      6F7265730000DE0A31C9CC42000000000070B7400000000000003E400000DE0A
      31C9CC420531333630380000000000A890401C434D20534F4C55C7D545532049
      4E464F524DC154494341204C5444410E32393138353635393030303134310000
      000004000556414C49410242440C30313033202D204745434F56253031303320
      2D204745434F5620202020202020202020202020202020202020202020202020
      000000000000004017446573702E2056616C65202D205472616E73706F727465
      00000000000018401B35393532202D2043736C6C20732F20666F726E65636564
      6F7265730000DE0A31C9CC420000000000409F4000000000000024400000DE0A
      31C9CC420531333631310000000000A890401C434D20534F4C55C7D545532049
      4E464F524DC154494341204C5444410E32393138353635393030303134310000
      0000040005434F4D554D104F70657261E7F5657320436F6D756E730C30323132
      202D2041534349412530323132202D2041534349412020202020202020202020
      20202020202020202020202020200000000000003A4013416469616E742E2031
      33BA2053616CE172696F00000000000018401B35393532202D2043736C6C2073
      2F20666F726E656365646F72657300000C9E33C9CC420000000000005E409A99
      999999194E4000000C9E33C9CC420531333633350000000000A890401C434D20
      534F4C55C7D5455320494E464F524DC154494341204C5444410E323931383536
      353930303031343100000000040005434F4D554D104F70657261E7F565732043
      6F6D756E730C30323132202D2041534349412530323132202D20415343494120
      2020202020202020202020202020202020202020202020200000000000003B40
      13416469616E742E203133BA2053616CE172696F00000000000018401B353935
      32202D2043736C6C20732F20666F726E656365646F72657300000C9E33C9CC42
      0000000000406040CDCCCCCCCCCCF43F00000C9E33C9CC420531333633370000
      000000A890401C434D20534F4C55C7D5455320494E464F524DC154494341204C
      5444410E323931383536353930303031343100000000040005434F4D554D104F
      70657261E7F5657320436F6D756E730C30323132202D20415343494125303231
      32202D2041534349412020202020202020202020202020202020202020202020
      20200000000000003C4013416469616E742E203133BA2053616CE172696F0000
      0000000018401B35393532202D2043736C6C20732F20666F726E656365646F72
      657300000C9E33C9CC4200000000005094400000000000002A4000000C9E33C9
      CC420531333634320000000000A890401C434D20534F4C55C7D5455320494E46
      4F524DC154494341204C5444410E323931383536353930303031343100000000
      000005434F4D554D104F70657261E7F5657320436F6D756E730F30323036202D
      2047454154415F534C21202D20432E20526573706F6E736162696C6964616465
      2050616472E36F202020200000000000889C4018446570F37369746F204A7564
      696369616C202D205052455600000000000018401B35393532202D2043736C6C
      20732F20666F726E656365646F726573000096573BC9CC420000000000005E40
      52B81E85EBA38740000096573BC9CC420B3831323036202D2030312002303100
      00000000A890401C434D20534F4C55C7D5455320494E464F524DC15449434120
      4C5444410E3239313835363539303030313431}
  end
end
