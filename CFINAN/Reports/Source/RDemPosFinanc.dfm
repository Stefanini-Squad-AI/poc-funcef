inherited RptDemPosFinanc: TRptDemPosFinanc
  Left = 267
  Top = 206
  Width = 382
  Height = 150
  Caption = 'RptDemPosFinanc'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Demonstrativo da Posição Financeira'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Conta Bancária'
        Controle = tcLookupCombo
        TipodeDado = tdReal
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   CODPORTADOR,'
          '   DESCRICAO'
          'FROM'
          '   PORTADORCONTA'
          'WHERE'
          '   (IDPESSOA = 1)'
          'ORDER BY DESCRICAO')
        LookupSettings.Chave = 'CODPORTADOR'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
        LookupSettings.Tamanho = '60'
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
        Caption = 'Data Final'
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
      end>
    BeforeExecute = CmpRptCMBeforeExecute
    Formheight = 125
    FormWidth = 425
    Left = 264
  end
  inherited DevRptCM: TExtraOptions
    Left = 128
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpDemPosFinananc
    LabelEmpresa = pplEmpresa
    LabelSistema = pplSistema
    Left = 200
  end
  object spDemPosFinanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   PE.NOME,'
      '   M.CODLANCFINANC,'
      '   M.IDPESSOA,'
      '   P.CODPORTADOR,'
      '   M.HISTORICO,'
      '   P.DESCRICAO,'
      '   M.STATUSCONCILIA,'
      '   SR.SALDO AS SALDOREAL,'
      '   SR.SALDOOM AS SALDOREALOM,'
      '   SC.SALDO AS SALDOCONTAB,'
      '   SC.SALDOOM AS SALDOCONTABOM,'
      '   SX.SALDO AS SALDOCONCILIA,'
      '   SX.SALDOOM AS SALDOCONCILIAOM,'
      
        '   SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALORLANCFINAN,-M.VALORLANCFI' +
        'NAN)) AS SALDOANA,'
      
        '   SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALOROUTRAMOEDA,-M.VALOROUTRA' +
        'MOEDA)) AS SALDOANAOM,'
      
        '   DECODE(M.STATUSCONCILIA,'#39'I'#39','#39'B) VALORES A CLASSIFICAR'#39','#39'C) LA' +
        'NÇAMENTOS NÃO CONCILIADOS'#39') AS DESCSTATUS,'
      '   M.DATALANCFINAN'
      'FROM'
      '   PESSOA PE,'
      '   PORTADORCONTA P,'
      ''
      '   (SELECT'
      '       IDPESSOA,'
      '       CODLANCFINANC,'
      '       CODPORTADOR,'
      '       HISTORICO,'
      '       STATUSCONCILIA,'
      '       ENTRADASAIDA,'
      '       VALORLANCFINAN,'
      '       VALOROUTRAMOEDA,'
      '       DATALANCFINAN'
      '    FROM'
      '       MOVIMFINANC'
      '    WHERE'
      '       (IDPESSOA = :IDPessoa) AND'
      '       (STATUSCONCILIA IN ('#39'N'#39','#39'C'#39','#39'X'#39')) AND'
      '       (DATALANCFINAN <= :DataFinal) AND'
      
        '       ((DATACONCILIACAO IS NULL) OR (DATACONCILIACAO > :DataFin' +
        'al))'
      '    UNION ALL'
      ''
      '   (SELECT'
      '       IDPESSOA,'
      '       CODLANCFINANC,'
      '       CODPORTADOR,'
      '       HISTORICO,'
      '       STATUSCONCILIA,'
      '       ENTRADASAIDA,'
      '       VALORLANCFINAN,'
      '       VALOROUTRAMOEDA,'
      '       DATALANCFINAN'
      '    FROM'
      '       MOVIMFINANC'
      '    WHERE'
      '       (IDPESSOA = :IDPessoa) AND'
      '       (STATUSCONCILIA = '#39'I'#39') AND'
      '       (DATALANCFINAN <= :DataFinal))'
      '         ) M,'
      ''
      '   (SELECT'
      '       CODPORTADOR,'
      
        '       SUM(DECODE(ENTRADASAIDA,'#39'E'#39',VALORLANCFINAN,-VALORLANCFINA' +
        'N)) AS SALDO,'
      
        '       SUM(DECODE(ENTRADASAIDA,'#39'E'#39',VALOROUTRAMOEDA,-VALOROUTRAMO' +
        'EDA)) AS SALDOOM'
      '    FROM'
      '       MOVIMFINANC'
      '    WHERE'
      '       (IDPESSOA = :IDPessoa) AND'
      '       (STATUSCONCILIA <> '#39'I'#39') AND'
      '       (STATUSCONCILIA <> '#39'J'#39') AND'
      '       (DATALANCFINAN <= :DataFinal)'
      '    GROUP BY CODPORTADOR) SC,'
      '   (SELECT'
      '       CODPORTADOR,'
      
        '       SUM(DECODE(ENTRADASAIDA,'#39'E'#39',VALORLANCFINAN,-VALORLANCFINA' +
        'N)) AS SALDO,'
      
        '       SUM(DECODE(ENTRADASAIDA,'#39'E'#39',VALOROUTRAMOEDA,-VALOROUTRAMO' +
        'EDA)) AS SALDOOM'
      '    FROM'
      '       MOVIMFINANC'
      '    WHERE'
      '       (IDPESSOA = :IDPessoa) AND'
      '       (STATUSCONCILIA <> '#39'J'#39') AND'
      '       (DATALANCFINAN  <= :DataFinal)'
      '    GROUP BY CODPORTADOR) SR,'
      '   (SELECT'
      '       CODPORTADOR,'
      
        '       SUM(DECODE(ENTRADASAIDA,'#39'E'#39',VALORLANCFINAN,-VALORLANCFINA' +
        'N)) AS SALDO,'
      
        '       SUM(DECODE(ENTRADASAIDA,'#39'E'#39',VALOROUTRAMOEDA,-VALOROUTRAMO' +
        'EDA)) AS SALDOOM'
      '    FROM'
      '       MOVIMFINANC'
      '    WHERE'
      '       (IDPESSOA = :IDPessoa) AND'
      '       (STATUSCONCILIA IN ('#39'I'#39','#39'X'#39')) AND'
      '       (DATALANCFINAN  <= :DataFinal) AND'
      '       (DATACONCILIACAO <= :DataFinal)'
      '    GROUP BY CODPORTADOR) SX'
      ''
      'WHERE'
      '   (P.IDPESSOA = PE.IDPESSOA) AND'
      
        '   ((P.CODPORTADOR = :CodPortador) OR ( :TodosBancos = '#39'Todos'#39'))' +
        ' AND'
      '   (P.CODPORTADOR = M.CODPORTADOR(+)) AND'
      '   (P.CODPORTADOR = SC.CODPORTADOR(+)) AND'
      '   (P.CODPORTADOR = SR.CODPORTADOR(+)) AND'
      '   (P.CODPORTADOR = SX.CODPORTADOR(+))'
      'GROUP BY'
      '   PE.NOME,'
      '   M.STATUSCONCILIA,'
      '   M.CODLANCFINANC,'
      '   M.IDPESSOA,'
      '   P.CODPORTADOR,'
      '   M.HISTORICO,'
      '   P.DESCRICAO,'
      '   M.DATALANCFINAN,'
      '   SC.SALDO,'
      '   SC.SALDOOM,'
      '   SX.SALDO,'
      '   SX.SALDOOM,'
      '   SR.SALDO,'
      '   SR.SALDOOM'
      'ORDER BY'
      '   PE.NOME,'
      '   P.DESCRICAO,'
      '   DESCSTATUS,'
      '   M.STATUSCONCILIA,'
      '   M.HISTORICO'
      ''
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = cdsDemPosFinanc
    Left = 32
    Top = 8
  end
  object cdsDemPosFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 32
    Top = 64
  end
  object rpDemPosFinananc: TppReport
    AutoStop = False
    DataPipeline = pplDemPosFinanc
    PassSetting = psTwoPass
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
    AllowPrintToArchive = True
    AllowPrintToFile = True
    BeforePrint = rpDemPosFinanancBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 130
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplDemPosFinanc'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label11'
        Caption = 'Demonstrativo da Posição Financeira'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 60854
        mmTop = 8731
        mmWidth = 75671
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object pplEmpresa: TppLabel
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
        mmLeft = 84667
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object DBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'HISTORICO'
        DataPipeline = pplDemPosFinanc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDemPosFinanc'
        mmHeight = 3440
        mmLeft = 5292
        mmTop = 0
        mmWidth = 100542
        BandType = 4
      end
      object dbtValorOM: TppDBText
        UserName = 'dbtValorOM'
        AutoSize = True
        DataField = 'SALDOANAOM'
        DataPipeline = pplDemPosFinanc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemPosFinanc'
        mmHeight = 3175
        mmLeft = 174096
        mmTop = 265
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText9'
        DataField = 'DATALANCFINAN'
        DataPipeline = pplDemPosFinanc
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplDemPosFinanc'
        mmHeight = 3175
        mmLeft = 109273
        mmTop = 265
        mmWidth = 23813
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'dbtValor1'
        AutoSize = True
        DataField = 'SALDOANA'
        DataPipeline = pplDemPosFinanc
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplDemPosFinanc'
        mmHeight = 3175
        mmLeft = 140494
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object pplSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 3175
        mmWidth = 197644
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
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
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      BeforePrint = ppSummaryBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppGroup1: TppGroup
      BreakName = 'NOME'
      DataPipeline = pplDemPosFinanc
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDemPosFinanc'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object dbtNomeBanco: TppDBText
          OnPrint = dbtNomeBancoPrint
          UserName = 'dbtNomeBanco'
          AutoSize = True
          DataField = 'NOME'
          DataPipeline = pplDemPosFinanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 5292
          mmLeft = 92340
          mmTop = 265
          mmWidth = 12700
          BandType = 3
          GroupNo = 0
        end
        object pplDataFinal: TppLabel
          OnPrint = pplDataFinalPrint
          UserName = 'pplDataFinal'
          AutoSize = False
          Caption = 'Data Final:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 133350
          mmTop = 794
          mmWidth = 60590
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
      BreakName = 'DESCRICAO'
      DataPipeline = pplDemPosFinanc
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDemPosFinanc'
      object ppgCabecalhoDescricao: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 17463
        mmPrintPosition = 0
        object DBText6: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'SALDOCONTAB'
          DataPipeline = pplDemPosFinanc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 4233
          mmLeft = 128323
          mmTop = 10054
          mmWidth = 27517
          BandType = 3
          GroupNo = 1
        end
        object Line4: TppLine
          UserName = 'Line4'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 8202
          mmWidth = 197380
          BandType = 3
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'ppLabel2'
          Caption = 'A) SALDO JÁ CONTABILIZADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 9790
          mmWidth = 51329
          BandType = 3
          GroupNo = 1
        end
        object DBText1: TppDBText
          UserName = 'DBText1'
          AutoSize = True
          DataField = 'DESCRICAO'
          DataPipeline = pplDemPosFinanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          ParentDataPipeline = False
          TextAlignment = taCentered
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 5292
          mmLeft = 86519
          mmTop = 2117
          mmWidth = 25135
          BandType = 3
          GroupNo = 1
        end
        object ppLine3: TppLine
          UserName = 'ppLine1'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 794
          mmWidth = 197380
          BandType = 3
          GroupNo = 1
        end
        object Line3: TppLine
          UserName = 'Line3'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 15875
          mmWidth = 197380
          BandType = 3
          GroupNo = 1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText4'
          AutoSize = True
          DataField = 'SALDOCONTABOM'
          DataPipeline = pplDemPosFinanc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 4233
          mmLeft = 160602
          mmTop = 10054
          mmWidth = 33338
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 16669
        mmPrintPosition = 0
        object Line5: TppLine
          UserName = 'Line5'
          Weight = 0.75
          mmHeight = 2117
          mmLeft = 0
          mmTop = 1058
          mmWidth = 197380
          BandType = 5
          GroupNo = 1
        end
        object ppLabel6: TppLabel
          UserName = 'ppLabel3'
          Caption = 'D) SALDO CONCILIADO (A + B - C)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 2646
          mmWidth = 58473
          BandType = 5
          GroupNo = 1
        end
        object DBText2: TppDBText
          UserName = 'DBText2'
          AutoSize = True
          DataField = 'SALDOCONCILIA'
          DataPipeline = pplDemPosFinanc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 4233
          mmLeft = 126471
          mmTop = 2646
          mmWidth = 29369
          BandType = 5
          GroupNo = 1
        end
        object ppLine4: TppLine
          UserName = 'ppLine2'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 8202
          mmWidth = 197380
          BandType = 5
          GroupNo = 1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = 'E) SALDO REAL (A + B)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 9790
          mmWidth = 39952
          BandType = 5
          GroupNo = 1
        end
        object ppLine5: TppLine
          UserName = 'Line6'
          Weight = 0.75
          mmHeight = 1323
          mmLeft = 0
          mmTop = 15346
          mmWidth = 197380
          BandType = 5
          GroupNo = 1
        end
        object ppDBText4: TppDBText
          UserName = 'DBText5'
          AutoSize = True
          DataField = 'SALDOCONCILIAOM'
          DataPipeline = pplDemPosFinanc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 4233
          mmLeft = 159279
          mmTop = 2646
          mmWidth = 35190
          BandType = 5
          GroupNo = 1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText7'
          AutoSize = True
          DataField = 'SALDOREAL'
          DataPipeline = pplDemPosFinanc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 4233
          mmLeft = 133879
          mmTop = 9525
          mmWidth = 21960
          BandType = 5
          GroupNo = 1
        end
        object ppDBText7: TppDBText
          UserName = 'DBText10'
          AutoSize = True
          DataField = 'SALDOREALOM'
          DataPipeline = pplDemPosFinanc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 4233
          mmLeft = 166688
          mmTop = 9525
          mmWidth = 27781
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'DESCSTATUS'
      DataPipeline = pplDemPosFinanc
      OutlineSettings.CreateNode = True
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDemPosFinanc'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object DBDescStatus: TppDBText
          UserName = 'DBDescStatus'
          AutoSize = True
          DataField = 'DESCSTATUS'
          DataPipeline = pplDemPosFinanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 4233
          mmLeft = 65881
          mmTop = 1058
          mmWidth = 24077
          BandType = 3
          GroupNo = 2
        end
        object ppLine6: TppLine
          UserName = 'Line7'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6614
          mmWidth = 197380
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppDBText5: TppDBText
          UserName = 'DBDescStatus1'
          AutoSize = True
          DataField = 'DESCSTATUS'
          DataPipeline = pplDemPosFinanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 4233
          mmLeft = 1323
          mmTop = 2117
          mmWidth = 24077
          BandType = 5
          GroupNo = 2
        end
        object ppLine7: TppLine
          UserName = 'Line8'
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 794
          mmWidth = 197380
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'dbcSubTotalAna1'
          AutoSize = True
          DataField = 'SALDOANA'
          DataPipeline = pplDemPosFinanc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 4191
          mmLeft = 122989
          mmTop = 2117
          mmWidth = 32851
          BandType = 5
          GroupNo = 2
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc1'
          AutoSize = True
          DataField = 'SALDOANAOM'
          DataPipeline = pplDemPosFinanc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 4191
          mmLeft = 155861
          mmTop = 2117
          mmWidth = 38608
          BandType = 5
          GroupNo = 2
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'STATUSCONCILIA'
      DataPipeline = pplDemPosFinanc
      OutlineSettings.CreateNode = True
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplDemPosFinanc'
      object ppGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel7: TppLabel
          UserName = 'ppLabel4'
          Caption = 'Status:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 94986
          mmTop = 1058
          mmWidth = 12171
          BandType = 3
          GroupNo = 2
        end
        object DBText8: TppDBText
          UserName = 'DBText8'
          AutoSize = True
          DataField = 'STATUSCONCILIA'
          DataPipeline = pplDemPosFinanc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 4233
          mmLeft = 109273
          mmTop = 1058
          mmWidth = 31485
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppLabel5: TppLabel
          UserName = 'ppLabel5'
          Caption = 'SUB-TOTAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 95250
          mmTop = 1058
          mmWidth = 20108
          BandType = 5
          GroupNo = 2
        end
        object dbcSubTotalAna: TppDBCalc
          UserName = 'dbcSubTotalAna'
          AutoSize = True
          DataField = 'SALDOANA'
          DataPipeline = pplDemPosFinanc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 4191
          mmLeft = 122989
          mmTop = 1058
          mmWidth = 32851
          BandType = 5
          GroupNo = 2
        end
        object dbcSubTotalAnaOM: TppDBCalc
          UserName = 'DBCalc2'
          AutoSize = True
          DataField = 'SALDOANAOM'
          DataPipeline = pplDemPosFinanc
          DisplayFormat = '#,##0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'pplDemPosFinanc'
          mmHeight = 4191
          mmLeft = 155861
          mmTop = 1058
          mmWidth = 38608
          BandType = 5
          GroupNo = 2
        end
      end
    end
  end
  object pplDemPosFinanc: TppBDEPipeline
    DataSource = dsDemPosFinanc
    UserName = 'lDemPosFinanc'
    Left = 229
    Top = 64
  end
  object dsDemPosFinanc: TwwDataSource
    DataSet = cdsDemPosFinanc
    Left = 320
    Top = 64
  end
end
