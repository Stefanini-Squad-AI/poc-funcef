inherited RptDemonsRealxContabxFluxo: TRptDemonsRealxContabxFluxo
  Left = 306
  Top = 208
  Width = 416
  Height = 306
  Caption = 'RptDemonsRealxContabxFluxo'
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Demonstrativo de cálculos'
    Params = <
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
        MontaSelect = MontaSelect
        Width = 0
      end
      item
        Caption = 'Periodo'
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
      end
      item
        Caption = 'Exercício'
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
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 200
    FormWidth = 400
  end
  inherited DevRptCM: TExtraOptions
    Excel.AutoConvertToNumber = False
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = ppReport
    LabelEmpresa = lbEmpresa
    LabelSistema = lbSistema
  end
  object ppReport: TppReport
    AutoStop = False
    DataPipeline = pplGrupos
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 184
    Top = 8
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplGrupos'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35719
      mmPrintPosition = 0
      object lbEmpresa: TppLabel
        UserName = 'lbEmpresa'
        Caption = 'Nome fundação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 25665
        mmTop = 3175
        mmWidth = 31792
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Demonstrativo de cálculos do realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4064
        mmLeft = 25665
        mmTop = 8467
        mmWidth = 61172
        BandType = 0
      end
      object lbPeriodo: TppLabel
        UserName = 'lbPeriodo'
        Caption = 'Periodo 1 de 2006'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 25665
        mmTop = 16933
        mmWidth = 28575
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'shpCabGrupo'
        Brush.Color = 14869218
        ParentWidth = True
        Shape = stRoundRect
        mmHeight = 5292
        mmLeft = 0
        mmTop = 29369
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Grupo Orçamentário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 3175
        mmTop = 29898
        mmWidth = 32015
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Tipo de cálculo do realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 118004
        mmTop = 29898
        mmWidth = 43656
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Valor Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 188119
        mmTop = 29898
        mmWidth = 21960
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplLogo
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplLogo'
        mmHeight = 14288
        mmLeft = 6085
        mmTop = 3175
        mmWidth = 15875
        BandType = 0
      end
      object lbDescGrupo: TppLabel
        UserName = 'lbDescGrupo'
        Caption = 'Todos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 25665
        mmTop = 12700
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Valor Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 221986
        mmTop = 29898
        mmWidth = 24606
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 268023
        mmTop = 29898
        mmWidth = 15081
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10848
      mmPrintPosition = 0
      object shpGrupo: TppShape
        UserName = 'Shape1'
        Brush.Style = bsClear
        ParentWidth = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppSubReport: TppSubReport
        OnPrint = ppSubReportPrint
        UserName = 'SubReport'
        DrillDownComponent = shpGrupo
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'pplContas'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 5292
        mmWidth = 284300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = pplContas
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
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
          Left = 224
          Top = 152
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'pplContas'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 7408
            mmPrintPosition = 0
            object ppLine3: TppLine
              UserName = 'Line3'
              Position = lpBottom
              Weight = 0.75
              mmHeight = 3969
              mmLeft = 8731
              mmTop = 2646
              mmWidth = 274903
              BandType = 1
            end
            object ppLabel7: TppLabel
              UserName = 'Label7'
              Caption = 'Código da conta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2879
              mmLeft = 8731
              mmTop = 3175
              mmWidth = 17780
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'Centro de Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 50536
              mmTop = 3175
              mmWidth = 17727
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Plano Previdenciário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 88636
              mmTop = 3175
              mmWidth = 22490
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Patrocinadora'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 133086
              mmTop = 3175
              mmWidth = 15081
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label11'
              Caption = 'Atividade / Projeto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 178065
              mmTop = 3175
              mmWidth = 19844
              BandType = 1
            end
            object ppLabel12: TppLabel
              UserName = 'Label12'
              Caption = 'Valor Contabil'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 230188
              mmTop = 3175
              mmWidth = 15346
              BandType = 1
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Valor Realiz.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2910
              mmLeft = 251619
              mmTop = 3175
              mmWidth = 13758
              BandType = 1
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Diferença'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 2910
              mmLeft = 273315
              mmTop = 3175
              mmWidth = 10583
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 8996
            mmPrintPosition = 0
            object linDrilDrawCompContas: TppLine
              UserName = 'linDrilDrawCompContas'
              Pen.Style = psClear
              ParentWidth = True
              Weight = 0.75
              mmHeight = 3175
              mmLeft = 0
              mmTop = 529
              mmWidth = 284300
              BandType = 4
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'IDCONTAORCAMEN'
              DataPipeline = pplContas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              SuppressRepeatedValues = True
              Transparent = True
              DataPipelineName = 'pplContas'
              mmHeight = 3175
              mmLeft = 8467
              mmTop = 265
              mmWidth = 39952
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'CENTCUSTO'
              DataPipeline = pplContas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplContas'
              mmHeight = 3175
              mmLeft = 50536
              mmTop = 265
              mmWidth = 36777
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'ATIVPROJ'
              DataPipeline = pplContas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplContas'
              mmHeight = 3175
              mmLeft = 178065
              mmTop = 265
              mmWidth = 28840
              BandType = 4
            end
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'NOMEPLANO'
              DataPipeline = pplContas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplContas'
              mmHeight = 3175
              mmLeft = 88636
              mmTop = 265
              mmWidth = 42863
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'NOMEPATRO'
              DataPipeline = pplContas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'pplContas'
              mmHeight = 3175
              mmLeft = 133086
              mmTop = 265
              mmWidth = 42863
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'VALOR'
              DataPipeline = pplContas
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplContas'
              mmHeight = 3175
              mmLeft = 228336
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText11: TppDBText
              UserName = 'DBText11'
              DataField = 'VLRREALIZADO'
              DataPipeline = pplContas
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplContas'
              mmHeight = 3175
              mmLeft = 248180
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'DIFERENCA'
              DataPipeline = pplContas
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'pplContas'
              mmHeight = 3175
              mmLeft = 266701
              mmTop = 265
              mmWidth = 17198
              BandType = 4
            end
            object subCompContas: TppSubReport
              OnPrint = subCompContasPrint
              UserName = 'subCompContas'
              DrillDownComponent = linDrilDrawCompContas
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              TraverseAllData = False
              DataPipelineName = 'pplCompContas'
              mmHeight = 5027
              mmLeft = 0
              mmTop = 3440
              mmWidth = 284300
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport2: TppChildReport
                AutoStop = False
                DataPipeline = pplCompContas
                PrinterSetup.BinName = 'Default'
                PrinterSetup.DocumentName = 'Report'
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
                Left = 200
                Top = 128
                Version = '7.04'
                mmColumnWidth = 0
                DataPipelineName = 'pplCompContas'
                object ppTitleBand2: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 6350
                  mmPrintPosition = 0
                  object ppLine1: TppLine
                    UserName = 'Line1'
                    Position = lpBottom
                    Weight = 0.75
                    mmHeight = 2910
                    mmLeft = 18256
                    mmTop = 2910
                    mmWidth = 265378
                    BandType = 1
                  end
                  object ppLabel1: TppLabel
                    UserName = 'Label1'
                    Caption = 'Plano Contábil'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 18256
                    mmTop = 2381
                    mmWidth = 15875
                    BandType = 1
                  end
                  object ppLabel3: TppLabel
                    UserName = 'Label3'
                    Caption = 'Centro de Custo'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 50536
                    mmTop = 2381
                    mmWidth = 17727
                    BandType = 1
                  end
                  object ppLabel16: TppLabel
                    UserName = 'Label16'
                    Caption = 'Atividade / Projeto'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 178065
                    mmTop = 2381
                    mmWidth = 19844
                    BandType = 1
                  end
                  object ppLabel17: TppLabel
                    UserName = 'Label17'
                    Caption = 'Plano Previdenciario'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 88900
                    mmTop = 2381
                    mmWidth = 22490
                    BandType = 1
                  end
                  object ppLabel18: TppLabel
                    UserName = 'Label18'
                    Caption = 'Patrocinadora'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 133350
                    mmTop = 2381
                    mmWidth = 15081
                    BandType = 1
                  end
                  object ppLabel19: TppLabel
                    UserName = 'Label19'
                    Caption = 'Valor composição'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 263526
                    mmTop = 2381
                    mmWidth = 19579
                    BandType = 1
                  end
                  object ppLabel20: TppLabel
                    UserName = 'Label20'
                    Caption = 'Conta contábil'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 211403
                    mmTop = 2381
                    mmWidth = 15610
                    BandType = 1
                  end
                  object ppLabel21: TppLabel
                    UserName = 'Label21'
                    Caption = 'Valor total da c.contábil'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    mmHeight = 2910
                    mmLeft = 234157
                    mmTop = 2381
                    mmWidth = 25400
                    BandType = 1
                  end
                end
                object ppDetailBand3: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 3969
                  mmPrintPosition = 0
                  object ppDBText13: TppDBText
                    UserName = 'DBText13'
                    DataField = 'DESCPLANO'
                    DataPipeline = pplCompContas
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'pplCompContas'
                    mmHeight = 2910
                    mmLeft = 18256
                    mmTop = 529
                    mmWidth = 27781
                    BandType = 4
                  end
                  object ppDBText14: TppDBText
                    UserName = 'DBText14'
                    DataField = 'VALOR'
                    DataPipeline = pplCompContas
                    DisplayFormat = '#,0.00;-#,0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'pplCompContas'
                    mmHeight = 2910
                    mmLeft = 262467
                    mmTop = 265
                    mmWidth = 20638
                    BandType = 4
                  end
                  object ppDBText15: TppDBText
                    UserName = 'DBText15'
                    DataField = 'NOMEPATRO'
                    DataPipeline = pplCompContas
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'pplCompContas'
                    mmHeight = 3175
                    mmLeft = 133350
                    mmTop = 265
                    mmWidth = 39952
                    BandType = 4
                  end
                  object ppDBText16: TppDBText
                    UserName = 'DBText16'
                    DataField = 'PLANOPREV'
                    DataPipeline = pplCompContas
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'pplCompContas'
                    mmHeight = 3175
                    mmLeft = 88900
                    mmTop = 0
                    mmWidth = 39952
                    BandType = 4
                  end
                  object ppDBText17: TppDBText
                    UserName = 'DBText17'
                    DataField = 'ATIVPROJETO'
                    DataPipeline = pplCompContas
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'pplCompContas'
                    mmHeight = 3175
                    mmLeft = 178065
                    mmTop = 0
                    mmWidth = 31221
                    BandType = 4
                  end
                  object ppDBText18: TppDBText
                    UserName = 'DBText18'
                    DataField = 'CENTROCUSTO'
                    DataPipeline = pplCompContas
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'pplCompContas'
                    mmHeight = 3175
                    mmLeft = 50536
                    mmTop = 265
                    mmWidth = 35454
                    BandType = 4
                  end
                  object ppDBText5: TppDBText
                    UserName = 'DBText5'
                    DataField = 'PLACONTA'
                    DataPipeline = pplCompContas
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'pplCompContas'
                    mmHeight = 2910
                    mmLeft = 211403
                    mmTop = 265
                    mmWidth = 23019
                    BandType = 4
                  end
                  object ppDBText19: TppDBText
                    UserName = 'DBText19'
                    DataField = 'VALORTOTAL'
                    DataPipeline = pplCompContas
                    DisplayFormat = '#,##0.00;-#,##0.00'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Arial'
                    Font.Size = 7
                    Font.Style = []
                    TextAlignment = taRightJustified
                    Transparent = True
                    DataPipelineName = 'pplCompContas'
                    mmHeight = 2910
                    mmLeft = 238919
                    mmTop = 265
                    mmWidth = 20638
                    BandType = 4
                  end
                end
                object ppSummaryBand3: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 12171
                  mmPrintPosition = 0
                  object ppLine5: TppLine
                    UserName = 'Line5'
                    Weight = 0.75
                    mmHeight = 2381
                    mmLeft = 18256
                    mmTop = 265
                    mmWidth = 265378
                    BandType = 7
                  end
                end
                object raCodeModule1: TraCodeModule
                  ProgramStream = {00}
                end
              end
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object ppLine4: TppLine
              UserName = 'Line4'
              Weight = 0.75
              mmHeight = 3969
              mmLeft = 8731
              mmTop = 529
              mmWidth = 274903
              BandType = 7
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Total de relacionamentos:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              mmHeight = 2879
              mmLeft = 8731
              mmTop = 1058
              mmWidth = 28152
              BandType = 7
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'IDCONTAORCAMEN'
              DataPipeline = pplContas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DBCalcType = dcCount
              DataPipelineName = 'pplContas'
              mmHeight = 2910
              mmLeft = 34925
              mmTop = 1058
              mmWidth = 17198
              BandType = 7
            end
          end
          object raCodeModule2: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'NOMEGRUPO'
        DataPipeline = pplGrupos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplGrupos'
        mmHeight = 3810
        mmLeft = 2381
        mmTop = 529
        mmWidth = 102659
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCTIPOCALC'
        DataPipeline = pplGrupos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplGrupos'
        mmHeight = 3704
        mmLeft = 118004
        mmTop = 529
        mmWidth = 43921
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VALOR'
        DataPipeline = pplGrupos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGrupos'
        mmHeight = 3704
        mmLeft = 178594
        mmTop = 529
        mmWidth = 31485
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'VLRREALIZADO'
        DataPipeline = pplGrupos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGrupos'
        mmHeight = 3704
        mmLeft = 215107
        mmTop = 529
        mmWidth = 31485
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'DIFERENCA'
        DataPipeline = pplGrupos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGrupos'
        mmHeight = 3704
        mmLeft = 251619
        mmTop = 529
        mmWidth = 31485
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11642
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 1323
        mmWidth = 284300
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
        mmLeft = 133086
        mmTop = 2117
        mmWidth = 18256
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
        mmTop = 2117
        mmWidth = 26988
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3440
        mmLeft = 258234
        mmTop = 2117
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VALOR'
        DataPipeline = pplGrupos
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGrupos'
        mmHeight = 4233
        mmLeft = 219075
        mmTop = 4498
        mmWidth = 62442
        BandType = 7
      end
    end
    object raCodeModule3: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object pplGrupos: TppDBPipeline
    DataSource = dsGrupos
    UserName = 'lGrupos'
    Left = 24
    Top = 192
    MasterDataPipelineName = 'pplContas'
  end
  object CdsGrupos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 80
  end
  object CdsContas: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 80
    Data = {
      7D0300009619E0BD01000000180000000900060000000300000025010E494443
      4F4E54414F5243414D454E0100490000000100055749445448020002001E000E
      4944475255504F4F5243414D454E08000400000000000943454E54435553544F
      0100490000000100055749445448020002002B00094E4F4D45504C414E4F0100
      490000000100055749445448020002003200094E4F4D45504154524F01004900
      00000100055749445448020002003C00084154495650524F4A01004900000001
      000557494454480200020019000556414C4F5208000400000000000C564C5252
      45414C495A41444F0800040000000000094449464552454E4341080004000000
      000002000D44454641554C545F4F5244455202008200010000000100044C4349
      4404000100090800000000000014303130353030303134393030303030333033
      30340000000000D08C400B313439202D20415544494E05434F4D554D05434F4D
      554D124174697669646164652050616472E36F20321F85EB51B87E49C01F85EB
      51B87E49C0000000000000000000000000143031303530303031343930303030
      3033303330340000000000D08C400B313439202D20415544494E05434F4D554D
      05434F4D554D124174697669646164652050616472E36F203200000000000000
      001F85EB51B87E49C01F85EB51B87E49C0000000001430313035303030313532
      303030303033303330340000000000D08C400B313532202D204153504C410543
      4F4D554D05434F4D554D124174697669646164652050616472E36F20321F85EB
      51B87E49C01F85EB51B87E49C000000000000000000000000014303130353030
      30313532303030303033303330340000000000D08C400B313532202D20415350
      4C4105434F4D554D05434F4D554D124174697669646164652050616472E36F20
      3200000000000000001F85EB51B87E49C01F85EB51B87E49C000000000143031
      3035303030313533303030303033303330340000000000D08C400B313533202D
      204153434F4D05434F4D554D05434F4D554D1241746976696461646520506164
      72E36F20321F85EB51B87E49C01F85EB51B87E49C00000000000000000000000
      001430313035303030313533303030303033303330340000000000D08C400B31
      3533202D204153434F4D05434F4D554D05434F4D554D12417469766964616465
      2050616472E36F203200000000000000001F85EB51B87E49C01F85EB51B87E49
      C0}
  end
  object pplContas: TppDBPipeline
    DataSource = dsContas
    UserName = 'lContas'
    Left = 104
    Top = 192
    object pplContasppField1: TppField
      FieldAlias = 'IDCONTAORCAMEN'
      FieldName = 'IDCONTAORCAMEN'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplContasppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDGRUPOORCAMEN'
      FieldName = 'IDGRUPOORCAMEN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplContasppField3: TppField
      FieldAlias = 'CENTCUSTO'
      FieldName = 'CENTCUSTO'
      FieldLength = 43
      DisplayWidth = 43
      Position = 2
    end
    object pplContasppField4: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 3
    end
    object pplContasppField5: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object pplContasppField6: TppField
      FieldAlias = 'ATIVPROJ'
      FieldName = 'ATIVPROJ'
      FieldLength = 25
      DisplayWidth = 25
      Position = 5
    end
    object pplContasppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplContasppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRREALIZADO'
      FieldName = 'VLRREALIZADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object pplContasppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
  end
  object dsGrupos: TDataSource
    DataSet = CdsGrupos
    Left = 24
    Top = 136
  end
  object dsContas: TDataSource
    DataSet = CdsContas
    Left = 104
    Top = 136
  end
  object CdsLogo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 80
  end
  object pplLogo: TppDBPipeline
    DataSource = dsLogo
    UserName = 'lLogo'
    Left = 200
    Top = 192
  end
  object dsLogo: TDataSource
    DataSet = CdsLogo
    Left = 192
    Top = 136
  end
  object CdsCompContas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 80
  end
  object dsCompContas: TDataSource
    DataSet = CdsCompContas
    Left = 288
    Top = 136
  end
  object pplCompContas: TppDBPipeline
    DataSource = dsCompContas
    UserName = 'lLogo1'
    Left = 288
    Top = 192
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'G.CODGRUPOORC'
      'G.NOMEGRUPOORCAMEN')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOORCAMEN G')
    CamposChave.Strings = (
      'G.CODGRUPOORC'
      'G.IDGRUPOORCAMEN'
      'G.NOMEGRUPOORCAMEN')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '12'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 248
    Top = 8
  end
end
