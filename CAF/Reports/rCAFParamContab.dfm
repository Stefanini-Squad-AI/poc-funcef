inherited RptCAFParamContab: TRptCAFParamContab
  Left = 447
  Top = 253
  Height = 250
  Caption = 'Parametrização Contábil por Bem'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Parametrização Contábil por Bem'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Movimentação até'
        Controle = tcEdit
        TipodeDado = tdDate
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
        Caption = 'Grupos Contábeis dos Bens'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Patrimoniais'
          'Investimentos Imobiliários')
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
        MostraComboCompara = True
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
        Caption = 'Movimentação'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Entradas'
          'Baixas'
          'Depreciação'
          'Reavaliação'
          'Acréscimos'
          'Todas')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 70
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
      end>
    Formheight = 230
    FormWidth = 430
    Left = 20
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'Basedados'
    Report = rpParamContab
    LabelEmpresa = ppLabel5
    LabelSistema = ppLabel9
  end
  object sqlParamContab: TCMSqlParams
    SQL.Strings = (
      'SELECT PLACA,'
      
        '       ('#39'                                                       ' +
        '                                                                ' +
        '             '#39') AS GRUPOCONTABIL,'
      
        '       ('#39'                                                       ' +
        '                                                                ' +
        '             '#39') AS CCUSTO,'
      
        '       ('#39'                                                       ' +
        '                                                                ' +
        '             '#39') AS SUBCONTA,'
      '       DESBEM'
      'FROM BEM'
      'WHERE IDBEM = -2'
      ''
      ''
      ''
      '')
    ClientDataSet = cdsParamContab
    Left = 222
    Top = 60
  end
  object cdsParamContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 223
    Top = 48
  end
  object dsParamContab: TwwDataSource
    DataSet = cdsParamContab
    Left = 224
    Top = 35
  end
  object ppParamContab: TppBDEPipeline
    DataSource = dsParamContab
    UserName = 'ParamContab'
    Left = 224
    Top = 23
  end
  object rpParamContab: TppReport
    AutoStop = False
    DataPipeline = ppParamContab
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 225
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 20902
      mmPrintPosition = 0
      object ppLabel4: TppLabel
        UserName = 'ppLabel4'
        Caption = 'Parametrização Contábil por Bem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5080
        mmLeft = 108779
        mmTop = 8731
        mmWidth = 67663
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 15081
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'ppLabel5'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpParamContabLabel1: TppLabel
        UserName = 'rpParamContabLabel1'
        Caption = 'Placa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 16140
        mmWidth = 6879
        BandType = 0
      end
      object rpParamContabLabel2: TppLabel
        UserName = 'rpParamContabLabel2'
        Caption = 'Grupo Contábil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 21696
        mmTop = 16140
        mmWidth = 18785
        BandType = 0
      end
      object rpParamContabLabel3: TppLabel
        UserName = 'rpParamContabLabel3'
        Caption = 'Centro de Custo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 84931
        mmTop = 16140
        mmWidth = 20638
        BandType = 0
      end
      object rpParamContabLabel4: TppLabel
        UserName = 'rpParamContabLabel4'
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 214578
        mmTop = 16140
        mmWidth = 12965
        BandType = 0
      end
      object rpParamContabLine1: TppLine
        UserName = 'rpParamContabLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 20638
        mmWidth = 284300
        BandType = 0
      end
      object rpParamContabLabel5: TppLabel
        UserName = 'rpParamContabLabel5'
        Caption = 'SubConta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 149490
        mmTop = 16140
        mmWidth = 12435
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpParamContabDBText1: TppDBText
        UserName = 'rpParamContabDBText1'
        DataField = 'PLACA'
        DataPipeline = ppParamContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 0
        mmWidth = 20373
        BandType = 4
      end
      object rpParamContabDBMemo1: TppDBMemo
        UserName = 'rpParamContabDBMemo1'
        CharWrap = True
        DataField = 'DESBEM'
        DataPipeline = ppParamContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 214578
        mmTop = 0
        mmWidth = 69850
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpParamContabDBMemo2: TppDBMemo
        UserName = 'rpParamContabDBMemo2'
        CharWrap = True
        DataField = 'GRUPOCONTABIL'
        DataPipeline = ppParamContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 21167
        mmTop = 0
        mmWidth = 62971
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpParamContabDBMemo3: TppDBMemo
        UserName = 'rpParamContabDBMemo3'
        CharWrap = True
        DataField = 'CCUSTO'
        DataPipeline = ppParamContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 84931
        mmTop = 0
        mmWidth = 63500
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object rpParamContabDBMemo4: TppDBMemo
        UserName = 'rpParamContabDBMemo4'
        CharWrap = True
        DataField = 'SUBCONTA'
        DataPipeline = ppParamContab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 3704
        mmLeft = 149490
        mmTop = 0
        mmWidth = 64029
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLine4: TppLine
        UserName = 'ppLine4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel9: TppLabel
        UserName = 'ppLabel9'
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
        mmTop = 1058
        mmWidth = 69850
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258498
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 106363
        mmTop = 1058
        mmWidth = 71702
        BandType = 8
      end
    end
  end
  object cdsParamCAFxContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 177
    Top = 146
  end
  object sqlParamCAFxContab: TCMSqlParams
    SQL.Strings = (
      'SELECT IDPESSOA, PLANO, PLACONTA, TIPOLANCAMENTO'
      'FROM CONTASTIPOSMOVIMENTOGRUPOS'
      'WHERE IDGRUPO = :IDGRUPO'
      '  AND IDTIPOMOVIMENTACAO = :IDTIPOMOVIMENTACAO'
      '  AND PLANO = :PLANO'
      '  AND IDPESSOA = :IDPESSOA'
      'ORDER BY TIPOLANCAMENTO DESC'
      ''
      ' '
      ' ')
    ClientDataSet = cdsParamCAFxContab
    Left = 177
    Top = 132
  end
  object cdsTipoMovimentacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 49
    Top = 146
  end
  object sqlTipoMovimentacao: TCMSqlParams
    SQL.Strings = (
      'SELECT TM.IDTIPOMOVIMENTACAO, TM.DESCTIPOMOVIMENTACAO'
      'FROM TIPOMOVIMENTACAO TM'
      'WHERE TM.LANCAMENTO = '#39'S'#39
      
        '  AND (TM.IDTIPOMOVIMENTACAO = 14 OR TM.IDTIPOMOVIMENTACAO = 18 ' +
        'OR TM.IDTIPOMOVIMENTACAO = 35 OR'
      
        '       TM.IDTIPOMOVIMENTACAO = 15 OR TM.IDTIPOMOVIMENTACAO = 22 ' +
        'OR TM.IDTIPOMOVIMENTACAO = 34 OR'
      
        '       TM.IDTIPOMOVIMENTACAO = 21 OR TM.IDTIPOMOVIMENTACAO = 19 ' +
        'OR TM.IDTIPOMOVIMENTACAO = 36)'
      'ORDER BY TM.IDTIPOMOVIMENTACAO'
      '')
    ClientDataSet = cdsTipoMovimentacao
    Left = 49
    Top = 132
  end
  object cdsBem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 113
    Top = 82
  end
  object sqlBem: TCMSqlParams
    SQL.Strings = (
      
        'SELECT B.IDBEM, B.IDPESSOA, B.IDGRUPO, B.IDCONJUNTO, B.CODSUBCON' +
        'TA,'
      '       B.PLACA, B.DESBEM, G.NOME AS DESCGRUPO,'
      '       RD.CODCENTROCUSTO,CC.NOME'
      'FROM   BEM B,'
      '       GRUPO G,'
      '       RATEIODEPRECIACAO RD,'
      '       CENTCUST CC'
      'WHERE B.DATAINICIODEP <= :DATAMOV'
      '  AND B.FLGDEPREC = 0'
      '  AND B.BAIXATOTAL <> '#39'S'#39
      '  AND B.TAXADEP <> 0'
      '  AND B.CONTROLE = '#39'T'#39
      '  AND B.REGISTRO = '#39'I'#39
      '  AND B.IDPESSOA = :IDPESSOA'
      '  AND G.FLGIMOVEL = :FLGIMOVEL'
      '  AND B.IDGRUPO = G.IDGRUPO'
      '  AND B.IDCONJUNTO = RD.IDCONJUNTO'
      '  AND B.IDPESSOA = RD.IDEMPRESA'
      '  AND RD.CODCENTROCUSTO = CC.CODCENTROCUSTO'
      '  AND RD.IDEMPRESA = CC.IDEMPRESA'
      'ORDER BY B.PLACA, B.IDGRUPO DESC'
      '')
    ClientDataSet = cdsBem
    Left = 113
    Top = 68
  end
end
