inherited RptTermoInvent: TRptTermoInvent
  Width = 311
  Height = 146
  Caption = 'Termo de Inventário'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Termo de Inventário'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Imprimir Itens'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Todos os itens'
          'Apenas os que possuem saldo')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 66
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
        Name = 'Item'
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
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Alfabética'
          'Código')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 50
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
    Formheight = 200
    FormWidth = 340
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptTermoInvent
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
  end
  object bdeTermoInvent: TppBDEPipeline
    DataSource = dsTermoInvent
    UserName = 'bdeTermoInvent'
    Left = 82
    Top = 61
  end
  object dsTermoInvent: TwwDataSource
    DataSet = CdsTermoInvent
    Left = 140
    Top = 61
  end
  object RptTermoInvent: TppReport
    AutoStop = False
    DataPipeline = bdeTermoInvent
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
    Left = 25
    Top = 62
    Version = '5.5'
    mmColumnWidth = 197300
    object RptTermoInventTitleBand1: TppTitleBand
      NewPage = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 35983
      mmPrintPosition = 0
      object RptTermoInventChildReport1Label1: TppLabel
        UserName = 'RptTermoInventChildReport1Label1'
        Caption = 'Termo de Abertura do Inventário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 66146
        mmTop = 3440
        mmWidth = 65088
        BandType = 1
      end
      object LbDataAbre: TppLabel
        UserName = 'LbDataAbre'
        Caption = '  01/01/1999   '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 88371
        mmTop = 9790
        mmWidth = 20373
        BandType = 1
      end
      object MemAbre: TppRichText
        UserName = 'MemAbre'
        Caption = 'MemAbre'
        Stretch = True
        mmHeight = 18521
        mmLeft = 9525
        mmTop = 17463
        mmWidth = 178065
        BandType = 1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object CabecTermoInvent: TppHeaderBand
      BeforePrint = CabecTermoInventBeforePrint
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object ppLabel193: TppLabel
        UserName = 'ppLabel193'
        Caption = 'Termo de Inventário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 79640
        mmTop = 8731
        mmWidth = 40217
        BandType = 0
      end
      object ppLine80: TppLine
        UserName = 'ppLine80'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 21961
        mmWidth = 197300
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84931
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object RptTermoInvetLabel1: TppLabel
        UserName = 'RptTermoInvetLabel1'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 17463
        mmWidth = 10319
        BandType = 0
      end
      object RptTermoInvetLabel2: TppLabel
        UserName = 'RptTermoInvetLabel2'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 17463
        mmWidth = 14288
        BandType = 0
      end
      object RptTermoInvetLabel3: TppLabel
        UserName = 'RptTermoInvetLabel3'
        Caption = 'Saldo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 140229
        mmTop = 17463
        mmWidth = 8731
        BandType = 0
      end
      object RptTermoInvetLabel4: TppLabel
        UserName = 'RptTermoInvetLabel4'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 168275
        mmTop = 17463
        mmWidth = 7673
        BandType = 0
      end
      object RptTermoInvetLabel5: TppLabel
        UserName = 'RptTermoInvetLabel5'
        Caption = 'Unidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 107950
        mmTop = 17463
        mmWidth = 11642
        BandType = 0
      end
    end
    object ppDetailBand25: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptTermoInvetDBText1: TppDBText
        UserName = 'RptTermoInvetDBText1'
        DataField = 'CODARTIGO'
        DataPipeline = bdeTermoInvent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 0
        mmWidth = 22225
        BandType = 4
      end
      object RptTermoInvetDBText2: TppDBText
        UserName = 'RptTermoInvetDBText2'
        DataField = 'DESCRICAO'
        DataPipeline = bdeTermoInvent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 23813
        mmTop = 0
        mmWidth = 79375
        BandType = 4
      end
      object RptTermoInvetDBText3: TppDBText
        UserName = 'RptTermoInvetDBText3'
        DataField = 'CODMEDCUSTO'
        DataPipeline = bdeTermoInvent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 107950
        mmTop = 0
        mmWidth = 11377
        BandType = 4
      end
      object RptTermoInvetDBText4: TppDBText
        UserName = 'RptTermoInvetDBText4'
        DataField = 'SALDO'
        DataPipeline = bdeTermoInvent
        DisplayFormat = '#,0.0000;-#,0.0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 133086
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object RptTermoInvetDBText5: TppDBText
        UserName = 'RptTermoInvetDBText5'
        DataField = 'VALOR'
        DataPipeline = bdeTermoInvent
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand31: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine81: TppLine
        UserName = 'ppLine81'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc60: TppSystemVariable
        UserName = 'ppCalc601'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 78581
        mmTop = 529
        mmWidth = 44979
        BandType = 8
      end
      object ppCalc61: TppSystemVariable
        UserName = 'Calc61'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptTermoInvetSummaryBand1: TppSummaryBand
      NewPage = True
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30427
      mmPrintPosition = 0
      object RptTermoInvetLabel6: TppLabel
        UserName = 'RptTermoInvetLabel6'
        Caption = 'Termo de Fechamento do Inventário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 62177
        mmTop = 2910
        mmWidth = 72761
        BandType = 7
      end
      object MemFecha: TppRichText
        UserName = 'MemFecha'
        Caption = 'MemFecha'
        Stretch = True
        mmHeight = 18521
        mmLeft = 9525
        mmTop = 11906
        mmWidth = 178065
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
  end
  object SqlTermoInvent: TCMSqlParams
    ClientDataSet = CdsTermoInvent
    Left = 192
    Top = 8
  end
  object CdsTermoInvent: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 60
  end
  object SqlTermo: TCMSqlParams
    SQL.Strings = (
      'SELECT FLGABREFECHA, TEXTO'
      'FROM TERMOINVENTARIO'
      'WHERE IDPESSOA = :pIDPESSOA'
      'ORDER BY FLGABREFECHA')
    ClientDataSet = CdsTermo
    Left = 248
    Top = 8
  end
  object CdsTermo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 60
  end
end
