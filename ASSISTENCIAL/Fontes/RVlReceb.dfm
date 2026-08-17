inherited RptVlReceb: TRptVlReceb
  Left = 269
  Top = 162
  Width = 374
  Height = 293
  Caption = 'RptVlReceb'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Valores Recebidos'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Ano/Mês de Cobrança'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT MESREFERENCIA '
          'FROM CTRLINTERFACE'
          'WHERE TIPO='#39'A'#39
          'ORDER BY MESREFERENCIA DESC'
          '')
        LookupSettings.Chave = 'MESREFERENCIA'
        LookupSettings.Display = 'MESREFERENCIA'
        LookupSettings.Descricao = 'Ano / Mês'
        LookupSettings.Tamanho = '7'
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
        Name = 'Mês de Referência'
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
        Caption = 'Patrocinadora'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT H.IDPESSJUR, P.NOME  AS PATROCINADORA'
          'FROM HSTCONTRIBASS H, PESSOA P'
          'WHERE H.IDPESSJUR = P.IDPESSOA'
          'ORDER BY P.NOME')
        LookupSettings.Chave = 'IDPESSJUR'
        LookupSettings.Display = 'PATROCINADORA'
        LookupSettings.Descricao = 'Patrocinadora'
        LookupSettings.Tamanho = '30'
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
        Name = 'cmbPatrocinadora'
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
        Caption = 'Tipo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT '
          '  DISTINCT'
          '  SITRECEBIMENTO, '
          '  DECODE(SITRECEBIMENTO,0,'#39'NAO ENVIADA'#39','
          '                           1,'#39'NAO RECEBIDA'#39','
          '                           2,'#39'RECEBIDA'#39','
          '                           3,'#39'DIVERGENTE/ATRASADA'#39','
          '                           4,'#39'DIVERGENTE TRATADA'#39') AS SITUACAO'
          'FROM HSTCONTRIBASS'
          'ORDER BY SITRECEBIMENTO ASC'
          '')
        LookupSettings.Chave = 'sitrecebimento'
        LookupSettings.Display = 'SITUACAO'
        LookupSettings.Tamanho = '30'
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
        Caption = 'Tipo Folha'
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Folha de Pagamento da Patrocinadora'
          'Folha de Pagamento da Fundação'
          'Cobrança Bancária'
          'Folha de Benefícios')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 100
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
    Formheight = 280
    FormWidth = 380
    Left = 165
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    ChangeConnectionType = CrmRptCMChangeConnectionType
    ChangeConnection = CrmRptCMChangeConnection
    DataBaseName = 'BaseDados'
    ShowCancelDialog = False
    Report = RpVlReceb
    Left = 81
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 256
    Top = 8
    object PpRptCMppField1: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 1
      DisplayWidth = 1
      Position = 0
    end
    object PpRptCMppField2: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 1
    end
    object PpRptCMppField3: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 2
    end
    object PpRptCMppField4: TppField
      FieldAlias = 'PARTICIP'
      FieldName = 'PARTICIP'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object PpRptCMppField5: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object PpRptCMppField6: TppField
      FieldAlias = 'PLANOASSIS'
      FieldName = 'PLANOASSIS'
      FieldLength = 1
      DisplayWidth = 1
      Position = 5
    end
    object PpRptCMppField7: TppField
      FieldAlias = 'REGIONAL'
      FieldName = 'REGIONAL'
      FieldLength = 1
      DisplayWidth = 1
      Position = 6
    end
    object PpRptCMppField8: TppField
      FieldAlias = 'DEPENDENTE'
      FieldName = 'DEPENDENTE'
      FieldLength = 1
      DisplayWidth = 1
      Position = 7
    end
    object PpRptCMppField9: TppField
      FieldAlias = 'CONTRIBUICAO'
      FieldName = 'CONTRIBUICAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 8
    end
    object PpRptCMppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORESPERADO'
      FieldName = 'VALORESPERADO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object PpRptCMppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object PpRptCMppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCA'
      FieldName = 'DIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object PpRptCMppField13: TppField
      FieldAlias = 'SITRECEBIMENTO'
      FieldName = 'SITRECEBIMENTO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 12
    end
    object PpRptCMppField14: TppField
      FieldAlias = 'SITUACAO'
      FieldName = 'SITUACAO'
      FieldLength = 1
      DisplayWidth = 1
      Position = 13
    end
    object PpRptCMppField15: TppField
      FieldAlias = 'SEQPROPOSTA'
      FieldName = 'SEQPROPOSTA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 14
    end
    object PpRptCMppField16: TppField
      FieldAlias = 'MESCOBRANCA_1'
      FieldName = 'MESCOBRANCA_1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 15
    end
    object PpRptCMppField17: TppField
      FieldAlias = 'MES_1'
      FieldName = 'MES_1'
      FieldLength = 1
      DisplayWidth = 1
      Position = 16
    end
    object PpRptCMppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTITULAR'
      FieldName = 'IDTITULAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object PpRptCMppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object PpRptCMppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANASS'
      FieldName = 'IDPLANASS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object PpRptCMppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object PpRptCMppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMOTIVO'
      FieldName = 'IDMOTIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object PpRptCMppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDDEPENDENTE'
      FieldName = 'IDDEPENDENTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object PpRptCMppField24: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTASS'
      FieldName = 'IDCONTASS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 23
    end
  end
  object DsRptCM: TwwDataSource
    DataSet = Cds
    Left = 153
    Top = 120
  end
  object Cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 104
    Top = 120
  end
  object Dsp: TDataSetProvider
    DataSet = QryRptCM
    Constraints = True
    Left = 57
    Top = 120
  end
  object QryRptCM: TwwQuery
    DatabaseName = 'BaseDados'
    ParamCheck = False
    SQL.Strings = (
      'SELECT'
      '      '#39' '#39' AS MES,'
      '      '#39' '#39' AS MESCOBRANCA,'
      '      '#39' '#39' AS MATRICULA,'
      '      '#39' '#39' AS PARTICIP,'
      '      '#39' '#39' AS PATRO,'
      '      '#39' '#39' AS PLANOASSIS,'
      '      '#39' '#39' AS REGIONAL,'
      '      '#39' '#39' AS DEPENDENTE,'
      '      '#39' '#39' AS CONTRIBUICAO,'
      '       0 AS VALORESPERADO,'
      '       0 AS VALORRECEBIDO,'
      '       0 AS DIFERENCA,'
      '      '#39' '#39' AS SITRECEBIMENTO,'
      '      '#39' '#39' AS SITUACAO,'
      '      '#39' '#39' AS SEQPROPOSTA,'
      '      '#39' '#39' AS MESCOBRANCA,'
      '      '#39' '#39' AS MES,'
      '       0 AS IDTITULAR,'
      '       0 AS IDPLANOPREV,'
      '       0 AS IDPLANASS,'
      '       0 AS IDPESSJUR,'
      '       0 AS IDMOTIVO,'
      '       0 AS IDDEPENDENTE,'
      '       0 AS IDCONTASS'
      ''
      'FROM DUAL')
    ValidateWithMask = True
    Left = 11
    Top = 120
  end
  object AQryFundacao: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 305
    Top = 120
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao'
    Left = 313
    Top = 65
    object ppFundacaoppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppFundacaoppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppFundacaoppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppFundacaoppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppFundacaoppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppFundacaoppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = CdsFundacao
    Left = 241
    Top = 66
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT P.NOME , P.RAZAOSOCIAL, E.LOGRADOURO,'
      '       E.NUMERO, E.COMPLEMENTO, E.BAIRRO,'
      '       C.NOME AS CIDADE, C.CODESTADO, E.CEP, I.IMAGEM'
      'FROM PESSOA P,  FUNDACAO F,  ENDPESS E, IMAGENS I, CIDADES C'
      'WHERE '
      '     ( P.IDPESSOA =  F.IDPESSOA) AND'
      '     ( P.IDPESSOA =  E.IDPESSOA) AND'
      '     (E.IDCIDADES   = C.IDCIDADES)  AND'
      '     ( P.IDIMAGEM = I.IDIMAGEM)'
      ' ')
    ValidateWithMask = True
    Left = 18
    Top = 66
  end
  object DspFundacao: TDataSetProvider
    DataSet = qryFundacao
    Constraints = True
    Left = 96
    Top = 66
  end
  object CdsFundacao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspFundacao'
    Left = 171
    Top = 67
  end
  object aQryRptCm: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 217
    Top = 120
  end
  object RpVlReceb: TppReport
    AutoStop = False
    DataPipeline = PpRptCM
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 8890
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
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
    Left = 307
    Top = 10
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'PpRptCM'
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35983
      mmPrintPosition = 0
      object rpLabelTitulo: TppLabel
        UserName = 'rpLabelTitulo'
        Caption = 'Relatório de Valores Recebidos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 2910
        mmTop = 29898
        mmWidth = 64029
        BandType = 0
      end
      object rpLabelMesCob: TppLabel
        UserName = 'rpLabelMesCob'
        Caption = 'Ano/Mês de Cobrança: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 135467
        mmTop = 30692
        mmWidth = 39423
        BandType = 0
      end
      object ppDBImage10: TppDBImage
        UserName = 'DBImage10'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 25135
        mmLeft = 2910
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppDBText110: TppDBText
        UserName = 'DBText110'
        DataField = 'NOME'
        DataPipeline = ppFundacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 5821
        mmLeft = 43392
        mmTop = 1323
        mmWidth = 133615
        BandType = 0
      end
      object ppDBText111: TppDBText
        UserName = 'DBText111'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25929
        BandType = 0
      end
      object ppDBText112: TppDBText
        UserName = 'DBText112'
        DataField = 'LOGRADOURO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 12965
        mmWidth = 41804
        BandType = 0
      end
      object ppDBText113: TppDBText
        UserName = 'DBText113'
        DataField = 'NUMERO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 12965
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText114: TppDBText
        UserName = 'DBText114'
        DataField = 'CODESTADO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 91546
        mmTop = 17463
        mmWidth = 17198
        BandType = 0
      end
      object ppDBText115: TppDBText
        UserName = 'DBText115'
        DataField = 'BAIRRO'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 17463
        mmWidth = 20108
        BandType = 0
      end
      object ppDBText116: TppDBText
        UserName = 'DBText116'
        DataField = 'CIDADE'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 64029
        mmTop = 17463
        mmWidth = 26988
        BandType = 0
      end
      object ppLabel96: TppLabel
        UserName = 'Label96'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 43392
        mmTop = 21960
        mmWidth = 5027
        BandType = 0
      end
      object ppDBText117: TppDBText
        UserName = 'DBText117'
        DataField = 'CEP'
        DataPipeline = ppFundacao
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppFundacao'
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object rpDBTextMesCob: TppDBText
        UserName = 'rpDBTextMesCob'
        DataField = 'MESCOBRANCA'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpRptCM'
        mmHeight = 4233
        mmLeft = 175419
        mmTop = 30692
        mmWidth = 19844
        BandType = 0
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 26988
        mmWidth = 281887
        BandType = 0
      end
    end
    object ppDetailBand12: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object rpDBTextContrib: TppDBText
        UserName = 'rpDBTextContrib'
        DataField = 'CONTRIBUICAO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRptCM'
        mmHeight = 2910
        mmLeft = 120386
        mmTop = 265
        mmWidth = 50536
        BandType = 4
      end
      object DBTextParticip: TppDBText
        UserName = 'DBTextParticip'
        DataField = 'PARTICIP'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRptCM'
        mmHeight = 2910
        mmLeft = 17992
        mmTop = 265
        mmWidth = 54504
        BandType = 4
      end
      object rpDBTextPlano: TppDBText
        OnPrint = rpDBTextPlanoPrint
        UserName = 'rpDBTextPlano'
        DataField = 'PLANOASSIS'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRptCM'
        mmHeight = 2910
        mmLeft = 73554
        mmTop = 265
        mmWidth = 46038
        BandType = 4
      end
      object rpDBTextEsperado: TppDBText
        UserName = 'rpDBTextEsperado'
        DataField = 'VALORESPERADO'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRptCM'
        mmHeight = 2910
        mmLeft = 187061
        mmTop = 265
        mmWidth = 16934
        BandType = 4
      end
      object rpDBTextRecebido: TppDBText
        UserName = 'rpDBTextRecebido'
        DataField = 'VALORRECEBIDO'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRptCM'
        mmHeight = 2910
        mmLeft = 205582
        mmTop = 265
        mmWidth = 16934
        BandType = 4
      end
      object rpDBTextSituacao: TppDBText
        OnPrint = rpDBTextSituacaoPrint
        UserName = 'rpDBTextSituacao'
        DataField = 'SITUACAO'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        DataPipelineName = 'PpRptCM'
        mmHeight = 2910
        mmLeft = 242094
        mmTop = 265
        mmWidth = 30692
        BandType = 4
      end
      object rpDBTextDiferenca: TppDBText
        UserName = 'rpDBTextDiferenca'
        DataField = 'DIFERENCA'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRptCM'
        mmHeight = 2910
        mmLeft = 223838
        mmTop = 265
        mmWidth = 16934
        BandType = 4
      end
      object ppDBMatricula: TppDBText
        UserName = 'rpdivergerecebimentoDBText101'
        DataField = 'MATRICULA'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'PpRptCM'
        mmHeight = 2910
        mmLeft = 2646
        mmTop = 265
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MES'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'PpRptCM'
        mmHeight = 2910
        mmLeft = 173038
        mmTop = 265
        mmWidth = 12436
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppLabelSistema: TppLabel
        UserName = 'LabelSistema'
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
        mmTop = 1323
        mmWidth = 103188
        BandType = 8
      end
      object ppLine20: TppLine
        UserName = 'ppLine20'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 529
        mmWidth = 281887
        BandType = 8
      end
      object ppCalc23: TppSystemVariable
        UserName = 'Calc23'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 27517
        mmTop = 1323
        mmWidth = 213519
        BandType = 8
      end
      object ppCalc24: TppSystemVariable
        UserName = 'Calc24'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 242623
        mmTop = 1323
        mmWidth = 30692
        BandType = 8
      end
    end
    object rpdivergerecebimentoSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 12965
      mmPrintPosition = 0
      object rpdivergerecebimentoShape1: TppShape
        UserName = 'rpdivergerecebimentoShape1'
        ParentWidth = True
        Shape = stRoundRect
        StretchWithParent = True
        mmHeight = 9790
        mmLeft = 0
        mmTop = 2381
        mmWidth = 281887
        BandType = 7
      end
      object rpLabelTotalGeral: TppLabel
        UserName = 'rpLabelTotalGeral'
        Caption = 'Total Geral (R$) : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 152929
        mmTop = 7673
        mmWidth = 24077
        BandType = 7
      end
      object rpDBCalcTotalEsperado: TppDBCalc
        UserName = 'rpDBCalcTotalEsperado'
        DataField = 'VALORESPERADO'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRptCM'
        mmHeight = 3704
        mmLeft = 178331
        mmTop = 7673
        mmWidth = 19050
        BandType = 7
      end
      object rpDBCalcRecebido: TppDBCalc
        UserName = 'rpDBCalcRecebido'
        DataField = 'VALORRECEBIDO'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRptCM'
        mmHeight = 3704
        mmLeft = 199233
        mmTop = 7673
        mmWidth = 19050
        BandType = 7
      end
      object rpLabelTotalEsperado: TppLabel
        UserName = 'rpLabelTotalEsperado'
        Caption = 'Esperado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 184680
        mmTop = 2381
        mmWidth = 12700
        BandType = 7
      end
      object rpLabelTotalRecebido: TppLabel
        UserName = 'rpLabelTotalRecebido'
        Caption = 'Recebido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 205846
        mmTop = 2646
        mmWidth = 12435
        BandType = 7
      end
      object rpDBCalcDiferenca: TppDBCalc
        UserName = 'rpDBCalcDiferenca'
        DataField = 'DIFERENCA'
        DataPipeline = PpRptCM
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'PpRptCM'
        mmHeight = 3704
        mmLeft = 220399
        mmTop = 7673
        mmWidth = 19050
        BandType = 7
      end
      object rpLabelTotalDiferenca: TppLabel
        UserName = 'rpLabelTotalDiferenca'
        Caption = 'Diferença'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 225955
        mmTop = 2646
        mmWidth = 12435
        BandType = 7
      end
      object ppVariable1: TppVariable
        UserName = 'VarDescPatro1'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 107421
        mmTop = 7938
        mmWidth = 17992
        BandType = 7
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'PARTICIP'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'PpRptCM'
        mmHeight = 3175
        mmLeft = 125677
        mmTop = 7938
        mmWidth = 17198
        BandType = 7
      end
    end
    object rpdivergerecebimentoGroup1: TppGroup
      BreakName = 'PATRO'
      DataPipeline = PpRptCM
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'rpdivergerecebimentoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'PpRptCM'
      object rpdivergerecebimentoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 4763
        mmPrintPosition = 0
        object rpLabelPatro: TppLabel
          UserName = 'rpLabelPatro'
          Caption = 'Patrocinadora : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 3175
          mmTop = 265
          mmWidth = 24606
          BandType = 3
          GroupNo = 0
        end
        object rpdivergerecebimentoDBText8: TppDBText
          UserName = 'rpdivergerecebimentoDBText8'
          AutoSize = True
          DataField = 'PATRO'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'PpRptCM'
          mmHeight = 3969
          mmLeft = 28310
          mmTop = 265
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
      end
      object rpdivergerecebimentoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object rpLabelTotalPatro: TppLabel
          UserName = 'rpLabelTotalPatro'
          Caption = 'Totais (R$) : '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 160338
          mmTop = 2910
          mmWidth = 16933
          BandType = 5
          GroupNo = 0
        end
        object DBCalcEsperado: TppDBCalc
          UserName = 'DBCalcEsperado'
          DataField = 'VALORESPERADO'
          DataPipeline = PpRptCM
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpRptCM'
          mmHeight = 3704
          mmLeft = 178331
          mmTop = 2646
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object DbCalcRecebido: TppDBCalc
          UserName = 'DbCalcRecebido'
          DataField = 'VALORRECEBIDO'
          DataPipeline = PpRptCM
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpRptCM'
          mmHeight = 3704
          mmLeft = 199233
          mmTop = 2646
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object rpdivergerecebimentoLine4: TppLine
          UserName = 'rpdivergerecebimentoLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 1588
          mmWidth = 281887
          BandType = 5
          GroupNo = 0
        end
        object rpdivergerecebimentoLine6: TppLine
          UserName = 'rpdivergerecebimentoLine6'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 7144
          mmWidth = 281887
          BandType = 5
          GroupNo = 0
        end
        object DBCalcDiferenca: TppDBCalc
          UserName = 'DBCalcDiferenca'
          DataField = 'DIFERENCA'
          DataPipeline = PpRptCM
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'PpRptCM'
          mmHeight = 3704
          mmLeft = 220399
          mmTop = 2646
          mmWidth = 19050
          BandType = 5
          GroupNo = 0
        end
        object ppVarDescPatro: TppVariable
          UserName = 'VarDescPatro'
          CalcOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 106627
          mmTop = 2910
          mmWidth = 17992
          BandType = 5
          GroupNo = 0
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'PARTICIP'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'PpRptCM'
          mmHeight = 3175
          mmLeft = 124884
          mmTop = 2910
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object rpdivergerecebimentoGroup3: TppGroup
      BreakName = 'PARTICIP'
      OutlineSettings.CreateNode = True
      UserName = 'rpdivergerecebimentoGroup3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
      object rpdivergerecebimentoGroupHeaderBand3: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object rpLabelPlano: TppLabel
          UserName = 'rpLabelPlano'
          AutoSize = False
          Caption = 'Plano Assistencial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 74083
          mmTop = 1852
          mmWidth = 32015
          BandType = 3
          GroupNo = 2
        end
        object rpLabelContrib: TppLabel
          UserName = 'rpLabelContrib'
          AutoSize = False
          Caption = 'Tipo de Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 120915
          mmTop = 1588
          mmWidth = 22225
          BandType = 3
          GroupNo = 2
        end
        object rpLabelParticipante: TppLabel
          UserName = 'rpLabelParticipante'
          AutoSize = False
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 17992
          mmTop = 1852
          mmWidth = 45244
          BandType = 3
          GroupNo = 2
        end
        object rpLabelEsperado: TppLabel
          UserName = 'rpLabelEsperado'
          AutoSize = False
          Caption = 'Esperado(R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 187061
          mmTop = 1588
          mmWidth = 16933
          BandType = 3
          GroupNo = 2
        end
        object rpLabelRecebido: TppLabel
          UserName = 'rpLabelRecebido'
          AutoSize = False
          Caption = 'Recebido(R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 205583
          mmTop = 1588
          mmWidth = 16934
          BandType = 3
          GroupNo = 2
        end
        object rpLabelDiferenca: TppLabel
          UserName = 'rpLabelDiferenca'
          AutoSize = False
          Caption = 'Diferença(R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 2910
          mmLeft = 223838
          mmTop = 1588
          mmWidth = 16934
          BandType = 3
          GroupNo = 2
        end
        object rpdivergerecebimentoLine1: TppLine
          UserName = 'rpdivergerecebimentoLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 794
          mmWidth = 281887
          BandType = 3
          GroupNo = 2
        end
        object rpLabelSituacao: TppLabel
          UserName = 'rpLabelSituacao'
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 242094
          mmTop = 1588
          mmWidth = 16934
          BandType = 3
          GroupNo = 2
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 3175
          mmTop = 1852
          mmWidth = 13494
          BandType = 3
          GroupNo = 1
        end
        object ppLabel5: TppLabel
          UserName = 'Label2'
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 2910
          mmLeft = 173038
          mmTop = 1588
          mmWidth = 12435
          BandType = 3
          GroupNo = 1
        end
      end
      object rpdivergerecebimentoGroupFooterBand3: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650612
        56617244657363506174726F4F6E43616C630B50726F6772616D54797065070B
        747450726F63656475726506536F75726365068270726F636564757265205661
        7244657363506174726F4F6E43616C63287661722056616C75653A2056617269
        616E74293B0D0A626567696E0D0A0D0A202056616C7565203A3D2027546F7461
        6C20646120506174726F63696E61646F726120272B5070527074434D5B275041
        54524F275D2B27203A20273B0D0A0D0A656E643B0D0A0D436F6D706F6E656E74
        4E616D65060C56617244657363506174726F094576656E744E616D6506064F6E
        43616C63074576656E74494402210001060F5472614576656E7448616E646C65
        720B50726F6772616D4E616D65061356617244657363506174726F314F6E4361
        6C630B50726F6772616D54797065070B747450726F63656475726506536F7572
        6365066370726F6365647572652056617244657363506174726F314F6E43616C
        63287661722056616C75653A2056617269616E74293B0D0A626567696E0D0A0D
        0A202056616C7565203A3D2027546F74616C20476572616C203A20273B0D0A0D
        0A656E643B0D0A0D436F6D706F6E656E744E616D65060D566172446573635061
        74726F31094576656E744E616D6506064F6E43616C63074576656E7449440221
        0000}
    end
  end
  object QryAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  PT.NOME AS TITULAR,  PJ.NOME AS PATROCINADORA,  PL.NOME ' +
        'AS PLANO,  BF.DATAENTRADA,  PS.DATACANCELAMENTO,  EL.MATRICULA A' +
        'S MATRICULA,  PP.INSCRICAONUMERO AS INSCRICAO,  PS.DATAENTRADA A' +
        'S DATAINSCRICAO,  SP.FLGINTERNO, SP.DESCRICAO AS SITPARTICIPANTE' +
        ' FROM PESSOA PT, PESSOA PJ, PESSOAFISICA PF, PARTPREVPLAN PP, EL' +
        'EGPATRO EL, PARTASS PS, BENEFASS BF, PLANASS PL,  SITPLANOASS SP' +
        ' WHERE (PT.IDPESSOA=PF.IDPESSOA) AND (PT.IDPESSOA=PT.IDPESSOA) A' +
        'ND (PT.IDPESSOA=PP.IDPESSOA) AND (PT.IDPESSOA=EL.IDPESSOA) AND (' +
        'PT.IDPESSOA=BF.IDTITULAR) AND (PT.IDPESSOA=PS.IDPESSOA) AND (PJ.' +
        'IDPESSOA=111) AND (PJ.IDPESSOA=PP.IDPESSJUR) AND (PJ.IDPESSOA=PJ' +
        '.IDPESSOA) AND (PJ.IDPESSOA=EL.IDPESSJUR) AND (PJ.IDPESSOA=PS.ID' +
        'PESSJUR) AND (PJ.IDPESSOA=BF.IDPESSJUR) AND (PP.IDPESSJUR=PS.IDP' +
        'ESSJUR)AND (PP.IDPESSOA=PP.IDPESSOA) AND (PP.IDPLANOPREV=PS.IDPL' +
        'ANOPREV) AND (EL.IDPESSJUR=PS.IDPESSJUR) AND (PS.IDPESSOA=BF.IDT' +
        'ITULAR) AND (PS.IDSITPART=SP.IDSITPLANOASS) AND (SP.IDSITPLANOAS' +
        'S=1) AND (BF.IDPLANASS=PS.IDPLANASS) AND (BF.IDPLANASS=PL.IDPLAN' +
        'ASS) and (rownum=1) ORDER BY PATROCINADORA, TITULAR')
    ValidateWithMask = True
    Left = 19
    Top = 184
  end
  object DspAlterador: TDataSetProvider
    DataSet = QryAlterador
    Constraints = True
    Left = 81
    Top = 184
  end
  object CdsAlterador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DspAlterador'
    Left = 144
    Top = 184
  end
  object DsAlterador: TwwDataSource
    DataSet = CdsAlterador
    Left = 205
    Top = 184
  end
  object AQryAlterador: TADOQuery
    DataSource = DsRptCM
    Parameters = <>
    Left = 273
    Top = 184
  end
  object ppAlterador: TppBDEPipeline
    DataSource = dsFundacao
    UserName = 'Fundacao1'
    Left = 321
    Top = 185
    object ppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppField3: TppField
      FieldAlias = 'LOGRADOURO'
      FieldName = 'LOGRADOURO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object ppField4: TppField
      FieldAlias = 'NUMERO'
      FieldName = 'NUMERO'
      FieldLength = 8
      DisplayWidth = 8
      Position = 3
    end
    object ppField5: TppField
      FieldAlias = 'COMPLEMENTO'
      FieldName = 'COMPLEMENTO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 4
    end
    object ppField6: TppField
      FieldAlias = 'BAIRRO'
      FieldName = 'BAIRRO'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object ppField7: TppField
      FieldAlias = 'CIDADE'
      FieldName = 'CIDADE'
      FieldLength = 50
      DisplayWidth = 50
      Position = 6
    end
    object ppField8: TppField
      FieldAlias = 'CODESTADO'
      FieldName = 'CODESTADO'
      FieldLength = 3
      DisplayWidth = 3
      Position = 7
    end
    object ppField9: TppField
      FieldAlias = 'CEP'
      FieldName = 'CEP'
      FieldLength = 8
      DisplayWidth = 8
      Position = 8
    end
    object ppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
end
