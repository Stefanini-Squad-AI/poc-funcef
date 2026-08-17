inherited rptListaContas: TrptListaContas
  Left = 363
  Top = 166
  Width = 363
  Caption = 'rptListaContas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Listagem de Contas Orçamentárias'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Grupo de Contas'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT'
          '   IDGRUPOORCAMEN, '
          '  (CODGRUPOORC + '#39' - '#39' + NOMEGRUPOORCAMEN) AS NOMEGRUPO '
          'FROM'
          '   GRUPOORCAMEN')
        LookupSettings.Chave = 'IDGRUPOORCAMEN'
        LookupSettings.Display = 'NOMEGRUPO'
        LookupSettings.Descricao = 'Grupo de Contas'
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
        Name = 'Grupo'
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
        Caption = 'Ordenação'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'por Ordem de Código de Contas'
          'por Ordem de Nome de Contas '
          'por Ordem de Grupo de Contas'
          'por Ordem de Centro de Responsabilidade'
          'por Tipo de Cálculo do Orçado'
          'por Tipo de Cálculo do Realizado')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 145
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
        Name = 'Ordenacao'
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
        Caption = 'Plano Orçamentário'
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
      end>
    Formheight = 247
    FormWidth = 335
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpListaContas
    LabelEmpresa = ppLabel2
    LabelSistema = ppLabel3
  end
  object sqlListaContas: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  C.IDCONTAORCAMEN, C.IDPLANOORCAMEN, C.IDGRUPOORCAMEN, C.NOMECO' +
        'NTAORCAMEN,'
      
        '  C.TIPOCALCREALIZADO, C.TIPOCALCORCADO, CR.CODEXTERNO AS CODCEN' +
        'TRORESPON, G.NOMEGRUPOORCAMEN,'
      '  G.CODGRUPOORC'
      'FROM'
      
        '  CONTASORCAMEN C, GRUPOORCAMEN G, PARAMORCAMENTO P, CENTRESPON ' +
        'CR'
      'WHERE (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)'
      '  AND (P.IDPESSOA = :IDPESSOA)'
      '  AND (G.IDPLANOORCAMEN = :IDPLANOORCAMEN)'
      '  AND (C.CODCENTRORESPON=CR.CODCENTRORESPON(+))'
      '  AND ((C.FLGATIVA = '#39'A'#39') OR (C.FLGATIVA IS NULL)) '
      '  :GRUPO'
      '  :ORDENACAO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    OnFormartParam = sqlListaContasFormartParam
    ClientDataSet = cdsListaContas
    Left = 24
    Top = 48
  end
  object cdsListaContas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    OnCalcFields = cdsListaContasCalcFields
    Left = 64
    Top = 48
    object cdsListaContasIDPLANOORCAMEN: TFloatField
      FieldName = 'IDPLANOORCAMEN'
    end
    object cdsListaContasIDGRUPOORCAMEN: TFloatField
      FieldName = 'IDGRUPOORCAMEN'
    end
    object cdsListaContasNOMECONTAORCAMEN: TStringField
      FieldName = 'NOMECONTAORCAMEN'
      Size = 60
    end
    object cdsListaContasTIPOCALCREALIZADO: TStringField
      FieldName = 'TIPOCALCREALIZADO'
      Size = 1
    end
    object cdsListaContasTIPOCALCORCADO: TStringField
      FieldName = 'TIPOCALCORCADO'
      Size = 1
    end
    object cdsListaContasCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object cdsListaContasNOMEGRUPOORCAMEN: TStringField
      FieldName = 'NOMEGRUPOORCAMEN'
      Size = 60
    end
    object cdsListaContasCODGRUPOORC: TStringField
      FieldName = 'CODGRUPOORC'
      Size = 10
    end
    object cdsListaContasCALCREAL: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALCREAL'
      Size = 30
      Calculated = True
    end
    object cdsListaContasCALCORCADO: TStringField
      FieldKind = fkCalculated
      FieldName = 'CALCORCADO'
      Size = 30
      Calculated = True
    end
    object cdsListaContasIDCONTAORCAMEN: TStringField
      FieldName = 'IDCONTAORCAMEN'
      Size = 25
    end
  end
  object dsListaContas: TwwDataSource
    DataSet = cdsListaContas
    Left = 101
    Top = 48
  end
  object pplListaContas: TppBDEPipeline
    DataSource = dsListaContas
    UserName = 'lListaContas'
    Left = 141
    Top = 48
    object pplListaContasppField1: TppField
      FieldAlias = 'CALCREAL'
      FieldName = 'CALCREAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplListaContasppField2: TppField
      FieldAlias = 'CALCORCADO'
      FieldName = 'CALCORCADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
  end
  object rpListaContas: TppReport
    AutoStop = False
    DataPipeline = pplListaContas
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
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
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 181
    Top = 48
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplListaContas'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27252
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Listagem de Contas Orçamentárias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 106892
        mmTop = 8731
        mmWidth = 70644
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 15346
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'ppLabel2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 128059
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object rptListaContasLabel1: TppLabel
        UserName = 'rptListaContasLabel1'
        Caption = 'Número'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 17727
        mmWidth = 11642
        BandType = 0
      end
      object rptListaContasLabel2: TppLabel
        UserName = 'rptListaContasLabel2'
        Caption = 'da Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 529
        mmTop = 21696
        mmWidth = 12700
        BandType = 0
      end
      object rptListaContasLabel3: TppLabel
        UserName = 'rptListaContasLabel3'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23019
        mmTop = 17727
        mmWidth = 8467
        BandType = 0
      end
      object rptListaContasLabel4: TppLabel
        UserName = 'rptListaContasLabel4'
        Caption = 'da Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 23019
        mmTop = 21696
        mmWidth = 12700
        BandType = 0
      end
      object rptListaContasLabel5: TppLabel
        UserName = 'rptListaContasLabel5'
        Caption = 'Responsabilidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 165100
        mmTop = 21696
        mmWidth = 25929
        BandType = 0
      end
      object rptListaContasLabel6: TppLabel
        UserName = 'rptListaContasLabel6'
        Caption = 'Centro de '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 165100
        mmTop = 17727
        mmWidth = 15346
        BandType = 0
      end
      object rptListaContasLine1: TppLine
        UserName = 'rptListaContasLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26459
        mmWidth = 284300
        BandType = 0
      end
      object rptListaContasLabel7: TppLabel
        UserName = 'rptListaContasLabel7'
        Caption = 'Orçamentária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 107950
        mmTop = 21696
        mmWidth = 19579
        BandType = 0
      end
      object rptListaContasLabel8: TppLabel
        UserName = 'rptListaContasLabel8'
        Caption = 'Grupo da Conta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 107950
        mmTop = 17727
        mmWidth = 22490
        BandType = 0
      end
      object rptListaContasLabel10: TppLabel
        UserName = 'rptListaContasLabel10'
        Caption = 'do Orçado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 200819
        mmTop = 21696
        mmWidth = 14817
        BandType = 0
      end
      object rptListaContasLabel11: TppLabel
        UserName = 'rptListaContasLabel11'
        Caption = 'Tipo de Cálculo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 200819
        mmTop = 17727
        mmWidth = 22225
        BandType = 0
      end
      object rptListaContasLabel13: TppLabel
        UserName = 'rptListaContasLabel13'
        Caption = 'do Realizado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 242094
        mmTop = 21696
        mmWidth = 18256
        BandType = 0
      end
      object rptListaContasLabel14: TppLabel
        UserName = 'rptListaContasLabel14'
        Caption = 'Tipo de Cálculo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 242094
        mmTop = 17727
        mmWidth = 23019
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object rptListaContasDBText1: TppDBText
        UserName = 'rptListaContasDBText1'
        DataField = 'IDCONTAORCAMEN'
        DataPipeline = pplListaContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaContas'
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 529
        mmWidth = 20902
        BandType = 4
      end
      object rptListaContasDBText2: TppDBText
        UserName = 'rptListaContasDBText2'
        DataField = 'NOMECONTAORCAMEN'
        DataPipeline = pplListaContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaContas'
        mmHeight = 3704
        mmLeft = 23019
        mmTop = 529
        mmWidth = 84138
        BandType = 4
      end
      object rptListaContasDBText3: TppDBText
        UserName = 'rptListaContasDBText3'
        DataField = 'CODCENTRORESPON'
        DataPipeline = pplListaContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaContas'
        mmHeight = 3704
        mmLeft = 165365
        mmTop = 529
        mmWidth = 30956
        BandType = 4
      end
      object rptListaContasDBText4: TppDBText
        UserName = 'rptListaContasDBText4'
        DataField = 'CODGRUPOORC'
        DataPipeline = pplListaContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaContas'
        mmHeight = 3704
        mmLeft = 108215
        mmTop = 529
        mmWidth = 17198
        BandType = 4
      end
      object rptListaContasDBText5: TppDBText
        UserName = 'rptListaContasDBText5'
        DataField = 'NOMEGRUPOORCAMEN'
        DataPipeline = pplListaContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaContas'
        mmHeight = 3704
        mmLeft = 126207
        mmTop = 529
        mmWidth = 37306
        BandType = 4
      end
      object rptListaContasDBText6: TppDBText
        UserName = 'rptListaContasDBText6'
        DataField = 'CALCORCADO'
        DataPipeline = pplListaContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaContas'
        mmHeight = 3704
        mmLeft = 200555
        mmTop = 529
        mmWidth = 39688
        BandType = 4
      end
      object rptListaContasDBText7: TppDBText
        UserName = 'rptListaContasDBText7'
        DataField = 'CALCREAL'
        DataPipeline = pplListaContas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplListaContas'
        mmHeight = 3704
        mmLeft = 243682
        mmTop = 529
        mmWidth = 39688
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'ppLabel3'
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
        mmLeft = 123825
        mmTop = 1588
        mmWidth = 36777
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
        mmLeft = 254794
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object sqlGrupo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDGRUPOORCAMEN,  CODGRUPOORC'
      'FROM'
      '   GRUPOORCAMEN'
      'WHERE'
      '  IDGRUPOORCAMEN = :IDGRUPOORCAMEN '
      'AND IDPLANOORCAMEN = :IDPLANOORCAMEN')
    ClientDataSet = cdsGrupo
    Left = 256
    Top = 48
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 296
    Top = 48
  end
end
