inherited RptSuplemDeduPorGrupoMT: TRptSuplemDeduPorGrupoMT
  Left = 262
  Top = 135
  Width = 263
  Height = 361
  Caption = 'RptSuplemDeduPorGrupoMT'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Suplementações/Deduções - Especial'
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
        Caption = 'Grupo Orçamentário'
        Controle = tcMontaSelect
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
        MontaSelect = msGrupo
        Width = 0
      end
      item
        Caption = 'Operação'
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
    Formheight = 200
    FormWidth = 330
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = Rpt
    LabelEmpresa = lbEmpresa
    LabelSistema = lbSistema
  end
  object Rpt: TppReport
    AutoStop = False
    DataPipeline = pplCds
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 16
    Top = 96
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplCds'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24342
      mmPrintPosition = 0
      object lbEmpresa: TppLabel
        UserName = 'lbEmpresa'
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 23283
        mmTop = 1588
        mmWidth = 17992
        BandType = 0
      end
      object lbDescricao: TppLabel
        UserName = 'lbDescricao'
        Caption = 'Listagem de Suplementações / Deduções Orçamentárias - Especial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 7408
        mmWidth = 105304
        BandType = 0
      end
      object lbAdicionais: TppLabel
        UserName = 'lbAdicionais'
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 23283
        mmTop = 11642
        mmWidth = 13229
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 23018
        mmWidth = 197300
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplCdsImagem
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplCdsImagem'
        mmHeight = 13758
        mmLeft = 4498
        mmTop = 1588
        mmWidth = 15346
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object shpCorZebra: TppShape
        OnPrint = shpCorZebraPrint
        UserName = 'shpCorZebra'
        Brush.Color = 14869218
        Pen.Style = psClear
        mmHeight = 3704
        mmLeft = 4498
        mmTop = 0
        mmWidth = 193146
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'IDALTERORCAMENTO'
        DataPipeline = pplCds
        DisplayFormat = '0######'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 265
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CENTROCUSTO'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 3175
        mmLeft = 17198
        mmTop = 265
        mmWidth = 30692
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'CENTRORESPON'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 3175
        mmLeft = 50800
        mmTop = 265
        mmWidth = 29633
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PLANO'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 3175
        mmLeft = 82815
        mmTop = 265
        mmWidth = 31750
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PATRO'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 3175
        mmLeft = 115623
        mmTop = 265
        mmWidth = 24871
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PEREXERC'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 3175
        mmLeft = 143404
        mmTop = 265
        mmWidth = 10848
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'OPERACAO'
        DataPipeline = pplCds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2910
        mmLeft = 160073
        mmTop = 529
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VALOR'
        DataPipeline = pplCds
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 2910
        mmLeft = 179917
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2646
        mmLeft = 0
        mmTop = 794
        mmWidth = 197300
        BandType = 8
      end
      object lbSistema: TppLabel
        UserName = 'lbSistema'
        Caption = 'lbSistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 1588
        mmWidth = 13494
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 89694
        mmTop = 1588
        mmWidth = 18256
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 258234
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 171186
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'VALOR'
        DataPipeline = pplCds
        DisplayFormat = '#,##0.00;-#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplCds'
        mmHeight = 4233
        mmLeft = 175155
        mmTop = 10054
        mmWidth = 20373
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 153988
        mmTop = 10054
        mmWidth = 19579
        BandType = 7
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDOPERACAO'
      DataPipeline = pplCds
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCds'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Operação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          Transparent = True
          mmHeight = 3641
          mmLeft = 794
          mmTop = 1588
          mmWidth = 14901
          BandType = 3
          GroupNo = 0
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'IDOPERACAO'
          DataPipeline = pplCds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsItalic]
          Transparent = True
          DataPipelineName = 'pplCds'
          mmHeight = 3704
          mmLeft = 16404
          mmTop = 1588
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDGRUPOORCAMEN'
      DataPipeline = pplCds
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplCds'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 14288
        mmPrintPosition = 0
        object ppLine2: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 5027
          mmTop = 10054
          mmWidth = 193146
          BandType = 3
          GroupNo = 0
        end
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          ParentWidth = True
          mmHeight = 5292
          mmLeft = 0
          mmTop = 265
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'NOMEGRUPOORCAMEN'
          DataPipeline = pplCds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplCds'
          mmHeight = 3704
          mmLeft = 794
          mmTop = 1058
          mmWidth = 94192
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'N. Sol.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 5027
          mmTop = 10583
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 17198
          mmTop = 10583
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Centro de Respons.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 50800
          mmTop = 10583
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Plano Previdenciário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 82815
          mmTop = 10583
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Patrocinadora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 115623
          mmTop = 10583
          mmWidth = 15610
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Operação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          mmHeight = 2910
          mmLeft = 160073
          mmTop = 10583
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Período/ Exercício'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          WordWrap = True
          mmHeight = 5821
          mmLeft = 143404
          mmTop = 7673
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 191030
          mmTop = 10583
          mmWidth = 6350
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 5027
          mmTop = 265
          mmWidth = 192088
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'VALOR'
          DataPipeline = pplCds
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplCds'
          mmHeight = 2910
          mmLeft = 179917
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object dsImagem: TDataSource
    DataSet = CdsImagem
    Left = 24
    Top = 216
  end
  object CdsImagem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 160
  end
  object pplCdsImagem: TppBDEPipeline
    DataSource = dsImagem
    UserName = 'lCdsImagem'
    Left = 24
    Top = 264
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 160
  end
  object pplCds: TppDBPipeline
    DataSource = ds
    UserName = 'lCds'
    Left = 104
    Top = 256
  end
  object ds: TDataSource
    DataSet = Cds
    Left = 104
    Top = 208
  end
  object msGrupo: TMontaSelect
    Tag = 2
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'G.CODGRUPOORC'
      'G.NOMEGRUPOORCAMEN')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código do grupo'
      'Nome do grupo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN G')
    CamposChave.Strings = (
      'G.CODGRUPOORC'
      'G.IDGRUPOORCAMEN')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '12'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 169
    Top = 73
  end
end
