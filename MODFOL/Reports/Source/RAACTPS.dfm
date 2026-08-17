inherited RptRAACTPS: TRptRAACTPS
  Left = 648
  Top = 240
  Width = 380
  Height = 315
  Caption = 'RptRAACTPS'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'ListaIdFuncSel'
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
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ListaIdFuncSel'
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
        Caption = 'Ordem'
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
        Name = 'Ordem'
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
    DataBaseName = 'BaseDados'
    Report = rpAACTPS
    ConnectionType = cntBDE
  end
  object rpAACTPS: TppReport
    AutoStop = False
    DataPipeline = Dados
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 8000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 8000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 200
    Top = 8
    Version = '7.04'
    mmColumnWidth = 185000
    DataPipelineName = 'Dados'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 93927
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape3'
        Brush.Color = clSilver
        Pen.Color = clSilver
        mmHeight = 4763
        mmLeft = 794
        mmTop = 34131
        mmWidth = 188913
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'RAZAO_EMPRESA'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 30956
        mmWidth = 129646
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'ENDERECO_EMPRESA'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 39158
        mmWidth = 101336
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'COMPL_END_EMPRESA'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 134409
        mmTop = 39158
        mmWidth = 55298
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'NUM_END_EMPRESA'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 105040
        mmTop = 39158
        mmWidth = 14023
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CNPJ_EMPRESA'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3440
        mmLeft = 132027
        mmTop = 30956
        mmWidth = 35719
        BandType = 4
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        AutoSize = False
        Caption = 'Endereço'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 34660
        mmWidth = 101336
        BandType = 4
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        AutoSize = False
        Caption = 'Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 105040
        mmTop = 34660
        mmWidth = 15610
        BandType = 4
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        AutoSize = False
        Caption = 'Complemento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 134409
        mmTop = 34660
        mmWidth = 21696
        BandType = 4
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Brush.Color = clSilver
        Pen.Color = clSilver
        mmHeight = 4763
        mmLeft = 794
        mmTop = 42333
        mmWidth = 188913
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'BAIRRO_EMPRESA'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 47361
        mmWidth = 81227
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'CEP_EMPRESA'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 165365
        mmTop = 47361
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'CIDADE_EMPRESA'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 83079
        mmTop = 47361
        mmWidth = 62706
        BandType = 4
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Bairro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 42863
        mmWidth = 58738
        BandType = 4
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Cidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 83079
        mmTop = 42863
        mmWidth = 28575
        BandType = 4
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'CEP'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 165365
        mmTop = 42863
        mmWidth = 20902
        BandType = 4
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Estado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 147373
        mmTop = 42863
        mmWidth = 16404
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'UF_EMPRESA'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 147373
        mmTop = 47361
        mmWidth = 14817
        BandType = 4
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        Brush.Color = clSilver
        Pen.Color = clSilver
        mmHeight = 4763
        mmLeft = 794
        mmTop = 50536
        mmWidth = 188913
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'MATRICULA'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 55563
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'CTPS'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 133350
        mmTop = 55563
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'NOME_EMPREGADO'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 20373
        mmTop = 55563
        mmWidth = 108215
        BandType = 4
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 51065
        mmWidth = 15346
        BandType = 4
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Empregado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 20373
        mmTop = 51065
        mmWidth = 92340
        BandType = 4
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'CTPS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 133350
        mmTop = 51065
        mmWidth = 18785
        BandType = 4
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        Brush.Color = clSilver
        Pen.Color = clSilver
        mmHeight = 4763
        mmLeft = 794
        mmTop = 58738
        mmWidth = 188913
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'LOTACAO'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 63765
        mmWidth = 81227
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'SINDICATO'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 85196
        mmTop = 63765
        mmWidth = 101865
        BandType = 4
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Lotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 59267
        mmWidth = 58738
        BandType = 4
      end
      object ppLabel11: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Categoria profissional'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 85196
        mmTop = 59267
        mmWidth = 41275
        BandType = 4
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        AutoSize = False
        Caption = 'Data de admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 162454
        mmTop = 51065
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'DATAADMISSAO'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 162454
        mmTop = 55563
        mmWidth = 24606
        BandType = 4
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        Brush.Color = clSilver
        Pen.Color = clSilver
        mmHeight = 4763
        mmLeft = 794
        mmTop = 66940
        mmWidth = 188913
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'PIS'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 71967
        mmWidth = 37835
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'ORGAO_EMISSOR_RG'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 136790
        mmTop = 71967
        mmWidth = 25929
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'CPF_EMPREGADO'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 45773
        mmTop = 71967
        mmWidth = 41275
        BandType = 4
      end
      object ppLabel15: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'PIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 67469
        mmWidth = 38100
        BandType = 4
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'CPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 45773
        mmTop = 67469
        mmWidth = 41275
        BandType = 4
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        AutoSize = False
        Caption = 'Órgão Emissor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 136790
        mmTop = 67469
        mmWidth = 25929
        BandType = 4
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        AutoSize = False
        Caption = 'Identidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 108215
        mmTop = 67469
        mmWidth = 21167
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'RG'
        DataPipeline = Dados
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'Dados'
        mmHeight = 3175
        mmLeft = 108215
        mmTop = 71967
        mmWidth = 20902
        BandType = 4
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'Data Base'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 163513
        mmTop = 67469
        mmWidth = 25929
        BandType = 4
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = 'JANEIRO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 163777
        mmTop = 71967
        mmWidth = 25665
        BandType = 4
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 265
        mmTop = 75936
        mmWidth = 189442
        BandType = 4
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 45244
        mmLeft = 0
        mmTop = 30956
        mmWidth = 6085
        BandType = 4
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpRight
        Weight = 0.75
        mmHeight = 45508
        mmLeft = 185209
        mmTop = 30692
        mmWidth = 4763
        BandType = 4
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = clSilver
        Pen.Color = clSilver
        mmHeight = 5027
        mmLeft = 794
        mmTop = 25665
        mmWidth = 188913
        BandType = 4
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Ficha de Anotações e Atualizações da '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 794
        mmWidth = 189442
        BandType = 4
      end
      object ppLabel19: TppLabel
        UserName = 'Label202'
        AutoSize = False
        Caption = 'Carteira de Trabalho e Previdência Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 265
        mmTop = 5556
        mmWidth = 189442
        BandType = 4
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        AutoSize = False
        Caption = 
          '(Portaria Nº 41 de 28 de Março de 2007 do Ministério do Trabalho' +
          ' e Emprego)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 265
        mmTop = 11377
        mmWidth = 189442
        BandType = 4
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Empresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 26194
        mmWidth = 14023
        BandType = 4
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'CNPJ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 132027
        mmTop = 26194
        mmWidth = 33602
        BandType = 4
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpLeft
        Weight = 0.75
        mmHeight = 34131
        mmLeft = 0
        mmTop = 0
        mmWidth = 6085
        BandType = 4
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpRight
        Weight = 0.75
        mmHeight = 33073
        mmLeft = 185209
        mmTop = 0
        mmWidth = 4763
        BandType = 4
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'FOTO'
        DataPipeline = Foto
        GraphicType = 'JPEG'
        ParentDataPipeline = False
        DataPipelineName = 'Foto'
        mmHeight = 23548
        mmLeft = 168011
        mmTop = 1323
        mmWidth = 19315
        BandType = 4
      end
      object ppLine61: TppLine
        UserName = 'Line601'
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 189971
        BandType = 4
      end
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'Cargo'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 77258
        mmWidth = 190000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = Cargo
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 8000
          PrinterSetup.mmMarginLeft = 10000
          PrinterSetup.mmMarginRight = 10000
          PrinterSetup.mmMarginTop = 8000
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utMillimeters
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'Cargo'
          object ppTitleBand2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 14023
            mmPrintPosition = 0
            object ppShape1: TppShape
              UserName = 'Shape1'
              Brush.Color = clSilver
              Pen.Color = clSilver
              mmHeight = 4498
              mmLeft = 265
              mmTop = 2910
              mmWidth = 189707
              BandType = 1
            end
            object ppLabel2: TppLabel
              UserName = 'Label1'
              AutoSize = False
              Caption = 'ALTERAÇÕES DE SALÁRIO - CARGO / FUNÇÃO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 1588
              mmTop = 3440
              mmWidth = 184680
              BandType = 1
            end
            object ppLabel30: TppLabel
              UserName = 'Label30'
              AutoSize = False
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 2117
              mmTop = 9790
              mmWidth = 9525
              BandType = 1
            end
            object ppLabel31: TppLabel
              UserName = 'Label31'
              AutoSize = False
              Caption = ' Cargo / Função'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3440
              mmLeft = 15081
              mmTop = 9790
              mmWidth = 45773
              BandType = 1
            end
            object ppLabel32: TppLabel
              UserName = 'Label32'
              AutoSize = False
              Caption = 'CBO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3387
              mmLeft = 62177
              mmTop = 9525
              mmWidth = 14552
              BandType = 1
            end
            object ppLabel33: TppLabel
              UserName = 'Label301'
              AutoSize = False
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 77788
              mmTop = 9790
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel34: TppLabel
              UserName = 'Label34'
              AutoSize = False
              Caption = 'Salário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 91546
              mmTop = 9790
              mmWidth = 11113
              BandType = 1
            end
            object ppLabel35: TppLabel
              UserName = 'Label35'
              AutoSize = False
              Caption = 'Motivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 139700
              mmTop = 9525
              mmWidth = 39423
              BandType = 1
            end
            object ppLine3: TppLine
              UserName = 'Line1'
              Weight = 0.75
              mmHeight = 2910
              mmLeft = 0
              mmTop = 2646
              mmWidth = 189971
              BandType = 1
            end
            object ppLine9: TppLine
              UserName = 'Line9'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 11113
              mmLeft = 0
              mmTop = 2646
              mmWidth = 7144
              BandType = 1
            end
            object ppLine16: TppLine
              UserName = 'Line16'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 14288
              mmTop = 7408
              mmWidth = 8731
              BandType = 1
            end
            object ppLine17: TppLine
              UserName = 'Line17'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 61383
              mmTop = 7408
              mmWidth = 8731
              BandType = 1
            end
            object ppLine18: TppLine
              UserName = 'Line18'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 76994
              mmTop = 7408
              mmWidth = 6350
              BandType = 1
            end
            object ppLine19: TppLine
              UserName = 'Line19'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 89165
              mmTop = 7408
              mmWidth = 8731
              BandType = 1
            end
            object ppLine20: TppLine
              UserName = 'Line20'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 104511
              mmTop = 7408
              mmWidth = 8731
              BandType = 1
            end
            object ppLine21: TppLine
              UserName = 'Line21'
              Position = lpRight
              ReprintOnOverFlow = True
              Weight = 0.75
              mmHeight = 11113
              mmLeft = 179917
              mmTop = 2646
              mmWidth = 10054
              BandType = 1
            end
            object ppLine23: TppLine
              UserName = 'Line23'
              Position = lpBottom
              Weight = 0.75
              mmHeight = 2910
              mmLeft = 0
              mmTop = 11113
              mmWidth = 189971
              BandType = 1
            end
            object ppLabel49: TppLabel
              UserName = 'Label49'
              AutoSize = False
              Caption = 'Função'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 105569
              mmTop = 9525
              mmWidth = 14552
              BandType = 1
            end
            object ppLine56: TppLine
              UserName = 'Line202'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 120386
              mmTop = 7408
              mmWidth = 8731
              BandType = 1
            end
            object ppLabel50: TppLabel
              UserName = 'Label50'
              AutoSize = False
              Caption = 'Sal. Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3704
              mmLeft = 121973
              mmTop = 9525
              mmWidth = 15875
              BandType = 1
            end
            object ppLine59: TppLine
              UserName = 'Line59'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 138113
              mmTop = 7408
              mmWidth = 1588
              BandType = 1
            end
          end
          object ppHeaderBand3: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppDetailBand2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText23: TppDBText
              UserName = 'DBText23'
              DataField = 'DATAALTERFUNC'
              DataPipeline = Cargo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              ParentDataPipeline = False
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'Cargo'
              mmHeight = 2910
              mmLeft = 794
              mmTop = 529
              mmWidth = 13229
              BandType = 4
            end
            object ppDBText24: TppDBText
              UserName = 'DBText24'
              DataField = 'CBO_CARGO_FUNCAO'
              DataPipeline = Cargo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'Cargo'
              mmHeight = 2910
              mmLeft = 62706
              mmTop = 529
              mmWidth = 13758
              BandType = 4
            end
            object ppDBText25: TppDBText
              UserName = 'DBText25'
              DataField = 'CARGO_FUNCAO'
              DataPipeline = Cargo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'Cargo'
              mmHeight = 2910
              mmLeft = 16404
              mmTop = 529
              mmWidth = 44715
              BandType = 4
            end
            object ppDBText9: TppDBText
              UserName = 'DBText9'
              DataField = 'Moeda'
              DataPipeline = Cargo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'Cargo'
              mmHeight = 2910
              mmLeft = 77788
              mmTop = 529
              mmWidth = 10319
              BandType = 4
            end
            object ppDBText26: TppDBText
              UserName = 'DBText26'
              DataField = 'SALARIO'
              DataPipeline = Cargo
              DisplayFormat = '#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'Cargo'
              mmHeight = 3175
              mmLeft = 91017
              mmTop = 265
              mmWidth = 11377
              BandType = 4
            end
            object ppDBText27: TppDBText
              UserName = 'DBText27'
              DataField = 'MOTIVO'
              DataPipeline = Cargo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              Transparent = True
              DataPipelineName = 'Cargo'
              mmHeight = 2910
              mmLeft = 139700
              mmTop = 529
              mmWidth = 42863
              BandType = 4
            end
            object ppLine10: TppLine
              UserName = 'Line10'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4763
              mmLeft = 0
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object ppLine11: TppLine
              UserName = 'Line101'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 14288
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object ppLine12: TppLine
              UserName = 'Line12'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 61383
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object ppLine13: TppLine
              UserName = 'Line13'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 76994
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object ppLine14: TppLine
              UserName = 'Line14'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 89165
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object ppLine15: TppLine
              UserName = 'Line15'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 104511
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object ppLine22: TppLine
              UserName = 'Line22'
              Position = lpRight
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 186796
              mmTop = 0
              mmWidth = 3175
              BandType = 4
            end
            object ppDBText17: TppDBText
              UserName = 'DBText17'
              DataField = 'VLRFUNCAO'
              DataPipeline = Cargo
              DisplayFormat = '#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'Cargo'
              mmHeight = 2910
              mmLeft = 106892
              mmTop = 529
              mmWidth = 11113
              BandType = 4
            end
            object ppLine57: TppLine
              UserName = 'Line57'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 120386
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object ppDBText30: TppDBText
              UserName = 'DBText30'
              DataField = 'VLRSALARIOFUNCAO'
              DataPipeline = Cargo
              DisplayFormat = '#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'Cargo'
              mmHeight = 2910
              mmLeft = 124354
              mmTop = 529
              mmWidth = 11642
              BandType = 4
            end
            object ppLine58: TppLine
              UserName = 'Line58'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 138113
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
          end
          object ppFooterBand2: TppFooterBand
            Visible = False
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object ppSummaryBand2: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3000
            mmPrintPosition = 0
            object ppLine4: TppLine
              UserName = 'Line4'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 0
              mmTop = 0
              mmWidth = 189971
              BandType = 7
            end
          end
          object raCodeModule1: TraCodeModule
            ProgramStream = {
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
              5375625265706F7274314F6E5072696E740B50726F6772616D54797065070B74
              7450726F63656475726506536F75726365064670726F63656475726520537562
              5265706F7274314F6E5072696E743B0D0A626567696E0D0A2020486561646572
              2E56697369626C65203A3D20747275653B0D0A656E643B0D0A0D436F6D706F6E
              656E744E616D65060A5375625265706F727431094576656E744E616D6506074F
              6E5072696E74074576656E74494402200000}
          end
        end
      end
      object psbrprt2: TppSubReport
        UserName = 'SubReport2'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = ppSubReport1
        TraverseAllData = False
        DataPipelineName = 'Ferias'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 83079
        mmWidth = 190000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object pchldrprt2: TppChildReport
          AutoStop = False
          DataPipeline = Ferias
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 8000
          PrinterSetup.mmMarginLeft = 10000
          PrinterSetup.mmMarginRight = 10000
          PrinterSetup.mmMarginTop = 8000
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utMillimeters
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'Ferias'
          object ptlbnd2: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object phdrbnd1: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 14023
            mmPrintPosition = 0
            object pshp1: TppShape
              UserName = 'pshp1'
              Brush.Color = clSilver
              Pen.Color = clSilver
              mmHeight = 4498
              mmLeft = 265
              mmTop = 2910
              mmWidth = 189707
              BandType = 0
            end
            object Til6: TppLabel
              UserName = 'Til6'
              AutoSize = False
              Caption = 'FÉRIAS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 3175
              mmTop = 3440
              mmWidth = 184680
              BandType = 0
            end
            object Til7: TppLabel
              UserName = 'Label302'
              AutoSize = False
              Caption = 'Período Aquisitivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 2117
              mmTop = 8996
              mmWidth = 44715
              BandType = 0
            end
            object Til8: TppLabel
              UserName = 'Til8'
              AutoSize = False
              Caption = 'Período de Férias'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3387
              mmLeft = 52388
              mmTop = 8731
              mmWidth = 37306
              BandType = 0
            end
            object Til9: TppLabel
              UserName = 'Til9'
              AutoSize = False
              Caption = 'Dias de Férias'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 92075
              mmTop = 8996
              mmWidth = 22225
              BandType = 0
            end
            object Til10: TppLabel
              UserName = 'Til10'
              AutoSize = False
              Caption = 'Abono Pec.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 116152
              mmTop = 8996
              mmWidth = 17463
              BandType = 0
            end
            object Til11: TppLabel
              UserName = 'Til11'
              AutoSize = False
              Caption = 'Adto 13º Salário'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 3387
              mmLeft = 163513
              mmTop = 8996
              mmWidth = 23813
              BandType = 0
            end
            object pln3: TppLine
              UserName = 'pln3'
              Weight = 0.75
              mmHeight = 2910
              mmLeft = 265
              mmTop = 2646
              mmWidth = 189707
              BandType = 0
            end
            object pln4: TppLine
              UserName = 'pln4'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 11377
              mmLeft = 0
              mmTop = 2646
              mmWidth = 9260
              BandType = 0
            end
            object pln5: TppLine
              UserName = 'pln5'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 50006
              mmTop = 7408
              mmWidth = 8731
              BandType = 0
            end
            object pln6: TppLine
              UserName = 'pln6'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 91281
              mmTop = 7408
              mmWidth = 8731
              BandType = 0
            end
            object pln7: TppLine
              UserName = 'pln7'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 114829
              mmTop = 7408
              mmWidth = 8731
              BandType = 0
            end
            object pln8: TppLine
              UserName = 'Line201'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 161396
              mmTop = 7408
              mmWidth = 8731
              BandType = 0
            end
            object pln9: TppLine
              UserName = 'pln9'
              Position = lpRight
              ReprintOnOverFlow = True
              Weight = 0.75
              mmHeight = 11113
              mmLeft = 180182
              mmTop = 2910
              mmWidth = 9790
              BandType = 0
            end
            object pln10: TppLine
              UserName = 'pln10'
              Position = lpBottom
              ReprintOnOverFlow = True
              Weight = 0.75
              mmHeight = 2910
              mmLeft = 265
              mmTop = 11113
              mmWidth = 189707
              BandType = 0
            end
            object pln11: TppLine
              UserName = 'pln11'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 134938
              mmTop = 7673
              mmWidth = 8731
              BandType = 0
            end
            object Til12: TppLabel
              UserName = 'Til12'
              AutoSize = False
              Caption = 'Dias de Abono'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 137319
              mmTop = 8996
              mmWidth = 22225
              BandType = 0
            end
          end
          object pdtlbnd2: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object pdbtxtPERIODO_AQUISITIVO: TppDBText
              UserName = 'pdbtxtPERIODO_AQUISITIVO'
              DataField = 'PERIODO_AQUISITIVO'
              DataPipeline = Ferias
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'Ferias'
              mmHeight = 2910
              mmLeft = 2646
              mmTop = 794
              mmWidth = 43921
              BandType = 4
            end
            object pdbtxtPERIODO_FERIAS: TppDBText
              UserName = 'pdbtxtPERIODO_FERIAS'
              DataField = 'PERIODO_FERIAS'
              DataPipeline = Ferias
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'Ferias'
              mmHeight = 2910
              mmLeft = 52917
              mmTop = 794
              mmWidth = 37571
              BandType = 4
            end
            object pdbtxtDIAS_FERIAS: TppDBText
              UserName = 'pdbtxtDIAS_FERIAS'
              DataField = 'DIAS_FERIAS'
              DataPipeline = Ferias
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'Ferias'
              mmHeight = 2910
              mmLeft = 92604
              mmTop = 794
              mmWidth = 21167
              BandType = 4
            end
            object pdbtxtABONO_PEC: TppDBText
              UserName = 'pdbtxtABONO_PEC'
              DataField = 'ABONO_PEC'
              DataPipeline = Ferias
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'Ferias'
              mmHeight = 2910
              mmLeft = 116681
              mmTop = 794
              mmWidth = 16140
              BandType = 4
            end
            object pdbtxtADTO13: TppDBText
              UserName = 'pdbtxtADTO13'
              DataField = 'ADTO13'
              DataPipeline = Ferias
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'Ferias'
              mmHeight = 2910
              mmLeft = 164042
              mmTop = 794
              mmWidth = 24342
              BandType = 4
            end
            object pln12: TppLine
              UserName = 'Line102'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 0
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object pln13: TppLine
              UserName = 'pln13'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 50006
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object pln14: TppLine
              UserName = 'pln14'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 91281
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object pln15: TppLine
              UserName = 'pln15'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 114829
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object pln16: TppLine
              UserName = 'pln16'
              Position = lpLeft
              ReprintOnOverFlow = True
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 161396
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object pln17: TppLine
              UserName = 'pln17'
              Position = lpRight
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 187061
              mmTop = 0
              mmWidth = 2910
              BandType = 4
            end
            object pln18: TppLine
              UserName = 'pln18'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 4498
              mmLeft = 134938
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object pdbtxtQTDIASABONO: TppDBText
              UserName = 'pdbtxtQTDIASABONO'
              DataField = 'QTDIASABONO'
              DataPipeline = Ferias
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'Ferias'
              mmHeight = 2910
              mmLeft = 139171
              mmTop = 794
              mmWidth = 16140
              BandType = 4
            end
          end
          object psmrybnd2: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 2910
            mmPrintPosition = 0
            object pln19: TppLine
              UserName = 'pln19'
              StretchWithParent = True
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 0
              mmTop = 0
              mmWidth = 189971
              BandType = 7
            end
          end
          object rcdmdl3: TraCodeModule
            ProgramStream = {
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
              5375625265706F7274324F6E5072696E740B50726F6772616D54797065070B74
              7450726F63656475726506536F75726365064970726F63656475726520537562
              5265706F7274324F6E5072696E743B0D0A626567696E0D0A2020202020486561
              6465722E56697369626C65203A3D20747275653B0D0A656E643B0D0A0D436F6D
              706F6E656E744E616D65060A5375625265706F727432094576656E744E616D65
              06074F6E5072696E74074576656E74494402200000}
          end
        end
      end
      object psbrprt3: TppSubReport
        UserName = 'SubReport3'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        ShiftRelativeTo = psbrprt2
        TraverseAllData = False
        DataPipelineName = 'Contrib'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 88900
        mmWidth = 190000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        object pchldrprt3: TppChildReport
          AutoStop = False
          DataPipeline = Contrib
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'PpModeloReport1'
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.mmMarginBottom = 8000
          PrinterSetup.mmMarginLeft = 10000
          PrinterSetup.mmMarginRight = 10000
          PrinterSetup.mmMarginTop = 8000
          PrinterSetup.mmPaperHeight = 297000
          PrinterSetup.mmPaperWidth = 210000
          PrinterSetup.PaperSize = 9
          Template.SaveTo = stDatabase
          Units = utMillimeters
          Version = '7.04'
          mmColumnWidth = 0
          DataPipelineName = 'Contrib'
          object ptlbnd3: TppTitleBand
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
          end
          object phdrbnd2: TppHeaderBand
            mmBottomOffset = 0
            mmHeight = 14023
            mmPrintPosition = 0
            object pshp2: TppShape
              UserName = 'pshp2'
              Brush.Color = clSilver
              Pen.Color = clSilver
              mmHeight = 4498
              mmLeft = 265
              mmTop = 2910
              mmWidth = 189707
              BandType = 0
            end
            object Til13: TppLabel
              UserName = 'Til13'
              AutoSize = False
              Caption = 'CONTRIBUIÇÃO SINDICAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 2117
              mmTop = 3175
              mmWidth = 184680
              BandType = 0
            end
            object Til14: TppLabel
              UserName = 'Til14'
              AutoSize = False
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 3704
              mmTop = 8996
              mmWidth = 27781
              BandType = 0
            end
            object Til15: TppLabel
              UserName = 'Til15'
              AutoSize = False
              Caption = 'Moeda'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 39158
              mmTop = 8996
              mmWidth = 17198
              BandType = 0
            end
            object Til16: TppLabel
              UserName = 'Til16'
              AutoSize = False
              Caption = 'Valor da Contribuição'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3387
              mmLeft = 63765
              mmTop = 8731
              mmWidth = 42863
              BandType = 0
            end
            object Til17: TppLabel
              UserName = 'Til17'
              AutoSize = False
              Caption = 'Sindicato'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 8
              Font.Style = [fsBold]
              TextAlignment = taCentered
              Transparent = True
              mmHeight = 3440
              mmLeft = 115359
              mmTop = 8996
              mmWidth = 68527
              BandType = 0
            end
            object pln20: TppLine
              UserName = 'pln20'
              Weight = 0.75
              mmHeight = 2910
              mmLeft = 265
              mmTop = 2646
              mmWidth = 189707
              BandType = 0
            end
            object pln21: TppLine
              UserName = 'pln21'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 11377
              mmLeft = 0
              mmTop = 2646
              mmWidth = 8731
              BandType = 0
            end
            object pln22: TppLine
              UserName = 'pln22'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 34396
              mmTop = 7408
              mmWidth = 8731
              BandType = 0
            end
            object pln23: TppLine
              UserName = 'pln23'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 61648
              mmTop = 7408
              mmWidth = 8731
              BandType = 0
            end
            object pln24: TppLine
              UserName = 'pln24'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 6350
              mmLeft = 109538
              mmTop = 7408
              mmWidth = 8731
              BandType = 0
            end
            object pln25: TppLine
              UserName = 'pln25'
              Position = lpRight
              Weight = 0.75
              mmHeight = 10848
              mmLeft = 180182
              mmTop = 2910
              mmWidth = 9790
              BandType = 0
            end
            object pln26: TppLine
              UserName = 'pln26'
              Position = lpBottom
              Weight = 0.75
              mmHeight = 2910
              mmLeft = 265
              mmTop = 11113
              mmWidth = 189707
              BandType = 0
            end
          end
          object pdtlbnd3: TppDetailBand
            mmBottomOffset = 0
            mmHeight = 5027
            mmPrintPosition = 0
            object pln27: TppLine
              UserName = 'pln27'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 0
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object pdbtxtMES: TppDBText
              UserName = 'pdbtxtMES'
              DataField = 'MES'
              DataPipeline = Contrib
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'Contrib'
              mmHeight = 2910
              mmLeft = 3704
              mmTop = 794
              mmWidth = 27252
              BandType = 4
            end
            object pln28: TppLine
              UserName = 'pln28'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 34396
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object pdbtxtMoeda: TppDBText
              UserName = 'DBText301'
              DataField = 'Moeda'
              DataPipeline = Contrib
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'Contrib'
              mmHeight = 2910
              mmLeft = 39688
              mmTop = 794
              mmWidth = 16933
              BandType = 4
            end
            object pln29: TppLine
              UserName = 'pln29'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 61648
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object pdbtxtVALORPROVENTO: TppDBText
              UserName = 'pdbtxtVALORPROVENTO'
              DataField = 'VALORPROVENTO'
              DataPipeline = Contrib
              DisplayFormat = '#,0.00;-#,0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'Contrib'
              mmHeight = 2910
              mmLeft = 64294
              mmTop = 794
              mmWidth = 42069
              BandType = 4
            end
            object pln30: TppLine
              UserName = 'pln30'
              Position = lpLeft
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 109538
              mmTop = 0
              mmWidth = 3704
              BandType = 4
            end
            object pdbtxtRAZAO_SINDICATO: TppDBText
              UserName = 'pdbtxtRAZAO_SINDICATO'
              DataField = 'RAZAO_SINDICATO'
              DataPipeline = Contrib
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Name = 'Arial'
              Font.Size = 7
              Font.Style = []
              TextAlignment = taCentered
              Transparent = True
              DataPipelineName = 'Contrib'
              mmHeight = 2910
              mmLeft = 115623
              mmTop = 794
              mmWidth = 67998
              BandType = 4
            end
            object pln31: TppLine
              UserName = 'pln31'
              Position = lpRight
              Weight = 0.75
              mmHeight = 5027
              mmLeft = 187061
              mmTop = 0
              mmWidth = 2910
              BandType = 4
            end
          end
          object psmrybnd3: TppSummaryBand
            PrintHeight = phDynamic
            mmBottomOffset = 0
            mmHeight = 3000
            mmPrintPosition = 0
            object pln32: TppLine
              UserName = 'Line401'
              Weight = 0.75
              mmHeight = 1323
              mmLeft = 0
              mmTop = 0
              mmWidth = 189971
              BandType = 7
            end
          end
          object rcdmdl2: TraCodeModule
            ProgramStream = {
              01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650611
              5375625265706F7274334F6E5072696E740B50726F6772616D54797065070B74
              7450726F63656475726506536F75726365064970726F63656475726520537562
              5265706F7274334F6E5072696E743B0D0A626567696E0D0A2020202020486561
              6465722E56697369626C65203A3D20747275653B0D0A656E643B0D0A0D436F6D
              706F6E656E744E616D65060A5375625265706F727433094576656E744E616D65
              06074F6E5072696E74074576656E74494402200000}
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppLine60: TppLine
        UserName = 'Line60'
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 189971
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        ReprintOnOverFlow = True
        VarType = vtPageSetDesc
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3260
        mmLeft = 85979
        mmTop = 444
        mmWidth = 17484
        BandType = 8
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3260
        mmLeft = 164296
        mmTop = 444
        mmWidth = 25950
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      AfterPrint = ppSummaryBand1AfterPrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 1323
      mmPrintPosition = 0
    end
    object ppGroup2: TppGroup
      BreakName = 'IDPESSOA'
      DataPipeline = Dados
      OutlineSettings.CreateNode = True
      NewPage = True
      ResetPageNo = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'Dados'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 37042
        mmPrintPosition = 0
        object ppRegion1: TppRegion
          UserName = 'Region1'
          KeepTogether = True
          Brush.Style = bsClear
          Pen.Color = clWhite
          Pen.Style = psClear
          Transparent = True
          mmHeight = 36248
          mmLeft = 0
          mmTop = 265
          mmWidth = 190236
          BandType = 5
          GroupNo = 0
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          object Til1: TppLabel
            UserName = 'Til1'
            Caption = 
              'Declaro que recebi nesta data a Ficha de Anotações e Atualizaçõe' +
              's da Carteira de Trabalho e Previdência Social, nos termos da po' +
              'rtaria Nº 41 de 28 de Março de 2007 do Ministério do Trabalho e ' +
              'Emprego, a qual deverá ser mantida junto à minha Carteira de Tra' +
              'balho e Previdência Social.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            WordWrap = True
            mmHeight = 10848
            mmLeft = 1323
            mmTop = 1852
            mmWidth = 183886
            BandType = 5
            GroupNo = 0
          end
          object Til2: TppLabel
            UserName = 'Til2'
            Caption = 'Brasília, '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 1588
            mmTop = 16669
            mmWidth = 11113
            BandType = 5
            GroupNo = 0
          end
          object psystmvrbl1: TppSystemVariable
            UserName = 'psystmvrbl1'
            DisplayFormat = 'dd'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 12700
            mmTop = 16669
            mmWidth = 3175
            BandType = 5
            GroupNo = 0
          end
          object Til3: TppLabel
            UserName = 'Til3'
            Caption = 'de'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 16933
            mmTop = 16669
            mmWidth = 3175
            BandType = 5
            GroupNo = 0
          end
          object psystmvrbl2: TppSystemVariable
            UserName = 'psystmvrbl2'
            DisplayFormat = 'mmmm'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            TextAlignment = taCentered
            Transparent = True
            mmHeight = 3175
            mmLeft = 21431
            mmTop = 16669
            mmWidth = 12965
            BandType = 5
            GroupNo = 0
          end
          object Til4: TppLabel
            UserName = 'Til4'
            Caption = 'de'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 34660
            mmTop = 16669
            mmWidth = 3175
            BandType = 5
            GroupNo = 0
          end
          object psystmvrbl3: TppSystemVariable
            UserName = 'psystmvrbl3'
            DisplayFormat = 'yyyy'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 38629
            mmTop = 16669
            mmWidth = 6350
            BandType = 5
            GroupNo = 0
          end
          object Til5: TppLabel
            UserName = 'Til5'
            Caption = '.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            Transparent = True
            mmHeight = 3175
            mmLeft = 45244
            mmTop = 16669
            mmWidth = 2117
            BandType = 5
            GroupNo = 0
          end
          object pln1: TppLine
            UserName = 'pln1'
            Position = lpBottom
            Weight = 0.75
            mmHeight = 3969
            mmLeft = 1323
            mmTop = 25665
            mmWidth = 85990
            BandType = 5
            GroupNo = 0
          end
          object pdbtxtRAZAO_EMPRESA: TppDBText
            UserName = 'pdbtxtRAZAO_EMPRESA'
            DataField = 'RAZAO_EMPRESA'
            DataPipeline = Dados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ParentDataPipeline = False
            TextAlignment = taCentered
            Transparent = True
            DataPipelineName = 'Dados'
            mmHeight = 3175
            mmLeft = 1323
            mmTop = 30427
            mmWidth = 85990
            BandType = 5
            GroupNo = 0
          end
          object pln2: TppLine
            UserName = 'pln2'
            Position = lpBottom
            Weight = 0.75
            mmHeight = 3969
            mmLeft = 100277
            mmTop = 25665
            mmWidth = 85990
            BandType = 5
            GroupNo = 0
          end
          object pdbtxtNOME_EMPREGADO: TppDBText
            UserName = 'pdbtxtNOME_EMPREGADO'
            DataField = 'NOME_EMPREGADO'
            DataPipeline = Dados
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Name = 'Arial'
            Font.Size = 8
            Font.Style = []
            ParentDataPipeline = False
            TextAlignment = taCentered
            Transparent = True
            DataPipelineName = 'Dados'
            mmHeight = 3175
            mmLeft = 100277
            mmTop = 30427
            mmWidth = 85725
            BandType = 5
            GroupNo = 0
          end
        end
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object Dados: TppBDEPipeline
    DataSource = dsDados
    UserName = 'Dados'
    Left = 22
    Top = 64
    object DadosppField1: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DadosppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DadosppField3: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DadosppField4: TppField
      FieldAlias = 'DATANASC'
      FieldName = 'DATANASC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DadosppField5: TppField
      FieldAlias = 'NOME_EMPREGADO'
      FieldName = 'NOME_EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object DadosppField6: TppField
      FieldAlias = 'SEXO'
      FieldName = 'SEXO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object DadosppField7: TppField
      FieldAlias = 'CTPS'
      FieldName = 'CTPS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object DadosppField8: TppField
      FieldAlias = 'PIS'
      FieldName = 'PIS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object DadosppField9: TppField
      FieldAlias = 'CPF_EMPREGADO'
      FieldName = 'CPF_EMPREGADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object DadosppField10: TppField
      FieldAlias = 'RG'
      FieldName = 'RG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object DadosppField11: TppField
      FieldAlias = 'ORGAO_EMISSOR_RG'
      FieldName = 'ORGAO_EMISSOR_RG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object DadosppField12: TppField
      FieldAlias = 'LOTACAO'
      FieldName = 'LOTACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object DadosppField13: TppField
      FieldAlias = 'RAZAO_EMPRESA'
      FieldName = 'RAZAO_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object DadosppField14: TppField
      FieldAlias = 'NOME_EMPRESA'
      FieldName = 'NOME_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object DadosppField15: TppField
      FieldAlias = 'ENDERECO_EMPRESA'
      FieldName = 'ENDERECO_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object DadosppField16: TppField
      FieldAlias = 'NUM_END_EMPRESA'
      FieldName = 'NUM_END_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object DadosppField17: TppField
      FieldAlias = 'COMPL_END_EMPRESA'
      FieldName = 'COMPL_END_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object DadosppField18: TppField
      FieldAlias = 'BAIRRO_EMPRESA'
      FieldName = 'BAIRRO_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object DadosppField19: TppField
      FieldAlias = 'CIDADE_EMPRESA'
      FieldName = 'CIDADE_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object DadosppField20: TppField
      FieldAlias = 'UF_EMPRESA'
      FieldName = 'UF_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object DadosppField21: TppField
      FieldAlias = 'CEP_EMPRESA'
      FieldName = 'CEP_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object DadosppField22: TppField
      FieldAlias = 'CNPJ_EMPRESA'
      FieldName = 'CNPJ_EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object DadosppField23: TppField
      FieldAlias = 'TITULO'
      FieldName = 'TITULO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object DadosppField24: TppField
      FieldAlias = 'SINDICATO'
      FieldName = 'SINDICATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
  end
  object dsDados: TwwDataSource
    AutoEdit = False
    DataSet = cdsDados
    Left = 22
    Top = 112
  end
  object sqlDados: TCMSqlParams
    SQL.Strings = (
      'SELECT -- FUNCIONARIO'
      '       PFUNC.IDPESSOA,'
      '       F.MATRICULA,'
      '       F.DATAADMISSAO,'
      '       PF.DATANASC,'
      '       PFUNC.NOME NOME_EMPREGADO,'
      '       C.TITULO,'
      '       PF.SEXO,'
      '       DOC_CT.NUMDOCUMENTO CTPS,'
      '       DOC_PIS.NUMDOCUMENTO PIS,'
      '      CAST('
      '       CASE LENGTH(REGEXP_REPLACE(PFUNC.NUMDOCUMENTO, '#39'\D'#39'))'
      '         WHEN 11 THEN'
      
        '          REGEXP_REPLACE(REGEXP_REPLACE(PFUNC.NUMDOCUMENTO, '#39'\D'#39 +
        '), '#39'([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'#39','#39'\1.\2.\3-\4'#39')'
      '         WHEN 14 THEN'
      
        '          REGEXP_REPLACE(REGEXP_REPLACE(PFUNC.NUMDOCUMENTO, '#39'\D'#39 +
        '), '#39'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'#39','#39'\1.\2.\' +
        '3/\4-\5'#39')'
      '         ELSE'
      '          REGEXP_REPLACE(PFUNC.NUMDOCUMENTO, '#39'\D'#39')'
      '       END AS VARCHAR2(20)) CPF_EMPREGADO,'
      '       DOC_RG.NUMDOCUMENTO RG,'
      '       DOC_RG.ORGAO ORGAO_EMISSOR_RG,'
      '       CC.NOME LOTACAO,'
      '       PSIND.RAZAOSOCIAL SINDICATO,'
      '       -- EMPRESA'
      '       PEMPRESA.RAZAOSOCIAL RAZAO_EMPRESA,'
      '       PEMPRESA.NOME NOME_EMPRESA,       '
      '       CAST('
      '       CASE LENGTH(REGEXP_REPLACE(PEMPRESA.NUMDOCUMENTO, '#39'\D'#39'))'
      '         WHEN 11 THEN'
      
        '          REGEXP_REPLACE(REGEXP_REPLACE(PEMPRESA.NUMDOCUMENTO, '#39 +
        '\D'#39'), '#39'([0-9]{3})([0-9]{3})([0-9]{3})([0-9]{2})'#39','#39'\1.\2.\3-\4'#39')'
      '         WHEN 14 THEN'
      
        '          REGEXP_REPLACE(REGEXP_REPLACE(PEMPRESA.NUMDOCUMENTO, '#39 +
        '\D'#39'), '#39'([0-9]{2})([0-9]{3})([0-9]{3})([0-9]{4})([0-9]{2})'#39','#39'\1.\' +
        '2.\3/\4-\5'#39')'
      '         ELSE'
      '          REGEXP_REPLACE(PEMPRESA.NUMDOCUMENTO, '#39'\D'#39')'
      '       END AS VARCHAR2(20)) CNPJ_EMPRESA,'
      '       EMPRESA_END.LOGRADOURO ENDERECO_EMPRESA,'
      '       EMPRESA_END.NUMERO NUM_END_EMPRESA,'
      '       EMPRESA_END.COMPLEMENTO COMPL_END_EMPRESA,'
      '       EMPRESA_END.BAIRRO BAIRRO_EMPRESA,'
      '       EMPRESA_END.CIDADE CIDADE_EMPRESA,'
      '       EMPRESA_END.UF UF_EMPRESA,'
      '       EMPRESA_END.CEP CEP_EMPRESA      '
      '  FROM FUNCIONARIO F'
      '  JOIN CARGO C ON C.Idcargo = F.Idcargo'
      '  JOIN PESSOA PFUNC ON F.IDPESSOA = PFUNC.IDPESSOA'
      '  JOIN PESSOAFISICA PF ON PF.IDPESSOA = F.IDPESSOA'
      
        '  JOIN PESSOA PSIND ON PSIND.IDPESSOA = PF.IDSINDICATO /*Sindica' +
        'to*/'
      
        '  JOIN CENTCUST CC ON CC.CODCENTROCUSTO = F.CODCENTROCUSTO AND C' +
        'C.IDEMPRESA = F.IDEMPRESA'
      
        '  JOIN DOCPESSOA DOC_RG ON DOC_RG.IDPESSOA = F.IDPESSOA AND DOC_' +
        'RG.IDDOCUMENTO = 11 /*Carteira de Identidade*/'
      
        '  LEFT JOIN DOCPESSOA DOC_PIS ON DOC_PIS.IDPESSOA = F.IDPESSOA A' +
        'ND DOC_PIS.IDDOCUMENTO = 6 /*PIS/PASEP*/'
      
        '  LEFT JOIN DOCPESSOA DOC_CT ON DOC_CT.IDPESSOA = F.IDPESSOA AND' +
        ' DOC_CT.IDDOCUMENTO = 9 /*Carteira de Trabalho*/  '
      '  JOIN PESSOA PEMPRESA ON PEMPRESA.IDPESSOA = F.IDEMPRESA'
      '  LEFT JOIN ('
      
        'SELECT EJ.IDPESSOA, EJ.IDENDERECO, EJ.LOGRADOURO, EJ.NUMERO, EJ.' +
        'COMPLEMENTO, EJ.BAIRRO, CJ.NOME CIDADE, CJ.UF, EJ.CEP'
      '  FROM ENDPESS EJ'
      '  JOIN CIDADES CJ ON EJ.IDCIDADES = CJ.IDCIDADES'
      
        '  JOIN ESTADO ESTJ ON CJ.CODESTADO = ESTJ.CODESTADO AND CJ.IDPAI' +
        'S = ESTJ.IDPAIS'
      
        '             ) EMPRESA_END ON EMPRESA_END.IDPESSOA = PEMPRESA.ID' +
        'PESSOA AND EMPRESA_END.IDENDERECO = PEMPRESA.IDENDCOMERCIAL'
      ' WHERE 1=2')
    ClientDataSet = cdsDados
    Left = 22
    Top = 208
  end
  object Cargo: TppDBPipeline
    DataSource = dsCargo
    UserName = 'Cargo'
    Left = 86
    Top = 64
    MasterDataPipelineName = 'Dados'
    object CargoppField1: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object CargoppField2: TppField
      FieldAlias = 'DATAALTERFUNC'
      FieldName = 'DATAALTERFUNC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object CargoppField3: TppField
      FieldAlias = 'MOEDA'
      FieldName = 'MOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object CargoppField4: TppField
      FieldAlias = 'SALARIO'
      FieldName = 'SALARIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object CargoppField5: TppField
      FieldAlias = 'FUNCAO'
      FieldName = 'FUNCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object CargoppField6: TppField
      FieldAlias = 'CARGO_FUNCAO'
      FieldName = 'CARGO_FUNCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object CargoppField7: TppField
      FieldAlias = 'CBO_CARGO_FUNCAO'
      FieldName = 'CBO_CARGO_FUNCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object CargoppField8: TppField
      FieldAlias = 'VLRSALARIOFUNCAO'
      FieldName = 'VLRSALARIOFUNCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object CargoppField9: TppField
      FieldAlias = 'MOTIVO'
      FieldName = 'MOTIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object CargoppField10: TppField
      FieldAlias = 'VLRFUNCAO'
      FieldName = 'VLRFUNCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object SubConsulta1ppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'IDPESSOA'
      DetailFieldName = 'IDPESSOA'
      DetailSortOrder = soAscending
    end
  end
  object Ferias: TppDBPipeline
    DataSource = dsFerias
    UserName = 'Ferias'
    Left = 150
    Top = 63
    MasterDataPipelineName = 'Dados'
    object SubConsulta2ppField1: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object SubConsulta2ppField4: TppField
      FieldAlias = 'PERIODO_AQUISITIVO'
      FieldName = 'PERIODO_AQUISITIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object SubConsulta2ppField7: TppField
      FieldAlias = 'PERIODO_FERIAS'
      FieldName = 'PERIODO_FERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object SubConsulta2ppField8: TppField
      FieldAlias = 'DIAS_FERIAS'
      FieldName = 'DIAS_FERIAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object SubConsulta2ppField9: TppField
      FieldAlias = 'ABONO_PEC'
      FieldName = 'ABONO_PEC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object SubConsulta2ppField10: TppField
      FieldAlias = 'QTDIASABONO'
      FieldName = 'QTDIASABONO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object SubConsulta2ppField11: TppField
      FieldAlias = 'ADTO13'
      FieldName = 'ADTO13'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object SubConsulta2ppField12: TppField
      FieldAlias = 'NUMSEQ'
      FieldName = 'NUMSEQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object SubConsulta2ppMasterFieldLink2: TppMasterFieldLink
      MasterFieldName = 'IDPESSOA'
      DetailFieldName = 'IDPESSOA'
      DetailSortOrder = soAscending
    end
  end
  object Contrib: TppDBPipeline
    DataSource = dsContrib
    UserName = 'Contrib'
    Left = 214
    Top = 63
    MasterDataPipelineName = 'Dados'
    object SubConsulta3ppField1: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object SubConsulta3ppField2: TppField
      FieldAlias = 'VALORPROVENTO'
      FieldName = 'VALORPROVENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object SubConsulta3ppField3: TppField
      FieldAlias = 'RAZAO_SINDICATO'
      FieldName = 'RAZAO_SINDICATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object SubConsulta3ppField4: TppField
      FieldAlias = 'MOEDA'
      FieldName = 'MOEDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object SubConsulta3ppField5: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object SubConsulta3ppMasterFieldLink2: TppMasterFieldLink
      MasterFieldName = 'IDPESSOA'
      DetailFieldName = 'IDPESSOA'
      DetailSortOrder = soAscending
    end
  end
  object dsContrib: TwwDataSource
    AutoEdit = False
    DataSet = cdsContrib
    Left = 214
    Top = 111
  end
  object dsFerias: TwwDataSource
    AutoEdit = False
    DataSet = cdsFerias
    Left = 150
    Top = 111
  end
  object dsCargo: TwwDataSource
    AutoEdit = False
    DataSet = cdsCargo
    Left = 86
    Top = 111
  end
  object cdsFerias: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 150
    Top = 159
    object fltfldFeriasIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object strngfldFeriasPERIODO_AQUISITIVO: TStringField
      FieldName = 'PERIODO_AQUISITIVO'
      Size = 23
    end
    object strngfldFeriasPERIODO_FERIAS: TStringField
      FieldName = 'PERIODO_FERIAS'
      Size = 23
    end
    object fltfldFeriasDIAS_FERIAS: TFloatField
      FieldName = 'DIAS_FERIAS'
    end
    object strngfldFeriasABONO_PEC: TStringField
      FieldName = 'ABONO_PEC'
      Size = 40
    end
    object fltfldFeriasQTDIASABONO: TFloatField
      FieldName = 'QTDIASABONO'
    end
    object strngfldFeriasADTO13: TStringField
      FieldName = 'ADTO13'
      FixedChar = True
      Size = 3
    end
    object fltfldFeriasNUMSEQ: TFloatField
      FieldName = 'NUMSEQ'
    end
  end
  object cdsContrib: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 214
    Top = 159
    object cdsContribMES: TStringField
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object cdsContribVALORPROVENTO: TFloatField
      FieldName = 'VALORPROVENTO'
    end
    object cdsContribRAZAO_SINDICATO: TStringField
      FieldName = 'RAZAO_SINDICATO'
      Size = 60
    end
    object cdsContribMOEDA: TStringField
      FieldName = 'MOEDA'
      FixedChar = True
      Size = 2
    end
    object cdsContribIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  object sqlContrib: TCMSqlParams
    SQL.Strings = (
      ''
      'SELECT '
      '       PF.IDPESSOA,'
      '       H.MES,'
      '       H.VALORPROVENTO,'
      '       '#39'R$'#39' MOEDA,'
      '       PSIND.RAZAOSOCIAL RAZAO_SINDICATO'
      '  FROM HISTRUBSAL H'
      '  JOIN PESSOAFISICA PF ON PF.IDPESSOA = H.IDPESSOA'
      '  JOIN PESSOA PSIND ON PSIND.IDPESSOA = PF.IDSINDICATO'
      
        ' WHERE H.IDRUBRICA IN (7080, 38937) /*CONTRIBUICAO SINDICAL / CO' +
        'NTRIBUICAO SINDICAL CATEGORIA APOIO*/'
      '   AND 1=2'
      '   AND H.IDPESSJUR = 1'
      ' ORDER BY PF.IDPESSOA, H.MES DESC')
    ClientDataSet = cdsContrib
    Left = 214
    Top = 207
  end
  object sqlFerias: TCMSqlParams
    SQL.Strings = (
      'SELECT FE.IDPESSOA,      '
      '       TO_CHAR(FE.INIPERIODOFERIAS, '#39'DD/MM/YYYY'#39') ||'#39' a '#39'|| '
      
        '       TO_CHAR(ADD_MONTHS(FE.INIPERIODOFERIAS, 12)-1, '#39'DD/MM/YYY' +
        'Y'#39') PERIODO_AQUISITIVO,      '
      '       TO_CHAR(FE.INIGOZOFERIAS, '#39'DD/MM/YYYY'#39') ||'#39' a '#39'||'
      '       TO_CHAR(FE.FIMGOZOFERIAS, '#39'DD/MM/YYYY'#39') PERIODO_FERIAS,'
      '       FE.FIMGOZOFERIAS - FE.INIGOZOFERIAS + 1 DIAS_FERIAS,'
      
        '       DECODE(FE.FLGABONO, 0, '#39'Não'#39', 1, '#39'Sim'#39', FE.FLGABONO) ABON' +
        'O_PEC,'
      '       FE.QTDIASABONO,'
      '       '#39'Não'#39' Adto13,'
      '       FE.NUMSEQ'
      '  FROM FERIAS FE'
      ' WHERE NOT EXISTS (SELECT 1'
      '                     FROM ANTECIP13 A'
      '                    WHERE A.IDPESSOA = FE.IDPESSOA'
      
        '                      AND TO_CHAR(FE.INIGOZOFERIAS, '#39'MM'#39') = A.ME' +
        'S '
      
        '                      AND TO_CHAR(FE.INIGOZOFERIAS, '#39'YYYY'#39') = A.' +
        'ANO)'
      '   AND 1=2'
      'UNION ALL'
      'SELECT FE.IDPESSOA,     '
      '       TO_CHAR(FE.INIPERIODOFERIAS, '#39'DD/MM/YYYY'#39') ||'#39' a '#39'|| '
      
        '       TO_CHAR(ADD_MONTHS(FE.INIPERIODOFERIAS, 12)-1, '#39'DD/MM/YYY' +
        'Y'#39') PERIODO_AQUISITIVO,     '
      '       TO_CHAR(FE.INIGOZOFERIAS, '#39'DD/MM/YYYY'#39') ||'#39' a '#39'||'
      '       TO_CHAR(FE.FIMGOZOFERIAS, '#39'DD/MM/YYYY'#39') PERIODO_FERIAS,'
      '       FE.FIMGOZOFERIAS - FE.INIGOZOFERIAS + 1 DIAS_FERIAS,'
      
        '       DECODE(FE.FLGABONO, 0, '#39'Não'#39', 1, '#39'Sim'#39', FE.FLGABONO) ABON' +
        'O_PEC,'
      '       FE.QTDIASABONO,'
      '       '#39'Sim'#39' Adto13,'
      '       FE.NUMSEQ'
      '  FROM FERIAS FE'
      
        '  JOIN ANTECIP13 A ON A.IDPESSOA = FE.IDPESSOA AND TO_CHAR(FE.IN' +
        'IGOZOFERIAS, '#39'MM'#39') = A.MES '
      
        '                                               AND TO_CHAR(FE.IN' +
        'IGOZOFERIAS, '#39'YYYY'#39') = A.ANO'
      ' WHERE 1=2'
      ' ORDER BY IDPESSOA, NUMSEQ DESC')
    ClientDataSet = cdsFerias
    Left = 150
    Top = 207
  end
  object sqlCargo: TCMSqlParams
    SQL.Strings = (
      'SELECT E.IDPESSOA,'
      '       E.DATAALTERFUNC,       '
      '       '#39'R$'#39' MOEDA,'
      '       E.SALARIO,       '
      '       -- FUNÇÃO'
      '       CF.TITULO FUNCAO,'
      '       -- CARGO / FUNÇÃO'
      
        '       DECODE(E.IDFUNCAO, NULL, C.TITULO, C.TITULO ||'#39' / '#39'|| CF.' +
        'TITULO) CARGO_FUNCAO,'
      '       NVL(CF.CBO2002, C.CBO2002) CBO_CARGO_FUNCAO,       '
      '       E.VLRSALARIOFUNCAO,'
      '       NVL(E.VLRFUNCAO, 0) VLRFUNCAO,'
      '       M.DESCRICAO MOTIVO'
      '  FROM EVOLFUNC E '
      '  JOIN CARGO C ON C.IDCARGO = E.IDCARGO'
      '  JOIN MOTIVO M ON M.IDMOTIVO = E.IDMOTIVO'
      '  LEFT JOIN CARGO CF ON CF.IDCARGO = E.IDFUNCAO'
      
        ' WHERE E.IDMOTIVO NOT IN (19, 33) /*Transferência E Alteração do' +
        ' nome e/ou código da lotação*/'
      '   AND 1=2'
      ' ORDER BY E.IDPESSOA, E.DATAALTERFUNC DESC, E.TRGDTINCLUSAO DESC')
    ClientDataSet = cdsCargo
    Left = 86
    Top = 207
  end
  object cdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 86
    Top = 159
    object cdsCargoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsCargoDATAALTERFUNC: TDateTimeField
      FieldName = 'DATAALTERFUNC'
    end
    object strngfldSub1MOEDA: TStringField
      FieldName = 'MOEDA'
      FixedChar = True
      Size = 2
    end
    object cdsCargoSALARIO: TFloatField
      FieldName = 'SALARIO'
    end
    object strngfldSub1FUNCAO: TStringField
      FieldName = 'FUNCAO'
      Size = 40
    end
    object strngfldSub1CARGO_FUNCAO: TStringField
      FieldName = 'CARGO_FUNCAO'
      Size = 83
    end
    object cdsCargoCBO_CARGO_FUNCAO: TFloatField
      FieldName = 'CBO_CARGO_FUNCAO'
    end
    object cdsCargoVLRSALARIOFUNCAO: TFloatField
      FieldName = 'VLRSALARIOFUNCAO'
    end
    object strngfldSub1MOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 50
    end
    object cdsCargoVLRFUNCAO: TFloatField
      FieldName = 'VLRFUNCAO'
    end
  end
  object cdsDados: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 22
    Top = 160
    object cdsDadosIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object strngfldConsultaMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object cdsDadosDATAADMISSAO: TDateTimeField
      FieldName = 'DATAADMISSAO'
    end
    object cdsDadosDATANASC: TDateTimeField
      FieldName = 'DATANASC'
    end
    object strngfldConsultaNOME_EMPREGADO: TStringField
      FieldName = 'NOME_EMPREGADO'
      Size = 60
    end
    object strngfldConsultaSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object strngfldConsultaCTPS: TStringField
      FieldName = 'CTPS'
      Size = 30
    end
    object strngfldConsultaPIS: TStringField
      FieldName = 'PIS'
      Size = 30
    end
    object strngfldConsultaCPF_EMPREGADO: TStringField
      FieldName = 'CPF_EMPREGADO'
      Size = 18
    end
    object strngfldConsultaRG: TStringField
      FieldName = 'RG'
      Size = 30
    end
    object strngfldConsultaORGAO_EMISSOR_RG: TStringField
      FieldName = 'ORGAO_EMISSOR_RG'
      Size = 30
    end
    object strngfldConsultaLOTACAO: TStringField
      FieldName = 'LOTACAO'
      Size = 30
    end
    object strngfldConsultaRAZAO_EMPRESA: TStringField
      FieldName = 'RAZAO_EMPRESA'
      Size = 60
    end
    object strngfldConsultaNOME_EMPRESA: TStringField
      FieldName = 'NOME_EMPRESA'
      Size = 60
    end
    object strngfldConsultaENDERECO_EMPRESA: TStringField
      FieldName = 'ENDERECO_EMPRESA'
      Size = 200
    end
    object strngfldConsultaNUM_END_EMPRESA: TStringField
      FieldName = 'NUM_END_EMPRESA'
      Size = 8
    end
    object strngfldConsultaCOMPL_END_EMPRESA: TStringField
      FieldName = 'COMPL_END_EMPRESA'
      Size = 200
    end
    object strngfldConsultaBAIRRO_EMPRESA: TStringField
      FieldName = 'BAIRRO_EMPRESA'
      Size = 200
    end
    object strngfldConsultaCIDADE_EMPRESA: TStringField
      FieldName = 'CIDADE_EMPRESA'
      Size = 50
    end
    object strngfldConsultaUF_EMPRESA: TStringField
      FieldName = 'UF_EMPRESA'
      FixedChar = True
      Size = 3
    end
    object strngfldConsultaCEP_EMPRESA: TStringField
      FieldName = 'CEP_EMPRESA'
      Size = 8
    end
    object cdsDadosCNPJ_EMPRESA: TStringField
      FieldName = 'CNPJ_EMPRESA'
      Size = 18
    end
    object cdsDadosTITULO: TStringField
      FieldName = 'TITULO'
      Size = 40
    end
    object cdsDadosSINDICATO: TStringField
      FieldName = 'SINDICATO'
      Size = 60
    end
  end
  object dsFoto: TwwDataSource
    AutoEdit = False
    DataSet = qryFoto
    Left = 275
    Top = 111
  end
  object Foto: TppDBPipeline
    DataSource = dsFoto
    UserName = 'Foto'
    Left = 272
    Top = 63
    MasterDataPipelineName = 'Dados'
    object FotoppField1: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object FotoppField2: TppField
      FieldAlias = 'FOTO'
      FieldName = 'FOTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object FotoppMasterFieldLink1: TppMasterFieldLink
      MasterFieldName = 'IDPESSOA'
      DetailFieldName = 'IDPESSOA'
      DetailSortOrder = soAscending
    end
  end
  object updFoto: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDIMAGEM = :IDIMAGEM'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      '  (IDPESSOA, IDIMAGEM)'
      'values'
      '  (:IDPESSOA, :IDIMAGEM)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 272
    Top = 208
  end
  object qryApp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.IDPESSOA, T.FOTO FROM'
      '('
      'SELECT '
      '       P.IDPESSOA,       '
      '       I.IMAGEM FOTO,'
      '       ROWNUM LINHA'
      '  from PESSOA P , '
      '          IMAGENS I '
      ''
      ' WHERE 1=2'
      ''
      'AND I.IDIMAGEM = P.IDIMAGEM'
      ''
      ' ORDER BY P.IDPESSOA'
      ' ) T'
      ' where linha between :ini and :fim')
    ValidateWithMask = True
    Left = 320
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ini'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fim'
        ParamType = ptUnknown
      end>
  end
  object qryFoto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '       P.IDPESSOA,       '
      '       I.IMAGEM FOTO'
      '  from PESSOA P , '
      ' IMAGENS I '
      ' '
      ' WHERE    1=2')
    UpdateObject = updFoto
    ValidateWithMask = False
    Left = 272
    Top = 160
  end
end
