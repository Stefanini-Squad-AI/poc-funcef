inherited rptSuplemen: TrptSuplemen
  Left = 281
  Top = 328
  Width = 211
  Height = 114
  Caption = 'rptSuplemen'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'No. Alteração'
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
        Caption = 'Valor'
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
    Report = rpSuplemen
    LabelEmpresa = ppLabel176
    LabelSistema = ppLabel186
  end
  object cdsSuplemen: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 44
    Top = 40
  end
  object dsSuplemen: TwwDataSource
    DataSet = cdsSuplemen
    Left = 80
    Top = 40
  end
  object pplSuplemen: TppBDEPipeline
    DataSource = dsSuplemen
    UserName = 'lSuplemen'
    Left = 120
    Top = 40
    object pplSuplemenppField1: TppField
      FieldAlias = 'IDCONTAORIGEM'
      FieldName = 'IDCONTAORIGEM'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object pplSuplemenppField2: TppField
      FieldAlias = 'CONTAORI'
      FieldName = 'CONTAORI'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplSuplemenppField3: TppField
      FieldAlias = 'OBSALTERORCAMEN'
      FieldName = 'OBSALTERORCAMEN'
      FieldLength = 1000
      DataType = dtMemo
      DisplayWidth = 10
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplSuplemenppField4: TppField
      FieldAlias = 'DATAREFERENCIA'
      FieldName = 'DATAREFERENCIA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 3
    end
    object pplSuplemenppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'NUMALTERACAO'
      FieldName = 'NUMALTERACAO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object pplSuplemenppField6: TppField
      FieldAlias = 'CODCENTRORESPON'
      FieldName = 'CODCENTRORESPON'
      FieldLength = 10
      DisplayWidth = 10
      Position = 5
    end
    object pplSuplemenppField7: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object pplSuplemenppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRSOLICITADO'
      FieldName = 'VLRSOLICITADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
  end
  object rpSuplemen: TppReport
    AutoStop = False
    DataPipeline = pplSuplemen
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 160
    Top = 40
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplSuplemen'
    object ppHeaderBand19: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppLabel171: TppLabel
        UserName = 'ppLabel171'
        Caption = 'Suplementação Orçamentária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 68792
        mmTop = 8731
        mmWidth = 59531
        BandType = 0
      end
      object ppLine48: TppLine
        UserName = 'ppLine48'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15346
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel176: TppLabel
        UserName = 'ppLabel176'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 82021
        mmTop = 1588
        mmWidth = 27781
        BandType = 0
      end
    end
    object ppDetailBand18: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 212196
      mmPrintPosition = 0
      object ppShape4: TppShape
        UserName = 'ppShape4'
        mmHeight = 149225
        mmLeft = 3704
        mmTop = 39158
        mmWidth = 186267
        BandType = 4
      end
      object ppLabel177: TppLabel
        UserName = 'ppLabel177'
        Caption = 'Centro de Responsabilidade : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 12700
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText69: TppDBText
        UserName = 'ppDBText69'
        DataField = 'CODCENTRORESPON'
        DataPipeline = pplSuplemen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSuplemen'
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 12700
        mmWidth = 22490
        BandType = 4
      end
      object ppLabel178: TppLabel
        UserName = 'ppLabel178'
        Caption = 'Conta Orçamentária Origem : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 18521
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText73: TppDBText
        UserName = 'ppDBText73'
        DataField = 'NOME'
        DataPipeline = pplSuplemen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSuplemen'
        mmHeight = 4233
        mmLeft = 80169
        mmTop = 12700
        mmWidth = 95515
        BandType = 4
      end
      object ppDBText74: TppDBText
        UserName = 'ppDBText74'
        DataField = 'IDCONTAORIGEM'
        DataPipeline = pplSuplemen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSuplemen'
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 18521
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText75: TppDBText
        UserName = 'ppDBText75'
        DataField = 'CONTAORI'
        DataPipeline = pplSuplemen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSuplemen'
        mmHeight = 4233
        mmLeft = 80169
        mmTop = 18521
        mmWidth = 95515
        BandType = 4
      end
      object ppLabel181: TppLabel
        UserName = 'ppLabel181'
        AutoSize = False
        Caption = 'Observações da Suplementação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 33867
        mmWidth = 58473
        BandType = 4
      end
      object ppDBText76: TppDBText
        UserName = 'ppDBText76'
        DataField = 'DATAREFERENCIA'
        DataPipeline = pplSuplemen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSuplemen'
        mmHeight = 5821
        mmLeft = 21431
        mmTop = 1852
        mmWidth = 32015
        BandType = 4
      end
      object ppLabel182: TppLabel
        UserName = 'ppLabel182'
        Caption = 'Data : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 4498
        mmTop = 1852
        mmWidth = 15610
        BandType = 4
      end
      object ppLabel183: TppLabel
        UserName = 'ppLabel183'
        AutoSize = False
        Caption = 'Nº Suplementação : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5821
        mmLeft = 105040
        mmTop = 1852
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText77: TppDBText
        UserName = 'ppDBText77'
        DataField = 'NUMALTERACAO'
        DataPipeline = pplSuplemen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSuplemen'
        mmHeight = 5821
        mmLeft = 157427
        mmTop = 1852
        mmWidth = 32015
        BandType = 4
      end
      object ppLabel184: TppLabel
        UserName = 'ppLabel184'
        AutoSize = False
        Caption = 'Valor : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 63765
        mmTop = 189442
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText78: TppDBText
        UserName = 'ppDBText78'
        DataField = 'VLRSOLICITADO'
        DataPipeline = pplSuplemen
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplSuplemen'
        mmHeight = 3969
        mmLeft = 85990
        mmTop = 189442
        mmWidth = 39688
        BandType = 4
      end
      object ppLine49: TppLine
        UserName = 'ppLine49'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 9790
        mmWidth = 197300
        BandType = 4
      end
      object rptSuplemenLine1: TppLine
        UserName = 'rptSuplemenLine1'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 4233
        mmTop = 203730
        mmWidth = 59267
        BandType = 4
      end
      object rptSuplemenLabel1: TppLabel
        UserName = 'rptSuplemenLabel1'
        Caption = 'Gestor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 25665
        mmTop = 204788
        mmWidth = 10319
        BandType = 4
      end
      object rptSuplemenLabel2: TppLabel
        UserName = 'rptSuplemenLabel2'
        Caption = 'Diretoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 152136
        mmTop = 204788
        mmWidth = 12700
        BandType = 4
      end
      object rptSuplemenLine2: TppLine
        UserName = 'rptSuplemenLine2'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 128059
        mmTop = 203730
        mmWidth = 59531
        BandType = 4
      end
      object rptSuplemenLabel3: TppLabel
        UserName = 'rptSuplemenLabel3'
        Caption = 'Orçamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 91017
        mmTop = 204788
        mmWidth = 16933
        BandType = 4
      end
      object rptSuplemenLine3: TppLine
        UserName = 'rptSuplemenLine3'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 67204
        mmTop = 203730
        mmWidth = 58208
        BandType = 4
      end
      object txtSaldoSuplemen: TppLabel
        UserName = 'txtSaldoSuplemen'
        AutoSize = False
        Caption = 'txtSaldoSuplemen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 151871
        mmTop = 189442
        mmWidth = 36248
        BandType = 4
      end
      object rptSuplemenLabel5: TppLabel
        UserName = 'rptSuplemenLabel5'
        AutoSize = False
        Caption = 'Saldo : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 130175
        mmTop = 189442
        mmWidth = 20108
        BandType = 4
      end
      object rptSuplemenDBMemo1: TppDBMemo
        UserName = 'rptSuplemenDBMemo1'
        CharWrap = False
        DataField = 'OBSALTERORCAMEN'
        DataPipeline = pplSuplemen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplSuplemen'
        mmHeight = 146050
        mmLeft = 4763
        mmTop = 40217
        mmWidth = 183357
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel247: TppLabel
        UserName = 'Label247'
        AutoSize = False
        Caption = 'Saldo Ant: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 189442
        mmWidth = 20108
        BandType = 4
      end
      object txtSaldoAntSuplemen: TppLabel
        UserName = 'txtSaldoAntSuplemen'
        AutoSize = False
        Caption = 'txtSaldoAntSuplemen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 189442
        mmWidth = 36248
        BandType = 4
      end
    end
    object ppFooterBand19: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine50: TppLine
        UserName = 'ppLine50'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel186: TppLabel
        UserName = 'ppLabel186'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1588
        mmWidth = 79375
        BandType = 8
      end
      object ppCalc36: TppSystemVariable
        UserName = 'Calc36'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 1588
        mmWidth = 36777
        BandType = 8
      end
      object ppCalc37: TppSystemVariable
        UserName = 'Calc37'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object sqlSuplemen: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   A.IDCONTAORIGEM, C1.NOMECONTAORCAMEN AS CONTAORI,'
      '   A.OBSALTERORCAMEN,'
      '   A.DATAREFERENCIA, A.NUMALTERACAO,'
      '   CR.CODEXTERNO AS CODCENTRORESPON, CR.NOME, A.VLRSOLICITADO'
      'FROM'
      '   ALTERORCAMENTO A, CENTRESPON CR, CONTASORCAMEN C1'
      'WHERE'
      '   (A.FLGTIPOALTER = '#39'S'#39') AND'
      '   (A.IDCONTAORIGEM = C1.IDCONTAORCAMEN) AND'
      '   (A.IDPLANOORCAMEN = C1.IDPLANOORCAMEN) AND'
      '   (C1.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND'
      '   (C1.IDPESSOA = CR.IDPESSOA(+))  AND'
      '   (A.NUMALTERACAO =:NUMALTERACAO) AND'
      '   (A.IDPESSOA =:IDPESSOA)')
    ClientDataSet = cdsSuplemen
    Left = 8
    Top = 40
  end
end
