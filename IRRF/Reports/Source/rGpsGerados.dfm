inherited frmRptGpsGerados: TfrmRptGpsGerados
  Left = 326
  Top = 311
  Width = 465
  Height = 253
  Caption = 'frmRptGpsGerados'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'GPS'#39's gerados'
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
        Caption = 'Data'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Vencimento'
          'Lançamento')
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
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
        Caption = 'Alterador Juros'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CODALTERADOR, DESCRICAO'
          '  FROM TIPOALTERADOR'
          ' WHERE RECPAG = '#39'P'#39
          ' ORDER BY DESCRICAO')
        LookupSettings.Chave = 'CODALTERADOR'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
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
        Caption = 'Alterador de Multa'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT CODALTERADOR, DESCRICAO'
          '  FROM TIPOALTERADOR'
          ' WHERE RECPAG = '#39'P'#39
          ' ORDER BY DESCRICAO'
          '')
        LookupSettings.Chave = 'CODALTERADOR'
        LookupSettings.Display = 'DESCRICAO'
        LookupSettings.Descricao = 'Descrição'
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
    Formheight = 300
    Left = 188
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpGpsGerado
    LabelEmpresa = ppLabel8
    LabelSistema = ppLabel11
    Left = 91
  end
  object cdsGps: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 72
  end
  object cmSqlGps: TCMSqlParams
    SQL.Strings = (
      
        'SELECT PJ.IDPESSOA AS IDEMPRESA, PJ.RAZAOSOCIAL AS EMPRESA, '#39'   ' +
        '             '#39' AS TOTAL,'
      '       PJ.NUMDOCUMENTO AS CGC, D.CODGERADORINSS, PJ.RAZAOSOCIAL,'
      '       L.VALOR, L.DATALANCTO, D.CODDOCUMENTO, D.DATAVENCTO,'
      
        '       D.NODOCUMENTO, '#39'                '#39' AS VALORJUROS, PJF.RAZA' +
        'OSOCIAL AS EMPRESAFORNECEDOR,'
      
        '       PJF.NUMDOCUMENTO AS CGCFORNECEDOR, D.DATAPROGRAMADA, D.DA' +
        'TAEMISSAO,'
      
        '       DD.CODDOCUMENTO AS DOCGERADOR, DD.NODOCUMENTO AS NUMERODO' +
        'CUMETO'
      '  FROM DOCUMENTO D, DOCUMENTO DD, LANCTODOCUM L, PESSOA PJ,'
      
        '       (SELECT DISTINCT CODDOCINSS FROM LANCTODOCUM WHERE CODDOC' +
        'INSS IS NOT NULL) I,'
      '               PESSOA PJF'
      '         WHERE (PJ.IDPESSOA = :IDPESSOA)'
      '           AND (D.IDPESSOA = :IDPESSOA)'
      '           AND (D.CODGERADORINSS = DD.CODDOCUMENTO)'
      '           AND (DD.RECPAG = '#39'P'#39')'
      '           AND (DD.IDFORCLI = PJF.IDPESSOA)'
      
        '           AND (D.DATAPROGRAMADA >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY' +
        #39'))'
      
        '           AND (D.DATAPROGRAMADA <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY' +
        #39'))'
      '           AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '           AND (D.OPERACAO = L.OPERACAO)'
      '           AND (I.CODDOCINSS  = D.CODDOCUMENTO)'
      '           AND NOT EXISTS (SELECT IM.CODDOCINSS'
      '                             FROM DOCINSS IM'
      
        '                            WHERE (IM.CODDOCINSS = D.CODDOCUMENT' +
        'O))'
      '           ORDER BY L.DATALANCTO, PJ.RAZAOSOCIAL'
      ''
      ''
      ''
      ''
      '')
    ClientDataSet = cdsGps
    Left = 24
    Top = 72
  end
  object dsGpsGerado: TwwDataSource
    DataSet = cdsGps
    Left = 185
    Top = 77
  end
  object pplGpsGerado: TppBDEPipeline
    DataSource = dsGpsGerado
    UserName = 'lGpsGerado'
    Left = 269
    Top = 77
    object pplGpsGeradoppField1: TppField
      FieldAlias = 'IDEMPRESA'
      FieldName = 'IDEMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField2: TppField
      FieldAlias = 'EMPRESA'
      FieldName = 'EMPRESA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField3: TppField
      FieldAlias = 'TOTAL'
      FieldName = 'TOTAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField4: TppField
      FieldAlias = 'CGC'
      FieldName = 'CGC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField5: TppField
      FieldAlias = 'CODGERADORINSS'
      FieldName = 'CODGERADORINSS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField6: TppField
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField7: TppField
      FieldAlias = 'DATALANCTO'
      FieldName = 'DATALANCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField8: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField9: TppField
      FieldAlias = 'DATAVENCTO'
      FieldName = 'DATAVENCTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField10: TppField
      FieldAlias = 'NODOCUMENTO'
      FieldName = 'NODOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField11: TppField
      FieldAlias = 'VALORJUROS'
      FieldName = 'VALORJUROS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField12: TppField
      FieldAlias = 'EMPRESAFORNECEDOR'
      FieldName = 'EMPRESAFORNECEDOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField13: TppField
      FieldAlias = 'CGCFORNECEDOR'
      FieldName = 'CGCFORNECEDOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField14: TppField
      FieldAlias = 'DATAPROGRAMADA'
      FieldName = 'DATAPROGRAMADA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField15: TppField
      FieldAlias = 'DATAEMISSAO'
      FieldName = 'DATAEMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField16: TppField
      FieldAlias = 'DOCGERADOR'
      FieldName = 'DOCGERADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplGpsGeradoppField17: TppField
      FieldAlias = 'NUMERODOCUMETO'
      FieldName = 'NUMERODOCUMETO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
  end
  object rpGpsGerado: TppReport
    AutoStop = False
    DataPipeline = pplGpsGerado
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
    Left = 355
    Top = 77
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplGpsGerado'
    object ppHeaderBand2: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppLabel7: TppLabel
        UserName = 'ppLabel7'
        Caption = 'GPS'#39's Gerados no Periodo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 73290
        mmTop = 8731
        mmWidth = 53975
        BandType = 0
      end
      object ppLine3: TppLine
        UserName = 'ppLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'ppLabel8'
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
      object rpDarfEmiteLabel1: TppLabel
        UserName = 'rpDarfEmiteLabel1'
        Caption = 'Beneficiário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 19844
        mmTop = 18256
        mmWidth = 15081
        BandType = 0
      end
      object rpDarfEmiteLabel4: TppLabel
        UserName = 'rpDarfEmiteLabel4'
        Caption = 'Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 182563
        mmTop = 18785
        mmWidth = 13758
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 2646
        mmTop = 10848
        mmWidth = 43921
        BandType = 0
      end
    end
    object ppDetailBand5: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object rpDarfEmiteDBText11: TppDBText
        UserName = 'rpDarfEmiteDBText11'
        DataField = 'EMPRESAFORNECEDOR'
        DataPipeline = pplGpsGerado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplGpsGerado'
        mmHeight = 3704
        mmLeft = 2117
        mmTop = 0
        mmWidth = 105040
        BandType = 4
      end
      object rpDarfEmiteDBText7: TppDBText
        UserName = 'rpDarfEmiteDBText7'
        DataField = 'VALOR'
        DataPipeline = pplGpsGerado
        DisplayFormat = '##,###,##0.00;-##,###,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGpsGerado'
        mmHeight = 3704
        mmLeft = 110861
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object rpDarfEmiteDBText8: TppDBText
        UserName = 'rpDarfEmiteDBText8'
        DataField = 'VALORJUROS'
        DataPipeline = pplGpsGerado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGpsGerado'
        mmHeight = 3704
        mmLeft = 133086
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
      object rpDarfEmiteDBText10: TppDBText
        UserName = 'rpDarfEmiteDBText10'
        DataField = 'TOTAL'
        DataPipeline = pplGpsGerado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplGpsGerado'
        mmHeight = 3704
        mmLeft = 176742
        mmTop = 0
        mmWidth = 20638
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine5: TppLine
        UserName = 'ppLine5'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel11: TppLabel
        UserName = 'ppLabel11'
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
        mmTop = 1852
        mmWidth = 197909
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
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
        mmTop = 1852
        mmWidth = 197380
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
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
        mmTop = 1852
        mmWidth = 26194
        BandType = 8
      end
    end
    object rpDarfEmiteGroup1: TppGroup
      BreakName = 'CODDOCUMENTO'
      DataPipeline = pplGpsGerado
      OutlineSettings.CreateNode = True
      UserName = 'rpDarfEmiteGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplGpsGerado'
      object rpDarfEmiteGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object rpDarfEmiteDBText1: TppDBText
          UserName = 'rpDarfEmiteDBText1'
          DataField = 'DATAEMISSAO'
          DataPipeline = pplGpsGerado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplGpsGerado'
          mmHeight = 3704
          mmLeft = 794
          mmTop = 5556
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel6: TppLabel
          UserName = 'rpDarfEmiteLabel6'
          Caption = 'Emissão:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3704
          mmLeft = 794
          mmTop = 1058
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel7: TppLabel
          UserName = 'rpDarfEmiteLabel7'
          Caption = 'Data Lançamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 28310
          mmTop = 1058
          mmWidth = 21960
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteDBText2: TppDBText
          UserName = 'rpDarfEmiteDBText2'
          DataField = 'DATALANCTO'
          DataPipeline = pplGpsGerado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplGpsGerado'
          mmHeight = 3704
          mmLeft = 28575
          mmTop = 5556
          mmWidth = 22225
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel8: TppLabel
          UserName = 'rpDarfEmiteLabel8'
          Caption = 'Vencimento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 75406
          mmTop = 794
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteDBText4: TppDBText
          UserName = 'rpDarfEmiteDBText4'
          DataField = 'DATAVENCTO'
          DataPipeline = pplGpsGerado
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplGpsGerado'
          mmHeight = 3704
          mmLeft = 75406
          mmTop = 5292
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel11: TppLabel
          UserName = 'rpDarfEmiteLabel11'
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 124090
          mmTop = 6085
          mmWidth = 7144
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel12: TppLabel
          UserName = 'rpDarfEmiteLabel12'
          Caption = 'Juros e Multa:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 136525
          mmTop = 6085
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLabel14: TppLabel
          UserName = 'rpDarfEmiteLabel14'
          Caption = 'Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = []
          Transparent = True
          mmHeight = 3175
          mmLeft = 190236
          mmTop = 6350
          mmWidth = 6879
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLine1: TppLine
          UserName = 'rpDarfEmiteLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1588
          mmLeft = 0
          mmTop = 10054
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object rpDarfEmiteLine2: TppLine
          UserName = 'rpDarfEmiteLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object rpDarfEmiteGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
