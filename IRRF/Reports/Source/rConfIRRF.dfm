inherited frmRptConfIRRF: TfrmRptConfIRRF
  Left = 420
  Top = 341
  Width = 354
  Height = 208
  Caption = 'frmRptConfIRRF'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Conferência do IRRF'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Beneficiário'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT E.IDFORCLI, P.RAZAOSOCIAL'
          '  FROM PESSOA P, EMPRESAFORN E'
          ' WHERE E.IDFORCLI = P.IDPESSOA')
        LookupSettings.Chave = 'IDFORCLI'
        LookupSettings.Display = 'RAZAOSOCIAL'
        LookupSettings.Descricao = 'Razão Social'
        LookupSettings.Tamanho = '50'
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
        Name = 'dblcBeneficiario'
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
        Caption = 'Data Inicial'
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
    DataBaseName = 'BaseDados'
    Report = rpConfIRRF
    LabelEmpresa = ppLabel68
    ConnectionType = cntBDE
  end
  object dsConfIRRF: TwwDataSource
    DataSet = cdsConfIRRF
    Left = 86
    Top = 57
  end
  object pplConfIRRF: TppBDEPipeline
    DataSource = dsConfIRRF
    UserName = 'lConfIRRF'
    Left = 154
    Top = 57
  end
  object rpConfIRRF: TppReport
    AutoStop = False
    DataPipeline = pplConfIRRF
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 296863
    PrinterSetup.mmPaperWidth = 209815
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 222
    Top = 57
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand5: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 22225
      mmPrintPosition = 0
      object ppLabel67: TppLabel
        UserName = 'ppLabel14'
        Caption = 'Conferência do IRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 77523
        mmTop = 8731
        mmWidth = 41804
        BandType = 0
      end
      object ppLine11: TppLine
        UserName = 'ppLine7'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197115
        BandType = 0
      end
      object ppLabel68: TppLabel
        UserName = 'ppLabel15'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 84402
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object ppLabel69: TppLabel
        UserName = 'ppLabel19'
        Caption = 'Beneficiário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 27252
        mmTop = 17992
        mmWidth = 15875
        BandType = 0
      end
      object ppLabel70: TppLabel
        UserName = 'rpConfDIRFLabel1'
        Caption = 'CNPJ/CPF Benef.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 17992
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel71: TppLabel
        UserName = 'rpConfDIRFLabel3'
        Caption = 'Rend.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 110331
        mmTop = 17992
        mmWidth = 7673
        BandType = 0
      end
      object ppLabel72: TppLabel
        UserName = 'rpConfDIRFLabel4'
        Caption = 'Deduções'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 128059
        mmTop = 17992
        mmWidth = 13229
        BandType = 0
      end
      object ppLabel73: TppLabel
        UserName = 'rpConfDIRFLabel5'
        Caption = 'IRRF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 158486
        mmTop = 17992
        mmWidth = 6615
        BandType = 0
      end
      object ppLabel74: TppLabel
        UserName = 'rpConfDIRFLabel18'
        Caption = 'PIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 184415
        mmTop = 17992
        mmWidth = 4498
        BandType = 0
      end
      object lblConfIRRFPeriodo: TppLabel
        UserName = 'lblConfIRRFPeriodo'
        Caption = 'Período: 01/01/2001 a 31/12/2001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 10319
        mmWidth = 42333
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object ppDBText34: TppDBText
        UserName = 'DBText1'
        DataField = 'VLRBASE'
        DataPipeline = pplConfIRRF
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 95515
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText35: TppDBText
        UserName = 'DBText21'
        DataField = 'VLRINSS'
        DataPipeline = pplConfIRRF
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 118798
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText36: TppDBText
        UserName = 'DBText22'
        DataField = 'VLRIRRF'
        DataPipeline = pplConfIRRF
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 142611
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText37: TppDBText
        UserName = 'DBText24'
        DataField = 'VLRPIS'
        DataPipeline = pplConfIRRF
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 166423
        mmTop = 0
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText29: TppDBText
        UserName = 'rpConfDIRFDBText5'
        AutoSize = True
        DataField = 'DATALANCAMENTO'
        DataPipeline = pplConfIRRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 76994
        mmTop = 0
        mmWidth = 26988
        BandType = 4
      end
      object ppDBText30: TppDBText
        UserName = 'rpConfDIRFDBText1'
        DataField = 'CODNATUREZA'
        DataPipeline = pplConfIRRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText31: TppDBText
        UserName = 'rpConfDIRFDBText2'
        DataField = 'DESCRICAO'
        DataPipeline = pplConfIRRF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 14288
        mmTop = 0
        mmWidth = 59267
        BandType = 4
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppSystemVariable3: TppSystemVariable
        UserName = 'Calc3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 3175
        mmWidth = 195527
        BandType = 8
      end
      object ppLabel75: TppLabel
        UserName = 'ppLabel26'
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
        mmWidth = 195527
        BandType = 8
      end
      object ppLine12: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197115
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'Calc4'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 252942
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
      object ppVariable2: TppVariable
        UserName = 'Variable1'
        CalcOrder = 0
        DataType = dtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 160073
        mmTop = 3175
        mmWidth = 35983
        BandType = 8
      end
    end
    object ppGroup8: TppGroup
      BreakName = 'IDBENEFIRRF'
      DataPipeline = pplConfIRRF
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand8: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppLine17: TppLine
          UserName = 'rpConfDIRFLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 529
          mmWidth = 197115
          BandType = 3
          GroupNo = 2
        end
        object ppDBText32: TppDBText
          UserName = 'rpConfDIRFDBText4'
          DataField = 'NUMDOCUMENTO'
          DataPipeline = pplConfIRRF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 1852
          mmTop = 1588
          mmWidth = 26723
          BandType = 3
          GroupNo = 2
        end
        object ppDBText33: TppDBText
          UserName = 'ppDBText1'
          AutoSize = True
          DataField = 'NOMEBENEF'
          DataPipeline = pplConfIRRF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 29633
          mmTop = 1588
          mmWidth = 17727
          BandType = 3
          GroupNo = 2
        end
        object ppLine13: TppLine
          UserName = 'Line13'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 3440
          mmLeft = 0
          mmTop = 6085
          mmWidth = 197115
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand8: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
  object sqlConfIRRF: TCMSqlParams
    SQL.Strings = (
      'SELECT L.DATALANCAMENTO, L.PLACONTA, L.CODNATUREZA,'
      '       L.FLGFOLHA, P.RAZAOSOCIAL AS NOMEBENEF, L.IDBENEFIRRF,'
      '       L.VLRBASE, L.VLRPIS, L.VLRIRRF, L.VLRINSS, P.RAZAOSOCIAL,'
      '       L.IDLANCIRRF, N.DESCRICAO, P.NUMDOCUMENTO, P.TIPO'
      'FROM PESSOA P, LANCIRRF L, NATURENDIMENTO N'
      'WHERE (P.IDPESSOA = L.IDBENEFIRRF)'
      '  AND (L.CODNATUREZA = N.CODNATUREZA)'
      '  AND (SUBSTR(L.NUMDOCUMENTO,1,8) = :NUMDOCUMENTO)'
      '  AND (L.DATALANCAMENTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39'))'
      '  AND (L.DATALANCAMENTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '  AND (P.RAZAOSOCIAL LIKE :PNOMEBENEF)'
      
        'ORDER BY P.RAZAOSOCIAL, L.IDBENEFIRRF, L.CODNATUREZA, L.DATALANC' +
        'AMENTO'
      ' '
      ' ')
    ClientDataSet = cdsConfIRRF
    Left = 216
    Top = 8
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 120
  end
  object cdsConfIRRF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 280
    Top = 64
  end
  object sqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT NUMDOCUMENTO '
      '  FROM PESSOA '
      ' WHERE IDPESSOA = :IDPESSOA'
      '')
    ClientDataSet = cdsAux
    Left = 280
    Top = 8
  end
end
