inherited RelConsTransPlanosDireitosRV: TRelConsTransPlanosDireitosRV
  Left = 552
  Top = 183
  Width = 485
  Height = 422
  Caption = 'RelConsTransPlanosDireitosRV'
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
        Caption = 'Data'
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
        Name = 'Data'
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
        Caption = 'Plano de Origem '
        Controle = tcEdit
        CampoBanco = 'IDPLANPREVCTBPATR'
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
        Name = 'PlanoOrigem'
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
        Caption = 'Carteira'
        Controle = tcEdit
        CampoBanco = 'IDCARTEIRAINVEST'
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
        Name = 'Carteira'
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
        Caption = 'Tipo Operação'
        Controle = tcEdit
        CampoBanco = 'IDTIPOOPERACAO'
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
        Name = 'TipoOperacao'
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
  inherited CrmRptCM: TCmRptManager
    DataBaseName = 'BaseDados'
    ConnectionType = cntBDE
  end
  object CdsConsTransPlanosDireitosMT: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 8
    Data = {
      A10200009619E0BD010000001800000018000000000003000000A1021149444F
      5045524143414F4449524549544F08000400000000001044455343494E564553
      54494D454E544F0100490000000100055749445448020002003C001A5155414E
      544944414445414E544552494F5244414F524947454D08000400000000001556
      414C4F52414E544552494F5244414F524947454D08000400000000000E444154
      4144414F5045524143414F080008000000000006424F4C455441010049000000
      0100055749445448020002001E00084944424F4C455441010049000000010005
      5749445448020002001E000A444154415452414E534608000800000000000951
      54445452414E5346080004000000000009564C525452414E5346080004000000
      00000C515444415455414C4F52494708000400000000000C564C52415455414C
      4F52494708000400000000000751544444455354080004000000000007564C52
      4445535408000400000000000B4441544144455354494E4F0800080000000000
      1156414C4F52415455414C44455354494E4F08000400000000000C424F4C4554
      415452414E53460100490000000100055749445448020002001E001144455343
      43415254494E564553544752440100490000000100055749445448020002003C
      00134445534343415254494E564553544752445F310100490000000100055749
      445448020002003C0013444553435449504F4F5045524143414F475244010049
      0000000100055749445448020002003C000E504C414E4F4F524947454D475244
      010049000000010005574944544802000200710002505508000400000000000A
      50455243454E5455414C08000400000000000F504C414E4F44455354494E4F47
      524401004900000001000557494454480200020071000100044C434944040001
      0009080000}
    object CdsConsTransPlanosDireitosMTIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object CdsConsTransPlanosDireitosMTDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object CdsConsTransPlanosDireitosMTQUANTIDADEANTERIORDAORIGEM: TFloatField
      FieldName = 'QUANTIDADEANTERIORDAORIGEM'
    end
    object CdsConsTransPlanosDireitosMTVALORANTERIORDAORIGEM: TFloatField
      FieldName = 'VALORANTERIORDAORIGEM'
    end
    object CdsConsTransPlanosDireitosMTDATADAOPERACAO: TDateTimeField
      FieldName = 'DATADAOPERACAO'
    end
    object CdsConsTransPlanosDireitosMTBOLETA: TStringField
      FieldName = 'BOLETA'
      Size = 30
    end
    object CdsConsTransPlanosDireitosMTIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object CdsConsTransPlanosDireitosMTDATATRANSF: TDateTimeField
      FieldName = 'DATATRANSF'
    end
    object CdsConsTransPlanosDireitosMTQTDTRANSF: TFloatField
      FieldName = 'QTDTRANSF'
    end
    object CdsConsTransPlanosDireitosMTVLRTRANSF: TFloatField
      FieldName = 'VLRTRANSF'
    end
    object CdsConsTransPlanosDireitosMTQTDATUALORIG: TFloatField
      FieldName = 'QTDATUALORIG'
    end
    object CdsConsTransPlanosDireitosMTVLRATUALORIG: TFloatField
      FieldName = 'VLRATUALORIG'
    end
    object CdsConsTransPlanosDireitosMTQTDDEST: TFloatField
      FieldName = 'QTDDEST'
    end
    object CdsConsTransPlanosDireitosMTVLRDEST: TFloatField
      FieldName = 'VLRDEST'
    end
    object CdsConsTransPlanosDireitosMTDATADESTINO: TDateTimeField
      FieldName = 'DATADESTINO'
    end
    object CdsConsTransPlanosDireitosMTVALORATUALDESTINO: TFloatField
      FieldName = 'VALORATUALDESTINO'
    end
    object CdsConsTransPlanosDireitosMTBOLETATRANSF: TStringField
      FieldName = 'BOLETATRANSF'
      Size = 30
    end
    object CdsConsTransPlanosDireitosMTDESCCARTINVESTGRD: TStringField
      FieldName = 'DESCCARTINVESTGRD'
      Size = 60
    end
    object CdsConsTransPlanosDireitosMTDESCCARTINVESTGRD_1: TStringField
      FieldName = 'DESCCARTINVESTGRD_1'
      Size = 60
    end
    object CdsConsTransPlanosDireitosMTDESCTIPOOPERACAOGRD: TStringField
      FieldName = 'DESCTIPOOPERACAOGRD'
      Size = 60
    end
    object CdsConsTransPlanosDireitosMTPLANOORIGEMGRD: TStringField
      FieldName = 'PLANOORIGEMGRD'
      Size = 113
    end
    object CdsConsTransPlanosDireitosMTPU: TFloatField
      FieldName = 'PU'
    end
    object CdsConsTransPlanosDireitosMTPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object CdsConsTransPlanosDireitosMTPLANODESTINOGRD: TStringField
      FieldName = 'PLANODESTINOGRD'
      Size = 113
    end
  end
  object dsConsTransPlanosDireitosMT: TDataSource
    DataSet = CdsConsTransPlanosDireitosMT
    Left = 272
    Top = 88
  end
  object pplConsTransPlanosDireitosMT: TppBDEPipeline
    DataSource = dsConsTransPlanosDireitosMT
    UserName = 'lConsTransPlanosDireitosMT'
    Left = 77
    Top = 184
    object pplConsTransPlanosDireitosMTppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDOPERACAODIREITO'
      FieldName = 'IDOPERACAODIREITO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 0
    end
    object pplConsTransPlanosDireitosMTppField2: TppField
      FieldAlias = 'DESCINVESTIMENTO'
      FieldName = 'DESCINVESTIMENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 1
    end
    object pplConsTransPlanosDireitosMTppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'QUANTIDADEANTERIORDAORIGEM'
      FieldName = 'QUANTIDADEANTERIORDAORIGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 2
    end
    object pplConsTransPlanosDireitosMTppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORANTERIORDAORIGEM'
      FieldName = 'VALORANTERIORDAORIGEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 3
    end
    object pplConsTransPlanosDireitosMTppField5: TppField
      FieldAlias = 'DATADAOPERACAO'
      FieldName = 'DATADAOPERACAO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 4
    end
    object pplConsTransPlanosDireitosMTppField6: TppField
      FieldAlias = 'BOLETA'
      FieldName = 'BOLETA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 5
    end
    object pplConsTransPlanosDireitosMTppField7: TppField
      FieldAlias = 'IDBOLETA'
      FieldName = 'IDBOLETA'
      FieldLength = 30
      DisplayWidth = 30
      Position = 6
    end
    object pplConsTransPlanosDireitosMTppField8: TppField
      FieldAlias = 'DATATRANSF'
      FieldName = 'DATATRANSF'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 7
    end
    object pplConsTransPlanosDireitosMTppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDTRANSF'
      FieldName = 'QTDTRANSF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplConsTransPlanosDireitosMTppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRTRANSF'
      FieldName = 'VLRTRANSF'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object pplConsTransPlanosDireitosMTppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDATUALORIG'
      FieldName = 'QTDATUALORIG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object pplConsTransPlanosDireitosMTppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRATUALORIG'
      FieldName = 'VLRATUALORIG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplConsTransPlanosDireitosMTppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDDEST'
      FieldName = 'QTDDEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplConsTransPlanosDireitosMTppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'VLRDEST'
      FieldName = 'VLRDEST'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplConsTransPlanosDireitosMTppField15: TppField
      FieldAlias = 'DATADESTINO'
      FieldName = 'DATADESTINO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 14
    end
    object pplConsTransPlanosDireitosMTppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORATUALDESTINO'
      FieldName = 'VALORATUALDESTINO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplConsTransPlanosDireitosMTppField17: TppField
      FieldAlias = 'BOLETATRANSF'
      FieldName = 'BOLETATRANSF'
      FieldLength = 30
      DisplayWidth = 30
      Position = 16
    end
    object pplConsTransPlanosDireitosMTppField18: TppField
      FieldAlias = 'DESCCARTINVESTGRD'
      FieldName = 'DESCCARTINVESTGRD'
      FieldLength = 60
      DisplayWidth = 60
      Position = 17
    end
    object pplConsTransPlanosDireitosMTppField19: TppField
      FieldAlias = 'DESCCARTINVESTGRD_1'
      FieldName = 'DESCCARTINVESTGRD_1'
      FieldLength = 60
      DisplayWidth = 60
      Position = 18
    end
    object pplConsTransPlanosDireitosMTppField20: TppField
      FieldAlias = 'DESCTIPOOPERACAOGRD'
      FieldName = 'DESCTIPOOPERACAOGRD'
      FieldLength = 60
      DisplayWidth = 60
      Position = 19
    end
    object pplConsTransPlanosDireitosMTppField21: TppField
      FieldAlias = 'PLANOORIGEMGRD'
      FieldName = 'PLANOORIGEMGRD'
      FieldLength = 113
      DisplayWidth = 113
      Position = 20
    end
    object pplConsTransPlanosDireitosMTppField22: TppField
      Alignment = taRightJustify
      FieldAlias = 'PU'
      FieldName = 'PU'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 21
    end
    object pplConsTransPlanosDireitosMTppField23: TppField
      Alignment = taRightJustify
      FieldAlias = 'PERCENTUAL'
      FieldName = 'PERCENTUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 22
    end
    object pplConsTransPlanosDireitosMTppField24: TppField
      FieldAlias = 'PLANODESTINOGRD'
      FieldName = 'PLANODESTINOGRD'
      FieldLength = 113
      DisplayWidth = 113
      Position = 23
    end
  end
  object rptConsTransPlanosDireitosMT: TppReport
    AutoStop = False
    DataPipeline = pplConsTransPlanosDireitosMT
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Histórico de Operações de Transferência entre Planos de Direitos'
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
    BeforePrint = rptConsTransPlanosDireitosMTBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 242
    Top = 184
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'pplConsTransPlanosDireitosMT'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object ppShape1: TppShape
        UserName = 'shpCabecalho1'
        Brush.Color = clSilver
        ParentWidth = True
        mmHeight = 9790
        mmLeft = 0
        mmTop = 19315
        mmWidth = 284300
        BandType = 0
      end
      object lblTituloRelatorio: TppLabel
        UserName = 'lblTituloRelatorio'
        Caption = 'Histórico de Operações de Transferência entre Planos de Direitos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 24871
        mmTop = 8202
        mmWidth = 105569
        BandType = 0
      end
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'FUNDAÇÃO DOS ECONOMIÁRIOS  FEDERAIS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4995
        mmLeft = 24871
        mmTop = 1058
        mmWidth = 92668
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
      object lblPeriodos: TppLabel
        UserName = 'lblPeriodos'
        Caption = 'Periodo:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 24871
        mmTop = 14023
        mmWidth = 12171
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
        mmLeft = 166952
        mmTop = 20108
        mmWidth = 27781
        BandType = 0
      end
      object pplCarteira: TppLabel
        UserName = 'Label5'
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 16140
        mmTop = 19844
        mmWidth = 9260
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
        Transparent = True
        mmHeight = 2910
        mmLeft = 1323
        mmTop = 19844
        mmWidth = 5556
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
        mmLeft = 231511
        mmTop = 19844
        mmWidth = 28310
        BandType = 0
      end
      object pplSldAtuDest: TppLabel
        UserName = 'Label7'
        Caption = 'Valor Transferido'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2921
        mmLeft = 263134
        mmTop = 25665
        mmWidth = 20235
        BandType = 0
      end
      object pplPercentual: TppLabel
        UserName = 'Label8'
        Caption = 'Percentual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 206375
        mmTop = 25665
        mmWidth = 12435
        BandType = 0
      end
      object lblinicio: TppLabel
        UserName = 'Label12'
        Caption = '31/12/9999'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 38365
        mmTop = 14023
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label13'
        Caption = 'à'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 55563
        mmTop = 14023
        mmWidth = 1852
        BandType = 0
      end
      object lblfim: TppLabel
        UserName = 'Label14'
        Caption = '31/12/9999'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 58208
        mmTop = 14023
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label3'
        Caption = 'Operação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 64823
        mmTop = 19844
        mmWidth = 11377
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label6'
        Caption = 'Ação'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 2910
        mmLeft = 120121
        mmTop = 25665
        mmWidth = 5556
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label9'
        Caption = 'Valor Origem'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 186267
        mmTop = 25400
        mmWidth = 15875
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object shpDetalhe: TppShape
        UserName = 'shpDetalhe'
        ParentWidth = True
        Pen.Style = psClear
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 284300
        BandType = 4
      end
      object ppdbSldAtuDest: TppDBText
        UserName = 'dbSldAtuDest'
        DataField = 'VLRTRANSF'
        DataPipeline = pplConsTransPlanosDireitosMT
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosDireitosMT'
        mmHeight = 2910
        mmLeft = 261144
        mmTop = 265
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'dbBoleta1'
        DataField = 'PERCENTUAL'
        DataPipeline = pplConsTransPlanosDireitosMT
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosDireitosMT'
        mmHeight = 2910
        mmLeft = 206375
        mmTop = 794
        mmWidth = 9790
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
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 2910
        mmLeft = 216959
        mmTop = 794
        mmWidth = 2117
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'dbSldAtuDest1'
        DataField = 'VALORANTERIORDAORIGEM'
        DataPipeline = pplConsTransPlanosDireitosMT
        DisplayFormat = '###,###,##0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosDireitosMT'
        mmHeight = 2910
        mmLeft = 180182
        mmTop = 794
        mmWidth = 22490
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'DESCINVESTIMENTO'
        DataPipeline = pplConsTransPlanosDireitosMT
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosDireitosMT'
        mmHeight = 2910
        mmLeft = 119327
        mmTop = 794
        mmWidth = 42598
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11642
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
        mmTop = 7673
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
        mmHeight = 3440
        mmLeft = 257176
        mmTop = 7408
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
        mmLeft = 529
        mmTop = 7673
        mmWidth = 283369
        BandType = 8
      end
      object ppLabel6: TppLabel
        UserName = 'Label11'
        Caption = 'TOTAL:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3810
        mmLeft = 237681
        mmTop = 1852
        mmWidth = 11557
        BandType = 8
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'VLRTRANSF'
        DataPipeline = pplConsTransPlanosDireitosMT
        DisplayFormat = '###,###,###,###.##0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplConsTransPlanosDireitosMT'
        mmHeight = 3969
        mmLeft = 250825
        mmTop = 1852
        mmWidth = 33073
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'GRUPO'
      DataPipeline = pplConsTransPlanosDireitosMT
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'pplConsTransPlanosDireitosMT'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object ppdbData: TppDBText
          UserName = 'dbData'
          DataField = 'DATATRANSF'
          DataPipeline = pplConsTransPlanosDireitosMT
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplConsTransPlanosDireitosMT'
          mmHeight = 2910
          mmLeft = 1323
          mmTop = 529
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
        end
        object ppdbCarteira: TppDBText
          UserName = 'dbCarteira'
          DataField = 'DESCCARTINVESTGRD'
          DataPipeline = pplConsTransPlanosDireitosMT
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplConsTransPlanosDireitosMT'
          mmHeight = 2910
          mmLeft = 15610
          mmTop = 529
          mmWidth = 46831
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'PLANOORIGEMGRD'
          DataPipeline = pplConsTransPlanosDireitosMT
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplConsTransPlanosDireitosMT'
          mmHeight = 2910
          mmLeft = 166952
          mmTop = 1058
          mmWidth = 51858
          BandType = 3
          GroupNo = 0
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'PLANODESTINOGRD'
          DataPipeline = pplConsTransPlanosDireitosMT
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplConsTransPlanosDireitosMT'
          mmHeight = 3175
          mmLeft = 231246
          mmTop = 794
          mmWidth = 52652
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          Pen.Style = psInsideFrame
          Pen.Width = 0
          ParentWidth = True
          mmHeight = 1588
          mmLeft = 0
          mmTop = 0
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'DESCTIPOOPERACAOGRD'
          DataPipeline = pplConsTransPlanosDireitosMT
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 7
          Font.Style = []
          Transparent = True
          DataPipelineName = 'pplConsTransPlanosDireitosMT'
          mmHeight = 2910
          mmLeft = 64294
          mmTop = 529
          mmWidth = 50536
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object daDataModule1: TdaDataModule
    end
  end
  object sprConsTransPlanosDireitosMT: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT OT.IDOPERACAODIREITO, IV.DESCINVESTIMENTO,'
      '       '
      
        '       O.QTDEOPERACAO AS QUANTIDADEANTERIORDAORIGEM, --VALORES O' +
        'RIGEM'
      '       O.VLROPERACAO  AS VALORANTERIORDAORIGEM,'
      '       O.DATAOPERACAO AS DATADAOPERACAO,'
      '       O.NUMDOCUMENTO AS BOLETA, --VALORES ORIGEM'
      '       '
      '       OT.IDBOLETA, --VALORES DA TRANSFERENCIA'
      '       OT.DATAOPERACAO AS DATATRANSF,'
      '       OT.QTDEOPERACAO AS QTDTRANSF,'
      '       OT.VLROPERACAO AS VLRTRANSF,--VALORES DA TRANSFERENCIA'
      '       '
      
        '       OIATUALORIG.QTDEOPERACAO AS QTDATUALORIG, --VALORES ATUAL' +
        'IZADOS ORIGEM'
      '       OIATUALORIG.VLROPERACAO  VLRATUALORIG,'
      '       '
      '       DESTINO.QTDEOPERACAO AS QTDDEST, --VALORES DO DESTINO'
      '       DESTINO.VLROPERACAO  AS VLRDEST,'
      '       DESTINO.DATAOPERACAO AS DATADESTINO,'
      '       OIATUALDEST.VLROPERACAO as VALORATUALDESTINO,'
      '       DESTINO.NUMDOCUMENTO AS BOLETATRANSF,--VALORES DO DESTINO'
      '       '
      
        '       CI.DESCCARTINVEST      AS DESCCARTINVESTGRD, --DADOS PARA' +
        ' A GRID '
      '       CI.DESCCARTINVEST      AS DESCCARTINVESTGRD,'
      '       TP.DESCTIPOOPERACAO    AS DESCTIPOOPERACAOGRD,'
      '       PLO.PLANPRVCONTABPATRO AS PLANOORIGEMGRD,'
      '       OT.PUORIGEM AS PU,'
      '       OT.PERCENTUAL AS PERCENTUAL,'
      
        '       PLD.PLANPRVCONTABPATRO AS PLANODESTINOGRD --DADOS PARA A ' +
        'GRID '
      ''
      '  FROM OPERDIRTRANSF     OT,'
      '       INVESTIMENTO      IV,'
      '       OPERACAOINVEST    O,'
      '       OPERACAODIREITO   OD,'
      '       CARTEIRAINVEST    CI,'
      '       VWPLANPREVCTBPATR PLO,'
      '       VWPLANPREVCTBPATR PLD,'
      '       TIPOOPERACAO      TP,'
      '       '
      '       (SELECT OT.IDOPERACAODIREITO, -- INCIO QRY DE DESTINO'
      '               D.QTDEOPERACAO,'
      '               D.VLROPERACAO,'
      '               D.DATAOPERACAO,'
      '               D.NUMDOCUMENTO,'
      '               D.IDPLANPREVCTBPATR,'
      '               D.IDMOTIVOBLOQUEIO,'
      '               D.IDCARTEIRAINVEST,'
      '               D.IDINVESTIMENTO,'
      '               D.IDCUSTODIANTE'
      '        '
      '          FROM OPERDIRTRANSF OT, OPERACAOINVEST D'
      '         WHERE OT.IDOPERACAODIREITO = D.IDOPERACAODIREITO'
      '           AND OT.IDPLANPREVCTBPATRDEST = D.IDPLANPREVCTBPATR'
      '           AND OT.IDCARTINVESTORIG = D.IDCARTEIRAINVEST'
      '           AND OT.IDINVESTORIG = D.IDINVESTIMENTO'
      '           AND OT.IDCUSTODIAORIG = D.IDCUSTODIANTE'
      '           AND OT.IDMOTIVOBLOQORIG = D.IDMOTIVOBLOQUEIO'
      
        '           AND D.DATAOPERACAO < OT.DATAOPERACAO) DESTINO, --FIM ' +
        'QRY DE DESTINO'
      '       '
      '       (SELECT  * --INCIO QRY VALORES ATUAIS DA ORIGEM'
      '          FROM OPERACAOINVEST OI'
      '         WHERE OI.IDOPERACAOINVEST IN'
      
        '               (SELECT DISTINCT MAX(OI1.IDOPERACAOINVEST) AS IDO' +
        'PERACAOINVEST'
      '                  FROM OPERACAOINVEST OI1'
      '                 WHERE OI1.IDOPERACAODIREITO IS NOT NULL'
      '                   AND OI1.IDTIPOOPERACAO IN (-70, -10070)'
      '                 GROUP BY OI1.IDOPERACAODIREITO,'
      '                          OI1.IDPLANPREVCTBPATR,'
      
        '                          OI1.IDCARTEIRAINVEST)) OIATUALORIG, --' +
        'FIM QRY VALORES ATUAIS DA ORIGEM'
      '       '
      '       (SELECT  * --INCIO QRY VALORES ATUAIS DA DESTINO'
      '          FROM OPERACAOINVEST OI'
      '         WHERE OI.IDOPERACAOINVEST IN'
      
        '               (SELECT MAX(OI1.IDOPERACAOINVEST) AS IDOPERACAOIN' +
        'VEST'
      '                  FROM OPERACAOINVEST OI1'
      '                 WHERE OI1.IDOPERACAODIREITO IS NOT NULL'
      '                   AND OI1.IDTIPOOPERACAO IN (-70, -10070)'
      '                 GROUP BY OI1.IDOPERACAODIREITO,'
      '                          OI1.IDPLANPREVCTBPATR,'
      
        '                          OI1.IDCARTEIRAINVEST)) OIATUALDEST --F' +
        'IM QRY VALORES ATUAIS DA DESTINO'
      ''
      
        ' WHERE OT.IDOPERACAODIREITO = O.IDOPERACAODIREITO --JOINS OPERAC' +
        'AO DE TRANSFERENCIA COM ORIGEM'
      '   AND OT.IDPLANPREVCTBPATRORIG = O.IDPLANPREVCTBPATR'
      '   AND OT.IDCARTINVESTORIG = O.IDCARTEIRAINVEST'
      '   AND OT.IDINVESTORIG = O.IDINVESTIMENTO'
      '   AND OT.IDCUSTODIAORIG = O.IDCUSTODIANTE'
      '   AND OT.IDMOTIVOBLOQORIG = O.IDMOTIVOBLOQUEIO'
      '   AND O.DATAOPERACAO < OT.DATAOPERACAO'
      '      '
      
        '   AND OT.IDOPERACAODIREITO = DESTINO.IDOPERACAODIREITO --JOINS ' +
        'OPERACAO TRANSFERENCIA COM DESTINO'
      '   AND OT.IDPLANPREVCTBPATRDEST = DESTINO.IDPLANPREVCTBPATR'
      '   AND OT.IDCARTINVESTORIG = DESTINO.IDCARTEIRAINVEST'
      '   AND OT.IDINVESTORIG = DESTINO.IDINVESTIMENTO'
      '   AND OT.IDCUSTODIAORIG = DESTINO.IDCUSTODIANTE'
      '   AND OT.IDMOTIVOBLOQORIG = DESTINO.IDMOTIVOBLOQUEIO'
      '      '
      
        '   AND OIATUALDEST.IDOPERACAODIREITO = O.IDOPERACAODIREITO --JOI' +
        'NS SALDO ATUAL DESTINO'
      '   AND OIATUALDEST.IDPLANPREVCTBPATR = O.IDPLANPREVCTBPATR'
      '   AND OIATUALDEST.IDCARTEIRAINVEST = O.IDCARTEIRAINVEST'
      '   AND OIATUALDEST.IDINVESTIMENTO = O.IDINVESTIMENTO'
      '   AND OIATUALDEST.IDCUSTODIANTE = O.IDCUSTODIANTE'
      '   AND OIATUALDEST.IDMOTIVOBLOQUEIO = O.IDMOTIVOBLOQUEIO'
      '      '
      
        '   AND OIATUALORIG.IDOPERACAODIREITO = DESTINO.IDOPERACAODIREITO' +
        ' --JOINS SALDO ATUAL ORIGEM'
      '   AND OIATUALORIG.IDPLANPREVCTBPATR = DESTINO.IDPLANPREVCTBPATR'
      '   AND OIATUALORIG.IDCARTEIRAINVEST = DESTINO.IDCARTEIRAINVEST'
      '   AND OIATUALORIG.IDINVESTIMENTO = DESTINO.IDINVESTIMENTO'
      '   AND OIATUALORIG.IDCUSTODIANTE = DESTINO.IDCUSTODIANTE'
      '   AND OIATUALORIG.IDMOTIVOBLOQUEIO = DESTINO.IDMOTIVOBLOQUEIO'
      '      '
      
        '   AND OD.IDOPERACAODIREITO = OT.IDOPERACAODIREITO --JOINS DA GR' +
        'ID'
      '   AND PLO.IDPLANPREVCTBPATR = OT.IDPLANPREVCTBPATRORIG'
      '   AND PLD.IDPLANPREVCTBPATR = OT.IDPLANPREVCTBPATRDEST'
      '   AND TP.IDTIPOINVEST = 2'
      '   AND TP.IDTIPOOPERACAO = OD.IDTIPOOPERACAO'
      '   AND CI.IDCARTEIRAINVEST = OT.IDCARTINVESTORIG'
      '   AND IV.IDINVESTIMENTO = OT.IDINVESTORIG'
      '   '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = CdsConsTransPlanosDireitosMT
    Left = 80
    Top = 88
  end
end
