inherited RptParametrosRubBenef: TRptParametrosRubBenef
  Left = 334
  Top = 285
  Height = 297
  Caption = 'RptParametrosRubBenef'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Rubricas Parametrizadas'
        Controle = tcComboBox
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
        ComboBoxSettings.Items.Strings = (
          'Todas'
          'Apenas as parametrizadas'
          'Não parametrizadas')
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = 0
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
        Caption = 'Plano Previdenciário'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDPLANOPREV, NOME'
          'FROM PLANPREV'
          'ORDER BY NOME')
        LookupSettings.Chave = 'IDPLANOPREV'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Plano Previdenciário'
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
        Caption = 'Benefício'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDBENEFICIO, NOME'
          'FROM BENEFICIO'
          'ORDER BY NOME')
        LookupSettings.Chave = 'IDBENEFICIO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Benefício'
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
      end>
    HelpContext = 180073
    Left = 149
  end
  inherited DevRptCM: TExtraOptions
    Left = 33
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptRubBenef
    Left = 92
  end
  object ppRubBenef: TppBDEPipeline
    DataSource = dsRubBenef
    CloseDataSource = True
    UserName = 'RubBenef'
    Left = 61
    Top = 59
    object ppRubBenefppField1: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 0
    end
    object ppRubBenefppField2: TppField
      FieldAlias = 'NOMEBENEFICIO'
      FieldName = 'NOMEBENEFICIO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppRubBenefppField3: TppField
      FieldAlias = 'NOMEPARAMETRO'
      FieldName = 'NOMEPARAMETRO'
      FieldLength = 52
      DisplayWidth = 52
      Position = 2
    end
    object ppRubBenefppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppRubBenefppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppRubBenefppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODINTERNO'
      FieldName = 'CODINTERNO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppRubBenefppField7: TppField
      FieldAlias = 'CODEXTERNO'
      FieldName = 'CODEXTERNO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
    object ppRubBenefppField8: TppField
      FieldAlias = 'NOMERUBRICA'
      FieldName = 'NOMERUBRICA'
      FieldLength = 130
      DisplayWidth = 130
      Position = 7
    end
    object ppRubBenefppField9: TppField
      FieldAlias = 'TIPORUBRICA'
      FieldName = 'TIPORUBRICA'
      FieldLength = 11
      DisplayWidth = 11
      Position = 8
    end
    object ppRubBenefppField10: TppField
      FieldAlias = 'FLGIRRF'
      FieldName = 'FLGIRRF'
      FieldLength = 13
      DisplayWidth = 13
      Position = 9
    end
    object ppRubBenefppField11: TppField
      FieldAlias = 'NATUREZA'
      FieldName = 'NATUREZA'
      FieldLength = 4
      DisplayWidth = 4
      Position = 10
    end
    object ppRubBenefppField12: TppField
      FieldAlias = 'INFORME'
      FieldName = 'INFORME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 11
    end
  end
  object rptRubBenef: TppReport
    AutoStop = False
    DataPipeline = ppRubBenef
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 296863
    PrinterSetup.PaperSize = 9
    Template.FileName = 'C:\ProjetosCM5\Folha\Fontes\rptParamRubricaBeneficio.rtm'
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 244
    Top = 8
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppRubBenef'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 34396
      mmPrintPosition = 0
      object ppDBImage17: TppDBImage
        UserName = 'DBImage17'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText165: TppDBText
        UserName = 'DBText165'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppLabel87: TppLabel
        UserName = 'ppLabel87'
        Caption = 'Relatório de Parametrização das Rubricas de Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 3175
        mmTop = 28575
        mmWidth = 111390
        BandType = 0
      end
      object ppDBText76: TppDBText
        UserName = 'ppDBText76'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText77: TppDBText
        UserName = 'ppDBText77'
        AutoSize = True
        DataField = 'ENDERECO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 12171
        mmWidth = 16140
        BandType = 0
      end
      object ppDBText78: TppDBText
        UserName = 'ppDBText78'
        AutoSize = True
        DataField = 'BARCIDUF'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3175
        mmLeft = 43392
        mmTop = 16140
        mmWidth = 14552
        BandType = 0
      end
      object ppDBText22: TppDBText
        UserName = 'ppDBText22'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 20373
        mmWidth = 17198
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'NOMEPARAMETRO'
        DataPipeline = ppRubBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRubBenef'
        mmHeight = 4233
        mmLeft = 1323
        mmTop = 0
        mmWidth = 78846
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'NOMERUBRICA'
        DataPipeline = ppRubBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppRubBenef'
        mmHeight = 4233
        mmLeft = 88106
        mmTop = 0
        mmWidth = 69850
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'CODINTERNO'
        DataPipeline = ppRubBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRubBenef'
        mmHeight = 4233
        mmLeft = 159279
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CODEXTERNO'
        DataPipeline = ppRubBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRubBenef'
        mmHeight = 4233
        mmLeft = 173567
        mmTop = 0
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'TIPORUBRICA'
        DataPipeline = ppRubBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRubBenef'
        mmHeight = 4233
        mmLeft = 187590
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NATUREZA'
        DataPipeline = ppRubBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRubBenef'
        mmHeight = 4233
        mmLeft = 200290
        mmTop = 0
        mmWidth = 8731
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'INFORME'
        DataPipeline = ppRubBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRubBenef'
        mmHeight = 4233
        mmLeft = 227807
        mmTop = 0
        mmWidth = 52123
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'FLGIRRF'
        DataPipeline = ppRubBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppRubBenef'
        mmHeight = 4233
        mmLeft = 209815
        mmTop = 0
        mmWidth = 17198
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel90: TppLabel
        UserName = 'ppLabel90'
        AutoSize = False
        Caption = 'TotalPrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 9525
        mmWidth = 279136
        BandType = 8
      end
      object ppCalc39: TppSystemVariable
        UserName = 'Calc39'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 9525
        mmWidth = 279136
        BandType = 8
      end
      object ppCalc40: TppSystemVariable
        UserName = 'ppCalc401'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 252678
        mmTop = 9525
        mmWidth = 26194
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 8731
        mmWidth = 284163
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'NOMEPLANO'
      DataPipeline = ppRubBenef
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRubBenef'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 12435
        mmPrintPosition = 0
        object ppdbPlanoPrev: TppDBText
          UserName = 'dbPlanoPrev'
          DataField = 'NOMEPLANO'
          DataPipeline = ppRubBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppRubBenef'
          mmHeight = 3969
          mmLeft = 48154
          mmTop = 6350
          mmWidth = 147373
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Plano Previdenciário: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 5027
          mmTop = 5821
          mmWidth = 41010
          BandType = 3
          GroupNo = 0
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 11113
          mmWidth = 284163
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Width = 3
          Weight = 2.25
          mmHeight = 1588
          mmLeft = 0
          mmTop = 3704
          mmWidth = 284163
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
    object ppGroup2: TppGroup
      BreakName = 'NOMEBENEFICIO'
      DataPipeline = ppRubBenef
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppRubBenef'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 11642
        mmPrintPosition = 0
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Benefício: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 11
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4763
          mmLeft = 26194
          mmTop = 0
          mmWidth = 19844
          BandType = 3
          GroupNo = 1
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'NOMEBENEFICIO'
          DataPipeline = ppRubBenef
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'ppRubBenef'
          mmHeight = 4233
          mmLeft = 48154
          mmTop = 265
          mmWidth = 147373
          BandType = 3
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Nome do Parâmetro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 5556
          mmWidth = 33338
          BandType = 3
          GroupNo = 1
        end
        object ppLabel12: TppLabel
          UserName = 'Label12'
          Caption = 'Descrição da Rubrica'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 88106
          mmTop = 5556
          mmWidth = 36248
          BandType = 3
          GroupNo = 1
        end
        object ppLabel13: TppLabel
          UserName = 'Label13'
          Caption = 'Cód.Int'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 159809
          mmTop = 5556
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 10319
          mmWidth = 284163
          BandType = 3
          GroupNo = 1
        end
        object ppLabel2: TppLabel
          UserName = 'Label2'
          Caption = 'Cód.Ext'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 173567
          mmTop = 5556
          mmWidth = 13229
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 189442
          mmTop = 5556
          mmWidth = 7408
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label5'
          Caption = 'Nat.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 201348
          mmTop = 5556
          mmWidth = 6615
          BandType = 3
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Linha do Informe'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 239448
          mmTop = 5556
          mmWidth = 28575
          BandType = 3
          GroupNo = 1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'IRRF'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 214313
          mmTop = 5556
          mmWidth = 8202
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object dsRubBenef: TwwDataSource
    DataSet = cdsRubBenef
    Left = 61
    Top = 111
  end
  object dtsFundacao: TwwDataSource
    DataSet = cdsFundacao
    Left = 157
    Top = 111
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dtsFundacao
    CloseDataSource = True
    UserName = 'Fundacao'
    Left = 157
    Top = 59
  end
  object sqlpRubBenef: TCMSqlParams
    SQL.Strings = (
      'SELECT PL.NOME AS NOMEPLANO, B.NOME AS NOMEBENEFICIO,'
      '       RUBB.DESCRICAO AS NOMEPARAMETRO,'
      '       RUBB.IDPLANOPREV,'
      '       RUBB.IDBENEFICIO,'
      '       P.IDPROVENTO AS CODINTERNO,'
      '       P.CODPROVDESC AS CODEXTERNO,'
      '       NVL(P.DESCRICAO,'#39'NÃO PARAMETRIZADA'#39') AS NOMERUBRICA,'
      '       DECODE(P.IDPROVENTO,NULL,'#39#39','
      '         DECODE(P.FLGESPECIAL,0,'
      '           DECODE(P.FLGDESCONTO,'
      '             0,'#39'Provento'#39','
      '             1,'#39'Desconto'#39','
      '               '#39'Informativa'#39'),'#39'Informativa'#39')) AS TIPORUBRICA,'
      '       DECODE(P.IDPROVENTO,NULL,'#39#39','
      
        '         DECODE(P.FLGIRRF,1,'#39'Incide IR'#39','#39'Não Incide IR'#39')) AS FLG' +
        'IRRF,'
      '       DECODE(P.IDPROVENTO,NULL,'#39#39','
      '         P.CODIRRFDARF) AS NATUREZA,'
      '       DECODE(P.IDPROVENTO,NULL,'#39#39','
      '         I.NOMEINFORME) AS INFORME'
      'FROM ('
      
        'SELECT  1 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBRICA AS IDRUB' +
        'RICA,        '#39'Parâmetro da Rubrica normal'#39' AS DESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT  2 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBRICAATRASO AS' +
        ' IDRUBRICA,  '#39'Parâmetro da Rubrica atraso'#39' AS DESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT  3 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBADIANT AS IDR' +
        'UBRICA,      '#39'Parâmetro da Rubrica Adiant. Provisório'#39' AS DESCRI' +
        'CAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT  4 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBACJUD AS IDRU' +
        'BRICA,       '#39'Parâmetro da Rubrica normal ação judicial'#39' AS DESC' +
        'RICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT  5 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBATRACJUD AS I' +
        'DRUBRICA,    '#39'Parâmetro da Rubrica atraso ação judicial'#39' AS DESC' +
        'RICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT  6 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBRICAREVISAO A' +
        'S IDRUBRICA, '#39'Parâmetro da Rubrica revisão'#39' AS DESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT  7 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBATRREVISAO AS' +
        ' IDRUBRICA,  '#39'Parâmetro da Rubrica atraso revisão'#39' AS DESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT  8 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBREVACJUD AS I' +
        'DRUBRICA,    '#39'Parâmetro da Rubrica revisão ação judicial'#39' AS DES' +
        'CRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT  9 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBATRREVACJUD A' +
        'S IDRUBRICA, '#39'Parâmetro da Rubrica atraso revisão ação judicial'#39 +
        ' AS DESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 10 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVOLUCAO AS ' +
        'IDRUBRICA,   '#39'Parâmetro da Rubrica devolução'#39' AS DESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 11 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVOLADIANT A' +
        'S IDRUBRICA, '#39'Parâmetro da Rubrica devolução de Adiant. Provisór' +
        'io'#39' AS DESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 12 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVACJUD AS I' +
        'DRUBRICA,    '#39'Parâmetro da Rubrica devolução ação judicial'#39' AS D' +
        'ESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 13 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVREVISAO AS' +
        ' IDRUBRICA,  '#39'Parâmetro da Rubrica devolução revisão'#39' AS DESCRIC' +
        'AO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 14 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVREVACJUD A' +
        'S IDRUBRICA, '#39'Parâmetro da Rubrica devolução revisão ação judici' +
        'al'#39' AS DESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 15 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBABONO AS IDRU' +
        'BRICA,       '#39'Parâmetro da Rubrica abono'#39' AS DESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 16 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBATRASOABONO A' +
        'S IDRUBRICA, '#39'Parâmetro da Rubrica atraso abono'#39' AS DESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 17 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBANTECABONO AS' +
        ' IDRUBRICA,  '#39'Parâmetro da Rubrica antecipação abono'#39' AS DESCRIC' +
        'AO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 18 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBACERTOABONO A' +
        'S IDRUBRICA, '#39'Parâmetro da Rubrica atraso antecip. abono'#39' AS DES' +
        'CRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 19 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUB13ACJUD AS ID' +
        'RUBRICA,     '#39'Parâmetro da Rubrica abono ação judicial'#39' AS DESCR' +
        'ICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 20 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBATR13ACJUD AS' +
        ' IDRUBRICA,  '#39'Parâmetro da Rubrica atraso abono ação judicial'#39' A' +
        'S DESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 21 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVOLABONO AS' +
        ' IDRUBRICA,  '#39'Parâmetro da Rubrica devolução abono'#39' AS DESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 22 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEVANTABONO A' +
        'S IDRUBRICA, '#39'Parâmetro da Rubrica devolução antecip. abono'#39' AS ' +
        'DESCRICAO'
      'FROM BENEFPLANPREV'
      'UNION'
      
        'SELECT 23 AS ORDEM, IDPLANOPREV, IDBENEFICIO, IDRUBDEV13ACJUD AS' +
        ' IDRUBRICA,  '#39'Parâmetro da Rubrica devolução abono ação judicial' +
        #39' AS DESCRICAO'
      'FROM BENEFPLANPREV'
      ') RUBB, PLANPREV PL, BENEFICIO B, PROVDESC P, INFORME I'
      'WHERE RUBB.IDPLANOPREV = PL.IDPLANOPREV'
      'AND RUBB.IDBENEFICIO = B.IDBENEFICIO'
      'AND RUBB.IDRUBRICA = P.IDPROVENTO(+)'
      'AND P.IDINFORME = I.IDINFORME(+)'
      'ORDER BY PL.NOME, B.NOME, RUBB.ORDEM')
    ClientDataSet = cdsRubBenef
    Left = 60
    Top = 159
  end
  object sqlpFundacao: TCMSqlParams
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO , E.COMPLEMENTO, E.BAIRRO,'
      
        '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM, I.IDIMAGE' +
        'M,'
      '      (E.LOGRADOURO||'#39', '#39'||E.NUMERO) AS ENDERECO,'
      '      (E.BAIRRO||'#39' - '#39'||C.NOME||'#39' - '#39'||C.CODESTADO) AS BARCIDUF'
      'FROM PESSOA P, ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE (P.IDPESSOA = :pFundacao) AND'
      '(E.IDPESSOA(+) = P.IDPESSOA) AND'
      
        '(E.IDCIDADES   = C.IDCIDADES(+))  AND                           ' +
        '    '
      '(I.IDIMAGEM(+) = P.IDIMAGEM)'
      ' ')
    ClientDataSet = cdsFundacao
    Left = 155
    Top = 159
  end
  object cdsFundacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 154
    Top = 209
  end
  object cdsRubBenef: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 59
    Top = 208
  end
end
