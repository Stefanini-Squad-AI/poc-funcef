inherited rptListaDemonst: TrptListaDemonst
  Left = 279
  Top = 251
  Height = 173
  Caption = 'Listagem de Demonstrativos'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Listagem de Demonstrativos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Demonstrativo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '   IDDEMONSTRATIVO, IDPESSOA, DEMDESCDEMONSTRAT,DEMNATUREZA '
          'FROM '
          '   DEMONSTRATIVO '
          'ORDER BY '
          '   DEMDESCDEMONSTRAT'
          '')
        LookupSettings.Chave = 'IDDEMONSTRATIVO'
        LookupSettings.Display = 'DEMDESCDEMONSTRAT'
        LookupSettings.Descricao = 'Demonstrativo'
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
        Name = 'Demonstrativo'
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
        Caption = 'Data Referencia'
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
        Name = 'Data Referencia'
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
    Formheight = 100
    FormWidth = 400
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rptListaDemonst
    LabelEmpresa = LblEmpresa
    LabelSistema = LBLSistema
  end
  object dsListaDemonst: TwwDataSource
    DataSet = cdsListaDemo
    Left = 29
    Top = 80
  end
  object pplListaDemonst: TppBDEPipeline
    DataSource = dsListaDemonst
    UserName = 'lListaDemonst'
    Left = 125
    Top = 80
    object pplListaDemonstppField1: TppField
      FieldAlias = 'IDDEMONSTRATIVO'
      FieldName = 'IDDEMONSTRATIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplListaDemonstppField2: TppField
      FieldAlias = 'IDELEMDEMONSTRAT'
      FieldName = 'IDELEMDEMONSTRAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplListaDemonstppField3: TppField
      FieldAlias = 'ELEDESCELEM'
      FieldName = 'ELEDESCELEM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplListaDemonstppField4: TppField
      FieldAlias = 'DEMDESCDEMONSTRAT'
      FieldName = 'DEMDESCDEMONSTRAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplListaDemonstppField5: TppField
      FieldAlias = 'SOMADESCELEMEN'
      FieldName = 'SOMADESCELEMEN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplListaDemonstppField6: TppField
      FieldAlias = 'PLACONTA'
      FieldName = 'PLACONTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplListaDemonstppField7: TppField
      FieldAlias = 'CODCENTROCUSTO'
      FieldName = 'CODCENTROCUSTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplListaDemonstppField8: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplListaDemonstppField9: TppField
      FieldAlias = 'PLANOME'
      FieldName = 'PLANOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplListaDemonstppField10: TppField
      FieldAlias = 'PLAGRAU'
      FieldName = 'PLAGRAU'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object rptListaDemonst: TppReport
    AutoStop = False
    DataPipeline = pplListaDemonst
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
    Left = 181
    Top = 72
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplListaDemonst'
    object ppHeaderBand14: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object pplblTituloDemo: TppLabel
        UserName = 'pplblTituloDemo'
        Caption = 'Listagem de Demonstrativos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 69850
        mmTop = 8731
        mmWidth = 57679
        BandType = 0
      end
      object ppLine30: TppLine
        UserName = 'ppLine30'
        ParentWidth = True
        Visible = False
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 20373
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
      object pplblTituloDemo2: TppLabel
        UserName = 'pplblTituloDemo2'
        Caption = 'pplblTituloDemo2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 16140
        mmWidth = 25400
        BandType = 0
      end
    end
    object ppDetailBand8: TppDetailBand
      BeforeGenerate = ppDetailBand8BeforeGenerate
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object dbtxtContaDemo: TppDBText
        UserName = 'dbtxtContaDemo'
        DataField = 'PLACONTA'
        DataPipeline = pplListaDemonst
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaDemonst'
        mmHeight = 3704
        mmLeft = 53975
        mmTop = 529
        mmWidth = 29898
        BandType = 4
      end
      object rptListaDemonstDBText4: TppDBText
        UserName = 'rptListaDemonstDBText4'
        DataField = 'PLANOME'
        DataPipeline = pplListaDemonst
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaDemonst'
        mmHeight = 3704
        mmLeft = 84931
        mmTop = 529
        mmWidth = 56621
        BandType = 4
      end
      object dbtxtCCustoDemo: TppDBText
        UserName = 'dbtxtCCustoDemo'
        DataField = 'CODCENTROCUSTO'
        DataPipeline = pplListaDemonst
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaDemonst'
        mmHeight = 3704
        mmLeft = 143404
        mmTop = 529
        mmWidth = 14817
        BandType = 4
      end
      object rptListaDemonstDBText6: TppDBText
        UserName = 'rptListaDemonstDBText6'
        DataField = 'NOME'
        DataPipeline = pplListaDemonst
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaDemonst'
        mmHeight = 3704
        mmLeft = 159015
        mmTop = 529
        mmWidth = 33867
        BandType = 4
      end
      object rptListaDemonstDBText7: TppDBText
        UserName = 'rptListaDemonstDBText7'
        DataField = 'SOMADESCELEMEN'
        DataPipeline = pplListaDemonst
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaDemonst'
        mmHeight = 3704
        mmLeft = 6350
        mmTop = 529
        mmWidth = 46302
        BandType = 4
      end
    end
    object ppFooterBand14: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine32: TppLine
        UserName = 'ppLine32'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object LBLSistema: TppLabel
        UserName = 'LBLSistema'
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
        mmWidth = 70908
        BandType = 8
      end
      object ppCalc3: TppSystemVariable
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
        mmLeft = 84402
        mmTop = 3175
        mmWidth = 28575
        BandType = 8
      end
      object ppCalc7: TppSystemVariable
        UserName = 'Calc7'
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
    object rptListaDemonstGroup3: TppGroup
      BreakName = 'IDDEMONSTRATIVO'
      DataPipeline = pplListaDemonst
      OutlineSettings.CreateNode = True
      UserName = 'rptListaDemonstGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListaDemonst'
      object rptListaDemonstGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 5556
        mmPrintPosition = 0
        object rptListaDemonstShape1: TppShape
          UserName = 'rptListaDemonstShape1'
          Brush.Color = clSilver
          mmHeight = 5292
          mmLeft = 1323
          mmTop = 0
          mmWidth = 192088
          BandType = 3
          GroupNo = 0
        end
        object rptListaDemonstLabel1: TppLabel
          UserName = 'rptListaDemonstLabel1'
          Caption = 'Demonstrativo: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3440
          mmTop = 529
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object rptListaDemonstDBText1: TppDBText
          UserName = 'rptListaDemonstDBText1'
          DataField = 'DEMDESCDEMONSTRAT'
          DataPipeline = pplListaDemonst
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'pplListaDemonst'
          mmHeight = 4233
          mmLeft = 30427
          mmTop = 529
          mmWidth = 95515
          BandType = 3
          GroupNo = 0
        end
      end
      object rptListaDemonstGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 794
        mmPrintPosition = 0
      end
    end
    object rptListaDemonstGroup1: TppGroup
      BreakName = 'IDELEMDEMONSTRAT'
      DataPipeline = pplListaDemonst
      OutlineSettings.CreateNode = True
      UserName = 'rptListaDemonstGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplListaDemonst'
      object rptListaDemonstGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9790
        mmPrintPosition = 0
        object rptListaDemonstLabel2: TppLabel
          UserName = 'rptListaDemonstLabel2'
          Caption = 'Elemento do Demonstrativo : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 6350
          mmTop = 794
          mmWidth = 42863
          BandType = 3
          GroupNo = 1
        end
        object rptListaDemonstDBText2: TppDBText
          UserName = 'rptListaDemonstDBText2'
          DataField = 'ELEDESCELEM'
          DataPipeline = pplListaDemonst
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplListaDemonst'
          mmHeight = 3704
          mmLeft = 50006
          mmTop = 794
          mmWidth = 86784
          BandType = 3
          GroupNo = 1
        end
        object rptListaDemonstLabel3: TppLabel
          UserName = 'rptListaDemonstLabel3'
          Caption = 'Composição do Elemento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 6350
          mmTop = 5821
          mmWidth = 37306
          BandType = 3
          GroupNo = 1
        end
        object rptListaDemonstLabel4: TppLabel
          UserName = 'rptListaDemonstLabel4'
          Caption = 'Conta Contábil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 53975
          mmTop = 5821
          mmWidth = 21167
          BandType = 3
          GroupNo = 1
        end
        object rptListaDemonstLabel5: TppLabel
          UserName = 'rptListaDemonstLabel5'
          Caption = 'Centro de Custo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 143404
          mmTop = 5821
          mmWidth = 24077
          BandType = 3
          GroupNo = 1
        end
      end
      object rptListaDemonstGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 1323
        mmPrintPosition = 0
        object rptListaDemonstLine1: TppLine
          UserName = 'rptListaDemonstLine1'
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 5821
          mmTop = 265
          mmWidth = 187061
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object cdsListaDemo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 16
  end
  object sqlListaDemo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  E.IDDEMONSTRATIVO, E.IDELEMDEMONSTRAT,'
      
        '  E.ELEDESCELEM, D.DEMDESCDEMONSTRAT,  SOMA.ELEDESCELEM AS SOMAD' +
        'ESCELEMEN,'
      '  C.PLACONTA, C.CODCENTROCUSTO, CC.NOME, PC.PLANOME, PC.PLAGRAU'
      'FROM'
      
        '  COMPOELEMDEM C, DEMONSTRATIVO D, ELEMDEMONSTRATIVO E, ELEMDEMO' +
        'NSTRATIVO SOMA,'
      '  CENTCUST CC, PLANOCONTA PC'
      'WHERE'
      '  (C.PLACONTA = PC.PLACONTA) AND'
      '  (C.PLANO = PC.PLANO) AND'
      '  (C.CODCENTROCUSTO(+) = CC.CODCENTROCUSTO) AND'
      '  (C.IDEMPRESA(+) = CC.IDEMPRESA) AND'
      '  (E.IDDEMONSTRATIVO  = D.IDDEMONSTRATIVO) AND'
      '  (E.IDELEMDEMONSTRAT = C.IDELEMDEMONSTRAT) AND'
      '  (SOMA.IDELEMDEMONSTRAT(+) = C.ELEMENTODEM)'
      'ORDER BY'
      '  D.DEMDESCDEMONSTRAT,'
      '  E.IDDEMONSTRATIVO,'
      '  E.ELEDESCELEM,'
      '  E.IDELEMDEMONSTRAT,'
      '  SOMA.ELEDESCELEM')
    ClientDataSet = cdsListaDemo
    Left = 208
    Top = 8
  end
  object cdsTitulos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 96
  end
  object sqlTitulos: TCMSqlParams
    ClientDataSet = cdsTitulos
    Left = 248
    Top = 64
  end
end
