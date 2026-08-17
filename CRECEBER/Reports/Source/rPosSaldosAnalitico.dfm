inherited RptPosSaldosAnalitico: TRptPosSaldosAnalitico
  Height = 156
  Caption = 'RptPosSaldosAnalitico'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Posição dos Saldos'
    Params = <
      item
        Caption = ' Indique a Data Limite Para o Relatório '
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
        Caption = 'Incluir Adiantamentos no Relatório'
        Controle = tcCheckBox
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
        Caption = ' Tipo de Cliente '
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT'
          '  IDTIPOCLIENTE,'
          '  DESCRICAO'
          'FROM'
          '  TIPOCLIENTE'
          'ORDER BY'
          '  DESCRICAO')
        LookupSettings.Chave = 'IDTIPOCLIENTE'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
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
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 150
    FormWidth = 600
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = RptPosSadosAnalitico
    LabelEmpresa = ppLabel22
    LabelSistema = ppLabel123
  end
  object DsPosSadosAnalitico: TwwDataSource
    DataSet = CdsPosSadosAnalitico
    Left = 105
    Top = 78
  end
  object PpPosSadosAnalitico: TppBDEPipeline
    DataSource = DsPosSadosAnalitico
    CloseDataSource = True
    UserName = 'PpPosSadosAnalitico'
    Left = 145
    Top = 78
  end
  object RptPosSadosAnalitico: TppReport
    AutoStop = False
    DataPipeline = PpPosSadosAnalitico
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 13000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 15000
    PrinterSetup.mmMarginTop = 13000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 209
    Top = 55
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand25: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppLabel22: TppLabel
        UserName = 'ppLabel22'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 78317
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object LblPosTipoCli: TppLabel
        UserName = 'LblPosTipoCli'
        Caption = 'Posição dos Saldos dos Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 60325
        mmTop = 8996
        mmWidth = 66411
        BandType = 0
      end
      object ppLabel89: TppLabel
        UserName = 'ppLabel89'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 29369
        mmTop = 19315
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'ppLabel96'
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 19315
        mmWidth = 7938
        BandType = 0
      end
      object ppLabel115: TppLabel
        UserName = 'ppLabel115'
        Caption = 'Saldo Outra Moeda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 111654
        mmTop = 19315
        mmWidth = 27252
        BandType = 0
      end
    end
    object ppDetailBand26: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand25: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel123: TppLabel
        UserName = 'ppLabel123'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 265
        mmTop = 2117
        mmWidth = 23019
        BandType = 8
      end
      object ppLine53: TppLine
        UserName = 'ppLine53'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 185000
        BandType = 8
      end
      object ppCalc45: TppSystemVariable
        UserName = 'Calc45'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 83079
        mmTop = 2117
        mmWidth = 18785
        BandType = 8
      end
      object RptPosSadosAnaliticoCalc1: TppSystemVariable
        UserName = 'RptPosSadosAnaliticoCalc1'
        VarType = vtPrintDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 160338
        mmTop = 2117
        mmWidth = 24606
        BandType = 8
      end
    end
    object ppSummaryBand7: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object ppLine54: TppLine
        UserName = 'ppLine54'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 0
        mmWidth = 185000
        BandType = 7
      end
      object RptPosSadosAnaliticoDBCalc3: TppDBCalc
        UserName = 'RptPosSadosAnaliticoDBCalc3'
        AutoSize = True
        DataField = 'SALDO'
        DataPipeline = PpPosSadosAnalitico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 151607
        mmTop = 1323
        mmWidth = 23548
        BandType = 7
      end
      object RptPosSadosAnaliticoDBCalc4: TppDBCalc
        UserName = 'RptPosSadosAnaliticoDBCalc4'
        AutoSize = True
        DataField = 'SALDOOM'
        DataPipeline = PpPosSadosAnalitico
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 110067
        mmTop = 1323
        mmWidth = 28840
        BandType = 7
      end
      object RptPosSadosAnaliticoLabel3: TppLabel
        UserName = 'RptPosSadosAnaliticoLabel3'
        Caption = 'Total Geral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 75936
        mmTop = 1323
        mmWidth = 16140
        BandType = 7
      end
    end
    object ppGroup7: TppGroup
      BreakName = 'DESCRICAO'
      DataPipeline = PpPosSadosAnalitico
      UserName = 'Group7'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand7: TppGroupHeaderBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object RptPosSadosAnaliticoLabel1: TppLabel
          UserName = 'RptPosSadosAnaliticoLabel1'
          Caption = 'Tipo de Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 529
          mmTop = 794
          mmWidth = 25665
          BandType = 3
          GroupNo = 0
        end
        object RptPosSadosAnaliticoDBText1: TppDBText
          UserName = 'RptPosSadosAnaliticoDBText1'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = PpPosSadosAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 29369
          mmTop = 794
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object RptPosSadosAnaliticoLine1: TppLine
          UserName = 'RptPosSadosAnaliticoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 0
          mmWidth = 185000
          BandType = 3
          GroupNo = 0
        end
        object RptPosSadosAnaliticoLine2: TppLine
          UserName = 'RptPosSadosAnaliticoLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 5556
          mmWidth = 185000
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand7: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object RptPosSadosAnaliticoDBCalc1: TppDBCalc
          UserName = 'RptPosSadosAnaliticoDBCalc1'
          AutoSize = True
          DataField = 'SALDO'
          DataPipeline = PpPosSadosAnalitico
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 151607
          mmTop = 529
          mmWidth = 23548
          BandType = 5
          GroupNo = 0
        end
        object RptPosSadosAnaliticoDBCalc2: TppDBCalc
          UserName = 'RptPosSadosAnaliticoDBCalc2'
          AutoSize = True
          DataField = 'SALDOOM'
          DataPipeline = PpPosSadosAnalitico
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup7
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3969
          mmLeft = 110067
          mmTop = 529
          mmWidth = 28840
          BandType = 5
          GroupNo = 0
        end
        object RptPosSadosAnaliticoLabel2: TppLabel
          UserName = 'RptPosSadosAnaliticoLabel2'
          Caption = 'Total Por Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 71438
          mmTop = 529
          mmWidth = 20638
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object RptPosSadosAnaliticoGroup1: TppGroup
      BreakName = 'RAZAOSOCIAL'
      DataPipeline = PpPosSadosAnalitico
      UserName = 'RptPosSadosAnaliticoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptPosSadosAnaliticoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object RptPosSadosAnaliticoGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object RptPosSadosAnaliticoDBText2: TppDBText
          UserName = 'RptPosSadosAnaliticoDBText2'
          DataField = 'RAZAOSOCIAL'
          DataPipeline = PpPosSadosAnalitico
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 29369
          mmTop = 0
          mmWidth = 70115
          BandType = 5
          GroupNo = 1
        end
        object RptPosSadosAnaliticoDBCalc5: TppDBCalc
          UserName = 'RptPosSadosAnaliticoDBCalc5'
          AutoSize = True
          DataField = 'SALDOOM'
          DataPipeline = PpPosSadosAnalitico
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ParentDataPipeline = False
          ResetGroup = RptPosSadosAnaliticoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 115094
          mmTop = 0
          mmWidth = 23813
          BandType = 5
          GroupNo = 1
        end
        object RptPosSadosAnaliticoDBCalc6: TppDBCalc
          UserName = 'RptPosSadosAnaliticoDBCalc6'
          AutoSize = True
          DataField = 'SALDO'
          DataPipeline = PpPosSadosAnalitico
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          ResetGroup = RptPosSadosAnaliticoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 155840
          mmTop = 0
          mmWidth = 19315
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object CdsPosSadosAnalitico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 48
  end
  object SqlPosSadosAnalitico: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   T.DESCRICAO, T.IDTIPOCLIENTE,P.RAZAOSOCIAL, P.IDPESSOA,'
      '   DECODE(DOCUMENTO.OPERACAO,'#39'3 '#39','
      '   S2.SALDOS2 *'
      '   DECODE(S1.SALDOS1,0,0,'
      
        '   SUM(DECODE(DOCUMENTO.RECPAG,'#39'P'#39',DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39 +
        ',LANCTODOCUM.VALOR*-1,LANCTODOCUM.VALOR),'
      
        '   DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.VALOR,LANCTODOCUM.V' +
        'ALOR*-1)))/S1.SALDOS1),'
      
        '   SUM(DECODE(DOCUMENTO.RECPAG,'#39'P'#39',DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39 +
        ',LANCTODOCUM.VALOR*-1,'
      
        '   LANCTODOCUM.VALOR),DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.' +
        'VALOR,LANCTODOCUM.VALOR*-1)))) AS SALDO,'
      '   DECODE(DOCUMENTO.OPERACAO,'#39'3 '#39','
      '   S2.SALDOOMS2 *'
      '   DECODE(S1.SALDOOMS1,0,0,'
      
        '   SUM(DECODE(DOCUMENTO.RECPAG,'#39'P'#39',DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39 +
        ',LANCTODOCUM.VALOROUTRAMOEDA*-1,LANCTODOCUM.VALOROUTRAMOEDA),'
      
        '   DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.VALOROUTRAMOEDA,LAN' +
        'CTODOCUM.VALOROUTRAMOEDA*-1)))/S1.SALDOOMS1),'
      
        '   SUM(DECODE(DOCUMENTO.RECPAG,'#39'P'#39',DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39 +
        ',LANCTODOCUM.VALOROUTRAMOEDA*-1,LANCTODOCUM.VALOROUTRAMOEDA),DEC' +
        'ODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.VALOROUTRAMOEDA,LANCTODOC' +
        'UM.VALOROUTRAMOEDA*-1)))) AS SALDOOM'
      'FROM'
      
        '  DOCUMENTO, LANCTODOCUM, TIPOCLIENTE T, CLIENTEPESS C, PESSOA P' +
        ','
      ' (SELECT D.NUMFATURA,'
      
        '        SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR*-1,L' +
        '.VALOR),DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1))) AS SALDOS1,'
      
        '        SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOROUTRA' +
        'MOEDA*-1,L.VALOROUTRAMOEDA),DECODE(L.DEBCRE,'#39'D'#39',L.VALOROUTRAMOED' +
        'A,L.VALOROUTRAMOEDA*-1))) AS SALDOOMS1'
      '        FROM DOCUMENTO D, LANCTODOCUM L WHERE'
      
        '         D.OPERACAO = '#39'1'#39' AND D.NUMFATURA IS NOT NULL AND D.CODD' +
        'OCUMENTO = L.CODDOCUMENTO'
      '         GROUP BY D.NUMFATURA) S1,'
      ''
      '        (SELECT D.NUMFATURA,'
      
        '        SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOR*-1,L' +
        '.VALOR),DECODE(L.DEBCRE,'#39'D'#39',L.VALOR,L.VALOR*-1))) AS SALDOS2,'
      
        '        SUM(DECODE(D.RECPAG,'#39'P'#39',DECODE(L.DEBCRE,'#39'D'#39',L.VALOROUTRA' +
        'MOEDA*-1,L.VALOROUTRAMOEDA),DECODE(L.DEBCRE,'#39'D'#39',L.VALOROUTRAMOED' +
        'A,L.VALOROUTRAMOEDA*-1))) AS SALDOOMS2'
      
        '        FROM DOCUMENTO D, LANCTODOCUM L WHERE  L.DATALANCTO <= :' +
        'PDATAFIM AND'
      
        '         D.OPERACAO = '#39'1'#39' AND D.NUMFATURA IS NOT NULL AND D.CODD' +
        'OCUMENTO = L.CODDOCUMENTO GROUP BY D.NUMFATURA) S2'
      ''
      'WHERE (DOCUMENTO.IDPESSOA = :PIDPESSOA) AND'
      
        '      ((LANCTODOCUM.DATALANCTO <= :PDATAFIM AND LANCTODOCUM.OPER' +
        'ACAO <> '#39'3'#39') OR (LANCTODOCUM.OPERACAO = '#39'3'#39'))  AND (DOCUMENTO.RE' +
        'CPAG =  '#39'R'#39' ) AND'
      
        '      ((DOCUMENTO.OPERACAO = '#39'1'#39' AND DOCUMENTO.STATUS <> '#39'2'#39') OR' +
        ' DOCUMENTO.OPERACAO = '#39'2'#39
      
        '      OR DOCUMENTO.OPERACAO = '#39'3'#39' OR DOCUMENTO.OPERACAO = '#39'15'#39') ' +
        ' AND (LANCTODOCUM.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO)'
      '      AND (S1.NUMFATURA(+) = DOCUMENTO.NUMFATURA)'
      '      AND (S2.NUMFATURA(+) = DOCUMENTO.NUMFATURA)'
      '      AND (DOCUMENTO.IDFORCLI = C.IDPESSOA)'
      '      AND (DOCUMENTO.IDFORCLI = P.IDPESSOA)'
      '      AND (C.IDTIPOCLIENTE = T.IDTIPOCLIENTE)'
      
        'GROUP BY  T.DESCRICAO, T.IDTIPOCLIENTE, P.RAZAOSOCIAL, P.IDPESSO' +
        'A,'
      
        '          DOCUMENTO.OPERACAO, S1.SALDOS1, S2.SALDOS2, S1.SALDOOM' +
        'S1, S2.SALDOOMS2'
      'HAVING  DECODE(S1.SALDOS1,0,0,'
      
        '        DECODE(DOCUMENTO.OPERACAO,'#39'3 '#39',S2.SALDOS2 *  SUM(DECODE(' +
        'DOCUMENTO.RECPAG,'#39'P'#39','
      
        '        DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.VALOR*-1,LANCT' +
        'ODOCUM.VALOR),'
      
        '        DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.VALOR,LANCTODO' +
        'CUM.VALOR*-1)))/S1.SALDOS1,'
      
        '        SUM(DECODE(DOCUMENTO.RECPAG,'#39'P'#39',DECODE(LANCTODOCUM.DEBCR' +
        'E,'#39'D'#39',LANCTODOCUM.VALOR*-1,LANCTODOCUM.VALOR),'
      
        '        DECODE(LANCTODOCUM.DEBCRE,'#39'D'#39',LANCTODOCUM.VALOR,LANCTODO' +
        'CUM.VALOR*-1))))) <> 0'
      'ORDER BY T.DESCRICAO, T.IDTIPOCLIENTE,P.RAZAOSOCIAL, P.IDPESSOA'
      '')
    ClientDataSet = CdsPosSadosAnalitico
    Left = 80
    Top = 48
  end
end
