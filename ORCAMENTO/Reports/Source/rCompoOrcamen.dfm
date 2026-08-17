inherited rptCompoOrcamen: TrptCompoOrcamen
  Left = 332
  Top = 308
  Height = 146
  Caption = 'rptCompoOrcamen'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Listagem da Composição do Demonstrativo Orçamentário'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Relatório Customizável'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   IDRELATORC, NOMERELATORC '
          'FROM '
          '   RELATORC '
          'ORDER BY '
          '   NOMERELATORC')
        LookupSettings.Chave = 'IDRELATORC'
        LookupSettings.Display = 'NOMERELATORC'
        LookupSettings.Descricao = 'Relatório Customizável'
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
        Caption = ' '
        Controle = tcListBox
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
        ListBoxSettings.Items.Strings = (
          'Deixe o campo acima em branco para imprimir '
          'TODOS os Relatórios')
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 35
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'Aviso'
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
    Formheight = 137
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpCompoOrcamen
    LabelEmpresa = ppLabel198
    LabelSistema = ppLabel201
  end
  object sqlCompoOrcamen: TCMSqlParams
    SQL.Strings = (
      'SELECT                                                         '
      '  R.NOMERELATORC, R.NOMECOMPRELATORC,'
      '  L.IDCONTAORCAMEN, C.NOMECONTAORCAMEN, L.FLGINDENTACAO,'
      '  L.FLGTIPOLINHA, L.NUMDECIMAIS'
      'FROM'
      '  RELATORC R, LINHASRELATORC L, CONTASORCAMEN C'
      'WHERE'
      '  (R.IDRELATORC = L.IDRELATORC) AND'
      '  :IDRELATORC'
      '  (L.IDCONTAORCAMEN = C.IDCONTAORCAMEN) AND'
      '  ((C.FLGATIVA = '#39'A'#39') OR (C.FLGATIVA IS NULL)) AND'
      '  (L.IDPLANOORCAMEN = C.IDPLANOORCAMEN)'
      'ORDER BY'
      '  R.NOMERELATORC, L.IDCONTAORCAMEN'
      ''
      ' ')
    OnFormartParam = sqlCompoOrcamenFormartParam
    ClientDataSet = cdsCompoOrcamen
    Left = 16
    Top = 48
  end
  object cdsCompoOrcamen: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    OnCalcFields = cdsCompoOrcamenCalcFields
    Left = 48
    Top = 48
    object cdsCompoOrcamenNOMERELATORC: TStringField
      FieldName = 'NOMERELATORC'
      Size = 40
    end
    object cdsCompoOrcamenNOMECOMPRELATORC: TStringField
      FieldName = 'NOMECOMPRELATORC'
      Size = 40
    end
    object cdsCompoOrcamenIDCONTAORCAMEN: TStringField
      FieldName = 'IDCONTAORCAMEN'
      Size = 25
    end
    object cdsCompoOrcamenNOMECONTAORCAMEN: TStringField
      FieldName = 'NOMECONTAORCAMEN'
      Size = 60
    end
    object cdsCompoOrcamenFLGINDENTACAO: TStringField
      FieldName = 'FLGINDENTACAO'
      Size = 1
    end
    object cdsCompoOrcamenFLGTIPOLINHA: TStringField
      FieldName = 'FLGTIPOLINHA'
      Size = 1
    end
    object cdsCompoOrcamenNUMDECIMAIS: TFloatField
      FieldName = 'NUMDECIMAIS'
    end
    object cdsCompoOrcamenTIPOLINHA: TStringField
      FieldKind = fkCalculated
      FieldName = 'TIPOLINHA'
      Size = 40
      Calculated = True
    end
  end
  object dsCompoOrcamen: TwwDataSource
    DataSet = cdsCompoOrcamen
    Left = 85
    Top = 49
  end
  object pplCompoOrcamen: TppBDEPipeline
    DataSource = dsCompoOrcamen
    UserName = 'lCompoOrcamen'
    Left = 125
    Top = 49
    object pplCompoOrcamenppField1: TppField
      FieldAlias = 'TIPOLINHA'
      FieldName = 'TIPOLINHA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
  end
  object rpCompoOrcamen: TppReport
    AutoStop = False
    DataPipeline = pplCompoOrcamen
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 165
    Top = 49
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplCompoOrcamen'
    object ppHeaderBand15: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17992
      mmPrintPosition = 0
      object ppLabel153: TppLabel
        UserName = 'ppLabel153'
        Caption = 'Composição dos Demonstrativos Orçamentários'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 49477
        mmTop = 8731
        mmWidth = 98161
        BandType = 0
      end
      object ppLine57: TppLine
        UserName = 'ppLine57'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel198: TppLabel
        UserName = 'ppLabel198'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 82815
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        mmHeight = 5292
        mmLeft = 180711
        mmTop = 2117
        mmWidth = 12965
        BandType = 0
      end
    end
    object ppDetailBand22: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rptCompoOrcamenDBText1: TppDBText
        UserName = 'rptCompoOrcamenDBText1'
        DataField = 'IDCONTAORCAMEN'
        DataPipeline = pplCompoOrcamen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCompoOrcamen'
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 529
        mmWidth = 21167
        BandType = 4
      end
      object rptCompoOrcamenDBText2: TppDBText
        UserName = 'rptCompoOrcamenDBText2'
        DataField = 'NOMECONTAORCAMEN'
        DataPipeline = pplCompoOrcamen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCompoOrcamen'
        mmHeight = 3704
        mmLeft = 32544
        mmTop = 529
        mmWidth = 64294
        BandType = 4
      end
      object rptCompoOrcamenDBText5: TppDBText
        UserName = 'rptCompoOrcamenDBText5'
        DataField = 'NUMDECIMAIS'
        DataPipeline = pplCompoOrcamen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCompoOrcamen'
        mmHeight = 3704
        mmLeft = 99219
        mmTop = 529
        mmWidth = 13494
        BandType = 4
      end
      object rptCompoOrcamenDBText6: TppDBText
        UserName = 'rptCompoOrcamenDBText6'
        DataField = 'FLGINDENTACAO'
        DataPipeline = pplCompoOrcamen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplCompoOrcamen'
        mmHeight = 3704
        mmLeft = 118269
        mmTop = 529
        mmWidth = 9260
        BandType = 4
      end
      object rptCompoOrcamenDBText7: TppDBText
        UserName = 'rptCompoOrcamenDBText7'
        DataField = 'TIPOLINHA'
        DataPipeline = pplCompoOrcamen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCompoOrcamen'
        mmHeight = 3704
        mmLeft = 132027
        mmTop = 529
        mmWidth = 57679
        BandType = 4
      end
    end
    object ppFooterBand15: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine58: TppLine
        UserName = 'ppLine58'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel201: TppLabel
        UserName = 'ppLabel201'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 3175
        mmWidth = 83079
        BandType = 8
      end
      object ppCalc28: TppSystemVariable
        UserName = 'Calc28'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 3175
        mmWidth = 29104
        BandType = 8
      end
      object ppCalc29: TppSystemVariable
        UserName = 'Calc29'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object rptCompoOrcamenGroup1: TppGroup
      BreakName = 'NOMERELATORC'
      DataPipeline = pplCompoOrcamen
      OutlineSettings.CreateNode = True
      UserName = 'rptCompoOrcamenGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCompoOrcamen'
      object rptCompoOrcamenGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object rptCompoOrcamenShape1: TppShape
          UserName = 'rptCompoOrcamenShape1'
          Brush.Color = clSilver
          mmHeight = 6615
          mmLeft = 2117
          mmTop = 794
          mmWidth = 193940
          BandType = 3
          GroupNo = 0
        end
        object rptCompoOrcamenLabel1: TppLabel
          UserName = 'rptCompoOrcamenLabel1'
          Caption = 'Nome do Relatório : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3969
          mmTop = 1852
          mmWidth = 34660
          BandType = 3
          GroupNo = 0
        end
        object rptCompoOrcamenDBText3: TppDBText
          UserName = 'rptCompoOrcamenDBText3'
          DataField = 'NOMERELATORC'
          DataPipeline = pplCompoOrcamen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCompoOrcamen'
          mmHeight = 4233
          mmLeft = 39423
          mmTop = 1852
          mmWidth = 70379
          BandType = 3
          GroupNo = 0
        end
        object rptCompoOrcamenDBText4: TppDBText
          UserName = 'rptCompoOrcamenDBText4'
          DataField = 'NOMECOMPRELATORC'
          DataPipeline = pplCompoOrcamen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplCompoOrcamen'
          mmHeight = 4233
          mmLeft = 114300
          mmTop = 1852
          mmWidth = 80963
          BandType = 3
          GroupNo = 0
        end
        object rptCompoOrcamenLabel2: TppLabel
          UserName = 'rptCompoOrcamenLabel2'
          Caption = ' - '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 4233
          mmLeft = 110596
          mmTop = 1852
          mmWidth = 3175
          BandType = 3
          GroupNo = 0
        end
        object rptCompoOrcamenLabel3: TppLabel
          UserName = 'rptCompoOrcamenLabel3'
          Caption = 'Conta Orçamentária'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 8202
          mmTop = 8467
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object rptCompoOrcamenLabel4: TppLabel
          UserName = 'rptCompoOrcamenLabel4'
          Caption = 'Nº Decimais'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 96309
          mmTop = 8467
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
        object rptCompoOrcamenLabel5: TppLabel
          UserName = 'rptCompoOrcamenLabel5'
          Caption = 'Indentação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 115623
          mmTop = 8467
          mmWidth = 15875
          BandType = 3
          GroupNo = 0
        end
        object rptCompoOrcamenLabel6: TppLabel
          UserName = 'rptCompoOrcamenLabel6'
          Caption = 'Tipo de Linha Separadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 132027
          mmTop = 8467
          mmWidth = 37042
          BandType = 3
          GroupNo = 0
        end
        object rptCompoOrcamenLine1: TppLine
          UserName = 'rptCompoOrcamenLine1'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 7938
          mmTop = 12965
          mmWidth = 182034
          BandType = 3
          GroupNo = 0
        end
      end
      object rptCompoOrcamenGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1323
        mmPrintPosition = 0
      end
    end
  end
  object sqlRelatOrc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  IDRELATORC'
      'FROM'
      '  RELATORC'
      'WHERE '
      '  IDRELATORC = :IDRELATORC')
    ClientDataSet = cdsRelatOrc
    Left = 224
    Top = 48
  end
  object cdsRelatOrc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 264
    Top = 48
  end
end
