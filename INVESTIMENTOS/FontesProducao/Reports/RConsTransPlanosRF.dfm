inherited RelConsTransPlanosRF: TRelConsTransPlanosRF
  Left = 514
  Top = 245
  Width = 359
  Height = 310
  Caption = 'e'
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Selecione'
    DataBaseName = 'BaseDados'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DataIni'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DataFinal'
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
        Caption = 'Plano de Origem :'
        Controle = tcLookupCombo
        CampoBanco = 'IDPLANPREVCTBPATR'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT PLANPRVCONTABPATRO, IDPLANPREVCTBPATR'
          'FROM VWPLANPREVCTBPATR')
        LookupSettings.Chave = 'IDPLANPREVCTBPATR'
        LookupSettings.Display = 'PLANPRVCONTABPATRO'
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
        Name = 'PlanPrevOrig'
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
        Caption = 'Classe :'
        Controle = tcLookupCombo
        CampoBanco = 'IDCLASSETIT'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDCLASSETIT, DESCCLASSETIT FROM CLASSETITRENFIX'
          'ORDER BY DESCCLASSETIT')
        LookupSettings.Chave = 'IDCLASSETIT'
        LookupSettings.Display = 'DESCCLASSETIT'
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
        Name = 'Classe'
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
        Caption = 'Investimento :'
        Controle = tcLookupCombo
        CampoBanco = 'IDINVESTIMENTO'
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT IDINVESTIMENTO, DESCINVESTIMENTO'
          'FROM INVESTIMENTO'
          'WHERE IDTIPOINVEST = 1')
        LookupSettings.Chave = 'IDINVESTIMENTO'
        LookupSettings.Display = 'DESCINVESTIMENTO'
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
        Name = 'Investimento'
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
    Formheight = 210
    FormWidth = 420
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rptConsTransPlanosRFMT
    LabelEmpresa = lblEmpresa
    LabelSistema = lblSistema
  end
  object sprConsTransPlanosRFMT: TCMSqlParams
    SQL.Strings = (
      
        'SELECT OP.BOLETA, PPO.PLANOPATROORIG, PPD.PLANOPATRODEST, CL.DES' +
        'CCLASSETIT, IV.DESCINVESTIMENTO,'
      
        '       OP.DATAOPERACAO, OP.VENCOPERACAO, OP.QTDEOPERACAO, OP.VLR' +
        'OPERACAO, '
      
        '       PPO.IDPLANPREVCTBPATR, PPD.IDPLANPREVCTBPATR, IV.IDCLASSE' +
        'TIT, OP.IDINVESTIMENTO, op.PERCTRANSF '
      
        'FROM OPERRENFIX OP, OPERRENFIX OD, INVESTIMENTO IV, CLASSETITREN' +
        'FIX CL, '
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANOPATROORIG, PA.I' +
        'DPLANPREVCTBPATR '
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L '
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+)) '
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPO, '
      
        '     (SELECT (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANOPATRODEST, PA.I' +
        'DPLANPREVCTBPATR '
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L '
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+)) '
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) PPD '
      
        'WHERE OP.DATAOPERACAO BETWEEN TO_DATE('#39'01/01/2006'#39','#39'DD/MM/YYYY'#39')' +
        ' AND TO_DATE('#39'30/11/2006'#39','#39'DD/MM/YYYY'#39') '
      '  AND OP.IDTIPOOPERACAO = -97 '
      '  AND OP.BOLETA = OD.BOLETA '
      '  AND OD.IDTIPOOPERACAO <> -97 '
      '  AND OD.IDOPERRENFIXORIG = OP.IDOPERRENFIXAPLIC '
      '  AND OP.IDPLANPREVCTBPATR = PPO.IDPLANPREVCTBPATR '
      '  AND OD.IDPLANPREVCTBPATR = PPD.IDPLANPREVCTBPATR '
      '  AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO '
      '  AND IV.IDCLASSETIT = CL.IDCLASSETIT '
      'ORDER BY OP.DATAOPERACAO, OP.BOLETA'
      ' '
      '')
    ClientDataSet = CdsConsTransPlanosRFMT
    Left = 48
    Top = 80
  end
  object CdsConsTransPlanosRFMT: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 80
    object CdsConsTransPlanosRFMTBOLETA: TStringField
      FieldName = 'BOLETA'
      Size = 30
    end
    object CdsConsTransPlanosRFMTPLANOPATROORIG: TStringField
      FieldName = 'PLANOPATROORIG'
      Size = 113
    end
    object CdsConsTransPlanosRFMTPLANOPATRODEST: TStringField
      FieldName = 'PLANOPATRODEST'
      Size = 113
    end
    object CdsConsTransPlanosRFMTDESCCLASSETIT: TStringField
      FieldName = 'DESCCLASSETIT'
      Size = 30
    end
    object CdsConsTransPlanosRFMTDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object CdsConsTransPlanosRFMTDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object CdsConsTransPlanosRFMTVENCOPERACAO: TDateTimeField
      FieldName = 'VENCOPERACAO'
    end
    object CdsConsTransPlanosRFMTQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '#,##0.000000000'
    end
    object CdsConsTransPlanosRFMTVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object CdsConsTransPlanosRFMTIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object CdsConsTransPlanosRFMTIDPLANPREVCTBPATR_1: TFloatField
      FieldName = 'IDPLANPREVCTBPATR_1'
    end
    object CdsConsTransPlanosRFMTIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
    end
    object CdsConsTransPlanosRFMTIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object CdsConsTransPlanosRFMTPERCTRANSF: TFloatField
      FieldName = 'PERCTRANSF'
    end
  end
  object dsConsTransPlanosRFMT: TDataSource
    DataSet = CdsConsTransPlanosRFMT
    Left = 184
    Top = 80
  end
  object rptConsTransPlanosRFMT: TppReport
    AutoStop = False
    DataPipeline = pplConsTransPlanosRFMT
    OnStartPage = rptConsTransPlanosRFMTStartPage
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Histórico de Operações de Transferência entre Planos'
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
    Left = 178
    Top = 144
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplConsTransPlanosRFMT'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 23813
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'shpCabecalho1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 4763
        mmLeft = 0
        mmTop = 19050
        mmWidth = 284300
        BandType = 0
      end
      object lblTituloRelatorio: TppLabel
        UserName = 'lblTituloRelatorio'
        Caption = 'Histórico de Operações de Transferência entre Planos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4106
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 90594
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 24342
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DbLogo'
        MaintainAspectRatio = False
        ShiftWithParent = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = dtmOperComum.pplEmpresa
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplEmpresa'
        mmHeight = 13229
        mmLeft = 2910
        mmTop = 265
        mmWidth = 13229
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'Periodo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3704
        mmLeft = 24871
        mmTop = 14023
        mmWidth = 11113
        BandType = 0
      end
      object pplPlanoOrig: TppLabel
        UserName = 'Label1'
        Caption = 'Plano / Patro de Origem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 31222
        mmTop = 20108
        mmWidth = 28046
        BandType = 0
      end
      object pplData: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Data'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 2910
        mmLeft = 528
        mmTop = 20108
        mmWidth = 13758
        BandType = 0
      end
      object pplBoleta: TppLabel
        UserName = 'Label3'
        Caption = 'Boleta'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 15611
        mmTop = 20108
        mmWidth = 7408
        BandType = 0
      end
      object pplClassetit: TppLabel
        UserName = 'lClassetit'
        Caption = 'Classe'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 134673
        mmTop = 20108
        mmWidth = 7938
        BandType = 0
      end
      object pplPlanoDest: TppLabel
        UserName = 'Label4'
        Caption = 'Plano / Patro de Destino'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 84402
        mmTop = 20108
        mmWidth = 28310
        BandType = 0
      end
      object pplQtdTransf: TppLabel
        UserName = 'lSldQtdAntOrig1'
        Caption = 'Qtd. Transferida'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 251355
        mmTop = 20108
        mmWidth = 19050
        BandType = 0
      end
      object pplPercentual: TppLabel
        UserName = 'Label8'
        Caption = 'Percent.'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2921
        mmLeft = 271992
        mmTop = 20108
        mmWidth = 9652
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label9'
        Caption = 'Investimento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 184944
        mmTop = 20108
        mmWidth = 15346
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        OnPrint = shpDetalhePrint
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppdbCarteira: TppDBText
        UserName = 'dbCarteira'
        DataField = 'DESCCLASSETIT'
        DataPipeline = pplConsTransPlanosRFMT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosRFMT'
        mmHeight = 2910
        mmLeft = 134673
        mmTop = 794
        mmWidth = 49213
        BandType = 4
      end
      object ppdbData: TppDBText
        UserName = 'dbData'
        DataField = 'DATAOPERACAO'
        DataPipeline = pplConsTransPlanosRFMT
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosRFMT'
        mmHeight = 2910
        mmLeft = 529
        mmTop = 794
        mmWidth = 13494
        BandType = 4
      end
      object ppdbBoleta: TppDBText
        UserName = 'dbBoleta'
        DataField = 'BOLETA'
        DataPipeline = pplConsTransPlanosRFMT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosRFMT'
        mmHeight = 2910
        mmLeft = 15610
        mmTop = 794
        mmWidth = 14023
        BandType = 4
      end
      object ppdbSldAntDest: TppDBText
        UserName = 'dbSldAntDest'
        DataField = 'QTDEOPERACAO'
        DataPipeline = pplConsTransPlanosRFMT
        DisplayFormat = '#,##0.000000000'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosRFMT'
        mmHeight = 2910
        mmLeft = 236803
        mmTop = 794
        mmWidth = 33867
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'dbBoleta1'
        DataField = 'PERCTRANSF'
        DataPipeline = pplConsTransPlanosRFMT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosRFMT'
        mmHeight = 2910
        mmLeft = 271728
        mmTop = 794
        mmWidth = 9260
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'dbCarteira1'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplConsTransPlanosRFMT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosRFMT'
        mmHeight = 2910
        mmLeft = 184944
        mmTop = 794
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'PLANOPATROORIG'
        DataPipeline = pplConsTransPlanosRFMT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosRFMT'
        mmHeight = 2910
        mmLeft = 31221
        mmTop = 794
        mmWidth = 51858
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'PLANOPATRODEST'
        DataPipeline = pplConsTransPlanosRFMT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosRFMT'
        mmHeight = 2910
        mmLeft = 84402
        mmTop = 794
        mmWidth = 49213
        BandType = 4
      end
      object ppLabel2: TppLabel
        UserName = 'Label10'
        Caption = '%'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 282046
        mmTop = 794
        mmWidth = 2117
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object lblSistema: TppLabel
        UserName = 'lblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 529
        mmTop = 1058
        mmWidth = 283369
        BandType = 8
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
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
        mmHeight = 3439
        mmLeft = 257440
        mmTop = 1058
        mmWidth = 26194
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 0
        mmTop = 1058
        mmWidth = 283369
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = pplConsTransPlanosRFMT
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConsTransPlanosRFMT'
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
  end
  object pplConsTransPlanosRFMT: TppBDEPipeline
    DataSource = dsConsTransPlanosRFMT
    UserName = 'lConsTransPlanosRFMT'
    Left = 77
    Top = 144
    object pplConsTransPlanosRFMTppField1: TppField
      FieldAlias = 'BOLETA'
      FieldName = 'BOLETA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosRFMTppField2: TppField
      FieldAlias = 'PLANOPATROORIG'
      FieldName = 'PLANOPATROORIG'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosRFMTppField3: TppField
      FieldAlias = 'PLANOPATRODEST'
      FieldName = 'PLANOPATRODEST'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosRFMTppField4: TppField
      FieldAlias = 'DESCCLASSETIT'
      FieldName = 'DESCCLASSETIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosRFMTppField5: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosRFMTppField6: TppField
      FieldAlias = 'DATAOPERACAO'
      FieldName = 'DATAOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosRFMTppField7: TppField
      FieldAlias = 'VENCOPERACAO'
      FieldName = 'VENCOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosRFMTppField8: TppField
      FieldAlias = 'QTDEOPERACAO'
      FieldName = 'QTDEOPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosRFMTppField9: TppField
      FieldAlias = 'VLROPERACAO'
      FieldName = 'VLROPERACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosRFMTppField10: TppField
      FieldAlias = 'IDPLANPREVCTBPATR'
      FieldName = 'IDPLANPREVCTBPATR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosRFMTppField11: TppField
      FieldAlias = 'IDPLANPREVCTBPATR_1'
      FieldName = 'IDPLANPREVCTBPATR_1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosRFMTppField12: TppField
      FieldAlias = 'IDCLASSETIT'
      FieldName = 'IDCLASSETIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosRFMTppField13: TppField
      FieldAlias = 'IDINVESTIMENTO'
      FieldName = 'IDINVESTIMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplConsTransPlanosRFMTppField14: TppField
      FieldAlias = 'PERCTRANSF'
      FieldName = 'PERCTRANSF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
  end
end
