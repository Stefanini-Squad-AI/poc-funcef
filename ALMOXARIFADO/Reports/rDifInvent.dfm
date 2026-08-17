inherited RptDifInvent: TRptDifInvent
  Left = 568
  Top = 68
  Width = 366
  Height = 140
  Caption = 'Diferença de Inventário'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Diferença de Inventário'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Almoxarifado'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT CodAlmoxarifado, DescAlmox'
          'FROM ALMOX '
          'WHERE IDPESSOA = 1'
          'order by 2')
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
        Required = True
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
        Caption = 'No. Inventário'
        Controle = tcMontaSelect
        CampoBanco = 'IDINVENTARIO'
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
        MostraComboCompara = False
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'NumInvent'
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
        MontaSelect = MsDifInvent
        Width = 0
      end
      item
        Caption = 'Data Inventário'
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
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'DataInvent'
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
        Caption = 'Ordenado por'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Código'
          'Alfabética'
          'Grupo de Produtos'
          'Localização')
        RadioGroupSettings.Values.Strings = (
          '0'
          '1'
          '2'
          '3')
        RadioGroupSettings.Columns = 2
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 60
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
        Name = 'Orderm'
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
    Formheight = 216
    FormWidth = 500
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    DataBaseName = 'BaseDados'
    Report = RptDifInvent
    LabelEmpresa = Lblempresa
    LabelSistema = LblSistema
    Left = 84
  end
  object bdeDifInvent: TppBDEPipeline
    DataSource = dsDifInvent
    UserName = 'bdeDifInvent'
    Left = 80
    Top = 60
    object bdeContInventppField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDINVENTARIO'
      FieldName = 'IDINVENTARIO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 0
      Position = 0
    end
    object bdeContInventppField2: TppField
      FieldAlias = 'DATAINVENTARIO'
      FieldName = 'DATAINVENTARIO'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 1
    end
    object bdeContInventppField3: TppField
      FieldAlias = 'CODGRUPOPROD'
      FieldName = 'CODGRUPOPROD'
      FieldLength = 10
      DisplayWidth = 10
      Position = 2
    end
    object bdeContInventppField4: TppField
      FieldAlias = 'DESCGRUPOPROD'
      FieldName = 'DESCGRUPOPROD'
      FieldLength = 30
      DisplayWidth = 30
      Position = 3
    end
    object bdeContInventppField5: TppField
      FieldAlias = 'CODARTIGO'
      FieldName = 'CODARTIGO'
      FieldLength = 14
      DisplayWidth = 14
      Position = 4
    end
    object bdeContInventppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'QTDECONTADA'
      FieldName = 'QTDECONTADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object bdeContInventppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'DIFERENCAATUAL'
      FieldName = 'DIFERENCAATUAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object bdeContInventppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOINICIAL'
      FieldName = 'SALDOINICIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object bdeContInventppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALINICIAL'
      FieldName = 'VALINICIAL'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object bdeContInventppField10: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALCONTADA'
      FieldName = 'VALCONTADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 9
    end
    object bdeContInventppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALDIFERENCA'
      FieldName = 'VALDIFERENCA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object bdeContInventppField12: TppField
      FieldAlias = 'LOCALIZACAO'
      FieldName = 'LOCALIZACAO'
      FieldLength = 40
      DisplayWidth = 40
      Position = 11
    end
    object bdeContInventppField13: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 12
    end
  end
  object dsDifInvent: TwwDataSource
    DataSet = CdsDifInvent
    Left = 140
    Top = 60
  end
  object RptDifInvent: TppReport
    AutoStop = False
    DataPipeline = bdeDifInvent
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
    Left = 24
    Top = 60
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 24077
      mmPrintPosition = 0
      object ppLabel15: TppLabel
        UserName = 'ppLabel15'
        Caption = 'Diferenças no Inventário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 112184
        mmTop = 8731
        mmWidth = 60061
        BandType = 0
      end
      object ppLine8: TppLine
        UserName = 'ppLine8'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 23019
        mmWidth = 284300
        BandType = 0
      end
      object Lblempresa: TppLabel
        UserName = 'Lblempresa'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127794
        mmTop = 1588
        mmWidth = 28046
        BandType = 0
      end
      object lblAlmoxInvent: TppLabel
        UserName = 'lblAlmoxInvent'
        Caption = 'LbALmox'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 3969
        mmTop = 17198
        mmWidth = 16140
        BandType = 0
      end
    end
    object ppDetailBand6: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'ppDBText1'
        DataField = 'CODARTIGO'
        DataPipeline = bdeDifInvent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 2910
        mmTop = 265
        mmWidth = 22225
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'ppDBText2'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = bdeDifInvent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 28046
        mmTop = 265
        mmWidth = 16669
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        AutoSize = True
        DataField = 'LOCALIZACAO'
        DataPipeline = bdeDifInvent
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 91017
        mmTop = 265
        mmWidth = 19579
        BandType = 4
      end
      object RptContInventDBText1: TppDBText
        UserName = 'RptContInventDBText1'
        DataField = 'QTDECONTADA'
        DataPipeline = bdeDifInvent
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object RptContInventDBText2: TppDBText
        UserName = 'RptContInventDBText2'
        DataField = 'DIFERENCAATUAL'
        DataPipeline = bdeDifInvent
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 184680
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object RptContInventDBText3: TppDBText
        UserName = 'RptContInventDBText3'
        DataField = 'SALDOINICIAL'
        DataPipeline = bdeDifInvent
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 136790
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object RptContInventDBText4: TppDBText
        UserName = 'RptContInventDBText4'
        DataField = 'VALINICIAL'
        DataPipeline = bdeDifInvent
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 210080
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object RptContInventDBText5: TppDBText
        UserName = 'RptContInventDBText5'
        DataField = 'VALCONTADA'
        DataPipeline = bdeDifInvent
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 231775
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
      object RptContInventDBText6: TppDBText
        UserName = 'RptContInventDBText6'
        DataField = 'VALDIFERENCA'
        DataPipeline = bdeDifInvent
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 249767
        mmTop = 265
        mmWidth = 15875
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine10: TppLine
        UserName = 'ppLine10'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
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
        mmLeft = 2646
        mmTop = 794
        mmWidth = 23019
        BandType = 8
      end
      object ppCalc10: TppSystemVariable
        UserName = 'ppCalc101'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 132292
        mmTop = 794
        mmWidth = 19579
        BandType = 8
      end
      object ppCalc11: TppSystemVariable
        UserName = 'Calc11'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 236009
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDINVENTARIO'
      DataPipeline = bdeDifInvent
      NewPage = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 16140
        mmPrintPosition = 0
        object ppLine11: TppLine
          UserName = 'ppLine11'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 8467
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'ppDBText4'
          AutoSize = True
          DataField = 'IDINVENTARIO'
          DataPipeline = bdeDifInvent
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 28575
          mmTop = 1852
          mmWidth = 25400
          BandType = 3
          GroupNo = 0
        end
        object ppDBText5: TppDBText
          UserName = 'ppDBText5'
          AutoSize = True
          DataField = 'DATAINVENTARIO'
          DataPipeline = bdeDifInvent
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 88900
          mmTop = 1852
          mmWidth = 31221
          BandType = 3
          GroupNo = 0
        end
        object ppLabel19: TppLabel
          UserName = 'ppLabel19'
          Caption = 'Inventário Nº :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 3440
          mmTop = 1852
          mmWidth = 23813
          BandType = 3
          GroupNo = 0
        end
        object ppLabel20: TppLabel
          UserName = 'ppLabel20'
          Caption = 'Data :'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 78317
          mmTop = 1852
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
        end
        object ppLabel21: TppLabel
          UserName = 'ppLabel21'
          Caption = 'Código'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 2381
          mmTop = 10319
          mmWidth = 10319
          BandType = 3
          GroupNo = 0
        end
        object ppLabel22: TppLabel
          UserName = 'ppLabel22'
          Caption = 'Descrição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 27781
          mmTop = 10319
          mmWidth = 14288
          BandType = 3
          GroupNo = 0
        end
        object ppLabel23: TppLabel
          UserName = 'ppLabel23'
          Caption = 'Quantidade Contada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 153988
          mmTop = 9790
          mmWidth = 29104
          BandType = 3
          GroupNo = 0
        end
        object ppLine12: TppLine
          UserName = 'ppLine12'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 15611
          mmWidth = 284300
          BandType = 3
          GroupNo = 0
        end
        object ppLabel24: TppLabel
          UserName = 'ppLabel24'
          Caption = 'Localização'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 91281
          mmTop = 10054
          mmWidth = 16669
          BandType = 3
          GroupNo = 0
        end
        object RptContInventLabel1: TppLabel
          UserName = 'RptContInventLabel1'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 186796
          mmTop = 9790
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object RptContInventLabel2: TppLabel
          UserName = 'RptContInventLabel2'
          Caption = 'Saldo em Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 126471
          mmTop = 9790
          mmWidth = 26194
          BandType = 3
          GroupNo = 0
        end
        object RptContInventLabel3: TppLabel
          UserName = 'RptContInventLabel3'
          Caption = 'Valor Estoque'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 205582
          mmTop = 9790
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object RptContInventLabel4: TppLabel
          UserName = 'RptContInventLabel4'
          Caption = 'Valor Contada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 227278
          mmTop = 9790
          mmWidth = 20373
          BandType = 3
          GroupNo = 0
        end
        object RptContInventLabel5: TppLabel
          UserName = 'RptContInventLabel5'
          Caption = 'Diferença'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 251884
          mmTop = 9790
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 5027
        mmPrintPosition = 0
        object RptContInventLine1: TppLine
          UserName = 'RptContInventLine1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 265
          mmWidth = 284300
          BandType = 5
          GroupNo = 0
        end
        object RptContInventLabel6: TppLabel
          UserName = 'RptContInventLabel6'
          Caption = 'Total Geral'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 177800
          mmTop = 1323
          mmWidth = 15610
          BandType = 5
          GroupNo = 0
        end
        object RptContInventDBCalc4: TppDBCalc
          UserName = 'RptContInventDBCalc4'
          AutoSize = True
          DataField = 'VALINICIAL'
          DataPipeline = bdeDifInvent
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 200025
          mmTop = 1323
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
        end
        object RptContInventDBCalc2: TppDBCalc
          UserName = 'RptContInventDBCalc2'
          AutoSize = True
          DataField = 'VALCONTADA'
          DataPipeline = bdeDifInvent
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 218017
          mmTop = 1058
          mmWidth = 29633
          BandType = 5
          GroupNo = 0
        end
        object RptContInventDBCalc5: TppDBCalc
          UserName = 'RptContInventDBCalc5'
          AutoSize = True
          DataField = 'VALDIFERENCA'
          DataPipeline = bdeDifInvent
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 233628
          mmTop = 1323
          mmWidth = 32015
          BandType = 5
          GroupNo = 0
        end
      end
    end
    object RptContInventGroup1: TppGroup
      BreakName = 'CODGRUPOPROD'
      DataPipeline = bdeDifInvent
      UserName = 'RptContInventGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object RptContInventGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object RptContInventLine2: TppLine
          UserName = 'RptContInventLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 5821
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
        end
        object RptContInventDBText7: TppDBText
          UserName = 'RptContInventDBText7'
          DataField = 'CODGRUPOPROD'
          DataPipeline = bdeDifInvent
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 529
          mmTop = 1323
          mmWidth = 15875
          BandType = 3
          GroupNo = 1
        end
        object RptContInventDBText8: TppDBText
          UserName = 'RptContInventDBText8'
          DataField = 'DESCGRUPOPROD'
          DataPipeline = bdeDifInvent
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3969
          mmLeft = 17992
          mmTop = 1323
          mmWidth = 47625
          BandType = 3
          GroupNo = 1
        end
      end
      object RptContInventGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 3969
        mmPrintPosition = 0
        object RptContInventLabel7: TppLabel
          UserName = 'RptContInventLabel7'
          Caption = 'Total'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 186002
          mmTop = 265
          mmWidth = 7144
          BandType = 5
          GroupNo = 1
        end
        object RptContInventDBCalc10: TppDBCalc
          UserName = 'RptContInventDBCalc10'
          AutoSize = True
          DataField = 'VALINICIAL'
          DataPipeline = bdeDifInvent
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptContInventGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 200025
          mmTop = 0
          mmWidth = 25929
          BandType = 5
          GroupNo = 1
        end
        object RptContInventDBCalc1: TppDBCalc
          UserName = 'RptContInventDBCalc1'
          AutoSize = True
          DataField = 'VALCONTADA'
          DataPipeline = bdeDifInvent
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptContInventGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 218017
          mmTop = 0
          mmWidth = 29633
          BandType = 5
          GroupNo = 1
        end
        object RptContInventDBCalc3: TppDBCalc
          UserName = 'RptContInventDBCalc3'
          AutoSize = True
          DataField = 'VALDIFERENCA'
          DataPipeline = bdeDifInvent
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = RptContInventGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3175
          mmLeft = 233628
          mmTop = 265
          mmWidth = 32015
          BandType = 5
          GroupNo = 1
        end
      end
    end
  end
  object SqlDifInvent: TCMSqlParams
    ClientDataSet = CdsDifInvent
    Left = 200
    Top = 8
  end
  object CdsDifInvent: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 60
  end
  object SqlAux: TCMSqlParams
    SQL.Strings = (
      'SELECT CODCUSTEIO '
      'FROM  ALMOX'
      'WHERE CODALMOXARIFADO = :almox')
    ClientDataSet = CdsAux
    Left = 256
    Top = 8
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 60
  end
  object MsDifInvent: TMontaSelect
    Tag = 4
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'INVENTAR.IDINVENTARIO'
      'INVENTAR.DATAINVENTARIO'
      'INVENTAR.ABERTOFECHADO')
    TipodeDado.Strings = (
      'N'
      'D'
      'C')
    Descricao.Strings = (
      'Código'
      'Data'
      'Aberto/Fechado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INVENTAR')
    CamposChave.Strings = (
      'INVENTAR.IDINVENTARIO'
      'INVENTAR.IDINVENTARIO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '18'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 312
    Top = 60
  end
end
