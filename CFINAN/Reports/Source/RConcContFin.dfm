inherited RptConcContFin: TRptConcContFin
  Left = 383
  Top = 158
  Width = 458
  Height = 153
  Caption = 'RptConcContFin'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Conciliação entre Contabilidade e Controle Financeiro'
    DataBaseName = 'BaseDados'
    Params = <
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
      end
      item
        Caption = 'Conta'
        Controle = tcProcuraCC
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
    Formheight = 200
    FormWidth = 350
    Left = 304
  end
  inherited DevRptCM: TExtraOptions
    Left = 128
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpConcContFin
    LabelEmpresa = pplblEmpresa
    LabelSistema = pplblSistema
    Left = 216
  end
  object rpConcContFin: TppReport
    AutoStop = False
    DataPipeline = ppConcContFin
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 392
    Top = 72
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppConcContFin'
    object ppHeaderBand11: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 36777
      mmPrintPosition = 0
      object ppLabel52: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Conciliação entre Contabilidade e Controle Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 8467
        mmWidth = 197115
        BandType = 0
      end
      object ppLine33: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20902
        mmWidth = 197300
        BandType = 0
      end
      object pplblEmpresa: TppLabel
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
        mmWidth = 27781
        BandType = 0
      end
      object pplblConta: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Conta: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 14023
        mmWidth = 96573
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 29898
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 26988
        mmTop = 29898
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        AutoSize = False
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 54769
        mmTop = 29898
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 82550
        mmTop = 29898
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 110331
        mmTop = 29898
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Crédito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 138113
        mmTop = 29898
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Débito'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 165894
        mmTop = 29898
        mmWidth = 26458
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Contabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 42069
        mmTop = 23813
        mmWidth = 27252
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 154252
        mmTop = 24077
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label12'
        Caption = 'Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 99219
        mmTop = 24077
        mmWidth = 20902
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line3'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.5
        mmHeight = 1058
        mmLeft = 0
        mmTop = 35719
        mmWidth = 197300
        BandType = 0
      end
      object pplblPeriodo: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Período:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 131498
        mmTop = 15081
        mmWidth = 65617
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText8: TppDBText
        UserName = 'DBText2'
        DataField = 'DATA'
        DataPipeline = ppConcContFin
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConcContFin'
        mmHeight = 4233
        mmLeft = 4763
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'TOTCRECON'
        DataPipeline = ppConcContFin
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConcContFin'
        mmHeight = 4233
        mmLeft = 26988
        mmTop = 529
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText3'
        DataField = 'TOTDEBCON'
        DataPipeline = ppConcContFin
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConcContFin'
        mmHeight = 4233
        mmLeft = 54769
        mmTop = 529
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText4'
        DataField = 'TOTCREFIN'
        DataPipeline = ppConcContFin
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConcContFin'
        mmHeight = 4233
        mmLeft = 82550
        mmTop = 529
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText6'
        DataField = 'TOTDEBFIN'
        DataPipeline = ppConcContFin
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConcContFin'
        mmHeight = 4233
        mmLeft = 110331
        mmTop = 529
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText7'
        DataField = 'DIFCRE'
        DataPipeline = ppConcContFin
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConcContFin'
        mmHeight = 4233
        mmLeft = 138113
        mmTop = 529
        mmWidth = 26458
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText8'
        DataField = 'DIFDEB'
        DataPipeline = ppConcContFin
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppConcContFin'
        mmHeight = 4233
        mmLeft = 165894
        mmTop = 529
        mmWidth = 26458
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 7938
      mmPrintPosition = 0
      object ppLine34: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object pplblSistema: TppLabel
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
        mmLeft = 529
        mmTop = 3175
        mmWidth = 197115
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
  end
  object ppConcContFin: TppBDEPipeline
    DataSource = dsConcContFin
    UserName = 'lExemplo1'
    Left = 304
    Top = 72
    object ppConcContFinppField1: TppField
      FieldAlias = 'DATA'
      FieldName = 'DATA'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 0
    end
    object ppConcContFinppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEBCON'
      FieldName = 'TOTDEBCON'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppConcContFinppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTCRECON'
      FieldName = 'TOTCRECON'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object ppConcContFinppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTDEBFIN'
      FieldName = 'TOTDEBFIN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object ppConcContFinppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTCREFIN'
      FieldName = 'TOTCREFIN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppConcContFinppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFDEB'
      FieldName = 'DIFDEB'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object ppConcContFinppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFCRE'
      FieldName = 'DIFCRE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
  end
  object dsConcContFin: TwwDataSource
    DataSet = cdsConcContFin
    Left = 216
    Top = 72
  end
  object cdsConcContFin: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 128
    Top = 72
  end
  object spConcContFin: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   U.DATA,'
      '   SUM(U.TOTDEBCON) AS TOTDEBCON,'
      '   SUM(U.TOTCRECON) AS TOTCRECON,'
      '   SUM(U.TOTDEBFIN) AS TOTDEBFIN,'
      '   SUM(U.TOTCREFIN) AS TOTCREFIN,'
      '   SUM(NVL(U.TOTDEBCON,0) - NVL(U.TOTDEBFIN,0)) AS DIFDEB,'
      '   SUM(NVL(U.TOTCRECON,0) - NVL(U.TOTCREFIN,0)) AS DIFCRE'
      'FROM'
      ' (SELECT '
      '     M.DATALANCFINAN AS DATA, '
      #9'  0 AS TOTDEBCON,'
      '     0 AS TOTCRECON,'
      
        '     SUM(DECODE(M.ENTRADASAIDA,'#39'E'#39',M.VALORLANCFINAN,0)) AS TOTDE' +
        'BFIN,'
      
        '     SUM(DECODE(M.ENTRADASAIDA,'#39'S'#39',M.VALORLANCFINAN,0)) AS TOTCR' +
        'EFIN'
      '  FROM '
      '     MOVIMFINANC M,'
      '     PORTADORCONTA P'
      '  WHERE '
      '     (P.CODPORTADOR = M.CODPORTADOR) AND'
      '     (P.PLACONTA = :PLACONTA) AND'
      #9'  (M.DATALANCFINAN >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) AND'
      #9'  (M.DATALANCFINAN <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '  GROUP BY M.DATALANCFINAN'
      ''
      'UNION ALL'
      ''
      '  SELECT'
      '     P.PLNDATDIA AS DATA,'
      #9'  SUM(DECODE(L.LACDEBCRE,'#39'D'#39',L.LACVALOR,0)) AS TOTDEBCON,'
      '     SUM(DECODE(L.LACDEBCRE,'#39'C'#39',L.LACVALOR,0)) AS TOTCRECON,'
      #9'  0 AS TOTDEBFIN,'
      '     0 AS TOTCREFIN'
      '  FROM'
      '     PLANILHA P,'
      '     LANCAMENTO L'
      '  WHERE'
      '     (P.PLNCODIGO = L.PLNCODIGO) AND'
      #9'  (L.PLACONTA = :PLACONTA) AND'
      #9'  (P.PLNDATDIA >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) AND'
      #9'  (P.PLNDATDIA <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39'))'
      '  GROUP BY P.PLNDATDIA) U'
      ''
      'GROUP BY U.DATA'
      ''
      'HAVING (SUM(NVL(U.TOTDEBCON,0)) <> SUM(NVL(U.TOTDEBFIN,0))) OR'
      '       (SUM(NVL(U.TOTCRECON,0)) <> SUM(NVL(U.TOTCREFIN,0)))'
      #9'   '
      'ORDER BY DATA '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsConcContFin
    Left = 32
    Top = 72
  end
end
