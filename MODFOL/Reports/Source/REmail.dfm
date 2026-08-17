inherited RptEmail: TRptEmail
  Left = 890
  Top = 223
  Width = 342
  Height = 308
  Caption = 'RptEmail'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'DataInicio'
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
        Name = 'DataInicio'
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
        Caption = 'DataFinal'
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
        Caption = 'ListaIdFunc'
        Controle = tcEdit
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
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ListaIdFunc'
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
        Caption = 'ListaSitFunc'
        Controle = tcEdit
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
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ListaSitFunc'
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
    Left = 142
    Top = 10
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpEmail
    ConnectionType = cntBDE
  end
  object rpEmail: TppReport
    AutoStop = False
    DataPipeline = ppEmail
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Relatório de Advertências e Suspensões'
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    CachePages = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 242
    Top = 16
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppEmail'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47361
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 5292
        mmLeft = 1323
        mmTop = 42069
        mmWidth = 282047
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'lblEmpresa'
        AutoSize = False
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4995
        mmLeft = 25400
        mmTop = 1323
        mmWidth = 236803
        BandType = 0
      end
      object lblEnd1: TppLabel
        UserName = 'lblEnd1'
        AutoSize = False
        Caption = 
          'SCN, Quadra 2, Bloco A Edifício Corporate Financial Center 12 e ' +
          '13 Andares'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3598
        mmLeft = 25400
        mmTop = 11906
        mmWidth = 236803
        BandType = 0
      end
      object lblEnd2: TppLabel
        UserName = 'lblEnd2'
        AutoSize = False
        Caption = 
          'Brasília  DF  CEP 70.712-900 - (061)3329-1700 - www.funcef.com.b' +
          'r'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 25400
        mmTop = 7144
        mmWidth = 236803
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Período de Datas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 3970
        mmTop = 24871
        mmWidth = 27051
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 3970
        mmTop = 30163
        mmWidth = 13293
        BandType = 0
      end
      object lblSitFunc: TppLabel
        UserName = 'lblSitFunc'
        Caption = 'lblConteudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 33073
        mmTop = 30163
        mmWidth = 16933
        BandType = 0
      end
      object lblPeriodo: TppLabel
        UserName = 'lblPeriodo'
        Caption = 'lblConteudo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 33073
        mmTop = 24871
        mmWidth = 17060
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Brush.Color = clBackground
        mmHeight = 794
        mmLeft = 1323
        mmTop = 34660
        mmWidth = 282047
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'lblEmpresa1'
        AutoSize = False
        Caption = 'Relatório de Email pessoal e corporativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4657
        mmLeft = 25400
        mmTop = 35719
        mmWidth = 236803
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Brush.Color = clBackground
        mmHeight = 794
        mmLeft = 1323
        mmTop = 40746
        mmWidth = 282046
        BandType = 0
      end
      object lblNome: TppLabel
        UserName = 'lblNome'
        Caption = 'Matr.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 3175
        mmTop = 43127
        mmWidth = 6646
        BandType = 0
      end
      object lblMatr: TppLabel
        UserName = 'lblMatr'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 15346
        mmTop = 43127
        mmWidth = 7874
        BandType = 0
      end
      object lblCargo: TppLabel
        UserName = 'lblCargo'
        Caption = 'Cargo/Função'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 63765
        mmTop = 43127
        mmWidth = 19050
        BandType = 0
      end
      object lblCCusto: TppLabel
        UserName = 'lblCCusto'
        Caption = 'Lotação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 107686
        mmTop = 43127
        mmWidth = 10837
        BandType = 0
      end
      object lblTipo: TppLabel
        UserName = 'lblTipo'
        Caption = 'Diretoria'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 136261
        mmTop = 43127
        mmWidth = 11642
        BandType = 0
      end
      object rpRelPensAlimDBImage1: TppDBImage
        UserName = 'rpRelPensAlimDBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        DataPipeline = ppFundacao
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        DataPipelineName = 'ppFundacao'
        mmHeight = 22490
        mmLeft = 3704
        mmTop = 794
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'lblMotivo1'
        Caption = 'Email Corporativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 152136
        mmTop = 43127
        mmWidth = 24342
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Email Pessoal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 194998
        mmTop = 42863
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Sit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 245269
        mmTop = 42863
        mmWidth = 3641
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Admissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 251090
        mmTop = 42863
        mmWidth = 13420
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Deslig./Afast'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3387
        mmLeft = 265378
        mmTop = 42863
        mmWidth = 17018
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 6085
      mmPrintPosition = 0
      object rpAdverteSuspensaoDBNome: TppDBText
        UserName = 'rpAdverteSuspensaoDBNome'
        DataField = 'MATRICULA'
        DataPipeline = ppEmail
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEmail'
        mmHeight = 2879
        mmLeft = 2117
        mmTop = 1058
        mmWidth = 9790
        BandType = 4
      end
      object rpAdverteSuspensaoDBMatric: TppDBText
        UserName = 'rpAdverteSuspensaoDBMatric'
        DataField = 'NOME'
        DataPipeline = ppEmail
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEmail'
        mmHeight = 2879
        mmLeft = 12700
        mmTop = 1058
        mmWidth = 48154
        BandType = 4
      end
      object rpAdverteSuspensaoDBCargo: TppDBText
        UserName = 'rpAdverteSuspensaoDBCargo'
        DataField = 'CARGO'
        DataPipeline = ppEmail
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEmail'
        mmHeight = 2879
        mmLeft = 61648
        mmTop = 1058
        mmWidth = 38365
        BandType = 4
      end
      object rpAdverteSuspensaoDBUnd: TppDBText
        UserName = 'rpAdverteSuspensaoDBUnd'
        DataField = 'UNIDADE'
        DataPipeline = ppEmail
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppEmail'
        mmHeight = 2879
        mmLeft = 101071
        mmTop = 1058
        mmWidth = 33073
        BandType = 4
      end
      object rpAdverteSuspensaoDBTipo: TppDBText
        UserName = 'rpAdverteSuspensaoDBTipo'
        AutoSize = True
        DataField = 'DIRETORIA'
        DataPipeline = ppEmail
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEmail'
        mmHeight = 2879
        mmLeft = 134938
        mmTop = 1058
        mmWidth = 13293
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'EMAILFUNCEF'
        DataPipeline = ppEmail
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEmail'
        mmHeight = 2879
        mmLeft = 195527
        mmTop = 1058
        mmWidth = 44450
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'EMAIL'
        DataPipeline = ppEmail
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEmail'
        mmHeight = 2879
        mmLeft = 152400
        mmTop = 1058
        mmWidth = 41804
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'DATADESLIGAMENTO'
        DataPipeline = ppEmail
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEmail'
        mmHeight = 2879
        mmLeft = 266965
        mmTop = 1058
        mmWidth = 16140
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        AutoSize = True
        DataField = 'DATAADMISSAO'
        DataPipeline = ppEmail
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEmail'
        mmHeight = 2879
        mmLeft = 251090
        mmTop = 1058
        mmWidth = 13229
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'TIPOSIT'
        DataPipeline = ppEmail
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppEmail'
        mmHeight = 2879
        mmLeft = 245269
        mmTop = 1058
        mmWidth = 3704
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object lblModulo: TppLabel
        UserName = 'lblContrato1'
        Caption = 'Folha de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 2117
        mmTop = 794
        mmWidth = 26331
        BandType = 8
      end
      object lblNumPag: TppSystemVariable
        UserName = 'lblNumPag'
        AutoSize = False
        VarType = vtPageSet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 267494
        mmTop = 794
        mmWidth = 15875
        BandType = 8
      end
      object ProvisaoFeriasrpLabel1: TppLabel
        UserName = 'ProvisaoFeriasrpLabel1'
        AutoSize = False
        Caption = 'Página:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 246857
        mmTop = 794
        mmWidth = 19844
        BandType = 8
      end
    end
  end
  object ppEmail: TppBDEPipeline
    DataSource = dsEmail
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Email'
    Left = 234
    Top = 56
    object ppEmailppField1: TppField
      FieldAlias = 'NOME'
      FieldName = 'NOME'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppEmailppField2: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppEmailppField3: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppEmailppField4: TppField
      FieldAlias = 'CARGO'
      FieldName = 'CARGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppEmailppField5: TppField
      FieldAlias = 'UNIDADE'
      FieldName = 'UNIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppEmailppField6: TppField
      FieldAlias = 'CODEXTERNO'
      FieldName = 'CODEXTERNO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppEmailppField7: TppField
      FieldAlias = 'CPF'
      FieldName = 'CPF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppEmailppField8: TppField
      FieldAlias = 'EMAIL'
      FieldName = 'EMAIL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppEmailppField9: TppField
      FieldAlias = 'DATAADMISSAO'
      FieldName = 'DATAADMISSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppEmailppField10: TppField
      FieldAlias = 'DATADESLIGAMENTO'
      FieldName = 'DATADESLIGAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppEmailppField11: TppField
      FieldAlias = 'EMAILFUNCEF'
      FieldName = 'EMAILFUNCEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppEmailppField12: TppField
      FieldAlias = 'DIRETORIA'
      FieldName = 'DIRETORIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppEmailppField13: TppField
      FieldAlias = 'TIPOSIT'
      FieldName = 'TIPOSIT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
  end
  object cdsEmail: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsEmailAfterOpen
    AfterScroll = cdsEmailAfterScroll
    Left = 243
    Top = 168
    object cdsEmailNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsEmailMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object cdsEmailIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsEmailCARGO: TStringField
      FieldName = 'CARGO'
      Size = 40
    end
    object cdsEmailUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 30
    end
    object cdsEmailCODEXTERNO: TStringField
      FieldName = 'CODEXTERNO'
      FixedChar = True
      Size = 10
    end
    object cdsEmailCPF: TStringField
      FieldName = 'CPF'
      FixedChar = True
      Size = 18
    end
    object cdsEmailEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsEmailDATAADMISSAO: TDateTimeField
      FieldName = 'DATAADMISSAO'
    end
    object cdsEmailDATADESLIGAMENTO: TDateTimeField
      FieldName = 'DATADESLIGAMENTO'
    end
    object cdsEmailEMAILFUNCEF: TStringField
      FieldName = 'EMAILFUNCEF'
      Size = 100
    end
    object cdsEmailDIRETORIA: TStringField
      FieldName = 'DIRETORIA'
      Size = 30
    end
    object cdsEmailTIPOSIT: TStringField
      FieldName = 'TIPOSIT'
      FixedChar = True
      Size = 1
    end
  end
  object dsEmail: TwwDataSource
    DataSet = cdsEmail
    Left = 235
    Top = 112
  end
  object sqlEmail: TCMSqlParams
    SQL.Strings = (
      
        'select DISTINCT p.nome, f.matricula, p.idpessoa,   c.titulo as C' +
        'argo,'
      
        '    ct.nome as Unidade, ct.codexterno, p.numdocumento AS cpf,  p' +
        '.email  ,'
      
        '    f.DATAADMISSAO,f.Datadesligamento,PF.EMAILFUNCEF,    s.tipos' +
        'it,'
      '     ( SELECT DISTINCT CD.NOME'
      
        '        FROM CENTCUST C JOIN CENTCUST CD ON REGEXP_REPLACE (CD.C' +
        'ODEXTERNO, '#39'\D'#39' ) = SUBSTR(REGEXP_REPLACE (C.CODEXTERNO, '#39'\D'#39' ),' +
        ' 0, 2) '
      '        AND CD.IDEMPRESA = C.IDEMPRESA'
      '        AND CD.IDPLANCENTCUST = C.IDPLANCENTCUST'
      '        AND C.CODCENTROCUSTO=F.CODCENTROCUSTO) AS DIRETORIA '
      
        '    from  funcionario f, pessoa p, cargo c, sitfunc s, centcust ' +
        'ct,'
      '          PESSOAFISICA PF'
      '     where p.idpessoa = f.idpessoa'
      '           and f.idsitfunc = s.idsitfunc'
      '           and ct.codcentrocusto = f.codcentrocusto'
      
        '           and decode(f.idfuncao, null, f.idcargo, f.idfuncao) =' +
        ' c.idcargo(+)               '
      '           and P.IDPESSOA = PF.IDPESSOA(+)'
      '   and s.tiposit in ('#39'A'#39','#39'F'#39','#39'D'#39')'
      '  order by P.nome')
    ClientDataSet = cdsEmail
    Left = 245
    Top = 214
  end
  object ppFundacao: TppBDEPipeline
    DataSource = dsFundacao
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'Fundacao'
    Left = 30
    Top = 71
    object ppFundacaoppField2: TppField
      FieldAlias = 'RAZAOSOCIAL'
      FieldName = 'RAZAOSOCIAL'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppFundacaoppField3: TppField
      FieldAlias = 'BLOCO1'
      FieldName = 'BLOCO1'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object ppFundacaoppField4: TppField
      FieldAlias = 'BLOCO2'
      FieldName = 'BLOCO2'
      FieldLength = 8
      DisplayWidth = 60
      Position = 2
    end
    object ppFundacaoppField10: TppField
      FieldAlias = 'IMAGEM'
      FieldName = 'IMAGEM'
      FieldLength = 1
      DataType = dtBLOB
      DisplayWidth = 10
      Position = 3
      Searchable = False
      Sortable = False
    end
  end
  object dsFundacao: TwwDataSource
    DataSet = qryFundacao
    Left = 30
    Top = 119
  end
  object qryFundacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '       P.RAZAOSOCIAL,'
      '       I.IMAGEM,'
      '       E.NOME AS BLOCO1,'
      
        '       C.NOME || '#39' '#39' || C.CODESTADO || '#39' CEP '#39' || E.CEP || '#39' - (' +
        #39' ||'
      
        '       TRIM(T.DDD) || '#39')'#39' || T.NUMERO || '#39' - '#39' || P.HOMEPAGE AS ' +
        'BLOCO2'
      '  FROM PESSOA     P,'
      '       ENDPESS    E,'
      '       IMAGENS    I,'
      '       CIDADES    C,'
      '       TELENDPESS T'
      ' WHERE (P.IDPESSOA = 1)'
      '   AND (E.IDPESSOA(+) = P.IDPESSOA)'
      '   AND (E.IDCIDADES = C.IDCIDADES(+))'
      '   AND (I.IDIMAGEM(+) = P.IDIMAGEM)'
      '   AND (E.IDENDERECO = T.IDENDERECO(+))'
      '   AND (T.TIPO = '#39'C'#39')')
    ValidateWithMask = True
    Left = 32
    Top = 167
    object qryFundacaoBLOCO1: TStringField
      FieldName = 'BLOCO1'
      Size = 40
    end
    object qryFundacaoBLOCO2: TMemoField
      FieldName = 'BLOCO2'
      BlobType = ftMemo
      Size = 350
    end
    object qryFundacaoIMAGEM: TBlobField
      FieldName = 'IMAGEM'
      BlobType = ftBlob
      Size = 1
    end
    object qryFundacaoRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
  end
end
