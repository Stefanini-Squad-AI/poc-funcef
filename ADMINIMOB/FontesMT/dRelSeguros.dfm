inherited dtmRelSeguros: TdtmRelSeguros
  Left = 307
  Top = 293
  Width = 346
  Height = 159
  Caption = 'dtmRelSeguros'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Extrato de Lançamentos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'idImovel'
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
        Name = 'idImovel'
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
        Caption = 'idSeguradora'
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
        Name = 'idSeguradora'
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
        Caption = 'iTipo'
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
        Name = 'iTipo'
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
    Formheight = 300
    FormWidth = 500
    Left = 148
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rptSeguros
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  object dsSeguros: TwwDataSource
    DataSet = cdsSeguros
    Left = 88
    Top = 72
  end
  object pplSeguros: TppBDEPipeline
    DataSource = dsSeguros
    UserName = 'lSeguros'
    Left = 152
    Top = 72
    object pplSegurosppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDSEGUROIMOVEL'
      FieldName = 'IDSEGUROIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplSegurosppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object pplSegurosppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMOVELMESTRE'
      FieldName = 'IDIMOVELMESTRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplSegurosppField4: TppField
      FieldAlias = 'IMOVEL_EXTENSO'
      FieldName = 'IMOVEL_EXTENSO'
      FieldLength = 123
      DisplayWidth = 123
      Position = 3
    end
    object pplSegurosppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDSEGURADORA'
      FieldName = 'IDSEGURADORA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplSegurosppField6: TppField
      FieldAlias = 'NF_SEGURADORA'
      FieldName = 'NF_SEGURADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object pplSegurosppField7: TppField
      FieldAlias = 'RS_SEGURADORA'
      FieldName = 'RS_SEGURADORA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object pplSegurosppField8: TppField
      FieldAlias = 'SGIAPOLICE'
      FieldName = 'SGIAPOLICE'
      FieldLength = 25
      DisplayWidth = 25
      Position = 7
    end
    object pplSegurosppField9: TppField
      FieldAlias = 'SGIREGISTRO'
      FieldName = 'SGIREGISTRO'
      FieldLength = 25
      DisplayWidth = 25
      Position = 8
    end
    object pplSegurosppField10: TppField
      FieldAlias = 'SGIDATAINI'
      FieldName = 'SGIDATAINI'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object pplSegurosppField11: TppField
      FieldAlias = 'SGIDATAFIM'
      FieldName = 'SGIDATAFIM'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 10
    end
    object pplSegurosppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'SGIVLRSEGURO'
      FieldName = 'SGIVLRSEGURO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplSegurosppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'SGIVLRPREMIO'
      FieldName = 'SGIVLRPREMIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplSegurosppField14: TppField
      FieldAlias = 'SGIRESPSEGURO'
      FieldName = 'SGIRESPSEGURO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 13
    end
    object pplSegurosppField15: TppField
      FieldAlias = 'SGIRESPOUTROS'
      FieldName = 'SGIRESPOUTROS'
      FieldLength = 200
      DisplayWidth = 200
      Position = 14
    end
    object pplSegurosppField16: TppField
      FieldAlias = 'STATUS'
      FieldName = 'STATUS'
      FieldLength = 9
      DisplayWidth = 9
      Position = 15
    end
    object pplSegurosppField17: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 2000
      DataType = dtMemo
      DisplayWidth = 10
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplSegurosppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'LMI_TOTAL'
      FieldName = 'LMI_TOTAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object pplSegurosppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'LMI_FUNDACAO'
      FieldName = 'LMI_FUNDACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object pplSegurosppField20: TppField
      FieldAlias = 'NOMECOBERTURA'
      FieldName = 'NOMECOBERTURA'
      FieldLength = 80
      DisplayWidth = 80
      Position = 19
    end
    object pplSegurosppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRCOBERTURA'
      FieldName = 'VLRCOBERTURA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object pplSegurosppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRFUNDACAO'
      FieldName = 'VLRFUNDACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
  end
  object rptSeguros: TppReport
    AutoStop = False
    DataPipeline = pplSeguros
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
    DeviceType = 'Screen'
    ModalPreview = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 216
    Top = 8
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplSeguros'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19315
      mmPrintPosition = 0
      object lblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1588
        mmWidth = 197380
        BandType = 0
      end
      object ppLabel148: TppLabel
        UserName = 'ppLabel148'
        AutoSize = False
        Caption = 'Seguros de Imóveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 0
        mmTop = 8731
        mmWidth = 197380
        BandType = 0
      end
      object ppLogoTipo: TppImage
        UserName = 'ppLogoTipo'
        MaintainAspectRatio = False
        Stretch = True
        mmHeight = 15610
        mmLeft = 265
        mmTop = 0
        mmWidth = 15611
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 2646
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 15875
      mmPrintPosition = 0
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLRCOBERTURA'
        DataPipeline = pplSeguros
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSeguros'
        mmHeight = 3175
        mmLeft = 141288
        mmTop = 265
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'VLRFUNDACAO'
        DataPipeline = pplSeguros
        DisplayFormat = '###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplSeguros'
        mmHeight = 3175
        mmLeft = 169863
        mmTop = 265
        mmWidth = 23813
        BandType = 4
      end
      object ppDBMemo9: TppDBMemo
        UserName = 'ppDBMemo9'
        CharWrap = True
        DataField = 'NOMECOBERTURA'
        DataPipeline = pplSeguros
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplSeguros'
        mmHeight = 15875
        mmLeft = 20108
        mmTop = 265
        mmWidth = 120650
        BandType = 4
        mmBottomOffset = 529
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object lblSistema: TppLabel
        UserName = 'lblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 65617
        BandType = 8
      end
      object ppLine41: TppLine
        UserName = 'ppLine41'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppCalc27: TppSystemVariable
        UserName = 'Calc27'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 88900
        mmTop = 3175
        mmWidth = 43392
        BandType = 8
      end
      object ppCalc28: TppSystemVariable
        UserName = 'Calc28'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 162190
        mmTop = 3175
        mmWidth = 35454
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'IDSEGUROIMOVEL'
      DataPipeline = pplSeguros
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplSeguros'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 33867
        mmPrintPosition = 0
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Imóvel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 794
          mmWidth = 14023
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Seguradora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 794
          mmTop = 5556
          mmWidth = 17992
          BandType = 3
          GroupNo = 0
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'IMOVEL_EXTENSO'
          DataPipeline = pplSeguros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplSeguros'
          mmHeight = 4233
          mmLeft = 20638
          mmTop = 794
          mmWidth = 120650
          BandType = 3
          GroupNo = 0
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'RS_SEGURADORA'
          DataPipeline = pplSeguros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplSeguros'
          mmHeight = 4233
          mmLeft = 20638
          mmTop = 5556
          mmWidth = 120650
          BandType = 3
          GroupNo = 0
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Apólice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 20638
          mmTop = 10583
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          AutoSize = False
          Caption = 'Registro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 20638
          mmTop = 15346
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'SGIAPOLICE'
          DataPipeline = pplSeguros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplSeguros'
          mmHeight = 4233
          mmLeft = 36248
          mmTop = 10319
          mmWidth = 105304
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'SGIREGISTRO'
          DataPipeline = pplSeguros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplSeguros'
          mmHeight = 4233
          mmLeft = 36248
          mmTop = 15081
          mmWidth = 105304
          BandType = 3
          GroupNo = 0
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          AutoSize = False
          Caption = 'Início da Vigência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 144992
          mmTop = 794
          mmWidth = 28046
          BandType = 3
          GroupNo = 0
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          AutoSize = False
          Caption = 'Término da Vigência:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 144992
          mmTop = 5556
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'Label101'
          AutoSize = False
          Caption = 'Valor Prêmio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 144992
          mmTop = 10583
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'SGIVLRPREMIO'
          DataPipeline = pplSeguros
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSeguros'
          mmHeight = 4233
          mmLeft = 169334
          mmTop = 10319
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'SGIDATAFIM'
          DataPipeline = pplSeguros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSeguros'
          mmHeight = 4233
          mmLeft = 177007
          mmTop = 5556
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'SGIDATAINI'
          DataPipeline = pplSeguros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSeguros'
          mmHeight = 4233
          mmLeft = 177007
          mmTop = 794
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object ppLabel6: TppLabel
          UserName = 'Label2'
          Caption = 'Cobertura'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3440
          mmLeft = 20108
          mmTop = 29898
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppLabel9: TppLabel
          UserName = 'Label6'
          AutoSize = False
          Caption = 'Valor Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 141552
          mmTop = 29898
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'SGIVLRSEGURO'
          DataPipeline = pplSeguros
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSeguros'
          mmHeight = 3969
          mmLeft = 169334
          mmTop = 15346
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          AutoSize = False
          Caption = 'Valor Segurado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 145257
          mmTop = 15346
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Valor Fundação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3440
          mmLeft = 170127
          mmTop = 29898
          mmWidth = 23548
          BandType = 3
          GroupNo = 0
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          AutoSize = False
          Caption = 'LMI Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 145257
          mmTop = 19579
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppLabel14: TppLabel
          UserName = 'Label14'
          AutoSize = False
          Caption = 'LMI Fundação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 145257
          mmTop = 23813
          mmWidth = 22754
          BandType = 3
          GroupNo = 0
        end
        object ppDBText11: TppDBText
          UserName = 'DBText11'
          DataField = 'LMI_TOTAL'
          DataPipeline = pplSeguros
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSeguros'
          mmHeight = 3969
          mmLeft = 169334
          mmTop = 19579
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppDBText12: TppDBText
          UserName = 'DBText12'
          DataField = 'LMI_FUNDACAO'
          DataPipeline = pplSeguros
          DisplayFormat = '###,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplSeguros'
          mmHeight = 3969
          mmLeft = 169334
          mmTop = 23813
          mmWidth = 24342
          BandType = 3
          GroupNo = 0
        end
        object ppLabel15: TppLabel
          UserName = 'Label15'
          AutoSize = False
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 20638
          mmTop = 23019
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'STATUS'
          DataPipeline = pplSeguros
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplSeguros'
          mmHeight = 4233
          mmLeft = 36248
          mmTop = 22754
          mmWidth = 48419
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 2117
          mmLeft = 0
          mmTop = 7938
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
        end
        object ppRegion1: TppRegion
          UserName = 'Region1'
          mmHeight = 6085
          mmLeft = 128059
          mmTop = 529
          mmWidth = 67469
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object ppLabel11: TppLabel
            UserName = 'Label9'
            Caption = 'Total:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            TextAlignment = taRightJustified
            Transparent = True
            mmHeight = 3440
            mmLeft = 132292
            mmTop = 1852
            mmWidth = 7673
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc2: TppDBCalc
            UserName = 'DBCalc2'
            DataField = 'VLRCOBERTURA'
            DataPipeline = pplSeguros
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplSeguros'
            mmHeight = 3440
            mmLeft = 140759
            mmTop = 1852
            mmWidth = 24342
            BandType = 5
            GroupNo = 0
          end
          object ppDBCalc1: TppDBCalc
            UserName = 'DBCalc1'
            DataField = 'VLRFUNDACAO'
            DataPipeline = pplSeguros
            DisplayFormat = '###,##0.00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = [fsBold]
            ResetGroup = ppGroup1
            TextAlignment = taRightJustified
            Transparent = True
            DataPipelineName = 'pplSeguros'
            mmHeight = 3440
            mmLeft = 169334
            mmTop = 1852
            mmWidth = 24342
            BandType = 5
            GroupNo = 0
          end
        end
      end
    end
  end
  object cdsSeguros: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 73
    Data = {
      AC0200009619E0BD010000001800000016000000000003000000AC020E494453
      454755524F494D4F56454C0800040000000000084944494D4F56454C08000400
      000000000E4944494D4F56454C4D455354524508000400000000000E494D4F56
      454C5F455854454E534F0100490000000100055749445448020002007B000C49
      44534547555241444F524108000400000000000D4E465F534547555241444F52
      410100490000000100055749445448020002003C000D52535F53454755524144
      4F52410100490000000100055749445448020002003C000A53474941504F4C49
      434501004900000001000557494454480200020019000B534749524547495354
      524F01004900000001000557494454480200020019000A53474944415441494E
      4908000800000000000A5347494441544146494D08000800000000000C534749
      564C5253454755524F08000400000000000C534749564C525052454D494F0800
      0400000000000D5347495245535053454755524F010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000100
      0D534749524553504F5554524F53010049000000010005574944544802000200
      C8000653544154555301004900000001000557494454480200020009000A4F42
      534552564143414F04004B000000020007535542545950450200490005005465
      78740005574944544802000200D007094C4D495F544F54414C08000400000000
      000C4C4D495F46554E444143414F08000400000000000D4E4F4D45434F424552
      5455524101004900000001000557494454480200020050000C564C52434F4245
      525455524108000400000000000B564C5246554E444143414F08000400000000
      0002000D44454641554C545F4F52444552020082000500000004000200080001
      001400044C4349440400010009080000}
  end
  object CMsp: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   S.IDSEGUROIMOVEL,'
      '   S.IDIMOVEL,'
      '   I.IDIMOVELMESTRE,'
      
        '   (DECODE(I.IDIMOVELMESTRE, NULL, I.IMONOME, (IM.IMONOME||'#39' - '#39 +
        '||I.IMONOME))) AS IMOVEL_EXTENSO,'
      
        '   S.IDSEGURADORA, PS.NOME AS NF_SEGURADORA, PS.RAZAOSOCIAL AS R' +
        'S_SEGURADORA,'
      '   S.SGIAPOLICE, S.SGIREGISTRO,'
      '   S.SGIDATAINI, S.SGIDATAFIM,'
      '   S.SGIVLRSEGURO, S.SGIVLRPREMIO,'
      '   S.SGIRESPSEGURO, S.SGIRESPOUTROS,'
      
        '   DECODE(S.FLGSTATUS,'#39'V'#39', '#39'Vigente'#39', '#39'Encerrado'#39') AS STATUS,   ' +
        ' '
      '   S.OBSERVACAO,'
      '   LMI.LMI_TOTAL, LMI.LMI_FUNDACAO,'
      '   SC.NOMECOBERTURA, SC.VLRCOBERTURA, SC.VLRFUNDACAO'
      ''
      'FROM'
      '   PESSOA PS,'
      '   IMOVEL I, IMOVEL IM,'
      '   SEGUROIMOVEL S, SEGUROIMOXCOB SC,'
      '   ( SELECT IDSEGUROIMOVEL,'
      '            MAX(VLRCOBERTURA) AS LMI_TOTAL,'
      '            MAX(VLRFUNDACAO)  AS LMI_FUNDACAO'
      '       FROM SEGUROIMOXCOB'
      '      GROUP BY IDSEGUROIMOVEL ) LMI'
      ''
      'WHERE  ( S.IDIMOVEL = I.IDIMOVEL )'
      '   AND ( I.IDIMOVELMESTRE = IM.IDIMOVEL(+) )'
      '   AND ( S.IDSEGURADORA = PS.IDPESSOA )'
      '   AND ( S.IDSEGUROIMOVEL = SC.IDSEGUROIMOVEL(+) )'
      '   AND ( S.IDSEGUROIMOVEL = LMI.IDSEGUROIMOVEL(+) )'
      ''
      
        'ORDER BY IMOVEL_EXTENSO, S.IDIMOVEL, S.SGIAPOLICE, S.IDSEGUROIMO' +
        'VEL, SC.NOMECOBERTURA'
      ''
      ''
      ''
      ' ')
    ClientDataSet = cdsSeguros
    Left = 224
    Top = 72
  end
end
