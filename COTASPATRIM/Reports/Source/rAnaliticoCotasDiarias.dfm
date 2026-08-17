inherited rptAnaliticoCotasDiarias: TrptAnaliticoCotasDiarias
  Left = 359
  Top = 274
  Width = 512
  Height = 370
  Caption = 'rptAnaliticoCotasDiarias'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório Analítico de Cotas Diárias'
    Params = <
      item
        Caption = 'ativo'
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
        Caption = 'Dtini'
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
        Caption = 'Dtfim'
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
        Caption = 'idSituacao'
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
    Report = rptAnaliticoCotPag
    ConnectionType = cntBDE
  end
  object rptAnaliticoCotPag: TppReport
    AutoStop = False
    DataPipeline = ppBDECota
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 48
    Top = 80
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDECota'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplLogo
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplLogo'
        mmHeight = 13758
        mmLeft = 2381
        mmTop = 2646
        mmWidth = 19579
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = pplLogo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'pplLogo'
        mmHeight = 5842
        mmLeft = 24871
        mmTop = 2646
        mmWidth = 35814
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Relatório de Cotas Diárias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4064
        mmLeft = 24871
        mmTop = 8996
        mmWidth = 40936
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 3969
        mmLeft = 0
        mmTop = 18521
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 14552
      mmPrintPosition = 0
      object ppCota: TppSubReport
        OnPrint = ppCotaPrint
        UserName = 'Cota'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppContaCorrente
        TraverseAllData = False
        DataPipelineName = 'ppBDESaldoDet'
        mmHeight = 6879
        mmLeft = 0
        mmTop = 7673
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport2: TppChildReport
          AutoStop = False
          DataPipeline = ppBDESaldoDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 296
          Top = 200
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDESaldoDet'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 19050
            mmPrintPosition = 0
            object ppShape5: TppShape
              UserName = 'Shape5'
              Brush.Color = clSilver
              Pen.Color = clSilver
              mmHeight = 4763
              mmLeft = 18521
              mmTop = 5027
              mmWidth = 176742
              BandType = 1
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Cotas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 19579
              mmTop = 5556
              mmWidth = 8848
              BandType = 1
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 23283
              mmTop = 10848
              mmWidth = 15240
              BandType = 1
            end
            object ppLabel17: TppLabel
              UserName = 'Label101'
              Caption = 'Qtd Cotas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3810
              mmLeft = 91017
              mmTop = 10848
              mmWidth = 50800
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 144463
              mmTop = 10848
              mmWidth = 50800
              BandType = 1
            end
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = 'Saldo do dia anterior'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3598
              mmLeft = 23283
              mmTop = 15346
              mmWidth = 29506
              BandType = 1
            end
            object ppLine3: TppLine
              UserName = 'Line3'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 23283
              mmTop = 14817
              mmWidth = 172244
              BandType = 1
            end
            object lblCotaSaldoAbertura: TppLabel
              UserName = 'lblCotaSaldoAbertura'
              Caption = 'lblCotaSaldoAbertura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3598
              mmLeft = 144463
              mmTop = 15346
              mmWidth = 50800
              BandType = 1
            end
            object lblCotaQtdCotas: TppLabel
              UserName = 'lblCotaQtdCotas'
              Caption = 'lblCotaQtdCotas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3598
              mmLeft = 91017
              mmTop = 15346
              mmWidth = 50800
              BandType = 1
            end
          end
          object ppDetailBand3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 3969
            mmPrintPosition = 0
            object ppDBText8: TppDBText
              UserName = 'DBText8'
              DataField = 'DESCRICAO'
              DataPipeline = ppBDESaldoDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDESaldoDet'
              mmHeight = 3704
              mmLeft = 23283
              mmTop = 265
              mmWidth = 65881
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'SALDO'
              DataPipeline = ppBDESaldoDet
              DisplayFormat = '#,##0.000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDESaldoDet'
              mmHeight = 3704
              mmLeft = 91017
              mmTop = 265
              mmWidth = 50800
              BandType = 4
            end
            object ppDBText10: TppDBText
              UserName = 'DBText10'
              DataField = 'VALOR'
              DataPipeline = ppBDESaldoDet
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDESaldoDet'
              mmHeight = 3704
              mmLeft = 144463
              mmTop = 265
              mmWidth = 50800
              BandType = 4
            end
          end
          object ppSummaryBand2: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 13758
            mmPrintPosition = 0
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'Total de cotas do ativo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3598
              mmLeft = 23283
              mmTop = 265
              mmWidth = 32131
              BandType = 7
            end
            object ppDBCalc3: TppDBCalc
              UserName = 'DBCalc3'
              DataField = 'VALOR'
              DataPipeline = ppBDESaldoDet
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDESaldoDet'
              mmHeight = 3598
              mmLeft = 144463
              mmTop = 265
              mmWidth = 50800
              BandType = 7
            end
            object ppDBCalc4: TppDBCalc
              UserName = 'DBCalc4'
              DataField = 'SALDO'
              DataPipeline = ppBDESaldoDet
              DisplayFormat = '#,##0.000000'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDESaldoDet'
              mmHeight = 3598
              mmLeft = 91017
              mmTop = 265
              mmWidth = 50800
              BandType = 7
            end
          end
          object raCodeModule3: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
      object ppContaCorrente: TppSubReport
        OnPrint = ppContaCorrentePrint
        UserName = 'ContaCorrente'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'ppBDECCDet'
        mmHeight = 6879
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppBDECCDet
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Left = 280
          Top = 184
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppBDECCDet'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 14288
            mmPrintPosition = 0
            object ppShape3: TppShape
              UserName = 'Shape3'
              Brush.Color = clSilver
              Pen.Color = clSilver
              mmHeight = 4763
              mmLeft = 18522
              mmTop = 0
              mmWidth = 176741
              BandType = 1
            end
            object ppLabel8: TppLabel
              UserName = 'Label8'
              Caption = 'Conta Corrente'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 19578
              mmTop = 529
              mmWidth = 23156
              BandType = 1
            end
            object ppLabel9: TppLabel
              UserName = 'Label9'
              Caption = 'Descrição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 23284
              mmTop = 6085
              mmWidth = 15240
              BandType = 1
            end
            object ppLabel10: TppLabel
              UserName = 'Label10'
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3704
              mmLeft = 91016
              mmTop = 6085
              mmWidth = 50800
              BandType = 1
            end
            object ppLabel11: TppLabel
              UserName = 'Label11'
              Caption = 'Valor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3704
              mmLeft = 144463
              mmTop = 6085
              mmWidth = 50800
              BandType = 1
            end
            object ppLine7: TppLine
              UserName = 'Line7'
              Weight = 0.75
              mmHeight = 265
              mmLeft = 23284
              mmTop = 10054
              mmWidth = 172243
              BandType = 1
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'Saldo de Abertura'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3598
              mmLeft = 23284
              mmTop = 10583
              mmWidth = 25739
              BandType = 1
            end
            object lblCCValor: TppLabel
              UserName = 'lblCCValor'
              Caption = 'lblCCValor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              mmHeight = 3598
              mmLeft = 144463
              mmTop = 10583
              mmWidth = 50800
              BandType = 1
            end
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText5: TppDBText
              UserName = 'DBText5'
              DataField = 'NOME'
              DataPipeline = ppBDECCDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDECCDet'
              mmHeight = 3704
              mmLeft = 23284
              mmTop = 529
              mmWidth = 63765
              BandType = 4
            end
            object ppDBText6: TppDBText
              UserName = 'DBText6'
              DataField = 'TIPO'
              DataPipeline = ppBDECCDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppBDECCDet'
              mmHeight = 3704
              mmLeft = 91016
              mmTop = 529
              mmWidth = 50800
              BandType = 4
            end
            object ppDBText7: TppDBText
              UserName = 'DBText7'
              DataField = 'VALOR'
              DataPipeline = ppBDECCDet
              DisplayFormat = '#,##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'ppBDECCDet'
              mmHeight = 3704
              mmLeft = 144463
              mmTop = 529
              mmWidth = 50800
              BandType = 4
            end
          end
          object ppSummaryBand1: TppSummaryBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {00}
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
      object ppLabel123: TppLabel
        UserName = 'ppLabel123'
        Caption = 'Acompanhamento de Cotas e Fundos Patrimoniais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 3175
        mmWidth = 76200
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
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 93663
        mmTop = 3175
        mmWidth = 20108
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169863
        mmTop = 2646
        mmWidth = 26194
        BandType = 8
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 0
        mmTop = 1323
        mmWidth = 197300
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ppDBText1'
      BreakType = btCustomField
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object ppGroupHeaderBand1: TppGroupHeaderBand
        BeforePrint = ppGroupHeaderBand1BeforePrint
        mmBottomOffset = 0
        mmHeight = 46567
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          Pen.Color = clSilver
          mmHeight = 4763
          mmLeft = 18522
          mmTop = 12700
          mmWidth = 176741
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Saldo de Abertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 23284
          mmTop = 23548
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Entradas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 23284
          mmTop = 27781
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Saídas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 23284
          mmTop = 32015
          mmWidth = 10054
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Saldo Aplicado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          mmHeight = 3704
          mmLeft = 19578
          mmTop = 13229
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object lblSaldoAbertura: TppLabel
          UserName = 'lblSaldoAbertura'
          Caption = 'lblSaldoAbertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3598
          mmLeft = 144463
          mmTop = 23548
          mmWidth = 50800
          BandType = 3
          GroupNo = 0
        end
        object lblEntradas: TppLabel
          UserName = 'lblEntradas'
          Caption = 'lblEntradas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3598
          mmLeft = 144463
          mmTop = 28046
          mmWidth = 50800
          BandType = 3
          GroupNo = 0
        end
        object lblSaidas: TppLabel
          UserName = 'lblSaidas'
          Caption = 'lblSaidas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3598
          mmLeft = 144463
          mmTop = 32279
          mmWidth = 50800
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 9525
          mmTop = 4498
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DTCOTA'
          DataPipeline = ppBDECota
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppBDECota'
          mmHeight = 4233
          mmLeft = 19050
          mmTop = 4498
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'Label20'
          Caption = 'Valor da Cota:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 144198
          mmTop = 5027
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'VALOR'
          DataPipeline = ppBDECota
          DisplayFormat = '#,##0.000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'ppBDECota'
          mmHeight = 4233
          mmLeft = 169334
          mmTop = 5027
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Saldo de Fechamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3598
          mmLeft = 23284
          mmTop = 36248
          mmWidth = 31284
          BandType = 3
          GroupNo = 0
        end
        object lblSaldoAplicFechamento: TppLabel
          UserName = 'lblSaldoAbertura1'
          Caption = 'lblSaldoAplicFechamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3599
          mmLeft = 144463
          mmTop = 36513
          mmWidth = 50800
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3810
          mmLeft = 23284
          mmTop = 18521
          mmWidth = 15240
          BandType = 3
          GroupNo = 0
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 2381
          mmLeft = 23284
          mmTop = 22754
          mmWidth = 172243
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'lblSaldoAbertura2'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3810
          mmLeft = 144463
          mmTop = 18521
          mmWidth = 50800
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppBDECota: TppBDEPipeline
    DataSource = dtsCota
    UserName = 'ppBDECota'
    Left = 48
    Top = 128
  end
  object sqlCota: TCMSqlParams
    SQL.Strings = (
      'SELECT 0 AS DESCRICAO, 0 QTDCOTAS, 0 AS VALOR, 0 as DTCOTA'
      'FROM DUAL'
      'WHERE (1=2)')
    ClientDataSet = cdsCota
    Left = 52
    Top = 280
  end
  object cdsCota: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRICAO'
        DataType = ftFloat
      end
      item
        Name = 'QTDCOTAS'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'DTCOTA'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = cdsCotaAfterOpen
    BeforeScroll = cdsCotaBeforeScroll
    Left = 51
    Top = 227
  end
  object dtsCota: TDataSource
    DataSet = cdsCota
    Left = 50
    Top = 179
  end
  object sqlSaldo: TCMSqlParams
    ClientDataSet = cdsSaldo
    Left = 100
    Top = 280
  end
  object cdsSaldo: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDCPVALORCOTA'
        DataType = ftFloat
      end
      item
        Name = 'IDCPATIVO'
        DataType = ftFloat
      end
      item
        Name = 'QUERYENTRADA'
        DataType = ftMemo
        Size = 1000
      end
      item
        Name = 'DTCOTA'
        DataType = ftDateTime
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'FLGSTATUS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 99
    Top = 227
  end
  object cdsSaldoCota: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'SALDO_ANTERIOR'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 163
    Top = 227
  end
  object sqlSaldoCota: TCMSqlParams
    SQL.Strings = (
      'SELECT SUM(CP.SALDOCOTAS) AS SALDO_ANTERIOR'
      'FROM CPSALDOCONTA CP, CPVALORCOTA CV, CPCONTA CC'
      'WHERE (1=2)'
      'AND CV.FLGVALIDO = '#39'S'#39
      '')
    ClientDataSet = cdsSaldoCota
    Left = 164
    Top = 280
  end
  object sqlSaldoDet: TCMSqlParams
    SQL.Strings = (
      'SELECT 0 AS DESCRICAO, 0 AS SALDO, 0 AS VALOR '
      'FROM DUAL '
      'WHERE (1=2)')
    ClientDataSet = cdsSaldoDet
    Left = 228
    Top = 280
  end
  object cdsSaldoDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DESCRICAO'
        DataType = ftFloat
      end
      item
        Name = 'SALDO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 227
    Top = 227
  end
  object dsSaldoDet: TDataSource
    DataSet = cdsSaldoDet
    Left = 226
    Top = 179
  end
  object ppBDESaldoDet: TppBDEPipeline
    DataSource = dsSaldoDet
    UserName = 'ppBDESaldoDet'
    Left = 224
    Top = 128
    object ppBDESaldoDetppField1: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDESaldoDetppField2: TppField
      FieldAlias = 'SALDO'
      FieldName = 'SALDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDESaldoDetppField3: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
  end
  object sqlCCDet: TCMSqlParams
    SQL.Strings = (
      'SELECT 0 AS NOME, 0 AS TIPO, 0 AS VALOR '
      'FROM DUAL WHERE (1=2)')
    ClientDataSet = cdsCCDet
    Left = 380
    Top = 280
  end
  object cdsCCDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NOME'
        DataType = ftFloat
      end
      item
        Name = 'TIPO'
        DataType = ftFloat
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 379
    Top = 227
  end
  object dsCCDet: TDataSource
    DataSet = cdsCCDet
    Left = 378
    Top = 179
  end
  object ppBDECCDet: TppBDEPipeline
    DataSource = dsCCDet
    UserName = 'ppBDECCDet'
    Left = 376
    Top = 128
  end
  object cdsQuery: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDCPVALORCOTA'
        DataType = ftFloat
      end
      item
        Name = 'IDCPATIVO'
        DataType = ftFloat
      end
      item
        Name = 'QUERYENTRADA'
        DataType = ftMemo
        Size = 1000
      end
      item
        Name = 'DTCOTA'
        DataType = ftDateTime
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'FLGSTATUS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 443
    Top = 227
  end
  object sqlQuery: TCMSqlParams
    ClientDataSet = cdsQuery
    Left = 444
    Top = 280
  end
  object CdsLogo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 152
  end
  object dsLogo: TDataSource
    DataSet = CdsLogo
    Left = 288
    Top = 216
  end
  object pplLogo: TppDBPipeline
    DataSource = dsLogo
    UserName = 'lLogo'
    Left = 288
    Top = 248
  end
  object SqlLogo: TCMSqlParams
    SQL.Strings = (
      'SELECT I.IMAGEM '
      'FROM '
      '   IMAGENS I, '
      '   PESSOA P '
      'WHERE '
      '   (P.IDIMAGEM = I.IDIMAGEM) AND '
      '   (P.IDPESSOA = :IDPESSOA)')
    ClientDataSet = CdsLogo
    Left = 288
    Top = 184
  end
end
