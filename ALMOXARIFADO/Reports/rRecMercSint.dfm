inherited RptRecMercSint: TRptRecMercSint
  Left = 335
  Top = 195
  Width = 268
  Height = 146
  Caption = 'Recebimento de Mercadoria Sintético'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Recebimento de Mercadoria Sintético'
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
        Required = True
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DataInicial'
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
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CodAlmoxarifado, DescAlmox '
          'FROM ALMOX '
          'WHERE IDPESSOA = 1'
          'ORDER BY 2')
        LookupSettings.Chave = 'CodAlmoxarifado'
        LookupSettings.Display = 'DescAlmox'
        LookupSettings.Descricao = 'Almoxarifado'
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
        Name = 'Almoxarifado'
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
        Caption = 'Ordem'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Fornecedor'
          'Nº da Nota'
          'Data Programada')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2')
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 50
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
        Name = 'Ordem'
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
    BeforeExecute = CmpRptCMBeforeExecute
    OnParamControlExit = CmpRptCMParamControlExit
    Formheight = 204
    FormWidth = 400
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptRecMercSint
    LabelEmpresa = LblEmpresa
    LabelSistema = LblSistema
    Left = 84
  end
  object bdeRecMercSint: TppBDEPipeline
    DataSource = dsRecMercSint
    UserName = 'bdeRecMercSint'
    Left = 84
    Top = 60
  end
  object RptRecMercSint: TppReport
    AutoStop = False
    DataPipeline = bdeRecMercSint
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 297 x 210 mm'
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
    Left = 24
    Top = 60
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand20: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object ppLabel107: TppLabel
        UserName = 'ppLabel107'
        Caption = 'Recebimento de Mercadoria Sintético'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 61119
        mmTop = 8731
        mmWidth = 75142
        BandType = 0
      end
      object ppLine40: TppLine
        UserName = 'ppLine40'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19844
        mmWidth = 197300
        BandType = 0
      end
      object LblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 82815
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object RptRecMercSintLine1: TppLine
        UserName = 'RptRecMercSintLine1'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26723
        mmWidth = 197300
        BandType = 0
      end
      object lbPer8: TppLabel
        UserName = 'lbPer8'
        Caption = 'De 01/01/1998 a 01/01/1999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsItalic]
        Transparent = True
        mmHeight = 3969
        mmLeft = 78052
        mmTop = 14552
        mmWidth = 41275
        BandType = 0
      end
      object RptRecMercSintLabel2: TppLabel
        UserName = 'RptRecMercSintLabel2'
        Caption = 'Tipo de Documento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 65352
        mmTop = 21960
        mmWidth = 28310
        BandType = 0
      end
      object RptRecMercSintLabel3: TppLabel
        UserName = 'RptRecMercSintLabel3'
        Caption = 'Nº da Nota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 103981
        mmTop = 21960
        mmWidth = 14288
        BandType = 0
      end
      object RptRecMercSintLabel4: TppLabel
        UserName = 'RptRecMercSintLabel4'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 144198
        mmTop = 21960
        mmWidth = 7144
        BandType = 0
      end
      object RptRecMercSintLabel6: TppLabel
        UserName = 'RptRecMercSintLabel6'
        Caption = 'Emissão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 171186
        mmTop = 21960
        mmWidth = 11642
        BandType = 0
      end
      object RptRecMercSintLabel8: TppLabel
        UserName = 'RptRecMercSintLabel8'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 190236
        mmTop = 21960
        mmWidth = 5821
        BandType = 0
      end
      object RptRecMercSintLabel9: TppLabel
        UserName = 'RptRecMercSintLabel9'
        Caption = 'Fornecedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 4498
        mmTop = 21960
        mmWidth = 16933
        BandType = 0
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Programada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 152665
        mmTop = 21960
        mmWidth = 17992
        BandType = 0
      end
    end
    object ppDetailBand16: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3704
      mmPrintPosition = 0
      object RptRecMercSintDBText1: TppDBText
        UserName = 'RptRecMercSintDBText1'
        DataField = 'RAZAOSOCIAL'
        DataPipeline = bdeRecMercSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 1323
        mmTop = 0
        mmWidth = 61913
        BandType = 4
      end
      object RptRecMercSintDBText2: TppDBText
        UserName = 'RptRecMercSintDBText2'
        DataField = 'NOTANUM'
        DataPipeline = bdeRecMercSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 103981
        mmTop = 0
        mmWidth = 25929
        BandType = 4
      end
      object RptRecMercSintDBText3: TppDBText
        UserName = 'RptRecMercSintDBText3'
        DataField = 'VLRNOTAFISCAL'
        DataPipeline = bdeRecMercSint
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 130969
        mmTop = 0
        mmWidth = 20902
        BandType = 4
      end
      object RptRecMercSintDBText5: TppDBText
        UserName = 'RptRecMercSintDBText5'
        DataField = 'DATAEMISNF'
        DataPipeline = bdeRecMercSint
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 171186
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
      object RptRecMercSintDBText7: TppDBText
        UserName = 'RptRecMercSintDBText7'
        DataField = 'FLGTIPONOTA'
        DataPipeline = bdeRecMercSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 189707
        mmTop = 0
        mmWidth = 6350
        BandType = 4
      end
      object RptRecMercSintDBText8: TppDBText
        UserName = 'RptRecMercSintDBText8'
        DataField = 'TIPODOC'
        DataPipeline = bdeRecMercSint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 65352
        mmTop = 0
        mmWidth = 37571
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DATAPROGRAMADA'
        DataPipeline = bdeRecMercSint
        DisplayFormat = 'dd/mm/yyyy'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 152665
        mmTop = 0
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand20: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object LblSistema: TppLabel
        UserName = 'LblSistema'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 0
        mmTop = 529
        mmWidth = 23019
        BandType = 8
      end
      object RptRecMercSintLine3: TppLine
        UserName = 'RptRecMercSintLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppCalc38: TppSystemVariable
        UserName = 'Calc38'
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
        mmTop = 529
        mmWidth = 37042
        BandType = 8
      end
      object ppCalc39: TppSystemVariable
        UserName = 'Calc39'
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
        mmTop = 529
        mmWidth = 26194
        BandType = 8
      end
    end
    object RptRecMercSintSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object RptRecMercSintLabel1: TppLabel
        UserName = 'RptRecMercSintLabel1'
        Caption = 'Total do Período : '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 92340
        mmTop = 1588
        mmWidth = 27781
        BandType = 7
      end
      object RptRecMercSintDBCalc2: TppDBCalc
        UserName = 'RptRecMercSintDBCalc2'
        DataField = 'VLRNOTAFISCAL'
        DataPipeline = bdeRecMercSint
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 121973
        mmTop = 1588
        mmWidth = 29898
        BandType = 7
      end
      object RptRecMercSintLine4: TppLine
        UserName = 'RptRecMercSintLine4'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 7
      end
    end
    object RptRecMercSintGroup1: TppGroup
      BreakName = 'DATAENTDEVOL'
      DataPipeline = bdeRecMercSint
      UserName = 'RptRecMercSintGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptRecMercSintGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object RptRecMercSintLine2: TppLine
          UserName = 'RptRecMercSintLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 6350
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object RptRecMercSintDBText4: TppDBText
          UserName = 'RptRecMercSintDBText4'
          AutoSize = True
          DataField = 'DATAENTDEVOL'
          DataPipeline = bdeRecMercSint
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 27252
          mmTop = 2117
          mmWidth = 23283
          BandType = 3
          GroupNo = 0
        end
        object RptRecMercSintLabel5: TppLabel
          UserName = 'RptRecMercSintLabel5'
          Caption = 'Data de Entrada :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 794
          mmTop = 2117
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
      end
      object RptRecMercSintGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object RptRecMercSintLabel7: TppLabel
          UserName = 'RptRecMercSintLabel7'
          AutoSize = False
          Caption = 'Total do dia '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 76994
          mmTop = 794
          mmWidth = 18256
          BandType = 5
          GroupNo = 0
        end
        object RptRecMercSintDBText6: TppDBText
          UserName = 'RptRecMercSintDBText6'
          AutoSize = True
          DataField = 'DATAENTDEVOL'
          DataPipeline = bdeRecMercSint
          DisplayFormat = 'dd/mm/yyyy'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold, fsItalic]
          Transparent = True
          mmHeight = 3440
          mmLeft = 96309
          mmTop = 794
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
        end
        object RptRecMercSintDBCalc1: TppDBCalc
          UserName = 'RptRecMercSintDBCalc1'
          DataField = 'VLRNOTAFISCAL'
          DataPipeline = bdeRecMercSint
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptRecMercSintGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 121973
          mmTop = 529
          mmWidth = 29898
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
  object dsRecMercSint: TwwDataSource
    DataSet = CdsRecMercSint
    Left = 144
    Top = 60
  end
  object SqlRecMercSint: TCMSqlParams
    SQL.Strings = (
      'SELECT NF.DATAENTDEVOL,'
      '       NF.DATAEMISNF,'
      '       P.RAZAOSOCIAL,'
      '       ( TO_CHAR( NF.NUMNF ) || '#39'/'#39' || NF.COMPLNF ) AS NOTANUM,'
      '       NF.VLRNOTAFISCAL,'
      '       NF.FLGTIPONOTA,'
      '       D.DATAPROGRAMADA,'
      '       TD.DESCRICAO AS TIPODOC'
      '  FROM PESSOA P,'
      '       NFRECEBDEVOL NF,'
      '       DOCUMENTO D,'
      '       TIPODOCRECPAG TD'
      ' WHERE ( NF.FLGTIPONOTA <> '#39'D'#39' )'
      
        '   AND ( NF.DATAENTDEVOL >= TO_DATE( '#39'01/01/2002'#39', '#39'dd/mm/yyyy'#39' ' +
        ') )'
      
        '   AND ( NF.DATAENTDEVOL <= TO_DATE( '#39'01/01/2002'#39', '#39'dd/mm/yyyy'#39' ' +
        ') )'
      '   AND ( NF.IDPESSOA = -1)'
      '   AND ( NF.IDFORCLI = P.IDPESSOA )'
      '   AND ( NF.CODDOCUMENTO = D.CODDOCUMENTO(+) )'
      '   AND ( D.CODTIPDOC     = TD.CODTIPDOC(+) )'
      'ORDER BY NF.DATAENTDEVOL, P.RAZAOSOCIAL, NF.NUMNF'
      '')
    ClientDataSet = CdsRecMercSint
    Left = 192
    Top = 8
  end
  object CdsRecMercSint: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 192
    Top = 60
  end
end
