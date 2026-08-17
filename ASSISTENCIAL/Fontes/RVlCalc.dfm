inherited RptVlCalc: TRptVlCalc
  Left = 323
  Top = 101
  Width = 374
  Height = 217
  Caption = 'RptVlCalc'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Relatório de Calculo de Contribuições'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Ano/Mês de Cobrança'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DISTINCT MESCOBRANCA'
          'FROM HSTCONTRIBASS'
          'ORDER BY MESCOBRANCA')
        LookupSettings.Chave = 'MESCOBRANCA'
        LookupSettings.Display = 'MESCOBRANCA'
        LookupSettings.Descricao = 'Ano / Mês'
        LookupSettings.Tamanho = '7'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 90
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
        Name = 'MesRef'
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
        Name = 'cmbpatrocinadora'
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
        Caption = 'Situação Principal'
        Controle = tcRadioGroup
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Folha da Patrocinadora'
          'Folha da Fundação'
          'Cobrança em Banco'
          'Folha de Benefícios'
          'Todas')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4')
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = 3
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
        Name = 'SitPrinc'
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
    FormWidth = 380
    Left = 141
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    ChangeConnectionType = CrmRptCMChangeConnectionType
    ChangeConnection = CrmRptCMChangeConnection
    DataBaseName = 'BaseDados'
    ShowCancelDialog = False
    Report = RpVlCalc
    Left = 81
  end
  object PpRptCM: TppBDEPipeline
    DataSource = DsRptCM
    UserName = 'PpRptCM'
    Left = 247
    Top = 8
    object PpRptCMppField1: TppField
      FieldAlias = 'MES'
      FieldName = 'MES'
      FieldLength = 7
      DisplayWidth = 7
      Position = 0
    end
    object PpRptCMppField2: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 7
      DisplayWidth = 7
      Position = 1
    end
    object PpRptCMppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object PpRptCMppField4: TppField
      FieldAlias = 'PARTICIP'
      FieldName = 'PARTICIP'
      FieldLength = 60
      DisplayWidth = 60
      Position = 3
    end
    object PpRptCMppField5: TppField
      FieldAlias = 'PATRO'
      FieldName = 'PATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 4
    end
    object PpRptCMppField6: TppField
      FieldAlias = 'PLANOASSIS'
      FieldName = 'PLANOASSIS'
      FieldLength = 40
      DisplayWidth = 40
      Position = 5
    end
    object PpRptCMppField7: TppField
      FieldAlias = 'REGIONAL'
      FieldName = 'REGIONAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 6
    end
    object PpRptCMppField8: TppField
      FieldAlias = 'DEPENDENTE'
      FieldName = 'DEPENDENTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 7
    end
    object PpRptCMppField9: TppField
      FieldAlias = 'CONTRIBUICAO'
      FieldName = 'CONTRIBUICAO'
      FieldLength = 60
      DisplayWidth = 60
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
      FieldLength = 17
      DisplayWidth = 17
      Position = 13
    end
    object PpRptCMppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'SEQPROPOSTA'
      FieldName = 'SEQPROPOSTA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object PpRptCMppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDTITULAR'
      FieldName = 'IDTITULAR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object PpRptCMppField17: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 16
    end
    object PpRptCMppField18: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANASS'
      FieldName = 'IDPLANASS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 17
    end
    object PpRptCMppField19: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 18
    end
    object PpRptCMppField20: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDMOTIVO'
      FieldName = 'IDMOTIVO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 19
    end
    object PpRptCMppField21: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDDEPENDENTE'
      FieldName = 'IDDEPENDENTE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 20
    end
    object PpRptCMppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDCONTASS'
      FieldName = 'IDCONTASS'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object PpRptCMppField23: TppField
      FieldAlias = 'SITUACAOPREV'
      FieldName = 'SITUACAOPREV'
      FieldLength = 50
      DisplayWidth = 50
      Position = 22
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
    SQL.Strings = (
      
        'SELECT H.MES, H.MESCOBRANCA, P.IDPESSOA MATRICULA, P.NOME PARTIC' +
        'IP,'
      
        'PJ.NOME PATRO, PA.NOME PLANOASSIS, PR.NOME REGIONAL, PD.NOME DEP' +
        'ENDENTE,'
      'C.NOME CONTRIBUICAO, H.VALORESPERADO, H.VALORRECEBIDO,'
      
        'H.VALORRECEBIDO - H.VALORESPERADO AS DIFERENCA, H.SITRECEBIMENTO' +
        ','
      
        'DECODE(H.SITRECEBIMENTO,1,'#39'NAO ESPERADOR'#39',3,'#39'DIVERGENTE/ATRASO'#39',' +
        '4,'#39'TRATADO'#39') AS SITUACAO,'
      'H.SEQPROPOSTA, H.IDTITULAR, H.IDPLANOPREV, H.IDPLANASS,'
      
        'H.IDPESSJUR, H.IDMOTIVO, H.IDDEPENDENTE, H.IDCONTASS, ST.DESCRIC' +
        'AO AS SITUACAOPREV'
      'FROM'
      
        'HSTCONTRIBASS H, PESSOA P, PESSOA PJ, PESSOA PR, PESSOA PD, ELEG' +
        'PATRO EP,'
      'PARTPREVPLAN PP, SITPART ST, PLANASS PA, CONTRIBUICAO C'
      
        'WHERE (H.MES = '#39'2002/07'#39') AND (H.SITRECEBIMENTO IN (0,1,2,3,4)) ' +
        'AND'
      '(H.IDTITULAR = P.IDPESSOA) AND (H.IDPESSJUR = PJ.IDPESSOA) AND'
      
        '(H.IDTITULAR = PP.IDPESSOA) AND (H.IDPLANOPREV = PP.IDPLANOPREV)' +
        ' AND'
      
        '(H.IDPLANASS = PA.IDPLANASS) AND (H.IDTITULAR = EP.IDPESSOA ) AN' +
        'D'
      '(H.IDPESSJUR = EP.IDPESSJUR) AND (PP.FLGDESATIVADO = 0) AND'
      
        '(EP.IDESTAB  = PR.IDPESSOA) AND (H.IDDEPENDENTE = PD.IDPESSOA) A' +
        'ND'
      
        '(H.IDCONTASS = C.IDCONTRIBUICAO) AND (PP.IDSITPART = ST.IDSITPAR' +
        'T)AND (ROWNUM < 10)'
      'ORDER BY  PJ.NOME, P.NOME'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
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
  object RpVlCalc: TppReport
    AutoStop = False
    DataPipeline = PpRptCM
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
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
    Left = 307
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand12: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 35983
      mmPrintPosition = 0
      object rpLabelTitulo: TppLabel
        UserName = 'rpLabelTitulo'
        Caption = 'Relatório de Cálculo de Contribuições'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 2910
        mmTop = 29898
        mmWidth = 76994
        BandType = 0
      end
      object rpDBTextMesRef: TppDBText
        UserName = 'rpDBTextMesRef'
        DataField = 'MESCOBRANCA'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 246063
        mmTop = 31221
        mmWidth = 20902
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
        mmHeight = 4233
        mmLeft = 43392
        mmTop = 7673
        mmWidth = 25400
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
        mmHeight = 3704
        mmLeft = 50800
        mmTop = 21960
        mmWidth = 17198
        BandType = 0
      end
      object rpLabelMesref: TppLabel
        UserName = 'rpLabelMesref'
        Caption = 'Ano/Mês de Cobrança: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 205846
        mmTop = 31221
        mmWidth = 39158
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
    object ppDetailBand: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object DBTextParticip: TppDBText
        UserName = 'DBTextParticip'
        DataField = 'PARTICIP'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 20638
        mmTop = 265
        mmWidth = 65881
        BandType = 4
      end
      object rpDBTextPlano: TppDBText
        UserName = 'rpDBTextPlano'
        DataField = 'PLANOASSIS'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 87577
        mmTop = 265
        mmWidth = 61648
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
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3175
        mmLeft = 242094
        mmTop = 265
        mmWidth = 19050
        BandType = 4
      end
      object ppDBMatricula: TppDBText
        UserName = 'rpdivergerecebimentoDBText101'
        DataField = 'MATRICULA'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 2910
        mmTop = 265
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'rpDBTextPlano1'
        DataField = 'SITUACAOPREV'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 150284
        mmTop = 265
        mmWidth = 66411
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MES'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3175
        mmLeft = 220398
        mmTop = 265
        mmWidth = 14817
        BandType = 4
      end
    end
    object ppFooterBand12: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6879
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
        mmLeft = 0
        mmTop = 1323
        mmWidth = 132292
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
        mmLeft = 133615
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
        AutoSize = False
        Caption = 'Total Geral (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 119063
        mmTop = 7673
        mmWidth = 21960
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
        Transparent = True
        mmHeight = 3704
        mmLeft = 141817
        mmTop = 7408
        mmWidth = 29369
        BandType = 7
      end
      object ppVariable1: TppVariable
        UserName = 'VarDescTotalPatro1'
        AutoSize = False
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 7144
        mmWidth = 87842
        BandType = 7
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'VarTotalPatro1'
        DataField = 'PARTICIP'
        DataPipeline = PpRptCM
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 3175
        mmLeft = 91811
        mmTop = 7408
        mmWidth = 23019
        BandType = 7
      end
    end
    object rpdivergerecebimentoGroup1: TppGroup
      BreakName = 'PATRO'
      DataPipeline = PpRptCM
      NewPage = True
      UserName = 'rpdivergerecebimentoGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpdivergerecebimentoGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 9525
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
          mmHeight = 3704
          mmLeft = 28310
          mmTop = 265
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          AutoSize = False
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 3440
          mmTop = 6085
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object rpLabelParticipante: TppLabel
          UserName = 'rpLabelParticipante'
          AutoSize = False
          Caption = 'Participante'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 21696
          mmTop = 5821
          mmWidth = 45244
          BandType = 3
          GroupNo = 0
        end
        object rpLabelPlano: TppLabel
          UserName = 'rpLabelPlano'
          AutoSize = False
          Caption = 'Plano Assistencial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 88636
          mmTop = 5556
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object rpLabelEsperado: TppLabel
          UserName = 'rpLabelEsperado'
          AutoSize = False
          Caption = 'Valor Calculado(R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 238919
          mmTop = 5292
          mmWidth = 28840
          BandType = 3
          GroupNo = 0
        end
        object ppLabel2: TppLabel
          UserName = 'rpLabelPlano1'
          AutoSize = False
          Caption = 'Situação Principal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 150813
          mmTop = 5556
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          AutoSize = False
          Caption = 'Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 218811
          mmTop = 5556
          mmWidth = 16933
          BandType = 3
          GroupNo = 0
        end
      end
      object rpdivergerecebimentoGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object rpLabelTotalPatro: TppLabel
          UserName = 'rpLabelTotalPatro'
          AutoSize = False
          Caption = 'Total Valor Calculado(R$)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 114300
          mmTop = 3704
          mmWidth = 37042
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
          Transparent = True
          mmHeight = 3704
          mmLeft = 152400
          mmTop = 3704
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object rpdivergerecebimentoLine4: TppLine
          UserName = 'rpdivergerecebimentoLine4'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 265
          mmLeft = 0
          mmTop = 2910
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
          mmTop = 7673
          mmWidth = 281887
          BandType = 5
          GroupNo = 0
        end
        object ppVarDescTotalPatro: TppVariable
          UserName = 'VarDescTotalPatro'
          AutoSize = False
          CalcOrder = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 2646
          mmTop = 3440
          mmWidth = 85725
          BandType = 5
          GroupNo = 0
        end
        object ppVarTotalPatro: TppDBCalc
          UserName = 'VarTotalPatro'
          DataField = 'PARTICIP'
          DataPipeline = PpRptCM
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = rpdivergerecebimentoGroup1
          Transparent = True
          DBCalcType = dcCount
          mmHeight = 3175
          mmLeft = 88900
          mmTop = 3704
          mmWidth = 21696
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650617
        56617244657363546F74616C506174726F4F6E43616C630B50726F6772616D54
        797065070B747450726F63656475726506536F75726365069370726F63656475
        72652056617244657363546F74616C506174726F4F6E43616C63287661722056
        616C75653A2056617269616E74293B0D0A626567696E0D0A0D0A202056616C75
        65203A3D2027546F74616C20646120506174726F63696E61646F726120272B50
        70527074434D5B27504154524F275D2B27203A20273B0D0A2020202020202020
        202020200D0A656E643B0D0A0D436F6D706F6E656E744E616D65061156617244
        657363546F74616C506174726F094576656E744E616D6506064F6E43616C6307
        4576656E74494402210001060F5472614576656E7448616E646C65720B50726F
        6772616D4E616D65061856617244657363546F74616C506174726F314F6E4361
        6C630B50726F6772616D54797065070B747450726F63656475726506536F7572
        6365066870726F6365647572652056617244657363546F74616C506174726F31
        4F6E43616C63287661722056616C75653A2056617269616E74293B0D0A626567
        696E0D0A0D0A202056616C7565203A3D2027546F74616C20476572616C203A20
        273B0D0A0D0A656E643B0D0A0D436F6D706F6E656E744E616D65061256617244
        657363546F74616C506174726F31094576656E744E616D6506064F6E43616C63
        074576656E74494402210000}
    end
  end
end
