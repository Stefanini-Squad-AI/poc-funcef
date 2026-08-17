inherited RptAvisoFerias: TRptAvisoFerias
  Left = 228
  Top = 181
  Width = 294
  Height = 273
  Caption = 'RptAvisoFerias'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Params = <
      item
        Caption = 'ListaIdEstab'
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
        Name = 'ListaIdEstab'
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
        Caption = 'InicioFerias'
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
        Name = 'InicioFerias'
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
        Caption = 'FinalFerias'
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
        Name = 'FinalFerias'
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
        Caption = 'TipoContrato'
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
        Name = 'TipoContrato'
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
        Caption = 'Ordenacao'
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
      end>
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = rpAvisoFerias
    ConnectionType = cntBDE
  end
  object rpAvisoFerias: TppReport
    AutoStop = False
    DataPipeline = ppAvisoFerias
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Aviso de Férias'
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
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 220
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppAvisoFerias'
    object ppDetailBand24: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 211403
      mmPrintPosition = 0
      object AvisoFeriasLbl9: TppLabel
        UserName = 'AvisoFeriasLbl9'
        Caption = 'Parcelamento da devolução do adiantamento de férias em: 00 vezes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 58208
        mmTop = 126207
        mmWidth = 81756
        BandType = 4
      end
      object AvisoFeriasShp3: TppShape
        UserName = 'AvisoFeriasShp3'
        mmHeight = 28046
        mmLeft = 2910
        mmTop = 144992
        mmWidth = 192088
        BandType = 4
      end
      object AvisoFeriasShp1: TppShape
        UserName = 'AvisoFeriasShp1'
        mmHeight = 25665
        mmLeft = 2646
        mmTop = 2646
        mmWidth = 192088
        BandType = 4
      end
      object AvisoFeriasDbTxt2: TppDBText
        UserName = 'AvisoFeriasDbTxt2'
        DataField = 'CGC'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 10319
        mmWidth = 93398
        BandType = 4
      end
      object AvisoFeriasDbTxt1: TppDBText
        UserName = 'AvisoFeriasDbTxt1'
        DataField = 'EMPRESA'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 5027
        mmWidth = 187325
        BandType = 4
      end
      object AvisoFeriasDbTxt3: TppDBText
        UserName = 'AvisoFeriasDbTxt3'
        DataField = 'INSCRICAO'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3175
        mmLeft = 98954
        mmTop = 10319
        mmWidth = 93398
        BandType = 4
      end
      object AvisoFeriasDbTxt4: TppDBText
        UserName = 'AvisoFeriasDbTxt4'
        DataField = 'ENDERECO'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3175
        mmLeft = 5027
        mmTop = 17463
        mmWidth = 187325
        BandType = 4
      end
      object AvisoFeriasLbl1: TppLabel
        UserName = 'AvisoFeriasLbl1'
        AutoSize = False
        Caption = 'Emissão:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 151607
        mmTop = 23813
        mmWidth = 12171
        BandType = 4
      end
      object AvisoFeriasLbl2: TppLabel
        UserName = 'AvisoFeriasLbl2'
        Caption = 'AVISO DE FÉRIAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 75671
        mmTop = 34131
        mmWidth = 36777
        BandType = 4
      end
      object AvisoFeriasShp2: TppShape
        UserName = 'AvisoFeriasShp2'
        mmHeight = 11377
        mmLeft = 2646
        mmTop = 53975
        mmWidth = 192000
        BandType = 4
      end
      object AvisoFeriasMem1: TppMemo
        UserName = 'AvisoFeriasMem1'
        Caption = '7'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          '                                                       '
          
            ' A empresa comunica de acordo com os Artigos 129 e 130, a conces' +
            'sao das férias ao funcionário discriminado abaixo:')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 12965
        mmLeft = 2646
        mmTop = 41275
        mmWidth = 192000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasMem2: TppMemo
        UserName = 'AvisoFeriasMem2'
        Caption = 'Memo3'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Lines.Strings = (
          ''
          
            'Fica estabelecido que as férias serão concedidas de acordo com a' +
            ' tabela abaixo, em comparação ao período a que se refere')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 7673
        mmLeft = 2646
        mmTop = 66940
        mmWidth = 192000
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasMem5: TppMemo
        UserName = 'AvisoFeriasMem5'
        Caption = 'Memo4'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          'DIAS DE DURACAO'
          '            30 (trinta)'
          '            24 (vinte e quatro)'
          '            18 (dezoito)'
          '            12 (doze)'
          '            00 (zero)')
        Transparent = True
        mmHeight = 26194
        mmLeft = 115359
        mmTop = 77258
        mmWidth = 37042
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasLbl3: TppLabel
        UserName = 'AvisoFeriasLbl3'
        Caption = 'Cód:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 55298
        mmWidth = 5821
        BandType = 4
      end
      object AvisoFeriasDbTxt5: TppDBText
        UserName = 'AvisoFeriasDbTxt5'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3440
        mmLeft = 11642
        mmTop = 55298
        mmWidth = 16669
        BandType = 4
      end
      object AvisoFeriasLbl6: TppLabel
        UserName = 'AvisoFeriasLbl6'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 92604
        mmTop = 55298
        mmWidth = 7938
        BandType = 4
      end
      object AvisoFeriasDbTxt9: TppDBText
        OnPrint = AvisoFeriasDbTxt9Print
        UserName = 'AvisoFeriasDbTxt9'
        AutoSize = True
        DataField = 'EMPREGADO'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 55298
        mmWidth = 18521
        BandType = 4
      end
      object AvisoFeriasLbl4: TppLabel
        UserName = 'AvisoFeriasLbl4'
        Caption = 'Cargo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 4763
        mmTop = 60061
        mmWidth = 8467
        BandType = 4
      end
      object AvisoFeriasDbTxt6: TppDBText
        UserName = 'AvisoFeriasDbTxt6'
        AutoSize = True
        DataField = 'CARGO'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3440
        mmLeft = 14288
        mmTop = 60061
        mmWidth = 10319
        BandType = 4
      end
      object AvisoFeriasLbl7: TppLabel
        UserName = 'AvisoFeriasLbl7'
        Caption = 'Centro de Custo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 79111
        mmTop = 60061
        mmWidth = 21431
        BandType = 4
      end
      object AvisoFeriasDbTxt10: TppDBText
        UserName = 'AvisoFeriasDbTxt10'
        AutoSize = True
        DataField = 'C_CUSTO'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3440
        mmLeft = 101600
        mmTop = 60061
        mmWidth = 13494
        BandType = 4
      end
      object AvisoFeriasLbl5: TppLabel
        UserName = 'AvisoFeriasLbl5'
        Caption = 'CTPS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 38100
        mmTop = 55298
        mmWidth = 7673
        BandType = 4
      end
      object AvisoFeriasDbTxt7: TppDBText
        UserName = 'AvisoFeriasDbTxt7'
        DataField = 'CTPS_NUM'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3704
        mmLeft = 46831
        mmTop = 55298
        mmWidth = 28310
        BandType = 4
      end
      object AvisoFeriasDbTxt8: TppDBText
        UserName = 'AvisoFeriasDbTxt8'
        AutoSize = True
        DataField = 'CTPS_UF'
        DataPipeline = ppAvisoFerias
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppAvisoFerias'
        mmHeight = 3440
        mmLeft = 75936
        mmTop = 55298
        mmWidth = 12965
        BandType = 4
      end
      object AvisoFeriasMem3: TppMemo
        UserName = 'AvisoFeriasMem3'
        Caption = 'AvisoFeriasMem3'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          'DIAS DE FALTAS INJUSTIFICADAS'
          '    00 (zero)'
          '    06 (seis)'
          '    15 (quinze)'
          '    24 (vinte e quatro)'
          '    mais de 32 (trinta e dois)')
        Transparent = True
        mmHeight = 26194
        mmLeft = 49742
        mmTop = 77258
        mmWidth = 46567
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasMem4: TppMemo
        UserName = 'AvisoFeriasMem4'
        Caption = 'AvisoFeriasMem4'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Lines.Strings = (
          'a  05 (cinco)'
          'a  14 (quatorze)'
          'a  23 (vinte e tres)'
          'a  32 (trinta e dois)')
        Transparent = True
        mmHeight = 15346
        mmLeft = 78581
        mmTop = 80698
        mmWidth = 24871
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasMem7: TppMemo
        UserName = 'AvisoFeriasMem7'
        Caption = 'Memo7'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = [fsBold]
        Lines.Strings = (
          '(até 15 (quinze) dias antes do início das férias)'
          
            'O empregado acima solicita a concessão do abono pecuniário 1/3 (' +
            'um terço) do valor das férias')
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6615
        mmLeft = 43127
        mmTop = 136261
        mmWidth = 116946
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasMem9: TppMemo
        UserName = 'AvisoFeriasMem9'
        Caption = 'Memo10'
        CharWrap = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Lines.Strings = (
          ''
          
            '    Pelo presente instrumento, estou informado sobre minhas féri' +
            'as:'
          ''
          ''
          '    Data ____ /____ /________'
          ''
          ''
          
            '    _________________________________________                   ' +
            '              __________________________________________________' +
            '__________'
          
            '                      Assinatura do Empregado                   ' +
            '                                                               C' +
            'arimbo e Assinatura do Empregador'
          ''
          ''
          ''
          '')
        Transparent = True
        mmHeight = 34660
        mmLeft = 2646
        mmTop = 175948
        mmWidth = 192088
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
      object AvisoFeriasLbl10: TppLabel
        UserName = 'AvisoFeriasLbl10'
        Caption = 'SOLICITAÇÃO DE ALTERAÇÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 77788
        mmTop = 146050
        mmWidth = 42598
        BandType = 4
      end
      object rpAvisoFeriasShape2: TppShape
        UserName = 'rpAvisoFeriasShape2'
        mmHeight = 5027
        mmLeft = 45773
        mmTop = 153988
        mmWidth = 5027
        BandType = 4
      end
      object rpAvisoFeriasShape3: TppShape
        UserName = 'rpAvisoFeriasShape3'
        mmHeight = 5027
        mmLeft = 63500
        mmTop = 153988
        mmWidth = 5027
        BandType = 4
      end
      object rpAvisoFeriasShape4: TppShape
        UserName = 'rpAvisoFeriasShape4'
        mmHeight = 5027
        mmLeft = 70644
        mmTop = 160073
        mmWidth = 5027
        BandType = 4
      end
      object rpAvisoFeriasShape5: TppShape
        UserName = 'rpAvisoFeriasShape5'
        mmHeight = 5027
        mmLeft = 88371
        mmTop = 160073
        mmWidth = 5027
        BandType = 4
      end
      object AvisoFeriasLbl8: TppLabel
        UserName = 'AvisoFeriasLbl8'
        Caption = 'SOLICITAÇÃO DE ABONO PECUNIÁRIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 75406
        mmTop = 131763
        mmWidth = 52652
        BandType = 4
      end
      object AvisoFeriasLbl11: TppLabel
        UserName = 'AvisoFeriasLbl11'
        Caption = 'Período aquisitivo de DD/MM/AAAA a DD/MM/AAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 26723
        mmTop = 105304
        mmWidth = 64029
        BandType = 4
      end
      object AvisoFeriasLbl12: TppLabel
        UserName = 'AvisoFeriasLbl12'
        Caption = 'Dias de Duração: 00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 26723
        mmTop = 112184
        mmWidth = 24871
        BandType = 4
      end
      object AvisoFeriasLbl13: TppLabel
        UserName = 'AvisoFeriasLbl13'
        Caption = 'Período de Gozo de DD/MM/AAAA a DD/MM/AAAA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 26723
        mmTop = 119327
        mmWidth = 62971
        BandType = 4
      end
      object AvisoFeriasLbl14: TppLabel
        UserName = 'AvisoFeriasLbl14'
        AutoSize = False
        Caption = 'Alterar a data de início das férias  ____ / ____ / _______'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3704
        mmTop = 148167
        mmWidth = 64029
        BandType = 4
      end
      object AvisoFeriasLbl15: TppLabel
        UserName = 'AvisoFeriasLbl15'
        AutoSize = False
        Caption = 'Antecipação do 13º salário          SIM                NÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3704
        mmTop = 155046
        mmWidth = 60061
        BandType = 4
      end
      object AvisoFeriasLbl16: TppLabel
        UserName = 'AvisoFeriasLbl16'
        AutoSize = False
        Caption = 
          'Abono pecuniário (um terço) do período de férias          SIM   ' +
          '             NÃO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3704
        mmTop = 161132
        mmWidth = 84931
        BandType = 4
      end
      object AvisoFeriasLbl17: TppLabel
        UserName = 'AvisoFeriasLbl17'
        AutoSize = False
        Caption = 
          'Parcelamento da devolução do adiantamento de férias em _________' +
          '____ vezes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 7
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 3704
        mmTop = 167746
        mmWidth = 91017
        BandType = 4
      end
      object rpAvisoFeriasSysVar1: TppSystemVariable
        UserName = 'rpAvisoFeriasSysVar1'
        AutoSize = False
        VarType = vtDateTime
        DisplayFormat = 'DD/MM/YYYY HH:MM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 165100
        mmTop = 23813
        mmWidth = 24077
        BandType = 4
      end
    end
    object rpAvisoFeriasFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 6615
      mmPrintPosition = 0
    end
    object rpAvisoFeriasSmryBnd: TppSummaryBand
      AfterPrint = rpAvisoFeriasSmryBndAfterPrint
      Visible = False
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
    end
  end
  object ppAvisoFerias: TppBDEPipeline
    DataSource = dsAvisoFerias
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'AvisoFerias'
    Left = 220
    Top = 48
  end
  object dsAvisoFerias: TDataSource
    DataSet = CdsAvisoFerias
    Left = 220
    Top = 96
  end
  object sqlAvisoFerias: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPRESA,'
      '  '#39'1234567890123456789012345'#39' AS CGC,'
      '  '#39'1234567890123456789012345'#39' AS INSCRICAO,'
      
        '  '#39'1234567890123456789012345678901234567890123456789012345678901' +
        '2345678901234567890'#39' AS ENDERECO,'
      
        '  '#39'123456789012345678901234567890123456789012345678901234567890'#39 +
        ' AS EMPREGADO,'
      '  '#39'1234'#39' AS UF,'
      '  '#39'1234567890123'#39' AS MATRICULA,'
      '  '#39'123456789012345678901234567890'#39' AS C_CUSTO,'
      '  '#39'12345678901234567890123456789012345'#39' AS ANTECIPACAO13,'
      '  '#39'12345678901234567890123456789012345678901234567890'#39' AS CARGO,'
      '  '#39'12345678901234567890'#39' AS CTPS_NUM,'
      '  '#39'1234'#39' AS CTPS_UF,'
      '  '#39'1234567890'#39' AS INIPERIODOFERIAS,'
      '  '#39'1234567890'#39' AS FIMPERIODOFERIAS,'
      '  '#39'1234567890'#39' AS INIGOZOFERIAS,'
      '  '#39'1234567890'#39' AS FIMGOZOFERIAS,'
      '  '#39'1234567890'#39' AS DIASDEFERIAS,'
      '  0 AS FLGABONO,'
      '  0 AS QTDPARCDEVOL'
      'FROM'
      '  DUAL'
      'WHERE'
      '  (1 = 2)')
    ClientDataSet = CdsAvisoFerias
    Left = 220
    Top = 190
  end
  object CdsAvisoFerias: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsAvisoFeriasAfterOpen
    AfterScroll = CdsAvisoFeriasAfterScroll
    Left = 220
    Top = 144
  end
end
