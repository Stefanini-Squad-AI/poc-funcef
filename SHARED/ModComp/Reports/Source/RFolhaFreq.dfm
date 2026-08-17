inherited RptFolhaFreq: TRptFolhaFreq
  Left = 242
  Top = 216
  Width = 282
  Height = 266
  Caption = 'RptFolhaFreq'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
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
        Caption = 'DataRef'
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
        Name = 'DataRef'
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
        Caption = 'ListaIdFunc'
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
        Name = 'ListaIdFunc'
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
        Caption = 'FlgDoisCargos'
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
        Name = 'FlgDoisCargos'
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
        Caption = 'Ordenacao'
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
        Name = 'Ordenacao'
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
        Caption = 'ListaIdCargo'
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
        Name = 'ListaIdCargo'
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
    Report = rpFolhaFreq
    ConnectionType = cntBDE
  end
  object sqlFolhaFreq: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ESTAB,'
      '  '#39'12345678901234567890'#39' AS CGC,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENDERECO,'
      '  '#39'12345678901234567890'#39' AS UF,'
      '  0 AS IDPESSOA,'
      '  '#39'12345678901234567890'#39' AS MATRICULA,'
      '  '#39'12345678901234567890'#39' AS REFERENCIA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS C_CUSTO,'
      '  '#39'1234567890'#39' AS DATAADMISSAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS NOMEHORARIO,'
      '  '#39'12345678901234567890'#39' AS TIPOCONTRATO,'
      '  '#39'1234567890'#39' AS EMISSAO,'
      '  '#39'1234567890'#39' AS PER_AQUI_INI,'
      '  '#39'1234567890'#39' AS PER_AQUI_FIN,'
      '  0 AS NUM_DIAS_MES,'
      '  '#39'1234567890'#39' AS DIA01,'
      '  '#39'1234567890'#39' AS DIA02,'
      '  '#39'1234567890'#39' AS DIA03,'
      '  '#39'1234567890'#39' AS DIA04,'
      '  '#39'1234567890'#39' AS DIA05,'
      '  '#39'1234567890'#39' AS DIA06,'
      '  '#39'1234567890'#39' AS DIA07,'
      '  '#39'1234567890'#39' AS DIA08,'
      '  '#39'1234567890'#39' AS DIA09,'
      '  '#39'1234567890'#39' AS DIA10,'
      '  '#39'1234567890'#39' AS DIA11,'
      '  '#39'1234567890'#39' AS DIA12,'
      '  '#39'1234567890'#39' AS DIA13,'
      '  '#39'1234567890'#39' AS DIA14,'
      '  '#39'1234567890'#39' AS DIA15,'
      '  '#39'1234567890'#39' AS DIA16,'
      '  '#39'1234567890'#39' AS DIA17,'
      '  '#39'1234567890'#39' AS DIA18,'
      '  '#39'1234567890'#39' AS DIA19,'
      '  '#39'1234567890'#39' AS DIA20,'
      '  '#39'1234567890'#39' AS DIA21,'
      '  '#39'1234567890'#39' AS DIA22,'
      '  '#39'1234567890'#39' AS DIA23,'
      '  '#39'1234567890'#39' AS DIA24,'
      '  '#39'1234567890'#39' AS DIA25,'
      '  '#39'1234567890'#39' AS DIA26,'
      '  '#39'1234567890'#39' AS DIA27,'
      '  '#39'1234567890'#39' AS DIA28,'
      '  '#39'1234567890'#39' AS DIA29,'
      '  '#39'1234567890'#39' AS DIA30,'
      '  '#39'1234567890'#39' AS DIA31'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)'
      ' '
      ' ')
    ClientDataSet = CdsFolhaFreq
    Left = 217
    Top = 190
  end
  object CdsFolhaFreq: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsFolhaFreqAfterScroll
    Left = 217
    Top = 144
  end
  object rpFolhaFreq: TppReport
    AutoStop = False
    Columns = 2
    ColumnPositions.Strings = (
      '6350'
      '144150')
    DataPipeline = ppFolhaFreq
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
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
    Left = 217
    Version = '5.5'
    mmColumnWidth = 142150
    object rpFolhaFreqHdrBnd: TppColumnHeaderBand
      AfterPrint = rpFolhaFreqHdrBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 2381
      mmPrintPosition = 0
    end
    object rpFolhaFreqDtlBnd: TppDetailBand
      BeforePrint = rpFolhaFreqDtlBndBeforePrint
      mmBottomOffset = 0
      mmHeight = 193675
      mmPrintPosition = 0
      object rpFolhaFreqMemoEmpreg: TppMemo
        UserName = 'rpFolhaFreqMemoEmpreg'
        Caption = 
          'Data  ___/___/____    ______________________________      ______' +
          '_________________________'#13#10'                                     ' +
          '         Assinatura do Empregado                         Assinat' +
          'ura do Empregador'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          
            'Data  ___/___/____    ______________________________      ______' +
            '_________________________'
          
            '                                              Assinatura do Empr' +
            'egado                         Assinatura do Empregador')
        Transparent = True
        mmHeight = 8731
        mmLeft = 265
        mmTop = 183886
        mmWidth = 132027
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpFolhaFreqMemoEstag: TppMemo
        UserName = 'rpFolhaFreqMemoEmpreg1'
        Caption = 
          'Data  ___/___/____    ______________________________      ______' +
          '_________________________'#13#10'                                     ' +
          '         Assinatura do Empregado                         Assinat' +
          'ura do Empregador'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          
            'Data  ___/___/____     __________________________      _________' +
            '______________________'
          
            '                                             Assinatura do Estag' +
            'iário                     Assinatura do Responsável'
          ' ')
        mmHeight = 8731
        mmLeft = 265
        mmTop = 172244
        mmWidth = 132027
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpFolhaFreqShapeDia31_3: TppShape
        UserName = 'rpFolhaFreqShapeDia31_3'
        mmHeight = 4763
        mmLeft = 88900
        mmTop = 138907
        mmWidth = 14023
        BandType = 4
      end
      object rpFolhaFreqShapeDia30_3: TppShape
        UserName = 'rpFolhaFreqShapeDia30_3'
        mmHeight = 4763
        mmLeft = 88900
        mmTop = 134409
        mmWidth = 14023
        BandType = 4
      end
      object rpFolhaFreqShapeDia29_3: TppShape
        UserName = 'Shape3'
        mmHeight = 4763
        mmLeft = 88900
        mmTop = 129911
        mmWidth = 14023
        BandType = 4
      end
      object rpFolhaFreqShapeDia31_2: TppShape
        UserName = 'rpFolhaFreqShapeDia31_2'
        mmHeight = 4763
        mmLeft = 75142
        mmTop = 138907
        mmWidth = 14023
        BandType = 4
      end
      object rpFolhaFreqShapeDia30_2: TppShape
        UserName = 'rpFolhaFreqShapeDia30_2'
        mmHeight = 4763
        mmLeft = 75142
        mmTop = 134409
        mmWidth = 14023
        BandType = 4
      end
      object rpFolhaFreqShapeDia29_2: TppShape
        UserName = 'rpFolhaFreqShapeDia29_2'
        mmHeight = 4763
        mmLeft = 75142
        mmTop = 129911
        mmWidth = 14023
        BandType = 4
      end
      object rpFolhaFreqShapeDia30_1: TppShape
        UserName = 'rpFolhaFreqShapeDia30_1'
        mmHeight = 4763
        mmLeft = 66940
        mmTop = 134409
        mmWidth = 8467
        BandType = 4
      end
      object rpFolhaFreqShapeDia29_1: TppShape
        UserName = 'rpFolhaFreqShapeDia29_1'
        mmHeight = 4763
        mmLeft = 66940
        mmTop = 129911
        mmWidth = 8467
        BandType = 4
      end
      object rpFolhaFreqShape4: TppShape
        UserName = 'rpFolhaFreqShape4'
        mmHeight = 26723
        mmLeft = 265
        mmTop = 35454
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape2: TppShape
        UserName = 'rpFolhaFreqShape2'
        Brush.Style = bsClear
        mmHeight = 6879
        mmLeft = 265
        mmTop = 20638
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape3: TppShape
        UserName = 'rpFolhaFreqShape3'
        mmHeight = 6879
        mmLeft = 265
        mmTop = 27252
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape5: TppShape
        UserName = 'rpFolhaFreqShape5'
        Brush.Style = bsClear
        mmHeight = 8202
        mmLeft = 265
        mmTop = 63500
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShapeDia31_1: TppShape
        UserName = 'rpFolhaFreqShapeDia31_1'
        mmHeight = 4763
        mmLeft = 66940
        mmTop = 138907
        mmWidth = 8467
        BandType = 4
      end
      object rpFolhaFreqShape6: TppShape
        UserName = 'rpFolhaFreqShape6'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 71438
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape1: TppShape
        UserName = 'rpFolhaFreqShape1'
        mmHeight = 5292
        mmLeft = 65088
        mmTop = 13229
        mmWidth = 66940
        BandType = 4
      end
      object rpFolhaFreqShape7: TppShape
        UserName = 'rpFolhaFreqShape7'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 75936
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape20: TppShape
        UserName = 'rpFolhaFreqShape20'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 134409
        mmWidth = 66940
        BandType = 4
      end
      object rpFolhaFreqShape19: TppShape
        UserName = 'rpFolhaFreqShape19'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 129911
        mmWidth = 66940
        BandType = 4
      end
      object rpFolhaFreqShape18: TppShape
        UserName = 'rpFolhaFreqShape18'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 125413
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape17: TppShape
        UserName = 'rpFolhaFreqShape17'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 120915
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape16: TppShape
        UserName = 'rpFolhaFreqShape16'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 116417
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape15: TppShape
        UserName = 'rpFolhaFreqShape15'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 111919
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape14: TppShape
        UserName = 'rpFolhaFreqShape14'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 107421
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape13: TppShape
        UserName = 'rpFolhaFreqShape13'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 102923
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape12: TppShape
        UserName = 'rpFolhaFreqShape12'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 98425
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape11: TppShape
        UserName = 'rpFolhaFreqShape11'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 93927
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape10: TppShape
        UserName = 'rpFolhaFreqShape10'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 89429
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape9: TppShape
        UserName = 'rpFolhaFreqShape9'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 84931
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqShape8: TppShape
        UserName = 'rpFolhaFreqShape8'
        mmHeight = 4763
        mmLeft = 265
        mmTop = 80433
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqLbl1: TppLabel
        UserName = 'rpFolhaFreqLbl1'
        AutoSize = False
        Caption = 'FOLHA DE FREQUÊNCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 65617
        mmTop = 13758
        mmWidth = 65881
        BandType = 4
      end
      object rpFolhaFreqLblDia01: TppLabel
        UserName = 'rpFolhaFreqLblDia01'
        AutoSize = False
        Caption = '01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 71702
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia02: TppLabel
        UserName = 'rpFolhaFreqLblDia02'
        AutoSize = False
        Caption = '02'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 76200
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia03: TppLabel
        UserName = 'rpFolhaFreqLblDia03'
        AutoSize = False
        Caption = '03'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 80698
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia04: TppLabel
        UserName = 'rpFolhaFreqLblDia04'
        AutoSize = False
        Caption = '04'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 85196
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia05: TppLabel
        UserName = 'rpFolhaFreqLblDia05'
        AutoSize = False
        Caption = '05'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 89694
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia06: TppLabel
        UserName = 'rpFolhaFreqLblDia06'
        AutoSize = False
        Caption = '06'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 94192
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia07: TppLabel
        UserName = 'rpFolhaFreqLblDia07'
        AutoSize = False
        Caption = '07'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 98690
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia08: TppLabel
        UserName = 'rpFolhaFreqLblDia08'
        AutoSize = False
        Caption = '08'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 103188
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia09: TppLabel
        UserName = 'rpFolhaFreqLblDia09'
        AutoSize = False
        Caption = '09'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 107686
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia10: TppLabel
        UserName = 'rpFolhaFreqLblDia10'
        AutoSize = False
        Caption = '10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 112184
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia11: TppLabel
        UserName = 'rpFolhaFreqLblDia11'
        AutoSize = False
        Caption = '11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 116681
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia12: TppLabel
        UserName = 'rpFolhaFreqLblDia12'
        AutoSize = False
        Caption = '12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 121179
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia13: TppLabel
        UserName = 'rpFolhaFreqLblDia13'
        AutoSize = False
        Caption = '13'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 125677
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia14: TppLabel
        UserName = 'rpFolhaFreqLblDia14'
        AutoSize = False
        Caption = '14'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 130175
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia15: TppLabel
        UserName = 'rpFolhaFreqLblDia15'
        AutoSize = False
        Caption = '15'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 134673
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLbl15: TppLabel
        UserName = 'rpFolhaFreqLbl15'
        AutoSize = False
        Caption = 'Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 65881
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLbl13: TppLabel
        UserName = 'rpFolhaFreqLbl13'
        AutoSize = False
        Caption = 'Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 9525
        mmTop = 67998
        mmWidth = 11906
        BandType = 4
      end
      object rpFolhaFreqLbl14: TppLabel
        UserName = 'rpFolhaFreqLbl14'
        AutoSize = False
        Caption = 'Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 23283
        mmTop = 67998
        mmWidth = 11906
        BandType = 4
      end
      object rpFolhaFreqDBTxt6: TppDBText
        UserName = 'rpFolhaFreqDBTxt6'
        DataField = 'CARGO'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 45244
        mmWidth = 94986
        BandType = 4
      end
      object rpFolhaFreqLine9: TppLine
        UserName = 'rpFolhaFreqLine9'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 71702
        mmLeft = 22225
        mmTop = 67204
        mmWidth = 1058
        BandType = 4
      end
      object rpFolhaFreqLine8: TppLine
        UserName = 'rpFolhaFreqLine8'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 75406
        mmLeft = 8467
        mmTop = 63500
        mmWidth = 794
        BandType = 4
      end
      object rpFolhaFreqLine10: TppLine
        UserName = 'rpFolhaFreqLine10'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 75406
        mmLeft = 35983
        mmTop = 63500
        mmWidth = 1058
        BandType = 4
      end
      object rpFolhaFreqDBTxt2: TppDBText
        UserName = 'rpFolhaFreqDBTxt2'
        DataField = 'CGC'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 23813
        mmWidth = 31485
        BandType = 4
      end
      object rpFolhaFreqDBTxt1: TppDBText
        UserName = 'rpFolhaFreqDBTxt1'
        DataField = 'ESTAB'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 23813
        mmWidth = 94986
        BandType = 4
      end
      object rpFolhaFreqDBTxt5: TppDBText
        UserName = 'rpFolhaFreqDBTxt5'
        DataField = 'EMPREGADO'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 38629
        mmWidth = 94986
        BandType = 4
      end
      object rpFolhaFreqDBTxt4: TppDBText
        UserName = 'rpFolhaFreqDBTxt4'
        DataField = 'UF'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 30427
        mmWidth = 31485
        BandType = 4
      end
      object rpFolhaFreqDBTxt3: TppDBText
        UserName = 'rpFolhaFreqDBTxt3'
        DataField = 'ENDERECO'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 30427
        mmWidth = 94986
        BandType = 4
      end
      object rpFolhaFreqDBTxt7: TppDBText
        UserName = 'rpFolhaFreqDBTxt7'
        DataField = 'MATRICULA'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 45244
        mmWidth = 31485
        BandType = 4
      end
      object rpFolhaFreqDBTxt9: TppDBText
        UserName = 'rpFolhaFreqDBTxt9'
        DataField = 'NOMEHORARIO'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2117
        mmTop = 58473
        mmWidth = 94986
        BandType = 4
      end
      object rpFolhaFreqDBTxt8: TppDBText
        UserName = 'rpFolhaFreqDBTxt8'
        DataField = 'C_CUSTO'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1852
        mmTop = 51858
        mmWidth = 94986
        BandType = 4
      end
      object rpFolhaFreqDBTxt10: TppDBText
        UserName = 'rpFolhaFreqDBTxt10'
        DataField = 'REFERENCIA'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 99748
        mmTop = 58473
        mmWidth = 31485
        BandType = 4
      end
      object rpFolhaFreqLbl16: TppLabel
        UserName = 'rpFolhaFreqLbl16'
        AutoSize = False
        Caption = 'Observações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 37306
        mmTop = 64294
        mmWidth = 16140
        BandType = 4
      end
      object rpFolhaFreqLbl18: TppLabel
        UserName = 'rpFolhaFreqLbl18'
        AutoSize = False
        Caption = 'Horário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 75406
        mmTop = 64029
        mmWidth = 27252
        BandType = 4
      end
      object rpFolhaFreqLbl19: TppLabel
        UserName = 'rpFolhaFreqLbl19'
        AutoSize = False
        Caption = 'Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 76200
        mmTop = 67998
        mmWidth = 11906
        BandType = 4
      end
      object rpFolhaFreqLbl20: TppLabel
        UserName = 'rpFolhaFreqLbl20'
        AutoSize = False
        Caption = 'Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 89959
        mmTop = 67998
        mmWidth = 11906
        BandType = 4
      end
      object rpFolhaFreqLine15: TppLine
        UserName = 'rpFolhaFreqLine15'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 66411
        mmLeft = 102659
        mmTop = 63500
        mmWidth = 1058
        BandType = 4
      end
      object rpFolhaFreqLbl21: TppLabel
        UserName = 'rpFolhaFreqLbl21'
        AutoSize = False
        Caption = 'Observações'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3440
        mmLeft = 103981
        mmTop = 64294
        mmWidth = 15875
        BandType = 4
      end
      object rpFolhaFreqLine14: TppLine
        UserName = 'rpFolhaFreqLine14'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 62442
        mmLeft = 88900
        mmTop = 67469
        mmWidth = 1058
        BandType = 4
      end
      object rpFolhaFreqLbl17: TppLabel
        UserName = 'rpFolhaFreqLbl17'
        AutoSize = False
        Caption = 'Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 67204
        mmTop = 65881
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia16: TppLabel
        UserName = 'rpFolhaFreqLblDia16'
        AutoSize = False
        Caption = '16'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 71702
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia17: TppLabel
        UserName = 'rpFolhaFreqLblDia17'
        AutoSize = False
        Caption = '17'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 76200
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia18: TppLabel
        UserName = 'rpFolhaFreqLblDia18'
        AutoSize = False
        Caption = '18'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 80698
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia19: TppLabel
        UserName = 'rpFolhaFreqLblDia19'
        AutoSize = False
        Caption = '19'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 85196
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia20: TppLabel
        UserName = 'rpFolhaFreqLblDia20'
        AutoSize = False
        Caption = '20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 89694
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia21: TppLabel
        UserName = 'rpFolhaFreqLblDia21'
        AutoSize = False
        Caption = '21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 94192
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia22: TppLabel
        UserName = 'rpFolhaFreqLblDia22'
        AutoSize = False
        Caption = '22'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 98690
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia23: TppLabel
        UserName = 'rpFolhaFreqLblDia23'
        AutoSize = False
        Caption = '23'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 103188
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia24: TppLabel
        UserName = 'rpFolhaFreqLblDia24'
        AutoSize = False
        Caption = '24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 107686
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia25: TppLabel
        UserName = 'rpFolhaFreqLblDia25'
        AutoSize = False
        Caption = '25'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 112184
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia26: TppLabel
        UserName = 'rpFolhaFreqLblDia26'
        AutoSize = False
        Caption = '26'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 116681
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia27: TppLabel
        UserName = 'rpFolhaFreqLblDia27'
        AutoSize = False
        Caption = '27'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 121179
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia28: TppLabel
        UserName = 'rpFolhaFreqLblDia28'
        AutoSize = False
        Caption = '28'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 67204
        mmTop = 125677
        mmWidth = 7938
        BandType = 4
      end
      object rpFolhaFreqLblDia29: TppLabel
        UserName = 'rpFolhaFreqLblDia29'
        AutoSize = False
        Caption = '29'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 130440
        mmWidth = 7408
        BandType = 4
      end
      object rpFolhaFreqLine12: TppLine
        UserName = 'rpFolhaFreqLine12'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 66411
        mmLeft = 75142
        mmTop = 63500
        mmWidth = 794
        BandType = 4
      end
      object rpFolhaFreqLine11: TppLine
        UserName = 'rpFolhaFreqLine11'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 75671
        mmLeft = 66940
        mmTop = 63500
        mmWidth = 794
        BandType = 4
      end
      object rpFolhaFreqLblDia30: TppLabel
        UserName = 'rpFolhaFreqLblDia30'
        AutoSize = False
        Caption = '30'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 134938
        mmWidth = 7408
        BandType = 4
      end
      object rpFolhaFreqLblDia31: TppLabel
        UserName = 'rpFolhaFreqLblDia31'
        AutoSize = False
        Caption = '31'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 67469
        mmTop = 139436
        mmWidth = 7408
        BandType = 4
      end
      object rpFolhaFreqLbl7: TppLabel
        UserName = 'rpFolhaFreqLbl7'
        AutoSize = False
        Caption = 'Horário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 55563
        mmWidth = 22225
        BandType = 4
      end
      object rpFolhaFreqLbl6: TppLabel
        UserName = 'rpFolhaFreqLbl6'
        AutoSize = False
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 48948
        mmWidth = 22225
        BandType = 4
      end
      object rpFolhaFreqLbl5: TppLabel
        UserName = 'rpFolhaFreqLbl5'
        AutoSize = False
        Caption = 'Cargo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 42333
        mmWidth = 22225
        BandType = 4
      end
      object rpFolhaFreqLbl3: TppLabel
        UserName = 'rpFolhaFreqLbl3'
        AutoSize = False
        Caption = 'Endereço'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 27517
        mmWidth = 22225
        BandType = 4
      end
      object rpFolhaFreqLbl2: TppLabel
        UserName = 'rpFolhaFreqLbl2'
        AutoSize = False
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 20902
        mmWidth = 22225
        BandType = 4
      end
      object rpFolhaFreqLine1: TppLine
        UserName = 'rpFolhaFreqLine1'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 13229
        mmLeft = 98161
        mmTop = 20902
        mmWidth = 1588
        BandType = 4
      end
      object rpFolhaFreqLbl8: TppLabel
        UserName = 'rpFolhaFreqLbl8'
        AutoSize = False
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 99748
        mmTop = 20902
        mmWidth = 28840
        BandType = 4
      end
      object rpFolhaFreqLbl9: TppLabel
        UserName = 'rpFolhaFreqLbl9'
        AutoSize = False
        Caption = 'Estado / UF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 99748
        mmTop = 27517
        mmWidth = 28840
        BandType = 4
      end
      object rpFolhaFreqLblEmpregado: TppLabel
        UserName = 'rpFolhaFreqLblEmpregado'
        AutoSize = False
        Caption = 'Empregado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 1852
        mmTop = 35719
        mmWidth = 22225
        BandType = 4
      end
      object rpFolhaFreqLbl10: TppLabel
        UserName = 'rpFolhaFreqLbl10'
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 99748
        mmTop = 42333
        mmWidth = 28840
        BandType = 4
      end
      object rpFolhaFreqLbl11: TppLabel
        UserName = 'rpFolhaFreqLbl11'
        AutoSize = False
        Caption = 'Mês / Ano de Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 2910
        mmLeft = 99748
        mmTop = 55563
        mmWidth = 28840
        BandType = 4
      end
      object rpFolhaFreqLine3: TppLine
        UserName = 'rpFolhaFreqLine3'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6615
        mmLeft = 98161
        mmTop = 42333
        mmWidth = 1588
        BandType = 4
      end
      object rpFolhaFreqLine6: TppLine
        UserName = 'rpFolhaFreqLine6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 6615
        mmLeft = 98161
        mmTop = 55563
        mmWidth = 1058
        BandType = 4
      end
      object rpFolhaFreqTextDia01: TppDBText
        UserName = 'DBText11'
        DataField = 'DIA01'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 71702
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia02: TppDBText
        UserName = 'DBText12'
        DataField = 'DIA02'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 76200
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia03: TppDBText
        UserName = 'DBText13'
        DataField = 'DIA03'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 80698
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia04: TppDBText
        UserName = 'DBText14'
        DataField = 'DIA04'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 85196
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia05: TppDBText
        UserName = 'DBText15'
        DataField = 'DIA05'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 89694
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia06: TppDBText
        UserName = 'DBText16'
        DataField = 'DIA06'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 94192
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia07: TppDBText
        UserName = 'DBText17'
        DataField = 'DIA07'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 98690
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia08: TppDBText
        UserName = 'DBText18'
        DataField = 'DIA08'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 103188
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia09: TppDBText
        UserName = 'DBText19'
        DataField = 'DIA09'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 107686
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia10: TppDBText
        UserName = 'DBText20'
        DataField = 'DIA10'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 112184
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia11: TppDBText
        UserName = 'DBText21'
        DataField = 'DIA11'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 116681
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia12: TppDBText
        UserName = 'DBText22'
        DataField = 'DIA12'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 121179
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia13: TppDBText
        UserName = 'DBText23'
        DataField = 'DIA13'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 125677
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia14: TppDBText
        UserName = 'DBText24'
        DataField = 'DIA14'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 130175
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia15: TppDBText
        UserName = 'DBText25'
        DataField = 'DIA15'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 8996
        mmTop = 134673
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia16: TppDBText
        UserName = 'DBText26'
        DataField = 'DIA16'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 71702
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia17: TppDBText
        UserName = 'DBText27'
        DataField = 'DIA17'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 76200
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia18: TppDBText
        UserName = 'DBText28'
        DataField = 'DIA18'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 80698
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia19: TppDBText
        UserName = 'DBText29'
        DataField = 'DIA19'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 85196
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia20: TppDBText
        UserName = 'DBText30'
        DataField = 'DIA20'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 89694
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia21: TppDBText
        UserName = 'DBText31'
        DataField = 'DIA21'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 94192
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia22: TppDBText
        UserName = 'DBText32'
        DataField = 'DIA22'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 98690
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia23: TppDBText
        UserName = 'DBText33'
        DataField = 'DIA23'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 103188
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia24: TppDBText
        UserName = 'DBText34'
        DataField = 'DIA24'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 107686
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia25: TppDBText
        UserName = 'DBText35'
        DataField = 'DIA25'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 112184
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia26: TppDBText
        UserName = 'DBText36'
        DataField = 'DIA26'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 116681
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia27: TppDBText
        UserName = 'DBText37'
        DataField = 'DIA27'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 121179
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia28: TppDBText
        UserName = 'DBText38'
        DataField = 'DIA28'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 125677
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia29: TppDBText
        UserName = 'rpFolhaFreqTextDia29'
        DataField = 'DIA29'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 130175
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia30: TppDBText
        UserName = 'rpFolhaFreqTextDia30'
        DataField = 'DIA30'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 134673
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqTextDia31: TppDBText
        UserName = 'rpFolhaFreqTextDia31'
        DataField = 'DIA31'
        DataPipeline = ppFolhaFreq
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taCentered
        mmHeight = 4233
        mmLeft = 75671
        mmTop = 139171
        mmWidth = 26723
        BandType = 4
      end
      object rpFolhaFreqLbl12: TppLabel
        UserName = 'rpFolhaFreqLbl12'
        AutoSize = False
        Caption = 'Horário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 8731
        mmTop = 64029
        mmWidth = 27252
        BandType = 4
      end
      object rpFolhaFreqLine7: TppLine
        UserName = 'rpFolhaFreqLine7'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 8731
        mmTop = 67204
        mmWidth = 27252
        BandType = 4
      end
      object rpFolhaFreqLine13: TppLine
        UserName = 'rpFolhaFreqLine13'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 75406
        mmTop = 67204
        mmWidth = 27252
        BandType = 4
      end
      object rpFolhaFreqLine2: TppLine
        UserName = 'rpFolhaFreqLine2'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 265
        mmTop = 42069
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqLine4: TppLine
        UserName = 'rpFolhaFreqLine4'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 265
        mmTop = 48683
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqLine5: TppLine
        UserName = 'rpFolhaFreqLine5'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 265
        mmTop = 55298
        mmWidth = 131763
        BandType = 4
      end
      object rpFolhaFreqDBImage1: TppDBImage
        UserName = 'rpFolhaFreqDBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppIMG
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 15346
        mmLeft = 5027
        mmTop = 4498
        mmWidth = 15610
        BandType = 4
      end
      object rpFolhaFreqShape21: TppShape
        UserName = 'rpFolhaFreqShape21'
        mmHeight = 19844
        mmLeft = 265
        mmTop = 145257
        mmWidth = 132027
        BandType = 4
      end
      object rpFolhaFreqMemoHoraEmpreg: TppMemo
        UserName = 'rpFolhaFreqMemoHoraEmpreg'
        Caption = 
          '     A    partir    de    ____ / ____ / ____   o   empregado    ' +
          'passa   a   cumprir   horário   de   trabalho'#13#10#13#10'     de ___ : _' +
          '__ às ___ : ___ com intervalo para repouso e alimentação de ___ ' +
          ': ___ às ___ : ___'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          
            '     A    partir    de    ____ / ____ / ____   o   empregado    ' +
            'passa   a   cumprir   horário   de   trabalho'
          ''
          
            '     de ___ : ___ às ___ : ___ com intervalo para repouso e alim' +
            'entação de ___ : ___ às ___ : ___')
        Transparent = True
        mmHeight = 11906
        mmLeft = 794
        mmTop = 152136
        mmWidth = 130969
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpFolhaFreqLbl23: TppLabel
        UserName = 'rpFolhaFreqLbl23'
        AutoSize = False
        Caption = 'Confirmo a frequência e as informações acima especificadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4498
        mmLeft = 794
        mmTop = 166423
        mmWidth = 130969
        BandType = 4
      end
      object rpFolhaFreqLbl22: TppLabel
        UserName = 'rpFolhaFreqLbl22'
        AutoSize = False
        Caption = 'ALTERAÇÃO DE HORÁRIO DE TRABALHO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4498
        mmLeft = 794
        mmTop = 146844
        mmWidth = 130969
        BandType = 4
      end
      object rpFolhaFreqShapeDia29_4: TppShape
        UserName = 'Shape6'
        mmHeight = 4763
        mmLeft = 102659
        mmTop = 129911
        mmWidth = 29369
        BandType = 4
      end
      object rpFolhaFreqShapeDia30_4: TppShape
        UserName = 'rpFolhaFreqShapeDia30_4'
        mmHeight = 4763
        mmLeft = 102659
        mmTop = 134409
        mmWidth = 29369
        BandType = 4
      end
      object rpFolhaFreqShapeDia31_4: TppShape
        UserName = 'rpFolhaFreqShapeDia31_4'
        mmHeight = 4763
        mmLeft = 102659
        mmTop = 138907
        mmWidth = 29369
        BandType = 4
      end
      object rpRegFerias: TppRegion
        UserName = 'rpRegFerias'
        mmHeight = 10319
        mmLeft = 794
        mmTop = 172244
        mmWidth = 130969
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object rpFolhaFreqMemo2: TppMemo
          UserName = 'rpFolhaFreqMemo2'
          Caption = 
            'INFORMAÇÕES GERAIS - POSIÇÃO:'#13#10'FÉRIAS ADQUIRIDAS - SALDO:       ' +
            '       PERÍODO:                              A'#13#10
          CharWrap = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Lines.Strings = (
            'INFORMAÇÕES GERAIS - POSIÇÃO:'
            
              'FÉRIAS ADQUIRIDAS - SALDO:              PERÍODO:                ' +
              '              A')
          Transparent = True
          mmHeight = 7144
          mmLeft = 1323
          mmTop = 173832
          mmWidth = 130969
          BandType = 4
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmLeading = 0
        end
        object rpFolhaFreqDBTxt11: TppDBText
          UserName = 'rpFolhaFreqDBTxt11'
          DataField = 'EMISSAO'
          DataPipeline = ppFolhaFreq
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3440
          mmLeft = 52123
          mmTop = 173832
          mmWidth = 17198
          BandType = 4
        end
        object rpFolhaFreqSaldo: TppLabel
          OnPrint = rpFolhaFreqSaldoPrint
          UserName = 'Label55'
          AutoSize = False
          Caption = 'rpFolhaFreqSaldo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 42333
          mmTop = 177536
          mmWidth = 9260
          BandType = 4
        end
        object rpFolhaFreqIni: TppLabel
          UserName = 'Label56'
          AutoSize = False
          Caption = 'rpFolhaFreqIni'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 69586
          mmTop = 177536
          mmWidth = 17727
          BandType = 4
        end
        object rpFolhaFreqFim: TppLabel
          UserName = 'Label57'
          AutoSize = False
          Caption = 'rpFolhaFreqFim'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 95779
          mmTop = 177536
          mmWidth = 19579
          BandType = 4
        end
      end
      object rpFolhaFreqMemoHoraEstag: TppMemo
        UserName = 'rpFolhaFreqMemoHoraEstag'
        Caption = 
          '     A    partir    de    ____ / ____ / ____   o   empregado    ' +
          'passa   a   cumprir   horário   de   trabalho'#13#10#13#10'     de ___ : _' +
          '__ às ___ : ___ com intervalo para repouso e alimentação de ___ ' +
          ': ___ às ___ : ___'#13#10
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          
            '     A    partir    de    ____ / ____ / ____   o   estagiário   ' +
            ' passa   a   cumprir   horário   de   trabalho'
          ''
          '     de ___ : ___ às ___ : ___ ')
        Transparent = True
        mmHeight = 11906
        mmLeft = 794
        mmTop = 152136
        mmWidth = 130969
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object rpFolhaFreqColFootBnd: TppColumnFooterBand
      Visible = False
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
    end
    object rpFolhaFreqSmryBnd: TppSummaryBand
      AfterPrint = rpFolhaFreqSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
    end
  end
  object ppFolhaFreq: TppBDEPipeline
    DataSource = dsFolhaFreq
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'FolhaFreq'
    Left = 217
    Top = 48
    object ppFolhaFreqppField1: TppField
      FieldAlias = 'ESTAB'
      FieldName = 'ESTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField2: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField3: TppField
      FieldAlias = 'ENDERECO'
      FieldName = 'ENDERECO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField4: TppField
      FieldAlias = 'UF'
      FieldName = 'UF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField5: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField6: TppField
      FieldAlias = 'REFERENCIA'
      FieldName = 'REFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField7: TppField
      FieldAlias = 'EMPREGADO'
      FieldName = 'EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField8: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField9: TppField
      FieldAlias = 'C_CUSTO'
      FieldName = 'C_CUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField10: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField11: TppField
      FieldAlias = 'NOMEHORARIO'
      FieldName = 'NOMEHORARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField12: TppField
      FieldAlias = 'EMISSAO'
      FieldName = 'EMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField13: TppField
      FieldAlias = 'PER_AQUI_INI'
      FieldName = 'PER_AQUI_INI'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField14: TppField
      FieldAlias = 'PER_AQUI_FIN'
      FieldName = 'PER_AQUI_FIN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField15: TppField
      FieldAlias = 'DIA01'
      FieldName = 'DIA01'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField16: TppField
      FieldAlias = 'DIA02'
      FieldName = 'DIA02'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField17: TppField
      FieldAlias = 'DIA03'
      FieldName = 'DIA03'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField18: TppField
      FieldAlias = 'DIA04'
      FieldName = 'DIA04'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField19: TppField
      FieldAlias = 'DIA05'
      FieldName = 'DIA05'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField20: TppField
      FieldAlias = 'DIA06'
      FieldName = 'DIA06'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField21: TppField
      FieldAlias = 'DIA07'
      FieldName = 'DIA07'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField22: TppField
      FieldAlias = 'DIA08'
      FieldName = 'DIA08'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField23: TppField
      FieldAlias = 'DIA09'
      FieldName = 'DIA09'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField24: TppField
      FieldAlias = 'DIA10'
      FieldName = 'DIA10'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField25: TppField
      FieldAlias = 'DIA11'
      FieldName = 'DIA11'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField26: TppField
      FieldAlias = 'DIA12'
      FieldName = 'DIA12'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField27: TppField
      FieldAlias = 'DIA13'
      FieldName = 'DIA13'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField28: TppField
      FieldAlias = 'DIA14'
      FieldName = 'DIA14'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField29: TppField
      FieldAlias = 'DIA15'
      FieldName = 'DIA15'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField30: TppField
      FieldAlias = 'DIA16'
      FieldName = 'DIA16'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField31: TppField
      FieldAlias = 'DIA17'
      FieldName = 'DIA17'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField32: TppField
      FieldAlias = 'DIA18'
      FieldName = 'DIA18'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField33: TppField
      FieldAlias = 'DIA19'
      FieldName = 'DIA19'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField34: TppField
      FieldAlias = 'DIA20'
      FieldName = 'DIA20'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField35: TppField
      FieldAlias = 'DIA21'
      FieldName = 'DIA21'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField36: TppField
      FieldAlias = 'DIA22'
      FieldName = 'DIA22'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField37: TppField
      FieldAlias = 'DIA23'
      FieldName = 'DIA23'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField38: TppField
      FieldAlias = 'DIA24'
      FieldName = 'DIA24'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField39: TppField
      FieldAlias = 'DIA25'
      FieldName = 'DIA25'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField40: TppField
      FieldAlias = 'DIA26'
      FieldName = 'DIA26'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField41: TppField
      FieldAlias = 'DIA27'
      FieldName = 'DIA27'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField42: TppField
      FieldAlias = 'DIA28'
      FieldName = 'DIA28'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField43: TppField
      FieldAlias = 'DIA29'
      FieldName = 'DIA29'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField44: TppField
      FieldAlias = 'DIA30'
      FieldName = 'DIA30'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppFolhaFreqppField45: TppField
      FieldAlias = 'DIA31'
      FieldName = 'DIA31'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
  end
  object dsFolhaFreq: TwwDataSource
    DataSet = CdsFolhaFreq
    Left = 217
    Top = 96
  end
  object CdsFeriado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 89
    Top = 64
  end
  object CdsDiasExtras: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 25
    Top = 136
  end
  object CdsFerias: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 89
    Top = 136
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 25
    Top = 192
  end
  object ppIMG: TppBDEPipeline
    DataSource = dsIMG
    CloseDataSource = True
    OpenDataSource = False
    UserName = 'IMG'
    Left = 24
    Top = 90
    object ppIMGppField1: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 0
      DataType = dtBLOB
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object dsIMG: TwwDataSource
    DataSet = CdsIMG
    Left = 24
    Top = 77
  end
  object CdsIMG: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 64
  end
end
