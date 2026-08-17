inherited rptReserva: TrptReserva
  Left = 193
  Top = 448
  Width = 468
  Height = 393
  Caption = 'rptReserva'
  Menu = MainMenu1
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Emissão de Reserva Orçamentária - Especial'
    Params = <
      item
        Caption = 'Nº da Reserva Especial (Operação)'
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
        Caption = 'Valor'
        Controle = tcEdit
        TipodeDado = tdReal
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
        Caption = 'Atividade e Projeto'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'UNIDNEGOC'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Atividade e projeto'
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
        Caption = 'Centro de Custo'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'CODCENTROCUSTO'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Centro de custo'
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
        Caption = 'Plano Previdenciário'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'IDPLANOPREV'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Plano previdenciário'
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
        Caption = 'Patrocinadora'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Chave = 'IDPESSOA'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Patrocinadora'
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
      end>
    Top = 16
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    Report = rpReserva
    LabelEmpresa = ppLabel102
    LabelSistema = ppLabel165
  end
  object sqlReserva: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   R.IDCONTAORCAMEN, C.NOMECONTAORCAMEN, R.OBSRESERVA,'
      
        '   R.DATAREFERENCIA, R.NUMRESERVA, R.FLGRESERVA, R.IDPLANOORCAME' +
        'N,'
      '   CR.CODEXTERNO AS CODCENTRORESPON, CR.NOME, R.VLRRESERVA,'
      '   DECODE(R.FLGRESERVA,'#39'A'#39','#39'Aguardando...'#39','
      '   DECODE(R.FLGRESERVA,'#39'E'#39','#39'Efetivada'#39','
      '   DECODE(R.FLGRESERVA,'#39'C'#39','#39'Cancelada'#39','
      '   DECODE(R.FLGRESERVA,'#39'U'#39','#39'Em Uso'#39','#39' '#39')))) AS STATUS'
      'FROM'
      '   RESERVAORCAMEN R, CENTRESPON CR, CONTASORCAMEN C'
      'WHERE'
      '   (R.FLGRESCOMP = '#39'R'#39') AND'
      '   (R.IDCONTAORCAMEN) = (C.IDCONTAORCAMEN) AND'
      '   (R.IDPLANOORCAMEN) = (C.IDPLANOORCAMEN) AND'
      '   (C.CODCENTRORESPON) = (CR.CODCENTRORESPON(+)) AND'
      '   (C.IDPESSOA) = (CR.IDPESSOA(+) )  AND'
      '   (R.IDOPERACAO = :IDOPERACAO) AND'
      '   (R.IDPESSOA =:IDPESSOA)'
      '   :PATRO'
      '   :PLANO'
      '   :ATIVPROJ'
      '   :CCUSTO'
      ''
      ' '
      ' ')
    OnFormartParam = sqlReservaFormartParam
    ClientDataSet = cdsReserva
    Left = 32
    Top = 56
  end
  object dsReserva: TwwDataSource
    DataSet = cdsReserva
    Left = 96
    Top = 64
  end
  object pplReserva: TppBDEPipeline
    DataSource = dsReserva
    UserName = 'lReserva'
    Left = 168
    Top = 96
  end
  object rpReserva: TppReport
    AutoStop = False
    DataPipeline = pplReserva
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
    OutlineSettings.CreateNode = False
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 232
    Top = 64
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplReserva'
    object ppHeaderBand17: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 20373
      mmPrintPosition = 0
      object ppLabel93: TppLabel
        UserName = 'ppLabel93'
        Caption = 'Reserva Orçamentário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 22490
        mmTop = 7408
        mmWidth = 54240
        BandType = 0
      end
      object ppLabel102: TppLabel
        UserName = 'ppLabel102'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 22490
        mmTop = 1588
        mmWidth = 24299
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = False
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = pplCdsImagem
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'pplCdsImagem'
        mmHeight = 15346
        mmLeft = 2117
        mmTop = 1588
        mmWidth = 19315
        BandType = 0
      end
      object mParametros: TppMemo
        UserName = 'mParametros'
        Caption = 'mParametros'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Stretch = True
        Transparent = True
        mmHeight = 3969
        mmLeft = 22490
        mmTop = 12965
        mmWidth = 174625
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 212196
      mmPrintPosition = 0
      object ppShape2: TppShape
        UserName = 'ppShape2'
        mmHeight = 138642
        mmLeft = 3704
        mmTop = 39158
        mmWidth = 186267
        BandType = 4
      end
      object ppLabel158: TppLabel
        UserName = 'ppLabel158'
        Caption = 'Centro de Responsabilidade : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 12700
        mmWidth = 50536
        BandType = 4
      end
      object ppDBText57: TppDBText
        UserName = 'ppDBText57'
        DataField = 'CODCENTRORESPON'
        DataPipeline = pplReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReserva'
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 12700
        mmWidth = 26194
        BandType = 4
      end
      object ppLabel159: TppLabel
        UserName = 'ppLabel159'
        Caption = 'Conta Orçamentária : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 17992
        mmTop = 18521
        mmWidth = 37042
        BandType = 4
      end
      object ppDBText58: TppDBText
        UserName = 'ppDBText58'
        DataField = 'NOME'
        DataPipeline = pplReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReserva'
        mmHeight = 4233
        mmLeft = 83079
        mmTop = 12700
        mmWidth = 95515
        BandType = 4
      end
      object ppDBText59: TppDBText
        UserName = 'ppDBText59'
        DataField = 'IDCONTAORCAMEN'
        DataPipeline = pplReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReserva'
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 18521
        mmWidth = 26194
        BandType = 4
      end
      object ppDBText60: TppDBText
        UserName = 'ppDBText60'
        DataField = 'NOMECONTAORCAMEN'
        DataPipeline = pplReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReserva'
        mmHeight = 4233
        mmLeft = 83079
        mmTop = 18521
        mmWidth = 95515
        BandType = 4
      end
      object ppLabel160: TppLabel
        UserName = 'ppLabel160'
        AutoSize = False
        Caption = 'Observações da Reserva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 4498
        mmTop = 33867
        mmWidth = 50536
        BandType = 4
      end
      object ppLabel161: TppLabel
        UserName = 'ppLabel161'
        AutoSize = False
        Caption = 'Status da Reserva : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 4233
        mmTop = 24871
        mmWidth = 50800
        BandType = 4
      end
      object ppDBText61: TppDBText
        UserName = 'ppDBText61'
        DataField = 'STATUS'
        DataPipeline = pplReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReserva'
        mmHeight = 4233
        mmLeft = 56356
        mmTop = 24871
        mmWidth = 95515
        BandType = 4
      end
      object ppDBText62: TppDBText
        UserName = 'ppDBText62'
        DataField = 'DATAREFERENCIA'
        DataPipeline = pplReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReserva'
        mmHeight = 5249
        mmLeft = 20108
        mmTop = 1588
        mmWidth = 32015
        BandType = 4
      end
      object ppLabel162: TppLabel
        UserName = 'ppLabel162'
        Caption = 'Data : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5419
        mmLeft = 4498
        mmTop = 1588
        mmWidth = 14012
        BandType = 4
      end
      object ppLabel163: TppLabel
        UserName = 'ppLabel163'
        AutoSize = False
        Caption = 'Nº Reserva : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5419
        mmLeft = 109802
        mmTop = 1588
        mmWidth = 45773
        BandType = 4
      end
      object ppDBText63: TppDBText
        UserName = 'ppDBText63'
        DataField = 'NUMRESERVA'
        DataPipeline = pplReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplReserva'
        mmHeight = 5249
        mmLeft = 157427
        mmTop = 1588
        mmWidth = 32015
        BandType = 4
      end
      object ppLine41: TppLine
        UserName = 'ppLine41'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 9790
        mmWidth = 197300
        BandType = 4
      end
      object rptReservaDBMemo1: TppDBMemo
        UserName = 'rptReservaDBMemo1'
        CharWrap = False
        DataField = 'OBSRESERVA'
        DataPipeline = pplReserva
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        DataPipelineName = 'pplReserva'
        mmHeight = 135996
        mmLeft = 4763
        mmTop = 40217
        mmWidth = 183357
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object ppLabel246: TppLabel
        UserName = 'Label246'
        AutoSize = False
        Caption = 'Saldo Anterior: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 3175
        mmTop = 189971
        mmWidth = 31485
        BandType = 4
      end
      object txtSaldoAntReserva: TppLabel
        UserName = 'txtSaldoAntReserva'
        AutoSize = False
        Caption = 'txtSaldoAntReserva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 35719
        mmTop = 190236
        mmWidth = 33073
        BandType = 4
      end
      object ppLabel248: TppLabel
        UserName = 'Label248'
        Caption = 'Valor : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 76465
        mmTop = 189707
        mmWidth = 14288
        BandType = 4
      end
      object ppDBText121: TppDBText
        UserName = 'DBText121'
        DataField = 'VLRRESERVA'
        DataPipeline = pplReserva
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplReserva'
        mmHeight = 4763
        mmLeft = 92604
        mmTop = 190236
        mmWidth = 33073
        BandType = 4
      end
      object ppLabel249: TppLabel
        UserName = 'Label249'
        AutoSize = False
        Caption = 'Saldo Atual : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5027
        mmLeft = 128059
        mmTop = 189971
        mmWidth = 27517
        BandType = 4
      end
      object txtSaldoReserva: TppLabel
        UserName = 'txtSaldoReserva'
        AutoSize = False
        Caption = 'txtSaldoReserva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 155575
        mmTop = 190236
        mmWidth = 33073
        BandType = 4
      end
      object ppLine76: TppLine
        UserName = 'Line76'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 3440
        mmTop = 204259
        mmWidth = 59267
        BandType = 4
      end
      object ppLabel254: TppLabel
        UserName = 'Label254'
        Caption = 'Gestor 1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Book Antiqua'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3440
        mmTop = 205052
        mmWidth = 12171
        BandType = 4
      end
      object ppLine78: TppLine
        UserName = 'Line78'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 65088
        mmTop = 204259
        mmWidth = 59267
        BandType = 4
      end
      object ppLabel255: TppLabel
        UserName = 'Label255'
        Caption = 'Gestor 2'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Book Antiqua'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 65088
        mmTop = 205052
        mmWidth = 12171
        BandType = 4
      end
      object ppLine79: TppLine
        UserName = 'Line79'
        Weight = 0.75
        mmHeight = 1852
        mmLeft = 127794
        mmTop = 204259
        mmWidth = 59267
        BandType = 4
      end
      object ppLabel256: TppLabel
        UserName = 'Label256'
        Caption = 'Gestor 3'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Book Antiqua'
        Font.Size = 10
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 127794
        mmTop = 205052
        mmWidth = 12171
        BandType = 4
      end
      object ppLabel257: TppLabel
        UserName = 'Label257'
        AutoSize = False
        Caption = 'Valor Orçado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5292
        mmLeft = 126736
        mmTop = 179388
        mmWidth = 28046
        BandType = 4
      end
      object txtValorOrcado: TppLabel
        UserName = 'txtValorOrcado'
        AutoSize = False
        Caption = 'txtValorOrcado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 155575
        mmTop = 179917
        mmWidth = 33073
        BandType = 4
      end
    end
    object ppFooterBand17: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine42: TppLine
        UserName = 'ppLine42'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel165: TppLabel
        UserName = 'ppLabel165'
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
      object ppCalc32: TppSystemVariable
        UserName = 'Calc32'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 80169
        mmTop = 1588
        mmWidth = 36777
        BandType = 8
      end
      object ppCalc33: TppSystemVariable
        UserName = 'Calc33'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 169598
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'ppDBText63'
      BreakType = btCustomField
      OutlineSettings.CreateNode = True
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = ''
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
  object sqlValorOrcado: TCMSqlParams
    SQL.Strings = (
      'SELECT SUM(VLRORCADO) AS VLRORCADO'
      'FROM SALDOORCADO S, CONTASORCAMEN C'
      'WHERE (S.IDCONTAORCAMEN = :IDCONTAORCAMEN)'
      '  AND (S.IDPESSOA = :IDPESSOA)'
      '  AND (S.IDPLANOORCAMEN = :IDPLANOORCAMEN)'
      '  AND (TO_CHAR(DATAREFERENCIA,'#39'YYYYMM'#39') = :ANOMESREF)'
      '  AND (S.IDCONTAORCAMEN = C.IDCONTAORCAMEN)'
      '  :PATRO'
      '  :PLANO'
      '  :ATIVPROJ'
      '  :CCUSTO ')
    OnFormartParam = sqlValorOrcadoFormartParam
    ClientDataSet = cdsValorOrcado
    Left = 24
    Top = 120
  end
  object cdsValorOrcado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 96
    Top = 152
  end
  object cdsReserva: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 160
    Top = 136
  end
  object MainMenu1: TMainMenu
    Left = 56
    Top = 208
  end
  object pplCdsImagem: TppBDEPipeline
    DataSource = dsImagem
    UserName = 'lCdsImagem'
    Left = 208
  end
  object CdsImagem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
  end
  object dsImagem: TDataSource
    DataSet = CdsImagem
    Left = 264
  end
end
