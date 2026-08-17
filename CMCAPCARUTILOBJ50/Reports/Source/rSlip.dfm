inherited RptSlip: TRptSlip
  Left = 525
  Top = 167
  Width = 376
  Height = 351
  Caption = 'RptSlip'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Lista '
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
    BeforeExecute = CmpRptCMBeforeExecute
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptSlip
    LabelEmpresa = Label1
    LabelSistema = Label3
  end
  object PpSlip: TppBDEPipeline
    DataSource = DsSlip
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'PpSlip'
    Left = 229
    Top = 72
  end
  object RptSlip: TppReport
    AutoStop = False
    DataPipeline = PpSlip
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'RptSlip'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 13000
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 285
    Top = 72
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'PpSlip'
    object ppReport1HeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19315
      mmPrintPosition = 0
      object Label1: TppLabel
        UserName = 'Label1'
        Caption = 'CM Soluções Informática'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 112977
        mmTop = 794
        mmWidth = 58473
        BandType = 0
      end
      object Label2: TppLabel
        UserName = 'Label2'
        Caption = 'Emissão de SLIP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 123031
        mmTop = 7938
        mmWidth = 41275
        BandType = 0
      end
    end
    object ppReport1DetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object DBText16: TppDBText
        UserName = 'DBText16'
        AutoSize = True
        DataField = 'PLACONTA'
        DataPipeline = PpSlip
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpSlip'
        mmHeight = 3175
        mmLeft = 4763
        mmTop = 0
        mmWidth = 15346
        BandType = 4
      end
      object DBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'HISTLANCAMENTOCONTABIL'
        DataPipeline = PpSlip
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpSlip'
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 0
        mmWidth = 114565
        BandType = 4
      end
      object DBText19: TppDBText
        UserName = 'DBText19'
        AutoSize = True
        DataField = 'LACVALOR'
        DataPipeline = PpSlip
        DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpSlip'
        mmHeight = 3175
        mmLeft = 231511
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object DBText20: TppDBText
        UserName = 'DBText20'
        AutoSize = True
        DataField = 'PLNPLANIL'
        DataPipeline = PpSlip
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpSlip'
        mmHeight = 3175
        mmLeft = 195792
        mmTop = 0
        mmWidth = 15081
        BandType = 4
      end
      object DBText21: TppDBText
        UserName = 'DBText21'
        AutoSize = True
        DataField = 'LACDEBCRE'
        DataPipeline = PpSlip
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpSlip'
        mmHeight = 3175
        mmLeft = 247121
        mmTop = 0
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText84: TppDBText
        UserName = 'DBText84'
        AutoSize = True
        DataField = 'PLANOME'
        DataPipeline = PpSlip
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpSlip'
        mmHeight = 3175
        mmLeft = 26458
        mmTop = 0
        mmWidth = 13758
        BandType = 4
      end
    end
    object ppReport1FooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object Label3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Contas a Pagar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3440
        mmWidth = 284428
        BandType = 8
      end
      object RptSlipLine1: TppLine
        UserName = 'RptSlipLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1058
        mmWidth = 272000
        BandType = 8
      end
      object RptSlipCalc1: TppSystemVariable
        UserName = 'RptSlipCalc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 132557
        mmTop = 3440
        mmWidth = 18785
        BandType = 8
      end
      object RptSlipCalc2: TppSystemVariable
        UserName = 'RptSlipCalc2'
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
        mmTop = 3440
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppReport1SummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 14023
      mmPrintPosition = 0
    end
    object ppReport1Group1: TppGroup
      BreakName = 'CODDOCUMENTO'
      DataPipeline = PpSlip
      OutlineSettings.CreateNode = True
      NewPage = True
      ReprintOnSubsequentPage = False
      UserName = 'Report1Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpSlip'
      object ppReport1GroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 44715
        mmPrintPosition = 0
        object Label4: TppLabel
          UserName = 'Label4'
          Caption = 'Emitente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 3704
          mmTop = 2381
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object Label5: TppLabel
          UserName = 'Label5'
          Caption = 'Fornecedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 3704
          mmTop = 6879
          mmWidth = 16140
          BandType = 3
          GroupNo = 0
        end
        object DBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'FORNECEDOR'
          DataPipeline = PpSlip
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpSlip'
          mmHeight = 3175
          mmLeft = 34925
          mmTop = 6879
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object Label6: TppLabel
          UserName = 'Label6'
          Caption = 'Número Documento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 3704
          mmTop = 11377
          mmWidth = 29898
          BandType = 3
          GroupNo = 0
        end
        object DBText3: TppDBText
          UserName = 'DBText3'
          AutoSize = True
          DataField = 'NUMDOC'
          DataPipeline = PpSlip
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpSlip'
          mmHeight = 3175
          mmLeft = 34925
          mmTop = 11377
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object Label8: TppLabel
          UserName = 'Label8'
          Caption = 'Histórico Padrão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 3704
          mmTop = 15875
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
        object Label9: TppLabel
          UserName = 'Label9'
          Caption = 'Data do Lançamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 3704
          mmTop = 20373
          mmWidth = 29369
          BandType = 3
          GroupNo = 0
        end
        object DBText6: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'DATALANCTO'
          DataPipeline = PpSlip
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpSlip'
          mmHeight = 3175
          mmLeft = 34660
          mmTop = 20373
          mmWidth = 19050
          BandType = 3
          GroupNo = 0
        end
        object Label10: TppLabel
          UserName = 'Label10'
          Caption = 'Data do Vencimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 61913
          mmTop = 20373
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object DBText7: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'DATAVENCTO'
          DataPipeline = PpSlip
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpSlip'
          mmHeight = 3175
          mmLeft = 92075
          mmTop = 20373
          mmWidth = 19315
          BandType = 3
          GroupNo = 0
        end
        object RptSlipLabel1: TppLabel
          UserName = 'RptSlipLabel1'
          Caption = 'Valor do Documento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 179917
          mmTop = 24871
          mmWidth = 29633
          BandType = 3
          GroupNo = 0
        end
        object DBText8: TppDBText
          UserName = 'DBText8'
          AutoSize = True
          DataField = 'VALOR'
          DataPipeline = PpSlip
          DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpSlip'
          mmHeight = 3175
          mmLeft = 214313
          mmTop = 24871
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object Label13: TppLabel
          UserName = 'Label13'
          Caption = 'Lançado Por:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 3704
          mmTop = 24871
          mmWidth = 18785
          BandType = 3
          GroupNo = 0
        end
        object DBText10: TppDBText
          UserName = 'DBText10'
          AutoSize = True
          DataField = 'USUARIOLANC'
          DataPipeline = PpSlip
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpSlip'
          mmHeight = 3175
          mmLeft = 34660
          mmTop = 24871
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object Label14: TppLabel
          UserName = 'Label14'
          Caption = 'Histórico:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 61913
          mmTop = 24871
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object DBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'HISTORICOCOMPL'
          DataPipeline = PpSlip
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpSlip'
          mmHeight = 3704
          mmLeft = 92075
          mmTop = 24871
          mmWidth = 82815
          BandType = 3
          GroupNo = 0
        end
        object Label15: TppLabel
          UserName = 'Label15'
          Caption = 'Pago Dia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 3704
          mmTop = 29104
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object Label7: TppLabel
          UserName = 'Label7'
          Caption = 'Número do Slip:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 179917
          mmTop = 11377
          mmWidth = 23019
          BandType = 3
          GroupNo = 0
        end
        object DBText4: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'NUMSLIP'
          DataPipeline = PpSlip
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpSlip'
          mmHeight = 3175
          mmLeft = 214313
          mmTop = 11377
          mmWidth = 12435
          BandType = 3
          GroupNo = 0
        end
        object Label12: TppLabel
          UserName = 'Label12'
          Caption = 'Tipo Cobrança:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 179917
          mmTop = 15875
          mmWidth = 21696
          BandType = 3
          GroupNo = 0
        end
        object DBText9: TppDBText
          UserName = 'DBText9'
          AutoSize = True
          DataField = 'DESCRICAO_1'
          DataPipeline = PpSlip
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpSlip'
          mmHeight = 3175
          mmLeft = 214313
          mmTop = 15875
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object Line4: TppLine
          UserName = 'Line4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 265
          mmWidth = 272000
          BandType = 3
          GroupNo = 0
        end
        object Label22: TppLabel
          UserName = 'Label22'
          Caption = 'Planilha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 195792
          mmTop = 41010
          mmWidth = 10583
          BandType = 3
          GroupNo = 0
        end
        object Label23: TppLabel
          UserName = 'Label23'
          Caption = 'Valor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 238919
          mmTop = 41010
          mmWidth = 7673
          BandType = 3
          GroupNo = 0
        end
        object Label25: TppLabel
          UserName = 'Label25'
          Caption = 'Lançamentos Contábeis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 4498
          mmTop = 36513
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object Label20: TppLabel
          UserName = 'Label20'
          Caption = 'Conta Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 4763
          mmTop = 41010
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object Label21: TppLabel
          UserName = 'Label21'
          ShiftWithParent = True
          Caption = 'Histórico'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 80169
          mmTop = 41010
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object Label16: TppLabel
          UserName = 'Label16'
          Caption = 'Tipo de Documento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 179917
          mmTop = 20373
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object DBText12: TppDBText
          UserName = 'DBText12'
          AutoSize = True
          DataField = 'DESCRICAO_2'
          DataPipeline = PpSlip
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpSlip'
          mmHeight = 3175
          mmLeft = 214313
          mmTop = 20373
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object Label17: TppLabel
          UserName = 'Label17'
          Caption = 'Valor a Pagar:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 61913
          mmTop = 29104
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object DBText13: TppDBText
          UserName = 'DBText13'
          AutoSize = True
          DataField = 'SVALOR'
          DataPipeline = PpSlip
          DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpSlip'
          mmHeight = 3175
          mmLeft = 92075
          mmTop = 29104
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object Label18: TppLabel
          UserName = 'Label18'
          Caption = 'Saldo Em Outra Moeda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 179917
          mmTop = 29104
          mmWidth = 33338
          BandType = 3
          GroupNo = 0
        end
        object DBText14: TppDBText
          UserName = 'DBText14'
          AutoSize = True
          DataField = 'SVALOROUTRAMOEDA'
          DataPipeline = PpSlip
          DisplayFormat = 'R$ #,0.00;(R$ #,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpSlip'
          mmHeight = 3175
          mmLeft = 214313
          mmTop = 29104
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object LblEmpresaEmitente: TppLabel
          UserName = 'LblEmpresaEmitente'
          Caption = 'Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 34925
          mmTop = 2381
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object LblHistoricoFinan: TppLabel
          UserName = 'LblHistoricoFinan'
          AutoSize = False
          Caption = 'LblHistoricoFinan'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 35190
          mmTop = 15875
          mmWidth = 139700
          BandType = 3
          GroupNo = 0
        end
        object RptSlipLine6: TppLine
          UserName = 'RptSlipLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 34396
          mmWidth = 272000
          BandType = 3
          GroupNo = 0
        end
        object ppLabel161: TppLabel
          UserName = 'Label201'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 26458
          mmTop = 41010
          mmWidth = 13229
          BandType = 3
          GroupNo = 0
        end
        object ppLabel162: TppLabel
          UserName = 'Label162'
          Caption = 'Telefone Comercial:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 179917
          mmTop = 6879
          mmWidth = 26458
          BandType = 3
          GroupNo = 0
        end
        object ppDBText88: TppDBText
          UserName = 'DBText88'
          AutoSize = True
          DataField = 'TELFORCLI'
          DataPipeline = PpSlip
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'PpSlip'
          mmHeight = 3175
          mmLeft = 214313
          mmTop = 6879
          mmWidth = 15346
          BandType = 3
          GroupNo = 0
        end
      end
      object ppReport1GroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 15081
        mmPrintPosition = 0
        object Label26: TppLabel
          UserName = 'Label26'
          Caption = 'Preparado Por:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 3175
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
        object Lbls1: TppLabel
          UserName = 'Lbls1'
          AutoSize = False
          Caption = 'Lbls1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 7938
          mmWidth = 25135
          BandType = 5
          GroupNo = 0
        end
        object lbls2: TppLabel
          UserName = 'lbls2'
          AutoSize = False
          Caption = 'lbls2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 84138
          mmTop = 7938
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
        end
        object RptSlipLine2: TppLine
          UserName = 'RptSlipLine2'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 27517
          mmTop = 11906
          mmWidth = 55033
          BandType = 5
          GroupNo = 0
        end
        object Line3: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 109802
          mmTop = 11906
          mmWidth = 61383
          BandType = 5
          GroupNo = 0
        end
        object LblUsuario: TppLabel
          UserName = 'LblUsuario'
          Caption = 'LblUsuario'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 28840
          mmTop = 3175
          mmWidth = 13229
          BandType = 5
          GroupNo = 0
        end
        object lbls3: TppLabel
          UserName = 'lbls3'
          AutoSize = False
          Caption = 'lbls3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 172244
          mmTop = 7938
          mmWidth = 23813
          BandType = 5
          GroupNo = 0
        end
        object RptSlipLine3: TppLine
          UserName = 'RptSlipLine3'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 198438
          mmTop = 11906
          mmWidth = 72496
          BandType = 5
          GroupNo = 0
        end
        object RptSlipLine4: TppLine
          UserName = 'RptSlipLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 794
          mmWidth = 272000
          BandType = 5
          GroupNo = 0
        end
        object RptSlipLine5: TppLine
          UserName = 'RptSlipLine5'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 14288
          mmWidth = 272000
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object CdsSlip: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 64
  end
  object SqlSlip: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      '  DOC.CODDOCUMENTO,'
      '  PFORCLI.RAZAOSOCIAL AS FORNECEDOR,'
      '  '#39'('#39' || TL.DDD  || '#39') '#39' || TL.NUMERO AS TELFORCLI,'
      '  DOC.NODOCUMENTO || '#39'/'#39' || DOC.COMPLDOCUMENTO AS NUMDOC,'
      '  DOC.NUMSLIP,'
      '  LAN.DATALANCTO,'
      '  DOC.DATAVENCTO,'
      '  LAN.VALOR,'
      '  PF.DESCRICAO,'
      '  FRP.DESCRICAO,'
      '  U.NOMEUSUARIO AS USUARIOLANC,'
      '  LC.LACDEBCRE,'
      '  LC.PLACONTA,'
      '  PC.PLANOME,'
      '  LC.LACVALOR,'
      '  P.PLNPLANIL,'
      '  LAN.HISTORICOCOMPL,'
      
        '  LC.LACHIST1 || LC.LACHIST2 || LC.LACHIST3 || LC.LACHIST4 || LC' +
        '.LACHIST5 AS HISTLANCAMENTOCONTABIL,'
      '  CODDOC.DESCRICAO,'
      '  0 AS SVALOR,'
      '  0 AS SVALOROUTRAMOEDA'
      'FROM'
      '  PESSOA PFORCLI,'
      '  DOCUMENTO DOC,'
      '  LANCTODOCUM LAN,'
      '  PORTADORFORMA PF,'
      '  FORMARECPAG FRP,'
      '  TIPODOCRECPAG CODDOC,'
      '  USUARIOSISTEMA U,'
      '  ENDPESS EP,'
      '  (SELECT T.IDENDERECO, T.NUMERO, T.DDD'
      '   FROM (SELECT IDENDERECO,MIN(IDTELEFONE) AS IDTELEFONE'
      '         FROM TELENDPESS'
      '         WHERE (TIPO LIKE '#39'%C%'#39')'
      '         GROUP BY IDENDERECO) TT, TELENDPESS T'
      '   WHERE (TT.IDTELEFONE = T.IDTELEFONE)'
      '     AND (TT.IDENDERECO = T.IDENDERECO)'
      '     AND ( 1 = 2)) TL,'
      '  LANCAMENTO LC,'
      '  PLANOCONTA PC,'
      '  PLANILHA P'
      'WHERE'
      '  1=2'
      ' ')
    ClientDataSet = CdsSlip
    Left = 104
    Top = 72
  end
  object DsSlip: TwwDataSource
    DataSet = CdsSlip
    Left = 177
    Top = 75
  end
  object CdsContabPagtos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 136
  end
  object SqlContabPagtos: TCMSqlParams
    ClientDataSet = CdsContabPagtos
    Left = 120
    Top = 136
  end
  object CdsSlipAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 216
  end
  object SqlSlipAux: TCMSqlParams
    ClientDataSet = CdsSlipAux
    Left = 104
    Top = 216
  end
  object SqlTeste: TCMSqlParams
    ClientDataSet = CdsTeste
    Left = 100
    Top = 269
  end
  object CdsTeste: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 26
    Top = 272
  end
end
