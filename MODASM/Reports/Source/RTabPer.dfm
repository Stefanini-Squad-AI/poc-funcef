inherited RptTabPer: TRptTabPer
  Left = 261
  Top = 194
  Width = 256
  Height = 268
  Caption = 'RptTabPer'
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
        Caption = 'ListaCodTipOcMed'
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
        Name = 'ListaCodTipOcMed'
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
    Report = rpTabPer
    ConnectionType = cntBDE
  end
  object rpTabPer: TppReport
    AutoStop = False
    DataPipeline = ppTabPer
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
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
    Left = 199
    Version = '5.5'
    mmColumnWidth = 197300
    object rpTabPerHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object rpTabPerLbl1: TppLabel
        UserName = 'rpTabCIDLbl1'
        Caption = 'Listagem da Tabela de Ocorrências, Testes e Exames'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 50800
        mmTop = 9790
        mmWidth = 90488
        BandType = 0
      end
      object rpTabPerLbl2: TppLabel
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
      object rpTabPerLbl3: TppLabel
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
      object rpTabPerDBTxt1: TppDBText
        UserName = 'rpTabCIDDBTxt1'
        AutoSize = True
        DataField = 'EMPRESA'
        DataPipeline = ppTabPer
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
      object rpTabPerCalc1: TppSystemVariable
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
      object rpTabPerCalc2: TppSystemVariable
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
      object rpTabPerLine: TppLine
        UserName = 'rpTabCIDLine1'
        Pen.Width = 2
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 8731
        mmTop = 26988
        mmWidth = 180446
        BandType = 0
      end
      object rpTabPerLbl4: TppLabel
        UserName = 'rpTabCIDLbl4'
        AutoSize = False
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 8467
        mmTop = 22490
        mmWidth = 45244
        BandType = 0
      end
      object rpTabPerLbl5: TppLabel
        UserName = 'rpTabCIDLbl5'
        AutoSize = False
        Caption = 'Baseado Em'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 54769
        mmTop = 21960
        mmWidth = 19844
        BandType = 0
      end
      object rpTabPerLbl6: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Faixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76200
        mmTop = 17463
        mmWidth = 15346
        BandType = 0
      end
      object rpTabPerLbl7: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = '(Anos)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 76200
        mmTop = 22225
        mmWidth = 15346
        BandType = 0
      end
      object rpTabPerLbl8: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Período'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 17463
        mmWidth = 14288
        BandType = 0
      end
      object rpTabPerLbl9: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = '(Meses)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 22225
        mmWidth = 14288
        BandType = 0
      end
      object rpTabPerLbl10: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Centro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 17463
        mmWidth = 15346
        BandType = 0
      end
      object rpTabPerLbl11: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 22225
        mmWidth = 15346
        BandType = 0
      end
      object rpTabPerLbl12: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Cargo (Em Branco, para todos)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 125942
        mmTop = 22490
        mmWidth = 63236
        BandType = 0
      end
    end
    object rpTabPerDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object rpTabPerDBTxt2: TppDBText
        UserName = 'rpTabCIDDBTxt2'
        DataField = 'DESCRTIPOOCMED'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 8202
        mmTop = 529
        mmWidth = 45244
        BandType = 4
      end
      object rpTabPerDBTxt3: TppDBText
        UserName = 'rpTabCIDDBTxt3'
        DataField = 'LIMINFERIOR'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 76200
        mmTop = 529
        mmWidth = 6350
        BandType = 4
      end
      object rpTabPerDBTxt4: TppDBText
        UserName = 'DBText4'
        DataField = 'LIMSUPERIOR'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 85725
        mmTop = 529
        mmWidth = 5821
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'PERIODO'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 93134
        mmTop = 529
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText2'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 109009
        mmTop = 529
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText3'
        DataField = 'CARGO'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 529
        mmWidth = 63236
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'BASEADOEM'
        DataPipeline = ppTabPer
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 54769
        mmTop = 529
        mmWidth = 19844
        BandType = 4
      end
    end
    object rpTabPerSmryBnd: TppSummaryBand
      AfterPrint = rpTabPerSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
    end
    object rpTabPerGroup: TppGroup
      BreakName = 'EMPRESA'
      DataPipeline = ppTabPer
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpTabPerGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object rpTabPerGrpFootBnd: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 12965
        mmPrintPosition = 0
        object rpTabPerLbl13: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Total de Tipos de Exame (e suas variações):'
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
          mmWidth = 66146
          BandType = 5
          GroupNo = 0
        end
        object rpTabPerDBCalc: TppDBCalc
          UserName = 'rpTabPerDBCalc'
          DataField = 'CODTIPOOCMED'
          DataPipeline = ppTabPer
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpTabPerGroup
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3704
          mmLeft = 75936
          mmTop = 6615
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object ppTabPer: TppBDEPipeline
    DataSource = dsTabPer
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'TabPer'
    Left = 199
    Top = 48
  end
  object dsTabPer: TwwDataSource
    DataSet = CdsTabPer
    Left = 199
    Top = 96
  end
  object sqlTabPer: TCMSqlParams
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
    ClientDataSet = CdsTabPer
    Left = 199
    Top = 192
  end
  object CdsTabPer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsTabPerAfterOpen
    AfterScroll = CdsTabPerAfterScroll
    Left = 199
    Top = 144
  end
end
