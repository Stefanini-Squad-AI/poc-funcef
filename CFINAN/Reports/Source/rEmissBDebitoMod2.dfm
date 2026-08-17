inherited RptEmissBDebitoMod2: TRptEmissBDebitoMod2
  Left = 536
  Top = 200
  Width = 397
  Height = 389
  Caption = 'RptEmissBDebitoMod2'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'NumLote'
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
        Caption = 'Data'
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
      end
      item
        Caption = 'PortForma'
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
    Report = RptBordDebitoMod2
    LabelEmpresa = ppLabel2
  end
  object ppBordDebitoMod2: TppBDEPipeline
    DataSource = DsBordDebitoMod2
    CloseDataSource = True
    UserName = 'BordDebitoMod2'
    Left = 243
    Top = 83
  end
  object DsBordDebitoMod2: TwwDataSource
    DataSet = CdsBordDebitoMod2
    Left = 181
    Top = 83
  end
  object RptBordDebitoMod2: TppReport
    AutoStop = False
    DataPipeline = ppBordDebitoMod2
    OnPrintingComplete = RptBordDebitoMod2PrintingComplete
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 344
    Top = 83
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 15081
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Borderô para Débito em Conta Corrente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 102129
        mmTop = 8731
        mmWidth = 80169
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'ppLabel2'
        Caption = 'Borderô para Débito em Conta Corrente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 95250
        mmTop = 1588
        mmWidth = 93663
        BandType = 0
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 262732
        mmTop = 529
        mmWidth = 21696
        BandType = 0
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 256382
        mmTop = 4498
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object RptBordDebitoMod2DBText1: TppDBText
        UserName = 'RptBordDebitoMod2DBText1'
        DataField = 'NUMAPGR'
        DataPipeline = ppBordDebitoMod2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
      object RptBordDebitoMod2DBText2: TppDBText
        UserName = 'RptBordDebitoMod2DBText2'
        DataField = 'NOME'
        DataPipeline = ppBordDebitoMod2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 43656
        mmTop = 0
        mmWidth = 88636
        BandType = 4
      end
      object RptBordDebitoMod2DBText3: TppDBText
        UserName = 'RptBordDebitoMod2DBText3'
        DataField = 'NUMDOCUMENTO'
        DataPipeline = ppBordDebitoMod2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 132821
        mmTop = 0
        mmWidth = 24342
        BandType = 4
      end
      object RptBordDebitoMod2DBText5: TppDBText
        UserName = 'RptBordDebitoMod2DBText5'
        DataField = 'DESCFORMAPAGTO'
        DataPipeline = ppBordDebitoMod2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 157427
        mmTop = 0
        mmWidth = 49477
        BandType = 4
      end
      object RptBordDebitoMod2DBText4: TppDBText
        UserName = 'RptBordDebitoMod2DBText4'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppBordDebitoMod2
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 274903
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object RgContaBancaria: TppRegion
        UserName = 'RgContaBancaria'
        Brush.Style = bsClear
        Caption = 'RgContaBancaria'
        ParentHeight = True
        Pen.Style = psClear
        mmHeight = 3969
        mmLeft = 206905
        mmTop = 0
        mmWidth = 53181
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object RptBordDebitoMod2DBText6: TppDBText
          UserName = 'RptBordDebitoMod2DBText6'
          DataField = 'NUMBANCO'
          DataPipeline = ppBordDebitoMod2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 207698
          mmTop = 0
          mmWidth = 14552
          BandType = 4
        end
        object RptBordDebitoMod2DBText7: TppDBText
          UserName = 'RptBordDebitoMod2DBText7'
          DataField = 'NUMAGENCIA'
          DataPipeline = ppBordDebitoMod2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 222515
          mmTop = 0
          mmWidth = 12965
          BandType = 4
        end
        object RptBordDebitoMod2DBText8: TppDBText
          UserName = 'RptBordDebitoMod2DBText8'
          DataField = 'CONTAFORNE'
          DataPipeline = ppBordDebitoMod2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 235744
          mmTop = 0
          mmWidth = 23548
          BandType = 4
        end
      end
      object RptBordDebitoMod2DBText9: TppDBText
        UserName = 'RptBordDebitoMod2DBText9'
        DataField = 'CENTRORESPON'
        DataPipeline = ppBordDebitoMod2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 17463
        mmTop = 0
        mmWidth = 25929
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      PrintOnLastPage = False
      mmBottomOffset = 0
      mmHeight = 12171
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object RptBordDebitoMod2Label2: TppLabel
        UserName = 'RptBordDebitoMod2Label2'
        Caption = 'Subtotal Para Débito:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 206111
        mmTop = 794
        mmWidth = 31485
        BandType = 8
      end
      object RptBordDebitoMod2DBCalc1: TppDBCalc
        UserName = 'RptBordDebitoMod2DBCalc1'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppBordDebitoMod2
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 261673
        mmTop = 794
        mmWidth = 23019
        BandType = 8
      end
    end
    object RptBordDebitoMod2SummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object RptBordDebitoMod2Line3: TppLine
        UserName = 'RptBordDebitoMod2Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 7
      end
      object RptBordDebitoMod2Label3: TppLabel
        UserName = 'RptBordDebitoMod2Label3'
        Caption = 'Total Para Débito:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 208227
        mmTop = 794
        mmWidth = 26458
        BandType = 7
      end
      object RptBordDebitoMod2DBCalc2: TppDBCalc
        UserName = 'RptBordDebitoMod2DBCalc2'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppBordDebitoMod2
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 261673
        mmTop = 794
        mmWidth = 23019
        BandType = 7
      end
    end
    object RptBordDebitoMod2Group1: TppGroup
      BreakName = 'NUMLOTE'
      DataPipeline = ppBordDebitoMod2
      UserName = 'RptBordDebitoMod2Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptBordDebitoMod2GroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 32279
        mmPrintPosition = 0
        object RptBordDebitoLabel1: TppLabel
          UserName = 'RptBordDebitoLabel1'
          Caption = 'Borderô Nº:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1852
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoLabel2: TppLabel
          UserName = 'RptBordDebitoLabel2'
          Caption = 'Agência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 10848
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoLabel3: TppLabel
          UserName = 'RptBordDebitoLabel3'
          Caption = 'Banco:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 6350
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoLabel4: TppLabel
          UserName = 'RptBordDebitoLabel4'
          Caption = 'Conta Corrente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 15346
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object LblFraseBord: TppLabel
          UserName = 'LblFraseBord'
          Caption = 
            'Autorizo o débito na conta acima para pagamento referente ao dia' +
            ' no valor total de  do documentos abaixo listados.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 21167
          mmWidth = 196586
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoDBText3: TppDBText
          UserName = 'RptBordDebitoDBText3'
          AutoSize = True
          DataField = 'NOMEBANCOEMPRESA'
          DataPipeline = ppBordDebitoMod2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 65352
          mmTop = 6350
          mmWidth = 41010
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoDBText2: TppDBText
          UserName = 'RptBordDebitoDBText2'
          AutoSize = True
          DataField = 'NUMLOTE'
          DataPipeline = ppBordDebitoMod2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 28840
          mmTop = 1852
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoDBText15: TppDBText
          UserName = 'RptBordDebitoDBText15'
          AutoSize = True
          DataField = 'NOMEAENCIAEMPRESA'
          DataPipeline = ppBordDebitoMod2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 65352
          mmTop = 10848
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoDBText16: TppDBText
          UserName = 'RptBordDebitoDBText16'
          AutoSize = True
          DataField = 'NUMBANCOEMPRESA'
          DataPipeline = ppBordDebitoMod2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 28840
          mmTop = 6350
          mmWidth = 5292
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoDBText17: TppDBText
          UserName = 'RptBordDebitoDBText17'
          AutoSize = True
          DataField = 'NUMAGENCIAEMPRESA'
          DataPipeline = ppBordDebitoMod2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 28840
          mmTop = 10848
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object RptBPagtoDBText1: TppDBText
          UserName = 'RptBPagtoDBText1'
          AutoSize = True
          DataField = 'CONTAEMPRESA'
          DataPipeline = ppBordDebitoMod2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 28840
          mmTop = 15610
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'ppLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoLabel6: TppLabel
          UserName = 'RptBordDebitoLabel6'
          Caption = 'Nome do Favorecido:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 43656
          mmTop = 27781
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoLabel9: TppLabel
          UserName = 'RptBordDebitoLabel9'
          AutoSize = False
          Caption = 'Valor a Pagar:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 264848
          mmTop = 27781
          mmWidth = 19844
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoLabel15: TppLabel
          UserName = 'RptBordDebitoLabel15'
          Caption = 'Ap Nº:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 0
          mmTop = 27781
          mmWidth = 8731
          BandType = 3
          GroupNo = 0
        end
        object RptBPagtoLabel1: TppLabel
          UserName = 'RptBPagtoLabel1'
          Caption = 'CPF/CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 132821
          mmTop = 27781
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoLabel11: TppLabel
          UserName = 'RptBordDebitoLabel11'
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 207434
          mmTop = 27781
          mmWidth = 9525
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoLabel12: TppLabel
          UserName = 'RptBordDebitoLabel12'
          Caption = 'Agência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 222250
          mmTop = 27781
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoLabel13: TppLabel
          UserName = 'RptBordDebitoLabel13'
          Caption = 'Conta Corrente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 235480
          mmTop = 27781
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoMod2Label1: TppLabel
          UserName = 'RptBordDebitoMod2Label1'
          Caption = 'Forma de Pagto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 157427
          mmTop = 27781
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoMod2Line1: TppLine
          UserName = 'RptBordDebitoMod2Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 32014
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoMod2Line2: TppLine
          UserName = 'RptBordDebitoMod2Line2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 27252
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object RptBordDebitoMod2Label4: TppLabel
          UserName = 'RptBordDebitoMod2Label4'
          Caption = 'C. Resp.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 17463
          mmTop = 28046
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
        end
      end
      object RptBordDebitoMod2GroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object SqlBordDebitoMod2: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '-- DADOS DO BORDERÔ E DA CONTA DO DÉBITO'
      '     LP.NUMLOTE,'
      '     BANCOEMPRESA.NUMBANCO AS NUMBANCOEMPRESA,'
      '     PC.RAZAOSOCIAL NOMEBANCOEMPRESA,'
      '     AGENCIAEMPRESA.NUMAGENCIA AS NUMAGENCIAEMPRESA,'
      '     PESSOAAGENCIA.NOME AS NOMEAENCIAEMPRESA,'
      '     PCONTA.NOCONTACORR AS CONTAEMPRESA,'
      '-- DADOS DO DOCUMENTO'
      '     D.CODDOCUMENTO,'
      '     D.NUMFATURA,'
      '     D.NUMAPGR,'
      '     DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOME,'
      '     PA.NUMDOCUMENTO,'
      '     LX.VALOR,'
      '-- FORMA DE PAGAMENTO E DADOS BANCARIOS'
      '     F.FLGDADOSBANCARIOS,'
      '     F.DESCRICAO AS DESCFORMAPAGTO,'
      '     --AG.NUMAGENCIA,'
      '     --PAG.RAZAOSOCIAL AS NOMEAGENCIA,'
      '     --BC.NUMBANCO,'
      '     --PB.RAZAOSOCIAL AS NOMEBANCO,'
      '     --CB.CONTACORRENTE AS CONTAFORNE,'
      '     LP.FLAGEMISSAO,'
      '     PA.RAZAOSOCIAL,'
      '     D.DATAVENCTO,'
      '     D.NODOCUMENTO,'
      '     D.COMPLDOCUMENTO,'
      '     '#39'       '#39' AS NUMBANCO ,'
      '     '#39'                               '#39' AS NOMEBANCO,'
      '     '#39'        '#39' AS NUMAGENCIA,'
      '     '#39'                               '#39' AS NOMEAGENCIA,'
      '     '#39'                '#39' AS CONTAFORNE,'
      '     '#39'                              '#39' AS CENTRORESPON'
      'FROM'
      '     LOTEPAGTO LP,'
      '     DOCUMENTO D,'
      '     LANCTODOCUM LD,'
      '     LOTEXDOCUM LX,'
      '     PORTADORFORMA PF,'
      '     PORTADORCONTA PCONTA,'
      '-- FORMA RECPAG DO DOCUMENTO'
      '     FORMARECPAG F,'
      '-- FORMA RECPAPAG DO PORTADORFORMA ( EMISSAO )'
      '     PESSOA PA,'
      '     PESSOA PC,'
      '     AGENCIABANCARIA AGENCIAEMPRESA,'
      '     BANCO BANCOEMPRESA,'
      '     --CONTABANCARIA CB,'
      '     --AGENCIABANCARIA AG,'
      '     --PESSOA PB,'
      '     --BANCO BC,'
      '     --PESSOA PAG,'
      '     PESSOA PESSOAAGENCIA'
      'WHERE'
      '      (LP.NUMLOTE = :NUMLOTE) AND'
      '      (LD.CODDOCUMENTO = D.CODDOCUMENTO) AND'
      '      (LD.OPERACAO = D.OPERACAO) AND'
      '      (LX.NUMLOTE = LP.NUMLOTE) AND'
      '      (D.CODDOCUMENTO = LX.CODDOCUMENTO) AND'
      '      (PF.CODPORTFORMA = LP.CODPORTFORMA) AND'
      '      (PCONTA.CODPORTADOR = PF.CODPORTADOR) AND'
      '      (F.CODFORMA(+) = D.CODFORMA) AND'
      '      (PA.IDPESSOA = D.IDFORCLI) AND'
      '      (PCONTA.IDAGENCIA       = AGENCIAEMPRESA.IDPESSOA) AND'
      '      (PESSOAAGENCIA.IDPESSOA = AGENCIAEMPRESA.IDPESSOA) AND'
      '      (AGENCIAEMPRESA.IDBANCO = BANCOEMPRESA.IDPESSOA) AND'
      '      (PC.IDPESSOA = BANCOEMPRESA.IDPESSOA)'
      '      --(CB.IDPESSOA(+) = D.IDFORCLI) AND'
      '      --(CB.FLGCONTAPREF(+) = '#39'1'#39') AND'
      '      --(CB.IDAGENCIA = AG.IDPESSOA(+)) AND'
      '      --(AG.IDBANCO = BC.IDPESSOA(+)) AND'
      '      --(BC.IDPESSOA = PB.IDPESSOA(+)) AND'
      '      --(AG.IDPESSOA = PAG.IDPESSOA(+))'
      'ORDER BY'
      '       PA.RAZAOSOCIAL,'
      '       D.DATAVENCTO,'
      '       D.NODOCUMENTO,'
      '       D.COMPLDOCUMENTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' ')
    ClientDataSet = CdsBordDebitoMod2
    Left = 104
    Top = 88
  end
  object CdsBordDebitoMod2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 88
  end
  object SqlBuscaCentroRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DISTINCT C.NOME'
      'FROM'
      ' RATEIODOCUM R, CENTRESPON C'
      'WHERE'
      ' R.CODDOCUMENTO = :CODDOCUMENTO AND'
      ' C.CODCENTRORESPON = R.CODCENTRORESPON AND'
      ' C.IDPESSOA = R.IDPESSOA'
      ''
      ''
      '')
    ClientDataSet = CdsBuscaCentroRespon
    Left = 112
    Top = 168
  end
  object CdsBuscaCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 176
  end
  object SqlBuscaCentroRespon3: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      ' DISTINCT C.NOME'
      'FROM'
      ' RATEIODOCUM R, CENTRESPON C, DOCUMENTO D'
      'WHERE'
      ' D.NUMFATURA = :NUMFATURA AND'
      ' RTRIM(D.OPERACAO) = '#39'1'#39' AND'
      ' --RTRIM(D.STATUS) = '#39'2'#39' AND'
      ' d.NUMFATURA  is not null and'
      ' C.CODCENTRORESPON = R.CODCENTRORESPON AND'
      ' C.IDPESSOA = R.IDPESSOA AND'
      ' D.CODDOCUMENTO = R.CODDOCUMENTO'
      ''
      '')
    ClientDataSet = CdsBuscaCentroRespon3
    Left = 296
    Top = 168
  end
  object CdsBuscaCentroRespon3: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 168
  end
end
