inherited RptDossieCand: TRptDossieCand
  Left = 98
  Top = 186
  Width = 596
  Height = 238
  Caption = 'RptDossieCand'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'IdCandidato'
        Controle = tcEdit
        TipodeDado = tdReal
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
        Name = 'IdCandidato'
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
        Caption = 'ImprimirOBS'
        Controle = tcEdit
        TipodeDado = tdBoolean
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
        Name = 'ImprimirOBS'
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
    Left = 132
    Top = 0
  end
  inherited DevRptCM: TExtraOptions
    Left = 16
    Top = 0
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpDossieCand
    ConnectionType = cntBDE
    Left = 75
    Top = 0
  end
  object dsDossieCand: TwwDataSource
    DataSet = qryDossieCand
    Left = 374
  end
  object ppDossieCand: TppBDEPipeline
    DataSource = dsDossieCand
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'DossieCand'
    Left = 294
    object ppDossieCandppField1: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object ppDossieCandppField2: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppDossieCandppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDIMAGEM'
      FieldName = 'IDIMAGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppDossieCandppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppDossieCandppField5: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object ppDossieCandppField6: TppField
      FieldAlias = 'SEXO'
      FieldName = 'SEXO'
      FieldLength = 9
      DisplayWidth = 9
      Position = 5
    end
    object ppDossieCandppField7: TppField
      FieldAlias = 'ESTCIVIL'
      FieldName = 'ESTCIVIL'
      FieldLength = 22
      DisplayWidth = 22
      Position = 6
    end
    object ppDossieCandppField8: TppField
      FieldAlias = 'VINCULO'
      FieldName = 'VINCULO'
      FieldLength = 16
      DisplayWidth = 16
      Position = 7
    end
    object ppDossieCandppField9: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 8
    end
    object ppDossieCandppField10: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 9
    end
    object ppDossieCandppField11: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 10
    end
    object ppDossieCandppField12: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 11
    end
    object ppDossieCandppField13: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
    object ppDossieCandppField14: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 13
    end
    object ppDossieCandppField15: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 14
    end
    object ppDossieCandppField16: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 15
    end
    object ppDossieCandppField17: TppField
      FieldAlias = 'PROFISSAO'
      FieldName = 'PROFISSAO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 16
    end
    object ppDossieCandppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALARIOPRET'
      FieldName = 'SALARIOPRET'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object ppDossieCandppField19: TppField
      FieldAlias = 'TIPOPAGAMENTO'
      FieldName = 'TIPOPAGAMENTO'
      FieldLength = 12
      DisplayWidth = 12
      Position = 18
    end
    object ppDossieCandppField20: TppField
      FieldAlias = 'GRINSTR'
      FieldName = 'GRINSTR'
      FieldLength = 30
      DisplayWidth = 30
      Position = 19
    end
    object ppDossieCandppField21: TppField
      FieldAlias = 'DDI'
      FieldName = 'DDI'
      FieldLength = 6
      DisplayWidth = 6
      Position = 20
    end
    object ppDossieCandppField22: TppField
      FieldAlias = 'DDD'
      FieldName = 'DDD'
      FieldLength = 7
      DisplayWidth = 7
      Position = 21
    end
    object ppDossieCandppField23: TppField
      FieldAlias = 'TELEFONE'
      FieldName = 'TELEFONE'
      FieldLength = 20
      DisplayWidth = 20
      Position = 22
    end
  end
  object rpDossieCand: TppReport
    AutoStop = False
    DataPipeline = ppDossieCand
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 214
    Version = '5.5'
    mmColumnWidth = 197300
    object rpDossieCandHdrBnd: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 16933
      mmPrintPosition = 0
      object rpDossieCandLbl1: TppLabel
        UserName = 'rpDossieCandLbl1'
        AutoSize = False
        Caption = 'Dossiê (Ficha) do Candidato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 5292
        mmTop = 8467
        mmWidth = 186796
        BandType = 0
      end
      object rpDossieCandDBTxt1: TppDBText
        UserName = 'rpDossieCandDBTxt1'
        DataField = 'EMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 5292
        mmTop = 1588
        mmWidth = 186796
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Position = lpBottom
        Weight = 1.5
        mmHeight = 1323
        mmLeft = 5292
        mmTop = 15610
        mmWidth = 186796
        BandType = 0
      end
    end
    object rpDossieCandDtlBnd: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 34925
      mmPrintPosition = 0
      object rpDossieCandLbl7: TppLabel
        UserName = 'rpDossieCandLbl7'
        AutoSize = False
        Caption = 'Endereço:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 2910
        mmWidth = 15346
        BandType = 4
      end
      object rpDossieCandLbl8: TppLabel
        UserName = 'rpDossieCandLbl8'
        AutoSize = False
        Caption = 'Telefone:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 11377
        mmWidth = 15346
        BandType = 4
      end
      object rpDossieCandLbl9: TppLabel
        UserName = 'rpDossieCandLbl9'
        AutoSize = False
        Caption = 'Cargo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 24077
        mmWidth = 15346
        BandType = 4
      end
      object rpDossieCandLbl10: TppLabel
        UserName = 'rpDossieCandLbl10'
        AutoSize = False
        Caption = 'Profissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 8996
        mmTop = 28575
        mmWidth = 15346
        BandType = 4
      end
      object rpDossieCandLbl11: TppLabel
        UserName = 'rpDossieCandLbl11'
        AutoSize = False
        Caption = 'Salário Pret.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 88636
        mmTop = 24077
        mmWidth = 20902
        BandType = 4
      end
      object rpDossieCandLbl12: TppLabel
        UserName = 'rpDossieCandLbl12'
        AutoSize = False
        Caption = 'Grau Instr.:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 88636
        mmTop = 28575
        mmWidth = 20902
        BandType = 4
      end
      object rpDossieCandDBTxt7: TppDBText
        UserName = 'rpDossieCandDBTxt7'
        DataField = 'LOGRADOURO'
        DataPipeline = ppDossieCand
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25929
        mmTop = 2910
        mmWidth = 74083
        BandType = 4
      end
      object rpDossieCandDBTxt8: TppDBText
        UserName = 'rpDossieCandDBTxt8'
        DataField = 'BAIRRO'
        DataPipeline = ppDossieCand
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 9260
        mmTop = 7144
        mmWidth = 70115
        BandType = 4
      end
      object rpDossieCandDBTxt11: TppDBText
        UserName = 'rpDossieCandDBTxt11'
        DataField = 'CEP'
        DataPipeline = ppDossieCand
        DisplayFormat = '00000\-999;0;'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 81492
        mmTop = 7144
        mmWidth = 18521
        BandType = 4
      end
      object rpDossieCandDBTxt9: TppDBText
        UserName = 'rpDossieCandDBTxt9'
        DataField = 'NUMERO'
        DataPipeline = ppDossieCand
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 102129
        mmTop = 2910
        mmWidth = 12435
        BandType = 4
      end
      object rpDossieCandDBTxt12: TppDBText
        UserName = 'rpDossieCandDBTxt12'
        DataField = 'CIDADE'
        DataPipeline = ppDossieCand
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 102129
        mmTop = 7144
        mmWidth = 45244
        BandType = 4
      end
      object rpDossieCandDBTxt10: TppDBText
        UserName = 'rpDossieCandDBTxt10'
        DataField = 'COMPLEMENTO'
        DataPipeline = ppDossieCand
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 116681
        mmTop = 2910
        mmWidth = 72496
        BandType = 4
      end
      object rpDossieCandDBTxt17: TppDBText
        UserName = 'rpDossieCandDBTxt17'
        DataField = 'CARGO'
        DataPipeline = ppDossieCand
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25929
        mmTop = 24077
        mmWidth = 60590
        BandType = 4
      end
      object rpDossieCandDBTxt18: TppDBText
        UserName = 'rpDossieCandDBTxt18'
        DataField = 'PROFISSAO'
        DataPipeline = ppDossieCand
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25929
        mmTop = 28575
        mmWidth = 60590
        BandType = 4
      end
      object rpDossieCandDBTxt19: TppDBText
        UserName = 'rpDossieCandDBTxt19'
        DataField = 'SALARIOPRET'
        DataPipeline = ppDossieCand
        DisplayFormat = '###,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 111390
        mmTop = 24077
        mmWidth = 22490
        BandType = 4
      end
      object rpDossieCandDBTxt20: TppDBText
        UserName = 'rpDossieCandDBTxt20'
        DataField = 'TIPOPAGAMENTO'
        DataPipeline = ppDossieCand
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 135467
        mmTop = 24077
        mmWidth = 53446
        BandType = 4
      end
      object rpDossieCandDBTxt21: TppDBText
        UserName = 'rpDossieCandDBTxt21'
        DataField = 'GRINSTR'
        DataPipeline = ppDossieCand
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 111390
        mmTop = 28575
        mmWidth = 77523
        BandType = 4
      end
      object rpDossieCandDBTxt14: TppDBText
        UserName = 'rpDossieCandDBTxt14'
        DataField = 'DDI'
        DataPipeline = ppDossieCand
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 25929
        mmTop = 11377
        mmWidth = 4763
        BandType = 4
      end
      object rpDossieCandDBTxt15: TppDBText
        UserName = 'rpDossieCandDBTxt15'
        DataField = 'DDD'
        DataPipeline = ppDossieCand
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 35454
        mmTop = 11377
        mmWidth = 6085
        BandType = 4
      end
      object rpDossieCandDBTxt16: TppDBText
        UserName = 'rpDossieCandDBTxt16'
        DataField = 'TELEFONE'
        DataPipeline = ppDossieCand
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 46567
        mmTop = 11377
        mmWidth = 14817
        BandType = 4
      end
      object rpDossieCandDBTxt13: TppDBText
        UserName = 'rpDossieCandDBTxt13'
        DataField = 'CODESTADO'
        DataPipeline = ppDossieCand
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 149754
        mmTop = 7144
        mmWidth = 39423
        BandType = 4
      end
    end
    object rpDossieCandSmryBnd: TppSummaryBand
      AfterPrint = rpDossieCandSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME'
      NewPage = True
      ResetPageNo = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpDossieCandGrpHdrBnd: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 40481
        mmPrintPosition = 0
        object rpDossieCandLbl2: TppLabel
          UserName = 'rpDossieCandLbl2'
          AutoSize = False
          Caption = 'Nome...........:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 5821
          mmTop = 3704
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object rpDossieCandDBTxt2: TppDBText
          UserName = 'rpDossieCandDBTxt2'
          DataField = 'NOME'
          DataPipeline = ppDossieCand
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 26723
          mmTop = 3704
          mmWidth = 107421
          BandType = 3
          GroupNo = 0
        end
        object rpDossieCandLbl3: TppLabel
          UserName = 'rpDossieCandLbl3'
          AutoSize = False
          Caption = 'Nascimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 5821
          mmTop = 11113
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object rpDossieCandLbl4: TppLabel
          UserName = 'rpDossieCandLbl4'
          AutoSize = False
          Caption = 'Sexo.............:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 5821
          mmTop = 18521
          mmWidth = 18521
          BandType = 3
          GroupNo = 0
        end
        object rpDossieCandLbl5: TppLabel
          UserName = 'rpDossieCandLbl5'
          AutoSize = False
          Caption = 'Estado Civil:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 82286
          mmTop = 11113
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpDossieCandLbl6: TppLabel
          UserName = 'rpDossieCandLbl6'
          AutoSize = False
          Caption = 'Vinculo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 82286
          mmTop = 18521
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpDossieCandDBTxt4: TppDBText
          UserName = 'rpDossieCandDBTxt4'
          DataField = 'SEXO'
          DataPipeline = ppDossieCand
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 26723
          mmTop = 18521
          mmWidth = 43921
          BandType = 3
          GroupNo = 0
        end
        object rpDossieCandDBTxt5: TppDBText
          UserName = 'rpDossieCandDBTxt5'
          DataField = 'ESTCIVIL'
          DataPipeline = ppDossieCand
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 105040
          mmTop = 11113
          mmWidth = 49742
          BandType = 3
          GroupNo = 0
        end
        object rpDossieCandDBTxt6: TppDBText
          UserName = 'rpDossieCandDBTxt6'
          DataField = 'VINCULO'
          DataPipeline = ppDossieCand
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 105040
          mmTop = 18521
          mmWidth = 49742
          BandType = 3
          GroupNo = 0
        end
        object rpDossieCandDBImage1: TppDBImage
          UserName = 'rpDossieCandDBImage1'
          MaintainAspectRatio = False
          Stretch = True
          DataField = 'IMAGEM'
          DataPipeline = ppIMG
          GraphicType = 'Bitmap'
          ParentDataPipeline = False
          mmHeight = 31750
          mmLeft = 156898
          mmTop = 4498
          mmWidth = 31750
          BandType = 3
          GroupNo = 0
        end
        object rpDossieCandLine2: TppLine
          UserName = 'rpDossieCandLine2'
          Pen.Width = 2
          Position = lpBottom
          Weight = 1.5
          mmHeight = 1323
          mmLeft = 5292
          mmTop = 39158
          mmWidth = 186796
          BandType = 3
          GroupNo = 0
        end
        object rpDossieCandDBTxt3: TppDBText
          UserName = 'rpDossieCandDBTxt3'
          DataField = 'DATANASC'
          DataPipeline = ppDossieCand
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 26723
          mmTop = 11113
          mmWidth = 43921
          BandType = 3
          GroupNo = 0
        end
      end
      object rpDossieCandGrpFootBnd: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 19315
        mmPrintPosition = 0
        object rpDossieCandReport1: TppSubReport
          UserName = 'rpDossieCandReport1'
          ExpandAll = False
          NewPrintJob = False
          TraverseAllData = False
          mmHeight = 3175
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object DossieCandCR1: TppChildReport
            AutoStop = False
            DataPipeline = ppDossieCand1
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '5.5'
            mmColumnWidth = 0
            object rpDossieCandSubReport1TitBnd: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 6615
              mmPrintPosition = 0
              object rpDossieCandSubReport1Lbl1: TppLabel
                UserName = 'rpDossieCandSubReport1Lbl1'
                AutoSize = False
                Caption = 'Tipo de Documento'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 9260
                mmTop = 2117
                mmWidth = 47890
                BandType = 1
              end
              object rpDossieCandSubReport1Lbl2: TppLabel
                UserName = 'rpDossieCandSubReport1Lbl2'
                AutoSize = False
                Caption = 'Número'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 59267
                mmTop = 2117
                mmWidth = 28840
                BandType = 1
              end
              object rpDossieCandSubReport1Lbl3: TppLabel
                UserName = 'rpDossieCandSubReport1Lbl3'
                AutoSize = False
                Caption = 'Emissor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 90223
                mmTop = 2117
                mmWidth = 25665
                BandType = 1
              end
              object rpDossieCandSubReport1Lbl4: TppLabel
                UserName = 'rpDossieCandSubReport1Lbl4'
                AutoSize = False
                Caption = 'UF'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 118004
                mmTop = 2117
                mmWidth = 9260
                BandType = 1
              end
              object rpDossieCandSubReport1Lbl5: TppLabel
                UserName = 'rpDossieCandSubReport1Lbl5'
                AutoSize = False
                Caption = 'Emissão'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 129382
                mmTop = 2117
                mmWidth = 26723
                BandType = 1
              end
            end
            object rpDossieCandSubReport1DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object rpDossieCandSubReport1DBTxt1: TppDBText
                OnPrint = rpDossieCandSubReport1DBTxt1Print
                UserName = 'rpDossieCandSubReport1DBTxt1'
                DataField = 'NOMEDOCUMENTO'
                DataPipeline = ppDossieCand1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 47890
                BandType = 4
              end
              object rpDossieCandSubReport1DBTxt2: TppDBText
                UserName = 'rpDossieCandSubReport1DBTxt2'
                DataField = 'NUMDOCUMENTO'
                DataPipeline = ppDossieCand1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 59267
                mmTop = 794
                mmWidth = 28840
                BandType = 4
              end
              object rpDossieCandSubReport1DBTxt3: TppDBText
                UserName = 'rpDossieCandSubReport1DBTxt3'
                DataField = 'ORGAO'
                DataPipeline = ppDossieCand1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 90223
                mmTop = 794
                mmWidth = 25665
                BandType = 4
              end
              object rpDossieCandSubReport1DBTxt4: TppDBText
                UserName = 'rpDossieCandSubReport1DBTxt4'
                DataField = 'UF'
                DataPipeline = ppDossieCand1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 118004
                mmTop = 794
                mmWidth = 9260
                BandType = 4
              end
              object rpDossieCandSubReport1DBTxt5: TppDBText
                UserName = 'rpDossieCandSubReport1DBTxt5'
                DataField = 'DATAEMISSAO'
                DataPipeline = ppDossieCand1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 129382
                mmTop = 794
                mmWidth = 26723
                BandType = 4
              end
            end
          end
        end
        object rpDossieCandReport2: TppSubReport
          UserName = 'rpDossieCandReport2'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = rpDossieCandReport1
          TraverseAllData = False
          mmHeight = 3175
          mmLeft = 0
          mmTop = 2646
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object DossieCandCR2: TppChildReport
            AutoStop = False
            DataPipeline = ppDossieCand2
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '5.5'
            mmColumnWidth = 0
            object rpDossieCandSubReport2TitBnd: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 7673
              mmPrintPosition = 0
              object rpDossieCandSubReport2Lbl1: TppLabel
                UserName = 'rpDossieCandSubReport2Lbl1'
                AutoSize = False
                Caption = 'Empresa / Cargo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 9260
                mmTop = 3175
                mmWidth = 57150
                BandType = 1
              end
              object rpDossieCandSubReport2Lbl2: TppLabel
                UserName = 'rpDossieCandSubReport2Lbl2'
                AutoSize = False
                Caption = 'Último Salário'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3969
                mmLeft = 68263
                mmTop = 3175
                mmWidth = 28840
                BandType = 1
              end
              object rpDossieCandSubReport2Lbl3: TppLabel
                UserName = 'rpDossieCandSubReport2Lbl3'
                AutoSize = False
                Caption = 'Admissão'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 99219
                mmTop = 3175
                mmWidth = 18521
                BandType = 1
              end
              object rpDossieCandSubReport2Lbl4: TppLabel
                UserName = 'rpDossieCandSubReport2Lbl4'
                AutoSize = False
                Caption = 'Demissão'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 119856
                mmTop = 3175
                mmWidth = 16669
                BandType = 1
              end
              object rpDossieCandSubReport2Lbl5: TppLabel
                UserName = 'rpDossieCandSubReport2Lbl5'
                AutoSize = False
                Caption = 'Motivo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 138377
                mmTop = 3175
                mmWidth = 57150
                BandType = 1
              end
            end
            object rpDossieCandSubReport2DtlBnd: TppDetailBand
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 9790
              mmPrintPosition = 0
              object rpDossieCandSubReport2DBTxt1: TppDBText
                UserName = 'rpDossieCandSubReport2DBTxt1'
                DataField = 'EMPRESA'
                DataPipeline = ppDossieCand2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 57150
                BandType = 4
              end
              object rpDossieCandSubReportDBTxt2: TppDBText
                UserName = 'rpDossieCandSubReportDBTxt2'
                DataField = 'ULTSALARIO'
                DataPipeline = ppDossieCand2
                DisplayFormat = '###,###,##0.00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 3704
                mmLeft = 68263
                mmTop = 794
                mmWidth = 28840
                BandType = 4
              end
              object rpDossieCandSubReport2DBTxt3: TppDBText
                UserName = 'rpDossieCandSubReport2DBTxt3'
                DataField = 'DAT_ADMIS'
                DataPipeline = ppDossieCand2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 99219
                mmTop = 794
                mmWidth = 18521
                BandType = 4
              end
              object rpDossieCandSubReport2DBTxt4: TppDBText
                UserName = 'rpDossieCandSubReport2DBTxt4'
                DataField = 'DATADEM'
                DataPipeline = ppDossieCand2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 119856
                mmTop = 794
                mmWidth = 16669
                BandType = 4
              end
              object rpDossieCandSubReport2DBTxt5: TppDBText
                UserName = 'rpDossieCandSubReport2DBTxt5'
                DataField = 'MOTIVO'
                DataPipeline = ppDossieCand2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 138377
                mmTop = 794
                mmWidth = 57150
                BandType = 4
              end
              object rpDossieCandSubReport2DBTxt6: TppDBText
                UserName = 'rpDossieCandSubReport2DBTxt6'
                DataField = 'CARGO'
                DataPipeline = ppDossieCand2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 5292
                mmWidth = 57150
                BandType = 4
              end
            end
          end
        end
        object rpDossieCandReport3: TppSubReport
          UserName = 'rpDossieCandReport3'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = rpDossieCandReport2
          TraverseAllData = False
          mmHeight = 3175
          mmLeft = 0
          mmTop = 5556
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object DossieCandCR3: TppChildReport
            AutoStop = False
            DataPipeline = ppDossieCand3
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '5.5'
            mmColumnWidth = 0
            object rpDossieCandSubReport3TitBnd: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 7673
              mmPrintPosition = 0
              object rpDossieCandSubReport3Lbl1: TppLabel
                UserName = 'rpDossieCandSubReport3Lbl1'
                AutoSize = False
                Caption = 'Curso'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 9260
                mmTop = 3175
                mmWidth = 66411
                BandType = 1
              end
              object rpDossieCandSubReport3Lbl2: TppLabel
                UserName = 'rpDossieCandSubReport3Lbl2'
                AutoSize = False
                Caption = 'Início'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 79111
                mmTop = 3175
                mmWidth = 15875
                BandType = 1
              end
              object rpDossieCandSubReport3Lbl3: TppLabel
                UserName = 'rpDossieCandSubReport3Lbl3'
                AutoSize = False
                Caption = 'Final'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 98690
                mmTop = 3175
                mmWidth = 14817
                BandType = 1
              end
              object rpDossieCandSubReport3Lbl4: TppLabel
                UserName = 'rpDossieCandSubReport3Lbl4'
                AutoSize = False
                Caption = 'Horas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 115623
                mmTop = 3175
                mmWidth = 10583
                BandType = 1
              end
              object rpDossieCandSubReport3Lbl5: TppLabel
                UserName = 'rpDossieCandSubReport3Lbl5'
                AutoSize = False
                Caption = 'Aval. Teor.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 128323
                mmTop = 3175
                mmWidth = 17198
                BandType = 1
              end
              object rpDossieCandSubReport3Lbl6: TppLabel
                UserName = 'rpDossieCandSubReport3Lbl6'
                AutoSize = False
                Caption = 'Aval. Prat.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 147638
                mmTop = 3175
                mmWidth = 16140
                BandType = 1
              end
              object rpDossieCandSubReport3Lbl7: TppLabel
                UserName = 'rpDossieCandSubReport3Lbl7'
                AutoSize = False
                Caption = 'Resultado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 165894
                mmTop = 3175
                mmWidth = 17727
                BandType = 1
              end
            end
            object rpDossieCandSubReport3DtlBnd: TppDetailBand
              BeforePrint = rpDossieCandSubReport3DtlBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 20373
              mmPrintPosition = 0
              object rpDossieCandSubReport3DBTxt1: TppDBText
                UserName = 'rpDossieCandSubReport3DBTxt1'
                DataField = 'DESCRICAO'
                DataPipeline = ppDossieCand3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 66411
                BandType = 4
              end
              object rpDossieCandSubReport3DBTxt2: TppDBText
                UserName = 'rpDossieCandSubReport3DBTxt2'
                DataField = 'DATREINI'
                DataPipeline = ppDossieCand3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 79111
                mmTop = 794
                mmWidth = 15875
                BandType = 4
              end
              object rpDossieCandSubReport3DBTxt3: TppDBText
                UserName = 'rpDossieCandSubReport3DBTxt3'
                DataField = 'DATREFIM'
                DataPipeline = ppDossieCand3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 98690
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
              object rpDossieCandSubReport3DBTxt4: TppDBText
                UserName = 'rpDossieCandSubReport3DBTxt4'
                DataField = 'DUR_TOT'
                DataPipeline = ppDossieCand3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 115623
                mmTop = 794
                mmWidth = 10583
                BandType = 4
              end
              object rpDossieCandSubReport3LblAVALTEOR: TppLabel
                UserName = 'rpDossieCandSubReport3LblAVALTEOR'
                AutoSize = False
                Caption = 'rpDossieCandSubReport3LblAVALTEOR'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 128323
                mmTop = 794
                mmWidth = 17198
                BandType = 4
              end
              object rpDossieCandSubReport3LblAVALPRAT: TppLabel
                UserName = 'rpDossieCandSubReport3LblAVALPRAT'
                AutoSize = False
                Caption = 'rpDossieCandSubReport3LblAVALPRAT'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 147638
                mmTop = 794
                mmWidth = 16140
                BandType = 4
              end
              object rpDossieCandSubReport3LblRESULT: TppLabel
                UserName = 'rpDossieCandSubReport3LblRESULT'
                AutoSize = False
                Caption = 'rpDossieCandSubReport3LblRESULT'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 165894
                mmTop = 794
                mmWidth = 17727
                BandType = 4
              end
              object rpDossieCandSubReport3DBMemo1: TppDBMemo
                UserName = 'rpDossieCandSubReport3DBMemo1'
                CharWrap = False
                DataField = 'OBSERVACAO'
                DataPipeline = ppDossieCand3
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 14023
                mmLeft = 9260
                mmTop = 5556
                mmWidth = 167217
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
            end
          end
        end
        object rpDossieCandReport4: TppSubReport
          UserName = 'rpDossieCandReport4'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = rpDossieCandReport3
          TraverseAllData = False
          mmHeight = 3175
          mmLeft = 0
          mmTop = 8467
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object DossieCandCR4: TppChildReport
            AutoStop = False
            DataPipeline = ppDossieCand4
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '5.5'
            mmColumnWidth = 0
            object rpDossieCandSubReport4TitBnd: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 7673
              mmPrintPosition = 0
              object rpDossieCandSubReport4Lbl1: TppLabel
                UserName = 'rpDossieCandSubReport4Lbl1'
                AutoSize = False
                Caption = 'Tipo de Experiência'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 9260
                mmTop = 3175
                mmWidth = 115888
                BandType = 1
              end
              object rpDossieCandSubReport4Lbl2: TppLabel
                UserName = 'rpDossieCandSubReport4Lbl2'
                AutoSize = False
                Caption = 'Início'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 133086
                mmTop = 3175
                mmWidth = 20108
                BandType = 1
              end
              object rpDossieCandSubReport4Lbl3: TppLabel
                UserName = 'rpDossieCandSubReport4Lbl3'
                AutoSize = False
                Caption = 'Final'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 155311
                mmTop = 3175
                mmWidth = 19315
                BandType = 1
              end
            end
            object rpDossieCandSubReport4DtlBnd: TppDetailBand
              mmBottomOffset = 0
              mmHeight = 5292
              mmPrintPosition = 0
              object rpDossieCandSubReportDBText1: TppDBText
                UserName = 'rpDossieCandSubReportDBText1'
                DataField = 'DESCRICAO'
                DataPipeline = ppDossieCand4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 115888
                BandType = 4
              end
              object rpDossieCandSubReportDBText2: TppDBText
                UserName = 'rpDossieCandSubReportDBText2'
                DataField = 'DAT_INI'
                DataPipeline = ppDossieCand4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 133086
                mmTop = 794
                mmWidth = 20108
                BandType = 4
              end
              object rpDossieCandSubReportDBText3: TppDBText
                UserName = 'rpDossieCandSubReportDBText3'
                DataField = 'DAT_FIM'
                DataPipeline = ppDossieCand4
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                Transparent = True
                mmHeight = 3704
                mmLeft = 155311
                mmTop = 794
                mmWidth = 19315
                BandType = 4
              end
            end
          end
        end
        object rpDossieCandReport5: TppSubReport
          UserName = 'rpDossieCandReport5'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = rpDossieCandReport4
          TraverseAllData = False
          mmHeight = 3175
          mmLeft = 0
          mmTop = 11377
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object DossieCandCR5: TppChildReport
            AutoStop = False
            DataPipeline = ppDossieCand5
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '5.5'
            mmColumnWidth = 0
            object rpDossieCandSubReport5TitBnd: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 7673
              mmPrintPosition = 0
              object rpDossieCandSubReport5Lbl1: TppLabel
                UserName = 'rpDossieCandSubReport5Lbl1'
                AutoSize = False
                Caption = 'Teste, Entrevista, Avaliação'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 9260
                mmTop = 3175
                mmWidth = 93927
                BandType = 1
              end
              object rpDossieCandSubReport5Lbl2: TppLabel
                UserName = 'rpDossieCandSubReport5Lbl2'
                AutoSize = False
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 119856
                mmTop = 3175
                mmWidth = 14817
                BandType = 1
              end
              object rpDossieCandSubReport5Lbl3: TppLabel
                UserName = 'rpDossieCandSubReport5Lbl3'
                AutoSize = False
                Caption = 'Avaliação'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 136261
                mmTop = 3175
                mmWidth = 14817
                BandType = 1
              end
              object rpDossieCandSubReport5Lbl4: TppLabel
                UserName = 'rpDossieCandSubReport5Lbl4'
                AutoSize = False
                Caption = 'Avaliador'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 153459
                mmTop = 3175
                mmWidth = 34396
                BandType = 1
              end
            end
            object rpDossieCandSubReport5DtlBnd: TppDetailBand
              BeforePrint = rpDossieCandSubReport5DtlBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 20373
              mmPrintPosition = 0
              object rpDossieCandSubReport5DBTxt1: TppDBText
                UserName = 'rpDossieCandSubReport5DBTxt1'
                DataField = 'DESCRTIPOAVAL'
                DataPipeline = ppDossieCand5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 93927
                BandType = 4
              end
              object rpDossieCandSubReport5DBTxt2: TppDBText
                UserName = 'rpDossieCandSubReport5DBTxt2'
                DataField = 'DATAREAL'
                DataPipeline = ppDossieCand5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 119856
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
              object rpDossieCandSubReport5DBTxt3: TppDBText
                UserName = 'rpDossieCandSubReport5DBTxt3'
                DataField = 'AVALIACAO'
                DataPipeline = ppDossieCand5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 136261
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
              object rpDossieCandSubReport5DBMemo1: TppDBMemo
                UserName = 'rpDossieCandSubReport5DBMemo1'
                CharWrap = False
                DataField = 'COMENT'
                DataPipeline = ppDossieCand5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 14023
                mmLeft = 9260
                mmTop = 5556
                mmWidth = 167217
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
              object rpDossieCandSubReport5DBTxt4: TppDBText
                UserName = 'rpDossieCandSubReport5DBTxt4'
                DataField = 'AVALIADOR'
                DataPipeline = ppDossieCand5
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 153459
                mmTop = 794
                mmWidth = 34396
                BandType = 4
              end
            end
          end
        end
        object rpDossieCandReport6: TppSubReport
          UserName = 'rpDossieCandReport6'
          ExpandAll = False
          NewPrintJob = False
          ShiftRelativeTo = rpDossieCandReport5
          TraverseAllData = False
          mmHeight = 3175
          mmLeft = 0
          mmTop = 14288
          mmWidth = 197300
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object DossieCandCR6: TppChildReport
            AutoStop = False
            DataPipeline = ppDossieCand6
            PrinterSetup.BinName = 'Default'
            PrinterSetup.DocumentName = 'PpModeloReport1'
            PrinterSetup.PaperName = 'A4 210 x 297 mm'
            PrinterSetup.PrinterName = 'Default'
            PrinterSetup.mmMarginBottom = 6350
            PrinterSetup.mmMarginLeft = 6350
            PrinterSetup.mmMarginRight = 6350
            PrinterSetup.mmMarginTop = 6350
            PrinterSetup.mmPaperHeight = 297000
            PrinterSetup.mmPaperWidth = 210000
            PrinterSetup.PaperSize = 9
            Template.SaveTo = stDatabase
            Units = utScreenPixels
            Version = '5.5'
            mmColumnWidth = 0
            object rpDossieCandSubReport6TitBnd: TppTitleBand
              mmBottomOffset = 0
              mmHeight = 7673
              mmPrintPosition = 0
              object rpDossieCandSubReport6Lbl1: TppLabel
                UserName = 'rpDossieCandSubReport6Lbl1'
                AutoSize = False
                Caption = 'Tipo de Ocorrência Médica'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 9260
                mmTop = 3175
                mmWidth = 93927
                BandType = 1
              end
              object rpDossieCandSubReport6Lbl2: TppLabel
                UserName = 'rpDossieCandSubReport6Lbl2'
                AutoSize = False
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 119327
                mmTop = 3175
                mmWidth = 14817
                BandType = 1
              end
              object rpDossieCandSubReport6Lbl3: TppLabel
                UserName = 'rpDossieCandSubReport6Lbl3'
                AutoSize = False
                Caption = 'Avaliação'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 136261
                mmTop = 3175
                mmWidth = 14817
                BandType = 1
              end
              object rpDossieCandSubReport6Lbl4: TppLabel
                UserName = 'rpDossieCandSubReport6Lbl4'
                AutoSize = False
                Caption = 'Examinador'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = [fsBold, fsUnderline]
                Transparent = True
                mmHeight = 3969
                mmLeft = 153459
                mmTop = 3175
                mmWidth = 34396
                BandType = 1
              end
            end
            object rpDossieCandSubReport6DtlBnd: TppDetailBand
              BeforePrint = rpDossieCandSubReport6DtlBndBeforePrint
              mmBottomOffset = 0
              mmHeight = 20373
              mmPrintPosition = 0
              object rpDossieCandSubReport6DBTxt1: TppDBText
                UserName = 'rpDossieCandSubReport6DBTxt1'
                DataField = 'DESCRTIPOOCMED'
                DataPipeline = ppDossieCand6
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 9260
                mmTop = 794
                mmWidth = 93927
                BandType = 4
              end
              object rpDossieCandSubReport6DBTxt2: TppDBText
                UserName = 'rpDossieCandSubReport6DBTxt2'
                DataField = 'DATAREAL'
                DataPipeline = ppDossieCand6
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 119327
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
              object rpDossieCandSubReport6DBTxt3: TppDBText
                UserName = 'rpDossieCandSubReport6DBTxt3'
                DataField = 'AVALIACAO'
                DataPipeline = ppDossieCand6
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                TextAlignment = taCentered
                Transparent = True
                mmHeight = 3704
                mmLeft = 136261
                mmTop = 794
                mmWidth = 14817
                BandType = 4
              end
              object rpDossieCandSubReport6DBMemo1: TppDBMemo
                UserName = 'rpDossieCandSubReport6DBMemo1'
                CharWrap = False
                DataField = 'OBSERVACAO'
                DataPipeline = ppDossieCand6
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 14023
                mmLeft = 16404
                mmTop = 5556
                mmWidth = 167217
                BandType = 4
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmLeading = 0
              end
              object rpDossieCandSubReport6DBTxt4: TppDBText
                UserName = 'rpDossieCandSubReport6DBTxt4'
                DataField = 'EXAMINADOR'
                DataPipeline = ppDossieCand6
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Arial'
                Font.Size = 8
                Font.Style = []
                ParentDataPipeline = False
                Transparent = True
                mmHeight = 3704
                mmLeft = 153459
                mmTop = 794
                mmWidth = 34396
                BandType = 4
              end
            end
          end
        end
      end
    end
  end
  object CdsIMG: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 14
    Top = 160
  end
  object ppIMG: TppBDEPipeline
    DataSource = dsIMG
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'IMG'
    Left = 13
    Top = 64
  end
  object dsIMG: TwwDataSource
    DataSet = CdsIMG
    Left = 14
    Top = 112
  end
  object dsDossieCand1: TwwDataSource
    DataSet = qryDossieCand1
    Left = 83
    Top = 112
  end
  object ppDossieCand1: TppBDEPipeline
    DataSource = dsDossieCand1
    CloseDataSource = True
    UserName = 'DossieCand1'
    Left = 83
    Top = 64
  end
  object dsDossieCand2: TwwDataSource
    DataSet = qryDossieCand2
    Left = 171
    Top = 112
  end
  object ppDossieCand2: TppBDEPipeline
    DataSource = dsDossieCand2
    CloseDataSource = True
    UserName = 'DossieCand2'
    Left = 171
    Top = 64
  end
  object dsDossieCand3: TwwDataSource
    DataSet = qryDossieCand3
    Left = 259
    Top = 112
  end
  object ppDossieCand3: TppBDEPipeline
    DataSource = dsDossieCand3
    CloseDataSource = True
    UserName = 'DossieCand3'
    Left = 259
    Top = 64
  end
  object dsDossieCand4: TwwDataSource
    DataSet = qryDossieCand4
    Left = 347
    Top = 112
  end
  object ppDossieCand4: TppBDEPipeline
    DataSource = dsDossieCand4
    CloseDataSource = True
    UserName = 'DossieCand4'
    Left = 347
    Top = 64
  end
  object dsDossieCand5: TwwDataSource
    DataSet = qryDossieCand5
    Left = 435
    Top = 112
  end
  object ppDossieCand5: TppBDEPipeline
    DataSource = dsDossieCand5
    CloseDataSource = True
    UserName = 'DossieCand5'
    Left = 435
    Top = 64
  end
  object dsDossieCand6: TwwDataSource
    DataSet = qryDossieCand6
    Left = 523
    Top = 112
  end
  object ppDossieCand6: TppBDEPipeline
    DataSource = dsDossieCand6
    CloseDataSource = True
    UserName = 'DossieCand6'
    Left = 523
    Top = 64
  end
  object qryDossieCand1: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsDossieCand
    SQL.Strings = (
      'SELECT '
      
        '  TDO.NOMEDOCUMENTO, DO.NUMDOCUMENTO, TDO.MASCARA, DO.ORGAO, DO.' +
        'UF, DO.DATAEMISSAO'
      'FROM'
      '  DOCPESSOA DO, TIPODOCPESSOA TDO'
      'WHERE'
      '  (DO.IDPESSOA    = :IDPESSOA) AND'
      '  (DO.IDDOCUMENTO = TDO.IDDOCUMENTO)'
      'ORDER BY'
      '  NOMEDOCUMENTO')
    ValidateWithMask = True
    Left = 83
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryDossieCand2: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsDossieCand
    SQL.Strings = (
      'SELECT'
      
        '  UL.IDPESSOA, UL.NUMSEQ, UL.EMPRESA, UL.ULTSALARIO, UL.DAT_ADMI' +
        'S,'
      '  UL.DATADEM, MO.DESCRICAO AS MOTIVO, C.TITULO AS CARGO'
      'FROM'
      '  CARGO C, MOTIVO MO, ULTEMPR UL'
      'WHERE'
      '  (UL.IDPESSOA = :IDPESSOA)    AND'
      '  (UL.IDCARGO  = C.IDCARGO(+)) AND'
      '  (UL.IDMOTIVO = MO.IDMOTIVO(+))'
      'ORDER BY'
      '  UL.NUMSEQ')
    ValidateWithMask = True
    Left = 171
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryDossieCand3: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsDossieCand
    SQL.Strings = (
      'SELECT'
      
        '  C.DESCRICAO, C.TEMAVAL, C.TEMAVPR, C.AVALIACAO, C.AVALPRAT, C.' +
        'OBSERVACAO,'
      '  H.*'
      'FROM'
      '  HSTTRN H, CURSO C'
      'WHERE'
      '  (H.IDPESSOA = :IDPESSOA) AND'
      '  (H.IDCURSO = C.IDCURSO)'
      'ORDER BY'
      '  H.DATREINI DESC')
    ValidateWithMask = True
    Left = 259
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryDossieCand4: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsDossieCand
    SQL.Strings = (
      'SELECT'
      '  IDPESSOA, DAT_INI, DAT_FIM, DESCRICAO'
      'FROM'
      '  HSTEXPER HS, TABEXPER TB'
      'WHERE'
      '  (HS.IDPESSOA = :IDPESSOA) AND'
      '  (HS.IDEXPER  = TB.IDEXPER)'
      'ORDER BY'
      '  HS.DAT_INI DESC')
    ValidateWithMask = True
    Left = 347
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryDossieCand5: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsDossieCand
    SQL.Strings = (
      'SELECT'
      '  HA.DATAREAL, HA.AVALIADOR, '
      '  HA.COMENT, HA.AVALIACAO, TA.DESCRTIPOAVAL '
      'FROM'
      '  HSTAVAL HA, TIPOAVAL TA'
      'WHERE'
      '  (HA.IDPESSOA    = :IDPESSOA) AND'
      '  (HA.CODTIPOAVAL = TA.CODTIPOAVAL)'
      'ORDER BY'
      '  HA.DATAREAL DESC')
    ValidateWithMask = True
    Left = 435
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryDossieCand6: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsDossieCand
    SQL.Strings = (
      'SELECT'
      '  HM.DATAREAL, HM.EXAMINADOR,'
      '  HM.AVALIACAO, TM.DESCRTIPOOCMED, HM.OBSERVACAO'
      'FROM'
      '  HSTASMED HM, TIPOCMED TM'
      'WHERE'
      '  (HM.IDPESSOA     = :IDPESSOA) AND'
      '  (HM.CODTIPOOCMED = TM.CODTIPOOCMED)'
      'ORDER BY'
      '  HM.DATAREAL DESC')
    ValidateWithMask = True
    Left = 523
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryDossieCand: TwwQuery
    AfterScroll = CdsDossieCandAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  ('#39'SERPROS - FUNDO MULTIPATROCINADO'#39') AS EMPRESA,'
      '  RTRIM(PF.NOME) AS NOME,'
      '  PF.IDIMAGEM, PF.IDPESSOA,'
      '  PEFIS.DATANASC,'
      '  DECODE(PEFIS.SEXO,'#39'F'#39','#39'Feminino'#39','#39'M'#39','#39'Masculino'#39','#39#39') AS SEXO,'
      
        '  DECODE(PEFIS.ESTCIVIL,'#39'S'#39','#39'Solteir'#39' || DECODE(PEFIS.SEXO,'#39'F'#39','#39 +
        'a'#39','#39'o'#39'),'
      '    '#39'C'#39','#39'Casad'#39' || DECODE(PEFIS.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      '    '#39'D'#39','#39'Separad'#39' || DECODE(PEFIS.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      
        '    '#39'J'#39','#39'Separad'#39' || DECODE(PEFIS.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39') || '#39' Judicia' +
        'lmente'#39','
      '    '#39'E'#39','#39'Desquitad'#39' || DECODE(PEFIS.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      '    '#39'V'#39','#39'Viúv'#39' || DECODE(PEFIS.SEXO,'#39'F'#39','#39'a'#39','#39'o'#39'),'
      '    '#39'O'#39','#39'Outro'#39') AS ESTCIVIL,'
      '  DECODE(CA.TIPOCONTRATO, '#39'E'#39','#39'Efetivo'#39', '#39'S'#39','#39'Efetivo Especial'#39','
      '    '#39'T'#39','#39'Temporário'#39', '#39'G'#39','#39'Estagiário'#39', '#39'3'#39','#39'Terceiro'#39','
      
        '    '#39'P'#39','#39'Proprietário'#39', '#39'A'#39','#39'Autônomo'#39', '#39'Indefinido'#39') AS VINCULO' +
        ','
      '  E.LOGRADOURO, E.BAIRRO, E.CEP, E.NUMERO, CI.NOME AS CIDADE,'
      '  E.CODESTADO, E.COMPLEMENTO, C.TITULO AS CARGO,'
      '  PR.DESCRICAO AS PROFISSAO, NVL(CA.SALARIO,0) AS SALARIOPRET,'
      '  DECODE(CA.TIPOPAGAMENTO, NULL,'#39#39','
      
        '    '#39'('#39' || DECODE(CA.TIPOPAGAMENTO, '#39'H'#39','#39'Horista'#39', '#39'D'#39','#39'Diarista' +
        #39','
      '    '#39'M'#39', '#39'Mensalista'#39', '#39'T'#39','#39'Tarefa'#39') || '#39')'#39') AS TIPOPAGAMENTO,'
      '  GR.DESCRICAO AS GRINSTR,'
      
        '  DECODE(RTRIM(TELEFONE.DDI),NULL,'#39#39','#39'('#39'||RTRIM(TELEFONE.DDI)||'#39 +
        ')'#39') AS DDI,'
      
        '  DECODE(RTRIM(TELEFONE.DDD),NULL,'#39#39','#39'('#39'||RTRIM(TELEFONE.DDD)||'#39 +
        ')'#39') AS DDD,'
      '  RTRIM(TELEFONE.NUMERO) AS TELEFONE'
      'FROM'
      '  PESSOA PF, PESSOAFISICA PEFIS, ENDPESS E, CANDIDAT CA,'
      '  CIDADES CI, CARGO C, PROFISS PR, GRINSTR GR,'
      
        '  (SELECT TE.IDENDERECO, TE.IDTELEFONE, TE.DDD, TE.DDI, TE.NUMER' +
        'O'
      '   FROM'
      '     TELENDPESS TE,'
      '     (SELECT   MIN(IDTELEFONE) AS IDTELEFONE, IDENDERECO'
      '      FROM     TELENDPESS'
      '      GROUP BY IDENDERECO) END'
      '   WHERE'
      '     (END.IDTELEFONE = TE.IDTELEFONE)) TELEFONE'
      'WHERE'
      '  (PF.IDPESSOA         = 115915) AND'
      '  (PF.IDPESSOA         = CA.IDPESSOA)     AND'
      '  (PF.IDPESSOA         = PEFIS.IDPESSOA)  AND'
      '  (CA.IDCARGO          = C.IDCARGO(+))    AND'
      '  (PEFIS.IDPROFISS     = PR.IDPROFISS(+)) AND'
      '  (PEFIS.IDGRINSTR     = GR.IDGRINSTR(+)) AND'
      '  (PF.IDPESSOA         = E.IDPESSOA(+))   AND'
      '  (PF.IDENDRESIDENCIAL = E.IDPESSOA(+))   AND'
      '  (E.IDCIDADES         = CI.IDCIDADES(+)) AND'
      '  (PF.IDENDRESIDENCIAL = TELEFONE.IDENDERECO(+))'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 454
  end
end
