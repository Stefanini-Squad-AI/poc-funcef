inherited rptRetorno: TrptRetorno
  Left = 348
  Top = 319
  Width = 208
  Height = 116
  Caption = 'rptRetorno'
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
    Report = rpRetorno
    LabelEmpresa = ppLabel187
    LabelSistema = ppLabel195
  end
  object sqlRetorno: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   A.IDCONTAORIGEM, C1.NOMECONTAORCAMEN AS CONTAORI, '
      '   A.OBSALTERORCAMEN, '
      '   A.DATAREFERENCIA, A.NUMALTERACAO, '
      '   CR.CODEXTERNO AS CODCENTRORESPON, CR.NOME, A.VLRSOLICITADO'
      'FROM'
      '   ALTERORCAMENTO A, CENTRESPON CR, CONTASORCAMEN C1'
      'WHERE'
      '   (A.FLGTIPOALTER = '#39'R'#39') AND '
      '   (A.IDCONTAORIGEM = C1.IDCONTAORCAMEN) AND '
      '   (A.IDPLANOORCAMEN = C1.IDPLANOORCAMEN) AND '
      '   (C1.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND'
      '   (C1.IDPESSOA = CR.IDPESSOA(+))  AND'
      '   (A.NUMALTERACAO =:NUMALTERACAO) AND'
      '   (A.IDPESSOA =:IDPESSOA)')
    ClientDataSet = cdsRetorno
    Left = 8
    Top = 46
  end
  object cdsRetorno: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 42
    Top = 46
  end
  object dsRetorno: TwwDataSource
    DataSet = cdsRetorno
    Left = 80
    Top = 45
  end
  object pplRetorno: TppBDEPipeline
    DataSource = dsRetorno
    UserName = 'lRetorno'
    Left = 120
    Top = 45
  end
  object rpRetorno: TppReport
    AutoStop = False
    DataPipeline = pplRetorno
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
    Top = 45
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplRetorno'
    object ppHeaderBand21: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 18521
      mmPrintPosition = 0
      object ppLabel185: TppLabel
        UserName = 'ppLabel185'
        Caption = 'Retorno Orçamentário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 76200
        mmTop = 8731
        mmWidth = 44715
        BandType = 0
      end
      object ppLine51: TppLine
        UserName = 'ppLine51'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15346
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel187: TppLabel
        UserName = 'ppLabel187'
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
    object ppDetailBand20: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 211667
      mmPrintPosition = 0
      object ppShape5: TppShape
        UserName = 'ppShape5'
        mmHeight = 149225
        mmLeft = 3704
        mmTop = 39158
        mmWidth = 186267
        BandType = 4
      end
      object ppLabel188: TppLabel
        UserName = 'ppLabel188'
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
      object ppDBText79: TppDBText
        UserName = 'ppDBText79'
        DataField = 'CODCENTRORESPON'
        DataPipeline = pplRetorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetorno'
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 12700
        mmWidth = 22490
        BandType = 4
      end
      object ppLabel189: TppLabel
        UserName = 'ppLabel189'
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
      object ppDBText80: TppDBText
        UserName = 'ppDBText80'
        DataField = 'NOME'
        DataPipeline = pplRetorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetorno'
        mmHeight = 4233
        mmLeft = 80169
        mmTop = 12700
        mmWidth = 95515
        BandType = 4
      end
      object ppDBText81: TppDBText
        UserName = 'ppDBText81'
        DataField = 'IDCONTAORIGEM'
        DataPipeline = pplRetorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetorno'
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 18521
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText82: TppDBText
        UserName = 'ppDBText82'
        DataField = 'CONTAORI'
        DataPipeline = pplRetorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetorno'
        mmHeight = 4233
        mmLeft = 80169
        mmTop = 18521
        mmWidth = 95515
        BandType = 4
      end
      object ppLabel190: TppLabel
        UserName = 'ppLabel190'
        AutoSize = False
        Caption = 'Observações do Retorno'
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
      object ppDBText83: TppDBText
        UserName = 'ppDBText83'
        DataField = 'DATAREFERENCIA'
        DataPipeline = pplRetorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetorno'
        mmHeight = 5821
        mmLeft = 21431
        mmTop = 1852
        mmWidth = 32015
        BandType = 4
      end
      object ppLabel191: TppLabel
        UserName = 'ppLabel191'
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
      object ppLabel192: TppLabel
        UserName = 'ppLabel192'
        AutoSize = False
        Caption = 'Nº Retorno : '
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
      object ppDBText84: TppDBText
        UserName = 'ppDBText84'
        DataField = 'NUMALTERACAO'
        DataPipeline = pplRetorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetorno'
        mmHeight = 5821
        mmLeft = 157427
        mmTop = 1852
        mmWidth = 32015
        BandType = 4
      end
      object ppLabel194: TppLabel
        UserName = 'ppLabel194'
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
        mmLeft = 65617
        mmTop = 190236
        mmWidth = 20108
        BandType = 4
      end
      object ppDBText85: TppDBText
        UserName = 'ppDBText85'
        DataField = 'VLRSOLICITADO'
        DataPipeline = pplRetorno
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplRetorno'
        mmHeight = 3969
        mmLeft = 87577
        mmTop = 190236
        mmWidth = 38365
        BandType = 4
      end
      object ppLine52: TppLine
        UserName = 'ppLine52'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 9790
        mmWidth = 197300
        BandType = 4
      end
      object rptRetornoLine1: TppLine
        UserName = 'rptRetornoLine1'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 3704
        mmTop = 203994
        mmWidth = 61383
        BandType = 4
      end
      object rptRetornoLabel1: TppLabel
        UserName = 'rptRetornoLabel1'
        Caption = 'Gestor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 29633
        mmTop = 205052
        mmWidth = 10319
        BandType = 4
      end
      object rptRetornoLabel2: TppLabel
        UserName = 'rptRetornoLabel2'
        Caption = 'Orçamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 96309
        mmTop = 205052
        mmWidth = 16933
        BandType = 4
      end
      object rptRetornoLine2: TppLine
        UserName = 'rptRetornoLine2'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 72496
        mmTop = 203994
        mmWidth = 61383
        BandType = 4
      end
      object rptRetornoLabel3: TppLabel
        UserName = 'rptRetornoLabel3'
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
        mmLeft = 127529
        mmTop = 190236
        mmWidth = 20108
        BandType = 4
      end
      object txtSaldoRetorno: TppLabel
        UserName = 'txtSaldoRetorno'
        AutoSize = False
        Caption = 'txtSaldoRetorno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 149490
        mmTop = 190236
        mmWidth = 38365
        BandType = 4
      end
      object rptRetornoDBMemo1: TppDBMemo
        UserName = 'rptRetornoDBMemo1'
        CharWrap = False
        DataField = 'OBSALTERORCAMEN'
        DataPipeline = pplRetorno
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplRetorno'
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
      object ppLabel250: TppLabel
        UserName = 'Label250'
        AutoSize = False
        Caption = 'Saldo Ant : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 3440
        mmTop = 190236
        mmWidth = 20108
        BandType = 4
      end
      object txtSaldoAntRetorno: TppLabel
        UserName = 'txtSaldoAntRetorno'
        AutoSize = False
        Caption = 'txtSaldoAntRetorno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 25400
        mmTop = 190236
        mmWidth = 38365
        BandType = 4
      end
    end
    object ppFooterBand21: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine53: TppLine
        UserName = 'ppLine53'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel195: TppLabel
        UserName = 'ppLabel195'
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
      object ppCalc38: TppSystemVariable
        UserName = 'Calc38'
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
      object ppCalc39: TppSystemVariable
        UserName = 'Calc39'
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
end
