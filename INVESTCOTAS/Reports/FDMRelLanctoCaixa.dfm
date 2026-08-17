inherited RelLanctoCaixa: TRelLanctoCaixa
  Left = 386
  Top = 245
  Caption = 'RelLanctoCaixa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'Data Inicial :'
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
      end
      item
        Caption = 'Data Final :'
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
      end
      item
        Caption = 'Carteira de Investimentos :'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DESCCARTINVEST, IDCARTEIRAINVEST  '
          'FROM    CARTEIRAINVEST ')
        LookupSettings.Chave = 'IDCARTEIRAINVEST'
        LookupSettings.Display = 'DESCCARTINVEST'
        LookupSettings.Descricao = 'Descrição'
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
        Name = 'CARTEIRAINVEST'
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
        Caption = 'Evento :'
        Controle = tcLookupCombo
        CampoBanco = 'DESCCAIXACOTA'
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT CX.IDEVENTOCAIXACOTA, EC.DESCCAIXACOTA'
          'FROM   CARTEIRAXEVENTO CX, EVENTOCAIXACOTA EC'
          'WHERE'
          '    (EC.IDEVENTOCAIXACOTA   = CX.IDEVENTOCAIXACOTA)'
          'AND (EC.IDEVENTOCAIXACOTA <> -1 AND EC.IDEVENTOCAIXACOTA <> -2)'
          'AND (EC.STACAIXA            = '#39'S'#39')'
          'ORDER BY EC.DESCCAIXACOTA')
        LookupSettings.Chave = 'IDEVENTOCAIXACOTA'
        LookupSettings.Display = 'DESCCAIXACOTA'
        LookupSettings.Descricao = 'Descrição'
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
  inherited pplReport: TppBDEPipeline
    object pplReportppField1: TppField
      FieldAlias = 'IDFUNDO'
      FieldName = 'IDFUNDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplReportppField2: TppField
      FieldAlias = 'IDFUNDOINVEST'
      FieldName = 'IDFUNDOINVEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplReportppField3: TppField
      FieldAlias = 'ISIN'
      FieldName = 'ISIN'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplReportppField4: TppField
      FieldAlias = 'CNPJ'
      FieldName = 'CNPJ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplReportppField5: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplReportppField6: TppField
      FieldAlias = 'DTPOSICAO'
      FieldName = 'DTPOSICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplReportppField7: TppField
      FieldAlias = 'NOMEADM'
      FieldName = 'NOMEADM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplReportppField8: TppField
      FieldAlias = 'CNPJADM'
      FieldName = 'CNPJADM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplReportppField9: TppField
      FieldAlias = 'NOMEGESTOR'
      FieldName = 'NOMEGESTOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplReportppField10: TppField
      FieldAlias = 'CNPJGESTOR'
      FieldName = 'CNPJGESTOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplReportppField11: TppField
      FieldAlias = 'NOMECUSTODIANTE'
      FieldName = 'NOMECUSTODIANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplReportppField12: TppField
      FieldAlias = 'CNPJCUSTODIANTE'
      FieldName = 'CNPJCUSTODIANTE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplReportppField13: TppField
      FieldAlias = 'VALORCOTA'
      FieldName = 'VALORCOTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplReportppField14: TppField
      FieldAlias = 'QUANTIDADE'
      FieldName = 'QUANTIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplReportppField15: TppField
      FieldAlias = 'PATLIQ'
      FieldName = 'PATLIQ'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplReportppField16: TppField
      FieldAlias = 'VALORATIVOS'
      FieldName = 'VALORATIVOS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplReportppField17: TppField
      FieldAlias = 'VALORRECEBER'
      FieldName = 'VALORRECEBER'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplReportppField18: TppField
      FieldAlias = 'VALORPAGAR'
      FieldName = 'VALORPAGAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplReportppField19: TppField
      FieldAlias = 'VLCOTASEMITIR'
      FieldName = 'VLCOTASEMITIR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplReportppField20: TppField
      FieldAlias = 'VLCOTASRESGATAR'
      FieldName = 'VLCOTASRESGATAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplReportppField21: TppField
      FieldAlias = 'CODANBID'
      FieldName = 'CODANBID'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplReportppField22: TppField
      FieldAlias = 'TIPOFUNDO'
      FieldName = 'TIPOFUNDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplReportppField23: TppField
      FieldAlias = 'NIVELRSC'
      FieldName = 'NIVELRSC'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
  end
  inherited spl: TCMSqlParams
    SQL.Strings = (
      
        'SELECT      HC.IDHISTCAIXA, HC.IDCARTEIRAXEVENTO, HC.IDPLANPREVC' +
        'TBPATR, HC.DATAHISTCAIXA,     '
      
        ' HC.VLRHISTCAIXA, HC.SLDHISTCAIXA, HC.IDOPERACAOINVEST, HC.IDCAR' +
        'TEIRAINVEST,      '
      
        'HC.IDCARTEIRAGERENC, HC.IDOPERACAODIREITO, HC.DESCINVESTIMENTO, ' +
        'HC.TIPMOVCAIXA,      '
      
        'ECC.IDEVENTOCAIXACOTA, ECC.DESCCAIXACOTA, ECC.STASOMADIMINUI, EC' +
        'C.IDTIPOOPERACAO,      '
      
        'ECC.IDTIPOINVEST, ECC.IDREGRA, ECC.IDTIPODESPINVEST,  ECC.FLGMAN' +
        'UALAUT,    '
      'CI.DESCCARTINVEST '
      
        'FROM HISTCAIXA HC, CARTEIRAXEVENTO CE, EVENTOCAIXACOTA ECC, CART' +
        'EIRAINVEST CI '
      'WHERE      HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO(+) AND  '
      'CE.IDEVENTOCAIXACOTA = ECC.IDEVENTOCAIXACOTA(+) AND  '
      'CE.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST(+)  '
      'ORDER BY CI.DESCCARTINVEST, HC.DATAHISTCAIXA, HC.IDHISTCAIXA ')
    ClientDataSet = cds
  end
  inherited cds: TCMClientDataSet
    Active = False
  end
  inherited rptReport: TppReport
    PrinterSetup.Orientation = poPortrait
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    DataPipelineName = 'pplReport'
    inherited ppHeaderBand1: TppHeaderBand
      inherited LblEmpresa: TppLabel [0]
      end
      inherited lblNomeRelatorio: TppLabel [1]
        Caption = 'Consulta de Lançamentos do Caixa'
        mmWidth = 59436
      end
      inherited lblPeriodo: TppLabel [2]
        mmLeft = 24871
      end
      inherited shpCabecalho: TppShape [3]
        mmWidth = 197300
      end
      inherited ppDBImage: TppDBImage [4]
        DataPipelineName = 'ppLogoTipo'
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'DESCCARTINVEST'
        DataPipeline = pplReport
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3704
        mmLeft = 96309
        mmTop = 14023
        mmWidth = 100277
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 2910
        mmTop = 21431
        mmWidth = 7408
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Evento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 24871
        mmTop = 21431
        mmWidth = 10880
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4022
        mmLeft = 188415
        mmTop = 21431
        mmWidth = 8170
        BandType = 0
      end
    end
    inherited ppDetailBand1: TppDetailBand
      inherited shpDetalhe: TppShape
        mmWidth = 197300
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DESCCAIXACOTA'
        DataPipeline = pplReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 0
        mmWidth = 119856
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRHISTCAIXA'
        DataPipeline = pplReport
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReport'
        mmHeight = 3969
        mmLeft = 152929
        mmTop = 0
        mmWidth = 43656
        BandType = 4
      end
    end
    inherited ppFooterBand1: TppFooterBand
      mmHeight = 5027
      inherited ppSystemVariable1: TppSystemVariable
        mmWidth = 197115
      end
      inherited LblSistema: TppLabel
        mmWidth = 196850
      end
      inherited ppLine2: TppLine
        mmHeight = 794
        mmWidth = 197300
      end
      inherited ppSystemVariable2: TppSystemVariable
        mmLeft = 167746
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'DESCCARTINVEST'
      DataPipeline = pplReport
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplReport'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'DATAHISTCAIXA'
      DataPipeline = pplReport
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplReport'
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'DATAHISTCAIXA'
          DataPipeline = pplReport
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplReport'
          mmHeight = 3969
          mmLeft = 2910
          mmTop = 0
          mmWidth = 20638
          BandType = 3
          GroupNo = 1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3704
        mmPrintPosition = 0
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 3969
          mmLeft = 0
          mmTop = 2646
          mmWidth = 197300
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
end
