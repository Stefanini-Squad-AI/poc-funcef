inherited RptTabCID: TRptTabCID
  Left = 240
  Top = 212
  Width = 266
  Height = 269
  Caption = 'RptTabCID'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'NomeEmpresa'
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
        Name = 'NomeEmpresa'
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
        Caption = 'ListaCodCID'
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
        Name = 'ListaCodCID'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpTabCID
    ConnectionType = cntBDE
  end
  object rpTabCID: TppReport
    AutoStop = False
    DataPipeline = ppTabCID
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 207
    Version = '5.5'
    mmColumnWidth = 197300
    object rpTabCIDHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object rpTabCIDLbl1: TppLabel
        UserName = 'rpTabCIDLbl1'
        Caption = 'Listagem da Tabela de CID (Cod. Intl. de Doenças)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 53446
        mmTop = 9790
        mmWidth = 85196
        BandType = 0
      end
      object rpTabCIDLbl2: TppLabel
        UserName = 'rpTabCIDLbl2'
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
      object rpTabCIDLbl3: TppLabel
        UserName = 'rpTabCIDLbl3'
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
        mmLeft = 145521
        mmTop = 10319
        mmWidth = 15346
        BandType = 0
      end
      object rpTabCIDDBTxt1: TppDBText
        UserName = 'rpTabCIDDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppTabCID
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
        mmWidth = 17463
        BandType = 0
      end
      object rpTabCIDCalc1: TppSystemVariable
        UserName = 'rpTabCIDCalc1'
        AutoSize = False
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
        mmWidth = 22225
        BandType = 0
      end
      object rpTabCIDCalc2: TppSystemVariable
        UserName = 'rpTabCIDCalc2'
        AutoSize = False
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
      object rpTabCIDLine1: TppLine
        UserName = 'rpTabCIDLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8467
        mmTop = 22225
        mmWidth = 180446
        BandType = 0
      end
      object rpTabCIDLbl4: TppLabel
        UserName = 'rpTabCIDLbl4'
        AutoSize = False
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 17727
        mmWidth = 20638
        BandType = 0
      end
      object rpTabCIDLbl5: TppLabel
        UserName = 'rpTabCIDLbl5'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 32279
        mmTop = 17727
        mmWidth = 156634
        BandType = 0
      end
    end
    object rpTabCIDDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpTabCIDDBTxt2: TppDBText
        UserName = 'rpTabCIDDBTxt2'
        DataField = 'CODCID'
        DataPipeline = ppTabCID
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 529
        mmWidth = 20638
        BandType = 4
      end
      object rpTabCIDDBTxt3: TppDBText
        UserName = 'rpTabCIDDBTxt3'
        DataField = 'DESCRCID'
        DataPipeline = ppTabCID
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 32279
        mmTop = 529
        mmWidth = 156634
        BandType = 4
      end
    end
    object rpTabCIDSmryBnd: TppSummaryBand
      AfterPrint = rpTabCIDSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 6879
      mmPrintPosition = 0
    end
    object rpTabCIDGrp: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppTabCID
      NewPage = True
      ResetPageNo = True
      UserName = 'rpTabCIDGrp'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpTabCIDGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpTabCIDGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object rpTabCIDLbl6: TppLabel
          UserName = 'rpTabCIDLbl6'
          AutoSize = False
          Caption = 'Total de CID'#39's Listados:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 8467
          mmTop = 6615
          mmWidth = 36777
          BandType = 5
          GroupNo = 0
        end
        object rpTabCIDDBCalc1: TppDBCalc
          UserName = 'rpTabCIDDBCalc1'
          DataField = 'CODCID'
          DataPipeline = ppTabCID
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpTabCIDGrp
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 48419
          mmTop = 6615
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppTabCID: TppBDEPipeline
    DataSource = dsTabCID
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'ppTabCID'
    Left = 207
    Top = 48
  end
  object dsTabCID: TwwDataSource
    DataSet = CdsTabCID
    Left = 207
    Top = 96
  end
  object sqlTabCID: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPRESA,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS TITRELAT,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EMPREGADO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS CARGO,'
      '  '#39'1234567890'#39' AS DATAPLAN,'
      '  '#39'123456789012345678901234567890'#39' AS CARTIDENT,'
      '  '#39'1234567890'#39' AS DATAREAL,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS EXAMINADOR,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ENDERECO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS DESCRCID,'
      '  '#39'1234567'#39' AS CODCID,'
      '   12345 AS AVALIACAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS OBSERVACAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS NOMECIDADE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS ASSINANTE,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '234567890'#39' AS IMAGEM,'
      '  '#39'1234567890'#39' AS OBSAVAL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1=2)')
    ClientDataSet = CdsTabCID
    Left = 207
    Top = 188
  end
  object CdsTabCID: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsTabCIDAfterOpen
    AfterScroll = CdsTabCIDAfterScroll
    Left = 207
    Top = 144
  end
end
