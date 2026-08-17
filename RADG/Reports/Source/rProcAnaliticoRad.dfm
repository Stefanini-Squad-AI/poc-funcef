inherited rptProcAnaliticoRAD: TrptProcAnaliticoRAD
  Left = 317
  Top = 196
  Width = 537
  Height = 269
  Caption = 'rptProcAnaliticoRAD'
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'TipoRelat'
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
    Left = 108
  end
  inherited DevRptCM: TExtraOptions
    Left = 32
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = ppPrincipal
    ConnectionType = cntBDE
    Left = 67
  end
  object DsPrincipal: TDataSource
    DataSet = cdsPrincipal
    Left = 96
    Top = 72
  end
  object cdsPrincipal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 72
  end
  object ppPrincipal: TppReport
    AutoStop = False
    DataPipeline = ppDBPrincipal
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
    Units = utMillimeters
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 160
    Top = 72
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppDBPrincipal'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 33338
      mmPrintPosition = 0
      object ppLblTitulo: TppLabel
        UserName = 'LblTitulo'
        Caption = 'Informação dos Processos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 45773
        mmTop = 23019
        mmWidth = 105834
        BandType = 0
      end
      object ppDBImage3: TppDBImage
        UserName = 'DBImage3'
        MaintainAspectRatio = True
        Stretch = True
        Transparent = True
        DataField = 'IMAGEM'
        DataPipeline = ppLogo
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppLogo'
        mmHeight = 17727
        mmLeft = 1058
        mmTop = 1588
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppLogo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppLogo'
        mmHeight = 4657
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 40132
        BandType = 0
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        AutoSize = True
        DataField = 'NOME'
        DataPipeline = ppLogo
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppLogo'
        mmHeight = 5842
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 16722
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintCount = 1
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 186796
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = 14737632
        ParentWidth = True
        mmHeight = 6879
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'No. do Processo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4657
        mmLeft = 2117
        mmTop = 1058
        mmWidth = 32103
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'IDPROCESSO'
        DataPipeline = ppDBPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 4163
        mmLeft = 36777
        mmTop = 1058
        mmWidth = 26723
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Tipo de processo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 10054
        mmWidth = 39158
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'NOME'
        DataPipeline = ppDBPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 3598
        mmLeft = 1852
        mmTop = 15081
        mmWidth = 128000
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1850
        mmTop = 23813
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'DESCREFERENCIA'
        DataPipeline = ppDBPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 3598
        mmLeft = 1852
        mmTop = 28840
        mmWidth = 128000
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Data de Início'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 135732
        mmTop = 10054
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DATAINIPROCESSO'
        DataPipeline = ppDBPrincipal
        DisplayFormat = 'dd/mm/yyyy hh:nn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 3598
        mmLeft = 135732
        mmTop = 15081
        mmWidth = 60000
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Data de Término Prevista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 135732
        mmTop = 24077
        mmWidth = 44979
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAFIMPREVPROC'
        DataPipeline = ppDBPrincipal
        DisplayFormat = 'dd/mm/yyyy hh:nn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 3598
        mmLeft = 135732
        mmTop = 28840
        mmWidth = 60000
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Data de Término Efetiva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 135732
        mmTop = 37571
        mmWidth = 42069
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DATAFIMPROCESSO'
        DataPipeline = ppDBPrincipal
        DisplayFormat = 'dd/mm/yyyy hh:nn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 3704
        mmLeft = 135732
        mmTop = 42598
        mmWidth = 60000
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Usuário Solicitante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1588
        mmTop = 37835
        mmWidth = 40217
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NOMEUSUARIO'
        DataPipeline = ppDBPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 3598
        mmLeft = 1588
        mmTop = 42598
        mmWidth = 60000
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Situação:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 136261
        mmTop = 1058
        mmWidth = 15875
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'SITUACAO'
        DataPipeline = ppDBPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 3598
        mmLeft = 153459
        mmTop = 1323
        mmWidth = 42069
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Observação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 80698
        mmWidth = 31750
        BandType = 4
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'OBS'
        DataPipeline = ppDBPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 9525
        mmLeft = 1852
        mmTop = 85725
        mmWidth = 193940
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppSubRptFluxo: TppSubReport
        OnPrint = ppSubRptFluxoPrint
        UserName = 'SubRptFluxo'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ParentWidth = False
        TraverseAllData = False
        DataPipelineName = 'ppDBFluxo'
        mmHeight = 6085
        mmLeft = 1852
        mmTop = 100277
        mmWidth = 194469
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = ppDBFluxo
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
          Units = utMillimeters
          Left = 280
          Top = 136
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'ppDBFluxo'
          object ppTitleBand1: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 12435
            mmPrintPosition = 0
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = 'Fluxo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 10
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4191
              mmLeft = 794
              mmTop = 794
              mmWidth = 9398
              BandType = 1
            end
            object ppLine1: TppLine
              UserName = 'Line1'
              Position = lpBottom
              Weight = 0.75
              mmHeight = 2381
              mmLeft = 4498
              mmTop = 10054
              mmWidth = 192882
              BandType = 1
            end
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Etapa'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 4763
              mmTop = 7938
              mmWidth = 8678
              BandType = 1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'Início'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 51594
              mmTop = 7938
              mmWidth = 8340
              BandType = 1
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'Término (previsto)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 80698
              mmTop = 7938
              mmWidth = 27869
              BandType = 1
            end
            object ppLabel21: TppLabel
              UserName = 'Label21'
              Caption = 'Término (efetivo)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 111654
              mmTop = 7938
              mmWidth = 25753
              BandType = 1
            end
            object ppLabel22: TppLabel
              UserName = 'Label22'
              Caption = 'Status'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 141288
              mmTop = 7938
              mmWidth = 9737
              BandType = 1
            end
            object ppLabel23: TppLabel
              UserName = 'Label101'
              Caption = 'Grupo Aprovador'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3810
              mmLeft = 166159
              mmTop = 7938
              mmWidth = 27781
              BandType = 1
            end
            object ppShape2: TppShape
              UserName = 'Shape2'
              Pen.Style = psClear
              mmHeight = 5027
              mmLeft = 76200
              mmTop = 12435
              mmWidth = 197115
              BandType = 1
            end
          end
          object ppHeaderBand3: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand3: TppDetailBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 8731
            mmPrintPosition = 0
            object ppShapeEtapa: TppShape
              OnPrint = ppShapeEtapaPrint
              UserName = 'ShapeEtapa'
              ParentHeight = True
              Pen.Style = psClear
              StretchWithParent = True
              mmHeight = 8731
              mmLeft = 4233
              mmTop = 0
              mmWidth = 193146
              BandType = 4
            end
            object ppShapeDrillDown: TppShape
              UserName = 'ShapeDrillDown'
              Pen.Style = psClear
              mmHeight = 4763
              mmLeft = 4498
              mmTop = 0
              mmWidth = 192088
              BandType = 4
            end
            object ppDBText15: TppDBText
              UserName = 'DBText15'
              DataField = 'ETAPA'
              DataPipeline = ppDBFluxo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBFluxo'
              mmHeight = 3598
              mmLeft = 4763
              mmTop = 0
              mmWidth = 39158
              BandType = 4
            end
            object ppDBText16: TppDBText
              UserName = 'DBText101'
              DataField = 'DATAINIETAPA'
              DataPipeline = ppDBFluxo
              DisplayFormat = 'dd/mm/yyyy hh:nn'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBFluxo'
              mmHeight = 3704
              mmLeft = 51594
              mmTop = 0
              mmWidth = 28046
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'DATAFIMPREV'
              DataPipeline = ppDBFluxo
              DisplayFormat = 'dd/mm/yyyy hh:nn'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBFluxo'
              mmHeight = 3704
              mmLeft = 80698
              mmTop = 0
              mmWidth = 28046
              BandType = 4
            end
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'DATAFIMETAPA'
              DataPipeline = ppDBFluxo
              DisplayFormat = 'dd/mm/yyyy hh:nn'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBFluxo'
              mmHeight = 3704
              mmLeft = 111654
              mmTop = 0
              mmWidth = 28046
              BandType = 4
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'NOMEGRUPO'
              DataPipeline = ppDBFluxo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBFluxo'
              mmHeight = 3704
              mmLeft = 166159
              mmTop = 0
              mmWidth = 30427
              BandType = 4
            end
            object ppDBText20: TppDBText
              UserName = 'DBText20'
              DataField = 'STATUSETAPA'
              DataPipeline = ppDBFluxo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Arial'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'ppDBFluxo'
              mmHeight = 3704
              mmLeft = 141288
              mmTop = 0
              mmWidth = 23548
              BandType = 4
            end
            object ppSubAutoriza: TppSubReport
              OnPrint = ppSubAutorizaPrint
              UserName = 'SubAutoriza'
              DrillDownComponent = ppShapeDrillDown
              ExpandAll = False
              NewPrintJob = False
              OutlineSettings.CreateNode = True
              ParentWidth = False
              TraverseAllData = False
              DataPipelineName = 'ppDBAutoriza'
              mmHeight = 4498
              mmLeft = 51594
              mmTop = 4233
              mmWidth = 144992
              BandType = 4
              mmBottomOffset = 0
              mmOverFlowOffset = 0
              mmStopPosition = 0
              object ppChildReport2: TppChildReport
                AutoStop = False
                DataPipeline = ppDBAutoriza
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
                Units = utMillimeters
                Left = 256
                Top = 112
                Version = '7.04'
                mmColumnWidth = 0
                DataPipelineName = 'ppDBAutoriza'
                object ppTitleBand2: TppTitleBand
                  mmBottomOffset = 0
                  mmHeight = 5292
                  mmPrintPosition = 0
                  object ppLabel11: TppLabel
                    UserName = 'Label11'
                    Caption = 'Data'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Courier New'
                    Font.Size = 9
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3669
                    mmLeft = 34660
                    mmTop = 1058
                    mmWidth = 7620
                    BandType = 1
                  end
                  object ppLabel12: TppLabel
                    UserName = 'Label12'
                    Caption = 'Usuário Aprovador'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Courier New'
                    Font.Size = 9
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3704
                    mmLeft = 794
                    mmTop = 1058
                    mmWidth = 33073
                    BandType = 1
                  end
                  object ppLabel14: TppLabel
                    UserName = 'Label14'
                    Caption = 'Ressalva'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Courier New'
                    Font.Size = 9
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3669
                    mmLeft = 93398
                    mmTop = 1058
                    mmWidth = 15240
                    BandType = 1
                  end
                  object ppLabel16: TppLabel
                    UserName = 'Label16'
                    Caption = 'Status'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Courier New'
                    Font.Size = 9
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3669
                    mmLeft = 67733
                    mmTop = 1058
                    mmWidth = 11430
                    BandType = 1
                  end
                  object ppLabel17: TppLabel
                    UserName = 'Label17'
                    Caption = 'Observação'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Courier New'
                    Font.Size = 9
                    Font.Style = [fsBold]
                    Transparent = True
                    mmHeight = 3669
                    mmLeft = 110861
                    mmTop = 1058
                    mmWidth = 19050
                    BandType = 1
                  end
                  object ppLine2: TppLine
                    UserName = 'Line2'
                    Pen.Color = clGray
                    Position = lpBottom
                    Weight = 0.75
                    mmHeight = 794
                    mmLeft = 529
                    mmTop = 4498
                    mmWidth = 145257
                    BandType = 1
                  end
                end
                object ppDetailBand2: TppDetailBand
                  mmBottomOffset = 0
                  mmHeight = 3704
                  mmPrintPosition = 0
                  object ppDBText9: TppDBText
                    UserName = 'DBText9'
                    DataField = 'DATAHORA'
                    DataPipeline = ppDBAutoriza
                    DisplayFormat = 'DD/MM/YYYY HH:NN'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Courier New'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppDBAutoriza'
                    mmHeight = 3704
                    mmLeft = 34660
                    mmTop = 265
                    mmWidth = 31485
                    BandType = 4
                  end
                  object ppDBText10: TppDBText
                    UserName = 'DBText10'
                    DataField = 'NOMEUSUARIO'
                    DataPipeline = ppDBAutoriza
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Courier New'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppDBAutoriza'
                    mmHeight = 3440
                    mmLeft = 265
                    mmTop = 265
                    mmWidth = 33602
                    BandType = 4
                  end
                  object ppDBText11: TppDBText
                    UserName = 'DBText11'
                    DataField = 'STATUS'
                    DataPipeline = ppDBAutoriza
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Courier New'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    DataPipelineName = 'ppDBAutoriza'
                    mmHeight = 3400
                    mmLeft = 67469
                    mmTop = 265
                    mmWidth = 24077
                    BandType = 4
                  end
                  object ppDBText12: TppDBText
                    UserName = 'DBText12'
                    DataField = 'FLGRESSALVA'
                    DataPipeline = ppDBAutoriza
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Courier New'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    WordWrap = True
                    DataPipelineName = 'ppDBAutoriza'
                    mmHeight = 3400
                    mmLeft = 93398
                    mmTop = 265
                    mmWidth = 14288
                    BandType = 4
                  end
                  object ppDBText13: TppDBText
                    UserName = 'DBText13'
                    DataField = 'OBSAUTORIZA'
                    DataPipeline = ppDBAutoriza
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlack
                    Font.Name = 'Courier New'
                    Font.Size = 8
                    Font.Style = []
                    Transparent = True
                    WordWrap = True
                    DataPipelineName = 'ppDBAutoriza'
                    mmHeight = 3440
                    mmLeft = 110596
                    mmTop = 264
                    mmWidth = 35454
                    BandType = 4
                  end
                end
                object ppSummaryBand2: TppSummaryBand
                  mmBottomOffset = 0
                  mmHeight = 4763
                  mmPrintPosition = 0
                end
              end
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
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Centro de Responsabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 51858
        mmWidth = 51594
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'CRESPON'
        DataPipeline = ppDBPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 3598
        mmLeft = 1852
        mmTop = 56886
        mmWidth = 60000
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Tipo de Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 69321
        mmTop = 51858
        mmWidth = 41010
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'TIPODOC'
        DataPipeline = ppDBPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 3598
        mmLeft = 69321
        mmTop = 56886
        mmWidth = 60000
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 66940
        mmWidth = 27517
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'CCUSTO'
        DataPipeline = ppDBPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 3598
        mmLeft = 1852
        mmTop = 71967
        mmWidth = 60000
        BandType = 4
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 69321
        mmTop = 37571
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'VALOR'
        DataPipeline = ppDBPrincipal
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 3598
        mmLeft = 69321
        mmTop = 42598
        mmWidth = 60000
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Grupo de Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 135732
        mmTop = 51858
        mmWidth = 32015
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'DESCGRUPOPROD'
        DataPipeline = ppDBPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 3598
        mmLeft = 135732
        mmTop = 56886
        mmWidth = 60000
        BandType = 4
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Atividade de Projeto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 69056
        mmTop = 66940
        mmWidth = 39158
        BandType = 4
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'DESCGRUPOPROD'
        DataPipeline = ppDBPrincipal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppDBPrincipal'
        mmHeight = 3598
        mmLeft = 69056
        mmTop = 71967
        mmWidth = 60000
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7144
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'lblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 1852
        mmTop = 265
        mmWidth = 23813
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
        mmLeft = 71967
        mmTop = 265
        mmWidth = 53181
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
        mmLeft = 170657
        mmTop = 265
        mmWidth = 26194
        BandType = 8
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppDBPrincipal: TppDBPipeline
    DataSource = DsPrincipal
    UserName = 'DBPrincipal'
    Left = 192
    Top = 72
    object ppDBPrincipalppField1: TppField
      FieldAlias = 'IDPROCESSO'
      FieldName = 'IDPROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField2: TppField
      FieldAlias = 'IDRADTIPOPROC'
      FieldName = 'IDRADTIPOPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField3: TppField
      FieldAlias = 'IDRADETAPAPROC'
      FieldName = 'IDRADETAPAPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField4: TppField
      FieldAlias = 'DATAINIPROCESSO'
      FieldName = 'DATAINIPROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField5: TppField
      FieldAlias = 'DATAFIMPROCESSO'
      FieldName = 'DATAFIMPROCESSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField6: TppField
      FieldAlias = 'DATAFIMPREVPROC'
      FieldName = 'DATAFIMPREVPROC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField7: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField8: TppField
      FieldAlias = 'OBS'
      FieldName = 'OBS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField9: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField10: TppField
      FieldAlias = 'NOMEETAPA'
      FieldName = 'NOMEETAPA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField11: TppField
      FieldAlias = 'DATAINIETAPA'
      FieldName = 'DATAINIETAPA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField12: TppField
      FieldAlias = 'DATAFIMETAPA'
      FieldName = 'DATAFIMETAPA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField13: TppField
      FieldAlias = 'DATAFIMPREVETAPA'
      FieldName = 'DATAFIMPREVETAPA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField14: TppField
      FieldAlias = 'NOMEUSUARIO'
      FieldName = 'NOMEUSUARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField15: TppField
      FieldAlias = 'DESCREFERENCIA'
      FieldName = 'DESCREFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField16: TppField
      FieldAlias = 'IDREFERENCIA'
      FieldName = 'IDREFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField17: TppField
      FieldAlias = 'FLGSUBSTITUTO'
      FieldName = 'FLGSUBSTITUTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField18: TppField
      FieldAlias = 'CLASSIFICACAO'
      FieldName = 'CLASSIFICACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField19: TppField
      FieldAlias = 'CLASSIFEXIBICAO'
      FieldName = 'CLASSIFEXIBICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField20: TppField
      FieldAlias = 'IDRADETAPA'
      FieldName = 'IDRADETAPA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField21: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField22: TppField
      FieldAlias = 'FLGPODERETORNAR'
      FieldName = 'FLGPODERETORNAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField23: TppField
      FieldAlias = 'FLGPODERECUSAR'
      FieldName = 'FLGPODERECUSAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField24: TppField
      FieldAlias = 'CRESPON'
      FieldName = 'CRESPON'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField25: TppField
      FieldAlias = 'TIPODOC'
      FieldName = 'TIPODOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField26: TppField
      FieldAlias = 'CCUSTO'
      FieldName = 'CCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField27: TppField
      FieldAlias = 'DESCGRUPOPROD'
      FieldName = 'DESCGRUPOPROD'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField28: TppField
      FieldAlias = 'UNIDNEGOC'
      FieldName = 'UNIDNEGOC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField29: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField30: TppField
      FieldAlias = 'FLGACAOAPROVA'
      FieldName = 'FLGACAOAPROVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField31: TppField
      FieldAlias = 'SEQETAPA'
      FieldName = 'SEQETAPA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField32: TppField
      FieldAlias = 'NOMEGRUPO'
      FieldName = 'NOMEGRUPO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppDBPrincipalppField33: TppField
      FieldAlias = 'TERCEIROS'
      FieldName = 'TERCEIROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
  end
  object cdsFluxo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 129
    Top = 106
  end
  object dsFluxo: TDataSource
    DataSet = cdsFluxo
    Left = 97
    Top = 107
  end
  object ppDBFluxo: TppDBPipeline
    DataSource = dsFluxo
    UserName = 'DBFluxo'
    Left = 195
    Top = 108
  end
  object cdsAutoriza: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 141
  end
  object dsAutoriza: TDataSource
    DataSet = cdsAutoriza
    Left = 96
    Top = 143
  end
  object ppDBAutoriza: TppDBPipeline
    DataSource = dsAutoriza
    UserName = 'DBFluxo1'
    Left = 195
    Top = 144
  end
  object cdsLogo: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 69
    Data = {
      900000009619E0BD010000001800000003000000000003000000900006494D41
      47454D04004B0000000200075355425459504502004900070042696E61727900
      0557494454480200020001000B52415A414F534F4349414C0100490000000100
      055749445448020002003C00044E4F4D45010049000000010005574944544802
      0002003C000100044C4349440400010009080000}
  end
  object DsLogo: TDataSource
    DataSet = cdsLogo
    Left = 256
    Top = 71
  end
  object ppLogo: TppDBPipeline
    DataSource = DsLogo
    UserName = 'Logo'
    Left = 331
    Top = 72
    object ppLogoppField1: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppLogoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppLogoppField3: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
  end
end
